Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D930244694;
	Mon, 26 Jan 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442693; cv=none; b=RgaQPnmlYxHKDVYYvAEM4b6esY6nht0FXf/SE0CCnWGoqoW/mfV14dc026A8CX8NUbKnEqjeUB45PknCRltksxXoyka573SVn2qTUdfZwgQHK2kfBPeePbeWVDKr9jxLSxYLRdDk88r1lmxpoIa00oc1fa+zs9701rtbR0QDlTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442693; c=relaxed/simple;
	bh=79ymqkrUgULFdA4N33ltiBtFQqKmWQ7wWRxV5gDqFkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRM6LgwXth/Ho/6KPVnrDRJPjKc4M3Y2oJNyIm9gxmDpzFQeydwIJJKE+/PPdDD+iHONozuLvX7yvu1Jiij8BN1DufHXLB6ve/ugVVQYiyckH0pBFUUZN6f89h5MadIcMP1cF95CA2u7jQnpycxuY6E1HLIae4UJlRFWB7HfS94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=UWtxI+Nq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="UWtxI+Nq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9bxk/uEW0KP9Vda/3cxHnt1EEylgRwLtuxYT78ZkzzY=; b=UWtxI+NqF4QX3O6jvd5PPFrtDN
	K+ZF4VGYEsIYqw8+VZzdlv4Uo7iX7Ey7HGGCQoLuIPOxjXTVTXylucK0Hf0vLG1OmU4FajWSnOvfI
	KOmsEKJtkYs301A7+C/V2d+9VrwYD3leQ8nX7rvukWWq9VC5VihVczGeiHjBhHFlYoPg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vkOs4-004oFs-Hw; Mon, 26 Jan 2026 16:51:20 +0100
Date: Mon, 26 Jan 2026 16:51:20 +0100
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
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
References: <20260126115349.1750578-1-lukma@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126115349.1750578-1-lukma@nabladev.com>

On Mon, Jan 26, 2026 at 12:53:49PM +0100, Lukasz Majewski wrote:
> From: Lukasz Majewski <lukma@denx.de>
> 
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
> The VF610_CLK_END has been removed as its number had to be increased
> when MTIP L2 switch clocks were added.
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v2:
> - Squash clock DT bindings to this single patch
> - Replace VF610_CLK_END with VF610_CLK_ESW_MAC_TAB3 + 1

I'm not sure this is the correct thing to do. Normally these _END
values are there so you don't need to change any code when new things
are added to the list. 

Why not just keep VF610_CLK_END at the end, with the value of 196?

    Andrew
