Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBD83DA7D5
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 21:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522670; cv=none; b=ntCzQH5XwY1rscqs5iIn+d8Gp3oaSNQH/faSa665YZ34IHkg3MQTKqTp3aBfyggfkGlHr0LHJtjFBSPdYifKx7DyMA3CeIw9iiljeWVUBuf047ftL+sZ8O4tAW95K62hozE64LhDlLMeSuS/87aJt07vQwhU/fPUW5y2yLz9T/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522670; c=relaxed/simple;
	bh=XbEL44VHlv8TWACKKmo/WmZ/Z6bp6O3jONtQr0PtWTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gV5bNZJL04ruUaYtGG55WC8W+iS2/qBKkVLIoFDyyHmlny8+3illDFiJgQKQqj6xr4yfu3CfRFI46Lv6w3KGyVRq1pK+2JqTOKrOjXqiEHWy6wqAXEZ4SbOvSf5XZlGePNAYg3+gDG0mYRI7DxAo5lhaL9Nro3z7fr6S/bb208w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=KLv4xqGH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="KLv4xqGH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=zuOjzE83S2w3miwJiK/G2SRQFoPd2jOOmbLhRNJa6Yg=; b=KLv4xqGHn/Rb59QQu7gjH/7r/N
	vOzVZz3GsMP8g3rfh44djegNWEANqKyi9gwZ060yBMGHn95argxyNIIb/Cpzfz9Hsb6VcbkiL9THf
	HnKKmUafK8GUfDWjVr7kUuAgazy33AICxLwtpkfJZt5wu5VIBmVAN/213ae87h7afDYgDzcKgeIki
	ADvdSvc39yFqLm6k5gQqlc+WWMf6pBloi1HXPqIy+XdidHRuGQ9+CuAhOhmGelQANLTCd93tO8CQ/
	ZjJXk88CEqNDWUl/ZNWqQG5iy7m2wJSSpvXaCpBUIbxu9CJU+5JHPVYCVh2nN1FOUxnkb05s6seD7
	iHz5mRrQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: rosenp@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: rockchip: don't COMPILE_TEST builds on M68K
Date: Wed,  3 Jun 2026 23:37:26 +0200
Message-ID: <20260603213726.1025094-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip clock drivers use hash-tables with enums as inputs.

M68K does interesting things in its __hash_32() implementation, casting
that u32 input to an u16 and therefore triggering warnings like:

   drivers/clk/rockchip/clk-rk3528.c: note: in included file (through include/linux/hash.h, include/linux/slab.h):
     arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (18720 becomes 8720)
     arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (1e8e8 becomes e8e8)

As M68K should never ever need Rockchip clock drivers, simply disable
compile-tests for M68K.

Fixes: 7edfb7fb58ee ("clk: rockchip: allow COMPILE_TEST builds")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index 85133498f013..8b49fe6f46fb 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -4,6 +4,7 @@
 config COMMON_CLK_ROCKCHIP
 	bool "Rockchip clock controller common support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on !M68K
 	default ARCH_ROCKCHIP
 	help
 	  Say y here to enable common clock controller for Rockchip platforms.
-- 
2.47.3

