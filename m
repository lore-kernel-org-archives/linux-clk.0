Return-Path: <SRS0=cs+B=Q3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2869C43381
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 21:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 673D02147A
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 21:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550696518;
	bh=RR+SZ56OZJgS3II6s2wzaViX6OuPLHUf7ImNWjhAkX4=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=tcKjz8XsY6OKunUYproMrq/jQ0fvKoUx9aQVU6HMwLcPoK+AORdwraktSQSJtLkBq
	 2bKwPYNTbWPE89YZkZt4jcJCkSNeDrjPhzHb44KcbSklhWDaOfD4iZoo0yvNW9DvJH
	 RGh/SSJ8AXY+eIVRb3rzdv7/+K1BjydVvOwE9Gz4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbfBTVB6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Feb 2019 16:01:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:44144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725798AbfBTVB6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Feb 2019 16:01:58 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BB542146E;
        Wed, 20 Feb 2019 21:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550696517;
        bh=RR+SZ56OZJgS3II6s2wzaViX6OuPLHUf7ImNWjhAkX4=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=WBJhQAmUoDQ8EwSdkQlyzbQChr0qv7aLtJXEhXkz7eUHUk6Gkam+9wS//m/x0uKQQ
         iDkIjgBiiwFQiegkV4MQoSV2gohyb/ye2DmlmkErbKcEZiFfnZIMwXNU78iXeg3DRd
         J81imxhWApucEk47eWgLmb53b7jHSMx3eHklebgg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] clk: imx: scu: add set parent support
Message-ID: <155069651632.77512.3946236932583154798@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1548855205-12249-1-git-send-email-aisheng.dong@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1548855205-12249-1-git-send-email-aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Date:   Wed, 20 Feb 2019 13:01:56 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2019-01-30 05:39:15)
> Add clk scu set parents support.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied to clk-next + below

> @@ -173,6 +208,49 @@ static int clk_scu_set_rate(struct clk_hw *hw, unsig=
ned long rate,
>         return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
>  }
> =20
> +static u8 clk_scu_get_parent(struct clk_hw *hw)
> +{
> +       struct clk_scu *clk =3D to_clk_scu(hw);
> +       struct imx_sc_msg_get_clock_parent msg;
> +       struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
> +       int ret;
> +
> +       hdr->ver =3D IMX_SC_RPC_VERSION;
> +       hdr->svc =3D IMX_SC_RPC_SVC_PM;
> +       hdr->func =3D IMX_SC_PM_FUNC_GET_CLOCK_PARENT;
> +       hdr->size =3D 2;
> +
> +       msg.data.req.resource =3D cpu_to_le16(clk->rsrc_id);
> +       msg.data.req.clk =3D clk->clk_type;
> +
> +       ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
> +       if (ret) {
> +               pr_err("%s: failed to get clock parent %d\n",
> +                      clk_hw_get_name(hw), ret);
> +               return 0;
> +       }
> +
> +       return le32_to_cpu(msg.data.resp.parent);

Sparse complains about this line because it's a u8 not an __le32 that's
being converted. I removed the le32_to_cpu() to fix this.

