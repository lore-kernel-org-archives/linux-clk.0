Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457087;
	b=uSamldzw85U0D/Ms6eXtQ+IoICneJY9KVSJaoohZfWeyWzTloeczuqQxIWp+EFXfdMw4
	 bK7itbdUAjNzonNaFBQQjPV8o6R8dFU4nA5cfhCQBoSIk86HRa0HRXl1bchVD34a2rM93
	 sqTXd+dWKHLwNBf9FFJSvaZ3L7L7HC6h162WnWXbkRIc4HCxdxyzPJAjYCLv2PE5xIkBx
	 uFvysTgI+hen9ox6fga21KfYFqSwubA6WwSoslc1dwB4icRhE8HHdcnU/LEyUGMVhwr/e
	 eeFpy8TSuEu+yJtlERVTrV6XIHxQWtFn/XUABOMUwm9/uSqGuDYcEqKxdAASiUL9scQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457087;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=y35eIMSiZT/nTX9Fpa3jplnBfS4jKOac4FxuSq60JL0=;
	b=jckme6h6+YrscSgr8Z/KhLkymSmavxaQ8W5gd4MhTcs2XRaqpLPV1plqaB1etrU2yUOF
	 TaHNTZHRr/m4wzLc2ETiovi8BPikg9V7GyNZbC6fi9o87YoFVI1U/az+ADZfDtL226cqb
	 zUgE6qNpgqBjpqbxYE6TeHPXG8miLUppdLfBLtNzJoK3aim8QmWfB9NuqxbNlzyqqcnHH
	 bRi9RgX++Grk9ByiwepRQHcFPRtdymAJhwDF2GqePSR9gK0/R1XDTd/U5rl3xZg/s2Tn0
	 abeUPE//mGXGO+iCaRVpz7BDPoU8TPqli4BymrCRwmlF6F3an6eBrcnP3DXnnakXLNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdSNieRG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B0606A31A;
	Mon, 23 Nov 2026 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdSNieRG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC0B1F000C4;
	Mon, 23 Nov 2026 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795457087;
	bh=y35eIMSiZT/nTX9Fpa3jplnBfS4jKOac4FxuSq60JL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CdSNieRGhfYgx+Dm7mrlMeU8yDdEWMqPkRKS+OWrREWFn83cMz+3TMD9ziygV0/D4
	 kDfbQCfLVWNJQr1M4C/eT722iSqt/gMPvdk6snAzl67CWbW5pY+zIlibQbxI9SE3xg
	 uFqUmNDp+uyyWo/yINtUGjnO4k2oPXvOofCT9ORHmkwrVuvsmRjPk2E2S+O0TnWFyA
	 di23SIhRYTyWMixXsiErzrzGDj6ySUbyxa3Or8kenpoISbfQN04S+4Z+ZnwGlVO+5/
	 ecV0MnutE2LVnsmrn70tjmLYAFSeXzliZFI1YibLrnHLhIvqU3DOCpiugX4fsuW4cq
	 J9P2YqUJA8i3g==
From: Brian Masney <masneyb@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Mike Turquette <mturquette@linaro.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261120-ux500-clk-power-upll-v1-1-431041f317ba@kernel.org>
References: <20261120-ux500-clk-power-upll-v1-1-431041f317ba@kernel.org>
Subject: Re: [PATCH] clk: ux500: Power the AB8500 ULP PLL from VintCore12
Message-Id: <179545708005.209212.18146398732794144167.b4-ty@b4>
Date: Mon, 23 Nov 2026 13:04:40 -0500
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=308; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=1UzDk8FVrIOGyD/xdVIAtdnxgAhXqPxF+MYLJb6pd68=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZGqyePCk06Pn9qkB258oi70kLvZP95c6c+GF52L/24
 AvV/x+9OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI7lOMDG/fF6UfDsp8fu1i
 4YH/0vN4b3RW/hL+GX42umi+5h05nocM//3mOjcVStYION49FeD+PG7au+rueUv2b7p/rc76U/O
 9C3wA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 20 Nov 2026 10:02:38 +0100, Linus Walleij wrote:
> clk: ux500: Power the AB8500 ULP PLL from VintCore12

Applied, thanks!

[1/1] clk: ux500: Power the AB8500 ULP PLL from VintCore12
      https://git.kernel.org/clk/linux/c/69e92a94ef27

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

