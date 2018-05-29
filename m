Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:45783 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965607AbeE2SQO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 May 2018 14:16:14 -0400
MIME-Version: 1.0
In-Reply-To: <20180529170436.22711-5-peron.clem@gmail.com>
References: <20180529170436.22711-1-peron.clem@gmail.com> <20180529170436.22711-5-peron.clem@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 May 2018 15:16:13 -0300
Message-ID: <CAOMZO5AwF6TprHKgiSfky3QoN0=PGBY6-Apy2MCjoThp0daydA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clocksource: add driver for i.MX EPIT timer
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Colin Didier <colin.didier@devialet.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 29, 2018 at 2:04 PM, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:

> +static int __init epit_timer_init(struct device_node *np)
> +{
> +       struct epit_timer *epittm;
> +       struct clk *clk_ipg;
> +       int ret;
> +
> +       epittm =3D kzalloc(sizeof(*epittm), GFP_KERNEL);
> +       if (!epittm)
> +               return -ENOMEM;
> +
> +       epittm->base =3D of_iomap(np, 0);
> +       if (!epittm->base) {
> +               ret =3D -ENXIO;
> +               goto out_kfree;
> +       }
> +
> +       epittm->irq =3D irq_of_parse_and_map(np, 0);
> +       if (!epittm->irq) {
> +               ret =3D -EINVAL;
> +               goto out_iounmap;
> +       }
> +
> +       clk_ipg =3D of_clk_get_by_name(np, "ipg");
> +       if (IS_ERR(clk_ipg)) {
> +               pr_err("i.MX EPIT: unable to get clk_ipg\n");
> +               ret =3D PTR_ERR(clk_ipg);
> +               goto out_iounmap;
> +       }
> +
> +       ret =3D clk_prepare_enable(clk_ipg);
> +       if (ret) {
> +               pr_err("i.MX EPIT: unable to prepare+enable clk_ipg\n");
> +               goto out_clk_ipg_disable;

This should be: goto out_iounmap;
