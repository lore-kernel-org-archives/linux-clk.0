Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2F493637;
	Fri,  4 Sep 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529206; cv=none; b=M7AwTAs/ItPzHQOvl9+BdXYfnYDV974GiBnPZF3njf3PCN83Z2jVChpi4fNkemIZmkLUIJe0TSC0iTzlpr3No0aERJIW2d1EUmlqPFZWa5EO0K+2s5IWOL6RCB6fbyDV7C5hEK6LnrNxweBvi9OF9RL5NOGH2E4vn9kRQVh/3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529206; c=relaxed/simple;
	bh=pRZjf1t1QNssaAqOhNxzB26mEPbKaEL3JUk2vDan9u0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NocaG+VRklgLEBFlBiovRA0s/xcEXaYn3mXaXex7Js5B+BXfA9nLb5lNXT9+VrrhsaFlfjeWO8ETEpNFo1R3B3Pu/lWHWQVL5YpNPA/YvfDw5j9Np0Kqa33ZO7sFMXRp9ur7qemC80BXjs1wvFweUwpL8u9fuWTm4NfnEew+kws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSBvP2ks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSBvP2ks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1F71F00A3D;
	Fri,  4 Sep 2026 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529204;
	bh=pRZjf1t1QNssaAqOhNxzB26mEPbKaEL3JUk2vDan9u0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QSBvP2ksMLF1HlhDOZ4HoePs3Gz8S/t+Hkbs+sJ052VHD71koRG6fspfUVc8TKy45
	 ANcatLlfpm59InFFu5GbAUFzSCfN9pUL7M6v2B8KrsOGxNwr3vPCIgKpFaVJaczWNB
	 FtCBsZlL8bQkMxtgV3SpLC1/sP2xdj4ujj47+0XzR6MqJK6krPkiLHop29O8Jv/TnL
	 I2XgjRISlnfL9WMrBAHeMJ6XdpkwJj73LkqE31YJCbHh6PJRi4Cz9DyC6Cdhyg3fEY
	 oJOrZJQUpXYzxUNjl1sleZjFY87PgQ4y2+BjYGy//3LrW9HiVP8+4wpK2BdRQQkaiz
	 SdJ4rq0gjMntw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/19] drm/bridge: inno-hdmi: Add .mode_valid
 platform operation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, lee@kernel.org, vkoul@kernel.org, linux-clk@vger.kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260904-jh7110-clean-send-v3-10-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132727eucas1p241a5ba1517b5c6a2efde7bb2fdebf299@eucas1p2.samsung.com>
 <20260904-jh7110-clean-send-v3-10-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:40:03 +0000
Message-Id: <20260904134003.DB1F71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> inno_hdmi_bridge_mode_valid() validates the pixel clock against
> hdmi->refclk, but that clock is optional and is only present on
> platforms that describe a "ref" clock. Platforms where the pixel clock
> is produced by a separate device - such as the StarFive JH7110, whose
> PHY is both the clock and the PHY provider - have no "ref" clock, so
> the check is skipped entirely and every mode is reported as valid.
>=20
> A mode the platform cannot generate is then advertised to userspace.
> The subsequent modeset appears to succeed, since the atomic enable path
> cannot fail, and the display silently stays blank.
>=20
> Add a .mode_valid platform operation so platforms can reject modes they
> are unable to drive. Platforms that do not implement it are unaffected.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D10

