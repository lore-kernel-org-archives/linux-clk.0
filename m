Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64551615B;
	Wed, 23 Sep 2026 18:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188370; cv=none; b=OViSzoModETy6AKFts1lIrUOaz+JzPN/xOPjD2WYnuQH/fgd7DBBS6NbI5G5aLv9tgW5Jy7BfNfHLRR7NBnLlQCKK2tzi+aH7wX3R3OmswCSTvl4otF7gLdv0gfwxD3a79mSs68M83u0TnpBNR+WeyZRc0OII91GmcJwZvPx6Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188370; c=relaxed/simple;
	bh=8gL+s5qDMUZs23tYHICCzHXBl2/rprPL7QbZ2oK/Hg8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V51DMlPteT1DpW4bPM1/QmKkPO4SzbCqV7Cv9rl48yCKWGmoVnzwUB6VY0JXLhy6M4zmh2mc2Q+Z+iedKavmD0vc3qe/z2596ttB2nTv/LqF3BBfGJayGqSe+bTkol4q2oAA8yBzNLML/bkG1rvwLQ+/MVrvpkkYEDLDUG2tyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZRFVGf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZRFVGf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369BD1F000FF;
	Wed, 23 Sep 2026 18:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188368;
	bh=8gL+s5qDMUZs23tYHICCzHXBl2/rprPL7QbZ2oK/Hg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UZRFVGf4n5P9rhdikwMvFGWZiqojbQoH+N69Pp6PH7T/hdfBHxSQHKBMkUVQvjdY+
	 8WWH/pnEkdBzbA1LGKLs3uNJwgx309kdR6AzUWnz+O4UYZGRrzYlaySxi5HZBdfrXu
	 Xjyv6tTKxtQVsOmnFh9FbZu7zuXrvTT9cYXs42YV1xTAOETSPN9+7wO619Oiau4L4f
	 +3bhdeNjAJ0KdVCijTrue+iYGxrUItxXtBjh/3g5LcBkEGmHY4RnDu15n1poBBaaec
	 JF4sLW7aCyGGXGwShEzRutksKytLOZc16X4UTnrhkGhXTd8NXRiA5fchinljJzPLLl
	 JTxEbe+Jy1MIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260923-zx29clk-v12-3-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-3-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:32:46 +0000
Message-Id: <20260923183247.369BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The clock controller of the zx297520v3 Low Speed Peripherals is
> relatively clean. One register per device with gates, muxes and resets
> and for some devices a divider. There are even bits in the matrix
> controller to control propagation of clock lines down to LSP.
>=20
> The clocks are sorted by register address and I am convinced that the
> device list is complete. There are, however, a few more registers that
> are likely extra dividers for TDM and I2S devices.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D3

