Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7658F20F08F
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779510; cv=none; b=BQUlwWLMcDojNhj3DdB2je+zdnFqzbLzf6QYXdRAArm9CsjpFfEhJaasQDNIANhhDWv2WL7RtVbHuCoDGDt+v3YaWnb+DgYzXB59XbNM+Ggv7bB/RWoDdUQSmmSSohnv/x14rQZSgjpIAZbAcXBBu5Vou5YUCpWvwoYPYB95gtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779510; c=relaxed/simple;
	bh=NPURKECord7GiGw5OfWax+xcknRDKDK5z+fFgBgZ234=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdtQcCNQnApUStN4GhKztyYu7ydKPp5owcPbDtFBMEWCtUHnDhN2tV3lY5SzRInHJd8R/RG6O2GMwBf/0aj2ziDL9WwiRUdZgMnnTk5OXfVttN37PWBGN/0byIj4K9Ss/6hbKRTgwInTJmTaKikjDs+iBuuMpEj3AUYubssIIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A78E812FC;
	Mon, 13 Jan 2025 06:45:30 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FABA3F66E;
	Mon, 13 Jan 2025 06:45:00 -0800 (PST)
Date: Mon, 13 Jan 2025 14:44:57 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Evgeny Boger <boger@wirenboard.com>, <jernej.skrabec@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>, <mturquette@baylibre.com>,
 <samuel@sholland.org>, <sboyd@kernel.org>, <simons.philippe@gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
Message-ID: <20250113144457.5b884799@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v65-4VK_V4Ob__VAB0+qETuisvdUEUFVwg-7SfHy4rv6_g@mail.gmail.com>
References: <20241025105620.1891596-1-andre.przywara@arm.com>
	<7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
	<20241108223400.460982d6@minigeek.lan>
	<a4fada26-7ef8-4618-9ddd-0962b7dc6efb@wirenboard.com>
	<CAGb2v65-4VK_V4Ob__VAB0+qETuisvdUEUFVwg-7SfHy4rv6_g@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 10 Nov 2024 20:33:47 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi,

> On Sat, Nov 9, 2024 at 7:15=E2=80=AFAM Evgeny Boger <boger@wirenboard.com=
> wrote:
> >
> > On 11/9/24 01:34, Andre Przywara wrote: =20
> > > On Fri, 8 Nov 2024 23:14:51 +0300
> > > Evgeny Boger <boger@wirenboard.com> wrote:
> > >
> > > Hi Evgeny,
> > > =20
> > >> Tested-by: Evgeny Boger <boger@wirenboard.com>
> > >>
> > >> We had stability issues with some of our T507-based boards. T507 is =
the
> > >> same die as H616, to my knowledge.
> > >> They were fixed by essentially the same patch, which we unfortunately
> > >> didn't submitted to mainline:
> > >> https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d=
54ca1a1756458af
> > >>
> > >> It's worth noticing that not only the reparenting is mandated by T5 =
User
> > >> Manual (section 3.3.3.1), it's also is implemented in vendor BSP in =
the
> > >> same way.
> > >>
> > >> We tested the patch extensively on dozens of custom T507 boards (Wir=
en
> > >> Board 8 PLC). In our test it significantly improved the stability,
> > >> especially at low core voltages. =20
> > > many thanks for this reply, I was hoping for such a kind of report!
> > > I typically don't test those things in anger, and only have a few
> > > boards, so having those reports from the real world is very helpful!
> > >
> > > Can you maybe give some hint on how you tested this? Does "at low core
> > > voltages" mean you forced transitions between the lower OPPs only, or
> > > were the chips undervolted? =20
> > Both, in a way. Some boards (about 1 in 20 or so) would hang after a few
> > days of operation.
> >
> > During our investigation, we found they would never hang under stress
> > testing, so we started examining cpufreq-related factors.
> >
> > Disabling lower OPPs also prevented hanging. If we artificially lowered
> > the OPP voltages (undervolting the chip), the boards would hang much
> > faster without the patch, and even the previously stable ones would
> > start to hang. =20
>=20
> I guess we can merge this one then?

Sorry, didn't realise this was a question.

So yes, please, from my side this looks like the right to do, and Evgeny's
report supports the need for this.

So please queue this somewhere.

Cheers,
Andre
>=20
> ChenYu
>=20
> > >>   From my understanding, all Allwinner SoCs need to follow this kind=
 of
> > >> procedure, however it's only implemented in mainline for a handful o=
f chips. =20
> > > Yes, I saw, I have added this to my A523 code already, and prepared a
> > > patch for the H6.
> > > Do you have boards with any other Allwinner SoCs you could test on, or
> > > even already have experience with? =20
> > Unfortunately, no, not really. We only use the T507 and A40i at the mom=
ent.
> > We=E2=80=99ve never had these kinds of issues with the A40i, though. By=
 the way,
> > the A40i is among the few Allwinner chips with reparenting implemented
> > in the mainline.
> >
> > The A523/T527 is really nice; it's a pity it's limited to 4GB RAM.
> > =20
> > >
> > > Cheers,
> > > Andre =20
> >
> > --
> > Kind regards,
> > Evgeny Boger
> > =20

