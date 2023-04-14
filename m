Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED09C77B6E
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 11:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbjDNLKf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 07:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjDNLK2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 07:10:28 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DE03591
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 04:10:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bi41so4773845lfb.7
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 04:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681470610; x=1684062610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6qjD+Up6L+JMY/0eNajeNEBrytDNBUpv2rGYTTiAX4=;
        b=kKFWuEpF/z33WJU7vRzWmLO1n6Q9hqKzY+H+2AvHVdml3L3fst6cCSBxrukwn5NXvu
         lgoSolOKqFsEO/Ye1r786TAgaSmJM5OofMVy7rHAGiF25LXb/KH/s4lZ7P8UIj1Vg34u
         8f11aqtmHXkADwWPPW3l+KtDok58qCWIrps1NGkbMJBwPeDMNqi/IcucxKd6r3rE2nNL
         +2HEM6gFtRqM+IZehcId4kfSe5kU3uPAPk7mog8Y/qruR3oq6UiDDnrkwtcDBn0pmK4M
         57Bv5Geq+cIpAoISQc/g6HAyGUwf9A4I6zBBG3V/+Yb0PxEYH9SMe6BFyPB5VG5C+xLo
         2z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681470610; x=1684062610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6qjD+Up6L+JMY/0eNajeNEBrytDNBUpv2rGYTTiAX4=;
        b=Z95NAKeSPV74zl/OvltElpk5f6BKcB/1Bxq95lKoyT5VQusfFBuCGJoufyiYeu9gWq
         kkLMtkWXu8djDwbG4RVVu6sc0/nVokLcXGpNK950HmaIBMxaoE88XXIRKG/SQroQHwJx
         25U005fOYnB+lc86fcxEVPjPRK2oxZ2Dc2CKHN124SwXZVdNue8rfw34AaTj0i3vTbM5
         PE/dL81WR2UGHhXV17FgxMmgvHhlNdL7hvjsgkcBhEgJpFThLcjplaDtb8fiHOsrXrJC
         3snSV1JT/YrY8yzoXduzOBTBi120OOPCcOKN4haxDT4w1c9IWCIBRDkun722j6ZIOsMA
         b5qQ==
X-Gm-Message-State: AAQBX9eKebagEWGJtw3jscELYHrDrvW/5QXCdyuIOIB/Alxq6mVjXa3F
        +htJBzSgbKjTBkiSrM/pOiGe7A==
X-Google-Smtp-Source: AKy350a+7AHnfr7APa7YzkjcxrXB9Smsk5ntYhgLy25d2zr/xium3SPgqTcHLgjKxq2jsOZu3yc2Qg==
X-Received: by 2002:ac2:4a6e:0:b0:4ec:846a:abef with SMTP id q14-20020ac24a6e000000b004ec846aabefmr1629027lfp.11.1681470610031;
        Fri, 14 Apr 2023 04:10:10 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id q5-20020ac24a65000000b004eae7890269sm749229lfp.138.2023.04.14.04.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 04:10:09 -0700 (PDT)
Message-ID: <7493c173-6693-f4d2-f658-196aa90a8db6@linaro.org>
Date:   Fri, 14 Apr 2023 13:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] clk: qcom: Introduce SM8350 VIDEOCC
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230413-topic-lahaina_vidcc-v1-0-134f9b22a5b3@linaro.org>
 <20230413-topic-lahaina_vidcc-v1-2-134f9b22a5b3@linaro.org>
 <20230414032726.ppssnbensuzcrjrm@ripper>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230414032726.ppssnbensuzcrjrm@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 14.04.2023 05:27, Bjorn Andersson wrote:
> On Thu, Apr 13, 2023 at 08:44:59PM +0200, Konrad Dybcio wrote:
>> diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
> [..]
>> +static struct clk_alpha_pll video_pll0 = {
>> +	.offset = 0x42c,
>> +	.vco_table = lucid_5lpe_vco,
>> +	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
>> +	.clkr = {
>> +		.hw.init = &(struct clk_init_data){
> 
> I know it's tiny, but please add a <space> between ) and { of these.
Sure!

> 
>> +			.name = "video_pll0",
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_lucid_5lpe_ops,
>> +		},
>> +	},
>> +};
> [..]
>> +
>> +static int __init video_cc_sm8350_init(void)
>> +{
>> +	return platform_driver_register(&video_cc_sm8350_driver);
>> +}
>> +subsys_initcall(video_cc_sm8350_init);
> 
> You don't need this at subsys_initcall(), please use
> module_platform_driver().
Right, we don't need to decode console boot logs..

Konrad
> 
> Thanks,
> Bjorn
