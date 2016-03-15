Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v6 2/2] clk: qcom: Add support for RPM Clocks
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1450182602-6996-1-git-send-email-georgi.djakov@linaro.org>
 <1450182602-6996-3-git-send-email-georgi.djakov@linaro.org>
 <20160313130627.GT21240@tuxbot>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <56E84372.7090107@linaro.org>
Date: Tue, 15 Mar 2016 19:16:34 +0200
MIME-Version: 1.0
In-Reply-To: <20160313130627.GT21240@tuxbot>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 03/13/2016 03:06 PM, Bjorn Andersson wrote:
> On Tue 15 Dec 04:30 PST 2015, Georgi Djakov wrote:
> 
> [..]
>> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> [..]
>> +
>> +static struct clk_rpm *apq8064_clks[] = {
>> +	[QCOM_RPM_PXO_CLK] = &apq8064_pxo,
>> +	[QCOM_RPM_CXO_CLK] = &apq8064_cxo,
>> +	[QCOM_RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
>> +	[QCOM_RPM_CFPB_CLK] = &apq8064_cfpb_clk,
>> +	[QCOM_RPM_DAYTONA_FABRIC_CLK] = &apq8064_daytona_clk,
>> +	[QCOM_RPM_EBI1_CLK] = &apq8064_ebi1_clk,
>> +	[QCOM_RPM_MM_FABRIC_CLK] = &apq8064_mmfab_clk,
>> +	[QCOM_RPM_MMFPB_CLK] = &apq8064_mmfpb_clk,
>> +	[QCOM_RPM_SYS_FABRIC_CLK] = &apq8064_sfab_clk,
>> +	[QCOM_RPM_SFPB_CLK] = &apq8064_sfpb_clk,
>> +	[QCOM_RPM_QDSS_CLK] = &apq8064_qdss_clk,
>> +};
>> +
> 
> I do believe we did discuss this, but fwiw, do we really want the rpm
> resource identifiers here? Rather than something clock specific
> (from qcom,rpmcc.h)?
> 

Agree. I have switched to clock specific identifiers in v7:
https://lkml.org/lkml/2016/2/23/540

Thanks,
Georgi
