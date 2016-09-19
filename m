Return-Path: <daniel.lezcano@linaro.org>
Return-Path: <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 3/4] watchdog: sa11x0/pxa: get rid of get_clock_tick_rate
To: Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@iguana.be>
References: <1474312335-20997-1-git-send-email-robert.jarzmik@free.fr>
 <1474312335-20997-4-git-send-email-robert.jarzmik@free.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c29cd7d6-bc45-1207-0133-271a35ad2c4d@linaro.org>
Date: Mon, 19 Sep 2016 21:55:26 +0200
MIME-Version: 1.0
In-Reply-To: <1474312335-20997-4-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 19/09/2016 21:12, Robert Jarzmik wrote:
> The OS timer rate used for the watchdog can now be fetched from the
> standard clock API. This will remove the last user of
> get_clock_tick_rate() in both pxa and sa11x0 architectures.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
