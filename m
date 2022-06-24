Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7999ECCA47E
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 15:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiFXP4b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 11:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiFXP4a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 11:56:30 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6674451319
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 08:56:29 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u12so5553776eja.8
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AaFxO9SuZohGHBEsd2J56jr4tSjiHPXK/R2ry2JENjE=;
        b=vt6cyA7dGTtFmHXywId9KEZiBRu6Tc7UXnMPSE3k9tp0QmTLM0Zm7Q1/W+yW5z5iHI
         UhAZAFEzNPHhMYZDTrldas64A5d8Pq535Pig4Kevogv4dS5TK7DXCo4xSJeil2HX0O2N
         P64wZoeDttkYWQWrIC0SFruLZeU376vYdvkwxyDvOuDZephiy8oXrxN7z2QH7vtZRVXG
         pEPXdxR1y06sW8nfc1hE9/I74Ot+JkrJad0cgwOC+UAaiH6dkdZkT5lWwb37CVYn9Lre
         Xygqkv1I+vg6bGZe3THe9nDTipv9cc3fPfGn74Njmj2zL/QT0rcSA8qnme8cSt1t9TWl
         UwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AaFxO9SuZohGHBEsd2J56jr4tSjiHPXK/R2ry2JENjE=;
        b=nA6UI9BWtByHiByx5udSaJMfD2oSVkrN1NPCL8A313U/9LaPp75b/MqlHlBtG/1MC/
         GU4/Ut+0UMyD2/SGxPSCg6GaXReaW3v7TS/mLKqdj0QWthMa9iRYcfXAwPme0fWrWJSc
         9K+jj0AVrIO6aBhD9k+TrEMpuI7UoDqByflnfzq4NOukWnpK/qFWtLZ/Mr/eytDNcUNE
         qrBTeroo4AGhvETBbwN6hMOkOJ3/9yB4dTRRS9QwLs6y+U2btQSfUXQJ/gu2C9GTlGjd
         60L5kkaJOGtcFRhRH+tE3mU+B0M9YBLvPui438Tx6oahNWNpfExeaB18z2CuUMOuN6Ar
         GwQw==
X-Gm-Message-State: AJIora8l62kdKMF31OBj56d70qUgf3v8A1EmO+EKP+ny8df5EoDX8Mvb
        cBONBti+LZE3/tgUhHtckntBHg==
X-Google-Smtp-Source: AGRyM1v5SgKoPUxGG1PM7JZa1kZuMlcddv1KTTToFLgBec5fNAIFK4ZKiqhHNoQFo6VQLdoUZtzMGg==
X-Received: by 2002:a17:906:530b:b0:722:e9ad:e90 with SMTP id h11-20020a170906530b00b00722e9ad0e90mr14288881ejo.676.1656086187984;
        Fri, 24 Jun 2022 08:56:27 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id kj20-20020a170907765400b00722dac96232sm1319451ejc.126.2022.06.24.08.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 08:56:27 -0700 (PDT)
Message-ID: <cfed6d9f-3200-424a-0fa6-5c1de1f7fd1a@linaro.org>
Date:   Fri, 24 Jun 2022 17:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/15] dt-bindings: clocks: qcom,gcc-apq8064: define
 clocks/-names properties
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
 <20220623120418.250589-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623120418.250589-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/06/2022 14:04, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the GCC device node to be
> used on MSM8960/APQ8064 platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
