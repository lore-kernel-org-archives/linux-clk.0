Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3C1C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jan 2022 04:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbiAEEYn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jan 2022 23:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237052AbiAEEYn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jan 2022 23:24:43 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CFEC061761
        for <linux-clk@vger.kernel.org>; Tue,  4 Jan 2022 20:24:42 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id h21so51982445ljh.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Jan 2022 20:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jkZzTWDHBqPoHg16Nm+pis9QHrtoPCcYiYAu5f2sNtY=;
        b=DdhzfMkCM2OOiBlCVRfpJ6KXgR6QFDrXp3mfFdYSA5OX/D9i6kAvm9SZ8mnaV/7Uoe
         ui9Dfd90B19qyyC5xFD1WLvu1VELE8x5eAfRPrgm4Tgk1SOPQpldmgTR1tqTmwzPGLXB
         PMRrZduXzTckUXEs6Xieg5mkfNZsNUvdyJZN71a+KoUHJOkjjHnMY/FgzuQ3IYdGSCLx
         OBFrB5e0XOKQgmY5/HZRd5E6NbmXDg548pvGVIRlaPIC3DTHLCsnlio4xcE/DaMxX3WE
         cUUBEati5HM3h46cHPZVqhpOwl7AmNqRvXa/oE3VK0Hu38WU3btXjUf8C7Pqd7Uu9SUz
         MB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=jkZzTWDHBqPoHg16Nm+pis9QHrtoPCcYiYAu5f2sNtY=;
        b=JHVZEK9/Rz8RAUFcZfWs1ls1Q3aIfsaJhn3UtGjbGyaianeVJ5tJqzULMqyQC+F0d4
         8StFeNkCDb+yOnGiqOFlSFDPw4dBhyjQRzYDAIGYSs5yRPuUpLyzK1c8TTxnKs8Asx57
         NG/rBoYDg0Kp61j0uJBUyr02VM5TRT2kzfwiJe2411k1CFnB97uUR4jT1445AWwsWV8g
         gUtPcaGuIctgFgj/DLfRl1xTejUfX3VcbrcmTd3qktg7SzMi3XoRK9bZC74ZzTABk5uf
         aEu7fQE+HipX3U9apAWNSGd/guKu/MixHPjcSs/VHPZj1d90jwvxh0ZwbWCQNFcYAamT
         etdg==
X-Gm-Message-State: AOAM5325UGe0TvvIhjn7GlUQq45WtFiG8DCNS2ORsDE4h+ceCQRRdwjc
        MszgEsFmvthiX0v2IavA3FPOVW3zFCQQPkJA1EY6vg==
X-Google-Smtp-Source: ABdhPJxn5+DCF9UT/ql99SzxkYx17/fKw+mJASvOS9DF30jC0PVmWvIU+xUktXsuX+KainJK1wVB63olE/GnkOPsKhg=
X-Received: by 2002:a2e:2c12:: with SMTP id s18mr36352894ljs.274.1641356680586;
 Tue, 04 Jan 2022 20:24:40 -0800 (PST)
