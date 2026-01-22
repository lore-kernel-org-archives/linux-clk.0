Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817834EEFA;
	Thu, 22 Jan 2026 19:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108732; cv=none; b=bdUIkPBSElghHS5R8w+CVCMfPjCMXsQcDN6xybbA8+JzCKUAUGGdlZP48Zv93J95K2ybYliMuCLEPgptzjbIMDq4v83p6WTH00VWiYq1eXdNA8B7VzYz+ifpn5Eh2lj6D/PEipXEWwGo/HBQkMM9bgTVyuCGt4184sKfhnt/Lyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108732; c=relaxed/simple;
	bh=l9340XWXgy7Ii9BVEFccXD+g3ujL+U773odNXH7XVHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSgdkFMm5UV2iZsU2di0WqKmOt/t8C1wcghRPISdV22mY17yUo9NeLmpqch3bZx/nr2PYkZRakEspLIhi39n+fMh8BTf/ORvJRSX21OYk8qcCFVV00yjYi9jhapnBdy46mni+hu3Q548wklx8pmnFRAswYflSL5XsWJtaipHUp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Pw7Hi2tz; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Pw7Hi2tz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FF37108962;
	Thu, 22 Jan 2026 20:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769108724;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QTPahbF3n4Y+k+onnDFwlQa1Xun5RdBFV/nFJ5gb74A=;
	b=Pw7Hi2tzBlVT+5b50ixF9lBYzEztFHlPTGGXLuQ0S/yAljY4e1eazqu4LMEHr3kWIEULBO
	1oGF20gUuptDkDnV5uvDYajJNdwGzkXVWms1FAt+Tbz7xRKOFgyxQTI4YsWaN3wpMqRX1b
	GxVwllbWsyHJijWYHYYdwzVlWFRAGED9jtiLVCP1tLFsV7CrUt1syTz1HsXkOLkv30SN/X
	Uukb3kay6XdM+xU4WhYu3oMxzsV9S6BTr0oyyph7VVltvh5rmQnf+F4wbx4DTMWRUf5Nt4
	/xRFBGa6o/4q7OSLP4q8b94S6/WO0fYzj4MbesbrFQZyJtiTpvQTGK4i8pL1zg==
Date: Thu, 22 Jan 2026 20:05:14 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Turquette <mturquette@baylibre.com>, Abel Vesa
 <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <20260122200514.3cdb6fb6@wsk>
In-Reply-To: <4a593537-e848-4ed2-b6c9-fd2e6b165f73@lunn.ch>
References: <20260122130649.4150338-1-lukma@nabladev.com>
	<4a593537-e848-4ed2-b6c9-fd2e6b165f73@lunn.ch>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Andrew,

> On Thu, Jan 22, 2026 at 02:06:49PM +0100, Lukasz Majewski wrote:
> > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > operation it is required to enable ESW and MAC table lookup
> > clocks.
> > 
> > The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> > to provide clocks for each AIPS1-"slot", which size is 0x1000
> > (hence four separate entries).
> > 
> > Those can be enabled via clock gating CCM_CCGR10 register
> > (0x4006_B068).  
> 
> Sorry, i lost track of the state of the switch driver.

New year, new MTIP L2 switch patches in preparation :-)

> Is there also a
> patch to add consumers of these clocks?

In short - this patch set is a preparatory one for vf610 SoC support of
the MTIP L2 switch.

Those changes describe more thoroughly the clock subsystem of this SoC.

> 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>  
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew

-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
