Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D7F33CEBE;
	Tue,  9 Sep 2025 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757435950; cv=none; b=p90fYoGjvdZeVQ1/NZWDNyXkVp5Px4mKfJqPg5pfb4WNM3+JUOoWZMl2b3hI3sz8wanFbfGtiJLS5tIfhBARjSbCG/Ew/SZmXyzIryAwrMIA4P9jbDbiyE46P+DG7judHkqeeDfJwPGNI0qUhkRkYBm4MicbfZA+6hjadkQVNmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757435950; c=relaxed/simple;
	bh=sa+YtCD3kLuoHOYbn1YCfWKsVdW9XBp8FtQkfySgPZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sd6nkBECYEg8r3dsI2zMyS9leCgehW4ssggSUymJBDX2KfF+lRI1bvo36qSZXQpdtgPGhZ5/DT/iuS1A6QQvY1or8RhKVvoU9UoJR37/I1cHaNRZ1+1Qusg+9/jqyzj7Obwh4bhECcYI5ruOg3ebOk5V3cGdwKM0fBkUx1ECrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC05515A1;
	Tue,  9 Sep 2025 09:38:59 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C6853F66E;
	Tue,  9 Sep 2025 09:39:05 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:39:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: generalise update bit
Message-ID: <20250909173903.6b78cd9c@donnerap>
In-Reply-To: <CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
References: <20250903000910.4860-1-andre.przywara@arm.com>
	<20250903000910.4860-3-andre.przywara@arm.com>
	<CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
	<CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
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

On Wed, 10 Sep 2025 00:06:07 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Sat, Sep 6, 2025 at 12:15=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrot=
e:
> >
> > On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote: =20
> > >
> > > A few of the Allwinner A523 CCU clock registers introduced an "update=
" bit,
> > > which must be set for changes to the other bits to take effect.
> > > Of the three clocks where this was used, it was always bit 27, so we =
just
> > > encoded this as a single bit feature flag.
> > >
> > > Now the CPU PLL also features the update bit, but puts it at bit 26, =
so
> > > this flag trick won't work anymore.
> > >
> > > Add an "update_bit" field to the common sunxi clock struct, which tak=
es a
> > > bitmask, so we can encode any bit to use, even potentially multiple of
> > > them. As uninitialised fields are set to 0, we can use this as a defa=
ult
> > > bitmask to set, so can OR this in unconditionally.
> > >
> > > Change the existing update bit users to use this new encoding, and add
> > > support for the ccu_nm clock on the way, since we will need it there
> > > shortly.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org> =20
>=20
> Hmm, actually, we also have the "key field" feature. Maybe we should
> generalize that one and merge the two?

Ah, that's a good idea! Somewhat obvious now when looking at the code in
ccu_mux.c, where there are two "reg |=3D MAGIC_VALUE;" lines next to each o=
ther.
Will hack something up for this.

Thanks,
Andre
