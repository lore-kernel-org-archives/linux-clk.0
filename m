Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA0DC10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 16:49:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE68C20880
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 16:49:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8zMMGVJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfDHQtv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 12:49:51 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36937 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfDHQtv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 12:49:51 -0400
Received: by mail-pg1-f196.google.com with SMTP id e6so7652137pgc.4;
        Mon, 08 Apr 2019 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7TPvmRg+4i4Ld4+hCBVdjXWtFIhJCUrSp7ivIDpf6UI=;
        b=I8zMMGVJyu4cbxbsZlodDl795v3SHSEcvFgveJ9vgtZBbkwpjnlACVl07aanqYY/Lb
         R3OAS70zOwnE4Kye9ZmW3EI4mIB5Xfqe0Vh+RtGN7xbQ2h3sCVEFZ7HWwzxL0pZs5oDv
         M7NSUxCWs9GqGuSHIqmGaFliolDUli8XNJjG/Tg4xb7hl1wTH1+RlaPxMFiwWhjJQv76
         VPQ40tNlcUrNzbvZFxrA5tst7csIJq+4XoliASuD78teyovBzEZj0Pdzbkcab4vzYbUl
         enwf91a+h1KsWmYTXYS5lAH/F8xfpEFUso3hpr1YKQyIzGsQd8kni4xZONG4prPjXIU+
         tpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7TPvmRg+4i4Ld4+hCBVdjXWtFIhJCUrSp7ivIDpf6UI=;
        b=m9sLor/JaRy7zyKt3hM2FkZiunPIKVjMc5P+xA8vqeExo38CNHxsZcyU7X28puGlh/
         5AwSfg7BqpBhjvNrOr+GGLHAOUOQYesNn/3Ma+TLNlJQ5UbIdRverwIWDDVL3Eh2AtMs
         lQ9KVJJxxkMNlzb51cTCh1JN8eTXgME7ohJBb7tBgcoZZ753P9cYMVOcrjJMEZiCcCuj
         vbSqIeTdJovpl8PK8GxVFA1JhNC/J3G+uAoH+Z+afRvZ+XFjK7Jks06EaCQfsjaMAFYM
         soSxCUB7NhdOHtxuD8GcgtjZ4KHLszQ1opx6jS+/xb2KSn9pjgOLjWLAx2QlbGrMI8xH
         Z6fg==
X-Gm-Message-State: APjAAAW22G/STVmaywMbl+cSXmyJq0DNwp/+tNRidF9vd0gCq1D+i6Qa
        Qv8qr3lLjKmlcGeQEmYzkU1VrEf7jeKCeNEAGz8=
X-Google-Smtp-Source: APXvYqytFrZKgN1vqdu5/NXlZuF/ysoSILHyLKZz4cqmi0qtZZAA0YxJhUU/7jH5wvE+c7qOIxanBLj0O+jZapJQ07g=
X-Received: by 2002:a65:6210:: with SMTP id d16mr28617454pgv.110.1554742190136;
 Mon, 08 Apr 2019 09:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190328124939.23139-1-dave.mueller@gmx.ch> <20190408133354.20460-1-dave.mueller@gmx.ch>
