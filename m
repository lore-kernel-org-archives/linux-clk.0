Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC41277818;
	Tue, 23 Jun 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219610; cv=none; b=hKjHXc9g1Wi0Zdv1Y3jraKqzntP2vWUCtyTJXUjcQkMWiu62zU9g9Lth8ogaYGicipAN87Xct1piXkUPJlcDuJO6wD0ZUst65Ln0e5PmYMDRfjou8cZBim1GGpe0NdxRQ0yhF2pHzQZODG4ZxaMnkIYKhXQCVQTDhQLNDjQHef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219610; c=relaxed/simple;
	bh=nR20EzcDT4t2nivRzb6lw/7RBw/UqVCDNCfiihXYmsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LqSgBa4/MyFX1BuT/01ANHKhxT6wnN4xqzODQa2/5jPpRDPvNWi1ruZHNMAHwUZnsFdUy2v3zcNXvHIIGacnk0eZINDC6AzfR8hTcfETixVKRqSmFvYFz83UQR9gXCrpiO5iKffNve/udpzcPun7A21vSW73rcXIxDzRFa9/w+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=VIr2/FaC; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="VIr2/FaC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nR20EzcDT4t2nivRzb6lw/7RBw/UqVCDNCfiihXYmsY=; b=VIr2/FaCMzauloImmfwifrMDq/
	W2dgBHQydMdMowI/yfTeU9QtHOTGoTmRHcVeQlZMFKUVc/f5bcTHIAYfNxsnXOnMTbjEYoW++84fD
	P5BKuoOuzRzDnbTCtNGTPwRj+rDdNJSEZkYkJYBzMx/Z5My6DilCM/YeWxUvrwEmsYdQqVpSLn9nR
	nEyEaG1vR6uzcmnqYO6EXlRPeMqSXNZBbpmx/i95FjWI7fA0W+Z70B+0TcfZX/S6evJD7iBftUcCm
	HrF6+nIuexUo76vahOZKzgL+n/QLuagA8xA4Y9Fcv/t+3bOdvxI6soaRw0K7tpg0U0W9OQipizUhJ
	zVis/yNg==;
Received: from [81.57.40.39] (port=36064 helo=superkali.me)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wc0Jd-00000002P8z-1GKJ;
	Tue, 23 Jun 2026 14:33:18 +0200
From: Daniele Briguglio <hello@superkali.me>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO
Date: Tue, 23 Jun 2026 14:33:16 +0200
Message-ID: <20260623123316.4111002-1-hello@superkali.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2100447.PIDvDuAF1L@diego>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me> <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me> <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Heiko,

> can you check if adding CLK_IGNORE_UNUSED changes the situation for you?
> What I assume is happening is that when the clocks were not declared they were
> just left running, while now the kernel turns off unused (but defined) clocks.

That lines up with what I see. The gates are set-to-disable and reset to
open, so before the series the bit just kept whatever the boot firmware
left it at.

Diederik, the cleanest way to confirm is to read SOC_CON6 before Linux
touches it, e.g. md.l 0xfd58c318 at the U-Boot prompt (bit 0 is I2S0). If
it comes up clear there, the gate is open, and if audio then breaks once
the kernel is up, that points at clk_disable_unused turning it off because
nothing references it.

If that turns out to be the case, CLK_IGNORE_UNUSED on the gates is a
reasonable way to stop the kernel from closing a gate the firmware already
left open, for boards that would rather not switch their DTS to _TO_IO.
Where a board does reference _TO_IO the consumer holds it open anyway, so
that path is unaffected either way.

Best regards,
Daniele
