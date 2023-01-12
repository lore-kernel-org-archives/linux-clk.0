Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B33BC61DB3
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 15:45:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240577AbjALPpg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 10:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234424AbjALPpL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 10:45:11 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E059CF3
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 07:36:08 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bq39so29024108lfb.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 07:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IwEiXyfHQdfgug8ORpyvTGOkl/FA1g4r3Xv9Ff3DX3o=;
        b=MD0nwen3lrcCpvOSffptHPFackSbzNgYDtlhtgUjFAmxa6K//e68aeD2HD1Ew6h3uE
         2timkVd17JX3M2bEEUuSScc4hmU3Ig2qb5/lerqABGmA31Oval7v+fSDNVhBRvPCykwp
         L3UQdFllXJ0VM2ujgINwBdcnRsYsG2xRaM0jVPMxQPn4B82H4wR8KDbvcZ3q/mCGfV/+
         SlHEieFfB97lrbhMQ1SoxmeYG280FvbEZrAY5DrCQxoRzsXjy2UsQSSG25ITaibg1XT0
         ohjkqmNlc1Nso1uFCEywl9OE0t+lIL9TeF4XSbYcjhOJAlcRcFtPIihkieuyXuz8CU1s
         6fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwEiXyfHQdfgug8ORpyvTGOkl/FA1g4r3Xv9Ff3DX3o=;
        b=LHGPJnQRjaq/3/ekVBxAVbSj9XhNhHxHqVv5O/A2ntc9p4Cc+ct7rBD8Rz/nj46d1W
         HmV2akAVgvzPh+dz8t50LYWjhLOVChoXKDDHN6zD1INDZeIBV//B7VO4Yknk3O35SAi3
         08gX8kP5JpzRGV4qJCq9FjvfM7B7Ml6uHYEhrxahkCuRfh6fwkQuqmKl/vXNa+Mjcx8F
         LGfP76xonWDN1zvDBEUTSC+oZlrmY39sGFlkJa8AXJDTHhc06RQt+FAottaquExfHFcT
         UQcq7AH0d7R3uOrN76eReFMOWVOYPin0NtABXmC2KKgsxkuBX7LzXUUxE2Jmld6+jkSv
         LWxg==
X-Gm-Message-State: AFqh2kqYb4/IpY/Ct7vJa3GjzCXYjxJjkw+oBXi2L86TVN3eMV2I9Xbe
        2aShoK2I9kiodcVTfgvNc7MQbA==
X-Google-Smtp-Source: AMrXdXvKxDcZZ+vHMhgvzAJXdNkNgr+xseS4anFv5ZDE6E2AbxY7s6qxSsca2pQZlosTOoXeFHWi3g==
X-Received: by 2002:a05:6512:23a3:b0:4cb:6bcb:de4e with SMTP id c35-20020a05651223a300b004cb6bcbde4emr9748970lfv.24.1673537766949;
        Thu, 12 Jan 2023 07:36:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004947a12232bsm3309600lfg.275.2023.01.12.07.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:36:06 -0800 (PST)
Message-ID: <1b806538-37d7-40b2-ece9-bcf7792df646@linaro.org>
Date:   Thu, 12 Jan 2023 17:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/4] clk: qcom: add the driver for the MSM8996 APCS clocks
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230111191453.2509468-1-dmitry.baryshkov@linaro.org>
 <20230111191453.2509468-5-dmitry.baryshkov@linaro.org>
 <fbec2272-e9b8-207d-e2ce-2f2011640d33@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <fbec2272-e9b8-207d-e2ce-2f2011640d33@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/01/2023 17:23, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:14, Dmitry Baryshkov wrote:
