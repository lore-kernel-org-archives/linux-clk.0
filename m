Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012A8C742A7
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 01:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjCIBZg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 20:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjCIBZc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 20:25:32 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402EA90086
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 17:25:27 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id s20so329076lfb.11
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 17:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678325125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqq4VEw4gc/dtr1bOgTdIY1FDWwPC01i6JuhT66K9Gs=;
        b=WAsVz6H63rIudTmBhP8WrhBoyhPjw/4TCp6wfRCWAdEQ8gFpdr5ex4Y9/CIq0nG/kz
         9fHkU9KsFJluewVg0Z32oudvSsBcxMcycJYyRfnwsWL3g6NtOolTl4+hG1Wnf65OwyIc
         vY3+RD8LuJkCpCTT/dqWRGbZ72TyvXZFGaksH034CqU3CyfeMQsDgYn6HLbPxliIwIdq
         ij6RYhnFWeq0uZ38VbRpNOYvq7N8Xt+qGQkYWECrFW3Ao/OA5vn7krtOKJ6aVWx6OL2T
         6osopRW55lUYM59Y5TmbST5DMNkBcsBZXOcu8z3CsoOIujpfOaTwx6u169Y+aoqeqb1s
         wKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678325125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqq4VEw4gc/dtr1bOgTdIY1FDWwPC01i6JuhT66K9Gs=;
        b=zPBMS659+lPZL5luwiX42kG/W4t//Z02A49epFfbmpQ7ah3urLwb8ijJHHwrAGbP4R
         gfabU7VKSCyma53dmmZq03IQYmtlIS1mqEoYXqOpUCo816sCIBOJnDaCiDXag7WpOl+4
         W3b5fOVqrvyGUp4r7n8Fd35zrTGsw0FrGH3ADWpFjeJQ50DePmjk9iO3E7q7fWjaBkjY
         agF41lnvcYwOp5E1RazvoD3jP8wVKrdXdszyhog8AOcwXkderAKfkk7GSwcQSNRKHhYh
         PnAqINNQ9a/fCr5/hftQuHzEpnjYR1QJFtEVf9XULIHR6O9bpViZ9uzeDgjo61xCWMR2
         4ung==
X-Gm-Message-State: AO0yUKUGqK+M2u6T2r1efJXEqCmPaZfn5YMzV9I5K0c3tSkvSOv9fNh8
        s0945+WiyrmQ2LPIYuR+8YOkvw==
X-Google-Smtp-Source: AK7set8IXnMjaPGHtH44O0AdjtLFWMJyDdhixh/ZWQXBS3NB2lcGP2OxccgWsKunXUZhKrMh8b+MJQ==
X-Received: by 2002:a19:ae13:0:b0:4e1:13fa:bf07 with SMTP id f19-20020a19ae13000000b004e113fabf07mr6084681lfc.43.1678325125441;
        Wed, 08 Mar 2023 17:25:25 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a28-20020a05651c031c00b002934b5657f2sm2754672ljp.29.2023.03.08.17.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 17:25:24 -0800 (PST)
Message-ID: <6bccbd03-68c8-e9e0-1a12-595391246ae8@linaro.org>
Date:   Thu, 9 Mar 2023 03:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 12/14] clk: qcom: smd-rpm: Hook up CNoC_1 and
 SNoC_2 keep_alive
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-12-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-12-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> 4 of our 18 supported platforms need an active keepalive vote on
> CNoC_1 and SNoC_2 so as not to cause havoc on the entire SoC.
> Guarantee that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

