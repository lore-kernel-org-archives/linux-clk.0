Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B814D719;
	Fri, 17 Apr 2026 22:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466797; cv=none; b=DTLW7Oz7xxoDjB3AtrMREtQ8AGKwzO/yohAGM8FREUgXzGQnYv7nyX6TFdQozroFNf5wv8WKJZBGfI6KBt/A1DDouODYvQT3HGeuYoa7lLiNujb7ns7a/XpRkz3gbyGJ+eRkTbWXFcMRIl0luP+e6HyTms1d7tJnqJamCowNOFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466797; c=relaxed/simple;
	bh=GHtVHx2nhBSquGSPYryXKtY4F20htfrr0aJ1VzWLVGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ff0TOCjpc9ObT8txP7t8nXzUhcG+QagHBpCmVjNlUek6ZeKMzzbycwkAIXBe2hx9MpHK9jL1lZSRJLLNrdMlwP/g70qISUY8AoYaastxjOte41iwcPMqphCZiWPJwFfyHuqb1idCPuA6rY8/jtEKNvGf9z97OjkRT/1C4SVbi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1d4HoLrR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1d4HoLrR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GHtVHx2nhBSquGSPYryXKtY4F20htfrr0aJ1VzWLVGE=; b=1d4HoLrRxJTUT549vCErRSXE70
	0tfVdMU83O5FAnRlau6P8+hP7nQ3Knk6e87RPoVtssg0Un1B3CiDi66pWPsnCY+Mr7DdQ4/rRw+hm
	VSTXWGL+G8J9BBN5jllkygiIzB++sl/LItzoLrRoJ4LkiT0jh96TDceoME1ZKseMxraK6eRl1fbDt
	4uBpjV07uxv5I5PGP8fggQII+EXNs58iIA1TF/Byrw2786NDjng+bQBBsdFQLXwO5qFNWVpsnCvPt
	xrpTaFrCnGV+Ee9MK4NEngorGHIW66HU+PDk21STzHn40EReIP0Odvn9hoGTO434b6PsFjZLMp2Mp
	RfLZXSsQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Alexey Charkov <alchark@flipper.net>
Cc: Pavel Zhovner <pavel@flipper.net>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alexey Charkov <alchark@flipper.net>
Subject:
 Re: [PATCH RFC 2/4] clk: rockchip: pll: use round-nearest in determine_rate
Date: Sat, 18 Apr 2026 00:59:40 +0200
Message-ID: <39479281.XM6RcZxFsP@phil>
In-Reply-To: <20260417-rk3576-dclk-v1-2-26a9d0dcb2de@flipper.net>
References:
 <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
 <20260417-rk3576-dclk-v1-2-26a9d0dcb2de@flipper.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Alexey,

Am Freitag, 17. April 2026, 17:11:45 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Alexey Charkov:
> rockchip_pll_determine_rate() walks the rate table in descending order
> and picks the first entry <=3D the requested rate. This floor-rounding
> interacts poorly with consumers that use CLK_SET_RATE_PARENT: a divider
> iterating candidates asks the PLL for rate*div, and a tiny undershoot
> causes the PLL to snap to a much lower entry.
>=20
> For example, requesting 1991.04 MHz (248.88 MHz * 8) causes the PLL to
> return 1968 MHz instead of 1992 MHz =E2=80=94 a 24 MHz table gap that pro=
duces
> a 1.2% pixel clock error when divided back down.
>=20
> Change to round-to-nearest: for each table entry compute the absolute
> distance from the request, and pick the entry with the smallest delta.
> The CCF's divider and composite logic handle over/undershoot preferences
> via their own ROUND_CLOSEST flags.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

as Sebastian said, this could cause overclocking in a number of areas.
The rate you get should always be lower or equal to the requested rate.

Additionally, such a core behaviour change, would affect 13 years of
SoCs with unknown side-effects.

If you're missing specific clock rates, you can always add them to the
list :-) . The vendor-kernel does have code that can calculate the
rate params itself, so this could give you a hint where to start.

=3D=3D=3D=3D=3D=3D=3D just to explain =3D=3D=3D=3D=3D=3D=3D

Though I still don't think that code should be in the mainline-kernel,
as a curated PLL rates allows more control, where that algorithm
creates parameters that are programmatically correct, but essentially
untested.

On the two Chromebook projects, they actually measured things like
clock jitter, which got us more specific params for some rates.


Heiko



