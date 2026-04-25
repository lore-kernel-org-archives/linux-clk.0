Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C45364949;
	Sat, 25 Apr 2026 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777140374; cv=none; b=OWZ7A+Pus5v/MFtUiG/A8SAj3Huaa0ss3YIwGu1pqXHfmXIByOAWGZ4qcgbkmIbbECEI2M2vocH5L3CFqf0rFHuDzY92XoF4LTFN0rsHMhGXNSVSU5MvBEEjeIbTFYUFUNFiMoZbaOHBmDOANtl/04s9NlanunyAb2m2URKTivo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777140374; c=relaxed/simple;
	bh=kQhugXnKZaFsFk2VLARnVsEPScbazA/Qt6kI51WMme8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=WVy5eIwDN0tsgxFQJ93TL/YPeugBcZW52kVL5WQzQnoEwS7Nj/Ekvw3lAW/CkboIvOdXX56tEoArsaFpij+IQdH/wSXaNPmynLiwTTMp0pVVvu06nE7fc8/LzicV/wouSHqpsbXKOIT9AI9gKNl9DL2mnNPgmcHcIv4A8vEFXRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXlPDe3t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXlPDe3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4C1C2BCB0;
	Sat, 25 Apr 2026 18:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777140374;
	bh=kQhugXnKZaFsFk2VLARnVsEPScbazA/Qt6kI51WMme8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fXlPDe3tmLMH6p3KtZGTKhXWROWTdMMVOTo/Q43zxNtaVYBGKJZRchulG88X5+A/R
	 dxgGIUm1Hp/3dsybuRA8/zAua+D/Tu9NNxO472o+DE6sOFhua03zBeAaU+05gYLPDE
	 hv9Zx0OA9e5bap083O5F+Shj6cm9kEVKggMKkhCkAlONQJQ1Ju2kaqVXHwdujjxamM
	 ZKUvniEuZvZDnEs1Lp3AprQinL/7zWSAbHfC+8Py8yHkQ6fiXJaiSfMvtZ9C65ZNjh
	 B38F8vw7ns/nDihDXj6o+uGx1BM3vA9fijb1tO9mmtUQM+eWi4CMOMCrebpFrN3nA7
	 00Z5bm/Yj1R7g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
References: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
Subject: Re: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>
Date: Sat, 25 Apr 2026 10:51:51 -0700
Message-ID: <177713951108.5403.14915756699205242219@localhost.localdomain>
User-Agent: alot/0.12

Quoting Mark Brown (2026-04-24 08:34:52)
> From: Ma=C3=ADra Canal <mcanal@igalia.com>
>=20
> On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
> display driver, which remains active until the vc4 driver loads and
> sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
> lockup happens and the firmware becomes unresponsive, causing a complete
> system lockup.
>=20
> Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
> clock disablement and remains available until the vc4 driver takes over
> display management.
>=20
> Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepa=
re callbacks")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/5f0bec08-f458-4fba-8bf3-06817a100c4c@si=
rena.org.uk
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Link: https://patch.msgid.link/20260401111416.562279-2-mcanal@igalia.com
> Tested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to clk-fixes
