Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD738CFE5
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030344; cv=none; b=CAxqyHobLFaNRPjmjX/2eL600k3HVk1UlAaldv6GEvherpOQsPK6gsrtoNuEjdChBltcuIDYVe0S1FZ2PlpHaYxeHODxNMrOZw5Ml1oWxd6S9ehRoWSN+okMCUXfOyafKahc7vgacgfrio+BJ1tbOrPnhp/ccwB1PoevL9F2tBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030344; c=relaxed/simple;
	bh=eCjKiSsxMp3e7aAVuQZl2wQDtfBKEbKNnbzvbF592Vo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjnC1QCfI/DWLtveVg4xd+v3TEtsLu4hv7hRb5sUelGW0ajwJL7JsfdmTEri9q7yI1V1i3hUFcik2B1Mw8Jg0QlF8tkeQIHxV8RIsiQM9gLX0MVljRCzJZ4SoGtMQIBQfm4gK1i9xph+QkKxuYInMRc5xG5uBtHSAjbxEN9qwm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvjI1uJv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvjI1uJv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso30776105e9.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030340; x=1784635140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=mvjI1uJvlDqzyAB6vONyr0hgVo5xPCln18h7LbF26cqg1tRMP5eLg4o+gQcp2vLaR4
         1XqLmMidej9aJqE+j2MSh1CCy/k0hcskkLyFYldVVq+YuK8xsk58pbyDUOchcpyU5Uuj
         KHhHawYEUaW4u7Wz6QsD9muGxAsOtf+ebu/9hzMHpHEgXfyjjxHXcGDKFtVgye0PKz+4
         5nfvyCgzMJC9d9DNtwG9uoql/kcYFVm7ZwnjD6V8oEItw3P2yxLhN0dLEFQG0fXRquP5
         uaiYsLMGsVqq5Fb6kdt8MsFAN++PDKMmcbcZZnTnuaso5re1y3Jti1tRR96s/hf/1sn1
         RFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030340; x=1784635140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=s1KM6tyzB6UIzc+YKZ/cjhhe1vk5uREfc5FeK/ZHlABvz4Sbi4PiIXZw4ALy/C5z9B
         XR798GaxLLMWl8Lp27MM2MC3vuu5bJkPUmzyA215xHLyL2PUxf9TTJojYVyI8Efyt81W
         HsRYSZ8vQJGkachcZPlntWZcgAV4MRrUJiEeGGikVNi8nHKwl0ib9hQT3iTIh/uCScrt
         MEPSv8OUzfOaIHOUfXqXktYF10eD026kibP9GCFnFjpjpCJ4FkBMHUauTqGPPLkU16yB
         X2pT8CVreUg+tpKpOrwsOHCH2SCNaErqodyzEbwAYQEE5MmySJL8uRnI0NGYD6uc671/
         13jw==
X-Forwarded-Encrypted: i=1; AHgh+Rr86wXlLTbCZDmqMAMITjWD11KUIn8EOLMRqnnRJ4TucZPTEtqjLG/vnWVBuNrHR+1I5Nu19qBA1yg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/ZZHsOSIlVEWeI/ppVUdAKhCof+e3KVD7U9fIeVi4WzvmqOz
	vD1qQIQdpV9ww7MjtPxN/s3UlfMg5kIb8abuhnRw3gcv5LLBMsB0ta+v
X-Gm-Gg: AfdE7cl73tCr4RvsjeE0x85loFCv4DcaRwy2LI3t3HqnIYd9NBRE7kxmwNcw8Tw7RXp
	8XGpI8r7FALs1sSnGiwxHlWElLhp/op2RkkdyfO8YDDvnlC+8G6KEN06ff6TbNcGafxAAPAQe4W
	GUOpycQrCDPGrlh3g8wAZPl6rAQbsCA5m518ERXV+ce1ofmPYDZHbZQGk9KlUCqlq3BHq4CyfjF
	oqe1PR9by9zL0F6OPeHIFjIGoGKl0wBBtm35SDE4pYqb3ae1TxDq05Uwdhk+ICGA0wUy1XPrj7Q
	WiZBFTITwzIf19ccdmwXslEcz3gcFl783Is+pAfxmW/ti336QGk/GVBC/7BNWt+EZl4wfi+q6AM
	+jG5XQ7VbYu4Itz4d+Wo7m6xY4MkbY+amx498yNTFXiV3yxD1xAk8+E7PT+mr3Ze9tLsip2NuqK
	vfN7c4VNgCu25xC2q/AmizFwQczK1H6ouXVYl49O4IPDhX2i4R61jSHVV5uOnj6cXuPmbV/TKpZ
	2pbjXDI
X-Received: by 2002:a05:600c:19d0:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-49518308220mr36197365e9.28.1784030339968;
        Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Tue, 14 Jul 2026 13:58:44 +0200
Message-ID: <20260714115848.8537-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714115848.8537-1-ansuelsmth@gmail.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for resetting the PCIe lines with the PERSTOUT reset. These
special reset are controlled by the PCIC register and are specific to each
of the 3 PCIe lines.

Notice that reset logic is inverted for these bit where 0 is assert and 1
deassert. This is intenrally handled in the reset function.

PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
reset handling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..c9b21d9bf2f3 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -338,6 +338,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
+	REG_NP_SCU_PCIC,
 };
 
 static const u16 en751221_rst_ofs[] = {
@@ -450,6 +451,11 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
 	[EN7581_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+
+	/* RST_PCIC */
+	[EN7581_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
+	[EN7581_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
+	[EN7581_PCIC_PERSTOUT2_RST]	= 2 * RST_NR_PER_BANK + 16,
 };
 
 static const u16 en751221_rst_map[] = {
@@ -635,9 +641,7 @@ static int en7581_pci_enable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
 
@@ -650,9 +654,7 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
 	usleep_range(1000, 2000);
@@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
 	u32 val;
 
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
+
 	val = readl(addr);
+	val &= ~BIT(id % RST_NR_PER_BANK);
 	if (assert)
-		val |= BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
 	else
-		val &= ~BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;
 	writel(val, addr);
 
 	return 0;
@@ -783,9 +792,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
+	u32 val;
+
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
 
-	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
+	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	return inverted ? !val : !!val;
 }
 
 static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
-- 
2.53.0

