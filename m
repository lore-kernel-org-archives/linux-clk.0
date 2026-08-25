Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A53CAA3F;
	Tue, 25 Aug 2026 21:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693313; cv=none; b=jNRMVL8HAFRkKYXoekMdAZgAkJoQOyupRjFM7aTOpYewi+CZ7t1XodhWMZDppYgj6deN4gybxL1lrbRBNsrTGeymTxroEgrcyDtNSTUOCvWl0YzwJ2TqfVy4rOhn9DcWbqjeTh2ihK+xS9DV0UZmPObpfU/3pZ2XX06m4ZLj2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693313; c=relaxed/simple;
	bh=qdUaTyvkD2KRjzuTxnBcfxSZKMiTWJf+JlsfjjwhB1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LqkV3OoMYizQrv6JnAfJpydmySYJVAwbRlDzntoAB257P2mSf59ZcR9Ihw1R39TwriDjvxRZd4BB8pCCMDdM5K1tF5O8tj0sHeSiStBoKB4XZsmDyL+8EDyu9UL9as0gR1VzhEMd+SgU+xJCWjGHfpGJ4DGreFdW/Zt3rUGG8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASBBUgWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASBBUgWC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5CA1F000E9;
	Tue, 25 Aug 2026 21:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693312;
	bh=qdUaTyvkD2KRjzuTxnBcfxSZKMiTWJf+JlsfjjwhB1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ASBBUgWCfoFKDACIgjAVAMZQcSOcil1hEB7/w8cv1uZb8WpvCD+GhHDG8+a6ob3jA
	 Xa5Amd/2JaYuI6whkSdx2LSC+L9aZGetdmN7AA2s/4cPDMKSpFu+o95sMgxaU/v/83
	 Fk+NRlBnu+th2Z/P2K9qe5iPZRXvd7fLe/k+vzlLKZPxFRGpprOW1nrrkyONmUAXLC
	 UztJ9Wwgok4KayIkqDZ4DiMw9M68eIyXTDGPAhIU8OryBl2Cpf5xtqi3x45h/57crU
	 We/johpPgndK8/4VKqCAKq1Wpc4xSD9jJelWcIGsPMx0ghs+jKxk1PFKK2sN1IISQd
	 BE6bLPm+KtXVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, lee@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, mfd@lists.linux.dev, olteanv@gmail.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260826-zx29clk-v11-3-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-3-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:28:31 +0000
Message-Id: <20260825212831.AF5CA1F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D3

