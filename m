Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A984B0497;
	Mon, 17 Aug 2026 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967274; cv=none; b=h7tvKsMrXVzChiX0xRsAQ64/1j57lIPPkQDWsKkQsKapJBrxkadpXbb5LaNb8nXkP0AqIpzhCXRrnUSiRwmslPQJlWp3HIfU+Nbca7aCJ3nHPpz/GyKd/xHwZ5u6d7jLvzE+MLS1PDhKTaYp9duzcycz+8Cke6V8PkRGPDBSvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967274; c=relaxed/simple;
	bh=VQk+NKX2QLLmpu+AnKTBzGZpFZgEXg3SbSlRnkYbJQY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8FaJC+W76GzRasgAJFkxSTc//zBL4+MHwWrdOK26NIqfecMeCUDC2x2G1LI+esGdR5RtmPRhdm/dufCr/074qdVht18Iwh47NMYSJZ3TuDvjAUcSBKLsss2amJnWu3E44W4xuXEHOGpq9yDVxFu2KAzOAdhrpegeDpic7bcAVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=nINoI/uM; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="nINoI/uM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786967263; x=1787226463;
	bh=ZRu1RYNKFVEiUGNH9uQ6dlTqTZqU/qO7+ZFglPoqZe0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nINoI/uMqd+TrP/KKlwOtvJgDa0TodCbL/TAXPhZ1t6peKfSYl2JOmOzj4R2qnJBC
	 NCTlHj9UW8tSEYLuyFXJYjrRWCeO7FbNzX5gpVkFUJVv0tIcJhzqClsscICPx3yFXR
	 0Lmj7bXv3FeFwU1Bgeboi857a8V7YnFl0pTN36IyCwR6pdGdBztqOqZJqMrIC9UlTR
	 75bacJU2uc48lcbubsWjDjstO7XgGgnjLoEharMrLSrLchYIfWQnSuqKNlaJDxAL84
	 RzBqzKmtc8f7Ai/yLhO35rD7sML2yiD/EysJQcoOZrqv4toJTK4cM5unP+GyyOcA6D
	 bXGP3Voquo1qw==
Date: Mon, 17 Aug 2026 11:47:40 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: samsung: clk-pll: Add support for pll_309
Message-ID: <ubD1iFupOIubgrcjfABhlLsSRSjHBgzA5ZmyURWTM9xviGIM0OlLeXehsukZEY9cXqAgwJt_BI2xspZ5BIlCBPROAWUyyReaTWWSL7g08gI=@protonmail.com>
In-Reply-To: <20260817103711.943D81F000E9@smtp.kernel.org>
References: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org> <20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org> <20260817103711.943D81F000E9@smtp.kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 805fa40c58baa6408f869d226858baad95d120ff
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Logic Error / Out-of-bounds Read when rate_table is empty
> - [Medium] Single-Responsibility Violation: Undocumented architectural re=
factoring
> --
>=20
> --- Patch [2]: [PATCH 2/3] clk: samsung: clk-pll: Add support for pll_309=
 ---
> commit d62df56ff2e6bf73437e6e25e1335b3fb4571268
> Author: Aiden Isik <aidenisik@member.fsf.org>
>=20
> clk: samsung: clk-pll: Add support for pll_309
>=20
> This commit adds support for the pll_309 used in the Exynos5515 SoC, defi=
ning
> the PLL characteristics which are handled similarly to pll_531x.
>=20
> > diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pl=
l.c
> > index e74552846ba34..8b1474aeaf0c8 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -1593,32 +1593,35 @@ static void __init _samsung_clk_register_pll(st=
ruct samsung_clk_provider *ctx,
> >  {
> >  =09struct samsung_clk_pll *pll;
> >  =09struct clk_init_data init;
> > -=09unsigned int len =3D 0;
> > -=09int ret;
> > +=09int ret, len;
> >
> > -=09if (pll_clk->rate_table) {
> > -=09=09/* find count of rates in rate_table */
> > -=09=09while (pll_clk->rate_table[len].rate !=3D 0)
> > -=09=09=09len++;
> > -=09}
> > -
> > -=09pll =3D kzalloc_flex(*pll, rate_table, len);
> > +=09pll =3D kzalloc_obj(*pll);
>=20
> [Severity: Medium]
> This isn't a bug, but the commit message only mentions adding support for=
 the
> new pll_309 type, while this code changes the allocation semantics of the
> rate_table across the entire driver, switching from a flexible array memb=
er
> to a separate pointer allocation.
>=20
> Could this architectural refactoring be split into a separate patch or
> documented in the commit message?

This was a mistake caused when updating patches against next.
Will fix in v2.

>=20
> [ ... ]
>=20
> > @@ -1637,7 +1640,7 @@ static void __init _samsung_clk_register_pll(stru=
ct samsung_clk_provider *ctx,
> >  =09case pll_a9fracm:
> >  =09=09pll->enable_offs =3D PLL35XX_ENABLE_SHIFT;
> >  =09=09pll->lock_offs =3D PLL35XX_LOCK_STAT_SHIFT;
> > -=09=09if (!pll->rate_count)
> > +=09=09if (!pll->rate_table)
>=20
> [Severity: High]
> If a clock is registered with an empty rate table containing only the zer=
o
> terminator, kmemdup_array() is called with a count of 0 earlier in this
> function and returns ZERO_SIZE_PTR rather than NULL.
>=20
> Since ZERO_SIZE_PTR is not NULL, this check evaluates to false, which
> incorrectly assigns the full operations instead of the safe min_ops fallb=
ack.
>=20
> If samsung_pll_determine_rate() is subsequently called, it skips its loop
> because rate_count is 0, and attempts to access rate_table[-1]:
>=20
> samsung_pll_determine_rate() {
>     ...
>     req->rate =3D rate_table[i - 1].rate;
> }
>=20
> Since rate_table is ZERO_SIZE_PTR, will this result in an out-of-bounds
> memory read?
>=20
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next=
-lucky7-clock-v1-0-032e4b229c76@member.fsf.org?part=3D2
>=20

Kind regards,
- Aiden Isik
