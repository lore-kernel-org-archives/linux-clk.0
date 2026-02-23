Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6C28727D;
	Mon, 23 Feb 2026 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856483; cv=none; b=EyiYaM5JNDv3UFMNRQkbKZgfjbmIL+r8PLruGrRjDafFlQiq/bmG2B7SOy8/MgJT5edzsguS2xoxqPQYacj8l8TJ+51TBiNZxHmFEFvHrkzCwhFvk+xvNgKtQdrHo9Nnd9l7NksusxBx88vPtDoo6+b09Ww7KltK+xnkBel0lNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856483; c=relaxed/simple;
	bh=WbGpiUzqnycTcD3iZGan1/ZeXWlEvQ1WBAjVVo25iFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WwZjabejKcRzs1DZ5Iz5iv5rgETCmzvSeP4Z6+a4NgDp2a02akiwJqFKsuCyLDWd1LZIhMDS57Vc2S3gI2N2mE3qhyb7IpOigGc3imoGrjzS8UjhFQbB717LhdwzB2g4tO2zyMZqPcQ3uF+OFV1s/PqHMsHWc4gAu42G3cHmhDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=R3OOv82W; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="R3OOv82W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=z4yEoJRx5deGb0mkYkh88rMC4x6nH+h7bEw64nzPq9E=; b=R3OOv82WZQkYvozfJHJ0CLaXRk
	UXlZRY0c8pTk0qp4E/IL/VH7HnChoUPwnuY+9wRyXxoEAsVf/VWjcbuh+qeT0k8tP2RYLWKtPZ3GQ
	nB/FCVLSAYG/sWpUW7bAqrLd6cOkwjTPtnVriv3oihRkhNMCRIa7iPMEEONqv1Nx8I7MieEM8iZ9y
	baXvIrPEhs11qPQwJ2noemm0XmYQiPavVSOZ+jll0E/B5cQiUhT8jpZGQKbM4tYDn0jQ2uABHRQsF
	+iLtUYcqT/EqpM/2ExE59gpOrdm/LETBE9kX8NDiAriA0qPkcWUwCaEqRb7Kg0tlLNjisd5pVJDU+
	9cbFNZJA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: sboyd@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, jonas@kwiboo.se, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject:
 Re: [PATCH v3 1/2] dt-bindings: clock: rockchip: Add RV1103B CRU support
Date: Mon, 23 Feb 2026 15:21:09 +0100
Message-ID: <32347982.43St1lv6Oq@diego>
In-Reply-To:
 <CAOMZO5BdgjaHKA6xV5MzPLDetqy-+iRdVPn3o38vo3szcxEhVg@mail.gmail.com>
References:
 <20260210022620.172570-1-festevam@gmail.com>
 <CAOMZO5BdgjaHKA6xV5MzPLDetqy-+iRdVPn3o38vo3szcxEhVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Fabio,

Am Montag, 23. Februar 2026, 15:19:35 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Fabio Estevam:
> On Mon, Feb 9, 2026 at 11:26=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
> >
> > From: Fabio Estevam <festevam@nabladev.com>
> >
> > Add support for the Rockchip RV1103B Clock and Reset Unit (CRU).
> >
> > The RV1103B CRU is compatible with the existing RV1126B binding.
> > Add the compatible string to the schema and introduce the
> > corresponding clock ID definitions.
> >
> > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> > Changes since v2:
> > - None. Only added Krzysztof's RB tag.
> >
> >  .../bindings/clock/rockchip,rv1126b-cru.yaml  |   1 +
> >  .../dt-bindings/clock/rockchip,rv1103b-cru.h  | 220 ++++++++++++++++++
> >  2 files changed, 221 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/rockchip,rv1103b-cru.h
>=20
> As rockchip,rv1103b-cru.h is also used by the dts file, I think it
> would be better if this series could go via Heiko's tree.

I generally pick up Rockchip clock changes anyway and then
send PRs to the clock maintainers, so that'll work as always :-) .


Heiko


