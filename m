Return-Path: <k.debski@samsung.com>
From: Kamil Debski <k.debski@samsung.com>
To: 'Boris Brezillon' <boris.brezillon@free-electrons.com>,
 'Thierry Reding' <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org
Cc: 'Mike Turquette' <mturquette@baylibre.com>,
 'Stephen Boyd' <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 'Mark Brown' <broonie@kernel.org>, 'Liam Girdwood' <lgirdwood@gmail.com>,
 lm-sensors@lm-sensors.org, 'Jean Delvare' <jdelvare@suse.com>,
 'Guenter Roeck' <linux@roeck-us.net>,
 'Dmitry Torokhov' <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 'Bryan Wu' <cooloney@gmail.com>, 'Richard Purdie' <rpurdie@rpsys.net>,
 'Jacek Anaszewski' <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org,
 'Maxime Ripard' <maxime.ripard@free-electrons.com>,
 'Chen-Yu Tsai' <wens@csie.org>, linux-sunxi@googlegroups.com,
 'Joachim Eastwood' <manabian@gmail.com>,
 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>,
 'Heiko Stuebner' <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 'Jingoo Han' <jingoohan1@gmail.com>, 'Lee Jones' <lee.jones@linaro.org>,
 linux-fbdev@vger.kernel.org,
 'Jean-Christophe Plagniol-Villard' <plagnioj@jcrosoft.com>,
 'Tomi Valkeinen' <tomi.valkeinen@ti.com>,
 'Robert Jarzmik' <robert.jarzmik@free.fr>,
 'Alexandre Belloni' <alexandre.belloni@free-electrons.com>,
 'Kukjin Kim' <kgene@kernel.org>,
 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 'Daniel Vetter' <daniel.vetter@intel.com>,
 'Jani Nikula' <jani.nikula@linux.intel.com>,
 'Jonathan Corbet' <corbet@lwn.net>, linux-doc@vger.kernel.org,
 'David Airlie' <airlied@linux.ie>, 'Daniel Vetter' <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 'Hartley Sweeten' <hsweeten@visionengravers.com>,
 'Ryan Mallon' <rmallon@gmail.com>, 'Alexander Shiyan' <shc_work@mail.ru>,
 'Milo Kim' <milo.kim@ti.com>
References: 
 <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-36-git-send-email-boris.brezillon@free-electrons.com>
In-reply-to: 
 <1459368249-13241-36-git-send-email-boris.brezillon@free-electrons.com>
Subject: RE: [PATCH v5 35/46] hwmon: pwm-fan: switch to the atomic API
Date: Fri, 01 Apr 2016 10:29:55 +0200
Message-id: <00e601d18bf0$acd69150$0683b3f0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Boris,

From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
Sent: Wednesday, March 30, 2016 10:04 PM
Subject: [PATCH v5 35/46] hwmon: pwm-fan: switch to the atomic API
> 
> pwm_config/enable/disable() have been deprecated and should be replaced
> by pwm_apply_state().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Kamil Debski <k.debski@samsung.com>

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland
