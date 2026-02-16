Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EB23EA92;
	Mon, 16 Feb 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233355; cv=none; b=dehiSNGVl1D/v06HgrsmMvz78Lxpp5QlZWXLTK2tM/ZDFlU1GBj1aRzjB416ZPjMWLtLCR93sl8Z0qJ9TymhSn6DJ14I3x2VVLVj5ODErgN01RfelF4xr1zXtsTFCwg9icBG6Qqr5eeVuXdj/nHyJGEcbZ4tqUe6gKdLBvQKtjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233355; c=relaxed/simple;
	bh=ED2YUrgR3fUpKS5N5MTTY/5C1z/L+l27tJt652Ptmzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IfFSnlHe9IPLJyRLmlWjtDCNAcx74fuuIuXTGyFfNru/e6Nt1RGzIE09m9RQN8IP8lAyIEn5EkotbDXFZHLQXS4EiyD1Nt/5HbgBjLCFJ+4ZEe9M3Ww3Wu9Qz5Grsuh6gG1B/s6oRhSZYNE0EmoD8Bqxm087ONgxh+ZAm0YhxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=RtTkEGuj; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="RtTkEGuj"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A803710F92A;
	Mon, 16 Feb 2026 10:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1771233345;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g4AIIiBe36X2z3LOIRK+Vwb+RbLMX+Bv8FiLhmH2gBE=;
	b=RtTkEGuj30T2QAkNRjGj9G7748vaxxo69xLc4S1ERGfxnReWhdk3K/DBX0dgR/+5IFfD3a
	iqW5q4osY0GiMk4/4oEtRxqZxRiBz2E1Ew0BhD1DOl8rACqCPwFuX/IGWlX1Cz2/7eVZ0K
	psliEc0uS3aS5ROgcy6F/3IFUKutW+2aZKhBLVPKKavsrPApDIg3XHVQIoSAfGOHBCOgGR
	hTeSM1qT5AaaH+fYQJMKuLWNplROtfFtNa1vBTPrTpZeWUpM3HHB65xwYtk49KS3pcKlZ7
	QmVrGy954drflHE+A3j5cNlZy5phFEJPlKgdGZEMaMMgQLKFuo00keSYRa3Yuw==
Date: Mon, 16 Feb 2026 10:15:38 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Peng Fan <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Message-ID: <20260216101538.0aeae484@wsk>
In-Reply-To: <aYAEM8pcuumly+hc@shlinux89>
References: <20260129095442.1646748-1-lukma@nabladev.com>
	<aYAEM8pcuumly+hc@shlinux89>
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

Dear all,

> On Thu, Jan 29, 2026 at 10:54:38AM +0100, Lukasz Majewski wrote:
> >This patch series:
> >- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
> >  to driver code
> >- introduces support for several clocks required by MTIP switch IP
> >block
> >
> >Lukasz Majewski (4):
> >  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
> >  dt-bindings: clock: vf610: Drop VF610_CLK_END define
> >  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
> >  clk: vf610: Add support for the Ethernet switch clocks  
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Gentle ping regarding this patch set...

-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
