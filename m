Return-Path: <alexandre.belloni@free-electrons.com>
Date: Sat, 5 Nov 2016 00:12:22 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com
Subject: Re: [PATCH 3/4] rtc: Enable compile testing for Maxim and Samsung
 drivers
Message-ID: <20161104231222.o4iyqwed2pycvxar@piout.net>
References: <1475441897-15730-1-git-send-email-krzk@kernel.org>
 <1475441897-15730-4-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475441897-15730-4-git-send-email-krzk@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 02/10/2016 at 22:58:16 +0200, Krzysztof Kozlowski wrote :
> max8907, max77686 and s5m RTC drivers can be compile tested to increase
> build coverage.  The s5m-rtc uses REGMAP_IRQ so add this as explicit
> dependency.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/rtc/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
