Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794476063;
	b=tRhL8Yu3/VHbjbIeI3DLPDVVN7UrZlXUpvKoqzb/Gnh+hYBlvGaDGaNf7scCFq/K8h1b
	 Hyvv/MM/vwHWH5gh0CSMTV9RnAkuGi+5croM5j/8itMYI7jxwe2byrF5mYZ5NDNCX/BW8
	 bR1h3fbKTIPfXt9UTRL+UVr9nSa27wq/k/8d5AnCWiWRtfcDs+P2nRBHfpHDw3iAWenKC
	 Jdv8NwE3Xfj5mMc4MQlbdmaSpRvJ/URxy1NyyafbAIK+1WJrBRoPcgRBmPXKWa+lV1kKG
	 Xa+SSIHTNJgBp736FzQEyxk5aBmy2/9dA1fsH69+5d2A98ZrEa6cRO3RhaS02CLngDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476063;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=0mwJLfkCKM4Ex+W3HdtHCenUOHq2LFEypD9rBYF7gtE=;
	b=bzzoCPKX6sXcOdnXuL/G9UB5uuXMfJ+xHZZsQnAge5SaXEXOhnOdj1dt946T+RycJRxt
	 cBWY8mVZmnTuaeEUBaiCrGpdGo5ff03XoTkdyMBgKTvlPyVoAHlQChnblaUhvzCkxXXg2
	 D8oYYEpI9boJSS1OVb8sDEucbznIrxLh3i4PgVCFHOjwV4l2Rr0YxmsR13ofelg9iLDTi
	 PpyYEKXhznao9Yq+TH5TAiYvgDYsSGIvZSVKJo0a7I3xEN6LydDcRP+kAbyeH12nxZJp7
	 Wo1iH/T5zEnG014jWsS85szyRXjqqV04rdLBx070RYBHk26QcLt8U5tZgm9jVTLgRkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bsf0A2Om;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB63606A321;
	Thu, 12 Nov 2026 09:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB63606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bsf0A2Om
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3C4902006B6;
	Thu, 12 Nov 2026 10:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794476059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mwJLfkCKM4Ex+W3HdtHCenUOHq2LFEypD9rBYF7gtE=;
	b=bsf0A2OmIo4OBsbuBshB9FsFX+F+TlhG4Gz8KkGEF7/js8khUKc4FI8vayYVMoucxWt5Ko
	OSe+42Jyd2PWyVH14xSLE5tWctlwWI5lrWBCo5sVnzIa3vqW/dtMAY0RyiDUO8i/jjLGIB
	rTcVhWyyHueMksggRKGjb8Cr4pbO1YxIH/y+dZvjDMm7W+Qm3sqsTriUtrJMghd7MJCHk5
	9HJ6ZUCw88gRvuW7vDyRAh/pvFXC5HcfyH0ls0VClY/szhjbvXmhugdmUTqMatmHWMdE9W
	y3/CQfAD6KLC5jJyhVhVlEiuSEJZO14inIkgiocsGmop7a13sSD3yfXA2gUL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794476059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mwJLfkCKM4Ex+W3HdtHCenUOHq2LFEypD9rBYF7gtE=;
	b=M1xp41demAYY1JUSaNTDwVYwai2XVErtg/5rY82QD66dsMfcSGVvcCGvdnK1iCTS4vsuRG
	0g2v+8SS/0o8UoYCYk4xTCd5HOZhs7G74GoSjhGboBY3rzaGKEr3igoER60lWq3YBfoems
	LC6yAO0ULo8LzWZsukM9Hfvoj9OYWwoJaWA+NTXYcl2uX4hY0dFY/ZBg0d9MaEiiCTRzCS
	WGYlJ8lBDVHFlCuhMbSNgorxvZ/OhfmoN86+PsX8fdMbJnstsGZd+Ca6WKIl1hV96V4LEU
	NmPE57+T7tHrO47mYGqt8S24mu98zwfwpoWHHg5dL/1/8TUsOewL3/Cb5maPCQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794476059; a=rsa-sha256;
	cv=none;
	b=JXsBro+kIRWK2d9mYT2oon7XgCLOHsT+5BFR9eephMZg2hha8kNBOPeJWpw/6AarlhCBt+
	PJrwDM+U2obtY0XoH/w7g4ENdE2YDw7jVCTptfy/a1LhoUx6rG3ZiQ+G63LBeTtEYG7fDU
	NvmPdTX53nmIGlamlP85Yax6nEF8asBfcpSAUqu7HQk1l3SMf8p5m9JX2xROYoo7NZjUIN
	lE5zbpyKrmZf1Bu8ZfUdAF4C4leSAajMcBpTbZcLpJKvubWThEvrl0is7gYnqYOcvTj7ZA
	OgcjgU2kSIIxU82R9kn7HZhGHq0+CPOFK9i4vzE3lmJzR63DvKZJtZ2qefqh6w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <65b603d24fa606b075a81b4e2211863a52c51d3e.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/4] clk: siflower: Add SF19A2890 peripheral clock
 and reset manager driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chuanhong Guo	 <gch981213@gmail.com>, Yao Zi
 <me@ziyao.cc>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 12 Nov 2026 10:34:19 +0100
