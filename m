Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060368;
	b=Ioq/Dw2YoBdQxfgARPgWQBniNNbd/xm1m5svmFbGwEu59tvKCPUTqO4/IDI1mfNnkltP
	 umKuUMcho3zCf/n7UC0hm79Se6sXOWKxCWKQI3tpoXlWxs470PZnr4SkZfp1ThhNbGaui
	 ZlBEoJJY7qTNIEkpGMhvVMaGLgYdvcDL0z6Qbfh+nVrvRNcj8fN4qgKKO6149P7NeKTFV
	 aiXmVd9bXCCUwPeTB3xPkijXhDN6LiibyRBN4ycfenPOF6cn0txeRnlesKl8cmSNJMKa7
	 UKQsJyVmLslxNXbxt4YQI+ujpsQ9hv+7PmShx9gqllSDFNUuLomf9hkOR2jtgC73VIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060368;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=GItsSVGA+hmlSb3pkjtiaee8VXcySXBDfV85yqW7yYo=;
	b=pqa05e4c12dERrp3nY5ON7sISGIVxBWzeE3sHZq7f/+Z3Ilkt+AKJMs+VVdGJd2czm8g
	 BPfktHMVVCJJfRuXTa3r92reTP98OIrY4RCZpy5ML1qd2pAV8rtCipOh9U8fAM4yfSRCl
	 0LC7mmzr+5OfcbRh3U3QhUdLgSU5GKaAkpMhn1fajQyBASC83+6Rs6ioasMF4vdWLjPb5
	 5jwvns9HoQfFsMj5DDgIs+/DqwJ3+6UamOrrzRJBM+YD3XQVpztMUNC+wvHR+Z5tBpAhJ
	 nQg+aljodmpG5A9ltsjjbztwM3geYiGdfwCxROvqZ5aBhWRpi6kh6HgJUdC0h4gbACQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=scpwGLIa;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E86606A325
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 03:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E86606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=scpwGLIa
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261119035244epoutp04767e27d55fa9d355f2064254fa00bef2~pVeQpHMt61859118591epoutp04d
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 03:52:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261119035244epoutp04767e27d55fa9d355f2064254fa00bef2~pVeQpHMt61859118591epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795060364;
	bh=GItsSVGA+hmlSb3pkjtiaee8VXcySXBDfV85yqW7yYo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=scpwGLIakHKeKIKPnnInJj9UZ5fFCTxB7xV3S4LDd+iGvU5eeir3qtAmIA3KOQ26P
	 Nnp3qaWtLV8V/eREk/tjeQ2SaDxdF+Soyy96FXSL0BxKTTeBVHXnmz2/y7Yy0Vq+UR
	 6Y4urXxRRxILNrdIb4nPXenq5jJvAjAqxU6K3PFg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261119035243epcas5p454481e6b84a96f7d913461c10bffc693~pVePvEJsS1381613816epcas5p43;
	Thu, 19 Nov 2026 03:52:43 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jVPgb1Y6Xz6B9m5; Thu, 19 Nov
	2026 03:52:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261119035242epcas5p24269dbcd55378604ded876d89bc24ace~pVeOoguQe1332113321epcas5p2V;
	Thu, 19 Nov 2026 03:52:42 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261119035240epsmtip23b287ee79b550d5d99b705423479e030~pVeMci5IC1577115771epsmtip2A;
	Thu, 19 Nov 2026 03:52:40 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Raghav Sharma'"
	<raghav.s@samsung.com>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <is.gandhi@samsung.com>,
	<ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>
Subject: RE: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for
 pll_4313
Date: Thu, 19 Nov 2026 09:22:38 +0530
Message-ID: <002901dd77d9$6ddef600$499ce200$@samsung.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJMpPSZ0SyccmPoxB6lh4WTmmzUIwGxlKqAAl95c38DMT8uKrYcTHkw
Content-Language: en-us
X-CMS-MailID: 20261119035242epcas5p24269dbcd55378604ded876d89bc24ace
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104847epcas5p1d970255218f1ca78b19690bfd097f303
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
	<20261113110612.3265841-1-raghav.s@samsung.com>
	<20261113110612.3265841-7-raghav.s@samsung.com>
	<CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>

Thanks Peter for review

> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Friday, November 13, 2026 5:58 PM
> To: Raghav Sharma <raghav.s=40samsung.com>
> Cc: krzk=40kernel.org; s.nawrocki=40samsung.com; cw00.choi=40samsung.com;
> alim.akhtar=40samsung.com; sboyd=40kernel.org; bmasney+clk=40redhat.com;
> jbrunet+clk=40baylibre.com; robh=40kernel.org; conor+dt=40kernel.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; is.gandhi=40samsung.com; ts.amit=40samsung.com;
> pokala.reddy=40samsung.com
> Subject: Re: =5BPATCH v3 06/14 RESEND=5D clk: samsung: clk-pll: Add suppo=
rt for
> pll_4313
>=20
> Hi Raghav,
>=20
> On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s=40samsung.com>
> wrote:
> >
> > From: Alim Akhtar <alim.akhtar=40samsung.com>
> >
> > PLLs 4313 are found in the Exynos8855 SoC and it is similar to
> > pll_531x except for CON8 offset, so re-using code for
> > pll_4313
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Raghav Sharma <raghav.s=40samsung.com>
> > ---
> >  drivers/clk/samsung/clk-pll.c =7C 11 ++++++++++-
> > drivers/clk/samsung/clk-pll.h =7C  1 +
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/samsung/clk-pll.c
> > b/drivers/clk/samsung/clk-pll.c index 3d837bd74355..7b0756127306
> > 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > =40=40 -1306,7 +1306,15 =40=40 static unsigned long
> samsung_pll531x_recalc_rate(struct clk_hw *hw,
> >         u64 mdiv, fout =3D parent_rate;
> >
> >         pll_con0 =3D readl_relaxed(pll->con_reg);
> > -       pll_con8 =3D readl_relaxed(pll->con_reg + 20);
> > +       if (pll->type =3D=3D pll_4313) =7B
> > +               /* Offset for PLL_CON8 which hold FDIV different for PL=
L_4313
> > +                * which is PLL_LOCKTIME_OFFSET - 0x4
> > +                */
> > +               pll_con8 =3D readl_relaxed(pll->lock_reg - 4);
> > +       =7D else =7B
> > +               pll_con8 =3D readl_relaxed(pll->con_reg + 20);
> > +       =7D
> > +
>=20
> This starts to feel a bit hacky (pll_con8 register being referenced as an=
 offset
> from lock_reg). Is the register really called pll_con8 on 8855? Or is it =
called
> something else, but happens to contain fdiv?
>=20
Yes, it is named as PLL_CON8_* on 8855, and contain fdiv bit.

> I think something like this would look cleaner:
>=20
> u32 fdiv_reg;
Historically SFR name was used to match with databook naming convention.=20
Few lines below it does indicate indeed pll_con8 contains fdiv.=20
 fdiv =3D (pll_con8 & PLL531X_FDIV_MASK);

I am ok with taking this suggestion.
Only thing is should we change pll_con0 as well together, or in a separate =
top-up patch?

>=20
>        if (pll->type =3D=3D pll_4313) =7B
>                /* fdiv in <insert name> register
>                fdiv_reg =3D readl_relaxed(pll->lock_reg - 4);
>        =7D else =7B
>                /* fdiv in pll_con8 register */
>                fdiv_reg =3D readl_relaxed(pll->con_reg + 20);
>        =7D
>=20
> regards,
>=20
> Peter

