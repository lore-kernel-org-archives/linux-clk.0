Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509626;
	b=xYnRgOqJV0oyYPFasjdTAddAl7wGSFS9QL5dc3wt8a+EKrLlgf/MPBvLyg9v+pJNEo03
	 KGYjzIcAYb7EzY5U3R9jRHlrhIxK2hiHQCTq17Jq+JXD+CxLw3xMGlPasJmlpNqqMvdm1
	 yWgx3xJHVbnSNTGuq9TdznYhUSW5L+vZC060sVEfqMfZ9U37GZFzOxWWSL8qTv3K2+qJt
	 Cea1M33oLKJWf5YEk7hYLYwyP4eDTRz6O3D/QiTBaUlKjtoMbvEztpIHC/K7mL0vrQcG+
	 yEH6ZCDcgyU+jFo/7U7c1Wf5TmOlEv/xBPUQO5Y+sv8Q+Xo8xB0BuggkahlNjrCD/Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509626;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJP11knfFTych7gxv27ORi0+MRq0AXKYglL5rvoVToA=;
	b=1HoYa/0kX/Lvj+A2CiEinnPy4F003HspRKI0dbyWn8t8u2oiZkATSw56X0yr85TD6klL
	 3vLeKq/Zh1u6zI/h8tscBm+qI7WnSm8RsD1if73GzJtYtoY8YuLrpAne5TQE4PwkZSLtu
	 GUUU1xJNFM17yxnzotU7DWCb/ypsfSsHxyYMam4FoUhWHASbXUx/4ncWuhjH9/qgnWe8C
	 jj0oXmV7rzr+wO1qe4ZaKG2kSLtSP+Uz7JCJxmbfGdy19HcKqv4FnSEnQlE7T33B02WtR
	 e8ksAHCuzcjC9g4U5XLPpgRii/keMT5Dm+EPbBCmqcHgd+seysOFqO0GnNPMXqRifLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1DD606A335;
	Thu, 12 Nov 2026 18:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1DD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRZvU-002XVt-1n;
	Thu, 12 Nov 2026 19:53:36 +0100
From: John Crispin <john@phrozen.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] clk: en7523: do not sleep in the EN7581 PCIe clock disable
Date: Thu, 12 Nov 2026 19:53:29 +0100
Message-Id: <20261112185329.1314427-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

en7581_pci_disable() is the .disable callback of the PCIe clock gate.
The clock core calls .disable with the enable spinlock held and
interrupts off, but the callback sleeps with usleep_range(). Every boot
where no consumer holds the clock reports "BUG: scheduling while atomic"
from clk_disable_unused(), and so does the unwind of a PCIe probe that
finds no link.

Drop the sleep. Commit 90d4e466c9ea ("PCI: mediatek-gen3: Move reset
delay in mtk_pcie_en7581_power_up()") already moved the wait of the
enable side into the PCIe driver, and nothing depends on a wait after
the disable.

Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v2:
- Drop "clk: en7523: add a reset operation". i2c-mt7621 now asserts
  and deasserts the reset line instead (Philipp).
- Link to v1: https://lore.kernel.org/r/20261111085650.632025-1-john@phrozen.org

 drivers/clk/clk-en7523.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..8f63482cbb7b 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -689,7 +689,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
-	usleep_range(1000, 2000);
 }
 
 static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1

