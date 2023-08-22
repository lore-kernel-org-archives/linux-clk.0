Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68019EE49A4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 16:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237821AbjHVQcK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 12:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237815AbjHVQcK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 12:32:10 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAC5193
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 09:32:08 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52a069edca6so3318397a12.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692721926; x=1693326726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3uQSylp0y7KOudR5yNt2H8UCOVpvtj04yDey4znHRLA=;
        b=e5CZu2+RpDcrjPEl8gmUFILhTTitUimNfzkLuXEk57VQEAR2kqg4fzp0GPXAj6oabp
         y/RseqyXDzppUaEiTL85pFDe1WvN3QJYyOeMFpclFRQ/AkswADsSbfon5WGJ33/DT18o
         KtT5l2KhvnfzIeAdB76PQW/Ov67hq+hLXRfBGw6HvcvdHYAYUVzlXBFPQtE3tso33cjb
         tsTACVCo49NMTag1NXI9lSVdEud/QGTchIkcgqlHbMsvvLlIAgDl/iLVO/BPrY8zjLfR
         GwEBlkmoJEdJ9K7LE4qGL/ApbUeXqvu65DKCENt2U+QuaxoILHikD32g8j3t1mGm4Btz
         eCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692721926; x=1693326726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uQSylp0y7KOudR5yNt2H8UCOVpvtj04yDey4znHRLA=;
        b=H/XCrOt2zabMj9AgKbbyS44JsJCFmsd7AkU8LxCEkuesMczRIwnRGKe4DCaDDsNkwD
         eYIXLZq7IDet2ydGSXC2zdrF18up83K9onIHWAgeVlB6g3xiYX12rA1tssFOV5uZt2V5
         XxTUXhSLS3e8esMUbmAL1btAFITcDz/pokSX9Dsv7Xt5EaFi8n4XArKNpA44fOUaY6PV
         hep4mgicTYlpNPCQM8UlMJMx5KwXaEGFvLVV7yV1tctikWr0J7ml7+PlyQd1cW8sXox1
         dgrmlU9ytqtwvp0KOiuZi/EocCQUcH28RgWlYy2Ko1COTSHLfn0bHB4hDYHNIJ3+zvDm
         1VHg==
X-Gm-Message-State: AOJu0YzACl/OF98dbO/Z9VVVmDEmcZnkzwFKa+U8D/SWSNx0REF2F/63
        dHMPF6u0lIzhYnc836lL2/hP4g==
X-Google-Smtp-Source: AGHT+IHY8roXOKlErN1u6cAk1xEiMD1JJ8eVAuVfBioslGRRaPmLvzi0W/JaIoSiX7eCI6hpEj0Ksg==
X-Received: by 2002:a17:906:cc16:b0:9a1:870e:cc9d with SMTP id ml22-20020a170906cc1600b009a1870ecc9dmr6733431ejb.18.1692721926631;
        Tue, 22 Aug 2023 09:32:06 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id x5-20020a170906148500b0098e42bef736sm8505501ejc.176.2023.08.22.09.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 09:32:06 -0700 (PDT)
Message-ID: <d2a6060a-c8a0-51c7-f621-1bed2c3074b4@linaro.org>
Date:   Tue, 22 Aug 2023 18:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V10 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230822082750.27633-1-yu.tu@amlogic.com>
 <20230822082750.27633-2-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822082750.27633-2-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/08/2023 10:27, Yu Tu wrote:
> Add the S4 PLL clock controller dt-bindings in the S4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>

Lovely. I sent youa  friendly reminder at v8 which turns our you
ignored. You keep ignoring, I will start ignoring as well from now on.

Best regards,
Krzysztof

