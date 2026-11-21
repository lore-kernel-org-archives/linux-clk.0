Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267650;
	b=ZGAJG3Bj3Keo7dqmMeGlsqQpQRnNlp/zapTiH1ZoglyhOqLgjllux72vEmyyDWi0G42A
	 LLqfxvnY97yThY2xkdmoCoaZofSisbyKLwofrCXGk5H1qGa5ggzL1WouQsq6N0blnA90h
	 Vv34qgzlDsWCa9u8tVZB3fZA5BWoCSEc3tn0S4M5CU/vUZy8PUFg4pljHzN/7JgGnmAvI
	 fAIVtWEuXPsPK2X4gfCpUhVtv10eZN/TLu8tbTp1WIAirOvVPIMUsl3M1QeTE8tp89bRE
	 mJEFN2fAtbqfAhFjMAwnziagxM++phLzr7eYvIu/8d8rOtWS2Hg2jmyxxiPbcESvW4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267650;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=t3R4tnJIY9kB5WytDi15OEl7ThCTHknTfMjZvEx+X/M=;
	b=Q3s38T7KK8L/b6gvGHgY/an8U1gOfntPG5HxLGerb/NU242ICYgv8L2hzzmPLfvCO6hu
	 +3REGQ4V22zuzrKDplYRIyE9vPf3D0cWR/MbMmvu7GPRD9X/bByklQ1OpuA2exhKLi/NW
	 WLNbbGzckE3/eK09Pa86VwCtl7fwB/t2DadyMjhnD8MBLUhiEzXklVEpQp8WaADyylfAW
	 xj+1W2auoaP4fRN0snrdDRsbUuOy1JRUnH9ktmE9eOPKgBCDHnfpz4hkx/iROTgVf2C4Z
	 MW9tnW1PSbMWhqcQR0pZW9eNC+lnmp+CO3skQJ2MzfkH8+v1egVYhomUQdk4LOhbOrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=MEiP69zJ;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64E3606A32A;
	Sat, 21 Nov 2026 13:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C64E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=MEiP69zJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=t3R4tnJIY9kB5WytDi15OEl7ThCTHknTfMjZvEx+X/M=; b=MEiP69zJ/0eWym4qb78XUFm2+V
	QobfvUmO/6Hi80IUXhbcfqbaHCz/4xVaFFtjVDqoP/3UZ1vR+oN8QV+mI7E68mSGIl+mSpwaKGE+H
	GLGCCrWrXgvaMGxp5Kbwd1pmb7OtfVmdZNSfLCm69bUw2lU/Ak0yT6ZkOY4ctj0a6+sfxUIHPyqUp
	1hG1QklSBSV/V41i0soQzfkXY9Yv0mbJa2ratzSorI1mhJNNCkRuqwxOr4VCJljnHcukUOSZhVRU6
	qgU/B558J447mBOrrS/HWCs95l0AE/k5MaE5Sspac89SO+fUB0H5sbGz3dPWe01xAMkSeY2dEUiec
	FaBIsYeg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: ZhuXiangyu <1194781887@qq.com>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: rockchip: add clk-out
Date: Sat, 21 Nov 2026 14:27:08 +0100
Message-ID: <dggrSgDiRmusIaCk6T6L4Q@sntech.de>
In-Reply-To: <f98c3f68-82d7-41e3-bb58-d3737b73c7b5@kernel.org>
References:
 <tencent_8104629BEBAEF41637AAF1CC7D95BC7DCC09@qq.com>
 <f98c3f68-82d7-41e3-bb58-d3737b73c7b5@kernel.org>
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

Am Samstag, 21. November 2026, 12:02:37 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Krzysztof Kozlowski:
> On 21/11/2026 11:58, ZhuXiangyu wrote:
> > Document the Rockchip clock output/input switch, a single GRF-
> > controlled gate used for signals such as the SAI MCLK output.
> >=20
> > Signed-off-by: ZhuXiangyu <1194781887@qq.com>
> > ---
> >  .../bindings/clock/rockchip,clk-out.yaml      | 81 +++++++++++++++++++
>=20
> Please follow carefully submitting patches document, including how to
> sign your work and how to send it correctly threaded. There are numerous
> guides already, so just follow them.
>=20
>=20
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,cl=
k-out.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-out.y=
aml b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
> > new file mode 100644
> > index 00000000..bf2a9b8a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/rockchip,clk-out.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip Clock Output/Input Switch
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +description: |
> > +  Some Rockchip SoCs route a clock between an internal clock and a pin
> > +  through a GRF bit, for example the SAI MCLK input/output switch. This
> > +  driver exposes that single bit as a gate clock.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,clk-out
>=20
> Generic compatibles are not allowed. Do NOT send us downstream code,
> it's not acceptable.
>=20
> Not doing detailed review as it does not follow basic rules. Please go
> through for example DTS101 slides.

this whole implementation is bogous, but it seems the submitter found
the correct way to do this in [0] .

But of course the submitter still fails to follow basic styles there.
Broken threading and especially not stating that the new one superseded
this one.

And of course yet another patch bomb in the span of minutes accross so
many different subsystems - which I guess is not a human doing it.

@ZhuXiangyu: even if you're an LLM and new to the process, don't flood
the lists - especially not before you get the process right.


[0] https://lore.kernel.org/linux-rockchip/tencent_9138CD6157C88BC2D52FE639=
4AF83E560208@qq.com