In-Reply-To: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
	 <20261111-sf19a2890-sysm-v2-4-d2fcb723e4f1@telaak.dev>
	 <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
	 <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-11 at 14:08 -0500, Joseph Telaak wrote:
> On Wed, Nov 11, 2026 at 10:56:47AM +0100, Philipp Zabel wrote:
> > > + spin_lock_irqsave(&crm->lock, flags);
> >=20
> > Could be simplified with guard(spinlock)(&crm->lock);
>=20
> Will do in v3, as guard(spinlock_irqsave)(), since the clock gates take
> the same lock from clk_enable(), which can run in interrupt context. I'll
> convert the gate enable and disable paths as well.
>=20
> > > +static const u32 sf19a2890_usb_resets[] =3D {
> > > + [RST_USB] =3D GENMASK(2, 0),
> >=20
> > Do these three bits control separate reset lines?
> > Does the hardware require them to be changed together?
>=20
> Yes, they are separate lines, one per clock domain of the DWC2
> controller. Bit 0 matches the controller's gate and bit 2 its AXI
> master's (usb_axim). Bit 1 has no gate, so it is probably the PHY clock
> domain, whose clock comes from the PHY rather than from this block.
>=20
> There is no public documentation for this block. Chuanhong explained in
> v1 that the lines of one IP's clock domains have to be asserted together
> [1], the same as the GMAC's.

Ah, I got confused by the commit message, which to me looked like the
bus lockup issue is limited to GMAC.

> The dwc2 binding also takes a single reset for the controller.

That is irrelevant from my PoV, the binding could be insufficient for
this integration.

>=20
> > > +static const u32 sf19a2890_uart_resets[] =3D {
> > > + [RST_UART0] =3D BIT(0) | BIT(4),
> > > + [RST_UART1] =3D BIT(1) | BIT(5),
> > > + [RST_UART2] =3D BIT(2) | BIT(6),
> >=20
> > Same question as above.
>=20
> Yes, they are separate. Going by the gates at the same bit positions,
> bits 0-2 are the UARTs' APB resets (PRESETn) and bits 4-6 their UART
> clock domain resets (nUARTRST). The PL011 TRM (DDI 0183, section 2.4.1)
> says the reset controller must use PRESETn to assert nUARTRST. This block
> leaves both to software, so the driver asserts them together. The pl011
> binding also allows a single reset.
>=20
> The same goes for the other two groups. The SPI block's bits 4 and 5 are
> the PL022's PRESETn and nSSPRST, which its TRM (DDI 0194) ties together i=
n
> the same way. The WLAN blocks' bits 0-2 match their AXI slave, AXI master
> and platform gates.
>=20
> v3 will explain each multi-bit group in the commit message, not just the
> GMAC's.

Please do. With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
