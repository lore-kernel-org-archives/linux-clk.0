Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8002147EA
	for <linux-clk@vger.kernel.org>; Thu, 12 Jun 2025 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717825; cv=none; b=fpz/u4QVtEnQV/DaI1OB9F8oNRzPw27VtBAblVkKk5zuj8xkOk18TLpF8Xll0zEwD+Sw1E245W3DGk0n6xfbsWm7Ulmio1yilRcBsPnGsNgA+yzCE4Mg5owQloEs5WGPvRcyBL8utZR33EfTfBOraE/UpRuqxpuiapa2apk9lSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717825; c=relaxed/simple;
	bh=8iaxqSPyLwyYc4p+UQKnDkBRPNeQrZuJ5qNr27px7kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieWAJKrndyBrLx9IZfcfA2KL/Y2LAyLJVI1jLhoLveIOfI9GmzgiLqc+flY4t84n/sQDkDvfqPJMwQTDIm50ZiPDPDdd0z9QeLXABUNpYv3t8nyohE0IXmC34GIIxa4RTBLRl3o7s8OSElyvDa8G1Qxty5a1JQfpcFOlgpubKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uPdX3-0005C5-0f; Thu, 12 Jun 2025 10:43:33 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPdX2-0035mI-2D;
	Thu, 12 Jun 2025 10:43:32 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPdX2-008pJu-1h;
	Thu, 12 Jun 2025 10:43:32 +0200
Date: Thu, 12 Jun 2025 10:43:32 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: scmi: Fix children encountered before parents
 case
Message-ID: <aEqTNLTp0EzcC2aa@pengutronix.de>
References: <20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de>
 <20250612-eccentric-fresh-bee-e52db4@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-eccentric-fresh-bee-e52db4@sudeepholla>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Thu, Jun 12, 2025 at 09:29:16AM +0100, Sudeep Holla wrote:
> On Thu, Jun 12, 2025 at 09:36:58AM +0200, Sascha Hauer wrote:
> > When it comes to clocks with parents the SCMI clk driver assumes that
> > parents are always initialized before their children which might not
> > always be the case.
> > 
> > During initialization of the parent_data array we have:
> > 
> > 	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> > 
> > hws[sclk->info->parents[i]] will not yet be initialized when children
> > are encountered before their possible parents. Solve this by allocating
> > all struct scmi_clk as an array first and populating all hws[] upfront.
> > 
> 
> LGTM. I would like to add a note that we don't free individual scmi_clk
> if for some reason it fails to setup. I can do that when I apply, just
> checking if anyone has any objections. Please shout out if you have.

Feel free to add that note. I should have added this myself since it's
not entirely obvious that the devm_kfree() has to be removed with this
patch.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
