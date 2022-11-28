Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7097C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 28 Nov 2022 21:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbiK1V0e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Nov 2022 16:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbiK1V0c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Nov 2022 16:26:32 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C615D26555
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 13:26:30 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id x6so506145lji.10
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 13:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqF/vPvGSRlnkNfRE7ZwgV461GzDRthCdVTW17k8+Mw=;
        b=mFVndKxRlcrXGjtS8xbEr3frusXRA87L62kMxR0t4bAP32KtgWOXjO4s8yB66IohOZ
         IaGKC4ygwy7PubIVkQrFRPOGl1mNVuPGGE37Hue2/7cK8QS6dDHyclrpFJPRffunpmYO
         UgnKNq92E7j8VltxxbCJgHfrSkqwLqmZorHeFkhJH0Qn8zjdVJS7FyGqXD4qvEiwqyuO
         TrGp01tdnnIxjFDJi79+neICv6z613z9QCA8MuvzYDCfgc0LuOmkidnpKnK/MdlTcFFy
         lzbdSnrS7wcLxRvXMCwZO4QRnoa/mfoQWBKrHGPYDiHf1M4glbL9IUJCQ0p8C84i28bW
         R+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqF/vPvGSRlnkNfRE7ZwgV461GzDRthCdVTW17k8+Mw=;
        b=Fk2pLnj6YjRei+Nh7YPzqazWF1hHMfh6II5Icrdlg8dPKXvXNNArxNi/vtzEvMbYXu
         K7VCDBRPWsZW7zkn17QpnHDQSIOtTraBDt8B0uqCvDSCvbAMTtnV+wsdCU69ssjrPPYu
         ozoCqQZ+Bo7vVJi/Pkthdmehhg5Wm9y5wnRk4IHoQHdviaz7M4YTxpx2SrMjYFmVhI0z
         LB36JvVWeUSfLcuzOrxoae5BKj1a5vEdOhlhpdULYDmMc5axk4SHOzgAG/zPuP4c0Ck2
         /zPXlWuMWgJof5igSHGaZznwzFUs+l5podeTPG9kneigBpwBDJL6Vr5XKljwcudkT0dV
         LQrg==
X-Gm-Message-State: ANoB5pmr8yxl92WIVuF3953SVq/EwFw2KZtFnUdP7EqQmplC7wDG3A3I
        sviuGUTL900KhmmwTojD+KVrvQ==
X-Google-Smtp-Source: AA0mqf7vdeGSIbvyyOexOobx6plSnYLm1oLzAIJDc/j+i13vpXyW0KfgLOM1Pn5yGdLNZjLAjsK0cw==
X-Received: by 2002:a2e:b80c:0:b0:279:78b7:fbed with SMTP id u12-20020a2eb80c000000b0027978b7fbedmr9025436ljo.308.1669670788999;
        Mon, 28 Nov 2022 13:26:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a194f52000000b00494643db68fsm1877720lfk.81.2022.11.28.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 13:26:28 -0800 (PST)
Message-ID: <94e94d0d-c786-accc-089e-e7aa56331b2f@linaro.org>
Date:   Mon, 28 Nov 2022 22:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/9] dt-bindings: clock: Add SM8550 TCSR CC clocks
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221128122820.798610-1-abel.vesa@linaro.org>
 <20221128122820.798610-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128122820.798610-3-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/11/2022 13:28, Abel Vesa wrote:
> Add bindings documentation for clock TCSR driver on SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> 
> Changes since v2:
>  * dropped the allOf clause
>  * changed comments in bindings header to mention TCSR CC clocks
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

