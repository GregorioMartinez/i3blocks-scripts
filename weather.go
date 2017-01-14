// http://erikflowers.github.io/weather-icons/

package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"time"
)

type Forecast struct {
	Currently struct {
		Icon              string  `json:"icon"`
		PrecipProbability float64 `json:"precipProbability"`
		Temperature       float64 `json:"temperature"`
	} `json:"currently"`
}

func main() {

	// Set in .pam_environment
	apikey := os.Getenv("WEATHER_API_KEY")
	lat, long := os.Getenv("WEATHER_LAT"), os.Getenv("WEATHER_LONG")

	switch {
	case apikey == "":
		log.Fatal("Missing API Key")
	case lat == "":
		log.Fatal("Missing Latitude")
	case long == "":
		log.Fatal("Missing Longitude")
	}

	time := time.Now().Unix()
	base := "https://api.forecast.io/forecast"
	exclude := "exclude=minutely,hourly,daily,alerts,flags"
	request := fmt.Sprintf("%s/%s/%s,%s,%v?%s", base, apikey, lat, long, time, exclude)

	res, err := http.Get(request)
	defer res.Body.Close()
	if err != nil {
		panic(err)
	}

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		panic(err)
	}

	var forecast Forecast
	err = json.Unmarshal(body, &forecast)
	if err != nil {
		panic(err)
	}

	var icon string
	switch {
	case forecast.Currently.Icon == "clear-day":
		icon = "f00d"
		break
	case forecast.Currently.Icon == "clear-night":
		icon = "f02e"
		break
	case forecast.Currently.Icon == "rain":
		icon = "f008"
		break
	case forecast.Currently.Icon == "snow":
		icon = "f00a"
		break
	case forecast.Currently.Icon == "sleet":
		icon = "f0b2"
		break
	case forecast.Currently.Icon == "wind":
		icon = "f085"
		break
	case forecast.Currently.Icon == "fog":
		icon = "f003"
		break
	case forecast.Currently.Icon == "cloudy":
		icon = "f013"
		break
	case forecast.Currently.Icon == "partly-cloudy-day":
		icon = "f002"
		break
	case forecast.Currently.Icon == "partly-cloudy-night":
		icon = "f086"
		break
	default:
		icon = "f075"
		break
	}

	fmt.Printf("<span font_desc='Weather icons'> &#xf055;</span> %v <span font_desc='Weather Icons'>&#xf07a; %v%%</span> <span font_desc='Weather Icons'>&#x%v;</span>", forecast.Currently.Temperature, forecast.Currently.PrecipProbability*100, icon)

}
