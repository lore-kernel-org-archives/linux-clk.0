Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3BEC001DE
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jul 2023 18:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233082AbjGLSKJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jul 2023 14:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbjGLSKH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2023 14:10:07 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BCB1FD4
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 11:10:04 -0700 (PDT)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 401EE3F71D
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689185397;
        bh=Bizuu4z3VnDLRN7R+//unqDeYbH2DtjnSLBh5A5U/w4=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=BW2NfbNrSUd9tLFXlCaRtDPISAY8dwrlT2S8xiL3pN0cyomJHhAvcpNibbCLJlzwU
         wI8dfvISITrHiUFmJDhi4hWKH+Y7lie7jITPwA0kOtZGs2R2IjkIbDINWPw+VHRBYh
         HxLZYfx1c0WUk8WstVtpSfEFYGtOZ28kxN1UhBiR2V3C6hS6KaAq1Nmy2M09rvwnWv
         En2RTqy+zY0Xf7mzQbzlP3kFNB9z8cwmS/MPrwKU40XuRWnd0mSTQFOsx8MFS4YJGC
         TuCiYlWzn52vTLON1PfdYXdy6Zuv13YOpO06hWOjEWTr5Akic8EGDhCW/kmwIUxiqB
         1EdcD7LGCV+8g==
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7659cb9c3b3so713159285a.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 11:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185396; x=1691777396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bizuu4z3VnDLRN7R+//unqDeYbH2DtjnSLBh5A5U/w4=;
        b=XOQJi7sp+LgQP5yy5u+Gh/qqUpZrajP9VvDK75RnNeGgdvmYhouJgDAkhL8YG0+uv4
         MwRvLplEKqCbJdFh0SCdTc0twH10S5Min72ID4WkN0tG5QFhVAMfb8wY+PSENiEo6zJy
         4OfwTYhV+oLo1WsxFsgHKHSo2z3gQXmUWuBvN/BlQFqqwEFqeopQ5WTwsxh0kO/1NVj/
         EyE/Hb6K/nDVFxz5g2E/xsOYihTMIZcR9Em8UOqf/0E7Uqv2eZyOmPsirAYDCa43DpjX
         Jnby7zJ66+QMsJ+KDqXhKYxENP4Bww82aP7vSMWtkLOdu3C90Xdya0VBKEs4cPREu8K6
         Uqig==
X-Gm-Message-State: ABy/qLYyBz32p1+a+Dd9PAq9k/N9KTLYcfZmX9ts5p2IF5DNQ1psVT+N
        IxdO/l0LZIVsFazghErazzpsAecaPBSV9xs0GFjevDuynw6E/ZxJ9ixVjIcGVhYjKoJNOn6VY7H
        W1L0AWWUKc+cGyUep7YOrabfDWyQI+A+3Ak3OCVurympFzz/YlYL2HA==
X-Received: by 2002:a05:620a:8e86:b0:765:84e3:aa1f with SMTP id rf6-20020a05620a8e8600b0076584e3aa1fmr14249045qkn.14.1689185396336;
        Wed, 12 Jul 2023 11:09:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEHAIZXhPQbdZBMRJZmbmK7N8VreWT4Jt2xgENYnPV/7T6gHV3unJyeuLSUIcif7+F3P5osS5GQtrh30bhdIPw=
X-Received: by 2002:a05:620a:8e86:b0:765:84e3:aa1f with SMTP id
 rf6-20020a05620a8e8600b0076584e3aa1fmr14249030qkn.14.1689185396118; Wed, 12
 Jul 2023 11:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-8-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-8-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 12 Jul 2023 20:09:39 +0200
Message-ID: <CAJM55Z8O8eu9y51B0sDs4+6-0MAdJS19QhjNzNJiX5i2v4Jh=A@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] reset: starfive: jh7110: Add StarFive STG/ISP/VOUT
 resets support
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 12 Jul 2023 at 11:22, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add new struct members and auxiliary_device_id of resets to support
> System-Top-Group, Image-Signal-Process and Video-Output on the StarFive
> JH7110 SoC.
>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh7110.c    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 2d26ae95c8cc..29a43f0f2ad6 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -31,6 +31,24 @@ static const struct jh7110_reset_info jh7110_aon_info = {
>         .status_offset = 0x3C,
>  };
>
> +static const struct jh7110_reset_info jh7110_stg_info = {
> +       .nr_resets = JH7110_STGRST_END,
> +       .assert_offset = 0x74,
> +       .status_offset = 0x78,
> +};
> +
> +static const struct jh7110_reset_info jh7110_isp_info = {
> +       .nr_resets = JH7110_ISPRST_END,
> +       .assert_offset = 0x38,
> +       .status_offset = 0x3C,
> +};
> +
> +static const struct jh7110_reset_info jh7110_vout_info = {
> +       .nr_resets = JH7110_VOUTRST_END,
> +       .assert_offset = 0x48,
> +       .status_offset = 0x4C,
> +};
> +
>  static int jh7110_reset_probe(struct auxiliary_device *adev,
>                               const struct auxiliary_device_id *id)
>  {
> @@ -58,6 +76,18 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
>                 .name = "clk_starfive_jh7110_sys.rst-aon",
>                 .driver_data = (kernel_ulong_t)&jh7110_aon_info,
>         },
> +       {
> +               .name = "clk_starfive_jh7110_sys.rst-stg",
> +               .driver_data = (kernel_ulong_t)&jh7110_stg_info,
> +       },
> +       {
> +               .name = "clk_starfive_jh7110_sys.rst-isp",
> +               .driver_data = (kernel_ulong_t)&jh7110_isp_info,
> +       },
> +       {
> +               .name = "clk_starfive_jh7110_sys.rst-vo",
> +               .driver_data = (kernel_ulong_t)&jh7110_vout_info,
> +       },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(auxiliary, jh7110_reset_ids);
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
