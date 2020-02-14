Return-Path: <SRS0=/Rha=4C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C4FC352A3
	for <linux-clk@archiver.kernel.org>; Fri, 14 Feb 2020 01:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B9562168B
	for <linux-clk@archiver.kernel.org>; Fri, 14 Feb 2020 01:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581643331;
	bh=DFauc1AI7WmWmnqhOvJHxCJlqAvt9uVf2a1NKaMSOAg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=iSyhzOjh9oV5c16U9QiEsSY0zA9HAIqSWvwQiTsOHYJGETMJKevQ+2Q4Qhmv6mDB7
	 /9y23kcm1QjJSiRDZzuCrGQrkXYrYJvOU06nUiF4jUhWr37D0Ef7TjtiBwR6GgZ7Uk
	 CvBCwluGN81x4coP8T7BmoLbRMTYW30HHgfb3y24=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgBNBWK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Feb 2020 20:22:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:46158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727609AbgBNBWK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Feb 2020 20:22:10 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D6F52168B;
        Fri, 14 Feb 2020 01:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581643329;
        bh=DFauc1AI7WmWmnqhOvJHxCJlqAvt9uVf2a1NKaMSOAg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bEcnBT2OKPhU/jyuoaXoRQOTOEclUIujG05lVD5BPYALJwBAv+/XIQl/NDOqSGOx3
         +g29h9WOX3y3q057GnSckoZfPuGBnxl442suHneRMvwghwko0V9Cu+fBuobj76ZRT8
         MvZ3tbzktRd16I/q41rGh6JbXhfuZ8AmoqODtX3k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200213141119.66462-2-linus.walleij@linaro.org>
References: <20200213141119.66462-1-linus.walleij@linaro.org> <20200213141119.66462-2-linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] clk: versatile: Add device tree probing for IM-PD1 clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Date:   Thu, 13 Feb 2020 17:22:08 -0800
Message-ID: <158164332853.184098.9623366987294316507@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2020-02-13 06:11:19)
> diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/cl=
k-impd1.c
> index 1991f15a5db9..96b1018bcb7a 100644
> --- a/drivers/clk/versatile/clk-impd1.c
> +++ b/drivers/clk/versatile/clk-impd1.c
> @@ -175,3 +177,69 @@ void integrator_impd1_clk_exit(unsigned int id)
>         kfree(imc->pclkname);
>  }
>  EXPORT_SYMBOL_GPL(integrator_impd1_clk_exit);
> +
> +static void __init integrator_impd1_clk_spawn(struct device *dev,

Remove __init. Kinda surprised that compile didn't complain about that.

> +                                             void __iomem *base,
> +                                             struct device_node *np)
> +{
> +       struct clk *clk =3D ERR_PTR(-EINVAL);
> +       const char *clk_name =3D np->name;
> +       const char *parent_name;
> +       const struct clk_icst_desc *desc;
> +
> +       if (of_device_is_compatible(np, "arm,impd1-vco1")) {
> +               dev_info(dev, "register VCO1\n");
> +               desc =3D &impd1_icst1_desc;
> +       } else if (of_device_is_compatible(np, "arm,impd1-vco2")) {
> +               dev_info(dev, "register VCO2\n");

Do we need these dev_infos()?

> +               desc =3D &impd1_icst2_desc;
> +       } else {
> +               dev_err(dev, "not a clock node %s\n", np->name);
> +               return;
> +       }
> +
> +       of_property_read_string(np, "clock-output-names", &clk_name);

Can you use the new way of specifying parents so that this can be parsed
by the core framework?

> +
> +       parent_name =3D of_clk_get_parent_name(np, 0);
> +       clk =3D icst_clk_register(NULL, desc, clk_name, parent_name, base=
);
> +       if (!IS_ERR(clk))
> +               of_clk_add_provider(np, of_clk_src_simple_get, clk);

Can you add a hw provider? Maybe in a followup patch?

> +}
> +
> +static int integrator_impd1_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *child;
> +       void __iomem *base;
> +
> +       base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base)) {
> +               dev_err(dev, "unable to remap syscon base\n");
> +               return PTR_ERR(base);
> +       }
> +       dev_info(dev, "located syscon base\n");

More debug?

> +
> +       for_each_available_child_of_node(np, child)
> +               integrator_impd1_clk_spawn(dev, base, child);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id impd1_syscon_match[] =3D {
> +       { .compatible =3D "arm,im-pd1-syscon", },
> +       {}
> +};
> +

Add a module device table?

> +static struct platform_driver impd1_clk_driver =3D {
> +       .driver =3D {
> +               .name =3D "impd1-clk",
> +               .of_match_table =3D impd1_syscon_match,
> +       },
> +       .probe  =3D integrator_impd1_clk_probe,
> +};
> +builtin_platform_driver(impd1_clk_driver);
> +
