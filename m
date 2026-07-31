Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C9430CEE;
	Fri, 31 Jul 2026 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501495; cv=none; b=rSQOUWmjnj0YAt7NDiT7b5ztBxHQ02B2eIXMNC59Tmh0YyqO3RBLu5xsjhj9VPtI0oazXkWRYhrq271fHiHWP3xx4qY015HnyN1WInM6R2sSXCCqblAKK9uj2velkqOY7gMx/uQeLnNEdor4ndOZ1mQRVxK+SZ0jWe/sSD6O6Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501495; c=relaxed/simple;
	bh=wBQ3APkiaTLaKqF54V2ia2PFJ3PulrUhaKyYXakis2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+qbsmQik+opawk57hd52r7ScKmG2ck4xe2mCgygsGJyar/7Y4cTl1YoJCoNxjLP1Tk1VnQ4ehDc82JU3gga9ny66gbBWspmo3ndq17PeQhT0EVrxLzyykTOLDt7avTV9Z6B+saCDAmJhzr8OeDimMtzKI4DujehfjjsHFpU4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hkZKKq3g; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hkZKKq3g"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33D8E1A1326;
	Fri, 31 Jul 2026 12:38:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 077796039A;
	Fri, 31 Jul 2026 12:38:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CD9011C167FD;
	Fri, 31 Jul 2026 14:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785501486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0OZKorsCURtd1p3CrckgfEqlsxhaGTh6N6c02LumgJM=;
	b=hkZKKq3grb5Ig28/XVa/M87eMzKZThMvsztklWO9M5UPwOA77gWmp1L9rHlHODCzBvLpQl
	xHw7xxzrnmEM2JbWl3Q2uXc3LTIimzdFblKxHPH4b+RsEGULsZ1EySR1YHVMoIDkVrHr71
	dPzd5f2tp/LeR+hbNC/mVtY145Kp9w/sx2FH0TMFEfCbvw2tNyQCTNUWOnolY9Vwm+XUB2
	xotQml2TDMl3up6ol2ky8A2OOtdl2leO6WLQO2YoWwm5HwH3XXgoAS7QM9WOvbrRwMOsuY
	U8ePEHUlZ+hFro+YJX2DQkP9DSDqO8gye0tTuWrskdrMSW+DS5+xip1Y792FIg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To:
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKQ==?=
 <u.kleine-koenig@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: clk maintenance [Was: Re: [PATCH v1] clk: Use named initializers for
 platform_device_id arrays]
Date: Fri, 31 Jul 2026 14:38:04 +0200
Message-ID: <bGIAL_MMTgKoRvN07QIfIw@bootlin.com>
In-Reply-To: <aluuES750vojgH3q@monoceros>
References:
 <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
 <alpC8l8qPFL955ZB@redhat.com> <aluuES750vojgH3q@monoceros>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Uwe,

On Saturday, 18 July 2026 at 19:13:11 CEST, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> Hello Brian, Michael and Stephen,
>=20
> [I trimmed recipients as the new topic isn't related only to my patch
> under discussion in this thread.]
>=20
> On Fri, Jul 17, 2026 at 10:57:54AM -0400, Brian Masney wrote:
> > On Fri, Jul 17, 2026 at 11:51:17AM +0200, Uwe Kleine-K=C3=B6nig (The Ca=
pable Hub) wrote:
> > > Do you still have it on your radar?
> >=20
> > I sent Stephen a pull on June 29th for stuff that I felt was missed dur=
ing
> > the last merge window and I included 4 of your patches in that pull:
> >=20
> > https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/T/#u
> >=20
> > I haven't heard from Stephen yet. There's 2-3 other pulls waiting as
> > well.
>=20
> I only occasionally have clk patches, but my impression is that getting
> feedback takes quite long and without Brian's efforts also things would
> get lost. (Thanks Brian for picking up my stuff!)
>=20
I also share that impression. I have a series that has been lingering for a
while now. My last attempt at getting it merged was sending it as a pull
request and it did not get much reaction, despite Brian's effort to get some
attention to it:

    [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H for v7.3
    https://lore.kernel.org/linux-clk/RcAweJqGSl27gSWWG_TpDg@bootlin.com/

> Looking at the current maintainers:
>=20
> 	$ git log --format=3Dfuller --since 2026-01-01 next-20260717 drivers/clk=
 | grep -E 'Boyd|Turquette' | sort | uniq -c
> 	      8     Acked-by: Stephen Boyd <sboyd@kernel.org>
> 	     28 Author:     Stephen Boyd <sboyd@kernel.org>
> 	      3     Cc: Michael Turquette <mturquette@baylibre.com>
> 	      3     Cc: Stephen Boyd <sboyd@kernel.org>
> 	     81 Commit:     Stephen Boyd <sboyd@kernel.org>
> 	      1     Pull clk fix from Stephen Boyd:
> 	      3     Pull clk updates from Stephen Boyd:
> 	     54     Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> 	linux$ git log --format=3Doneline --since 2026-01-01 next-20260717 drive=
rs/clk | wc -l
> 	453
>=20
> (Maybe that is because Stephen cares for the core mostly and arch
> maintainers merge stuff about their clks themselves?)
>=20
> The last commit where Michael Turquette was actively involved is from
> 2021 (a331659e32718b31f3a304d7797a77d31610468c) which is also the last
> mail from him on the clk list (see
> https://lore.kernel.org/linux-clk/?q=3Df%3ATurquette).
>=20
> I only observe from the side line, but with the relevance of the clk
> subsystem I feel maintenance is underpowered today.
>=20
> Is it time for Michael to step down? Would Brian be ready to become a
> full maintainer? Is there a need for more reviewers? Any volunteers to
> step up?
>=20
I would like to offer my help. Although I have not followed through, I did a
few reviews of clock patches and I can have some time allocated to do that.
I can pick up my reviewing effort if it can help the clk subsystem.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



