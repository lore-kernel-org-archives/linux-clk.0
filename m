Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3223033DD;
	Wed, 28 Jan 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589140; cv=none; b=ZFJ1ExQnCtDEgvPmYt+TfdjpuN6hGd3DFgDThZnJTF+iRBhMqClXmtSa7TNMF1jK8N5raoFuxn20E9dm4LOLFh/ztOXGZx+LCeNHM3P6mr8cWo3Y+mdVJcW4SaDNd+Kh5AFHGVlxSZoqvpdZ+uOye+1/WC6D8QS9mXaqDWRQTyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589140; c=relaxed/simple;
	bh=TwcgvRU58TdPOWXR3lw048Ew/Euuixrvnw97E9nrmBc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UKOg5/KDBHU0gndBIeF1UhwAxTMiWgswReIsDQnNE5IY6vBvPwB4dWY/jgCJDadnz091XGWWcmG13lLv+A24+uyeSW3MMgz0p0ML7WkLI2LxzDXAVfVZXMNBd+iwI4oy4wdYM/aX28FfrLTxuD7+8YIdG2aATtaBvJyf2UbroX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=HVnfX9MW; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="HVnfX9MW"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44FDA109759;
	Wed, 28 Jan 2026 09:32:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769589136;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q3R30d+5fKmqKbAPWypPmQzkA4SsVPnLS8LHH+omZd8=;
	b=HVnfX9MW9g5NgVjIht5pFJzcmD9sGDIMGDHhxvBZS12lucHWLpph3c7P2bIexJZ6bvAnUK
	aVtXvA6V5cX8Eos4cqgh5Ru7SGAl/Pm6+Uj6THKrjD5UimXi4Y3Ls8ve8lS8nfgddDCceE
	qhmMlgCxs0N5SEtcqs/k/S35olcIjwr6XnFcUg8uWp4sl7gvag6gEUvnQ4yYG88t8FBs2E
	9JLUKSDOkg5WbmuMm33L6FF8SOx/unto9rk1BbCZGVq+ojkucGhJmONvnR/Tw1fy0bHUir
	dhDcG91qxmkc7cuaj1vu0665gWFh8P7I4TZvd8zEZ6oLIFFbMIRNLRsus3djSA==
Date: Wed, 28 Jan 2026 09:32:07 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Peng Fan <peng.fan@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] clk: vf610: Add support for the Ethernet switch
 clocks
Message-ID: <20260128093207.6b4c864b@wsk>
In-Reply-To: <PAXPR04MB845936115A4DA73A9042650C8890A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260127085150.3040586-1-lukma@nabladev.com>
	<PAXPR04MB845936115A4DA73A9042650C8890A@PAXPR04MB8459.eurprd04.prod.outlook.com>
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

Hi Peng,

> Hi Lukasz,
> 
> > Subject: [PATCH v3] clk: vf610: Add support for the Ethernet switch
> > clocks
> > 
> > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > operation it is required to enable ESW and MAC table lookup clocks.
> > 
> > The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> > to provide clocks for each AIPS1-"slot", which size is 0x1000 (hence
> > four separate entries).
> > 
> > Those can be enabled via clock gating CCM_CCGR10 register
> > (0x4006_B068).
> > 
> > This patch also adds VF610_CLK_ESW and
> > VF610_CLK_ESW_MAC_TAB{0123} macros definitions for L2 switch.
> > 
> > The VF610_CLK_END has been removed from dt-bindings, as its
> > number had to be increased when MTIP L2 switch clocks were added,
> > and defined locally in clk-vf610.c driver.
> > 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> > Changes for v2:
> > - Squash clock DT bindings to this single patch  
> 
> Sorry for not being clear in last comment, dt-binding
> update should be in a separate patch. So please
> separate into two patches in one patchset.
> 

Ok, so I will add dt-binding as a separate comment and as Andrew asked
I will add comment to vf610-clock.h about VF610_CLK_END being moved to
clock driver as a "local" definition.

> Thanks,
> Peng.
> 



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
