Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE14C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:09:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A492820693
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567789785;
	bh=BNNllF0FjOInxrSgqhOawPj640tyUstNVfBjp7RKecU=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=yB2ea9my8j5MIXW40d04Ehg82CF9pwXoTNnWx4rdNiFdL0O6qDqwrdi/ahp8N01iP
	 uV/4vz15CaY8A4FGeaknc8vCS6KauimwtFPQ8G/gff279VApNCekvOMcrDf7YoYTWs
	 geBngfzImviyjuyKV6Kyooq7Tltd6dO5mARhDsS8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388067AbfIFRJp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:09:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:60194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733096AbfIFRJp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:09:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B861620578;
        Fri,  6 Sep 2019 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567789784;
        bh=BNNllF0FjOInxrSgqhOawPj640tyUstNVfBjp7RKecU=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=YSf77/C3UiKjN6tATKXLzwxWc1iXh4wXTn5RzbwF9+GsqqHtSVGbEwxjHJmR4DyLG
         KrTW+f0a2vBT85j6hbY7Fyj2OqNoKA2k1gsRGAAKsToe3i6ZwOO/4PglZm41szUf3n
         CLxCWd0LKfXammfVpMyD0uLJVKOrvYQN7D8S+KM0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566299605-15641-8-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-8-git-send-email-aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH V4 07/11] clk: imx: scu: add suspend/resume support
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:09:43 -0700
Message-Id: <20190906170944.B861620578@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-08-20 04:13:21)
> Clock state will be lost when its power domain is completely off
> during system suspend/resume. So we save and restore the state
> accordingly in suspend/resume callback.

And this doesn't need any coordination with other clks in the clk tree
right?

> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index edc39d7..8d9cfa2 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -46,6 +46,10 @@ struct clk_scu {
>         struct clk_hw hw;
>         u16 rsrc_id;
>         u8 clk_type;
> +
> +       /* for state save&restore */
> +       bool is_enabled;
> +       u32 rate;
>  };
> =20
>  /*
> @@ -425,6 +429,9 @@ struct clk_hw *__imx_clk_scu(struct device *dev, cons=
t char *name,
>                 hw =3D ERR_PTR(ret);
>         }
> =20
> +       if (dev)
> +               dev_set_drvdata(dev, clk);
> +
>         return hw;
>  }
> =20
> @@ -481,10 +488,52 @@ static int imx_clk_scu_probe(struct platform_device=
 *pdev)
>         return 0;
>  }
> =20
> +int __maybe_unused imx_clk_scu_suspend(struct device *dev)

static?

> +{
> +       struct clk_scu *clk =3D dev_get_drvdata(dev);
> +
> +       clk->rate =3D clk_hw_get_rate(&clk->hw);
> +       clk->is_enabled =3D clk_hw_is_enabled(&clk->hw);
> +
> +       if (clk->rate)
> +               dev_dbg(dev, "save rate %d\n", clk->rate);
> +
> +       if (clk->is_enabled)
> +               dev_dbg(dev, "save enabled state\n");
> +
> +       return 0;
> +}
> +
> +int __maybe_unused imx_clk_scu_resume(struct device *dev)

static?

> +{
> +       struct clk_scu *clk =3D dev_get_drvdata(dev);
> +       int ret =3D 0;
> +
> +       if (clk->rate) {
> +               ret =3D clk_scu_set_rate(&clk->hw, clk->rate, 0);
> +               dev_dbg(dev, "restore rate %d %s\n", clk->rate,
> +                       !ret ? "success" : "failed");
> +       }
> +
> +       if (clk->is_enabled) {
> +               ret =3D clk_scu_prepare(&clk->hw);
> +               dev_dbg(dev, "restore enabled state %s\n",
> +                       !ret ? "success" : "failed");
> +       }
> +
> +       return ret;
> +}
> +
> +const struct dev_pm_ops imx_clk_scu_pm_ops =3D {

static?

> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_clk_scu_suspend,
> +                                     imx_clk_scu_resume)
> +};
> +
