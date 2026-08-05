Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B986E3D79E9;
	Wed,  5 Aug 2026 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785963581; cv=none; b=Q/5303cCXxhR3WKxHrkTtdD5ZGVHOWiuLC1FUShrdRPMqdIeZtB0dSqswxNy9H8UVHgSdHNgS4KWavQoc1A/IyqZV3NYzjgaCrEK711iK/Q++IaJZQjaCsE4piyHNEHK4VX+G4oNGYcgsr6S9L1DndjudSVFNMrAGcsRcnY5N2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785963581; c=relaxed/simple;
	bh=3IZT/SpjzyU8waElPMzR7bxm3M5i2vJjh71NrcbwIs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=prkueZhGG2AaOZh/vsiz1kMm6N5TriO0ocgLx3qpalbRaxBzgCiv7yiCnMlpxtxmX/y+w2WySUjKtI0UkaffDFmUsdRqaYIVEChikEUVcCpz7wQhk+q13mKQLgV8SJ7+0LnH1DkHlUKxjMaRzRddPBRsI7qEZ3KklQkMz+M2NEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=kRmyA8ox; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="kRmyA8ox"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=971/E5H2S2WsTVQ83jj0cYfp+Ciybhtp5GybpD0dmnI=; b=kRmyA8oxGfQsg3R/DDcROtnry4
	XoKUO1KsJPzKZ/xMHGngf56zx8kAaJ+FRqFmYvZEFWZer4xTcy5okVSGLnwz9Ks+PT0JWi4ZQW/b8
	/g/slhQ9JOl7uAFyVY5JYzDRRgDToO6RgFtH8WmjVDPdEQZs8BXyB3nkORCV49IkmNAuvFLgY/smd
	4uceg5I6IecSeybbE1DE6z0K7KSoZn8QvAaB5UOBiYiMu3Nf94JoplkjreSR6ejNwus/RtPrOX/Tm
	KsepF3tYNzgQ/5vrk6VK/mEecoHn8Gzeky8fefy49+sUdedAuB+6PddjjXuiLRVeFbr5KSXfFQHbO
	/kBo48Mg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	YouMin Chen <cym@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Alexey Charkov <alchark@flipper.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] clk: rockchip: rk3576: fix source muxes for SPI0..SPI4
Date: Wed,  5 Aug 2026 22:59:15 +0200
Message-ID: <178596355280.2517015.1649597472249791359.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805-rk3576-spi-clk-v1-1-2f040d0d163b@flipper.net>
References: <20260805-rk3576-spi-clk-v1-1-2f040d0d163b@flipper.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Aug 2026 17:45:09 +0400, Alexey Charkov wrote:
> The TRM defines available source muxes for SPI0..SPI4 as
>  - b00: clk_gpll_div6_src
>  - b01: clk_gpll_div8_src
>  - b10: clk_cpll_div10_src
>  - b11: clk_xin_osc0_func
> 
> Which doesn't match what the current clock driver implements, making it
> impossible to derive some SPI clock rates such as 37.125 MHz (which
> requires clk_gpll_div8_src as the source mux).
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3576: fix source muxes for SPI0..SPI4
      commit: 586ff159ec02533c17dd928641529cb0b52e9c62

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
