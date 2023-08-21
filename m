Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744ECEE4996
	for <linux-clk@archiver.kernel.org>; Mon, 21 Aug 2023 15:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236416AbjHUPi2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Aug 2023 11:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236414AbjHUPi2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Aug 2023 11:38:28 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565D7F0
        for <linux-clk@vger.kernel.org>; Mon, 21 Aug 2023 08:38:26 -0700 (PDT)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C507A3F202
        for <linux-clk@vger.kernel.org>; Mon, 21 Aug 2023 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692632304;
        bh=dR4fKCf3aiQm5QfYjYybq78zJOJhhlX1qhg84BiXcbQ=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=EXPSXZzYaQZqNhOguMkurHQHhnrfiH1NSuSp57mBhQ85xAsh4/CumFGK3Qd3eerSL
         0PSs+y43wZ1DrPnrDrXAlFTDMZDdsVX/yXYQweThvUjogr43IYRjThZwdfdfeSe/tN
         Iat3csqlzOVL0nI61ebIm8F9DQe2r97WOkVVOP62BwDxv1Uu/qEypDaZRxVFQnnf1n
         OqiIR5ySjSTUGfk0McaAeqVLsWdyTN5c6hwNS9Bg2toPn93VUd5EhRfSal37P1jTHl
         THzeRmhb38Vn37YGddY32KkhWGH0UNRg1D1dBoXCYYVGZTYqF+GrI9V8KmGBuRab/b
         x2DlV8/6JHHLw==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41097f9c526so14120651cf.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Aug 2023 08:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632304; x=1693237104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dR4fKCf3aiQm5QfYjYybq78zJOJhhlX1qhg84BiXcbQ=;
        b=lEPPowdPrW9v2Y4/arlnSeOGsKdCLXdhNIyNLgj6pbcZ8lJwVulsN6e6CIUj2ZYPa2
         QRQWC3NWzSKOAlMnCylKyRAdpGJM4cAaBFlm/pAOlSTTxlwZgXasORuH9xHACOkDAt0h
         AdxooWM53pabcAQL60knQA3VodEhn9TeUZdz+fgVvr3Y+3j0n0Tl6k7ZqYqNmmaH/7fL
         3PyHaljMkg5k35/DBc/lGl3+wdVRi2OZX/ZXaMueCagIvN4jKVpHWRfChsWYl83cJE2O
         VEHRZzMj0mudyhMUZOb1aj/ERPAId70zMjGIlaEaXxpogcuqQ+/EuFZSL/zjdK3Y/y+l
         6RTQ==
X-Gm-Message-State: AOJu0Yxp6pMP23HR2Z0floIZgeAG9VrlsklYl3kdzzI4pMTuDcv+97Ii
        XnMDb/oWd9ccg2uQVlYjoxTy3Ma1dRG9v0Z2efnKQEf7PqL0V45bnBNLXCUvFpt91o/Iy6ZNIZ+
        KAWVVi/B7/iU4r35k04NIWKVNfWrf9miwl3j37+FmWgwZQ0bqlL1Pcw==
X-Received: by 2002:a05:622a:1a09:b0:406:56cb:b617 with SMTP id f9-20020a05622a1a0900b0040656cbb617mr9994482qtb.53.1692632303864;
        Mon, 21 Aug 2023 08:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOYpfoMWqn7rvTpD6etYQwz44SATS6402V5zdFc7+JvhQ9JNi2SjP6xefOXetLZpEzWzQHpVpIrE+AxYw1GVM=
X-Received: by 2002:a05:622a:1a09:b0:406:56cb:b617 with SMTP id
 f9-20020a05622a1a0900b0040656cbb617mr9994469qtb.53.1692632303608; Mon, 21 Aug
 2023 08:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230821152915.208366-1-xingyu.wu@starfivetech.com>
In-Reply-To: <20230821152915.208366-1-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Mon, 21 Aug 2023 17:38:07 +0200
Message-ID: <CAJM55Z_XxHeC-X2d4qcsRK6THLyqWV4SsSW3S+cC8yszpPD9Og@mail.gmail.com>
Subject: Re: [PATCH v2] clk: starfive: jh7110-sys: Fix lower rate of CPUfreq
 by setting PLL0 rate to 1.5GHz
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 21 Aug 2023 at 17:29, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> But now PLL0 rate is 1GHz and the cpu frequency loads become
> 333/500/500/1000MHz in fact.
>
> So PLL0 rate should be set to 1.5GHz. Change the parent of cpu_root clock
> and the divider of cpu_core before the setting.
>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110 SoC")
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>
> Hi Stephen and Emil,
>
> This patch fixes the issue about lower rate of CPUfreq[1]
> and sets PLL0 rate to 1.5GHz. In order not to affect the cpu
> operation, the cpu_root's parent clock should be changed first.
> And the divider of the cpu_core clock should be set to 2 so they
> won't crash when setting 1.5GHz without voltage regulation.

Hi Xingyu,

It sounds like this is something the driver should handle
automatically whenever clk_set_rate() is called on the PLL0 clock.
Then we should be able to use regular assigned-clocks /
assigned-clock-rates stanzas in the device tree instead of having this
1.5GHz rate hard-coded in the driver.

/Emil

> [1]: https://github.com/starfive-tech/VisionFive2/issues/55
>
> This patch is based on linux-next(20230818) which has merge PLL driver
> on the StarFive JH7110 SoC.
>
> Thanks,
> Xingyu Wu
>
> ---
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 47 ++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 3884eff9fe93..b6b9e967dfc7 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -501,7 +501,52 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       return jh7110_reset_controller_register(priv, "rst-sys", 0);
> +       ret = jh7110_reset_controller_register(priv, "rst-sys", 0);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Set PLL0 rate to 1.5GHz
> +        * In order to not affect the cpu when the PLL0 rate is changing,
> +        * we need to switch the parent of cpu_root clock to osc clock first,
> +        * and then switch back after setting the PLL0 rate.
> +        */
> +       pllclk = clk_get(priv->dev, "pll0_out");
> +       if (!IS_ERR(pllclk)) {
> +               struct clk *osc = clk_get(&pdev->dev, "osc");
> +               struct clk *cpu_root = priv->reg[JH7110_SYSCLK_CPU_ROOT].hw.clk;
> +               struct clk *cpu_core = priv->reg[JH7110_SYSCLK_CPU_CORE].hw.clk;
> +
> +               if (IS_ERR(osc)) {
> +                       clk_put(pllclk);
> +                       return PTR_ERR(osc);
> +               }
> +
> +               /*
> +                * CPU need voltage regulation by CPUfreq if set 1.5GHz.
> +                * So in this driver, cpu_core need to be set the divider to be 2 first
> +                * and will be 750M after setting parent.
> +                */
> +               ret = clk_set_rate(cpu_core, clk_get_rate(cpu_core) / 2);
> +               if (ret)
> +                       goto failed_set;
> +
> +               ret = clk_set_parent(cpu_root, osc);
> +               if (ret)
> +                       goto failed_set;
> +
> +               ret = clk_set_rate(pllclk, 1500000000);
> +               if (ret)
> +                       goto failed_set;
> +
> +               ret = clk_set_parent(cpu_root, pllclk);
> +
> +failed_set:
> +               clk_put(pllclk);
> +               clk_put(osc);
> +       }
> +
> +       return ret;
>  }
>
>  static const struct of_device_id jh7110_syscrg_match[] = {
> --
> 2.25.1
>
