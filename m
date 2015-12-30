Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Thierry Reding" <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1447664207-24370-4-git-send-email-boris.brezillon@free-electrons.com>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 "Mark Brown" <broonie@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Kamil Debski" <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
 "Jean Delvare" <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 "Bryan Wu" <cooloney@gmail.com>, "Richard Purdie" <rpurdie@rpsys.net>,
 "Jacek Anaszewski" <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>,
 "Chen-Yu Tsai" <wens@csie.org>, linux-sunxi@googlegroups.com,
 "Joachim Eastwood" <manabian@gmail.com>,
 "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>,
 "Heiko Stuebner" <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 "Jingoo Han" <jingoohan1@gmail.com>, "Lee Jones" <lee.jones@linaro.org>,
 linux-fbdev@vger.kernel.org,
 "Jean-Christophe Plagniol-Villard" <plagnioj@jcrosoft.com>,
 "Tomi Valkeinen" <tomi.valkeinen@ti.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Alexandre Belloni" <alexandre.belloni@free-electrons.com>,
 "Julia Lawall" <Julia.Lawall@lip6.fr>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
 <1447664207-24370-4-git-send-email-boris.brezillon@free-electrons.com>
Message-ID: <20151230210358.19557.32933@quark.deferred.io>
Subject: Re: [PATCH v4 03/24] clk: pwm: use pwm_get_xxx() helpers where appropriate
Date: Wed, 30 Dec 2015 13:03:58 -0800
List-ID: <linux-clk.vger.kernel.org>

Hi Boris,

Quoting Boris Brezillon (2015-11-16 00:56:26)
> diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
> index 328fcfc..b6306a2 100644
> --- a/drivers/clk/clk-pwm.c
> +++ b/drivers/clk/clk-pwm.c
> @@ -71,22 +71,23 @@ static int clk_pwm_probe(struct platform_device *pdev)
>         if (IS_ERR(pwm))
>                 return PTR_ERR(pwm);
>  =

> -       if (!pwm->period) {
> +       if (!pwm_get_period((pwm))) {

The change itself looks fine, but the semantic patch added extra parens.
Can you remove them? After doing so feel free to add:

Acked-by: Michael Turquette <mturquette@baylibre.com>
