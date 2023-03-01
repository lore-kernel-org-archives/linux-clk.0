Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DFDC64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 00:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjCAAs4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 19:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjCAAsz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 19:48:55 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8538B1ABEB;
        Tue, 28 Feb 2023 16:48:54 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id ck15so47709641edb.0;
        Tue, 28 Feb 2023 16:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vvkdEiT/o/nkHi7j8FGqZTLRBkJbYTC27btZyIK9WrA=;
        b=QIENcFI8+6rxnuLpHosO23D/IpxO6/3VuTaDrv6X+TbU5eskJJ3Yu7CY0nQ22N0gP3
         o4+oY0RELOouGZm8JiKjPCjUlYS59sTJdxPRbn8GVB+KYyvihL5pctpLSTbVRZxUoU0U
         IHZXFo/M7ZquBhRJVUaDUR+eCF5lq3t9zib+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvkdEiT/o/nkHi7j8FGqZTLRBkJbYTC27btZyIK9WrA=;
        b=JQPj4mJ3AhHgjjKXFn72yvJg2dRF1chsL5veb57ROWDlfkvoEnmrwEl0sVwqg97Zcn
         eLru6bv6bX5mJ5Y/8IsUVw7ZCVjG33c8Wv9iBuC1jLcgRqvP43v6kJyKQWD4DQaBx3xp
         J59KR9NsndAfe3klzxMYCQnWMOPub+NrkKsYI5ovkgOhGLLQNGAwHBFKDszMtPKSwZ23
         bceHh0/7UOgvCKBRqB/hUyp7M+fkgl6+oEXKanMHZ3K9ZijwzK9S50mTqhMhWWli3Xf0
         6naulAg1ItN7XGqH0x2g4eTxMD3tG7JPi3VbGdxMV5o/DvdE5hmlLqh1YJS15O5QI6c5
         JhSw==
X-Gm-Message-State: AO0yUKWn+or/PLoTzCRi8RmDBLpGxZ0WZPnGbdhqLaolbjaV3rxtdH2A
        nu77p0Q0itIu+E2Y8NHS3dMpSJ6ORtpGiXUoVLcm1dnW
X-Google-Smtp-Source: AK7set9lF58MskXtvSfppNec4BhtNvtP/wtqKdIOA5MO+ofQRY65q1/eVgGQ7BC95tETOFekBcYD6DJCF4iNchcNbHo=
X-Received: by 2002:a17:907:a0e:b0:8f7:f3d4:942c with SMTP id
 bb14-20020a1709070a0e00b008f7f3d4942cmr4034612ejc.7.1677631733122; Tue, 28
 Feb 2023 16:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-5-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-5-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 1 Mar 2023 00:48:40 +0000
Message-ID: <CACPK8XcoLhe=zypSh-h_8VGheVqqiQxZV5Z8NXFs2r49zA1wNQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: clock: ast2600: remove IC36 & I3C7
 clock definitions
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 28 Feb 2023 at 09:16, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> The current ast2600 clock definitions include entries for i3c6 and i3c7
> devices, which don't exist: there are no clock control lines documented
> for these, and only i3c devices 0 through 5 are present.
>
> So, remove the definitions for I3C6 and I3C7. Although this is a
> potential ABI-breaking change, there are no in-tree users of these, and
> any references would be broken anyway, as the hardware doesn't exist.
>
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> ---
> v3:
>  - split dt-bindings and clk changes
> v2:
>  - reword commit message
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index dd1581bfdf58..b4d69103d722 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -57,8 +57,6 @@
>  #define ASPEED_CLK_GATE_I3C3CLK                40
>  #define ASPEED_CLK_GATE_I3C4CLK                41
>  #define ASPEED_CLK_GATE_I3C5CLK                42
> -#define ASPEED_CLK_GATE_I3C6CLK                43
> -#define ASPEED_CLK_GATE_I3C7CLK                44
>
>  #define ASPEED_CLK_GATE_FSICLK         45
>
> --
> 2.39.1
>
