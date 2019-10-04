Return-Path: <SRS0=AOYt=X5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F369C47404
	for <linux-clk@archiver.kernel.org>; Fri,  4 Oct 2019 12:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A2C921D81
	for <linux-clk@archiver.kernel.org>; Fri,  4 Oct 2019 12:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McaTuND8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbfJDMSS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Oct 2019 08:18:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36523 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJDMSR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Oct 2019 08:18:17 -0400
Received: by mail-wm1-f66.google.com with SMTP id m18so5622332wmc.1;
        Fri, 04 Oct 2019 05:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a5ZHEoqYReyHaWoTAGRJX9sQBJyRzf+dIboLmi7nj5g=;
        b=McaTuND8turrP8fNwJCff5YQXhQrjmaDzl9ocbUv5Ugx29QIrR5ia2DPTooopT3un9
         4qrw0YjmUxHAOAcP9DWHMrgFTTLgE7xlkEpojcldyDCdQtJiP/CXyFtPoT1xDUzTg3kn
         T6pv3yrrrhHGsxllnl+Ig9xB4eBr3UOs3tCfZXjoXMp71CzF2s/kcEPNjirjRC1HOTLH
         L4e0HDc/zJDoRf+fh5TIo5ooRwVhtH9mzXzna/MoQpkA3uOToDmMRMex7a1dLcRiCk8J
         Yh8ML/FxXVC6lcQz5yBlEO7i3/xsHEHr2LA6+jjxIJM71kN3b0R7ZU2cKmb3MZ/b5sBO
         P9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a5ZHEoqYReyHaWoTAGRJX9sQBJyRzf+dIboLmi7nj5g=;
        b=nM+0R/PaTVsrTsv8kpoxrp1EFbwRfzMESZJbzlSkLk991hwvlEt/svI2t64kY+cR9p
         RYyqer0fVHJdbdUzeA3N/0Lazadd5NvhbargEQQLxK1bjiNxmPjFquY1TkxF1dTyxZGG
         mi5p0nqn9JTTA6hffsNoaQX1CvhLFxK8odqF90ei73/RwdD0DZtrT49vxLNpf9OeMR4L
         c9CxLou3SH91b3z3sIqdcVIUygt3eCrR2LEX7vOUoZ5rLQqxb/KTSo3eQ+DyrNCjxIzB
         l6TTdFU4LrQsnTq4NhC6GsoSiGAciV7dE/64tmGXo7qvGV9VuwLXd1KaSU4mRypZh4MV
         /bng==
X-Gm-Message-State: APjAAAW8Y38O1IDUoONepS6D3OltEw4SS9dtLLiom0z9j2k4Spp6eKmS
        TL6yah7dM+wke1E5vejNKpw=
X-Google-Smtp-Source: APXvYqxJzlLEHbVZCmH6QoqZrLg/HvfDtfdkC4eDJSbBmNwr4U6R0EuzbBoYdlFg1/DhY1M0HTD9EA==
X-Received: by 2002:a1c:1d84:: with SMTP id d126mr10361445wmd.58.1570191494755;
        Fri, 04 Oct 2019 05:18:14 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id z189sm6462542wmc.25.2019.10.04.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 05:18:13 -0700 (PDT)
Date:   Fri, 4 Oct 2019 14:18:12 +0200
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
Message-ID: <20191004121812.GB227112@ulmo>
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
 <20191002110454.GJ3716706@ulmo>
 <6a48d716-2312-4623-f47a-a53ac2ece83c@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <6a48d716-2312-4623-f47a-a53ac2ece83c@wwwdotorg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 02:59:03PM -0600, Stephen Warren wrote:
> On 10/2/19 5:04 AM, Thierry Reding wrote:
> > On Tue, Oct 01, 2019 at 03:13:43PM -0600, Stephen Warren wrote:
> > > From: Stephen Warren <swarren@nvidia.com>
> > >=20
> > > For a little over a year, U-Boot has configured the flow controller to
> > > perform automatic RAM re-repair on off->on power transitions of the C=
PU
> > > rail1]. This is mandatory for correct operation of Tegra124. However,=
 RAM
