Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2373C5ACCC
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6939821470
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJvZhiE5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6939821470
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbeJQFUR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 01:20:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:49870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726936AbeJQFUR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 01:20:17 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF3D22145D;
        Tue, 16 Oct 2018 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539725279;
        bh=0FcRellGLOS7uy2RzktbyQFU41eqY4o9tYTwA2AsRWI=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=dJvZhiE5Nsu6tdx0IKMnvf4HpYk388dVHvV7EmwmCM64Pg4oceq+6t86yjIdKLApx
         mbwVWqhhsquEdcU1kB/Kw+zRfyJqGt9eLQB2qjUcCOftabVXE42+PKUkkzmgKaJkkb
         YUyL57Jc/rAbbQGXBMcefeAG5kU0HECUXikZsnNc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539504194-28289-5-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-5-git-send-email-aisheng.dong@nxp.com>
Message-ID: <153972527843.5275.15123840961402192766@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V4 04/11] clk: imx: scu: add scu clock gpr divider
Date:   Tue, 16 Oct 2018 14:27:58 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-14 01:07:52)
> +/*
> + * clk_divider_scu_recalc_rate - Get clock rate for a SCU clock
> + * @hw: clock to get rate for
> + * @parent_rate: parent rate provided by common clock framework
> + *
> + * Gets the current clock rate of a SCU clock. Returns the current
> + * clock rate, or zero in failure.
> + */
> +static unsigned long clk_divider_gpr_scu_recalc_rate(struct clk_hw *hw,
> +                                                    unsigned long parent=
_rate)
> +{
> +       struct clk_divider_gpr_scu *clk =3D to_clk_divider_gpr_scu(hw);
> +       u32 val;
> +       int ret;
> +
> +       ret =3D imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
> +                                     clk->gpr_id, &val);
> +       if (ret) {
> +               pr_err("%s: failed to get clock rate %d\n",
> +                       clk_hw_get_name(hw), ret);
> +               return 0;
> +       }
> +
> +       return val ? parent_rate / 2 : parent_rate;

I hope parent_rate can't be zero here.

> +}
> +
> +/*
> + * clk_divider_scu_round_rate - Round clock rate for a SCU clock
> + * @hw: clock to round rate for
> + * @rate: rate to round
> + * @parent_rate: parent rate provided by common clock framework
> + *
> + * Round clock rate for a SCU clock according to parent rate
> + */
> +static long clk_divider_gpr_scu_round_rate(struct clk_hw *hw, unsigned l=
ong rate,
> +                                          unsigned long *prate)
> +{
> +       if (rate < *prate)
> +               rate =3D *prate / 2;
> +       else
> +               rate =3D *prate;
> +
> +       return rate;
> +}
> +
> +/*
> + * clk_divider_scu_set_rate - Set rate for a SCU clock
> + * @hw: clock to change rate for
> + * @rate: target rate for the clock
> + * @parent_rate: rate of the clock parent
> + *
> + * Sets a clock frequency for a SCU clock. Returns the SCU
> + * protocol status.
> + */
> +static int clk_divider_gpr_scu_set_rate(struct clk_hw *hw, unsigned long=
 rate,
> +                                       unsigned long parent_rate)
> +{
> +       struct clk_divider_gpr_scu *clk =3D to_clk_divider_gpr_scu(hw);
> +       uint32_t val;
> +
> +       val =3D (rate < parent_rate) ? 1 : 0;

Nitpick: Write it out as =


	val =3D 0;
	if (rate < parent_rate)
		val =3D 1;

> +
> +       return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> +                                      clk->gpr_id, val);
> +}
> +
> +static const struct clk_ops clk_divider_gpr_scu_ops =3D {
> +       .recalc_rate =3D clk_divider_gpr_scu_recalc_rate,
> +       .round_rate =3D clk_divider_gpr_scu_round_rate,
> +       .set_rate =3D clk_divider_gpr_scu_set_rate,
> +};
> +
> +struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *par=
ent_name,
> +                                      u32 rsrc_id, u8 gpr_id)
> +{
> +       struct clk_divider_gpr_scu *div;
> +       struct clk_init_data init;
> +       struct clk_hw *hw;
> +       int ret;
> +
> +       div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> +       if (!div)
> +               return ERR_PTR(-ENOMEM);
> +
> +       div->rsrc_id =3D rsrc_id;
> +       div->gpr_id =3D gpr_id;
> +
> +       init.name =3D name;
> +       init.ops =3D &clk_divider_gpr_scu_ops;
> +       init.flags =3D CLK_GET_RATE_NOCACHE;

Same NOCACHE comment.

> +       init.parent_names =3D parent_name ? &parent_name : NULL;
> +       init.num_parents =3D parent_name ? 1 : 0;
> +
> +       div->hw.init =3D &init;
> +
> +       hw =3D &div->hw;
> +       ret =3D clk_hw_register(NULL, hw);
> +       if (ret) {
> +               kfree(div);
> +               hw =3D ERR_PTR(ret);
> +       }
> +
> +       return hw;
> +}