MIME-Version: 1.0
References: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
In-Reply-To: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 5 Jan 2022 12:24:28 +0800
Message-ID: <CANXhq0qdNxxi=jmrpMO-NKbxbHwaqoj=VGqphCw8cz+9DAyBDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: sifive: Fix W=1 kernel build warning
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>, lee.jones@linaro.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 8, 2021 at 6:06 PM Zong Li <zong.li@sifive.com> wrote:
>
> This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> Declare static const variable 'prci_clk_fu540' where it's used").
> For fixing W=3D1 kernel build warning(s) about =E2=80=98prci_clk_fu540=E2=
=80=99 defined
> but not used [-Wunused-const-variable=3D], the problem is that the C file
> of fu540 and fu740 doesn't use these variables, but they includes the
> header files. We could refine the code by moving the definition of these
> variable into fu540 and fu740 implementation respectively, instead of
> common core code, then we could still separate the SoCs-dependent data
> in their own implementation.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/clk/sifive/fu540-prci.c  |  6 +++++-
>  drivers/clk/sifive/fu540-prci.h  |  6 +-----
>  drivers/clk/sifive/fu740-prci.c  |  6 +++++-
>  drivers/clk/sifive/fu740-prci.h  | 11 +----------
>  drivers/clk/sifive/sifive-prci.c |  5 -----
>  5 files changed, 12 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-p=
rci.c
> index 29bab915003c..5568bc26e36f 100644
> --- a/drivers/clk/sifive/fu540-prci.c
> +++ b/drivers/clk/sifive/fu540-prci.c
> @@ -20,7 +20,6 @@
>
>  #include <dt-bindings/clock/sifive-fu540-prci.h>
>
> -#include "fu540-prci.h"
>  #include "sifive-prci.h"
>
>  /* PRCI integration data for each WRPLL instance */
> @@ -87,3 +86,8 @@ struct __prci_clock __prci_init_clocks_fu540[] =3D {
>                 .ops =3D &sifive_fu540_prci_tlclksel_clk_ops,
>         },
>  };
> +
> +struct prci_clk_desc prci_clk_fu540 =3D {
> +       .clks =3D __prci_init_clocks_fu540,
> +       .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
> +};
> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-p=
rci.h
> index c220677dc010..931d6cad8c1c 100644
> --- a/drivers/clk/sifive/fu540-prci.h
> +++ b/drivers/clk/sifive/fu540-prci.h
> @@ -7,10 +7,6 @@
>  #ifndef __SIFIVE_CLK_FU540_PRCI_H
>  #define __SIFIVE_CLK_FU540_PRCI_H
>
> -#include "sifive-prci.h"
> -
> -#define NUM_CLOCK_FU540        4
> -
> -extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
> +extern struct prci_clk_desc prci_clk_fu540;
>
>  #endif /* __SIFIVE_CLK_FU540_PRCI_H */
> diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-p=
rci.c
> index 53f6e00a03b9..0ade3dcd24ed 100644
> --- a/drivers/clk/sifive/fu740-prci.c
> +++ b/drivers/clk/sifive/fu740-prci.c
> @@ -8,7 +8,6 @@
>
>  #include <dt-bindings/clock/sifive-fu740-prci.h>
>
> -#include "fu540-prci.h"
>  #include "sifive-prci.h"
>
>  /* PRCI integration data for each WRPLL instance */
> @@ -132,3 +131,8 @@ struct __prci_clock __prci_init_clocks_fu740[] =3D {
>                 .ops =3D &sifive_fu740_prci_pcie_aux_clk_ops,
>         },
>  };
> +
> +struct prci_clk_desc prci_clk_fu740 =3D {
> +       .clks =3D __prci_init_clocks_fu740,
> +       .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu740),
> +};
> diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-p=
rci.h
> index 511a0bf7ba2b..5bc0e18f058c 100644
> --- a/drivers/clk/sifive/fu740-prci.h
> +++ b/drivers/clk/sifive/fu740-prci.h
> @@ -7,15 +7,6 @@
>  #ifndef __SIFIVE_CLK_FU740_PRCI_H
>  #define __SIFIVE_CLK_FU740_PRCI_H
>
> -#include "sifive-prci.h"
> -
> -#define NUM_CLOCK_FU740        9
> -
> -extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
> -
> -static const struct prci_clk_desc prci_clk_fu740 =3D {
> -       .clks =3D __prci_init_clocks_fu740,
> -       .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu740),
> -};
> +extern struct prci_clk_desc prci_clk_fu740;
>
>  #endif /* __SIFIVE_CLK_FU740_PRCI_H */
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive=
-prci.c
> index 80a288c59e56..916d2fc28b9c 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -12,11 +12,6 @@
>  #include "fu540-prci.h"
>  #include "fu740-prci.h"
>
> -static const struct prci_clk_desc prci_clk_fu540 =3D {
> -       .clks =3D __prci_init_clocks_fu540,
> -       .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
> -};
> -
>  /*
>   * Private functions
>   */
> --
> 2.31.1
>

ping
