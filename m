Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677181;
	b=Ck3v8X/Ggp7OKLqxhRMOKAdIzusILXN3HNXzde1FWLlVJUEFqJC30+fxs3QxKN+t4kXZ
	 gQQxn0NhBQeZghhNQ2eMZe7xsL4S/ynfSfBvfluhrz8ZLzKb35Z/VUQB/yYIa15xtZbxS
	 r2Al1vLjo4Iaw8Z4dNY161Qq0Hg0FPMBJVhgH1xT3Rner0x7S+slrLHSNOhQSW1wRYG8O
	 VR/5UZyv+UZc8FXslZxjOkXWMh7zYvDfW0DIeqPujtIn6j7XtaeYCb2KlIHp5dw8mf5pF
	 uOp6uaPR2IGZs34mDh2Qdh5tI3IF3vD53bhgW6JIWSy/eiDsv6Hpe5KAazveBXbAOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677181;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=K5j+hY/TpNb3TDZ4CDlJ7DrhpFGoRBJlazHC7f2+tvM=;
	b=vM01e9D8vmm6TMp1gutnHiFwaYvzWiWCx5oAzpa2ktZEIGPDtmT65Ht9mKBiAe2UEABz
	 woQ9Rrsn8zDbDQGnm9lhsO8RUHK5UbyiXptEvtPxLzF7utXQ8HlzLWF6C4q4ZKFZ2yy86
	 ReJZzE0Hk1PFETUTwDH9rp5cDpvckMCI50U+2rxzVJXlnlYx55t0EgUVDUxltC/N5ytFf
	 5ip87Hr3za0ha8ob97JAYXybB83hPuXyFnbE1i190gs+MlyTIsMSuv+noTQe3aidwaiCa
	 Qk+kNx+SWk2CcThh8QXMrVCOP1uPsznjSos2NRnMkYhF/S+TU8cqQ9ahJGV2F/I6OVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S+Gw97xI;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE078606A31E
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 07:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE078606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S+Gw97xI
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id ABBF5403EF;
	Thu, 26 Nov 2026 18:12:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795677171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K5j+hY/TpNb3TDZ4CDlJ7DrhpFGoRBJlazHC7f2+tvM=;
	b=S+Gw97xIOtAkRieQQs+SOn+HpjNXnlZbOYRP5t3zwnganqxBG9AmklkK9fPBfYfgGF/JpT
	946886chveBS0Dd6+fwGs+lLIlUkDfeGK5qjyfOo5lJLKJFDsZJNQAvf0bOERUr15+T/Ly
	MnbWZKRQFVR0X3f7sIMsVUppIAiU+t7HH7VUiIEOvw15UKXVOyhcvg82QPe8B5zKkxGWwa
	tpmsmVsKMMAfbpxmTkRKYyzAhPTqq+kcxlhEWh+5lNqfxqwPkPJLAIHVS5h59WFPM8Cs3E
	e/xQLW+PPxckrv/wRSag6b0sMAGzRh5FlBSMDgv54ou1jbEsFyd1kyRz8PA5vg==
X-GPT-Reason: legitimate. This is a technical software patch (Linux
	kernel style) sent from alastair@d-silva.org, which is a recognized
	personal address in the context. The content is a specific code
	diff regarding hardware clock gating (sunxi-ng: a733) and includes
	a valid "Fixes" reference, "Signed-off-by" line, and standard development
	headers. There are no phishing indicators, no suspicious links,
	and the content perfectly aligns with technical development rather
	than unsolicited marketing or scams.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH] clk: sunxi-ng: a733: Mark msi-lite0 clocks as critical
Date: Thu, 26 Nov 2026 18:12:51 +1100
Message-ID: <20261126071251.2671198-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
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

The ahb-msi-lite0 and mbus-msi-lite0 clocks gate the shared MSI-Lite0
bus fabric used by GMAC0 and other peripherals. The bus-msi-lite0 clock
only gates the register configuration interface. Until a bus or
interconnect driver models MSI-Lite0 consumers, referencing these shared
clocks only in GMAC0 does not reflect the shared fabric. Without
CLK_IS_CRITICAL, clk_disable_unused() gates them off and breaks GMAC0
link-up and DMA.

Mark ahb-msi-lite0 and mbus-msi-lite0 as CLK_IS_CRITICAL, matching
ahb-cpus and mbus-store in this driver.

Fixes: ed757071ac3d ("clk: sunxi-ng: a733: Add bus clock gates")
Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index 958a2a2bcf76..74759dc6b292 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -567,8 +567,9 @@ static SUNXI_CCU_GATE_HWS(ahb_serdes_clk, "ahb-serdes", ahb_hws,
 			  0x5c0, BIT(8), 0);
 static SUNXI_CCU_GATE_HWS(ahb_usb_sys_clk, "ahb-usb-sys", ahb_hws,
 			  0x5c0, BIT(9), 0);
+/* Keep enabled for the shared MSI-Lite0 AHB bus fabric. */
 static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
-			  0x5c0, BIT(16), 0);
+			  0x5c0, BIT(16), CLK_IS_CRITICAL);
 
 /* This gate controls access to the storage controller MMIO registers. */
 static SUNXI_CCU_GATE_HWS(ahb_store_clk, "ahb-store", ahb_hws,
@@ -597,8 +598,9 @@ static SUNXI_CCU_GATE_HWS(mbus_vid_in_clk, "mbus-vid-in", mbus_hws,
 			  0x5e0, BIT(24), 0);
 static SUNXI_CCU_GATE_HWS(mbus_serdes_clk, "mbus-serdes", mbus_hws,
 			  0x5e0, BIT(28), 0);
+/* Keep enabled for the shared MSI-Lite0 MBUS DMA paths. */
 static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hws,
-			  0x5e0, BIT(29), 0);
+			  0x5e0, BIT(29), CLK_IS_CRITICAL);
 
 /* Keep enabled for the storage controller DMA paths. */
 static SUNXI_CCU_GATE_HWS(mbus_store_clk, "mbus-store", mbus_hws,
-- 
2.53.0

