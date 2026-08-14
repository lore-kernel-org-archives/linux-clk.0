Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21FD48988A;
	Fri, 14 Aug 2026 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786724271; cv=none; b=FDSdY9ICn2tEEcR1lKQ6dde8hdwrkhPp+baHi6zH3SwnWjghjPmG2113O1FVCY8kIKZlxJxJc1aTL42saebQVIiybWe3ty23s+r+cfZ2NCa8H7/+yQfoxohneigktN69etxywuDTFYPGMR1a8Q17+GjgRPcsGpKZknvJMiB/wis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786724271; c=relaxed/simple;
	bh=Hsm0ilBUsFYmcZnIHDNIMH0kZG/jJyXYiYiNXg/ePj0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Dokgrn2yd7YnfDaQdgUf6D8u9BjWdGKN054LUU0wCHXKzU0HMFOTJQdU/rcIPrSgCuwPk3c6/V7jb4rzmAFRdQBpLfeHgQBhWgxGNvrweZj9tVWYl5/jZrnUzijtwNDz5+HFFW5EpB3AWHqnOPXPBU3EUQQg+rXmbJAsUE9sCrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avUjzz+y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avUjzz+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA741F000E9;
	Fri, 14 Aug 2026 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786724270;
	bh=cl56UCgbHJRz1uOcu/M7rczSp3Dhl8lXYJV+SJ/Lhis=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=avUjzz+yEfxOpteWqliw+htABr9q/NMWNGAUsQ6Q4OjaQ+SneYzlYJr68gDXTwhBK
	 EuvYj1AtZdE/8BegGl0HPNQcDXPvpRPWYNeFMGfdd8ZU7+J13YSAdKhtINaeDNUvvu
	 MRBHawY9o0PPE4Cmco7/5azcSZ7Ye0BUzTHnb7/TnEfzcl6lI/6JTPGHHSvCPJdo6V
	 Qf2bnw/Spav0TWabA+Cs00b/BIparu2xFxB8dF16FZDJfhIP3KzgxmsiHSNw7t/2LM
	 axlX16t36smf9X7VHabvAJIEwkKOsiMFmrg3BZIn0ObrU5oUAkRAoD6febzhr9RLjt
	 E5dpEx5HvoLZg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260612085812.AA15D1F000E9@smtp.kernel.org>
References: <20260612-clk-v10-v10-6-eb92484eda38@nxp.com> <20260612085812.AA15D1F000E9@smtp.kernel.org>
Subject: Re: [PATCH v10 6/6] clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>
Date: Fri, 14 Aug 2026 09:17:48 -0700
Message-ID: <178672426822.5897.11563790103554525148@lazor>
User-Agent: alot/0.12

+Brian and Peng

It doesn't link for allmodconfig build

