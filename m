Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5155383D6;
	Wed, 23 Sep 2026 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188401; cv=none; b=JuoF0+J4IkBFzy7VbMwm+ups8EMF9Pnmtz0YPNQXWPg94MmDqk5SFVJ+0slT63bBxAUvzvZ4cwJZe0rBMwJj2LZGYlT3yks03O1TpULTwFMBtdsR+xUDrINexN1mb4tW5KoOq2jNirC+S8hAgFr6J+Cbg4CGfj9HjOWm+1zagYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188401; c=relaxed/simple;
	bh=oGtOYpV5r8jaHZLmUNx3gfXQS7UWClyuckXbiwVyWbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iYua6rlA0xla8Q0G7VBOTWdTk9Bstl//AiTEMFh9oXMk+ko4w0YKcceAgYRhc2e92bXSlMiP7spZq9FUMDLNrKJjvtO27mBxRC/+jguZi1ZPYWzODjE+DC+3rzSFqzGQVSCKL9pao3L/A+GDjQZE2mbxud0MH1yGgOdc24jZS+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU6OJYP3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU6OJYP3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B211F000FF;
	Wed, 23 Sep 2026 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188399;
	bh=oGtOYpV5r8jaHZLmUNx3gfXQS7UWClyuckXbiwVyWbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VU6OJYP3bka4G8HIP5YoLkmyUiNv5krL9drNFK3MN7hkw/x/MDqmEnKeGP920JYts
	 pW7+yo1cJsU1+hRVdn/lpPNSR9ogqbyzObtrcjqGUaZVxYp/yrrQNFP3heRucAWkfK
	 Or4lrUBXJtBYNQYdEmmixM20wwXQgYiMAplJF+jKVdaVHza94QJbM8W4kdTRi85kdp
	 F2ILi6EoDxTMN/PE64EHOYsaw3BclkfpE0/ImO/l3maDjPhlZ+JNbLDOhYa/NqwdYd
	 xslyoUN2VhT3/U58ZbtBO+IrLQahb+fD15Uxk60evcF4EtAg9egCwZUf1ZYScNdyN3
	 nXNaIlnHxiKkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, linux-clk@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260923-zx29clk-v12-1-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-1-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:33:18 +0000
Message-Id: <20260923183319.39B211F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D1

