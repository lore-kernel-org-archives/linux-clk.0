Return-Path: <SRS0=ekiN=X3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6EDC35280
	for <linux-clk@archiver.kernel.org>; Wed,  2 Oct 2019 11:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9338120700
	for <linux-clk@archiver.kernel.org>; Wed,  2 Oct 2019 11:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb/xNqmM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfJBLFC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Oct 2019 07:05:02 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50322 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfJBLFC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Oct 2019 07:05:02 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so6727362wmg.0;
        Wed, 02 Oct 2019 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hzHiNYwEiQMY1fQfolaX55jjgo9qLlhwuZiwsuSVSjk=;
        b=lb/xNqmMYB8GiTdRbmVtRVwbbWCvqiKM9Bq2DlqnOdT1yV1ZXIvHy5DSfXhT2ySOZU
         NxxIgsgOtdtaPUF07kwEHY1+QhH7+HLjQ4OeOFLDcpNECezGowa/TOrIOF/9v4ZAbkwZ
         dGNTIVnypie+aL36RZk/i38s6HKQCq6UAL5H6cJFPOpMCEND/KQ3as+7ScOcm0oyL9hO
         i7kbRFJpyamg3ZMTpOPAVeBvz/63SuOZPJeF5n5XhQ6ANijKQhSk/r9dROmQAq6z3Gsi
         CD+c9NhM1NIyfqQbbT+ccf/KVYAcATPK8PyjbD3Yloe5H0prWLuBNTRb+2MOep0hYxUG
         FD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hzHiNYwEiQMY1fQfolaX55jjgo9qLlhwuZiwsuSVSjk=;
        b=TQhD6tN5ytnUk4SeUExfPVLT87MNwHKe46YWLKN4g8ND6zdIZpLv75yo/ktZ1BTvzw
         jsCwA5vIEEZj1c/70f5h0Slf2ZxD9PMTBsfvkHY3Jo+jRCVeZdxaTbsNRqFNzXgDEe6U
         O7qzSm9dBWNFS6kD3c4g+vzRcthInZgz8Q+N1SoajLzEcEQOsNmB2enTDnDIniMkf9+c
         5GyZwiBUDzlHTFj3Juxp8+iI89yjhxEIxO87ktyS8MsnIwGkz0OLMDIivBmh/e5XsrRL
         XGYElcQKqbDhIYfo6LeG8KhB6AObkF/OOSiapXXDPGF1vf3IrEsf7JV+cQ64lo+/NyNL
         UJ/w==
X-Gm-Message-State: APjAAAWVj/WXEl24YqytH3wi9zSZsodcEotg+O/hzK7mdbijcDEcbYya
        ZmEE68sz9s1IouWOhEEAL90=
X-Google-Smtp-Source: APXvYqxK+eN/tu6LMT3Jp958TgJOonu+QZb5u78vyMwFWSzhIw3yjXT0Lr1eTKTtPaYMkuG3AXtkkg==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr2386773wme.89.1570014297525;
        Wed, 02 Oct 2019 04:04:57 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id q15sm41028596wrg.65.2019.10.02.04.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:04:55 -0700 (PDT)
