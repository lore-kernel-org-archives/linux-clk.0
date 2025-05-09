Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4584DD53C
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772750; cv=none; b=PD8KdEQ9BjckO4hAAaogMx58nls2x+cRwy0wVigWvuJHiA/s4tnY7kWCnh0MuOIZQ0plU7aOlHelEhQWY6LlVSomSqSXkgqUjR4pT4bfLf3oDOV9DOUvPlP1xLOm3QVGPaNptJ14JXVSiVyyLGNG7IG053boX/crRIYd6ru5qg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772750; c=relaxed/simple;
	bh=clCX27/fIBn0JblGudpRe406eUIho5ef0nUbxHjkW50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNqkMalAmgtdWorH5KGRzclhQiDSZnPD6TdC+IU8CoZFUUG95yhjxo5KR4Ykpy3Y//t+Ld/2fGnJhuthKF6MQ/6b8xSPfHmzoNfLRlWIJPm+oKa70na6jPuydbAZXgNwaPPZk5P0VqSGoBpZAwsXuD2OmTNwKd6t0RGd3utIcuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uDHNu-00059m-Eq; Fri, 09 May 2025 08:39:02 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uDHNu-001qUP-03;
	Fri, 09 May 2025 08:39:02 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uDHNt-00CHz5-2t;
	Fri, 09 May 2025 08:39:01 +0200
Date: Fri, 9 May 2025 08:39:01 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v4 0/3] clk: add support for TI CDCE6214
Message-ID: <aB2jBapQ5NdSa6HR@pengutronix.de>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Wed, Apr 30, 2025 at 11:01:33AM +0200, Sascha Hauer wrote:
> The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
> Differential Outputs, Two Inputs, and Internal EEPROM.
> 
> This series adds a common clk framework driver for this chip along with
> the dt-bindings document and a small fix needed for the common clk
> framework.

As 95% of the comments I received for this series are about the binding
for the pin configuration and it's still not clear what the preferred
binding is, I'll drop the pin configuration for the next round to get
the driver upstream. The pin configuration can be done with the
integrated EEPROM, so the driver is still useful without it. It can be
added later when needed.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
