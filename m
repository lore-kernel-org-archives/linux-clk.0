Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8194772A7;
	Tue, 15 Sep 2026 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487101; cv=none; b=hiyTCUqB2tgoAtylByX6FcvFHc3z1BGlV+RXmgmHkwUbfeZyxwCCLWKKwpdSc91pP1XQ2aPmSlHG0DxFZ4QWTHAVp/h9d+l3XiWUzIflnZUForpR+KUmoKcdxj5RL6PkYmQWBWDAO/Wob2LuDM4p3FyKkvxqVDRvCaGh0Bzqa9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487101; c=relaxed/simple;
	bh=mu9Q99hcvwNEtgql17+2eBH/L+oan3LO4fmdoLSsofM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kVW57CmA4uZrv6tPD/UysffhR3NZY+t0UuDpQVsf7i6Bl0F6gybI5H45iraMMuSaTVOQLGQ/4CNEdLet2V6MTwsrajFkrwteHB/u8tgjTvxaToV9sy3yFchPYND2DZGw5PSPRf7gsLSyrS8KfaZF+lsF5jidt5H1sfJrNRnKXX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ir7RL1KK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ir7RL1KK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3491F000FF;
	Tue, 15 Sep 2026 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789487099;
	bh=mu9Q99hcvwNEtgql17+2eBH/L+oan3LO4fmdoLSsofM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ir7RL1KKkkz9wkehIGqJ6VO9Z55M/+7316QFQQvCa+Sse6kB+Xv8yE39I1gdgRFNW
	 0FdZrOY95DernjMUh3lp7SklqrQfzAyuoKn3qacUjWOP8JG9ZJGGTcRxMEKMxGvRVk
	 mp6ZoudHnBFy8w1JvJqVnDdZ2WxyghNjWEAp55hQh1VcynRQItx+4sG0kUBttRpf6l
	 8ZEfu1/ipzI4JZJQaR6FQrxCbXvntfY1tndOJMlYm2gWhs6OGND2p70rPNEGElxly9
	 qkUsHJ93jn+fU9jXGd2G+O6K14naiQKp9iq2Wc15GOoDn2gYWFKFTZTCoMfZ4t2zaQ
	 2mWZeTXtcR6JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 17/20] phy: rockchip: inno-hdmi: Use the common
 Innosilicon PHY helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260915-jh7110-clean-send-v4-17-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153244eucas1p180f69e8f957a5c615d3c6a59a1c205b2@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-17-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:44:58 +0000
Message-Id: <20260915154459.3A3491F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The RK3328 pre-PLL programming, its table lookup and its recalc_rate and
> determine_rate implementations are the generic Innosilicon ones, so drop
> the local copies and use the shared helpers instead.
>=20
> The RK3228 pre-PLL sits at different register addresses, so it keeps its
> own register level code and only shares the table lookup.
>=20
> The now unused RK3328 pre-PLL register macros go with it, as does the
> local pre-PLL config lookup wrapper; both call sites already have the
> TMDS clock to hand and call inno_hdmi_phy_pre_pll_lookup() directly.
>=20
> The RK3328 recalc_rate used to log the pre-PLL output as "vco". The
> shared helper logs it too, and reports the actual VCO frequency
> alongside the rate, which is the value with the 1.4-3.2 GHz constraint.
>=20
> The register writes, their order and the values written are unchanged.
> No functional change intended.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D17

