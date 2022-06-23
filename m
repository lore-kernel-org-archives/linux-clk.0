Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B1CC43334
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiFWMFX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiFWMFW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:05:22 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D3F49F83
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:05:21 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id g26so19192911ejb.5
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PppxL2KUqFlV+/8Q6Av1eKZ6SPqrPZYPPPP8wnWzrpI=;
        b=qDAFx0FRaVkJCKKl6seZsibKMWsEzBDitPBMd/GIuG1a72QpBhz66kEQ6gMOwhuDJQ
         EN3cTlJljisc+k6oA5802OBA5maMZQ+2ohdH++0RW7+KS6V+++CmTTIjB45REHrGbanS
         YmRIQcLENNCJHioVVdSwrfb65soYBGDNvoOH8C5PopdroXuPOY6qJEgN37IbY7SVy71C
         AeTRyzZaFpev4v9SBXnWIpRrBrdhOWJhRyMFi0PIFOJa7TbLCTeZy8c/ZtmA+D9ELkgp
         hVfpxt8beJrkmrE8UfT68+GXPITtsYPiDTY73X1RDQT41dqbwIKyYDAPtJCLQlgIZZDk
         vKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PppxL2KUqFlV+/8Q6Av1eKZ6SPqrPZYPPPP8wnWzrpI=;
        b=4iM1VI2unkR2cdmVurIPu9FV25gmuLdSFB56+1drk/k3EV3WH+5U2qgAMRb+bUYqHg
         Yw5HN6avr7ZJoGNUvDlypLq3nMTmUBHsZopXREH24sV2MgoteJ392A4lm/95GMyTi1Ju
         wtQ54sVLQGqSBXEL/mT8OvyF/vJ2ula/ywoIrdD3R+0GJ/ALEK+Pq9bGZMuE44WbOhj9
         3zJmm+O8Umid+/25k2qBgwB3M1F3p1H2u2txYZwxtCQvxRs+YDm9nPQhfmEF/XTGyBZi
         eT9RTLrukifxW3eO4VSfyXwVrEB9HOZd0z1yS7V58tKLPk+xf96tbvNbahVhWBZzexgI
         2NMA==
X-Gm-Message-State: AJIora8KcREKIaS0+yLy+LoT9J99V7Qe65C/JRPcQ8rTAvFoeDYQqeA7
        XoLdqnx1gzNzNfxV3bd1F92BxQ==
X-Google-Smtp-Source: AGRyM1vsUBr3PdB0hhAURyeHMPTDJEWaOUR4fFilhHFdevtuR+Szbs2SytIwDzsrjRR2URuwf5x2xw==
X-Received: by 2002:a17:906:6485:b0:712:10cd:e3b7 with SMTP id e5-20020a170906648500b0071210cde3b7mr7618453ejm.557.1655985919875;
        Thu, 23 Jun 2022 05:05:19 -0700 (PDT)
Received: from [192.168.0.230] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j17-20020a17090623f100b00711d5baae0esm10838324ejg.145.2022.06.23.05.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 05:05:19 -0700 (PDT)
Message-ID: <a2c5cdec-632e-3d90-c90d-1c3c0503e825@linaro.org>
Date:   Thu, 23 Jun 2022 14:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: r9a07g043-cpg: Add Renesas
 RZ/Five CPG Clock and Reset Definitions
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220622181723.13033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220622181723.13033-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622181723.13033-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/06/2022 20:17, Lad Prabhakar wrote:
> Renesas RZ/Five SoC has almost the same clock structure compared to the
> Renesas RZ/G2UL SoC, re-use the r9a07g043-cpg.h header file and just
> amend the RZ/Five CPG clock and reset definitions.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/dt-bindings/clock/r9a07g043-cpg.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
