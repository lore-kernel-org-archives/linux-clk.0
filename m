Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425832;
	b=zVVqzuK+RRt0q+WlMEkBsilgIaaBi5U5OWAT4wbxu51zGPQ86swAeLu33E131v9ESfqU
	 LsBufIzX05wXjl1rIhFi/CS33AAm6QozSf3zmXN3OgveRUUwgZq2HSIMzklRWdokgIxF9
	 WPyqWVhCScaz8RHbEKC09kNE1SiEvsjH6VaNSKnu7fHtz4gaNYtElhkfbHs78NLDniF2c
	 XbyUAnRKGgjWmgW/bxn3LIymmtGx58cVeYDtDMDJm6cYdqIsgs8Nas6hbaIQQ6HVGG83/
	 pdUwNsgYGmTOwlfxc3b2ykMay9UYbvZ31pcIKZV0hahbzG4a3wguj9GjuQU28LORTmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425832;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=9s01IOL/VfsGnGIqdOhwdDoI7uOEMrcArvSSD1ab7Bk=;
	b=mBuIfHNhuZlVBCs9ZQd/Tm8woQSq2B9DSV+Vog86XkFT1PhrdHEMO+VbgRxPHInOhQbI
	 clDdmVifGWDfadx1xBvhB+yxrDITnptJfZ30SGtUpsVPtPL+xlPoRq9SvMbfSm1mW2J+Y
	 r8gL5XcXX+2XBR1HGYKhMO4CbfutoTGEVBV//Abh1Uz0vRomEXlFjV08wObMhyQMWr/SG
	 tSO8VMvJGyqy0UZGNWz2LlnP1KN9xpQ9v2Wwd3jC3fnCrzq0w4or5N+etC5vpVnKFd5Wr
	 OMK9ot4T0u557gf29DZDAq8A3pTjbmN7abd28BmHWjLa3PXeTCb1NV93D8UbkEc8isw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=IgsJAasd;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28536606A68E;
	Mon, 23 Nov 2026 09:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28536606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=IgsJAasd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9s01IOL/VfsGnGIqdOhwdDoI7uOEMrcArvSSD1ab7Bk=; b=IgsJAasdLG82fnozH9SFHpbn7P
	rQN7p6u1BmpqmfCVrfFpMN/CPRVfnjghSvLdu5DNRY9Kx2aBOufpGSPkLjPPtS8/GHRKm5ZntGM8g
	7QHA1Qmo5knPoVIFe8WGG6mRangNs/0gnzzFBRfMZsieglXNU1VL1v2kg8xs1v0KMKNGz0x2jH5T+
	9z1t9OEv2OGKRFD7xefUZmA2NG2M1CyBskRYiKtcZtgaQ9IAdGDKrJpi1ExtuCcP3mBdx92lYzdhH
	f9j2eWYk03aHVkkpRG+lIT+z/rWGv6H4XR0xeKrr6U4ifh/4qj7JafF5dXRdxiZdtTaeQsnNPj2Rd
	HkQaL/Mg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Xiangyu Zhu <1194781887@qq.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 0/3] clk: rockchip: rk3506: Add the SAI MCLK output gate clocks
Date: Mon, 23 Nov 2026 10:23:26 +0100
Message-ID: <pWqLoF7FQU26AfZrjX9Cfw@sntech.de>
In-Reply-To: <5176e5e2-72f3-4175-8b29-1dbc64c4e418@rock-chips.com>
References:
 <tencent_C2AD19EB4A6C91A75AD3DC4089CB875C4005@qq.com>
 <5176e5e2-72f3-4175-8b29-1dbc64c4e418@rock-chips.com>
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
Content-Type: text/plain; charset="utf-8"

Am Montag, 23. November 2026, 02:51:32 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Chaoyi Chen:
> Hi Xiangyu,
>=20
> On 11/23/2026 8:38 AM, Xiangyu Zhu wrote:
> > The RK3506 has four SAI MCLK output gates: SAI0 and SAI1 are controlled
> > by bits in the PMU GRF, SAI2 and SAI3 by bits in the system GRF.  Model
> > them as GRF gate clocks so the SAI MCLK pin direction can be controlled
> > through the clock framework.
> >=20
> > This is v4 of the earlier "rockchip,clk-out" binding/driver submission.
> > That one introduced a generic "rockchip,clk-out" compatible plus a
> > standalone driver, which is not acceptable: upstream already has generic
> > GRF gate support (branch_grf_gate together with rockchip_clk_add_grf()),
> > and RK3576 and RK3588 register their SAI/I2S MCLK output gates with it.
> > No device tree changes are included.
>=20
> Please slow down the pace at which you send patches so that people have
> time to read them. Don't send your patches within 24 hours.
>=20
> In addition, your Message-ID seems to have been modified by your email
> provider:
>=20
> Message-ID: <tencent_C4C715C962613597F98212938F8940633306@qq.com>
>=20
> Please try the downgrade the git version[0] you use for
> git send-email, or switch to a different email provider.
>=20
> [0]: https://lore.kernel.org/all/8771714B848C3A9F+9f64a309-ff70-466f-8d29=
=2D15950318b728@airkyi.com/

tencent is notorious for mangling message-ids (adding that "tencent_"
in front. This will likely happen with all git versions.

I think the best way forward is what most "qq" users do nowadays
to use "b4" and use it web-submission option [0]


Heiko

[0] https://b4.docs.kernel.org/en/latest/contributor/send.html


