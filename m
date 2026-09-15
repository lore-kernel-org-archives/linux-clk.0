Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AD84A92C7;
	Tue, 15 Sep 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486852; cv=none; b=gShU0moj1vhN9aNQvBr4YACKNSXnco2Ahr1kigw/csdy2hdibHqoBlSKmOgjSPTXiGCV9zWnCvfCs/xJeZ5cLoOFU5+d10kzmwNxmbFxQqoHMjAYGuFIFDEAQYr0IhNwOSHCefSXB7Wpb/+rDH16GS9NqHjfSowtZZQ6q+ZpfuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486852; c=relaxed/simple;
	bh=yPAbk7xHpMR4UIVrHHyhM9TISgEmvd92P6HdWfgzRAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ICgkg3IAId5UqGVfqQQbSDttNBvcJTp/Nf/cGDxlkDqsUriMdDeiaNBkELfBteCc5ARyj4/3hc2AgSh6ODsiwr1IejfxSA2k9rir0ldYl2ZYbikvY/1QICxaW4fviGZ4ydaP5WTpJArV8aSRdmMavvDwXwHC1dkvcBMjVIs72BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwVsqkgl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwVsqkgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4731F000FF;
	Tue, 15 Sep 2026 15:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486849;
	bh=yPAbk7xHpMR4UIVrHHyhM9TISgEmvd92P6HdWfgzRAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EwVsqkglB8nG7QQhouls1YoCYwZp6BueS50C5QZ2LEnxBF4uK8Rk0HOPKvNdYquTC
	 skVctbFd3T19TaI4YqtaKiVKMNMdFCbTUgjgNSkHoet7fqhLeybmJj6udQaKTa+8Yp
	 2ROddcj722mbG1T1EAFWl2B7MPRIpJj9woTRWrJKs3cs66jmyc5CRsCfLOLPSVtqfe
	 8xHRks81n7WSpy51DObQ6LGP0VqHc7m1v8QJGZfVl2O9XsR0THaldnj3nX49rbCg19
	 vgJV/zhhzu7HdFKLmn9c23q+jxZcDcMZz4P+q6OY87lIJe8sN+uRHQJEVCIAyz7HFG
	 DmRr1t/IWr+7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/20] drm/bridge: inno-hdmi: Make the PHY
 configuration table optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, olteanv@gmail.com, robh@kernel.org, lee@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260915-jh7110-clean-send-v4-11-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-11-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:40:48 +0000
Message-Id: <20260915154048.DD4731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The pre-emphasis and drive-strength values in inno_hdmi_phy_config, and
> the registers they are written to, belong to the PHY integrated into the
> controller. A platform whose PHY is a separate device has neither, and
> its own .mode_valid already validates the pixel clock against the real
> PHY, so the table only bounds the generic check.
>=20
> Let such a platform omit the table: skip the integrated-PHY register
> writes in the power-up path and the table lookup in .mode_valid when it
> is absent. Platforms that supply one are unaffected.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D11