In-Reply-To: <20190408133354.20460-1-dave.mueller@gmx.ch>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Apr 2019 19:49:39 +0300
Message-ID: <CAHp75Vf48dQ1aYhz9htBMC=8EK_iYNjcyO=O0sOzacmoEnZLvA@mail.gmail.com>
Subject: Re: [PATCH v4] clk: x86: Add system specific quirk to mark clocks as critical
To:     =?UTF-8?Q?David_M=C3=BCller?= <dave.mueller@gmx.ch>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Apr 8, 2019 at 4:34 PM David M=C3=BCller <dave.mueller@gmx.ch> wrot=
e:
>
> Since commit 648e921888ad ("clk: x86: Stop marking clocks as
> CLK_IS_CRITICAL"), the pmc_plt_clocks of the Bay Trail SoC are
> unconditionally gated off. Unfortunately this will break systems where th=
ese
> clocks are used for external purposes beyond the kernel's knowledge. Fix =
it
> by implementing a system specific quirk to mark the necessary pmc_plt_clk=
s as
> critical.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

supposed to go via CLK tree.

> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Signed-off-by: David M=C3=BCller <dave.mueller@gmx.ch>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - add '.' to comments / rename field as suggested by Andy Shevchenko
> Changes in v3:
> - add missing sentinel entry to critclk_systems table
> Changes in v2:
> - restore previous clk detection logic as suggested by Hans de Goede
>
>  drivers/clk/x86/clk-pmc-atom.c                | 14 ++++++++++---
>  drivers/platform/x86/pmc_atom.c               | 21 +++++++++++++++++++
>  .../linux/platform_data/x86/clk-pmc-atom.h    |  3 +++
>  3 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-ato=
m.c
> index d977193842df..19174835693b 100644
> --- a/drivers/clk/x86/clk-pmc-atom.c
> +++ b/drivers/clk/x86/clk-pmc-atom.c
> @@ -165,7 +165,7 @@ static const struct clk_ops plt_clk_ops =3D {
>  };
>
>  static struct clk_plt *plt_clk_register(struct platform_device *pdev, in=
t id,
> -                                       void __iomem *base,
> +                                       const struct pmc_clk_data *pmc_da=
ta,
>                                         const char **parent_names,
>                                         int num_parents)
>  {
> @@ -184,9 +184,17 @@ static struct clk_plt *plt_clk_register(struct platf=
orm_device *pdev, int id,
>         init.num_parents =3D num_parents;
>
>         pclk->hw.init =3D &init;
> -       pclk->reg =3D base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
> +       pclk->reg =3D pmc_data->base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_=
CTL_SIZE;
>         spin_lock_init(&pclk->lock);
>
> +       /*
> +        * On some systems, the pmc_plt_clocks already enabled by the
> +        * firmware are being marked as critical to avoid them being
> +        * gated by the clock framework.
> +        */
> +       if (pmc_data->critical && plt_clk_is_enabled(&pclk->hw))
> +               init.flags |=3D CLK_IS_CRITICAL;
> +
>         ret =3D devm_clk_hw_register(&pdev->dev, &pclk->hw);
>         if (ret) {
>                 pclk =3D ERR_PTR(ret);
> @@ -332,7 +340,7 @@ static int plt_clk_probe(struct platform_device *pdev=
)
>                 return PTR_ERR(parent_names);
>
>         for (i =3D 0; i < PMC_CLK_NUM; i++) {
> -               data->clks[i] =3D plt_clk_register(pdev, i, pmc_data->bas=
e,
> +               data->clks[i] =3D plt_clk_register(pdev, i, pmc_data,
>                                                  parent_names, data->npar=
ents);
>                 if (IS_ERR(data->clks[i])) {
>                         err =3D PTR_ERR(data->clks[i]);
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_a=
tom.c
> index 8f018b3f3cd4..eaec2d306481 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -17,6 +17,7 @@
>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/platform_data/x86/clk-pmc-atom.h>
> @@ -391,11 +392,27 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
>  }
>  #endif /* CONFIG_DEBUG_FS */
>
> +/*
> + * Some systems need one or more of their pmc_plt_clks to be
> + * marked as critical.
> + */
> +static const struct dmi_system_id critclk_systems[] __initconst =3D {
> +       {
> +               .ident =3D "MPL CEC1x",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
> +               },
> +       },
> +       { /*sentinel*/ }
> +};
> +
>  static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap=
,
>                           const struct pmc_data *pmc_data)
>  {
>         struct platform_device *clkdev;
>         struct pmc_clk_data *clk_data;
> +       const struct dmi_system_id *d =3D dmi_first_match(critclk_systems=
);
>
>         clk_data =3D kzalloc(sizeof(*clk_data), GFP_KERNEL);
>         if (!clk_data)
> @@ -403,6 +420,10 @@ static int pmc_setup_clks(struct pci_dev *pdev, void=
 __iomem *pmc_regmap,
>
>         clk_data->base =3D pmc_regmap; /* offset is added by client */
>         clk_data->clks =3D pmc_data->clks;
> +       if (d) {
> +               clk_data->critical =3D true;
> +               pr_info("%s critclks quirk enabled\n", d->ident);
> +       }
>
>         clkdev =3D platform_device_register_data(&pdev->dev, "clk-pmc-ato=
m",
>                                                PLATFORM_DEVID_NONE,
> diff --git a/include/linux/platform_data/x86/clk-pmc-atom.h b/include/lin=
ux/platform_data/x86/clk-pmc-atom.h
> index 3ab892208343..7a37ac27d0fb 100644
> --- a/include/linux/platform_data/x86/clk-pmc-atom.h
> +++ b/include/linux/platform_data/x86/clk-pmc-atom.h
> @@ -35,10 +35,13 @@ struct pmc_clk {
>   *
>   * @base:      PMC clock register base offset
>   * @clks:      pointer to set of registered clocks, typically 0..5
> + * @critical:  flag to indicate if firmware enabled pmc_plt_clks
> + *             should be marked as critial or not
>   */
>  struct pmc_clk_data {
>         void __iomem *base;
>         const struct pmc_clk *clks;
> +       bool critical;
>  };
>
>  #endif /* __PLATFORM_DATA_X86_CLK_PMC_ATOM_H */
> --
> 2.20.1
>


--=20
With Best Regards,
Andy Shevchenko
