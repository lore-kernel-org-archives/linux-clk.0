Return-Path: <rnayak@codeaurora.org>
Message-ID: <564C1596.9080406@codeaurora.org>
Date: Wed, 18 Nov 2015 11:37:18 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
 Mike Turquette <mturquette@baylibre.com>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.com>
Subject: Re: [PATCH 0/5] Add support for MSM8996 clock controllers
References: <1447808844-27049-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1447808844-27049-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>


On 11/18/2015 06:37 AM, Stephen Boyd wrote:
> These patches add support for the global and multimedia clock controllers
> found on MSM8996 devices. The first patch allows us to implement a
> "power of two" divider of different widths with a table based divider.
> The second patch adds support for Alpha PLLs and the 3rd and 5th patches
> add support for the two clock controllers. The fourth patch is
> a new type of clock ops for the graphics clock that does some custom
> ping-pong between different PLLs when switching graphics frequencies.
> 
> Some work is still pending, mostly adding GDSCs and configuring the

I have the GDSC support patches done on top. Will post once I 
get some reasonable testing done.

> multimedia PLLs for FSM voting mode vs. manually enabling and
> disabling them. So a v2 is probably going to come out after
> some more testing is done.
> 
> Cc: Rajendra Nayak <rnayak@codeaurora.com>
> 
> Stephen Boyd (5):
>   clk: divider: Cap table divider values to 'width' member
>   clk: qcom: Add Alpha PLL support
>   clk: qcom: Add MSM8996 Global Clock Control (GCC) driver
>   clk: qcom: Add gfx3d ping-pong PLL frequency switching
>   clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver
> 
>  .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
>  .../devicetree/bindings/clock/qcom,mmcc.txt        |    1 +
>  drivers/clk/clk-divider.c                          |    9 +-
>  drivers/clk/qcom/Kconfig                           |   17 +
>  drivers/clk/qcom/Makefile                          |    3 +
>  drivers/clk/qcom/clk-alpha-pll.c                   |  355 +++
>  drivers/clk/qcom/clk-alpha-pll.h                   |   57 +
>  drivers/clk/qcom/clk-rcg.h                         |    1 +
>  drivers/clk/qcom/clk-rcg2.c                        |   87 +
>  drivers/clk/qcom/gcc-msm8996.c                     | 3332 ++++++++++++++++++++
>  drivers/clk/qcom/mmcc-msm8996.c                    | 3209 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8996.h       |  333 ++
>  include/dt-bindings/clock/qcom,mmcc-msm8996.h      |  285 ++
>  13 files changed, 7686 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/clk/qcom/clk-alpha-pll.c
>  create mode 100644 drivers/clk/qcom/clk-alpha-pll.h
>  create mode 100644 drivers/clk/qcom/gcc-msm8996.c
>  create mode 100644 drivers/clk/qcom/mmcc-msm8996.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8996.h
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8996.h
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
