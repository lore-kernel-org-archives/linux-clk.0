Return-Path: <linux@roeck-us.net>
Subject: Re: [PATCH v4 04/24] hwmon: pwm-fan: use pwm_get_xxx() helpers where
 appropriate
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
 <1447664207-24370-5-git-send-email-boris.brezillon@free-electrons.com>
 <5649FD5B.3000208@roeck-us.net> <20151116175322.48dba6f9@bbrezillon>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
 Jean Delvare <jdelvare@suse.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
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
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <564A0B95.6010603@roeck-us.net>
Date: Mon, 16 Nov 2015 09:00:05 -0800
MIME-Version: 1.0
In-Reply-To: <20151116175322.48dba6f9@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 11/16/2015 08:53 AM, Boris Brezillon wrote:
> On Mon, 16 Nov 2015 07:59:23 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
>
>> On 11/16/2015 12:56 AM, Boris Brezillon wrote:
>>> Use pwm_get_xxx() helpers instead of directly accessing the pwm->xxx field.
>>> Doing that will ease adaptation of the PWM framework to support atomic
>>> update.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>> ---
>>> Patch generated with the following coccinelle script:
>>>
>>> --->8---
>>> virtual patch
>>>
>>> @@
>>> struct pwm_device *p;
>>> expression e;
>>> @@
>>> (
>>> -(p)->polarity = e;
>>> +pwm_set_polarity((p), e);
>>> |
>>> -(p)->polarity
>>> +pwm_get_polarity((p))
>>
>> s/((p))/(p)/
>>
>>> |
>>> -(p)->period = e;
>>> +pwm_set_period((p), e);
>>> |
>>> -(p)->period
>>> +pwm_get_period((p))
>>
>> s/((p))/(p)/
>>
>>> |
>>> -(p)->duty_cycle = e;
>>> +pwm_set_duty_cycle((p), e);
>>
>> The (p) seems unnecessary here.
>
> I don't get this one. You mean I should drop one the parenthesis around
> p, right?
>

Same as above - s/(p)/p/. It should never be necessary to write
	pwm_set_duty_cycle((p), e)
since
	pwm_set_duty_cycle(p, e)
should be the same.

On the other side, I did not see this expression used in any of the patches,
though maybe I missed it.

Thanks,
Guenter
