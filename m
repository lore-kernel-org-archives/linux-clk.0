Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6284A3BF660;
	Sun, 27 Sep 2026 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542482; cv=none; b=ptfI12nqd2ZHD30zw5LBmyYDidPUzGx1fyvFLlrBin5WUp21/nSxuDkJ5gy985Qc2DeiZ/7Y1yNPN5Y6mBaOEIKG6ozT0GcEiJwvIsd8bMkGRm0Eynps3RDg28A0bgeu+Vos2c0paybusYq713RwGTR3NEuc1b49n7Ecreos48Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542482; c=relaxed/simple;
	bh=C+4HJb8NDZ14of/5eeUCzIHQUJvbKQuPYwVhUOTbZZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eFGVdsLT3eZwn+Lrs2aKiS31Z+JKC7mRUaNyNciOJVxWdNFOwfOumv8VTtQIUmrHKHb+oVp8ehocspj9IEKhBHBPtGDTBgKp8OurBRo+wchrDQvjbTXd2iPuVl3Kcq9+lPOvg7tA52uZ5Drut+MZmVntuSnZEz8z5I9BmNFkLo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFcMovov; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFcMovov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E731F00893;
	Sun, 27 Sep 2026 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542481;
	bh=C+4HJb8NDZ14of/5eeUCzIHQUJvbKQuPYwVhUOTbZZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFcMovovPJvoV+oeu/ukGOhutBNItjCL3o9iPbZ+GoZ2YTPh4lfHXJV2zNb821COS
	 2RJyuvuXSepNq3KaGchP32ec87SWMknHDBi0RDjmpZRTA+JzU9zaFK+FtEMnJMSzph
	 gxK5KWHOTvPdliyDuBgH7SRFL1tGEN8RMuUxBTsy1uMGGLzwYj6dS2bdPzuk7e+Qze
	 qBJSgWqrzWidAeU0Xg1/mdzCKZJdFHMgXG6OZ9MwSsO1brQY9fukgFil90zWm10DRW
	 +M2O7tGpsBewFS1DfZXXfMgqt90/vsnNRcEsbzQZ406fWtEDPQy+GJdOOEHFdk/K+J
	 036zVcQZpNEmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 01/13] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927-zx29clk-v13-1-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-1-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:54:39 +0000
Message-Id: <20260927205440.67E731F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D1

