Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707B2C6379F
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 11:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbjBULZr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 06:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233557AbjBULZq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 06:25:46 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6711024488
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 03:25:45 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id ee7so698076edb.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 03:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GS/FuJCPhQ1uOLyGjkR0iAM8SEKwfPpWzwME5MLPJhM=;
        b=e7Loni/yJXd48Da9Dl6Q0CN99QB8bdYlsJD9tqOTTTgROY9tjFa+mhRq4YeAqspbmh
         1UcUCGn9b283dP37/+guJd1qaK1O+5ojvaIHvB4vIL3rK2Rc0fdR3rblSSO+BTAvv8Zc
         dFoTk/29lWYc+RuNNuJzSoYizvCuYLZMg7EehNrJXDD0Vb3mk52amkM5DbQsUkrYI3Wh
         TpJNHS8s1EQEo0vhBvuuVDguD46CYhOnQ3fj5/ReU4+7VgKymiF5PSe2YkuC/vVdGBfA
         9/BtrpQQZ9TutamhoSH6bn2CqdHy3FR+1pIp3tfsBxw1gkqyu5DAsTN4MqONTlmaBjhZ
         f0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GS/FuJCPhQ1uOLyGjkR0iAM8SEKwfPpWzwME5MLPJhM=;
        b=pwsur4F9p+Q5jppXpRTlT0JadI+eih2TDsXx//8Q+Ii+TM6mPyjF87Ii2a1cxqG/dG
         Ev+c4Dm6KyDRLQsaymBEAnAHigNHERFl+p/MYcFsZL/wsLjyO4hgQdLZUV357PHRyZug
         o/mGgohIyaiRp/wis5Bcgk1CmPJTeKfQDHx9fDsFRKusKSrxQRvQ18avISKGzpF9PgAU
         blh8XE+vMTgPn+qriQC4sQQgQaNpbm8cG0ccgDNjXUxXijj8CQbFJz2IAIjcV8EsMNcl
         Nh1afgwTKid7L/D9/0OTFlDeuYi1NbOj2lvP2yeCu9h7CshDQ+Rl4X74IfDnrf0Uh6/P
         A1Xw==
X-Gm-Message-State: AO0yUKUC7LmpoHc5VSZ4k0CYI36FAuq7Rjz/dzyDlbHB5qahm5XIQWKw
        yf6VZCAqt+ZWORMGdEKTRtXrNQ==
X-Google-Smtp-Source: AK7set9i7iCdrmNLxS44tLm4Cod1bYIxstYUo7G3Yv7gMOYC2J4cFKB4FWle3mr9SoLL129HeBZZlg==
X-Received: by 2002:a50:ee01:0:b0:4ae:eb0f:892e with SMTP id g1-20020a50ee01000000b004aeeb0f892emr4242179eds.20.1676978743932;
        Tue, 21 Feb 2023 03:25:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t10-20020a50c24a000000b004aeeb476c5bsm2040071edf.24.2023.02.21.03.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:25:43 -0800 (PST)
Message-ID: <430318ed-5b30-e549-a5ce-df83aa18adf9@linaro.org>
Date:   Tue, 21 Feb 2023 12:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: Add StarFive JH7110
 System-Top-Group clock and reset generator
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>
Cc:     Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-2-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221083323.302471-2-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 09:33, Xingyu Wu wrote:
> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>


> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93eb504c3b21..2e70c9f21989 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19914,6 +19914,7 @@ F:	arch/riscv/boot/dts/starfive/
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>
> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>

No improvements here. You add here new bindings for one device and then
- without explanation - add yourself to all Starfive clock bindings.
Either explain it or drop it or move it to separate patch.

You already got comment for this.

Best regards,
Krzysztof

