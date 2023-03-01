Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B84C7EE30
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 00:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjCAAuk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 19:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjCAAuj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 19:50:39 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8796F1F931;
        Tue, 28 Feb 2023 16:50:38 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id d30so47516767eda.4;
        Tue, 28 Feb 2023 16:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ynnNEJ0OvCRhJyHXpVT5xLF+Y6XFOKfk2/bquuxHgOg=;
        b=dyyWssqtEcqiKT7VoraJN8oiAk/zyVGRWxc5Rj4xO/OalLZ8gwyyvaGZIxRK8w3WTr
         g5b9CL3uPhY6+FpgXgpCDQGHDmrA+AJ3TIoba7l4CcIF5DNl/JBawLLs33Zd7Nnt22Om
         vh6StvCmQ86GV3oBklBuFUifqCkBlHSG99yVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynnNEJ0OvCRhJyHXpVT5xLF+Y6XFOKfk2/bquuxHgOg=;
        b=63SQBdlbXBbLM+mwnp1e6K/ed1RX/Gy+AsmF6296tj0vZpOPphy7HVSZS9CY7BueDc
         /w4OwRaG+rKzy6HVphfJXGIQuemilrI17pmixcy8j2iayPH/69onCyxFotoMV5/1zFcp
         rUvcJAyHX+Ek0n/IAnk0NhTknutiDCIRfE1TDfXNNKnnE6yoaQn+w+1maGIxrofRfm/t
         V4l6sJvv3Jcu+y4YQ6jAl7bXSHKV5gLZj7Tj13q1bHRzqkuvnqC+glOGU2KHYirCQ/Fw
         IY1Lj9cIB45LMjAUCiuy+JxMcOogWz/vc0yEelPsnW4Coxw7ELsmLA/6Ji4OXye5xR+f
         Jg7Q==
X-Gm-Message-State: AO0yUKXjU1oXDZ5UmZyrDGhgDnKicPFmfJ3mqwz8v3o66adXuwqON2Vl
        uw4SXgNOdWl0T1UFpcIMfZ9RK+gkNhHpzWBoPquHM/fA
X-Google-Smtp-Source: AK7set+7WDDBuXBGzo96ZtLI2wdyOJir2jdHhZzySjRCGEPwTLVIKS28KjoazkzNIINdilRJOZV0Xs8xUA3r2vgOdQ4=
X-Received: by 2002:a50:c319:0:b0:4ad:7439:cec3 with SMTP id
 a25-20020a50c319000000b004ad7439cec3mr2710135edb.7.1677631836974; Tue, 28 Feb
 2023 16:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-2-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-2-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 1 Mar 2023 00:50:24 +0000
Message-ID: <CACPK8XffdV3YMy0eu4sZQhw-tS2g5kz_RHLD98Up9G0P9NAR4A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: ast2600: allow empty entries in aspeed_g6_gates
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
> We're about to remove an entry from aspeed_g6_gates, but we won't want
> to alter/reorder existing entries. Allow empty entries in this array.

Nice. So it's recorded somewhere: the gates array should be
sequential, with the include/dt-bindings/clock/ast2600-clock.h defines
starting at 0 and counting up. If a clock gets mistakenly added and
needs to be removed, we can't have a "hole" in the array so instead we
leave it NULL and skip over adding it.

We could simply remove the bad entry but this would break the
theoretical case of a device tree with an old header, so we leave the
gaps in place :(

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel




>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
>
> ---
> v3:
>  - reword commit message
> ---
>  drivers/clk/clk-ast2600.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 9c3305bcb27a..1f08ff3c60fa 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -652,6 +652,9 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 const struct aspeed_gate_data *gd = &aspeed_g6_gates[i];
>                 u32 gate_flags;
>
> +               if (!gd->name)
> +                       continue;
> +
>                 /*
>                  * Special case: the USB port 1 clock (bit 14) is always
>                  * working the opposite way from the other ones.
> --
> 2.39.1
>
