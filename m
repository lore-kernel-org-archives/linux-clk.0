Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE75EB64DD
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jul 2023 06:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjGEG1O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jul 2023 02:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjGEG1N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jul 2023 02:27:13 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D8F10CF
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 23:27:12 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-991f956fb5aso611326866b.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688538431; x=1691130431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWMLJagL2+zk2i2GBf2yDl1/DHyLFspRTfvbcgg1QfU=;
        b=utB3kWgihnetwAPSEidxUjsfhoMA0hNBtnsHu8/372Rs3/YJr1wcCawJMdJS4SHkhU
         PRpSx0P3yVV1PAUCUv3vrvUhKwqJ3KU8b02qD82RIXORc+g8tHt/CqjQ26DupioKpAsD
         UqaecJoMyJ+vix452drJNpsk/CJPuQ2DkmBiyLW+vLW/jWfxgAck6KsghNMGL48j7a1Y
         1e7RLWjRfu53hu/2Fu1ryp01SjX1oj8caBoCennZI0RIfQhFxyfO4lL4RDAR+RgWWLU5
         ix0VA3jQM1hajCQxKk9/imIXnSRSx6xHn8DO573QchLNC4j3o+YCTgWfqp7I3M6RTTNp
         84pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688538431; x=1691130431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWMLJagL2+zk2i2GBf2yDl1/DHyLFspRTfvbcgg1QfU=;
        b=hY5De1c5PfiSs9OavEayEgMGOlJsBm2uMO2s9Gqs6UMgL37S8zCYOi51Caprfxe8ac
         TVaWqptPq7j0TNbyTENHvRLbj9isxLP4arnUoYXSdVbnYZMPrCbYD4nQ+9E1RLIL0LA6
         Eu++O+jEOgdySWtN9eIu+u1yKEF9up3BsNKetKR2ChHJVBCQqdLgBfkPp06N+tb5gMtX
         SNU2178eFs/ViVaOhnpbAsED98MZIYqWcSGpZqs7pd/No0Z16ZWsRZLA2tUYo2fsjecM
         K8Q46KL7x9iicpoeYxbb5TsLYWsqlYeHb/TUvTF2Cf76OmEe9TrT5hjvzx8yDOPbAA5I
         Rpxw==
X-Gm-Message-State: ABy/qLZ9qER3y0+IjGAoNIuP99jFjteqI1XGIcss69sv7rDRUHYPhjGy
        0bC4BAmpGPPA6FOOhyiGZaGPuw==
X-Google-Smtp-Source: APBJJlFDD3LoaJkWiKAi3c5P1svDd86EsaEHQLS373mb2GLHBrmie9T8qSarWyPJmQHFFxBuwlgwxg==
X-Received: by 2002:a17:906:5f91:b0:992:1233:9c45 with SMTP id a17-20020a1709065f9100b0099212339c45mr10047072eju.69.1688538430911;
        Tue, 04 Jul 2023 23:27:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906191200b009930c80b87csm6119058eje.142.2023.07.04.23.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:27:10 -0700 (PDT)
Message-ID: <913206a5-3ce2-3ce1-774e-3a4a9030b0e2@linaro.org>
Date:   Wed, 5 Jul 2023 08:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 0/7] Add PLL clocks driver and syscon for
 StarFive JH7110 SoC
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/07/2023 08:46, Xingyu Wu wrote:
> [Resending because it has a error about examples in syscon bingdings
> and has to be fixed.]

Resending means you sent the same version. If you did not change
anything, then it will fail, right? If you changed something, it is new
version.

Best regards,
Krzysztof

