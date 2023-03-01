Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A11DC64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 00:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjCAAtk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 19:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjCAAtj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 19:49:39 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030853608F;
        Tue, 28 Feb 2023 16:49:29 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id ck15so47713625edb.0;
        Tue, 28 Feb 2023 16:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kn741iAhWjnSvmrDZleHGNSeYwFm8STm5Ya4EwcTIQA=;
        b=NVgStDPJRBmRlQZsmftDf8c4WCB2NVPYJ4id07IjmV94n5WTKVGkhCZ3Z/TAJu8hvx
         Gd/nqzFKpS0FsiKOjn/z1Ab2x+xTTfj7AB0Q9f4t2oBvcB9qDldjXgLP+/cwEDz65C1K
         2iiYuxr+OYj2OsJB1pFd7NQuGYZHBTKfxa0fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kn741iAhWjnSvmrDZleHGNSeYwFm8STm5Ya4EwcTIQA=;
        b=Iuj4fuoVkp638YEo+0UnD0kk/s4BuG2JCASLlvgxketNwGBci8j6r64oK2nVqu09ID
         CCU/C4hI1hmMAz4whpaCOea94q9Ghiz0yLhEa8Qh43QHQHQFu6FvvFgvwwaqTpgZhzv5
         /Az0JYRtbwjcFpo5dO+x/EibXNNk0WepsE+DiPSieBJ/aie0zEzCxPTvajpC6su1mVNK
         Vu6EMUeC7HwsE5Z+9ZdMIxVa4swCxCZi+AqhJ/Ms8IRsQ+LRGZxn2Kqq/IfY8f/IzIHA
         BxEee/iy1k/RFNE95KZ80Bc8kFYQyNwAnEXF5rIu14TiEcOxcslbFeqYxvGX/G/627IY
         wXMQ==
X-Gm-Message-State: AO0yUKVWEVLBwif2geCifEVsf/FHbGwpjncjr25dHiiYbaSVGDdJ47ay
        ONzILfvkKbwXPG2XrcRQJYhJ1h7V6QgwSp1yfnV5pPJR
X-Google-Smtp-Source: AK7set/JIQ8zzJbyxKugXjghghYkMBYBiKLVjci91LtkFEbgS/XapeFpjr8GfHBFs5PDfoV0Lz8HToyONIKZkyGAEnc=
X-Received: by 2002:a50:d548:0:b0:4ad:7439:cec7 with SMTP id
 f8-20020a50d548000000b004ad7439cec7mr2717158edj.7.1677631767973; Tue, 28 Feb
 2023 16:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-6-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-6-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 1 Mar 2023 00:49:15 +0000
Message-ID: <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config for I3C
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
> Add reset line definitions for the AST2600 I3C block's reset inputs.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
> v2:
>  - reword commit message
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index b4d69103d722..b1c129977910 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -90,6 +90,12 @@
>  /* Only list resets here that are not part of a gate */

These definitions are part of a gate, yeah?

>  #define ASPEED_RESET_ADC               55
>  #define ASPEED_RESET_JTAG_MASTER2      54
> +#define ASPEED_RESET_I3C5              45
> +#define ASPEED_RESET_I3C4              44
> +#define ASPEED_RESET_I3C3              43
> +#define ASPEED_RESET_I3C2              42
> +#define ASPEED_RESET_I3C1              41
> +#define ASPEED_RESET_I3C0              40
>  #define ASPEED_RESET_I3C_DMA           39
>  #define ASPEED_RESET_PWM               37
>  #define ASPEED_RESET_PECI              36
> --
> 2.39.1
>
