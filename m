Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9319C2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8376C20A8B
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604543121;
	bh=EjBpKJZlt9v5YdXaucPakqZGNkAK61LEPBusNVkf3c4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=YcU0TEFyazb0gId8xwyFKYuQEJ+0VG2W8vYwIDtFPFFvKX94fD9erY7MJVg2Uu9oH
	 nVf+la8RknNpuyDDO1ndI6TPH+L2M1LBVkFhEkFqq+sVpUT5FAuUV35j5U1WalfTLZ
	 owC6/92D3xUx/Ivj9y5P5SqM4d08sr3X8x5Jc4kw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387539AbgKECZS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 21:25:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:48474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727986AbgKECZS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 21:25:18 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7DDE20735;
        Thu,  5 Nov 2020 02:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604543117;
        bh=EjBpKJZlt9v5YdXaucPakqZGNkAK61LEPBusNVkf3c4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2HOiP02plc1lLQuK2yWzaqnUObwc2NHwnopza5HiTzbQ4kmOoE4vWhNqDgCbrYV8/
         XgJlaClbF0xQv0+gW6C5s+o/7QtaF9TeaCcHwgRg4Ld4upr2NPIITV+W9f6I7938jR
         bhEmaXLw2HRyPsKCbhnJJwmQ9qnVKO0zPmIq8q+c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201028074232.22922-5-manivannan.sadhasivam@linaro.org>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org> <20201028074232.22922-5-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 4/4] clk: qcom: Add support for SDX55 RPMh clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 04 Nov 2020 18:25:15 -0800
Message-ID: <160454311546.3965362.4976004557996560597@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-10-28 00:42:32)
> Add support for clocks maintained by RPMh in SDX55 SoCs.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index e2c669b08aff..88d010178b59 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -432,6 +432,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 =
=3D {
>         .num_clks =3D ARRAY_SIZE(sm8250_rpmh_clocks),
>  };
> =20
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> +
> +static struct clk_hw *sdx55_rpmh_clocks[] =3D {
> +       [RPMH_CXO_CLK]          =3D &sdm845_bi_tcxo.hw,
> +       [RPMH_CXO_CLK_A]        =3D &sdm845_bi_tcxo_ao.hw,
> +       [RPMH_RF_CLK1]          =3D &sdx55_rf_clk1.hw,
> +       [RPMH_RF_CLK1_A]        =3D &sdx55_rf_clk1_ao.hw,
> +       [RPMH_RF_CLK2]          =3D &sdx55_rf_clk2.hw,
> +       [RPMH_RF_CLK2_A]        =3D &sdx55_rf_clk2_ao.hw,
> +       [RPMH_QPIC_CLK]         =3D &sdx55_qpic_clk.hw,

What is QPIC? Some PMIC clk? Please mention it in the commit text.

> +};
