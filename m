Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 15 Dec 2017 17:10:34 -0600
From: Rob Herring <robh@kernel.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 10/11] dt-bindings: clock: qcom: add misc resets for
 PCIE and NSS
Message-ID: <20171215231034.wf6fhpbu7eqbjfp4@rob-hp-laptop>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-11-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1513175142-3702-11-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Dec 13, 2017 at 07:55:41PM +0530, Abhishek Sahu wrote:
> PCIE and NSS has MISC reset register in which single register has
> multiple reset bit. The patch adds the DT bindings for these MISC
> resets.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
