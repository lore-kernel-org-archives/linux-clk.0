Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE63EAC6D;
	Tue, 25 Aug 2026 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693263; cv=none; b=s1tDl5Tcc1I6S2qohcVuGVsTVJqqzgkLWDhDzP0yXAUSmeuyg+diXHyUOLtz66rt24JTx0LU1zQip2F3NcbrWhXsuMVY5Nf2apcIFiguhxfZIjB36g22WGFki2zr35n9Va6mwIjzIf1Zcv4jgdd6ZAgIgB0ltNl5QwlyTmd1Mdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693263; c=relaxed/simple;
	bh=KWDnM6TtRmI2DttqW3czGUU/7rZExB12LIdMkIFrjUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MYGIvt4Fc8+RwOxsLNmd65my/saHLQl8PVRfPRPz1XZMEI3svP7SKsxhTkw808dxtZM445t+sp0xVQJjoy854N2h8ePUIlQxgbLKDxuqPqtmsQI9bZAaeu+DKnfO3lQLDsJZJapJEHG2YBynaq/McQ1jh4l8w3IPGBdg56Baq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7LoUUn2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7LoUUn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06571F000E9;
	Tue, 25 Aug 2026 21:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693261;
	bh=KWDnM6TtRmI2DttqW3czGUU/7rZExB12LIdMkIFrjUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F7LoUUn2vsMEu4FV+0q/K6lvlSUBa3lRuEENKkWa1dPedGuOivqU71FT8umodHtgO
	 RbUZrcV894ZWKWgG5uR8LrTglqF6Ybcx/w+0EJbrylERsvdbEYvB9q+UJ62xZBsLJM
	 scws4RZLGC/bpumkbklrNZ5c/sPy4gbnBZ6s5ns1ecEYf/zqB2Q1XCsh1Ue6lmrSvP
	 wFts8e533tpTddvFijV8kq/aLSa1aJF6NFOAE97LoBjAlbL+66SOQgFpOFRZx9IH7d
	 Mc58Tyy81N705+K93KuWyHx0y+xUpFVNzjPcd3+9P7snEsjF3CfoR3wPu622c8JUNS
	 iDgdVHnaS8blw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, olteanv@gmail.com, linux-clk@vger.kernel.org, lee@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev
In-Reply-To: <20260826-zx29clk-v11-1-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-1-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:27:40 +0000
Message-Id: <20260825212740.D06571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> These SoCs have 3 clock and reset controllers: Top, Matrix and LSP.
> Clocks go from oscillator -> top -> matrix -> LSP, with a register in
> top controlling most clocks that get passed to matrix and a register in
> matrix controlling all the clocks that get passed to LSP.
>=20
> Generally every device has two clocks (one work clock, and one that
> connects it to the bus, I call it PCLK), two reset bits (I don't know
> what the difference is - sometimes asserting one is enough to reset the
> device, sometimes both need to be asserted). PCLK and WCLK are
> controlled by individual gates. Some devices have a mux and/or a
> divider for their work clock. Some devices, like the GPIO controller,
> only have reset bits and no clocks.
>=20
> The top clock controller is fed by a 26 MHz external oscillator and has 4
> PLLs to generate other clock rates. ZTE's kernel mostly relies on the
> [ ... ]
> likely that a handful more clocks will be added in the future, but not a
> large number.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D1

