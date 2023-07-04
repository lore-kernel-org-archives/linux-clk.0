Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24F7EB64D9
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jul 2023 06:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjGDGad (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jul 2023 02:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjGDGac (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 02:30:32 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108ADBB
        for <linux-clk@vger.kernel.org>; Mon,  3 Jul 2023 23:30:31 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so9235371a12.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Jul 2023 23:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688452229; x=1691044229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3yiVYKtVrIktx4ZXP2LxSktjdyjNOhoOg2Mns2klPY=;
        b=M6HUebP4sZYJ8sIy3Ulw8RejaiM+OUUBFDv0FnO16yEv5/tUV91WR4q1dWdzG/Bq/Y
         NlaQbI39uIzwqCfchN+Ff9c8SaNUWxjoL9ilI5LukBQBpVm8QJrEPn2FBPQe4cqbom0g
         fqknBmeYBapuhiWOH/4Yo6zBFNU0g1+9+bDRxpLdhCgFTCadvn0eVbLiwxh+Ep4TDZUt
         akG00H9lvXGVNRZ9trbrSY4qxK4jw6Utl/o9lCcromjvtwcaV7lG9WqZkfYkQhDS5YfG
         iy8vzgEF/QrxTFJ1mJGqyykCmjMxWPykEf/LuEqNLRD/68I8gr0gBMHRiugUdXjQ4roR
         19ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688452229; x=1691044229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g3yiVYKtVrIktx4ZXP2LxSktjdyjNOhoOg2Mns2klPY=;
        b=EhgrIgq9bPBatwVTlGqV6cgp7MWqHED0sG1jRIhSoUpYHrzqSj6grQCLjKbe/fuHzH
         cmrFzoveH4ULlzK/Vqj7nxONx4xqM7NI3k972jbfAZKdpe2eeEKWu9qqshT2kyzK4dko
         4pRzTo2aVHlAvKA9dEAzpy/K5QEhPk/Ii28mSJ4nQVmTiV+DnNo2wBNvgyb6dIwcgAnv
         pEm7frIxeJRsWZ8ulMx+l2WJvRItao1wZ5EZxCRU3d/3sfJ8R4+ih+Qrw/a3vqehAJ0P
         PW2yWWTtcrP3HTobHhxaeoj0LKMRzwyl9u7xkKIVy+eBUb8KjQR5brXdDNem8d8cuqbZ
         tNiA==
X-Gm-Message-State: ABy/qLYjVToV0UBLcrG1wpM7vRR/OhSCKO11Wgt0UD3ZOqTXG6pTlGQS
        X3CaB3HpXbElBa1GTylkRPQLCg==
X-Google-Smtp-Source: APBJJlHEb87nF2ukavgKodzV2jO99ruTM6e43xXxQc8WM7Dsu3Ys8LNXjWdApqFlzHUz/nR3g9drLQ==
X-Received: by 2002:a17:906:39da:b0:973:84b0:b077 with SMTP id i26-20020a17090639da00b0097384b0b077mr12490256eje.33.1688452229530;
        Mon, 03 Jul 2023 23:30:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a15-20020a170906468f00b00992b510089asm6496258ejr.84.2023.07.03.23.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 23:30:29 -0700 (PDT)
Message-ID: <c2edda13-c674-df56-d1a2-cb47b405b896@linaro.org>
Date:   Tue, 4 Jul 2023 08:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
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
References: <20230704020239.288500-1-xingyu.wu@starfivetech.com>
 <20230704020239.288500-3-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704020239.288500-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/07/2023 04:02, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

I don't think there is a point in reviewing bindings which were never
tested. I hope you agree with me.

The patch just introduces errors. :(

Best regards,
Krzysztof

