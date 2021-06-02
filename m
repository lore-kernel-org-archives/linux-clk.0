Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BE9C4708F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 07:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 540A8613AD
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 07:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhFBHsr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:48:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232179AbhFBHsi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jun 2021 03:48:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A34F61042;
        Wed,  2 Jun 2021 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622620015;
        bh=XADOai21bfBJ15QyvyyjM1TeKHCkHXVRxnv0Sg4Wq0w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=motuB2MAOBwUP5D68v58jPIzkbjP1T7rAALE/0jkX+sPYcIJDFpNbedtnUu6PeDhF
         yJIMBGYeKwBvbn70kI9Br4ce5em2TLLlSxx4JkRgOyxFqYsE3A0pn/ovZjzYwFjHPv
         yGGay41NZyESmsMGffCebm+6R3EnmvLcO2oo04ZxtT1ADjy9EFxiNVkHCEpBj8JRu/
         UkuGAuTcOH/ndpvM4U2yRIkDAfIkmggWK6Wk6GHvDKIQPIJbfNjNsgiZ0+oHbR8tf+
         oUVT8NUcfNapcytgV/ogBf/JnU9MtD9dV9zw5ZusA8U/C5GcyW66OyTAPBo2Sl242c
         nSzqU3ybTKlpQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210528180135.1640876-1-l.stach@pengutronix.de>
