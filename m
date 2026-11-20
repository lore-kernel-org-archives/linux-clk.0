Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175379;
	b=lOBvlb2OJ6nzILov/yKvHyZCxCgnxgCing5QS4pKeDvc7MnEseWzmmkP72aeD+zcxTJk
	 tyvyNIwSKs0sKxZkOfxBTYnt/NkvQ60Rq3SACO+fvp2j3LomLal/UPtdkWM0JSf1U9Vr/
	 nkjqYdXH2cg3mfM2YVBJlcC182vSJtfP1bH8rf2RWRT+o4+xxfCRsL6P9rTc0IhUbcLHW
	 t1NQZWHt2TEeOGcYHRc7278KQjjM6UwIxYzTVijZRttQbW+RNdugSQHvSBgqYH3gM/OQs
	 /BjxFgNmPr1O4GpnhQ3I3tVV4I/ppjUbwtuQY6WvJEtWhXMZ7RIG7gs3Gzh3acLGw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175379;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KhB5LY2U3ADsZjGR79e5pFUt3iqHrkKb0g96FBQARhI=;
	b=2GG3y2paPsOqRYpbx5YuGk4JR1bPEvczwrOKsbBsemtwO5y6MD8DR0ZA15TcGfkmbQL4
	 HLBGSEdCBWcDcMt8JlnLmAlYVhgUs7EJOr88+avBUaLzYo9wZ9lBf0V7QT4XjlrinPaRP
	 306AzZEIoW07HgR+TyC4HuEXNCgmwwfv80GNk8FKQ4hzeGOFLK894xuwu1pJZpdRgR3Jb
	 fYjzWB8ROz5UuXdR4rIGsClkDnLkdP+Gd7RCepSUR/wYH8IwFbrR1Bs5/oOJJ7unaukAB
	 zoLFIV8ogdSq4Mb1g9aBUrSZdfKylOPNDV+zjic2nVCAq8guvxl1rIfbRyvUSSl/svw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=SLyHbDmf;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E5606A326
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 11:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=SLyHbDmf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KhB5
	LY2U3ADsZjGR79e5pFUt3iqHrkKb0g96FBQARhI=; b=SLyHbDmfHuoVsC60d6n9
	XfbnExBjnWeXW6GWJvUpM3DOhf4/eHZktcfpbxBTY+7pZh8ZCxLfl1fzwMSEX4Ex
	z0ELcPgPv/Z6ekDJ6izOHok4Qsj9fIQPbNUqypvD7cKiMtoEImlSOwcHoBILBZXl
	eRb1SzYaGv+5KOOYUuWuj9sKKHlCIaQFmUGKQq0qspGnK+E90f6B6gRuX1glgzu9
	jM0mQ2sWk7T+E3HpAscs8sFjTwzRWxousb3VisoRbdIK478spdA29PW2Xqu05NYI
	pNuUbedAjDCf0Bhxo8avpw/diIhkHwoPg7NadEcBkJMzsOotSwfuRBhav+T38flQ
	KQ==
Received: (qmail 1461740 invoked from network); 20 Nov 2026 12:49:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 12:49:34 +0100
X-UD-Smtp-Session: l3s3148p1@WwCE1rNgOucujnuU
Date: Fri, 20 Nov 2026 12:49:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: net: pcs: renesas,rzn1-miic: Document
 rzn1 resets
Message-ID: <awAzzqHtBuM3wf9g@ninjato>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-4-feee2bb28bb4@reliablecontrols.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-rzn1-miic-resets-v1-4-feee2bb28bb4@reliablecontrols.com>

On Thu, Nov 19, 2026 at 09:57:46AM -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
> 
> On the rzn1, there are two resets for the miic. Add documentation for them.
> 
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

I will comment on the bindings over the weekend.

For further testing on real HW, I will wait for v2.

