Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE21C46467
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 21:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbjAKVwr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235851AbjAKVwo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 16:52:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE6615F38
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:52:42 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y25so25586300lfa.9
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJS+rsmsg5fd5Th9BLno2eG5ZG6dUTrzqHL7v8HGNqY=;
        b=iPPqRYy2ljejftbYFVmEj8vK8aQsrh7L3hafx0V9lBnjzVfJL6nGHY68gjo+FWCJBJ
         Zm5+gfqoAInDbv16j1vJkEeTbyUy0ZD6G/8thSQ9UvBT7fZ4pZFPlr2ja4IN1w83/rVT
         q3Ap1Z1PZhzAKBD9H1H7k4Nn9rE+pu6mnfFgevb/fJufTwnmWRFxJqa+xgv8adfMqrzr
         9KepTJGjKvMPAt232+djDeI+bO2yT+C4EHrZzpX6zIeoi9htRA7SMIt7NDcqe5Iiq/Ub
         7+p0Rvy1QvzAigYYIE0lJjQwBE9Nc3r8BU2Wv8QnxQFyKBLergK4Jq4EoXAElRH+N2Hq
         1NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJS+rsmsg5fd5Th9BLno2eG5ZG6dUTrzqHL7v8HGNqY=;
        b=fSrkUqTzU0Fk+snNT4FT/JlSDnK/mdHX9XiBBYdfgfwQdFVrClCmtdoFlwxwKNoLRI
         BDlhIKZ4KRLDjSlbqnD0Ip0j/pHUx+WjPSJDxGfMP2e0fpGQSX+ueBcs+GdMBSJvAcJy
         xkkXAizb+V2G/ubbBewr49qnPubmdNsO709esb4rWLibKaaW8WHozvTSW1FWQLnzjA4d
         PQVYSDjJtYZGg5e/2NLckvQpVyGYpbgWO+xA6NCbB/i1e506YecnWkF8bf9ostwcFDDW
         XU2uxa7R1pTzwTzezzrg6Km1WhSZwpQl0CaRRVs2YSYpaZlLbRSAvycI1ohtBCzEBn88
         iM2g==
X-Gm-Message-State: AFqh2kp/igUlU02FXDwWtOLDeUDWk9L1fiZ0x2sB2qMXQZQ50Ra3/Ade
        0LFeNhJyK1bmhQpOfBrw0DEU5A==
X-Google-Smtp-Source: AMrXdXu/7kf+EAh6ZGwPywWuZ+QeQRnXXd1Q7qzb8+EYHzcrWcnuXO/gzEsscPB+UM4UEfRQsOWuJQ==
X-Received: by 2002:a05:6512:695:b0:4b5:2bbc:e119 with SMTP id t21-20020a056512069500b004b52bbce119mr35624538lfe.65.1673473961185;
        Wed, 11 Jan 2023 13:52:41 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e12-20020ac2546c000000b004ca0ea7af24sm2909772lfn.174.2023.01.11.13.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 13:52:40 -0800 (PST)
Message-ID: <39c01d7b-eee4-ceb7-f7c4-7862c5527f33@linaro.org>
Date:   Wed, 11 Jan 2023 23:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 04/13] clk: qcom: cpu-8996: support using GPLL0 as SMUX
 input
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
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-5-dmitry.baryshkov@linaro.org>
 <33a6bf2c-bb93-c183-3915-5b90b72e4503@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <33a6bf2c-bb93-c183-3915-5b90b72e4503@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/01/2023 22:59, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>> In some cases the driver might need using GPLL0 to drive CPU clocks.
>> Bring it in through the sys_apcs_aux clock.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Oh that's new.. downstream doesn't talk about this..

It does, but under the hood of the init procedure. See:

         /* Select GPLL0 for 300MHz for the perf cluster */
         writel_relaxed(0xC, vbases[APC1_BASE] + MUX_OFFSET);


> 
> Konrad
>>   drivers/clk/qcom/clk-cpu-8996.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index d51965fda56d..0e0c00d44c6f 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -12,6 +12,8 @@
>>    *                              +-------+
>>    *               XO             |       |
>>    *           +------------------>0      |
>> + *               SYS_APCS_AUX   |       |
>> + *           +------------------>3      |
>>    *                              |       |
>>    *                    PLL/2     | SMUX  +----+
>>    *                      +------->1      |    |
>> @@ -310,20 +312,29 @@ static const struct clk_ops clk_cpu_8996_pmux_ops = {
>>   	.determine_rate = clk_cpu_8996_pmux_determine_rate,
>>   };
>>   
>> +static const struct parent_map smux_parent_map[] = {
>> +	{ .cfg = 0, }, /* xo */
>> +	{ .cfg = 1, }, /* pll */
>> +	{ .cfg = 3, }, /* sys_apcs_aux */
>> +};
>> +
>>   static const struct clk_parent_data pwrcl_smux_parents[] = {
>>   	{ .fw_name = "xo" },
>>   	{ .hw = &pwrcl_pll_postdiv.hw },
>> +	{ .fw_name = "sys_apcs_aux" },
>>   };
>>   
>>   static const struct clk_parent_data perfcl_smux_parents[] = {
>>   	{ .fw_name = "xo" },
>>   	{ .hw = &perfcl_pll_postdiv.hw },
>> +	{ .fw_name = "sys_apcs_aux" },
>>   };
>>   
>>   static struct clk_regmap_mux pwrcl_smux = {
>>   	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
>>   	.shift = 2,
>>   	.width = 2,
>> +	.parent_map = smux_parent_map,
>>   	.clkr.hw.init = &(struct clk_init_data) {
>>   		.name = "pwrcl_smux",
>>   		.parent_data = pwrcl_smux_parents,
>> @@ -337,6 +348,7 @@ static struct clk_regmap_mux perfcl_smux = {
>>   	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
>>   	.shift = 2,
>>   	.width = 2,
>> +	.parent_map = smux_parent_map,
>>   	.clkr.hw.init = &(struct clk_init_data) {
>>   		.name = "perfcl_smux",
>>   		.parent_data = perfcl_smux_parents,

-- 
With best wishes
Dmitry

