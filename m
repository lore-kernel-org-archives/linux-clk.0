Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 16/24] ARM: explicitly apply PWM config extracted from
 pwm_args
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org
References: 
 <1460661464-11216-1-git-send-email-boris.brezillon@free-electrons.com>
 <1460661464-11216-17-git-send-email-boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Joachim Eastwood <manabian@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-fbdev@vger.kernel.org,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 Milo Kim <milo.kim@ti.com>, Doug Anderson <dianders@google.com>,
 Caesar Wang <wxt@rock-chips.com>, Stephen Barber <smbarber@chromium.org>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <5710A38D.3050202@samsung.com>
Date: Fri, 15 Apr 2016 10:17:17 +0200
MIME-version: 1.0
In-reply-to: 
 <1460661464-11216-17-git-send-email-boris.brezillon@free-electrons.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 04/14/2016 09:17 PM, Boris Brezillon wrote:
> Call pwm_apply_args() just after requesting the PWM device so that the
> polarity and period are initialized according to the information provided
> in pwm_args.
> 
> This is an intermediate state, and pwm_apply_args() should be dropped as
> soon as the atomic PWM infrastructure is in place and the driver makes
> use of it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  arch/arm/mach-s3c24xx/mach-rx1950.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
