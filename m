Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C618660F;
	Thu,  9 Jan 2025 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441738; cv=none; b=BL++L0K+Hconyj7ckK4PfO2Xg3OvFeqqKp1mP6yK+aRWMXOqXK4UslV3wrwcerP5mGY1XwJeP7ZEvKiS0tlrCcwaqrFot4mey7pSgtq1Lc3nUNIqUi0NJ5cVvBd72/RX62F/+2/DBVsXneTPNfvPF12T54X7vl33wYLrQsRK5ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441738; c=relaxed/simple;
	bh=xfuPYsIP7ARcv61k0VrhBSd0sGxchQBenRhlstbmgVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIlFntx2uiahqFtSt2zL81T1VVE+799KtqffwMMb2NFq8YCxaw0D8NNz+Hu3HmNkKSUjVPP+rHkqDZNZFi+qJG8l2b1HJ7Glf62rQvI3+FTbXEnQ1xGfamt6ZDghh0DSsY1z7LXgk9Txdu3dzlroxzXSEhOqudf542xMdotN1MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JW/9qBbB; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JW/9qBbB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MUlm511Gw6bfAKIjKAuptGEWtpuyyApd/0usSGPr4Ss=; b=JW/9qBbBthVjUXuTF2VIHsrJMY
	9I+98CZ+krOTVpX+WqGVAJuGPqnFGLQ2wv5CDmrSacSh5shptRVeHGuByG2nIx/hlAPtK/EPoR0PE
	O9P+M2O/Cfwh8wsHH+bP0WiZ8Fy+FSHew4QoUCh6Z/4drJcHh7veco9nM63E8WzvuCD1k8t58KpWb
	dBlPGeE7D97DQ/16ozDLzsikrO2pKakHYwxWOvS+h/Gc1hGuR4sT6vxAAvlMBqWtoSNwZ8s8VttA9
	CMmYDy5+Bt/jb2qGAfqnhGxFw0vNE9xW53ONJk21F3dSJzb/lSZRPCtbgRWtXsQkontwgaxENTQ62
	5PNOUGNg==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVvoh-0003hx-TU; Thu, 09 Jan 2025 17:55:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH] clk: rockchip: rk3588: make refclko25m_ethX critical
Date: Thu,  9 Jan 2025 17:55:17 +0100
Message-ID: <173644170631.2899934.14400201527459535334.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214224820.200665-1-heiko@sntech.de>
References: <20241214224820.200665-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 14 Dec 2024 23:48:19 +0100, Heiko Stuebner wrote:
> Ethernet phys normally need a 25MHz refclk input. On a lot of boards
> this is done with a dedicated 25MHz crystal. But the rk3588 CRU also
> provides a means for that via the refclko25m_ethX clock outputs that
> can be used for that function.
> 
> The mdio bus normally probes devices on the bus at runtime, by reading
> specific phy registers. This requires the phy to be running and thus
> also being supplied by its reference clock.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3588: make refclko25m_ethX critical
      commit: cd8b5366636bdff0449b789fb2d33abb20804255

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
