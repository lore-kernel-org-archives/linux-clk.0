Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Feb 2016 11:15:22 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v7 1/2] clk: qcom: Add support for SMD-RPM Clocks
Message-ID: <20160224191522.GE4847@codeaurora.org>
References: <1456243999-22652-1-git-send-email-georgi.djakov@linaro.org>
 <1456243999-22652-2-git-send-email-georgi.djakov@linaro.org>
 <56CD835A.1010608@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56CD835A.1010608@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 02/24, Srinivas Kandagatla wrote:
> 
> 
> On 23/02/16 16:13, Georgi Djakov wrote:
> >+/* msm8916 */
> >+#define RPM_XO_CLK_SRC				0
> >+#define RPM_XO_A_CLK_SRC			1
> >+#define RPM_PCNOC_CLK				2
> >+#define RPM_PCNOC_A_CLK				3
> >+#define RPM_SNOC_CLK				4
> >+#define RPM_SNOC_A_CLK				5
> >+#define RPM_BIMC_CLK				6
> >+#define RPM_BIMC_A_CLK				7
> >+#define RPM_QDSS_CLK				8
> >+#define RPM_QDSS_A_CLK				9
> >+#define RPM_BB_CLK1				10
> >+#define RPM_BB_CLK1_A				11
> >+#define RPM_BB_CLK2				12
> >+#define RPM_BB_CLK2_A				13
> >+#define RPM_RF_CLK1				14
> >+#define RPM_RF_CLK1_A				15
> >+#define RPM_RF_CLK2				16
> >+#define RPM_RF_CLK2_A				17
> >+#define RPM_BB_CLK1_PIN				18
> >+#define RPM_BB_CLK1_A_PIN			19
> >+#define RPM_BB_CLK2_PIN				20
> >+#define RPM_BB_CLK2_A_PIN			21
> >+#define RPM_RF_CLK1_PIN				22
> >+#define RPM_RF_CLK1_A_PIN			23
> >+#define RPM_RF_CLK2_PIN				24
> >+#define RPM_RF_CLK2_A_PIN			25
> >+
> 
> These names are more generic, and offsets are specific to the 8916
> chip, adding soc prefix to these would make more sense and also set
> a rule for the next soc support patches too.
> 

Do these ever change though? Maybe we should remove the msm8916
specificness and let the rpm clk consumers choose the clks they
want to use. Combine all the different SoCs into the same "RPM
clk" numberspace so that we don't have a handful of different
headers and different RPM clk definitions in the driver when
they're almost the same across chips.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
