Return-Path: <rnayak@codeaurora.org>
Message-ID: <569C69A8.4080308@codeaurora.org>
Date: Mon, 18 Jan 2016 09:57:20 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: sboyd@codeaurora.org, mturquette@baylibre.com
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Add support for MSM8996 GDSCs
References: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>


On 12/01/2015 09:42 PM, Rajendra Nayak wrote:
> Changes since v1:
> * For votable gdscs which are 'on' at boot, put an explicit vote
> * Added a delay post disable for votable gdscs
> * Added back the status check after timeout
> * rearranged some patch ordering to avoid bisect issues

Stephen, Did you get a chance to look at this series?

> 
> This series adds support for GDSCs' which are part of gcc and mmcc
> in QCOM msm8996 SoC. Series applies on top of clk-next
> 
> There are many more cases of gdscs within gdscs (hierarchical power
> domains) in msm8996 (msm8974 has one such instance which is supported
> upstream) and hence the series adds support within gdsc driver to
> handle this.
> 
> Also msm8996 has gdscs with gds hw controllers within, for ensuring
> slave device idleness before gdscs are powered off, hence the series
> also adds support for gdscs with gds hw controllers.
> 
> ToDo: Series does not yet add support for gpu gdscs which are part
> of mmcc
> 
> Tested on apq8096 dragonboards to make sure all modelled gdscs can
> be turned on/off successfully
> 
> Rajendra Nayak (6):
>   clk: qcom: gdsc: Add support for hierarchical power domains
>   clk: qcom: gdsc: Add support for gdscs with gds hw controller
>   clk: qcom: gdsc: Add support for votable gdscs
>   clk: qcom: gdsc: Add GDSCs in msm8996 GCC
>   clk: qcom: gdsc: Add mmcc gdscs for msm8996 family
>   clk: qcom: mmcc8974: Use gdscs .parent and remove genpd calls
> 
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +
>  drivers/clk/qcom/common.c                     |  14 ++-
>  drivers/clk/qcom/gcc-msm8996.c                |  92 +++++++++++++++
>  drivers/clk/qcom/gdsc.c                       |  89 +++++++++++----
>  drivers/clk/qcom/gdsc.h                       |  34 ++++--
>  drivers/clk/qcom/mmcc-msm8974.c               |  14 +--
>  drivers/clk/qcom/mmcc-msm8996.c               | 157 ++++++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8996.h  |  11 ++
>  include/dt-bindings/clock/qcom,mmcc-msm8996.h |  17 +++
>  9 files changed, 382 insertions(+), 48 deletions(-)
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
