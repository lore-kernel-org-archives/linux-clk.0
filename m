Return-Path: <dmitry.torokhov@gmail.com>
Return-Path: <dmitry.torokhov@gmail.com>
Date: Tue, 17 Nov 2015 09:32:26 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
	Joachim Eastwood <manabian@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	linux-fbdev@vger.kernel.org,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Julia Lawall <Julia.Lawall@lip6.fr>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/24] misc: max77693-haptic: use pwm_get_xxx()
 helpers where appropriate
Message-ID: <20151117173226.GA29423@dtor-ws>
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
 <1447664207-24370-6-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447664207-24370-6-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 16, 2015 at 09:56:28AM +0100, Boris Brezillon wrote:
> Use pwm_get_xxx() helpers instead of directly accessing the pwm->xxx field.
> Doing that will ease adaptation of the PWM framework to support atomic
> update.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Could you please tag input-related bits with "Input: driver - ... "
instead of "misc: ... "?

Thanks!

-- 
Dmitry
