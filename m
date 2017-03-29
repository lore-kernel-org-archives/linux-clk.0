Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 28 Mar 2017 20:21:55 -0500
From: Rob Herring <robh@kernel.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 1/2] clk: qcom: clk-smd-rpm: add msm8996 rpmclks
Message-ID: <20170329012155.cqm5xwzfxfbhgxx6@rob-hp-laptop>
References: <1490175566-4084-1-git-send-email-rnayak@codeaurora.org>
 <1490175566-4084-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490175566-4084-2-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 22, 2017 at 03:09:25PM +0530, Rajendra Nayak wrote:
> Add all RPM controlled clocks on msm8996 platform
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> [srini: Fixed various issues with offsets and made names specific to msm8996]
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +
>  drivers/clk/qcom/clk-smd-rpm.c                     | 82 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h             | 14 ++++
>  include/linux/soc/qcom/smd-rpm.h                   |  4 ++
>  4 files changed, 101 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
