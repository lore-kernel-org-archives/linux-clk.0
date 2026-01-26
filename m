Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82534B42B
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769447963; cv=none; b=IUqcswsaGal5l6RB88mcxngfAN6BGOlAGlKKoZBwdB7chQW8+qcwnzCFHfigmJhybKhbW5B+7AbaZGz1EoKYltQwy19CtFKlgepCe8voFheRAQmcvqwN6x480lJQHDwkfsUw1WnhElGrGzdcvlsIOquaDKAe7Mj4Okse+r0M7gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769447963; c=relaxed/simple;
	bh=x0RvoBMAUnwM/VXsmTioUskHKOz1AVN+dR13eiUuiAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U9Yh3LIb5ZeFxbct4f0CuRaxJIVVMaaOTkmaz809YuVevNE/QFb7vBZ5U+AqwMfUDdZJoSjP4c5Wkwg6znDv2zvfGtkePiJY5NCfGzWITuBQxDIkfU9+mxa75tw2KMjXmnELaW1w5xcAZlOyF9EEZ835I77OnO3cO6IG3jTQ3s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RRg2jnm3; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RRg2jnm3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=koghH/SniiQSDSU30WJkK9pvALB/u5D7ZgRPTcePyXQ=; b=RRg2jnm3qQB3aMasEsRDk7yfnW
	xUKv4mLw0TbQ8lKMqdQhG2Pu/Tl1m79oy41ILTvvTijOfuGLM4iTQeRd7jcwOGaaN15dlNJl6Ts7w
	H6U7lNRgXA+KoTpQoc5ugW2iMsrggDQEN7fF521Mhs8m/RRQsM0NYv+b2jeXGtjEZ+/GkoSha5xgT
	IZTuE9K/Kqc5S/0l8PD3s0FNB6V6LlqjtJ1V7DDPAJBx/fUNw4qoywxS65D6J98+3D96UOo+RV32k
	i+7aFDsQPOqnMpqjbsNgf5Wi20g1jcAhRrzrON+I20XIanbp8lYIABi6+YZLTaLTbwSg4yWbV4A1b
	N6WaD64g==;
Received: from i53875a0f.versanet.de ([83.135.90.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vkQFA-004eYX-MK; Mon, 26 Jan 2026 18:19:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.20 #1
Date: Mon, 26 Jan 2026 18:19:16 +0100
Message-ID: <5742396.ejJDZkT8p0@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

please find below a pull-request with a Rockchip clock change for 6.20

Please pull.

Thanks
Heiko


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.20-rockchip-clk-1

for you to fetch changes up to a8d722f03923b1c6166d39482c6df8f017e185d9:

  clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link() (2026-01-09 21:16:20 +0100)

----------------------------------------------------------------
Additional check for an error pointer and not only for NULL when a
gatelink is added.

----------------------------------------------------------------
Miaoqian Lin (1):
      clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()

 drivers/clk/rockchip/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



