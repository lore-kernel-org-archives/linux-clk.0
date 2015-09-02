Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Message-ID: <55E729B5.3020908@linaro.org>
Date: Wed, 02 Sep 2015 19:54:13 +0300
From: Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
To: sboyd@codeaurora.org
CC: Georgi Djakov <georgi.djakov@linaro.org>, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add initial support for RPM clocks
References: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/03/2015 07:48 PM, Georgi Djakov wrote:
> This patchset adds initial support for the clocks controlled by
> the RPM (Resource Power Manager) processor on Qualcomm platforms.
> It depends on Bjorn's Qualcomm SMD & RPM patches, that are now in
> linux-next: https://lkml.org/lkml/2015/7/27/1125
> 
> The first patch implements the RPM clock operations, which are
> using a shared memory for sending requests to the RPM processor.
> The second patch adds the support of RPM clocks on the MSM8916
> platform.
> 
> Changes since v1 (https://lkml.org/lkml/2015/7/9/257):
> * Changed the driver name to clk-smd-rpm, also build it only
>   when it is needed - suggested by Srini and Bjorn.
> * More detailed binding example.
> * Minor changes.
> 
> Georgi Djakov (2):
>   clk: qcom: Add support for RPM Clocks
>   clk: qcom: Add MSM8916 RPM clock driver
> 
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |   35 ++++
>  drivers/clk/qcom/Kconfig                           |    4 +
>  drivers/clk/qcom/Makefile                          |    2 +
>  drivers/clk/qcom/clk-smd-rpm.c                     |  165 ++++++++++++++++
>  drivers/clk/qcom/clk-smd-rpm.h                     |  139 ++++++++++++++
>  drivers/clk/qcom/gcc-msm8916.c                     |   13 --
>  drivers/clk/qcom/rpmcc-msm8916.c                   |  196 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc-msm8916.h     |   44 +++++
>  8 files changed, 585 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
>  create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
>  create mode 100644 drivers/clk/qcom/clk-smd-rpm.h
>  create mode 100644 drivers/clk/qcom/rpmcc-msm8916.c
>  create mode 100644 include/dt-bindings/clock/qcom,rpmcc-msm8916.h
> 

Hi Stephen, any comments on this?
Thanks!
