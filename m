Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 27 Oct 2016 08:48:33 -0500
From: Rob Herring <robh@kernel.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, bin.chen@linaro.org, elder@linaro.org,
	hermit.wangheming@hisilicon.com, yanhaifeng@hisilicon.com,
	wenpan@hisilicon.com
Subject: Re: [RESEND PATCH v2] clk: hisilicon: add CRG driver for Hi3798CV200
 SoC
Message-ID: <20161027134833.vdtd5t5hx33o3ahb@rob-hp-laptop>
References: <1477013830-11481-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477013830-11481-1-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Oct 21, 2016 at 09:37:10AM +0800, Jiancheng Xue wrote:
> Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
> Generator) module generates clock and reset signals used
> by other module blocks on SoC.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> ---
> change log
> v2:
> - Fixed compiling error when compiled as a module.
> - Fixed issues pointed by Stephen Boyd.
> - Added prefix HISTB for clock index macro definitions.

What Stephen asked for is send this and the Hi3516CV300 series as one 
series since there is a dependency.

> 
>  .../clock/{hi3519-crg.txt => hisi-crg.txt}         |  11 +-

In any case, for the binding:

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/hisilicon/Kconfig                      |   8 +
>  drivers/clk/hisilicon/Makefile                     |   1 +
>  drivers/clk/hisilicon/crg-hi3798cv200.c            | 305 +++++++++++++++++++++
>  drivers/clk/hisilicon/crg.h                        |  34 +++
>  include/dt-bindings/clock/histb-clock.h            |  64 +++++
>  6 files changed, 419 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{hi3519-crg.txt => hisi-crg.txt} (82%)
>  create mode 100644 drivers/clk/hisilicon/crg-hi3798cv200.c
>  create mode 100644 drivers/clk/hisilicon/crg.h
>  create mode 100644 include/dt-bindings/clock/histb-clock.h