Date:   Wed, 2 Oct 2019 13:04:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: tegra: Enable fuse clock on Tegra124
Message-ID: <20191002110454.GJ3716706@ulmo>
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rmUrFcWP4LYae1gV"
Content-Disposition: inline
In-Reply-To: <20191001211346.104400-1-swarren@wwwdotorg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--rmUrFcWP4LYae1gV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 03:13:43PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> For a little over a year, U-Boot has configured the flow controller to
> perform automatic RAM re-repair on off->on power transitions of the CPU
> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
> re-repair relies on certain clocks, which the kernel must enable and
> leave running. The fuse clock is one of those clocks. Enable this clock
> so that LP1 power mode (system suspend) operates correctly.
>=20
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>=20
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra124.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-teg=
ra124.c
> index 0224fdc4766f..f53f6315c646 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1291,6 +1291,7 @@ static struct tegra_clk_init_table common_init_tabl=
e[] __initdata =3D {
>  };
> =20
>  static struct tegra_clk_init_table tegra124_init_table[] __initdata =3D {
> +	{ TEGRA124_CLK_FUSE, -1, 0, 1 },

I think the correct way to do this these days is to mark the clock as
CRITICAL. Not sure if there's an easy way to do that given that the
clock init table doesn't allow storing flags.

Do you have any good ideas on how to achieve this with the critical flag
instead of forcing the refcount to 1?

Perhaps something like the below would work?

Thierry

--- >8 ---
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra=
124.c
index 0224fdc4766f..bba12d8308d3 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -838,7 +838,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __=
initdata =3D {
 	[tegra_clk_spdif_out] =3D { .dt_id =3D TEGRA124_CLK_SPDIF_OUT, .present =
=3D true },
 	[tegra_clk_vi_9] =3D { .dt_id =3D TEGRA124_CLK_VI, .present =3D true },
 	[tegra_clk_vi_sensor_8] =3D { .dt_id =3D TEGRA124_CLK_VI_SENSOR, .present=
 =3D true },
-	[tegra_clk_fuse] =3D { .dt_id =3D TEGRA124_CLK_FUSE, .present =3D true },
+	[tegra_clk_fuse] =3D { .dt_id =3D TEGRA124_CLK_FUSE, .present =3D false },
 	[tegra_clk_fuse_burn] =3D { .dt_id =3D TEGRA124_CLK_FUSE_BURN, .present =
=3D true },
 	[tegra_clk_clk_32k] =3D { .dt_id =3D TEGRA124_CLK_CLK_32K, .present =3D t=
rue },
 	[tegra_clk_clk_m] =3D { .dt_id =3D TEGRA124_CLK_CLK_M, .present =3D true =
},
@@ -1033,6 +1033,12 @@ static __init void tegra124_periph_clk_init(void __i=
omem *clk_base,
 	clk_register_clkdev(clk, "cml1", NULL);
 	clks[TEGRA124_CLK_CML1] =3D clk;
=20
+	clk =3D tegra_clk_register_periph_gate("fuse", "clk_m",
+					     TEGRA_PERIPH_ON_APB, clk_base,
+					     CLK_IS_CRITICAL, 39,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA124_CLK_FUSE] =3D clk;
+
 	tegra_periph_clk_init(clk_base, pmc_base, tegra124_clks, &pll_p_params);
 }
=20

--rmUrFcWP4LYae1gV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UhFMACgkQ3SOs138+
s6FlZQ//cKIMvXQriD1VmW+HASRz/xjiUiEIAO7HKSifQ3AGz8Cefz3bltXfJgnl
PMWqX+UpxTMkUYNLqCl5bRwUQruyhnxVmeHDIlairmkEGAhrWvZpqgiQdrAoZzmp
/ruHc2e/hBWNUXEGHia9eeD5zwUNtUmI/XQQAXmoLSTTv38OooQWIp8ff/i3hwLh
921GSaoLo4QQmlzpU+VoUAlvBAbBZzL6a7/2QT6/CDP7g47PJfeD8xoQH+kuGHPn
B6ZWxqMq7CteI7SfdWRpF/frmaCV5bxQQ9w3+bwLxDl+CxXKV2AA/GjYt9In2M0Q
kqrCMM+77y+K4VL5Nz3BA46Z8TUK+5jLmrhYMpA3e5PrxeTEWKb+q+XDa1OnKNPK
mIfFYv97pPeKnBi5nOIy8AemssitWpbHBskVrRG42LjyQ5cknUvrNcCByOgW/6LC
UT1RvXZbukY0X2B0ePTiyMGRh5IVqiuUC6QqvBMP4WncDnKncKKcA1N8In22DaFZ
61uJdMIXMurMkDR3IfR4ZKUvKFHeojGmzBzO5lQyWOua11S1yJcfwoIqhRW4JPEy
nySi33yc0t9Nm6AhXeArW1r1fnrujO2+9aqEaMtiYnnym6kQhs8RfaQ0eke92KAJ
QroNOG0WObaFbkOv0MW7RB1DAxgcPeMrWWRysiEaZ4rYFho+MgE=
=hRxp
-----END PGP SIGNATURE-----

--rmUrFcWP4LYae1gV--
