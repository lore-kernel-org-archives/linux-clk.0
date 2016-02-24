Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v7 1/2] clk: qcom: Add support for SMD-RPM Clocks
To: Georgi Djakov <georgi.djakov@linaro.org>, sboyd@codeaurora.org
References: <1456243999-22652-1-git-send-email-georgi.djakov@linaro.org>
 <1456243999-22652-2-git-send-email-georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <56CD835A.1010608@linaro.org>
Date: Wed, 24 Feb 2016 10:18:02 +0000
MIME-Version: 1.0
In-Reply-To: <1456243999-22652-2-git-send-email-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 23/02/16 16:13, Georgi Djakov wrote:
> +/* msm8916 */
> +#define RPM_XO_CLK_SRC				0
> +#define RPM_XO_A_CLK_SRC			1
> +#define RPM_PCNOC_CLK				2
> +#define RPM_PCNOC_A_CLK				3
> +#define RPM_SNOC_CLK				4
> +#define RPM_SNOC_A_CLK				5
> +#define RPM_BIMC_CLK				6
> +#define RPM_BIMC_A_CLK				7
> +#define RPM_QDSS_CLK				8
> +#define RPM_QDSS_A_CLK				9
> +#define RPM_BB_CLK1				10
> +#define RPM_BB_CLK1_A				11
> +#define RPM_BB_CLK2				12
> +#define RPM_BB_CLK2_A				13
> +#define RPM_RF_CLK1				14
> +#define RPM_RF_CLK1_A				15
> +#define RPM_RF_CLK2				16
> +#define RPM_RF_CLK2_A				17
> +#define RPM_BB_CLK1_PIN				18
> +#define RPM_BB_CLK1_A_PIN			19
> +#define RPM_BB_CLK2_PIN				20
> +#define RPM_BB_CLK2_A_PIN			21
> +#define RPM_RF_CLK1_PIN				22
> +#define RPM_RF_CLK1_A_PIN			23
> +#define RPM_RF_CLK2_PIN				24
> +#define RPM_RF_CLK2_A_PIN			25
> +

These names are more generic, and offsets are specific to the 8916 chip, 
adding soc prefix to these would make more sense and also set a rule for 
the next soc support patches too.


Thanks,
srini