> > > re-repair relies on certain clocks, which the kernel must enable and
> > > leave running. The fuse clock is one of those clocks. Enable this clo=
ck
> > > so that LP1 power mode (system suspend) operates correctly.
> > >=20
> > > [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
> > >=20
> > > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Stephen Warren <swarren@nvidia.com>
> > > ---
> > >   drivers/clk/tegra/clk-tegra124.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk=
-tegra124.c
> > > index 0224fdc4766f..f53f6315c646 100644
> > > --- a/drivers/clk/tegra/clk-tegra124.c
> > > +++ b/drivers/clk/tegra/clk-tegra124.c
> > > @@ -1291,6 +1291,7 @@ static struct tegra_clk_init_table common_init_=
table[] __initdata =3D {
> > >   };
> > >   static struct tegra_clk_init_table tegra124_init_table[] __initdata=
 =3D {
> > > +	{ TEGRA124_CLK_FUSE, -1, 0, 1 },
> >=20
> > I think the correct way to do this these days is to mark the clock as
> > CRITICAL. Not sure if there's an easy way to do that given that the
> > clock init table doesn't allow storing flags.
> >=20
> > Do you have any good ideas on how to achieve this with the critical flag
> > instead of forcing the refcount to 1?
> >=20
> > Perhaps something like the below would work?
> > ...
>=20
> The following works for me; does this seem like a reasonable approach? It
> does set the critical flag for all SoCs, including any that don't require
> RAM re-repair. I'm not sure which do; I know it's more than just Tegra124,
> but I'm not sure how far back/forward the requirement goes.
>=20
> > diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/c=
lk-tegra-periph.c
> > index 1ed85f120a1b..76dd91eebd13 100644
> > --- a/drivers/clk/tegra/clk-tegra-periph.c
> > +++ b/drivers/clk/tegra/clk-tegra-periph.c
> > @@ -785,7 +785,7 @@ static struct tegra_periph_init_data gate_clks[] =
=3D {
> >         GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
> >         GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
> >         GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_N=
O_RESET, tegra_clk_kbc, 0),
> > -       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, =
0),
> > +       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, =
CLK_IS_CRITICAL),
> >         GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_f=
use_burn, 0),
> >         GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse=
, 0),
> >         GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbi=
f, 0),

It's probably fine to do this. The patch I proposed would've restricted
the change to just Tegra124. But if we need this on other generations, I
don't think the extra complexity is justified, especially since I can't
imagine that the FUSE clock remaining always on would consume a lot of
extra power.

Thierry

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2XOIQACgkQ3SOs138+
s6HlwxAAh5ESXhxNQcvDEspLmSsT6O8TIw5aMmfrdeUldnIoOilb5YUh4dp7CixY
/+pOnbUDDYbNaYlViZ65/xqJ5/C0+iDn7Kxs4t/AN5W7HNVeUL6p5ltd/iRNIpF7
eiyePXcChZOmYc98HtSsos+2cOMfQ6vyvpDN90tETJZrPvrxp66osXSy2YaECWqy
SE6DeN4eJof5bnY+t8EiiXK2rfIcuKMNG9axtYuDcNWlvG+tIrNUbcF2GaajESXe
yfxAjlFH2CKfhQ0ju7DIxxkfFhtStvm+1qnW4oUPEzC4LIRRTRBHDFWOmrPnU0UH
DKvVQxWSfanaNNFSCBTsT6J+qpVR0N78MlBgWeM9DCQq4fy0lcrozLQhyuyQHeh2
OyXmhfFSm53UilGeFG84kBgu2QfDlWjFMLg4rndPIqCBlVoowbPu6u62Dolxpfp7
ejH7+jGz3ftckFJblStXDw5AwR7x0Aa8X4xYqzrkbDcVXw7R5Mynn6vWYxGurWRd
M4I2Lozh/HqPHAIkSvHujI7GxLxa5fVez9kUPMjIyWB6eIE7yE2u33NEQ86FFzlr
x0hOLwNhnXhhAZXeKqP6N6wpCTVBX9AVZEGjjRaQKAXIaJWhBbqV5r5PNYGJIPvq
AUqYyl/uWZ1GqdJSoLVS42uhIz7D+CsHVGAZfAm7PDpvMg2ol3Q=
=C3XR
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
