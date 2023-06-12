Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E16CC7EE43
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 12:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbjFLMZ0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 08:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbjFLMZ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 08:25:26 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA75E114
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 05:25:23 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b1b06af50eso50291121fa.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686572722; x=1689164722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihV2ctrJcHdhqHxaZ+65XW/djQqj6uqyI3HubS8KBYU=;
        b=k0y/h5g6xtVHe0ArFXGYe0k9OsGtwiZwrJkz4ayolmNYdqg2Aw9l3YE+AzQQ4+F5Mi
         Db5QxAzn9S46GaRIoljLsrh0Y7rjNUCjyu7G5Q3/yxliIX+uAuj+k2gof38elgwAccUw
         MjrGEzfQ1VSr2S+b++J68Ik1Z7JOkLrZlS7sVf4VxSW9KiIM0DS2QU9+qo3vCfq1wY8p
         ri148F4kcYQhObtSpM2gBB1dXTKWvCf3g/gbsoo1ZQMAIXoN8VBEhpyBnG8DMUBRLFqn
         q7HpfvW2KLbphiRHCNoe9Zw20SH3kqnzVEnKgBbm5WZUyG2Y4RmhfJh8wysV8j8to9Ol
         nXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686572722; x=1689164722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihV2ctrJcHdhqHxaZ+65XW/djQqj6uqyI3HubS8KBYU=;
        b=FLNdZKr7T7KQkcdLXmWsT+nTTuz1tlJ7N2GMzIX+sWjF90NTSKhzhRdzPdhis5Q9hO
         qoF5k7EoizU+uJUR/sm3VN0vpUVM7OOLcYGcPneI3k0EUiObqgdEhhAtOaCR4ookVJSG
         m/n7sPdRmgTDfOalG5IGz39xDk2vh1kEaaStJra4pltX14zxgRSlBXfknGOjEbtCRtLc
         JNqpIE+mA8AkHM55qAwflFUTntf4LbK5zUR/tLRAUd4+8xr3K4UZBV7nXv4o9gYT0Rjm
         ws0INT5vMWehk5FA21waKYNytZ2lMEmHnIQJabAJUCz51sEcUSX7H2k7TycQVw2HVs8u
         /ZzA==
X-Gm-Message-State: AC+VfDyd3kXKnGP0w4CW+bEjOxAwMAEuMC940I++xOe8rBAB3coLdUZJ
        WH6YSy88v7J2MGhXCQDsyfCRDg==
X-Google-Smtp-Source: ACHHUZ7l6k583DN8BbQstkqXnXa6Ohz5ZXDyC1nlKR+TLL00Vm+aMnfMW8K8L92XqlU96iWsd/iqZA==
X-Received: by 2002:a2e:9054:0:b0:2b1:c1b2:e2ef with SMTP id n20-20020a2e9054000000b002b1c1b2e2efmr2464896ljg.51.1686572722142;
        Mon, 12 Jun 2023 05:25:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id h8-20020a2e3a08000000b002b200d9838bsm1676414lja.104.2023.06.12.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:25:21 -0700 (PDT)
Message-ID: <a5b60b73-a3e4-e648-064d-25e95ae2cb69@linaro.org>
Date:   Mon, 12 Jun 2023 14:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8996: Use read-only RCG ops for RPM
 bus clocks
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
 <20230612-topic-rcg2_ro-v1-2-e7d824aeb628@linaro.org>
 <ZIbw0dEdFNFcC0Hr@gerhold.net>
 <8196144d-6cf1-897c-2520-3686e6414abb@linaro.org>
 <ZIcOS2o0l72R3lbt@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZIcOS2o0l72R3lbt@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 12.06.2023 14:23, Stephan Gerhold wrote:
> On Mon, Jun 12, 2023 at 01:46:26PM +0200, Konrad Dybcio wrote:
>> On 12.06.2023 12:17, Stephan Gerhold wrote:
>>> On Mon, Jun 12, 2023 at 11:22:48AM +0200, Konrad Dybcio wrote:
>>>> The config/periph/system NoC clocks are wholly controlled by the
>>>> RPM firmware and Linux should never ever alter their configuration.
>>>>
>>>> Switch them over to read-only ops to avoid that.
>>>>
>>>> Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>  drivers/clk/qcom/gcc-msm8996.c | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
>>>> index 5e44d1bcca9e..588e3b67657a 100644
>>>> --- a/drivers/clk/qcom/gcc-msm8996.c
>>>> +++ b/drivers/clk/qcom/gcc-msm8996.c
>>>> @@ -264,7 +264,7 @@ static struct clk_rcg2 system_noc_clk_src = {
>>>>  		.name = "system_noc_clk_src",
>>>>  		.parent_data = gcc_xo_gpll0_gpll0_early_div,
>>>>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>>>> -		.ops = &clk_rcg2_ops,
>>>> +		.ops = &clk_rcg2_ro_ops,
>>>>  	},
>>>>  };
>>>>  
>>>> @@ -284,7 +284,7 @@ static struct clk_rcg2 config_noc_clk_src = {
>>>>  		.name = "config_noc_clk_src",
>>>>  		.parent_data = gcc_xo_gpll0,
>>>>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>>> -		.ops = &clk_rcg2_ops,
>>>> +		.ops = &clk_rcg2_ro_ops,
>>>>  	},
>>>>  };
>>>>  
>>>> @@ -306,7 +306,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
>>>>  		.name = "periph_noc_clk_src",
>>>>  		.parent_data = gcc_xo_gpll0,
>>>>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>>> -		.ops = &clk_rcg2_ops,
>>>> +		.ops = &clk_rcg2_ro_ops,
>>>>  	},
>>>>  };
>>>>  
>>>
>>> If the rcg is read-only then it shouldn't need a .freq_tbl (the
>>> .recalc_rate() works without it). These clocks have one for some reason.
>> .get_parent needs it
>>
> 
> Hm? .get_parent uses the ->parent_map but not the ->freq_tbl as far as I
> can see. :)
Brainfart. I think the ftbls can be removed.

Konrad
> 
> Stephan
