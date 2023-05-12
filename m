Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F45C77B7C
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 06:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238554AbjELGvD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 02:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239968AbjELGvC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 02:51:02 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD627D064
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:50:50 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94a342f7c4cso1712071366b.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683874249; x=1686466249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjLTSzaj/aJam+P8bDF+fpLGAFitrvdhPxYkij3cdnM=;
        b=KXwh1obIMnIY9EpDd/kl96eg4glZYjziU2VDrzj0M+j00eDbKSqTPpFCJqz/DmFc3K
         H1lt58qZtQiNFDfZbaX4CIlkv8iXrcFVEOQUORaNHfCe10LzBIrN0qWDExvq7TLcGIT1
         3A+n1zC1xhJ8STMD7DRlmrQwv6oJTWTwpLuCY5GmyG1KMqMoV6XiT9mnBxy5bBqowF8i
         QNDjZPa4hVcO1f53LLBhY+iXQty6JCJPX+wYciAn8pRtq9ZcDcKH/oT7f4SHwvTtHlMr
         zbgFi/0ILZj3NLMjLAGLlcjJ3CCk/MfX6rz8Hyob51MdWu1E9uVmb7Q3HsorM+4Ydqsx
         fbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683874249; x=1686466249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjLTSzaj/aJam+P8bDF+fpLGAFitrvdhPxYkij3cdnM=;
        b=Ayp6YlOGgb+i5OWFFeIWNo+NOMLDR3QaYurj6/UbvAxQLYyjQt4Q9WKNYcXLhfqNNb
         oX/cLkh+/RkrKoBqeeKZUIOtK2YMqkTG7N2qt7kft4YjgtzMH5dTgOK35v24rZlLdnsg
         /a4TPJWQ1Ltr4nb3YY7wWVVmbKwva5xqXMu0duscx5cWrHB4uMOGYksKFw93s9RCy7AP
         GvWZ+0x9fT/BGYMsnnvjw6yQgKDa2k8IuOPch68UPNHMhTPsmNypONkXaikr3SwG1BIt
         lPlrLStvY3P6h9o31n291LQ6/P1bAQ2Ll0YRCE0tisCVoPs/4XpaN+/3/j2Ihj3IOMOU
         0Rgg==
X-Gm-Message-State: AC+VfDxNvcbRY9Kr2g47dgEfvxvuoqOQvbIXwFXu9JJvebiorMWvqjSk
        oa2+3i2d3v5l3sK3e9YdQbIolA==
X-Google-Smtp-Source: ACHHUZ76mXy1zTI9i2lKsIPaB4P4XRWrjQ/x0aamkZb6fQKroHOTuJZ7C8gUN6BprZD4LBeSRMFy3w==
X-Received: by 2002:a17:906:da87:b0:966:3c82:4a97 with SMTP id xh7-20020a170906da8700b009663c824a97mr17082800ejb.35.1683874249187;
        Thu, 11 May 2023 23:50:49 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id ci18-20020a170907267200b00959c6cb82basm4974642ejc.105.2023.05.11.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 23:50:48 -0700 (PDT)
Date:   Fri, 12 May 2023 08:50:46 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     William Qiu <william.qiu@starfivetech.com>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hal Feng <hal.feng@starfivetech.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <20230512065046.bhblj4uci7hnjoof@krzk-bin>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512022036.97987-6-xingyu.wu@starfivetech.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 12 May 2023 10:20:34 +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 67 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml

See https://patchwork.ozlabs.org/patch/1780353

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
