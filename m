Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38F9219ED;
	Wed, 18 Dec 2024 01:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734485969; cv=none; b=uxWl7Qwzdqb/WzrMMYM22Z8OMtKx6XaHqc9lLzVFSngqKVTWDtlXgn1Uk+sdids1D5SpDRvvD8ZE0lWG/H0oCDGdhuVU8aDWscMmnEJxl7WclIG+YUxpq1ae9ZWKWj4S2zGOnSieASYRchiMKBp+D4/gbIErx54Fwnw1CcxEX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734485969; c=relaxed/simple;
	bh=5LgC8caZOAImXegiKr2GNMgyM1JEnZ0UYk+PYPMywbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B7jmU0UWCIh7cOp4+mMNWGPtx0iXz3H5l/bJio78XvfbUjYE4cMNym7b93yPeVgCbzsIBGtbqTPhS3hiCsXc1U7Vl5rFy3BNlPXX2t57vJQHQm8aa4EFrj6FTiZGU2dhtXleYtH2LyIvzAbQ61J8D0u1H/eqNwqfqTlFKT55ChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC68FEC;
	Tue, 17 Dec 2024 17:39:53 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FB753F720;
	Tue, 17 Dec 2024 17:39:23 -0800 (PST)
Date: Wed, 18 Dec 2024 01:38:36 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek
 <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and
 PLL_MIPI
Message-ID: <20241218013836.421cc616@minigeek.lan>
In-Reply-To: <d0bf0d9cd2df65dc2e17eb203d56eb13@manjaro.org>
References: <20241215053639.738890-1-anarsoul@gmail.com>
	<20241215053639.738890-2-anarsoul@gmail.com>
	<qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
	<CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com>
	<20241217211505.7f9c9e4e@minigeek.lan>
	<d0bf0d9cd2df65dc2e17eb203d56eb13@manjaro.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Dec 2024 23:02:43 +0100
Dragan Simic <dsimic@manjaro.org> wrote:

Hi Dragan,

> Hello all,
>=20
> On 2024-12-17 22:15, Andre Przywara wrote:
> > On Tue, 17 Dec 2024 10:00:45 -0800
> > Vasily Khoruzhick <anarsoul@gmail.com> wrote: =20
> >> On Mon, Dec 16, 2024 at 11:33=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org>=20
> >> wrote: =20
> >> >
> >> > On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote: =
=20
> >> > > These will be used to explicitly select TCON0 clock parent in dts
> >> > >
> >> > > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in=
 TCON0 mux")
> >> > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >> > > ---
> >> > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
> >> > >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 + =20
> >>  =20
> >> > You cannot combine these changes. =20
> >>=20
> >> The patch basically moves defines out from ccu-sun50i-a64.h to
> >> sun50i-a64-ccu.h. How do I split the change without introducing
> >> compilation failure? =20
> >=20
> > You can just have the binding part first, adding the (same) definition
> > to the binding headers. As long as the #define's are not conflicting,
> > this is fine.
> > Then remove the now redundant definitions in the kernel headers, with a
> > subsequent patch. =20
>=20
> Yes, that would be a way to make it formally correct, but also much
> less readable and understandable later, as part of the source code
> repository.  FWIW, I find this to be an example of the form being
> more important than the actual function.

Not sure I understand your last sentence, exactly, but what
Krzysztof pointed out is that one part (the header change in
include/dt-bindings) is a DT binding patch, so part of a spec, if you
like, the other is Linux *code*. There is the DT rebasing repo, which
cherry-picks DT patches, so they form a separate history there, and
Linux code has no place in there. U-Boot for instance pull this
repo now on a regular basis. So keeping those things strictly separate
is really important here.

Cheers,
Andre.

> >> > Please run scripts/checkpatch.pl and fix reported warnings. Then ple=
ase
> >> > run 'scripts/checkpatch.pl --strict' and (probably) fix more warning=
s.
> >> > Some warnings can be ignored, especially from --strict run, but the =
code
> >> > here looks like it needs a fix. Feel free to get in touch if the war=
ning
> >> > is not clear. =20
> >>=20
> >> Yeah, it is not clear what do you want me to do, assuming the previous
> >> similar change to sun50i-a64-ccu.h did essentially the same, see
> >> 71b597ef5d46a326fb0d5cbfc1c6ff1d73cdc7f9 =20
>=20

