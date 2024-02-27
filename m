Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B11384AB
	for <linux-clk@vger.kernel.org>; Tue, 27 Feb 2024 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709029905; cv=none; b=TfbfETJmwlPr1O+ZXb4LC3ZSAe/EWPnOMePPH3v3RV+liifj+kmDdDgN6RIwelE/1DpofQDP7WgQt0dDvo5xNk4Q3s7fErNN2kLFP93F20YOqxHQGUqYmgSaRhfMu2DRUDhVzVuOyXY2yWJFku1l5Y9PhIFkhFlN6Mg+sb7sY7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709029905; c=relaxed/simple;
	bh=LOWsfgMVIfT9MG1ZTgMoYxTe3nDa1QJyvAydFyZmGzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW8Yz1borHW6UEHxgyq46ieAbHjrr3Mq/ljM7SnQh/b1DEEfJrrxIqkcwYDg1I9uNjrDgV93VtUN+su84ZVIPvwP2Wa9GW0Sfvnkxn0ra/7NFCep7wmS29+BPM7xxJoB4Y2FtvOOh7suGLtVlyjhyLpYFRWMGqVEMjzf9zUOLW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jZcg4ztZ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jZcg4ztZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dbL/1XvFauFND20vhPchniYCSYcRWuKvMt0Si+XQg/k=; b=jZcg4ztZXroEV1/s/d8X3i9ctr
	D5GKdyYBNpHgJCjW8h6dH9cm6La6irA2lS0vJTztDZFCOXSSGoRQKBWHDoYGd4rR/rZ/z4PFa0/+s
	3MSYu9bZFXRMcka04z3HnToC1AMhjm7mDQ6KCYqywwcug5l2y71r+z3Nx5hrwF0GniwxAesMg9koD
	cl5tMH+hW/JI3DPZa8i6YUgAM7cyPOG637N4+kql4wZelyA06M3mJwWKx21CREUa5aA9huKzMZ3k4
	EXuTWoO0GLtpC6XOdRv/YDizwAxA4+nLfwDbr909vDJp1N89rHmXTnZQsDZL61I27WtxhL+M0GgWS
	orZwcXAQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49318)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1reukL-0007m9-11;
	Tue, 27 Feb 2024 10:31:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1reukK-0007JQ-As; Tue, 27 Feb 2024 10:31:36 +0000
Date: Tue, 27 Feb 2024 10:31:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	kernel@pengutronix.de, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] clk: Add a devm variant of clk_rate_exclusive_get()
Message-ID: <Zd26CLdCCNFtjX+l@shell.armlinux.org.uk>
References: <20240104225512.1124519-2-u.kleine-koenig@pengutronix.de>
 <f4noroegkbikrsjeisqlel46cu54emhnndtncnj4shygsbcaem@lixfb7ezeo5t>
 <a2v3qm3erl7lfsmg445zyhihvtybbeis4ntrsdlqdf5wpjlyy5@bc7k5zyvzeyz>
 <n25yhjcopyon7yuo2l6t6akklrfz4l3flcfl34aycdlr7x4yaf@ta53zqedauzo>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n25yhjcopyon7yuo2l6t6akklrfz4l3flcfl34aycdlr7x4yaf@ta53zqedauzo>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Feb 27, 2024 at 08:38:54AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Feb 15, 2024 at 10:39:00AM +0100, Uwe Kleine-König wrote:
> > On Thu, Jan 25, 2024 at 10:44:45PM +0100, Uwe Kleine-König wrote:
> > > On Thu, Jan 04, 2024 at 11:55:11PM +0100, Uwe Kleine-König wrote:
> > > > This allows to simplify drivers that use clk_rate_exclusive_get()
> > > > in their probe routine as calling clk_rate_exclusive_put() is cared for
> > > > automatically.
> > > > 
> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > > Changes since (implicit) v1, sent with Message-Id:
> > > > 744a6371f94fe96f527eea6e52a600914e6fb6b5.1702403904.git.u.kleine-koenig@pengutronix.de:
> > > 
> > > Given that I'm not the only one waiting for this change (see
> > > https://lore.kernel.org/linux-i2c/20240119072223.3986183-1-alexander.stein@ew.tq-group.com)
> > > here comes a gentil ping. It would be great to get this patch into next
> > > now the merge window is closed.
> > 
> > Is there a chance to get this into next and then v6.9-rc1?
> 
> I wonder if this patch is still on someone's radar and why it wasn't
> applied yet. Does it need an ack by Russell before Stephen picks it up?
> Is it too complicated and needs more time to review? Can someone please
> comment what the stopper is here?

Well, if it does, then the simple way to solve that is:

Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
