Return-Path: <stefan.wahren@i2se.com>
Date: Tue, 30 May 2017 20:41:05 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Phil Elwell <phil@raspberrypi.org>, linux-clk@vger.kernel.org,
	Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org
Message-ID: <684006892.45085.1496169665454@email.1und1.de>
In-Reply-To: <866b60bb-d1c8-726e-3a2d-11a34f9e8ac7@raspberrypi.org>
References: <866b60bb-d1c8-726e-3a2d-11a34f9e8ac7@raspberrypi.org>
Subject: Re: [PATCH 1/2] clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Phil,

> Phil Elwell <phil@raspberrypi.org> hat am 30. Mai 2017 um 18:28 geschrieben:
> 
> 
> Restrict clock sources for the PCM peripheral to the oscillator and
> PLLD_PER because other source may have varying rates or be switched off.

> Prevent other sources from being selected by replacing their names in
> the list of potential parents with dummy entries (entry index is
> significant).

i like to have this as a comment above the definition of bcm2835_pcm_per_parents.

> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 0258538..facc346 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1511,6 +1511,16 @@ struct bcm2835_clk_desc {
>  	"pllh_aux",
>  };
>
> +static const char *const bcm2835_pcm_per_parents[] = {

As mentioned above, there should be a comment like all the others. 

> +	"-",
> +	"xosc",
> +	"-",
> +	"-",
> +	"-",
> +	"-",
> +	"plld_per",
> +};

Is there a dummy entry for "pllh_aux" missing?

> +
>  #define REGISTER_PER_CLK(...)	REGISTER_CLK(				\
>  	.num_mux_parents = ARRAY_SIZE(bcm2835_clock_per_parents),	\
>  	.parents = bcm2835_clock_per_parents,				\
> @@ -2000,6 +2010,7 @@ struct bcm2835_clk_desc {
>  		.int_bits = 12,
>  		.frac_bits = 12,
>  		.is_mash_clock = true,
> +		.parents = bcm2835_pcm_per_parents,

This looks a little bit hacky to me. Not sure, but can we do something like this?

#define REGISTER_PCM_CLK(...)	REGISTER_CLK(				\
	.num_mux_parents = ARRAY_SIZE(bcm2835_pcm_per_parents),	\
	.parents = bcm2835_pcm_per_parents,				\
	__VA_ARGS__)

Regards
Stefan

>  		.tcnt_mux = 23),
>  	[BCM2835_CLOCK_PWM]	= REGISTER_PER_CLK(
>  		.name = "pwm",
> -- 
> 1.9.1
>
