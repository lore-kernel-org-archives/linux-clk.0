Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E6AC54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 15:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbjALPi7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 10:38:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240370AbjALPiM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 10:38:12 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA69BC41
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 07:29:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b3so28964159lfv.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 07:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJXtlOy4kaIMNAy3jo/PcWqorndTG5Q0usaCbYdEZUI=;
        b=y8i3euhslq9mzOrbxRAlLA1OZI82C6mbMZWEI4Jmr7pnOQaCAoB2AoAftRkYJwo8XG
         sMpR852O73dS4u8UVts7o12ZQBevQqEyYrdNJmiOtTw2vUprWonN8dnpDMjBsfQfELZj
         a8+lUas/hDySiHESRjgSzKvQCNXT8tZCAbovAd4ZT3MQ++RccdeAMkQ/rRAxQoh/r7NX
         +aHyun5QMXydePwj/8tjU9KlETdoQXWDWsa4A4tgQ5MrYxmVshDJp2Bp8o40pMQ0EaWe
         WjGUACCPsj4L+msQE/PZL3D0+ClJd/c4o9VhN+yGECJWtHG1i+qEqtmJcTa+XNlx5spA
         8x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJXtlOy4kaIMNAy3jo/PcWqorndTG5Q0usaCbYdEZUI=;
        b=wN2Ynr6stpCby7uTbsDOh4w/7x2Ya3CRFkYJKY0f7Lq5Sq+SMgpZMaSB4TtbLyu/c5
         8VBashlh0D0yrDB2yuY+KsRlSrg0X2VDFqQ2ltCOs0Z2vNeDj+1WmvMHgqUfXnateB8a
         aAEed9eKWxfUXooHcPBREgL5rlbWJvncY57GVvMAxmgVT870RdocZP7dpaKv/NAv2gsA
         REqq2SEgFz1rx+q5/cmp5/LerKY4OQMD3PMwR+RTQmCSKQXZEgP2Sw5bCw6FYipFoV1W
         EpLxqK/DW8QM4enUbanrz5E46gA0tPLT7JurWIrxpZbdqRygyHQn3YgMxX2/Bi/Vx60U
         uGZQ==
X-Gm-Message-State: AFqh2kq1t8ryykGPg2Y+rBNHb9WRdxma1G7WREZP7R9pV7rdRUnq/3iE
        qsTYurH8CbmPg7s5noZy9S2PIv7671mY5nsg
X-Google-Smtp-Source: AMrXdXsx5HSK4B77IQV8ws+PP4aR7+aGnrw7/TVnQbQfA+7CxO7BZg6wOGPlup/WSkkP70adiAG+hw==
X-Received: by 2002:a05:6512:49a:b0:4ce:85ed:e3cb with SMTP id v26-20020a056512049a00b004ce85ede3cbmr154033lfq.29.1673537356217;
        Thu, 12 Jan 2023 07:29:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e8-20020a196748000000b0047f7722b73csm3328633lfj.142.2023.01.12.07.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:29:15 -0800 (PST)
Message-ID: <8dd3e1d4-42ca-2f5d-689c-4c5f48abb748@linaro.org>
Date:   Thu, 12 Jan 2023 17:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] clk: qcom: cbf-msm8996: scale CBF clock according to
 the CPUfreq
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-4-dmitry.baryshkov@linaro.org>
 <360f92f9-8b3b-e491-e72c-c9cdcbe0c731@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <360f92f9-8b3b-e491-e72c-c9cdcbe0c731@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/01/2023 17:00, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:57, Dmitry Baryshkov wrote:
>> Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
>> according to CPU frequencies.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> TODO: assess if we should be doing this manually or rely on SPDM..

Manually, see the msm-3.18's devfreq-cpu and m4m-cpufreq maps.

SPDM uses CBF as an input not as an output.

