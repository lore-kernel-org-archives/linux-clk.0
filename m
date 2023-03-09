Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFECC6FD19
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 00:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjCIAuD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 19:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjCIAuB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 19:50:01 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EAC85A7E
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 16:49:52 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id h3so193796lja.12
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 16:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678322991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZdsrXQuILZVbM+PO2HnaRco8fXPvsQFyErw7V7TKswk=;
        b=k5FLjKREdng28mdaHh/8TYp1Ag3SD/wwiwELNoVmQiZpDdv926s54niu8N+RJezqFB
         NlmH7Mt6lc1vJVLpkqEqieE4fQsOHAITvfPlx5LWVXunDp02x6kUlgGrku819O7lA0Yx
         XgMmsLLsg0tRkiOZV2kSUwfS+4bCzU/njrpjI8lDlIhRVVArgNVPOaqIDwE6/siTCGFh
         KeSpfhGDSC2eSzLHOTCXg0qyU2LKNV375IKp1OmF/ZVEqNcoF0/E5vHcWofvbNabJBxv
         Er/3Ez7ixGFhF+in/vICjZF8OyExbF4++P0KF2C+hiIo4HNKSnO2+WKd6stM2unddMYZ
         LozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678322991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdsrXQuILZVbM+PO2HnaRco8fXPvsQFyErw7V7TKswk=;
        b=uhPAj/b4CLBxBWH12w62Z1l3sok58qvXxvufheYx2WIJWKrK2JegRxItHq1+H6EY2p
         J84BBco32qS+HDAFresh7UakqrDgbVnpBN4ArRyjiSP9rfpVIvu5vk5npbxEo1p8N+Sk
         Io3YbUujQTbvEBGcTvwe/cElbtpyRCobo/5wcMbvQm+87ovgBKrr3Zx+fNEcpejlGz19
         6iqSGyYx8SdNh/rVfrZA4uEVTrs9x7u74L6NDiqkO+J7R+Nt3/zykS57t3FE/fg/Dopx
         QX0vnI9aH4rGc8ng0Sqv9PNbgx7Z46IxSoiRzAo5E1OrGpdyA2DGiGey011fzvORxAXV
         3k1Q==
X-Gm-Message-State: AO0yUKXGBExSrPWy0HqDwLLLNiiH4EwbQ6OP5xE9mmF50+cQoc80czBd
        x1n8eWkffJZeoH8WDuGvC+qu3oTvWegZ+pnKQQk=
X-Google-Smtp-Source: AK7set8JgS6tTkWmMj1bgVFqHmlRMeMNQt1k0gmvM4fo4jvythOs74W+lFz/VqpXgWDr4YtrleBgZg==
X-Received: by 2002:a2e:a0c9:0:b0:295:b417:150a with SMTP id f9-20020a2ea0c9000000b00295b417150amr5577910ljm.11.1678322990909;
        Wed, 08 Mar 2023 16:49:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m8-20020a2e8708000000b00295d62f0a0fsm2738145lji.122.2023.03.08.16.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:49:50 -0800 (PST)
Message-ID: <b241c89f-0263-a1f8-0f86-952b163e141d@linaro.org>
Date:   Thu, 9 Mar 2023 02:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 06/14] clk: qcom: smd-rpm: Make BI_TCXO_AO critical
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
 <20230303-topic-rpmcc_sleep-v2-6-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-6-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> We should never let go of the active-only XO vote, as otherwise the
> RPM may decide that there are no online users and it can be shut down,
> resulting in a total, uncontrolled system collapse.
> 
> Guarantee this through adding the CLK_IS_CRITICAL flag.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

