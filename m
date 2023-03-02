Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C207C678D4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 03:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjCBDat (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 22:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjCBDat (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 22:30:49 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87996166F1;
        Wed,  1 Mar 2023 19:30:46 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id f13so62340313edz.6;
        Wed, 01 Mar 2023 19:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ/MILgWgQHwHoMlCWIsaUJfI9Yq/sjBc9o0dijE/U4=;
        b=TkrdMran+QTp11FGYtrmiFOgICKvxsB880yoTwhfzzQ023beTC86M5b6H9KF+TF7JS
         gXMtCyKllvGLAasjyP7cwTQ5S2qMA4z894n6Xvt+RkpyuSUwpiZUDdemN4KC494OWRdt
         gDPvZsh67qFX7xrF5ooj6Drt6dHIJx803zpiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJ/MILgWgQHwHoMlCWIsaUJfI9Yq/sjBc9o0dijE/U4=;
        b=IU/VScuxPUGG9SbqXAecuvlsBE72Kjyp+mnOlAS19E7k4u0+GX2GFP4KJonGXn4zgb
         j1Z8QMSOKmDdZVwThXkl9kS7CkcKzqhCJRFc8A/bTEHI3XCV9sEcEABwbuK27S/nnRq/
         81jpOtRWj07TnKnBYZfhKzg33CiECQO2oOXVS8/5a2UP9X+Pax7VYSItiYyx1nNCvDn5
         isNLVuZ6tD1ch19/oM1JVTXcwNTXgTJWzB5gpCjBaKd9/SvLak/FY+jvah+6HZu85TDx
         GngmeWwEI+0RMPAaEu5uKUxhEtgzixvjHus5dBYPeLky+RPWtRjDSKdDfo5robhBY6QQ
         VFng==
X-Gm-Message-State: AO0yUKW3IJnZBwd86ek5FI68VLjp6CQBl90lOpDjTqp6Ddmt9fj8LgQa
        nCV3taYLQCacy9JaFxZyN4GIQoySyWaHPXDugr4=
X-Google-Smtp-Source: AK7set8+mnvjDp4w2b20qHE8h3/Ugm6+aH6rWINdH+bet2ruNmbNyMh60NFSiWq6rRy8Zc4OAFxwFcG857/lB2ueFo0=
X-Received: by 2002:a17:906:52d2:b0:8b1:7ac6:318a with SMTP id
 w18-20020a17090652d200b008b17ac6318amr4156156ejn.4.1677727844867; Wed, 01 Mar
 2023 19:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-6-jk@codeconstruct.com.au>
In-Reply-To: <20230302005834.13171-6-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 2 Mar 2023 03:30:31 +0000
Message-ID: <CACPK8Xd7pFjc94Pf9pzedH3kkckeBBjh1TNaGGvfD=7+aMB2MA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] clk: ast2600: Add comment about combined clock +
 reset handling
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org,
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

On Thu, 2 Mar 2023 at 00:58, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Add a little description about how reset lines can be implicit with
> clock enable/disable. This is mostly based on the commit message
> from the original submission in 15ed8ce5f8.

Excellent, thank you.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/clk/clk-ast2600.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 09f26ab5f9af..a094a2601a37 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -73,6 +73,27 @@ static void __iomem *scu_g6_base;
>  static u8 soc_rev;
>
>  /*
> + * The majority of the clocks in the system are gates paired with a reset
> + * controller that holds the IP in reset; this is represented by the @reset_idx
> + * member of entries here.
> + *
> + * This borrows from clk_hw_register_gate, but registers two 'gates', one
> + * to control the clock enable register and the other to control the reset
> + * IP. This allows us to enforce the ordering:
> + *
> + * 1. Place IP in reset
> + * 2. Enable clock
> + * 3. Delay
> + * 4. Release reset
> + *
> + * Consequently, if reset_idx is set, reset control is implicit: the clock
> + * consumer does not need its own reset handling, as enabling the clock will
> + * also deassert reset.
> + *
> + * There are some gates that do not have an associated reset; these are
> + * handled by using -1 as the index for the reset, and the consumer must
> + * explictly assert/deassert reset lines as required.
> + *
>   * Clocks marked with CLK_IS_CRITICAL:
>   *
>   *  ref0 and ref1 are essential for the SoC to operate
> --
> 2.39.1
>
