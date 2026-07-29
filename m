Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9326046AA8C;
	Wed, 29 Jul 2026 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323516; cv=none; b=QiM4m8C+zLcQGBiGkLhgEPpI4KrXEee2x9oiHB6qg9yJ1MIk3ubUEgRl1Cp3tgGU4sPGXI9zZQ7qd26wyTn3Y95J85epM+h/jrxWX4U7R3iS5LfXpb16bH65aCR9N98SuWDUrzAuB6fKZxJ9o+a8GcOv9wX//qa4fOeRuof6WVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323516; c=relaxed/simple;
	bh=be7KVV/NZ2sN+E4MSHg5pSCQZeQ5yT9iwfp61hXdhmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3h92C/1NQ4iGQI2rwgh5cQMMaYwm2JTGwvLWujprzvLylSHPhgWhAdVlLZgCQGVz0J4qTELcGbOeIOSNRL2P1KXem6JLoENvfAq3trpfzTfpSWZ0bRZQPIS/1zkcbtcHc5y0uH0spS6IpurQHzr20sogf+O8ATXcD5FTzo8114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TVdQyTYV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TVdQyTYV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BAPnhnAqDRA9bNdTJA6WEATxjymwtLXJIvPEHhgnOfc=; b=TVdQyTYVGtUTSqA4YYJcqNtzX6
	Ym3d5G2PPJI3JUyfnbwcKnJ98Gkf0lp3Vboq/FzZo1yi5QRRUnhUx7Y2ptGUpt+47YaE0/WNMRjDd
	+oVMQ5eKSkq3KUfxp7y5+kzIEXIdTohcMvYBCsmvXZq+w3O4LoJRfAvEJu4BMtXv1uzgThSYXR9NG
	93TkXulFjbvqKanseqzDhjaSirk5k+h7MqaZmmgDOVuKfU76uatSvIWLZ+U4zFPoYMzBHSa2+5plr
	j0RAuHKujHlOI2wlKBzJWL8cSHsVR+WAngFqVg8G6r2hguxjl3445I7nGweAJLQ9uYN30Imh+6dxH
	O3Xo7qJw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	YouMin Chen <cym@rock-chips.com>,
	Wyon Bi <bivvy.bi@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Liang Chen <cl@rock-chips.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Fix RK3576/RK3588 fractional PLL rate calculation
Date: Wed, 29 Jul 2026 13:11:35 +0200
Message-ID: <178532348703.455945.4872478819710322236.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Jul 2026 14:21:57 +0400, Alexey Charkov wrote:
> Fractional PLL rate recalculation for RK3576/RK3588 doesn't correspond to
> what the hardware actually does due to two issues: wrong denominator for
> the fractional component, and wrong signedness of the fractional
> component. The result is the kernel-visible PLL rate being off by about
> 2 MHz for the two affected PLL rates vs. what the hardware produces.
> 
> While this fixes a real bug it's not a regression, as the issue was
> introduced in the same commit that added the RK3576/RK3588 support.
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: pll: Fix the fractional part denominator on RK3588/RK3576
      commit: 52aef653c3d0c24013dfa9eccf692594eacdbe17
[2/2] clk: rockchip: Fractional PLL coefficient on RK3588/RK3576 is two's complement
      commit: 5814788834774ed6ad1a27ae91b44eeca80cd27f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