Quoting sashiko-bot@kernel.org (2026-06-12 01:58:12)
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>=20
> New issues:
> - [High] The driver fails to link when compiled as a module (`CONFIG_COMM=
ON_CLK_SCMI=3Dm`) because `clk-scmi.c` and `clk-scmi-oem.c` are built as se=
parate modules without exporting their shared symbols.
> - [High] Incorrect unit conversion for spread spectrum percentage causes =
valid spread values to be truncated to 0.
>=20
> Pre-existing issues:
> - [High] Missing bounds check on SCMI firmware-provided parent clock inde=
x leads to heap out-of-bounds read and wild pointer dereference.
> --
>=20
> commit 02412e4d55042034939e6eece844d1bd4d62d5e9
> Author: Peng Fan <peng.fan@nxp.com>
>=20
> clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver
>=20
> Introduces clk-scmi-oem.c to support vendor-specific OEM extensions for t=
he
> SCMI clock driver. This enables querying OEM-specific features and setting
> spread spectrum configurations.
>=20
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 6a726331b6c9e..c2ae700ec0f2a 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -98,7 +98,7 @@ obj-$(CONFIG_COMMON_CLK_RP1)            +=3D clk-rp1.o
> >  obj-$(CONFIG_COMMON_CLK_RPMI)                +=3D clk-rpmi.o
> >  obj-$(CONFIG_COMMON_CLK_HI655X)              +=3D clk-hi655x.o
> >  obj-$(CONFIG_COMMON_CLK_S2MPS11)     +=3D clk-s2mps11.o
> > -obj-$(CONFIG_COMMON_CLK_SCMI)           +=3D clk-scmi.o
> > +obj-$(CONFIG_COMMON_CLK_SCMI)           +=3D clk-scmi.o clk-scmi-oem.o
>=20
> [Severity: High]
> Will this fail to link when compiled as a module (CONFIG_COMMON_CLK_SCMI=
=3Dm)?
>=20
> It looks like Kbuild will treat clk-scmi.o and clk-scmi-oem.o as separate
> kernel modules rather than linking them into a single composite module.
> Since neither file exports their shared symbols (like scmi_proto_clk_ops
> or scmi_clk_oem_init), won't this result in undefined reference errors?
>=20
> Should this use a composite module definition instead?
>=20
> scmi-clk-y :=3D clk-scmi.o clk-scmi-oem.o
> obj-$(CONFIG_COMMON_CLK_SCMI) +=3D scmi-clk.o
>=20
> [ ... ]
>=20
> > diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
> > new file mode 100644
> > index 0000000000000..be11d359b4ec3
> > --- /dev/null
> > +++ b/drivers/clk/clk-scmi-oem.c
>=20
> [ ... ]
>=20
> > +static int
> > +scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> > +                              const struct clk_spread_spectrum *ss_con=
f)
> > +{
> > +     struct scmi_clk *clk =3D to_scmi_clk(hw);
> > +     int ret;
> > +     u32 val;
> > +
> > +     /*
> > +      * extConfigValue[7:0]   - spread percentage (%)
> > +      * extConfigValue[23:8]  - Modulation Frequency
> > +      * extConfigValue[24]    - Enable/Disable
> > +      * extConfigValue[31:25] - Reserved
> > +      */
> > +     val =3D FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->sp=
read_bp / 10000);
>=20
> [Severity: High]
> Does this integer division by 10000 inadvertently truncate valid spread
> spectrum values to 0?
>=20
> Since ss_conf->spread_bp is in basis points (where 100 basis points equals
> 1%), and standard configurations usually range from 50 to 500 basis points
> (0.5% to 5%), dividing by 10000 will always result in zero. Could this
> divide by 100 instead to correctly convert basis points to a percentage?
>=20
> [ ... ]
>=20
> > diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> > index d88e78cc9a12e..2dd50c5b4ea8f 100644
> > --- a/drivers/clk/clk-scmi.c
> > +++ b/drivers/clk/clk-scmi.c
>=20
> [ ... ]
>=20
> > @@ -406,7 +419,7 @@ static int scmi_clocks_probe(struct scmi_device *sd=
ev)
> >                * to avoid sharing the devm_ allocated clk_ops between m=
ultiple
> >                * SCMI clk driver instances.
> >                */
> > -             scmi_ops =3D scmi_clk_ops_select(sclk, transport_is_atomi=
c,
> > +             scmi_ops =3D scmi_clk_ops_select(sdev, sclk, transport_is=
_atomic,
> >                                              atomic_threshold_us,
> >                                              scmi_clk_ops_db,
> >                                              ARRAY_SIZE(scmi_clk_ops_db=
));
>=20
> [Severity: High]
> This is a pre-existing issue, but is it possible for the SCMI firmware to
> trigger an out-of-bounds read right after this ops setup?
>=20
> Looking at scmi_clocks_probe(), it uses the parent index provided by the
> SCMI firmware to directly access the dynamically allocated hws array:
>=20
> drivers/clk/clk-scmi.c:scmi_clocks_probe() {
>     ...
>         for (int i =3D 0; i < sclk->info->num_parents; i++) {
>                 sclk->parent_data[i].index =3D sclk->info->parents[i];
>                 sclk->parent_data[i].hw =3D hws[sclk->info->parents[i]];
>     ...
> }
>=20
> If the firmware provides an index greater than or equal to the total clock
> count, won't this result in an out-of-bounds read on the heap, potentially
> dereferencing a wild pointer? Should this index be verified against count
> first?
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-clk-v10-=
v10-0-eb92484eda38@nxp.com?part=3D6
