Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A915258
	for <linux-clk@vger.kernel.org>; Sat,  4 May 2024 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714819899; cv=none; b=KpKveV5HMWzV35mcbfwrFSe/kOEHVE6Bvqp1BQk1qVYINb0stL1qUfrqpHxMrzq6La8JtgI/HVQrhD3bhlaKxLmKaRWASlvfKJmyrqDSuzxju9hcolF+1YXpQ+kDIfc+CxtA3l1BOIw3njeTpnwJZJSkq4yd2ZmCJZDRQK0mAGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714819899; c=relaxed/simple;
	bh=rBBfWfeMB9bwyhCLVWdWGravL55hqp9MkActYtocjTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MA6OrKJJrNyDHBNzQVGE3bh3FvthiKNA8i413OSZr/bMoHvorDQif778GapCJ4iHOpL1jtVGF3Ew3i+bsZa5dQkIUbJSnk8ri9rAZ+X/jUiU1BtYXyY9OtOWcy37zf86pLdXJVsfcbq/xQVvMYNjZVjqTU9bCwgs0cVY94SlTIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b5d.versanet.de ([83.135.91.93] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1s3CzN-0001m9-DI; Sat, 04 May 2024 12:51:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3568: Add PLL rate for 724 MHz
Date: Sat,  4 May 2024 12:51:31 +0200
Message-Id: <171481988028.3538483.628614246241628952.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503153329.3906030-1-l.stach@pengutronix.de>
References: <20240503153329.3906030-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 3 May 2024 17:33:29 +0200, Lucas Stach wrote:
> This rate allows to provide a low-jitter 72,4 MHz pixelclock
> for a custom eDP panel from the VPLL.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: rk3568: Add PLL rate for 724 MHz
      commit: f513991b69885025995dcb4ca75d2ee7261e1273

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
