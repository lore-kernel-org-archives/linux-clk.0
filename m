Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C59C00140
	for <linux-clk@archiver.kernel.org>; Wed, 24 Aug 2022 13:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237823AbiHXNhM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Aug 2022 09:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237449AbiHXNhL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Aug 2022 09:37:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB1B7D7A8
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2022 06:37:09 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id m3so18348452lfg.10
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2022 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3OQC25wWN31BCwSbCduRMMv4rNNc0uP1j1+GX/KbrNs=;
        b=wpEQNzNKOT3YdGIQFc9W5b5/EtVd8HmW0cSRtQ3McUNiI5LisGZjuU2uYAt2mKyQru
         AzMBKiyOgm8/Q3bG8aYCqcpFdm9vkK4P3WehHpgPTlCHqL6yuPNdZVF7C8uNWKCYlINn
         6+qUm2A6XD3U7BSDZ7Ou+pQ8uFQLnxaZ5xpm7Af3Es0Vkr2Ay4dmtnUkOdN3jXejV+nJ
         1k89Tr5XCrXGp0N2FYyKADU9eQnhR3PcvV86MxfyI/Vz5kstDIweKPpOOTfzTbuVb95p
         lpdUqQgEUOyHo3dBPAZfOOtruz07kPs1C7CdeE84Tq1nMu3TA4KnPpmaOAvqPJhPhf8v
         F8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3OQC25wWN31BCwSbCduRMMv4rNNc0uP1j1+GX/KbrNs=;
        b=nvTRXg42czlCW7dlfAIBlzAceRrqSv+nABiyolXgsYfV1rRuZyJRn4znA0abdYI465
         drQVLVfK1w/tu80TebESX9qKqkmeLpown3A4PDRtYJ+2PD2OYHr0wmNqSMXzH7pOJByB
         cmVaLaWTmauajlKjeY/btAGaMIDz0uvQ9d8YaWCc+HH0Bkzpcka5TJbxBRyggQQA0q4Y
         IrsHJoJiffgXg8gvQ5juigtangpWxiVl0cVCal6EZZnRucd66ii5OOdR22jBoSSe6Onm
         F0nEAKD+BEwiCLYhyxEiBW90X6Wgb/fRewbHO3SFJNNiPHZv5LP8gXmAnL+MZ1/iTUBs
         r+Rg==
X-Gm-Message-State: ACgBeo1mAcwZnoizSULea7o8pjbUs9KN1TIpRuayCSeajJKk0HO609TS
        ZUdbdkLHddYkdkez0rawUKBjBQ==
X-Google-Smtp-Source: AA6agR5mW8yFmhKsYKo2N4/NXGAdRcP64LGKPZsWPykSgeE9dIVxYgh3zulrgO870O0ziP3kisYhfg==
X-Received: by 2002:a05:6512:2385:b0:492:e4cc:17ca with SMTP id c5-20020a056512238500b00492e4cc17camr5102483lfv.132.1661348227725;
        Wed, 24 Aug 2022 06:37:07 -0700 (PDT)
Received: from [10.243.4.185] ([194.204.13.210])
        by smtp.gmail.com with ESMTPSA id t17-20020a2e9c51000000b0025e4c49969fsm108927ljj.98.2022.08.24.06.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:37:07 -0700 (PDT)
Message-ID: <c6826de7-591f-97f9-af44-35a6293d17ea@linaro.org>
Date:   Wed, 24 Aug 2022 16:37:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V4 1/6] dt-bindings: clock: meson: add S4 SoC PLL clock
 controller bindings
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220823022630.25007-1-yu.tu@amlogic.com>
 <20220823022630.25007-2-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823022630.25007-2-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/08/2022 05:26, Yu Tu wrote:
> Add the documentation to support Amlogic S4 SoC PLL clock driver and
> add S4 SoC PLL clock controller bindings.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
