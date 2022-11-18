Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619D5C43217
	for <linux-clk@archiver.kernel.org>; Fri, 18 Nov 2022 17:18:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242518AbiKRRSl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Nov 2022 12:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242123AbiKRRSj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2022 12:18:39 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F6617A92
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 09:18:37 -0800 (PST)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E800E3F4B3
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1668791915;
        bh=Ihl+Je3Z+y8gG//tf2j+pj2UsuFi/UkCnl/8sS+58OE=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=AjLhQ40i1l+2Hc8kL1a9pZ1f0v/938FYIp2MYmTAxeVorh+GFsDhiI+gbv0aPbtsS
         U4MmRrOQWcwtCIh5QO6AAzd8B/azM4dBob2Mmbet0+b1QE75nVnLIJXd+JpRujlfOX
         daO5Rwk4YGVpTC9uhtGGx29sSTIpIKL+m3cDLZ8SNWgX4WPdkgaqrBelcknCbu4+VY
         jcnCGM+8ue7H6j+SR/qDdhfIJil2ivAWsDnEECnRFsV0YK1/Q3BzvcNGYYYTXm2e4L
         SGFJofoOHEsVwqWsPEYpsAh/qpLmxkimyaaDqEVUdLKWzMRPmCQ5FkWiEZyb7qkFdc
         iXTlHt780PZlw==
Received: by mail-yb1-f199.google.com with SMTP id y82-20020a253255000000b006e7a04f3824so4220387yby.19
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 09:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ihl+Je3Z+y8gG//tf2j+pj2UsuFi/UkCnl/8sS+58OE=;
        b=fR1S0JPbDQGtXpzKVRo3IWdAGdtVVfot61abMVjPkdexJj7O3SOu2Bmh/gXejhuTne
         eD/OA9eZQrtluCJnkV9HTG35XsjvJYL8DTsnxeIoLGe3lUHFASt3+yVBt1+NYSAXDzY8
         I+xVCoQwJiNiGiTzDyTHPI9V/FbGRBDJjCJ5gLHfgU579PYwzNsmRibIpsRhk4kTXHsm
         cPF00wRLjGRKToEmql8wCPSdZUe0bNuFpbTlI8M5KQfuQePTnH1HfaGfJLToZ4GdivKe
         67LuMFuIn8ky6Zs0wDfekmm38Lr2EUk5N4cXwagKty4iqlBTfETqmbhbwTs2grkHVlnm
         55aQ==
X-Gm-Message-State: ANoB5plaDyDAJMAjdQt4VG6YnJpb4SsfTPxrqNfPPHujXfqm1+NeFT/D
        0Wee9ykTnGlg4sbOTqIK3kGOz2vAnbGsllNAiuQOI8+el5n5Pq3yc+p4pMuuTtajH0PtOZlEm7j
        3EUjE/dzCusRWnLRDjeApnIloOvaV0NM5QeH1Psk52Jwy7BRulv54fQ==
X-Received: by 2002:a25:3b51:0:b0:6de:f83b:3160 with SMTP id i78-20020a253b51000000b006def83b3160mr7210021yba.467.1668791914852;
        Fri, 18 Nov 2022 09:18:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gNMjZV4v2icTvtOBtm8WnqynWPCLqrTz9saKsC/CrUDCNOM3JEQ5u9gZtmPCMVbMaRenaOlMRVu0ODuMyivY=
X-Received: by 2002:a25:3b51:0:b0:6de:f83b:3160 with SMTP id
 i78-20020a253b51000000b006def83b3160mr7210002yba.467.1668791914667; Fri, 18
 Nov 2022 09:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-15-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-15-hal.feng@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Fri, 18 Nov 2022 18:18:18 +0100
Message-ID: <CAJM55Z8t8yotMTWVw2J7gtGMyx5no2onj-YcfB6d1BY0ACeDJg@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] clk: starfive: jh71x0: Don't register aux
 devices if JH7110 reset is disabled
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> The JH7110 clock drivers will not register redundant auxiliary
> devices if the JH7110 reset auxiliary driver is disabled.
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index dda19c6937cb..4e69f56b00cc 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -333,7 +333,7 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  }
>  EXPORT_SYMBOL_GPL(starfive_jh71x0_clk_ops);
>
> -#if IS_ENABLED(CONFIG_CLK_STARFIVE_JH7110_SYS)
> +#if IS_ENABLED(CONFIG_RESET_STARFIVE_JH7110)

I don't see any reason you'd want to build a kernel that needs the
clock driver but not the resets, so I don't think this is something we
should optimize for. I'd just drop this patch and let such broken
kernels register the auxiliary devices even when no reset driver is
there to use them.

>  static void jh7110_reset_unregister_adev(void *_adev)
>  {
> @@ -384,4 +384,13 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  }
>  EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
>
> +#else /* !CONFIG_RESET_STARFIVE_JH7110 */
> +
> +int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
> +                                    const char *adev_name,
> +                                    u32 adev_id)
> +{
> +       return 0;
> +}
> +
>  #endif
> --
> 2.38.1
>
