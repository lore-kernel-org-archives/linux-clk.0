Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125751;
	b=gK6BYjC4yr7PpRjIWJazhoDR8/aWmFZEe/0zoPHJzlq+GFhpFG2QAmdyhoZOwoHf3VY0
	 99Wza6gpHCfi2DumMHt0Xtm7syzkXsHBfgGiSMGdcRRpnnhwxc4ywpH9ytiZ2tdTRdE5u
	 Z9fXUdGD6c0kusIR/2uyYNtodC91oDtURHC/HP4ZPCOpEKVTzecWlTeobecWDQn1Go1gi
	 2pU/CCblGvQWt88KFYjR59G10Mt4ogveFJbExWDewnj4bSrKavAgi9pem8j5O/wOKxwc9
	 GV+7HYmxs/X4Q2bs5FyaR9MWM9ouenpU83Yolr2B0L5jEE6TCa2e0WUbR8zYprl/Zrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125751;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DGfBV41hyrj/R7oh4W4UjVZ/ziD0kcYY8j84a4AjooI=;
	b=y6BX1lQuWLpsVxdVWlHA/R5DtjKU8AtQTkfosOQwBU4d7qCDr0lhK7nzjF4I5sIznXB5
	 GKxzud1xPIpgC3R19x6pZtBqNZ0RsCi9/KZQvuqRfu6DXsRKK8UlreDDByduJpe2OLWuh
	 8h+K7ljF9PZzrrbWFUYn5OuaU0N69yiM7zhxMgTQbJWTxQqnzMMIuJ2GCXIar3PO0WeTK
	 zW7ui6YRLEsEhWWtVKA2EVCdimfsJ4SDBHmDA3Eb1fP1eN3t/braXWRiZRxclhmlRrTTg
	 R+GrO/ks4IAgfxGjub19fuRN63RtHcTMfnKYo3TuUt1kNpn7feZalTayx7k/pidhpaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j22wZqfF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC35606A320;
	Thu, 19 Nov 2026 22:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j22wZqfF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322361F000C6;
	Thu, 19 Nov 2026 22:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125751;
	bh=DGfBV41hyrj/R7oh4W4UjVZ/ziD0kcYY8j84a4AjooI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j22wZqfFwgrUgMo0tyKDaKgQILbDB2Lt8QTaAURL4RiYF7xy6CTPHYS06bZ3pXQMb
	 LF9ulO2LjxNAkY2gTx5MgAQXiqaJBg/66wdHnx5HjkJWYKQNS2TjVO5G/A99DVM4sF
	 eKTBT/I5AmW8u9UpnYPdhcEfM4aixtfbp3qxb2AM4ReBEKZk1LD+VIRIs41k6PWeXa
	 c5AGYAKotxzmuovgBuhYwRzImp7/T7afTCppkAGJtK20oWZZvY1a5fQmj3O/kel7p5
	 RkJt8sx/T66VjnD702b//MCgoPtK+bTH7gZqG0UO/pRJ89QQwO4++h3gNZSv1abLti
	 H+nqwKCZ2Sgtw==
Date: Thu, 19 Nov 2026 14:02:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kyle Hendry via B4 Relay
 <devnull+khendry.reliablecontrols.com@kernel.org>
Cc: khendry@reliablecontrols.com, Geert Uytterhoeven
 <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: renesas: r9a06g032: Add reset controller to
 clear resets for mii converter
Message-ID: <20261119140229.56a553e0@kernel.org>
In-Reply-To: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 09:57:42 -0800 Kyle Hendry via B4 Relay wrote:
> On the rzn1, there are two resets for the mii converter in the system
> controller. If they are not cleared by the bootloader then the kernel needs
> to do it. 

You need to split this up by subsystem, the series as posted doesn't
seem to build for us. Please send patches 4 and 5 as a separate mini
series and tag it for net-next. Please wait until tomorrow (24h 
from this posting) per netdev subsystem guide.

Thanks!
