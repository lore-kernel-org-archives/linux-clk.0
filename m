Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD21B3B20;
	Fri, 30 Aug 2024 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725030809; cv=none; b=VgEa6L8NAcFw+9uSY3sbqXQlAn5PUH56zT0G1afBTZBuNIcDFEAU5zvbHxwA3SrLo5brwG05bTX3CKwh+UgrLqTqswSvtWZE5eFxKXcbolJVjobZPGyicicygXL++lLlQOhh6DNTthzWwtQ/QiWVD1jG3VVexcyjuF1QAAfbmKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725030809; c=relaxed/simple;
	bh=XN6UamdVy5YZ7poGi5VH5lYzP21Tv4XcrJEiiDjeTd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dddlgzzl1A60qwA0V4mo/lrlGnZUWs0G4pwpU3oKFDZoukVHa/djLGuKQmhTxJFS4wuan7EWVsHoBcXzTvCaOkwLzqXNFe00NHTFmFu5O00oVIJn4JmE1W3bcntd0lrGp2VHupkePnBBNXKYatAo2huv2mH0Cl5l8Z2Oit9vlnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=X79uT/JW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="X79uT/JW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mKoAUCPLIx2u8bDuKHDW2AwZSGh12y/DJxrGx1xVQAs=; b=X79uT/JWFVwscl4U2i8M02fhoP
	kD3xNG8y1qE0GGmzAvTBZepPRr8LTp2O8vaC5ebYelXYmImEXCSoDzhqyC3e1rcrUZVON8gVYMcYq
	OGajtNQ7E0qM1dJJxLWQSARZ528qEu/IupAKSC5d4lmEOhMrGZfhDxwYRhNAt45GWHyebuAcaXexC
	MQHwrlxWafQYd0Szhsuv9UNczv8ud539gs4rkBtfQ9pMcEi0uG8eHkvlg4ob+WllA2acKrvpPMZY2
	ZFbLh8L83boy2B+9urT+fIWN1hUYU4AXaFPlucJ66N8GdK+GQM5TpXtphWeC+IkO1WJgXpIqSpFDh
	EdYTC1ZQ==;
Received: from i5e861921.versanet.de ([94.134.25.33] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sk3JG-0004MP-Iy; Fri, 30 Aug 2024 17:13:10 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	huangtao@rock-chips.com,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Chad LeClair <leclair@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	kernel@collabora.com,
	Ilya K <me@0upti.me>
Subject: Re: (subset) [PATCH v9 0/7] rockchip: clk: add GATE_LINK support
Date: Fri, 30 Aug 2024 17:13:05 +0200
Message-ID: <172503062006.1956268.2661371879547817382.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325193609.237182-1-sebastian.reichel@collabora.com>
References: <20240325193609.237182-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 25 Mar 2024 20:33:31 +0100, Sebastian Reichel wrote:
> This implements proper GATE_LINK support following the suggestion from Stephen
> Boyd to use clk PM operations by creating MFD dynamically. This required some
> restructuring, since CLK_OF_DECLARE() is called before devices are available.
> 
> Apart from improved power consumption, this fixes the runtime errors from the
> pmdomain driver (failed to set idle on domain '%s').
> 
> [...]

Applied, thanks!

[1/7] clk: rockchip: rk3588: drop unused code
      commit: 2e7b3daa8cb1ebd17e6a7f417ef5e6553203035c

@Detlev: I think the rk3576 driver I added days ago, might also want
that change? Can you take a look please?
[I don't have rk3576 hardware, so can't check myself ;-) ]


[5/7] clk: rockchip: fix error for unknown clocks
      commit: 12fd64babaca4dc09d072f63eda76ba44119816a

I've added a fixes that to that, looks like overlooked that issue
way back in 2014 ... pure nostalgia.


Anyway, rest of the series hopefully later today.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
