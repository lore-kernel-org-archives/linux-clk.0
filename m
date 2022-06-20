Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A18CCA479
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 08:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237310AbiFTI0q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 04:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238635AbiFTI0l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 04:26:41 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029AD12772
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:26:40 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id fd6so11272751edb.5
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gYcJsXbtPe6Q4z2hXl+LOz24b35LyYtN2cxYQ4ReWvE=;
        b=WvfiBerB2IA7VNRquJT6usEMj8OQGX7kp7+2ts7eKakktFr+bRs4aXDPCDEcPe1esr
         4jYVZizxFGykJ2pt3UAfiRmcRAJpYeUtxmd8TE+kgTsO3Jr0NwQrLs8La27jwG//efrA
         ykR7LJeCb/8PrBs341ZzTwzhA+GZHGB/5EC73Te4Kjah6wEus0rLqaRSbCDHpxVGGxu2
         8QE2oznKGBKus/EOx/mMHqQw7yvHrF5g1Crn1hL3EHlTH463yzF/rHzV+lOU87SiUrTQ
         2iwDsNWKS/IhRPUXvC6uN/Us16RYR31X4nf2BuLC2t1ncbMAbxApPdj5ZkHLu4WZhYro
         +NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gYcJsXbtPe6Q4z2hXl+LOz24b35LyYtN2cxYQ4ReWvE=;
        b=ZmULAGjsmbA2v6luXaJenns38qgWKzFwZzifQPSxiAXMH+uqvcKJO/7MkscaTtLUj3
         Dv/yVp0b+QMF+qJ2Vq+7V+ANUSQNOaxABi1XuOCNpHbZTDxn3HmUR/xd/BO4cfXthYVc
         ad2Wua1PwaJCnIEFsvEiR2nIH77s8dePg8H+AGCawp9wSAR7xY978GOHXMQIztbek5qi
         3OnLNuWgo0notNZANmUzUPH7a6puscfOVYE0kFLKb/GjyC1ZvCFwlqNx9G4aUKzpYkRM
         TuAjc54Kfwm4BzxPjnfujKMH73waFKYQQQLfhjXv7/TikTmuORm3mT2OUjDBfQFjxBT+
         8R6A==
X-Gm-Message-State: AJIora9c0g8neOZ66sTbwe7RiL5qBFKift8Z87ZMtiump6XBYpKVqpz/
        SzHRwGN+S+BSgQ1/lfNBTM33oA==
X-Google-Smtp-Source: AGRyM1vVfYItng0TrV1J56CleF0CESEd9s+Dap+GJz+/bi1koCvGM+SNOLDZS+2b7m9hb8OtYM1oRA==
X-Received: by 2002:a05:6402:3807:b0:435:20fb:318d with SMTP id es7-20020a056402380700b0043520fb318dmr28306542edb.272.1655713598651;
        Mon, 20 Jun 2022 01:26:38 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906924a00b006ff045d7c9bsm5598629ejx.173.2022.06.20.01.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:26:38 -0700 (PDT)
Message-ID: <0a1315f2-2b19-6c1f-a746-79d197ad67a5@linaro.org>
Date:   Mon, 20 Jun 2022 10:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 18/18] arm64: defconfig: Add Nuvoton NPCM family
 support
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220619151225.209029-1-tmaimon77@gmail.com>
 <20220619151225.209029-19-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220619151225.209029-19-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/06/2022 17:12, Tomer Maimon wrote:
> Enable basic drivers for NPCM8XX booting up support: Architecture, Clock,
> and WD.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
