Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387422;
	b=L09q/eck07Tl9tLFGe0KCw765HnbZhdWTEMy7+3EAV6FcaUCZgpaNNMpdtp1qAv9zRzR
	 Zvbi13hM1fdVk+yP4hZ3i4AQe13MvBc5aeSsJ/tQENZ99I+i1mRO1MwDN0Ul0/Foa2fJ5
	 yq3WuXtgRzp68gqKoIKIGMw9OwwRxqCwJlITr6ijAZ9DarrMgWmLnuBBwD5En07FVWQDL
	 t3j45nxj5ODlGJaNAVKjWjH83WX7TaSJ3X3Utaz1CUS0X92YF9vOaqRReLiaqc7mVbl/R
	 zcSYeeXQ19qB+yFTnfqiqlCBRPq7MmOv43toNvuomypXfE4r/2HQIQqL18IXPf/yhVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387422;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=f5imCSvfVufjTQmUQDWHMuqGq0enH46HdJv+KH2gXwk=;
	b=zVZkPtqUaG4/48h1a+1bdq0ep7jWnWb18XdO7vtcXps3aQwxTZwXDkP3EIf+1CdYaRjy
	 5pyGliSD6JHY95Wv2NxkkTsQjat3Y7pHcbaYqXMdrg6ZjE6121OOgE7Zv/zzTJZBZua8Q
	 8Sig2Wz38KjcDyU5OeItm+j4njxc5VAgmK3WbJv+Rj1kKd785DqH/CMRNpNNjS+n8pNHO
	 nomt8MvKzfJ01T87Wa+JFtJZv+zW1BsNeNAXuJSvbADThTRGg8UaF1yDfEz6pcXQQf8V3
	 d9nSskSrDHedgXOLre7RigekUt8FGN8QfqbMMudNAmB+3lSGQadNB4tmr06HI+uoqNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CAE60A260A;
	Wed, 11 Nov 2026 08:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CAE60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1401:33fc:b262:f9a8:847e:6650] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xR48R-001TSi-15;
	Wed, 11 Nov 2026 09:56:51 +0100
From: John Crispin <john@phrozen.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
	zhengping.zhang@airoha.com
Subject: [PATCH 1/2] clk: en7523: do not sleep in the EN7581 PCIe clock disable
Date: Wed, 11 Nov 2026 09:56:49 +0100
Message-Id: <20261111085650.632025-2-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111085650.632025-1-john@phrozen.org>
References: <20261111085650.632025-1-john@phrozen.org>
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
-- 
2.34.1

