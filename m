Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A58BC61DA3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 11:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbjBUL1j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 06:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233590AbjBUL1i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 06:27:38 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4375A24111
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 03:27:13 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id g1so15542043edz.7
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 03:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ETq34b+8/4BiKKBj54uxKBTL+zouxa+WZyrIv2vhc4=;
        b=d7lROgunoVvoE0v+39bzYr3dX2eNRLypRPfua5vQqf0uyVkgiCHdKSgSwmSjjfST/f
         ne4omh5LS9UUUR4zoZdD7GtghFwntlo9r4ZRdXIihSRm1kwSb204j8gVsL9hDoS19hDx
         QqJ/d95Uqho7+SfE6n45R8/acVE5V409dNsYTV5GsEklz89eSbcP9oxprDB3uPpFOskd
         inLd4wP2b8jZybpFN3OHXbuyYgmM8PU1s2tXuRRVCIrWN3QWLbl1lWV3lO533/SkroGK
         kQSLyhXqNVUvYhOcF6kqSY4zlLss5ck/8lwRRDTwXlt9DU9fKcnvWDfdQ6qv0xhA7JBj
         ruxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ETq34b+8/4BiKKBj54uxKBTL+zouxa+WZyrIv2vhc4=;
        b=LbEeJJ0oaAUTaF+8dXoi2Hjop1HycOG7vcW6BxuXgpWBsi5QGJP3m7z5sBKH1vKkj8
         eIO267j4Q7DhI7kyEMxRm2+8xUYfTYup+wNbxuH29gDVziSZdCJj+fZwBy+SgDjHru7t
         8WOOwJRcb5hAWfEjZ44iu5324/qKbBlniBtdZOwdwaAaBujBpRfmhCUlwGanfchjrazH
         Yx3cESowHN4Dww8XftMqg0yyey3tqNp5pqgLrTKoHvV3vSVKeZ8DipuDbSx9C5RmjB4j
         jXgtSSeoN2qsIqVYzc3zlqIJImQbdmb4PNuaaycluT/2Uk6HccFbKMdR6TBTV2yWPAqv
         ioQw==
X-Gm-Message-State: AO0yUKX0Fo4z2Ll8+9X/wTjHatu5NhnGOuewuYJLlXmyY1dDWAYVDjfW
        lNhCycYJCPXRd0JLoZPcysW3Eg==
X-Google-Smtp-Source: AK7set9Zkid+Zm3lzIDo8TDy9R/cdO+SwqsnhDqTyk4yhEQW4BIqgECPIrajKiHdtjkWj+oSarHJgA==
X-Received: by 2002:a17:907:7288:b0:8bd:dc0:3834 with SMTP id dt8-20020a170907728800b008bd0dc03834mr13639700ejc.34.1676978829402;
        Tue, 21 Feb 2023 03:27:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a1709066bce00b008cff300cf47sm2818085ejs.72.2023.02.21.03.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:27:09 -0800 (PST)
Message-ID: <ef4437e4-6f88-2f4a-6af2-7cee0b402fea@linaro.org>
Date:   Tue, 21 Feb 2023 12:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: Add StarFive JH7110
 Video-Output clock and reset generator
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
 <20230221083323.302471-8-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221083323.302471-8-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 09:33, Xingyu Wu wrote:
> Add bindings for the Video-Output clock and reset generator (VOUTCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-voutcrg.yaml        | 96 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 22 +++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

