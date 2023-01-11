Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEF2C46467
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 22:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjAKWB6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 17:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234769AbjAKWB4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 17:01:56 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9797315FC3
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 14:01:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bq39so25671622lfb.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 14:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ds+ysKNpdyUSZP+78toha7tZH4ghJPhiLQmEloFPzAk=;
        b=KjTmFWTDlgLdJclssfDOuIyB+caIQTSzyi/4JtbrHlCeg+gHDrA1uruvifd0chNXvc
         cYtmpEsn/T+lp5EzdlCp1x0bfe5u1klutCVNG16f1eJ9sXZUXqHA5D/Dkeb5xylMXFGO
         h7Afr3pii0KF+NLrGdA8AcBRGTLCT9ga35e8DgS9LvTqFfp6PB70O2Z6cFoBkCicrmaa
         zp4XpG09KJkQgSNp9ccQ27ts8VTJH9+0pmdunbX1EaaZH3OOiKzht3ndck9yr3iO8hZE
         pfVTknPxsyVigD6NowkLJFcOfzMe6qvnDUO5Qnu+6JY/v0hKFWMDzuLN4C0OpTFpiQCY
         zXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds+ysKNpdyUSZP+78toha7tZH4ghJPhiLQmEloFPzAk=;
        b=WZVFjcBpC5xWwOB1veFjX1OH0+Yu5sW1jo9uqVyD/5wpmuf2Ht4vvOCAAltENshsl0
         bARQj3qjHTaRJWtjmPZboQH6Fyd4hnt4S+x8qf9OmdquZnFVulE0VVHXW3OmtWRvlyID
         tib0iJSsyLjaqCoUl2kMVXhYebxRARjANAIc/JDx61FP2f67sliTr7EREJQ1HjEBa531
         siPtpy3OP5+ipgvyTeQ0iy6kzJFx6FTyO8HSSydx9EZ2wie/2peacVQacTPLG5cOTXNO
         HceuFucLQv7+s+pRrU2XX2PxoQ/a53rliN9RSHHBCBSuVDMBKD9OPZRyS745w20a9Wws
         e4yg==
X-Gm-Message-State: AFqh2koYr7BjqhR5Vs9c7a78iOqqRiCwgm95aba1zQaFOnXUYo0wqc8I
        AZvEMEV7O9v3LuT7Z60pUKk3lQ==
X-Google-Smtp-Source: AMrXdXsBUSyK3CCGvG5xf9Fl5bejVA6aAg1DPofedhAjZBydvV4hQcLhgPoCuk9CUVL1NoTu6nezgQ==
X-Received: by 2002:a05:6512:130c:b0:4ca:f9ec:eee2 with SMTP id x12-20020a056512130c00b004caf9eceee2mr22340609lfu.20.1673474512851;
        Wed, 11 Jan 2023 14:01:52 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x30-20020a0565123f9e00b004b543f38b7csm2934833lfa.21.2023.01.11.14.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 14:01:52 -0800 (PST)
Message-ID: <bbaea2e2-cea4-3528-4e9b-b003d53d0af7@linaro.org>
Date:   Thu, 12 Jan 2023 00:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/13] clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb
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
 <20230111192004.2509750-7-dmitry.baryshkov@linaro.org>
 <b4721d61-799e-2677-4273-0c92cb555cae@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b4721d61-799e-2677-4273-0c92cb555cae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/01/2023 23:03, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>> - Do not use the Alt PLL completely. Switch to smux when necessary to
>>    prevent overvolting
> Is this empirical evidence, or did Qualcomm recommendations change since
> msm-3.18 was released?

I think this is what they are doing, see 
https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L675

They switch altpll frequency for whatever reasons, then they do the 
dance of switching the parent rate to half rate if necessary and then 
they finally switch the parent's rate to the target rate. That's the 
only way I can interpret the cpu_clk_8996_set_rate().

https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L675

> 
> 
>> - Restore the parent in case the rate change aborts for some reason
>> - Do not duplicate resetting the parent in set_parent operation.
> These sound good.
> 
> Konrad
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index 7e5246ca7e7f..ee7e18b37832 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -506,27 +506,34 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
>>   {
>>   	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_nb(nb);
>>   	struct clk_notifier_data *cnd = data;
>> -	int ret;
>>   
>>   	switch (event) {
>>   	case PRE_RATE_CHANGE:
>> -		ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ALT_INDEX);
>>   		qcom_cpu_clk_msm8996_acd_init(base);
>> +
>> +		/*
>> +		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
>> +		 * to bottom, so it will change the rate of the PLL before
>> +		 * chaging the parent of PMUX. This can result in pmux getting
>> +		 * clocked twice the expected rate.
>> +		 *
>> +		 * Manually switch to PLL/2 here.
>> +		 */
>> +		if (cnd->new_rate < DIV_2_THRESHOLD &&
>> +		    cnd->old_rate > DIV_2_THRESHOLD)
>> +			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, SMUX_INDEX);
>> +
>>   		break;
>> -	case POST_RATE_CHANGE:
>> -		if (cnd->new_rate < DIV_2_THRESHOLD)
>> -			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
>> -							   SMUX_INDEX);
>> -		else
>> -			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
>> -							   ACD_INDEX);
>> -		break;
>> +	case ABORT_RATE_CHANGE:
>> +		/* Revert manual change */
>> +		if (cnd->new_rate < DIV_2_THRESHOLD &&
>> +		    cnd->old_rate > DIV_2_THRESHOLD)
>> +			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
>>   	default:
>> -		ret = 0;
>>   		break;
>>   	}
>>   
>> -	return notifier_from_errno(ret);
>> +	return NOTIFY_OK;
>>   };
>>   
>>   static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)

-- 
With best wishes
Dmitry

