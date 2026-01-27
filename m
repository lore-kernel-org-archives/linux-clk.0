Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644831062C;
	Tue, 27 Jan 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522913; cv=none; b=OYg5J3t+WT9NQJGpajVKTYh8bH55frjBkXTb02XftLINPHv46kLKktnr/LRii9dcwIW/UYrf1ja8J5Y6gsZ7L/C61/TCO9lYlY8y0NJc/ePkeEe1v7SNDbr2v2ImROosLRiFterk5mzwSgkbg0qBAPLm2mM5ElZoRTmIjd5axaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522913; c=relaxed/simple;
	bh=nqpzeb2202jrK9ZEgJJDYC78q8Ydl4acN6oBCg7d+7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYqydyP0OhA+cuzockvjyZ4KWT0HDLkla8fyl/uxfvM3Vw38GlVDxcvhqqZthVrFCrzH4JVIqE3m44b2LAs0oFNDiqzQQPwVJ157ziQkbm9Ia0CFWsLWJTFHMasOggdzS5qXUIVFn0Qi3uNML0BRGu3hHJgm5oBUqw3qu7XvYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vujvGTdy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vujvGTdy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iLpcUMzrfi1cf21OsQRIeFglEgABcn83FXe046wtc6w=; b=vujvGTdyKGu+sOwB9NiLH6Yx+9
	pZMjRz6QtgTMxR4KwCmFI6SiPV+n5BAM09uStkt/juZ9MEtngpAnJPV/BR0HPiQSoYbgQVlMR5iiD
	qLq0IDkER5aKog+Fg9/QoQ0ieMfsHB8+S7/2pKsz5Y7Q+wkp7U7Md/YFkYKvVZGs/PGA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vkjjw-004xlG-0i; Tue, 27 Jan 2026 15:08:20 +0100
Date: Tue, 27 Jan 2026 15:08:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <2ce32d04-ac62-4e66-bf76-9d99b94c1a4b@lunn.ch>
References: <20260127085150.3040586-1-lukma@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127085150.3040586-1-lukma@nabladev.com>

On Tue, Jan 27, 2026 at 09:51:50AM +0100, Lukasz Majewski wrote:
> The vf610 device has built in the MoreThanIP L2 switch. For proper
> operation it is required to enable ESW and MAC table lookup clocks.
> 
> The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> to provide clocks for each AIPS1-"slot", which size is 0x1000
> (hence four separate entries).
> 
> Those can be enabled via clock gating CCM_CCGR10 register (0x4006_B068).
> 
> This patch also adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
> macros definitions for L2 switch.
> 
> The VF610_CLK_END has been removed from dt-bindings, as its number had to
> be increased when MTIP L2 switch clocks were added, and defined locally
> in clk-vf610.c driver.

The nice thing about having it in vf610-clock.h was that it was clear
that whenever a new clock is added, the value needed to change. It is
now hidden away. It could well be more clocks are added, the value
does not get updated, and in use we go passed the end of the clk[]
array, and probably corrupt the struct clk_onecell_data clk_data.

I would probably add a comment in vf610-clock.h about this.

Apart from that:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
