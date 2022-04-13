Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3822BC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Apr 2022 06:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiDMGhO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Apr 2022 02:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbiDMGhN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Apr 2022 02:37:13 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD38340ED
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 23:34:53 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id s18so1979830ejr.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 23:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nAPSfxKFYbzSlQO1YgmCxQ11Ae6mhy3WoT1oFUto02E=;
        b=RFWwQzYacEUTTEqQGLsxA+Ud2lCdgCrY7vAxhwUMips25Af2dKt7eHuQauLyJdjHoX
         GTLKHoVca0RR950GmW8xn6mawSbhjN8upfn9zZ2exmWHCB0LPDly8eCPFJb+aIrvgURQ
         yA2EKyGs0PZe4SqLunDsRHKhPIOVFxSMg3xwk4SanOhs/DpBq/Yo0ylYzeZlqYhH52Xt
         VeM1Iu42qbYn5wODPdPNG4UGz2LzR1cPrZ85TEmFP4kyXtfjz/Wb05Ub6SjHTIMY8/jL
         e11bMBokHphVpsZ1fpqmmWm2rM2Z+3l6YsghGWPjDU4c/hafwm01Ozs47OHDGocZtpRO
         aEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nAPSfxKFYbzSlQO1YgmCxQ11Ae6mhy3WoT1oFUto02E=;
        b=3ioPBQth7acWTNixT5kYf799JO6yDN244IiYJsFUae+D4ITxFRz6qn/AhtM8iYfCOo
         Vyn0oQ2vqeX4XD6iWDMf5VPPgT9oxF9HUZod/1mXBn7czQZbEA3M9D7+j8T+F2hhW/Ou
         ipBY7se9anrodjSmNad5cQH/gVu94HCLAoHzKYtXET4W7fcLPOoOr2E8ytaHMpEDNLmL
         ZGZ88rkwSI2bg3j91dw/BM8/PXM2uL+O2UwROcutPJtsha7AC1ljf60TK260KCtrlP24
         MaWc91l5NLgtuikWuComCXeqhfI3pD0CbzDiy8bl3q7/G+AskOh4sWpdCLqbP5lqpV88
         r7cg==
X-Gm-Message-State: AOAM532sohWeMj4jDW6TH8xKhLzVNmElIMfwiAHe5E1+HjSXqysel3Pm
        ap+RR5dYh7l5su+NIjoe6xvHJQ==
X-Google-Smtp-Source: ABdhPJynIlqHTeT1hdcAvchmiziaZoMNQ8KGtRyiEG/USlc3UYYKVDAJtNMx6VbGdIDKLlHGckY+pA==
X-Received: by 2002:a17:907:3d8b:b0:6e8:73e0:ef96 with SMTP id he11-20020a1709073d8b00b006e873e0ef96mr16437593ejc.330.1649831691906;
        Tue, 12 Apr 2022 23:34:51 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id s12-20020a508dcc000000b0041d807a04aesm794933edh.29.2022.04.12.23.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 23:34:51 -0700 (PDT)
Message-ID: <d3828250-70b2-ca8e-eaa9-0d49736321ba@linaro.org>
Date:   Wed, 13 Apr 2022 08:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v13 1/9] dt-bindings: arm: sunplus: Add bindings for
 Sunplus SP7021 SoC boards
Content-Language: en-US
To:     Qin Jian <qinjian@cqplus1.com>
Cc:     robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        tglx@linutronix.de, maz@kernel.org, p.zabel@pengutronix.de,
        linux@armlinux.org.uk, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <cover.1649659095.git.qinjian@cqplus1.com>
 <15b487f197129c8fe382ea7e70e6420f31924e28.1649659095.git.qinjian@cqplus1.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <15b487f197129c8fe382ea7e70e6420f31924e28.1649659095.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/04/2022 08:49, Qin Jian wrote:
> This introduces bindings for boards based Sunplus SP7021 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

This email bounces, so let's update to:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