> 
> Konrad
>>   drivers/clk/qcom/clk-cbf-8996.c | 141 +++++++++++++++++++++++++++++++-
>>   1 file changed, 140 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
>> index bdd4f8b48a7e..76db623b0f92 100644
>> --- a/drivers/clk/qcom/clk-cbf-8996.c
>> +++ b/drivers/clk/qcom/clk-cbf-8996.c
>> @@ -5,6 +5,7 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/clk-provider.h>
>> +#include <linux/interconnect-provider.h>
>>   #include <linux/of.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> @@ -225,6 +226,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
>>   	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
>>   };
>>   
>> +#ifdef CONFIG_INTERCONNECT
>> +struct qcom_msm8996_cbf_icc_provider {
>> +	struct icc_provider provider;
>> +	struct clk *clk;
>> +};
>> +
>> +#define to_qcom_cbf_provider(_provider) \
>> +	container_of(_provider, struct qcom_msm8996_cbf_icc_provider, provider)
>> +
>> +enum {
>> +	CBF_MASTER_NODE = 2000,
>> +	CBF_SLAVE_NODE
>> +};
>> +
>> +#define CBF_NUM_NODES 2
>> +
>> +static int qcom_msm8996_cbf_set(struct icc_node *src, struct icc_node *dst)
>> +{
>> +	struct qcom_msm8996_cbf_icc_provider *qp;
>> +
>> +	qp = to_qcom_cbf_provider(src->provider);
>> +
>> +	return clk_set_rate(qp->clk, icc_units_to_bps(dst->peak_bw));
>> +}
>> +
>> +static int qcom_msm8996_cbf_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
>> +{
>> +	struct qcom_msm8996_cbf_icc_provider *qp;
>> +
>> +	qp = to_qcom_cbf_provider(node->provider);
>> +	*peak = clk_get_rate(qp->clk) / 1000ULL;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev, struct clk_hw *cbf_hw)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct qcom_msm8996_cbf_icc_provider *qp;
>> +	struct icc_provider *provider;
>> +	struct icc_onecell_data *data;
>> +	struct icc_node *node;
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	clk = devm_clk_hw_get_clk(dev, cbf_hw, "cbf");
>> +	if (IS_ERR(clk))
>> +		return PTR_ERR(clk);
>> +
>> +	data = devm_kzalloc(dev, struct_size(data, nodes, CBF_NUM_NODES), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->num_nodes = CBF_NUM_NODES;
>> +
>> +	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
>> +	if (!qp)
>> +		return -ENOMEM;
>> +
>> +	qp->clk = clk;
>> +
>> +	provider = &qp->provider;
>> +	provider->dev = dev;
>> +	provider->get_bw = qcom_msm8996_cbf_icc_get_bw;
>> +	provider->set = qcom_msm8996_cbf_set;
>> +	provider->aggregate = icc_std_aggregate;
>> +	provider->xlate = of_icc_xlate_onecell;
>> +	INIT_LIST_HEAD(&provider->nodes);
>> +	provider->data = data;
>> +
>> +	ret = icc_provider_add(provider);
>> +	if (ret) {
>> +		dev_err(dev, "error adding interconnect provider\n");
>> +		return ret;
>> +	}
>> +
>> +	node = icc_node_create(CBF_MASTER_NODE);
>> +	if (IS_ERR(node)) {
>> +		ret = PTR_ERR(node);
>> +		goto err;
>> +	}
>> +
>> +	node->name = "cbf_master";
>> +	icc_node_add(node, provider);
>> +	icc_link_create(node, CBF_SLAVE_NODE);
>> +	data->nodes[0] = node;
>> +
>> +	node = icc_node_create(CBF_SLAVE_NODE);
>> +	if (IS_ERR(node)) {
>> +		ret = PTR_ERR(node);
>> +		goto err;
>> +	}
>> +
>> +	node->name = "cbf_slave";
>> +	icc_node_add(node, provider);
>> +	data->nodes[1] = node;
>> +
>> +	platform_set_drvdata(pdev, provider);
>> +
>> +	return 0;
>> +
>> +err:
>> +	icc_nodes_remove(provider);
>> +	icc_provider_del(provider);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
>> +{
>> +	struct icc_provider *provider = platform_get_drvdata(pdev);
>> +
>> +	icc_nodes_remove(provider);
>> +	icc_provider_del(provider);
>> +
>> +	return 0;
>> +}
>> +#else
>> +static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
>> +{
>> +	dev_warn(&pdev->dev, "interconnects support is disabled, CBF clock is fixed\n");
>> +
>> +	return 0;
>> +}
>> +#define qcom_msm8996_cbf_icc_remove(pdev) (0)
>> +#endif
>> +
>>   static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>>   {
>>   	void __iomem *base;
>> @@ -284,7 +412,16 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
>> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
>> +}
>> +
>> +static int qcom_msm8996_cbf_remove(struct platform_device *pdev)
>> +{
>> +	return qcom_msm8996_cbf_icc_remove(pdev);
>>   }
>>   
>>   static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
>> @@ -295,9 +432,11 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
>>   
>>   static struct platform_driver qcom_msm8996_cbf_driver = {
>>   	.probe = qcom_msm8996_cbf_probe,
>> +	.remove = qcom_msm8996_cbf_remove,
>>   	.driver = {
>>   		.name = "qcom-msm8996-cbf",
>>   		.of_match_table = qcom_msm8996_cbf_match_table,
>> +		.sync_state = icc_sync_state,
>>   	},
>>   };
>>   

-- 
With best wishes
Dmitry

