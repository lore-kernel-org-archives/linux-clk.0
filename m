Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E62EC43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:14:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5965620693
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567790095;
	bh=Fk8SG2kR+SS8znjkPZThYMqwvLJSJpeoX3XJkNQW8Mw=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=lcG9AuABdiZYkr8ECob8hyDdOm5He04uKE3PI7MVWUjF9chtmxdsZLT2ii2MfaSw8
	 UNo1E3PMftHz8DrWeF8Ruf8FXeDP4gHsmZiruBzVeRbVa58n+mZWBlaS65k92IHuH7
	 SLP7zQ6F+dZeVcXzcFSQ1Rxv7baHLkWLmaevPOFo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390143AbfIFROz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:14:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390079AbfIFROy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:14:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 167BF20640;
        Fri,  6 Sep 2019 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567790094;
        bh=Fk8SG2kR+SS8znjkPZThYMqwvLJSJpeoX3XJkNQW8Mw=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=NPcuOp9W489RuyDxA3gPyNxJ/r5A3+sCy/8hkEsqKM249eggL1qa57JAmJrToTg8p
         KbUMzf6EvO51BDSY4YxRZr/vhxDsqNSde4EUeFJLDe2Zgw8oExS90KYGXErMIUiFle
         TiK1mrAyj7JzaeqVcSTJ0JPPZtSbjTp3CeB28Btk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566299605-15641-12-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-12-git-send-email-aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH V4 11/11] clk: imx: lpcg: add suspend/resume support
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:14:53 -0700
Message-Id: <20190906171454.167BF20640@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-08-20 04:13:25)
> diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-sc=
u.c
> index 3c092a0..4df0818 100644
> --- a/drivers/clk/imx/clk-lpcg-scu.c
> +++ b/drivers/clk/imx/clk-lpcg-scu.c
> @@ -33,6 +33,9 @@ struct clk_lpcg_scu {
>         void __iomem *reg;
>         u8 bit_idx;
>         bool hw_gate;
> +
> +       /* for state save&restore */
> +       u32 state;
>  };
> =20
>  #define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
> @@ -112,5 +115,35 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev=
, const char *name,
>                 hw =3D ERR_PTR(ret);
>         }
> =20
> +       if (dev)
> +               dev_set_drvdata(dev, clk);
> +
>         return hw;
>  }
> +
> +int __maybe_unused imx_clk_lpcg_scu_suspend(struct device *dev)

static?

> +{
> +       struct clk_lpcg_scu *clk =3D dev_get_drvdata(dev);
> +
> +       clk->state =3D readl_relaxed(clk->reg);
> +       dev_dbg(dev, "save lpcg state 0x%x\n", clk->state);
> +
> +       return 0;
> +}
> +
> +int __maybe_unused imx_clk_lpcg_scu_resume(struct device *dev)

static?

> +{
> +       struct clk_lpcg_scu *clk =3D dev_get_drvdata(dev);
> +
> +       /* FIXME: double write in case a failure */
=20
What does this mean? Sometimes writes don't work unless the CPU issues
them twice?

> +       writel(clk->state, clk->reg);
> +       writel(clk->state, clk->reg);
> +       dev_dbg(dev, "restore lpcg state 0x%x\n", clk->state);
> +
> +       return 0;
> +}
> +
> +const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops =3D {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_clk_lpcg_scu_suspend,
> +                                     imx_clk_lpcg_scu_resume)
> +};
