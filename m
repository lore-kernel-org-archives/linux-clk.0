Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E80EB64DD
	for <linux-clk@archiver.kernel.org>; Wed, 21 Jun 2023 14:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbjFUOQK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Jun 2023 10:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbjFUOPu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2023 10:15:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993D31FFC
        for <linux-clk@vger.kernel.org>; Wed, 21 Jun 2023 07:15:29 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so8207165e87.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Jun 2023 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687356928; x=1689948928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WO0wRiGvwvFFxc6ddvmc2hEJ6Af99eLgH/iA0sVZGJI=;
        b=WwFu6VlAr2SlRovLrSh6EFSE2IYpH6tY701z5wzbbVvoP0YIoZX5Ntj4y4tDHau4ld
         np4r2NKmcObhZV2pf6z2ifzK53z1TUtUSqBGou0hZiXzExjgQT55JBuIOhQpLTIgVrHq
         W1fLy6Mjrv5xL4aO4eWXe4ElQeOonxTnx7d00Y+cNL9V0e/6MAUeXIHjHAmXWuHOSA/h
         HR17SfTbhE5a9eqjkP15ZWgw7jIaRR/HD1syWw7WaoD2fvuHwxZStwuwuKkDED9I7pf9
         kOuV2w6ugcNN9+nX4Gdr76FdocrNEK1i6gJ1dn+4+mO3xc7ZJggHMroy9C3JZhmsWEca
         I/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687356928; x=1689948928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO0wRiGvwvFFxc6ddvmc2hEJ6Af99eLgH/iA0sVZGJI=;
        b=HRTnXuEYgyJayyClkcDys3HVaDtCYuLsHhoJEIa8AlUkPOCq0SDCwUyjfU48zBWnXm
         5hy8fqrpe8efQmx5n0FyD8MvY/su7O+JF137pcknFAcyxKTTVR9tA4Lo44CNt5D/IpdL
         DHOMMkeNyjnHvTCW3Q43/hHoxVgiC/qekn52XKLw/7SxSYcdq+DL/DhvpUdX5FHXjMn4
         Oka4/WoKfuJgCZGrcECO8yyQUXizKm5S34qJgJmCzVmuK4Go2H1efdESUGZRD5DdUoqO
         Kc2EFcxmAcqm9IwPxewJg/65vtB5SRNaMEaLvvEiehWzRUeYIuHcYTBTpAecf/aIRWzn
         /y+w==
X-Gm-Message-State: AC+VfDyosQ+wgOVF3GGmmi6VA42yur3XOv9dm4u14TYfYwa6fzZjBPUl
        Oync0zWQ+izZB4H/JICUaBnZlA==
X-Google-Smtp-Source: ACHHUZ6mkH/Gyz2cXYdyzimv0/bg1Z67dEVNVGZbDw89bpZv7w/IKri2Jz1t1xJik3NTF2w8OJd1Ag==
X-Received: by 2002:a19:3807:0:b0:4f7:6775:2a66 with SMTP id f7-20020a193807000000b004f767752a66mr8453628lfa.53.1687356927422;
        Wed, 21 Jun 2023 07:15:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u27-20020ac248bb000000b004f64fb058f7sm795002lfg.225.2023.06.21.07.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 07:15:26 -0700 (PDT)
Message-ID: <372f776d-6d98-5438-2a13-0aeac4182a31@linaro.org>
Date:   Wed, 21 Jun 2023 17:15:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-9-dmitry.baryshkov@linaro.org>
 <20230613234113.tnzjgfbyhj5zokgl@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230613234113.tnzjgfbyhj5zokgl@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/06/2023 02:41, Bjorn Andersson wrote:
> On Sat, May 13, 2023 at 12:17:25AM +0300, Dmitry Baryshkov wrote:
>> The gcc and lcc devices have been switched to the DT-defined cxo_board
>> clock. Now we can drop the manually defined cxo clock.
>>
> 
> Perhaps I'm reading this incorrectly, but don't you introduce that clock
> in DT in the next commit? It would be nice to allow for at least some
> overlap between existing dtb and the new scheme.

No, this clock existed in DT for some time, I'm just removing the 
necessity for an intermediate clock in the gcc driver.

> 
> Regards,
> Bjorn
> 
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
>>   1 file changed, 17 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
>> index 458c18b639db..64d4f508e43a 100644
>> --- a/drivers/clk/qcom/gcc-mdm9615.c
>> +++ b/drivers/clk/qcom/gcc-mdm9615.c
>> @@ -26,17 +26,6 @@
>>   #include "clk-branch.h"
>>   #include "reset.h"
>>   
>> -static struct clk_fixed_factor cxo = {
>> -	.mult = 1,
>> -	.div = 1,
>> -	.hw.init = &(struct clk_init_data){
>> -		.name = "cxo",
>> -		.parent_names = (const char *[]){ "cxo_board" },
>> -		.num_parents = 1,
>> -		.ops = &clk_fixed_factor_ops,
>> -	},
>> -};
>> -
>>   enum {
>>   	DT_CXO,
>>   	DT_PLL4,
>> @@ -1623,10 +1612,6 @@ static struct clk_branch ebi2_aon_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_hw *gcc_mdm9615_hws[] = {
>> -	&cxo.hw,
>> -};
>> -
>>   static struct clk_regmap *gcc_mdm9615_clks[] = {
>>   	[PLL0] = &pll0.clkr,
>>   	[PLL0_VOTE] = &pll0_vote,
>> @@ -1736,8 +1721,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
>>   	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
>>   	.resets = gcc_mdm9615_resets,
>>   	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
>> -	.clk_hws = gcc_mdm9615_hws,
>> -	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
>>   };
>>   
>>   static const struct of_device_id gcc_mdm9615_match_table[] = {
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

