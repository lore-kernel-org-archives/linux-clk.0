Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6724ECCA479
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 12:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235443AbiF1MkW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 08:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbiF1MkT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 08:40:19 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872F22F398
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 05:40:18 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c15so1793571ljr.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 05:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MxGQ2YnHxmb3Xl+ErDnQ7bNnCMEH/xS4R9A6OhgAyBQ=;
        b=D23p5i8aSaHruyf6k2IMFcGEVw+8l++o9fpr2kVhtnDcpjNwW53b4MxVpaSYrKQfCA
         lFIk18dm3nwRm6BWYuw7qZ+54QM44tGSPjl2O/Hp2k/myW7McE5ho1R77JDl5BLrACn5
         03AiPgzDEN12vz4+TgpTT4XECRmZ95Bfq/56ym9uf5jpoVnI03sBVNwRflympFMFaMwK
         CfFz3TpiN+CTcM7lHFaK573lRwkRtOn0TCqBhaDduxGsQkJo4VwkSX9sf7GnfyTaOSYp
         AJY5dyFp6SkbeW6nbLKjd8WrI4moyugEyd0vG0CoCJfOMv73+/2Wkiqu3B5jLjTFzGnp
         s36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MxGQ2YnHxmb3Xl+ErDnQ7bNnCMEH/xS4R9A6OhgAyBQ=;
        b=PcWQ7XLyJlLbucHTyjPQ+5GTWhBbQsJGI4NJKN5gai9wv3kAnijVWwutFHWDMJVU8I
         xiMsgYFRk+qrEvGRE9lGMuHlBfZEhd5mY5eSRWLfCi2DJZPvIpMU4RcRWctfz578QPJ8
         IYfgIa018GlqYPe5jkKf9MCcvk6G8y9ucm8IBjaZPT8rO8vJ3LL8KKVoHWUcU5psckER
         oqXDDxZVU8vsInPMepm6RnTH+ASbnZDSNh5T4bwrRXYPmslLWkY806udRP8hdw/+17uJ
         YT4zHqmGHuYBw7qy3pzriIaj9BmkBDhohkQYBYVzfzn2gmTNYM6nu0JdsPWUCkSWhdzo
         1pOA==
X-Gm-Message-State: AJIora+9Zi7pFtH/U4ou+oDgVABHWQ2Q1ht0d0GVEk6a7feWvmvMCxTZ
        xEJJ9PDPNOprgr9JYkLR22Z49Q==
X-Google-Smtp-Source: AGRyM1vBGhayZNdb04az1HWjpH7np+Pmdf/O+Yrv8cGXpzXHAcXN+fvKIgyHZkZ97fnqSTN58GATJg==
X-Received: by 2002:a2e:9c9:0:b0:25a:6847:c9c8 with SMTP id 192-20020a2e09c9000000b0025a6847c9c8mr9194486ljj.266.1656420016865;
        Tue, 28 Jun 2022 05:40:16 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k18-20020a05651c061200b0025bcdb5f7a8sm424871lje.127.2022.06.28.05.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 05:40:16 -0700 (PDT)
Message-ID: <eb516b67-9c9e-251b-3fea-8d2830e1ab89@linaro.org>
Date:   Tue, 28 Jun 2022 15:40:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 5/7] clk: qcom: gcc-msm8916: move
 gcc_mss_q6_bimc_axi_clk down
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
 <20220619212735.1244953-6-dmitry.baryshkov@linaro.org>
 <20220627211844.6kwk2kyalgyb3ysm@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220627211844.6kwk2kyalgyb3ysm@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/06/2022 00:18, Marijn Suijten wrote:
> On 2022-06-20 00:27:33, Dmitry Baryshkov wrote:
>> The gcc_mss_q6_bimc_axi_clk clock depends on the bimc_ddr_clk_src clock.
>> Move it down in the file to come after the source clock.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/clk/qcom/gcc-msm8916.c | 34 +++++++++++++++++-----------------
>>   1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
>> index 7962edbdbcf6..4d726ca4b0da 100644
>> --- a/drivers/clk/qcom/gcc-msm8916.c
>> +++ b/drivers/clk/qcom/gcc-msm8916.c
>> @@ -2594,23 +2594,6 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
>> -	.halt_reg = 0x49004,
>> -	.clkr = {
>> -		.enable_reg = 0x49004,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_mss_q6_bimc_axi_clk",
>> -			.parent_names = (const char *[]){
>> -				"bimc_ddr_clk_src",
>> -			},
>> -			.num_parents = 1,
>> -			.flags = CLK_SET_RATE_PARENT,
>> -			.ops = &clk_branch2_ops,
>> -		},
>> -	},
>> -};
>> -
>>   static struct clk_branch gcc_oxili_ahb_clk = {
>>   	.halt_reg = 0x59028,
>>   	.clkr = {
>> @@ -2860,6 +2843,23 @@ static struct clk_branch gcc_bimc_gpu_clk = {
>>   	},
>>   };
>>   
>> +static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
> 
> How'd you settle on placing it here?  It isn't right below
> bimc_ddr_clk_src, nor the last user of bimc_ddr_clk_src, doesn't seem to
> have any alphabetical or .enable_reg related ordering to the other clks
> either?

Hmm, I was looking for the last bimc_ddr_clk_src user. Let's see if I 
can find a better place then.

> 
>> +	.halt_reg = 0x49004,
>> +	.clkr = {
>> +		.enable_reg = 0x49004,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "gcc_mss_q6_bimc_axi_clk",
>> +			.parent_names = (const char *[]){
>> +				"bimc_ddr_clk_src",
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>>   static struct clk_branch gcc_jpeg_tbu_clk = {
>>   	.halt_reg = 0x12034,
>>   	.clkr = {
>> -- 
>> 2.35.1
>>


-- 
With best wishes
Dmitry
