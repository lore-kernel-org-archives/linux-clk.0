Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C38FCA4E;
	Sun, 23 Nov 2025 22:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763935475; cv=none; b=SvrkWZfqvWYulPU4vFzWtDGV4e37EmfoQ9k5l/TecbD47JWLwTglb2dKhsqrlFkO95oqzKetpAVS1n5lYFuBhLgBuRZS0e8xo7iRGmhGZHj2xbc6ZUDqWgmGULu612S6a8dQ9jHx9+YedQzPWI0GS2ftg67Q3v4mGpq4mbrXf4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763935475; c=relaxed/simple;
	bh=z1O+vaWNSIlSxK/1jCe5R7LPNYsWAP5hp9gisL56ucU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hLfsGd0/7zX0382R9aDmqTdmBJNYqKq1xKbs3TmjilUu+8oqqTY0eGEclEWFoNelbfQ6978p96mahvFm8ahz6+teGpU7fwHL9BCcEgSNeZyYgiwWu0ykeiBQsRHSs5QRe70lzie/GUlFjJJ0pg+BAfIUynsDEIZSMge+sd+K98A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RXXJTQXi; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RXXJTQXi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=87aVKtphPmWH51C+RJV57IlAYwC+mC5UV6mscsFpSJ0=; b=RXXJTQXismvJyTDBN7rfBczTLa
	F+XWpvrLeB3NEJsyf8s1Qg21HXFvIPhH+3iVpIwfDvSqKBuJ+AsT0uLEhdl54R0vt0Avm6aXzU8JS
	vV3mfFidjuhfgXAmTSWVuECOY2Vg4Xcv9Mxm2zOgQncJxIBDtV+pe3QCbmnfBu6J1XOEY1Eocg3Py
	FQ2DPIaTQDoeMLxoqGsOEtsDM7yz3KGcU0S6Y8Qy+Ph6uM6eRM42a3IjvIphoEpQkz4271+Cqtmyc
	cCGUwqjZ5AT1FoewevopSrMfHFaPugrKKBB4nkK1ah1qWzznAFVel+4YmfSaMKkzxMXnhF8pgPaac
	LHiHjRyw==;
Received: from i53875bd2.versanet.de ([83.135.91.210] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vNIC0-00008P-9S; Sun, 23 Nov 2025 23:04:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	finley.xiao@rock-chips.com
Subject: Re: [PATCH v9 0/2] clk: rockchip: Add clock controller for the RK3506
Date: Sun, 23 Nov 2025 23:04:21 +0100
Message-ID: <176393545901.212596.10640796816193748171.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251121075350.2564860-1-zhangqing@rock-chips.com>
References: <20251121075350.2564860-1-zhangqing@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Nov 2025 15:53:48 +0800, Elaine Zhang wrote:
> [PATCH 1/5] ~ [PATCH 3/5] has applied.
> 
> Change in V9:
> [PATCH v9 1/2]: Fix "clocks"
> [PATCH v9 2/2]: No change
> 
> Change in V8:
> [PATCH v8 1/2]: Add explanations for "clocks"
> [PATCH v8 2/2]: No change
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: rockchip: Add RK3506 clock and reset unit
      commit: 84898f8e9cea06f8178fc5ca53f068180f7bfba0
[2/2] clk: rockchip: Add clock and reset driver for RK3506
      commit: 18191dd750e6c9e17fabefd09ff418dd587bcdb9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
