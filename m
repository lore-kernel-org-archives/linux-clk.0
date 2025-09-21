Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A66619F464
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490360; cv=none; b=BU0t0aMzirm9OApSYbES1L8lb+64GcDxx9fDpCwybv3gZ7Q03shEUVQ8ZUDBOyP1o2smYYG0kd2SCSdUxqz9TSvERyY/zazYYTCXbxvJ8arMgM9PJt1VFXE6tVEPqO/yfhztccFCEMNa81r/BSmZTrLT/plgVkrpUuXTLjadr78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490360; c=relaxed/simple;
	bh=O++oY2BSNOj5hNiizZ0zusXuzx8WauST8XSCRb5f4C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ASWjaCNubAnz2P/0Ryhm1nCRHt8FQxOACr/+nI4ldhXn9w0pYbcpS0OogcfAiX/sSFURSbLP+B7SYRXBFCfrPJ0NVUk3kOkCkW34t2vgJJSzKdElZ7xA12H1x1OW9i8kEqXO/DOevV6h2w1XifQZPhnGqRN0/78KWF74XlAzNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=frSDbpY4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="frSDbpY4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=huK5CpmxMXb5T6on4tR9EKj5JuGqYpWil2JrKF2Fx2A=; b=frSDbpY4vrmuUjIGC2pDcq0oTK
	5+lohheHj+xjTrPzZG3C8hXHMhouRCyqWG+xW/MVZF87K1daPf56OAZIiKcWVed7klzV15RVyM4ck
	dRk5zZxsMQnRflP9zLtU4FYRLdAsiG4sBEFGZtLib1PfILfWTsEnVpFJCIUuqJIjbHtVSVdVh6k/4
	IYJYbj7xbYTjpRgZZrZBGEQQ5YYOVk/8zKINzdy384zAEEkbzStPQyUs8GJFg+MiamxOwl6PiRtm2
	XBVaj6QI7jvKAgBpSQU04DmqdwRCuhoxoohr135l4/fndu394SsRq/K1R+vf8SlXW7G9LoCbGIqld
	EcEvJ6QQ==;
Received: from i53875add.versanet.de ([83.135.90.221] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v0R9o-0007cj-Vy; Sun, 21 Sep 2025 22:59:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.18 #1
Date: Sun, 21 Sep 2025 22:59:39 +0200
Message-ID: <1897877.QZUTf85G27@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

please find below a pull-request with Rockchip clock change for 6.18
Just a single newly exported clock for an older SoC.


Please pull.

Thanks
Heiko


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-clk1

for you to fetch changes up to 77111b2c22ef5b368da5c833175b6f7806b39ccb:

  clk: rockchip: rk3368: use clock ids for SCLK_MIPIDSI_24M (2025-09-03 14:17:54 +0200)

----------------------------------------------------------------
Export the dsi-24MHz clock on the RK3368, which seems to get some
attention to enable DSI support there.

----------------------------------------------------------------
WeiHao Li (2):
      dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
      clk: rockchip: rk3368: use clock ids for SCLK_MIPIDSI_24M

 drivers/clk/rockchip/clk-rk3368.c      | 2 +-
 include/dt-bindings/clock/rk3368-cru.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)