References: <20210528180135.1640876-1-l.stach@pengutronix.de>
Subject: Re: [PATCH] clk: imx8mq: remove SYS PLL 1/2 clock gates
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
To:     Abel Vesa <abel.vesa@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 02 Jun 2021 00:46:54 -0700
Message-ID: <162262001425.4130789.11065881280638357225@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lucas Stach (2021-05-28 11:01:35)
> Remove the PLL clock gates as the allowing to gate the sys1_pll_266m brea=
ks
> the uSDHC module which is sporadically unable to enumerate devices after
> this change. Also it makes AMP clock management harder with no obvious
> benefit to Linux, so just revert the change.
>=20
> Fixes: b04383b6a558 ("clk: imx8mq: Define gates for pll1/2 fixed dividers=
")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> Previously this was a more targeted change only reverting the problematic
> bit for uSDHC, but Jacky Bai expressed the desire to just revert the whole
> change, as it makes things harder for AMP use-cases.
> ---

Do we need to take this via clk-fixes for this release? Or can it be
punted to the next one? The commit it is fixing is not new this merge
window, but if there are big problems then I guess it is OK. The patch
is fairly large but if uSDHC works better with it applied that is
probably good enough.

>  drivers/clk/imx/clk-imx8mq.c             | 56 ++++++++----------------
>  include/dt-bindings/clock/imx8mq-clock.h | 19 --------
>  2 files changed, 18 insertions(+), 57 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index b08019e1faf9..c491bc9c61ce 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -358,46 +358,26 @@ static int imx8mq_clocks_probe(struct platform_devi=
ce *pdev)
>         hws[IMX8MQ_VIDEO2_PLL_OUT] =3D imx_clk_hw_sscg_pll("video2_pll_ou=
t", video2_pll_out_sels, ARRAY_SIZE(video2_pll_out_sels), 0, 0, 0, base + 0=
x54, 0);
> =20
>         /* SYS PLL1 fixed output */
> -       hws[IMX8MQ_SYS1_PLL_40M_CG] =3D imx_clk_hw_gate("sys1_pll_40m_cg"=
, "sys1_pll_out", base + 0x30, 9);
> -       hws[IMX8MQ_SYS1_PLL_80M_CG] =3D imx_clk_hw_gate("sys1_pll_80m_cg"=
, "sys1_pll_out", base + 0x30, 11);
> -       hws[IMX8MQ_SYS1_PLL_100M_CG] =3D imx_clk_hw_gate("sys1_pll_100m_c=
g", "sys1_pll_out", base + 0x30, 13);
> -       hws[IMX8MQ_SYS1_PLL_133M_CG] =3D imx_clk_hw_gate("sys1_pll_133m_c=
g", "sys1_pll_out", base + 0x30, 15);
> -       hws[IMX8MQ_SYS1_PLL_160M_CG] =3D imx_clk_hw_gate("sys1_pll_160m_c=
g", "sys1_pll_out", base + 0x30, 17);
> -       hws[IMX8MQ_SYS1_PLL_200M_CG] =3D imx_clk_hw_gate("sys1_pll_200m_c=
g", "sys1_pll_out", base + 0x30, 19);
> -       hws[IMX8MQ_SYS1_PLL_266M_CG] =3D imx_clk_hw_gate("sys1_pll_266m_c=
g", "sys1_pll_out", base + 0x30, 21);
> -       hws[IMX8MQ_SYS1_PLL_400M_CG] =3D imx_clk_hw_gate("sys1_pll_400m_c=
g", "sys1_pll_out", base + 0x30, 23);
> -       hws[IMX8MQ_SYS1_PLL_800M_CG] =3D imx_clk_hw_gate("sys1_pll_800m_c=
g", "sys1_pll_out", base + 0x30, 25);
> -
> -       hws[IMX8MQ_SYS1_PLL_40M] =3D imx_clk_hw_fixed_factor("sys1_pll_40=
m", "sys1_pll_40m_cg", 1, 20);
> -       hws[IMX8MQ_SYS1_PLL_80M] =3D imx_clk_hw_fixed_factor("sys1_pll_80=
m", "sys1_pll_80m_cg", 1, 10);
> -       hws[IMX8MQ_SYS1_PLL_100M] =3D imx_clk_hw_fixed_factor("sys1_pll_1=
00m", "sys1_pll_100m_cg", 1, 8);
> -       hws[IMX8MQ_SYS1_PLL_133M] =3D imx_clk_hw_fixed_factor("sys1_pll_1=
33m", "sys1_pll_133m_cg", 1, 6);
> -       hws[IMX8MQ_SYS1_PLL_160M] =3D imx_clk_hw_fixed_factor("sys1_pll_1=
60m", "sys1_pll_160m_cg", 1, 5);
> -       hws[IMX8MQ_SYS1_PLL_200M] =3D imx_clk_hw_fixed_factor("sys1_pll_2=
00m", "sys1_pll_200m_cg", 1, 4);
> -       hws[IMX8MQ_SYS1_PLL_266M] =3D imx_clk_hw_fixed_factor("sys1_pll_2=
66m", "sys1_pll_266m_cg", 1, 3);
> -       hws[IMX8MQ_SYS1_PLL_400M] =3D imx_clk_hw_fixed_factor("sys1_pll_4=
00m", "sys1_pll_400m_cg", 1, 2);
> -       hws[IMX8MQ_SYS1_PLL_800M] =3D imx_clk_hw_fixed_factor("sys1_pll_8=
00m", "sys1_pll_800m_cg", 1, 1);
> +       hws[IMX8MQ_SYS1_PLL_40M] =3D imx_clk_hw_fixed_factor("sys1_pll_40=
m", "sys1_pll_out", 1, 20);
> +       hws[IMX8MQ_SYS1_PLL_80M] =3D imx_clk_hw_fixed_factor("sys1_pll_80=
m", "sys1_pll_out", 1, 10);
> +       hws[IMX8MQ_SYS1_PLL_100M] =3D imx_clk_hw_fixed_factor("sys1_pll_1=
00m", "sys1_pll_out", 1, 8);
> +       hws[IMX8MQ_SYS1_PLL_133M] =3D imx_clk_hw_fixed_factor("sys1_pll_1=
33m", "sys1_pll_out", 1, 6);
> +       hws[IMX8MQ_SYS1_PLL_160M] =3D imx_clk_hw_fixed_factor("sys1_pll_1=
60m", "sys1_pll_out", 1, 5);
> +       hws[IMX8MQ_SYS1_PLL_200M] =3D imx_clk_hw_fixed_factor("sys1_pll_2=
00m", "sys1_pll_out", 1, 4);
> +       hws[IMX8MQ_SYS1_PLL_266M] =3D imx_clk_hw_fixed_factor("sys1_pll_2=
66m", "sys1_pll_out", 1, 3);
> +       hws[IMX8MQ_SYS1_PLL_400M] =3D imx_clk_hw_fixed_factor("sys1_pll_4=
00m", "sys1_pll_out", 1, 2);
> +       hws[IMX8MQ_SYS1_PLL_800M] =3D imx_clk_hw_fixed_factor("sys1_pll_8=
00m", "sys1_pll_out", 1, 1);
> =20
>         /* SYS PLL2 fixed output */
> -       hws[IMX8MQ_SYS2_PLL_50M_CG] =3D imx_clk_hw_gate("sys2_pll_50m_cg"=
, "sys2_pll_out", base + 0x3c, 9);
> -       hws[IMX8MQ_SYS2_PLL_100M_CG] =3D imx_clk_hw_gate("sys2_pll_100m_c=
g", "sys2_pll_out", base + 0x3c, 11);
> -       hws[IMX8MQ_SYS2_PLL_125M_CG] =3D imx_clk_hw_gate("sys2_pll_125m_c=
g", "sys2_pll_out", base + 0x3c, 13);
> -       hws[IMX8MQ_SYS2_PLL_166M_CG] =3D imx_clk_hw_gate("sys2_pll_166m_c=
g", "sys2_pll_out", base + 0x3c, 15);
> -       hws[IMX8MQ_SYS2_PLL_200M_CG] =3D imx_clk_hw_gate("sys2_pll_200m_c=
g", "sys2_pll_out", base + 0x3c, 17);
> -       hws[IMX8MQ_SYS2_PLL_250M_CG] =3D imx_clk_hw_gate("sys2_pll_250m_c=
g", "sys2_pll_out", base + 0x3c, 19);
> -       hws[IMX8MQ_SYS2_PLL_333M_CG] =3D imx_clk_hw_gate("sys2_pll_333m_c=
g", "sys2_pll_out", base + 0x3c, 21);
> -       hws[IMX8MQ_SYS2_PLL_500M_CG] =3D imx_clk_hw_gate("sys2_pll_500m_c=
g", "sys2_pll_out", base + 0x3c, 23);
> -       hws[IMX8MQ_SYS2_PLL_1000M_CG] =3D imx_clk_hw_gate("sys2_pll_1000m=
_cg", "sys2_pll_out", base + 0x3c, 25);
> -
> -       hws[IMX8MQ_SYS2_PLL_50M] =3D imx_clk_hw_fixed_factor("sys2_pll_50=
m", "sys2_pll_50m_cg", 1, 20);
> -       hws[IMX8MQ_SYS2_PLL_100M] =3D imx_clk_hw_fixed_factor("sys2_pll_1=
00m", "sys2_pll_100m_cg", 1, 10);
> -       hws[IMX8MQ_SYS2_PLL_125M] =3D imx_clk_hw_fixed_factor("sys2_pll_1=
25m", "sys2_pll_125m_cg", 1, 8);
> -       hws[IMX8MQ_SYS2_PLL_166M] =3D imx_clk_hw_fixed_factor("sys2_pll_1=
66m", "sys2_pll_166m_cg", 1, 6);
> -       hws[IMX8MQ_SYS2_PLL_200M] =3D imx_clk_hw_fixed_factor("sys2_pll_2=
00m", "sys2_pll_200m_cg", 1, 5);
> -       hws[IMX8MQ_SYS2_PLL_250M] =3D imx_clk_hw_fixed_factor("sys2_pll_2=
50m", "sys2_pll_250m_cg", 1, 4);
> -       hws[IMX8MQ_SYS2_PLL_333M] =3D imx_clk_hw_fixed_factor("sys2_pll_3=
33m", "sys2_pll_333m_cg", 1, 3);
> -       hws[IMX8MQ_SYS2_PLL_500M] =3D imx_clk_hw_fixed_factor("sys2_pll_5=
00m", "sys2_pll_500m_cg", 1, 2);
> -       hws[IMX8MQ_SYS2_PLL_1000M] =3D imx_clk_hw_fixed_factor("sys2_pll_=
1000m", "sys2_pll_1000m_cg", 1, 1);
> +       hws[IMX8MQ_SYS2_PLL_50M] =3D imx_clk_hw_fixed_factor("sys2_pll_50=
m", "sys2_pll_out", 1, 20);
> +       hws[IMX8MQ_SYS2_PLL_100M] =3D imx_clk_hw_fixed_factor("sys2_pll_1=
00m", "sys2_pll_out", 1, 10);
> +       hws[IMX8MQ_SYS2_PLL_125M] =3D imx_clk_hw_fixed_factor("sys2_pll_1=
25m", "sys2_pll_out", 1, 8);
> +       hws[IMX8MQ_SYS2_PLL_166M] =3D imx_clk_hw_fixed_factor("sys2_pll_1=
66m", "sys2_pll_out", 1, 6);
> +       hws[IMX8MQ_SYS2_PLL_200M] =3D imx_clk_hw_fixed_factor("sys2_pll_2=
00m", "sys2_pll_out", 1, 5);
> +       hws[IMX8MQ_SYS2_PLL_250M] =3D imx_clk_hw_fixed_factor("sys2_pll_2=
50m", "sys2_pll_out", 1, 4);
> +       hws[IMX8MQ_SYS2_PLL_333M] =3D imx_clk_hw_fixed_factor("sys2_pll_3=
33m", "sys2_pll_out", 1, 3);
> +       hws[IMX8MQ_SYS2_PLL_500M] =3D imx_clk_hw_fixed_factor("sys2_pll_5=
00m", "sys2_pll_out", 1, 2);
> +       hws[IMX8MQ_SYS2_PLL_1000M] =3D imx_clk_hw_fixed_factor("sys2_pll_=
1000m", "sys2_pll_out", 1, 1);
> =20
>         hws[IMX8MQ_CLK_MON_AUDIO_PLL1_DIV] =3D imx_clk_hw_divider("audio_=
pll1_out_monitor", "audio_pll1_bypass", base + 0x78, 0, 3);
>         hws[IMX8MQ_CLK_MON_AUDIO_PLL2_DIV] =3D imx_clk_hw_divider("audio_=
pll2_out_monitor", "audio_pll2_bypass", base + 0x78, 4, 3);
> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindin=
gs/clock/imx8mq-clock.h
> index 82e907ce7bdd..afa74d7ba100 100644
> --- a/include/dt-bindings/clock/imx8mq-clock.h
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -405,25 +405,6 @@
> =20
>  #define IMX8MQ_VIDEO2_PLL1_REF_SEL             266
> =20
> -#define IMX8MQ_SYS1_PLL_40M_CG                 267
> -#define IMX8MQ_SYS1_PLL_80M_CG                 268
> -#define IMX8MQ_SYS1_PLL_100M_CG                        269
> -#define IMX8MQ_SYS1_PLL_133M_CG                        270
> -#define IMX8MQ_SYS1_PLL_160M_CG                        271
> -#define IMX8MQ_SYS1_PLL_200M_CG                        272
> -#define IMX8MQ_SYS1_PLL_266M_CG                        273
> -#define IMX8MQ_SYS1_PLL_400M_CG                        274
> -#define IMX8MQ_SYS1_PLL_800M_CG                        275
> -#define IMX8MQ_SYS2_PLL_50M_CG                 276
> -#define IMX8MQ_SYS2_PLL_100M_CG                        277
> -#define IMX8MQ_SYS2_PLL_125M_CG                        278
> -#define IMX8MQ_SYS2_PLL_166M_CG                        279
> -#define IMX8MQ_SYS2_PLL_200M_CG                        280
> -#define IMX8MQ_SYS2_PLL_250M_CG                        281
> -#define IMX8MQ_SYS2_PLL_333M_CG                        282
> -#define IMX8MQ_SYS2_PLL_500M_CG                        283
> -#define IMX8MQ_SYS2_PLL_1000M_CG               284
> -

Just to doubly confirm, none of these are being used in dts files? It
would be simpler to leave these defines here and drop the clks from the
driver to reduce risk.

>  #define IMX8MQ_CLK_GPU_CORE                    285
>  #define IMX8MQ_CLK_GPU_SHADER                  286
>  #define IMX8MQ_CLK_M4_CORE                     287
