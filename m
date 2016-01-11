Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Mon, 11 Jan 2016 10:25:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, sboyd@codeaurora.org,
	myungjoo.ham@samsung.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.wolfsonmicro.com
Subject: Re: [PATCH v3 3/4] mfd: arizona: Switch to using clock driver for
 32k clock
Message-ID: <20160111102545.GX14104@x1>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1452252582-20834-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, 08 Jan 2016, Charles Keepax wrote:

> Now we have a clock driver that can control the 32k clock use this
> rather than directly controlling the 32k clock from the MFD device.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
> 
> No changes since v2.
> 
> Thanks,
> Charles
> 
>  drivers/mfd/arizona-core.c       | 104 +++++++++------------------------------
>  include/linux/mfd/arizona/core.h |   7 +--
>  2 files changed, 25 insertions(+), 86 deletions(-)

I guess this needs to go in with the Clk changes, which are yet to be
reviewed, right?

For my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