>> Add a simple driver handling the APCS clocks on MSM8996. For now it
>> supports just a single aux clock, linking GPLL0 to CPU and CBF clocks.
>>
>> Note, there is little sense in registering sys_apcs_aux as a child of
>> gpll0. The PLL is always-on. And listing the gpll0 as a property of the
>> apcs would delay its probing until the GCC has been probed (while we
>> would like for the apcs to be probed as early as possible).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/Makefile       |  2 +-
>>   drivers/clk/qcom/apcs-msm8996.c | 77 +++++++++++++++++++++++++++++++++
>>   2 files changed, 78 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/clk/qcom/apcs-msm8996.c
>>
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index f18c446a97ea..ca2f586edb3e 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -52,7 +52,7 @@ obj-$(CONFIG_MSM_MMCC_8998) += mmcc-msm8998.o
>>   obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
>>   obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
>>   obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
>> -obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
>> +obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += apcs-msm8996.o clk-cpu-8996.o
>>   obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
>>   obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
>>   obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>> diff --git a/drivers/clk/qcom/apcs-msm8996.c b/drivers/clk/qcom/apcs-msm8996.c
>> new file mode 100644
>> index 000000000000..2e9959974ed9
>> --- /dev/null
>> +++ b/drivers/clk/qcom/apcs-msm8996.c
>> @@ -0,0 +1,77 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Qualcomm APCS clock controller driver
>> + *
>> + * Copyright (c) 2022, Linaro Limited
>> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/delay.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#define APCS_AUX_OFFSET	0x50
>> +
>> +#define APCS_AUX_DIV_MASK GENMASK(17, 16)
>> +#define APCS_AUX_DIV_2 0x1
>> +
>> +static int qcom_apcs_msm8996_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device *parent = dev->parent;
>> +	struct regmap *regmap;
>> +	struct clk_hw *hw;
>> +	unsigned int val;
>> +	int ret = -ENODEV;
>> +
>> +	regmap = dev_get_regmap(parent, NULL);
>> +	if (!regmap) {
>> +		dev_err(dev, "failed to get regmap: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	regmap_read(regmap, APCS_AUX_OFFSET, &val);
>> +	regmap_update_bits(regmap, APCS_AUX_OFFSET, APCS_AUX_DIV_MASK,
>> +			   FIELD_PREP(APCS_AUX_DIV_MASK, APCS_AUX_DIV_2));
>> +
>> +	/* Hardware mandated delay */
>> +	udelay(5);
>> +
>> +	/*
>> +	 * Register the clock as fixed rate instead of being a child of gpll0
>> +	 * to let the driver register probe as early as possible.
>> +	 */
> Not sure.. you should keep a vote in GPLL0_ao supplied by XO_A
> and perhaps it would be a better idea to move RPMCC (+deps) and
> GCC to very early initcalls since there's a need for that..
> 
> Maybe it would even allow us to shave some miliseconds from
> boot times, at less things would defer!

That's what I'm trying to stay away from. No deferrals. These pieces 
(APCS, CPU and CBF clocks) should be initialized as early as possible. 
E.g. Qualcomm did all the init manually, even before the devices had a 
chance to probe. Probe deferral means that the device is going to be put 
to the end of the list.

clk-smd-rpmcc and gcc-msm8996 are registered at core_initcall. This is 
the earliest usable init level.

> 
> Konrad
>> +	hw = devm_clk_hw_register_fixed_rate(dev, "sys_apcs_aux", NULL, 0, 300000000);
>> +	if (IS_ERR(hw))
>> +		return PTR_ERR(hw);
>> +
>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
>> +}
>> +
>> +static struct platform_driver qcom_apcs_msm8996_clk_driver = {
>> +	.probe = qcom_apcs_msm8996_clk_probe,
>> +	.driver = {
>> +		.name = "qcom-apcs-msm8996-clk",
>> +	},
>> +};
>> +
>> +/* Register early enough to fix the clock to be used for other cores */
>> +static int __init qcom_apcs_msm8996_clk_init(void)
>> +{
>> +	return platform_driver_register(&qcom_apcs_msm8996_clk_driver);
>> +}
>> +postcore_initcall(qcom_apcs_msm8996_clk_init);
>> +
>> +static void __exit qcom_apcs_msm8996_clk_exit(void)
>> +{
>> +	platform_driver_unregister(&qcom_apcs_msm8996_clk_driver);
>> +}
>> +module_exit(qcom_apcs_msm8996_clk_exit);
>> +
>> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
>> +MODULE_LICENSE("GPL v2");
> "GPL"
> 
>> +MODULE_DESCRIPTION("Qualcomm MSM8996 APCS clock driver");

-- 
With best wishes
Dmitry

