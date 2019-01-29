Return-Path: <SRS0=lEqg=QF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DF6C169C4
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 22:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB7C8214D8
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 22:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548801797;
	bh=b/XtvaRgUKkbMi2X+BoThhhKkFY3m9VN9a1CX3zqoLg=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=P30CReZ0/2AI8IEwBJMS7B40GCxZ0OejVRusoKMB/SohadSCz5vXgJqWRKaF/bkU+
	 /e5e8A42h4ln67tA1VV+7HWhmTwS0ib0/1m6oe+OCPUuhAkDh09j2MTtUv6Y7Abmkx
	 Oate9E03njLmjB170Jp4KMhQlE9EdPpJ/P/sfqzg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbfA2WnQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jan 2019 17:43:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:48572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbfA2WmU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jan 2019 17:42:20 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC5E52147A;
        Tue, 29 Jan 2019 22:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548801739;
        bh=b/XtvaRgUKkbMi2X+BoThhhKkFY3m9VN9a1CX3zqoLg=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=sAeOe49vC+HgcWMVlBuBrLTP6h/Wp4HaoWKkRSgN7MeMrHCbrfK2tG6aPzG/yR2CD
         XpGBsQp0S3pLVQXt9yt5t9TXqmqLKdxDMJ4XUTaM58pBA2OLKn+rO8WhZs4lC11G7+
         Flio4p26MWADvWCaEEmqCVQ53I5HoEELlzDjJPy8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] clk: qcom: clk-rcg2: Introduce a cfg offset for RCGs
References: <20190128115359.30039-1-vkoul@kernel.org>
User-Agent: alot/0.8
Cc:     Khasim Syed Mohammed <khasim.mohammed@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190128115359.30039-1-vkoul@kernel.org>
Message-ID: <154880173887.136743.11486618909610624058@swboyd.mtv.corp.google.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Tue, 29 Jan 2019 14:42:18 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2019-01-28 03:53:58)
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index e5eca8a1abe4..f06783c20688 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -140,6 +140,7 @@ extern const struct clk_ops clk_dyn_rcg_ops;
>   * @parent_map: map from software's parent index to hardware's src_sel f=
ield
>   * @freq_tbl: frequency table
>   * @clkr: regmap clock handle
> + * @cfg_off: defines the cfg register offset from the CMD_RCGR
>   *

Please remove this extra line here. Also, shouldn't it say offset from
CMD_RCGR + CFG_REG?


>   */
>  struct clk_rcg2 {
> @@ -150,6 +151,7 @@ struct clk_rcg2 {
>         const struct parent_map *parent_map;
>         const struct freq_tbl   *freq_tbl;
>         struct clk_regmap       clkr;
> +       u8                      cfg_off;
>  };
> =20
>  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg=
2, clkr)
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 6e3bd195d012..106848e3313f 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -74,7 +74,8 @@ static u8 clk_rcg2_get_parent(struct clk_hw *hw)
>         u32 cfg;
>         int i, ret;
> =20
> -       ret =3D regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &c=
fg);
> +       ret =3D regmap_read(rcg->clkr.regmap,
> +                         rcg->cmd_rcgr + rcg->cfg_off + CFG_REG, &cfg);

Maybe we should define CFG_REG as CFG_REG(rcg) and then do the math
there?

#define CFG_REG(rcg) (rcg)->cfg_off + 0x4

>         if (ret)
>                 goto err;
> =20
> @@ -263,17 +268,20 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rc=
g, const struct freq_tbl *f)
>         if (rcg->mnd_width && f->n) {
>                 mask =3D BIT(rcg->mnd_width) - 1;
>                 ret =3D regmap_update_bits(rcg->clkr.regmap,
> -                               rcg->cmd_rcgr + M_REG, mask, f->m);
> +                                        rcg->cmd_rcgr + rcg->cfg_off + M=
_REG,
> +                                        mask, f->m);
>                 if (ret)
>                         return ret;
> =20
>                 ret =3D regmap_update_bits(rcg->clkr.regmap,
> -                               rcg->cmd_rcgr + N_REG, mask, ~(f->n - f->=
m));
> +                                        rcg->cmd_rcgr + rcg->cfg_off + N=
_REG,
> +                                        mask, ~(f->n - f->m));
>                 if (ret)
>                         return ret;
> =20
>                 ret =3D regmap_update_bits(rcg->clkr.regmap,
> -                               rcg->cmd_rcgr + D_REG, mask, ~f->n);
> +                                        rcg->cmd_rcgr + rcg->cfg_off + D=
_REG,
> +                                        mask, ~f->n);

Ah the MND registers also move. Wow that's so sad. Do a similar thing
for all these too?

#define D_REG(rcg) (rcg)->cfg_off + 0x8
etc...

All just to make things fit on the same number of lines as before! We
could also throw the rcg->cmd_rcgr part into the register named macros
to make things even shorter. It was mostly OK when it was just adding
the offset to the base, but now we have another offset so I think we can
roll it all into the macro so that we can just read "regmap_read
FOO_REG" and ignore the rest.

>                 if (ret)
>                         return ret;
>         }
