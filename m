Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBDC3F8EC0
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563565; cv=none; b=luW8ie5P5QxeftxU5esy7U4SbuL4Qrhnmfy3yh3fy1r0UKnJ0UQ1y7RJBvNa2cNvU0DatA10urbnOi6gLug6fuJX6PPrckd3t0oURAJsI/etRBXdW0psAp3YSazHTlK2E5Xam1lQVrYjgpm2gG8bCwUZDfVU3IUXAR/Gkc76zSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563565; c=relaxed/simple;
	bh=WUIdiX+uqajMSwsko1XRgnv538Q1A9mNEQPka+eFUsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBo7rPnb89PBqHfPJNZjdB7vmkkV40v1ttBk9c0feVXaefsERfXIodIkAXQT6KBnUt2kCcQNuUlQAiV1vubAOM6yODhtI3VopnvuqpqgmXb2gkR6kJCmu11wxyk9RhCw8MWopCyaqfTlYBQ76HOpzoGjw9af9QmyhvnzEgzpHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tpOKHMCz; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tpOKHMCz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2as4PCRWsv024ZlqsXEqA3VU/UiipqE5hLi9l4v3VV0=; b=tpOKHMCzOlrTYuEe6r9BtA84Uf
	HE3p6z9xrQ9DgQUtIys9Xr0eyg6UBq1xAwd82I8kflHagSdSQH58knxLzSnde24ThZve7tCiUqPoy
	85Ybm5DcoDOs6fHpFfp8pyZ3mM7OIAM5CvZ0S1ekEFbQ6bU8jRXLHWec+0tlKH0k0x1XRsjgmQg5b
	NCgSpv/4KZnY08KejmmGp49UI7vnNNMxJiR59N7hN3iDrGFtYgaxYrb6DsoA1KLhePOkdoNQwizWO
	uox35V31a8Ql05pPuUlBSAtp0NV0GcS94CiW2acWw0s5KbzWy3njN6OdDsOoXGmn7D1UB0cVpiu9U
	mtHS++tw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rosenp@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: rockchip: don't COMPILE_TEST builds on M68K
Date: Thu, 04 Jun 2026 10:59:19 +0200
Message-ID: <36034140.aRNtrjHk3s@phil>
In-Reply-To:
 <CAMuHMdUAoUmCNMBVRGgZzSt9SbZqV6SVW2brkvsBKuHrfWHKvw@mail.gmail.com>
References:
 <20260603213726.1025094-1-heiko@sntech.de>
 <CAMuHMdUAoUmCNMBVRGgZzSt9SbZqV6SVW2brkvsBKuHrfWHKvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Geert,

Am Donnerstag, 4. Juni 2026, 09:56:04 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Geert Uytterhoeven:
> On Wed, 3 Jun 2026 at 23:37, Heiko Stuebner <heiko@sntech.de> wrote:
> > Rockchip clock drivers use hash-tables with enums as inputs.
> >
> > M68K does interesting things in its __hash_32() implementation, casting
> > that u32 input to an u16 and therefore triggering warnings like:
> >
> >    drivers/clk/rockchip/clk-rk3528.c: note: in included file (through i=
nclude/linux/hash.h, include/linux/slab.h):
> >      arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates=
 bits from constant value (18720 becomes 8720)
> >      arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates=
 bits from constant value (1e8e8 becomes e8e8)
> >
> > As M68K should never ever need Rockchip clock drivers, simply disable
> > compile-tests for M68K.
> >
> > Fixes: 7edfb7fb58ee ("clk: rockchip: allow COMPILE_TEST builds")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp=
@intel.com/
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/clk/rockchip/Kconfig
> > +++ b/drivers/clk/rockchip/Kconfig
> > @@ -4,6 +4,7 @@
> >  config COMMON_CLK_ROCKCHIP
> >         bool "Rockchip clock controller common support"
> >         depends on ARCH_ROCKCHIP || COMPILE_TEST
> > +       depends on !M68K
> >         default ARCH_ROCKCHIP
> >         help
> >           Say y here to enable common clock controller for Rockchip pla=
tforms.
>=20
> Obviously this is the wrong fix ;-)
>=20
> I have sent a better one, fixing the issue for every user:
> "[PATCH] m68k: hash: Use lower_16_bits() helper"
> https://lore.kernel.org/b55e9bd0532c0cad519809c86e0a8400060d75a1.17805595=
61.git.geert@linux-m68k.org

oh nice - fixing the actual problem instead of working around the
issue. I had no clue about m68k and thus no idea of how to test
anything, so went for the easx "fix" :-)


So thanks for looking into that
Heiko


