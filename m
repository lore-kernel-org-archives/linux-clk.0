Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42183E4E67;
	Thu, 22 Jan 2026 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099040; cv=none; b=nJE+JRLjSIksoHC7ymQs4Y2JX0r74qgMRJyRw0DMl8c9gtau8RvmxR2PaWzc+T89VouiY+oa7QYZkqiGEsTMMrYwJmX3E7TW58MlIrllNt4rOTQOk8380gmOlLrN2Ly4ExoqbvgNVJdHtZ59jWIrbUaJ+1Np4Tnu6Y3f1HPTp5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099040; c=relaxed/simple;
	bh=LWUMNFWJXRxuFM7hP6B8R+QndvyAi8sxXuJoyRgNvPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+bLWEA8QoyU8SwnKDbx6yHT+t6gK8jJcLhO6QLc7AdT5YnrYOzgOpXOSEPZ4cyTfPZZnwukzCnE+9dwzd2gfKEqNDI+zjr/MZnTI83F5NNTnXG1cOby8tS0Q1AJE+AIumGZB9uwnuWph4UhfSurKMW8rIzASnH6YUjWrlzfS6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2FSC/6ch; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2FSC/6ch"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x2dQyO1BXqOqYRRXDNe0klaUkU2ZBvXuHHMcmtAYPNU=; b=2FSC/6chOM83HZdThImQ2Mqwik
	RbgUT06piy1N76UQgy/ONN32jyONLx0rF6yc82LY0mRTZT3/3pCeDK69+BzEkqPY5vYVxL/tc+F6I
	A+wyepZpn6X39oZfy+/yZGUicb6j8/gZxPZ3v/SH16ukqz+eCEfAgp7PxBYVlleQ5JSM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vixT3-00401P-QJ; Thu, 22 Jan 2026 17:23:33 +0100
Date: Thu, 22 Jan 2026 17:23:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <4a593537-e848-4ed2-b6c9-fd2e6b165f73@lunn.ch>
References: <20260122130649.4150338-1-lukma@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122130649.4150338-1-lukma@nabladev.com>

On Thu, Jan 22, 2026 at 02:06:49PM +0100, Lukasz Majewski wrote:
> The vf610 device has built in the MoreThanIP L2 switch. For proper
> operation it is required to enable ESW and MAC table lookup
> clocks.
> 
> The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> to provide clocks for each AIPS1-"slot", which size is 0x1000
> (hence four separate entries).
> 
> Those can be enabled via clock gating CCM_CCGR10 register
> (0x4006_B068).

Sorry, i lost track of the state of the switch driver. Is there also a
patch to add consumers of these clocks?

> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
