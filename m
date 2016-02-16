Return-Path: <alexandre.belloni@free-electrons.com>
Date: Tue, 16 Feb 2016 01:42:21 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: rtc-linux@googlegroups.com, linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] rtc: rtc-ds1307: add clock provider support for DS3231
Message-ID: <20160216004221.GA3310@piout.net>
References: <1454249410-21449-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1454249410-21449-1-git-send-email-akinobu.mita@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 31/01/2016 at 23:10:10 +0900, Akinobu Mita wrote :
> DS3231 has programmable square-wave output signal.
> This enables to use this feature as a clock provider of
> common clock framework.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../devicetree/bindings/rtc/maxim,ds3231.txt       |  37 +++
>  drivers/rtc/rtc-ds1307.c                           | 296 ++++++++++++++++++++-
>  2 files changed, 332 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds3231.txt
> 

Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
