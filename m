Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381803033F7;
	Sat, 19 Sep 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818481; cv=none; b=LntViNI+ufqZ/++8DK8tGrcJlW9lcVrx7Uwxhyg1dxN4ZmxJEA3a5ZIt4O5lhdFLNBdYjMEoImIoktiG6O2I4ichLeCxv2ntt3KKTfjYe8+JRfbe4gyFO7f9GLmIYhxIPGNAdmKcfMO8xVOD8uQ04MHIFouCK9s5Yi/9bc4QWHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818481; c=relaxed/simple;
	bh=HicOuPCjYciEzFwYmDXJJKgo5gpc86Lafh62/v4a3io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQ/iQIfifk3Uv0sf/+e58RlVRat/ZH4o+ZjgCkd6TykARu8J4+rTJQBOq5ui0J7EhOZXxnzcGZTf2YEn2sb3+e/fu5+mir/B+FeFV2dHCAhRXxhhMAAN8+c9t01sqNofktgfe+5zkbn1ujFMmSycEZH2Bw/3Y29XvI+LR0H72lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=nEfVRZBu; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="nEfVRZBu"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 94750100C49;
	Sat, 19 Sep 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789818476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHmouoyIZkq8xO+cvrVpMSbHmcIS9SGIHL64C19km20=;
	b=nEfVRZBuUtFSO+b/bhxezBhBqCkkHanYU9s5wbvRgB23y78aiKNzatuW9pZ1bXS2eYOVra
	AneI4AKCJRItokI0pYxeGoUxo2v6bLtjK7EV9x1AczZxdJwmVqqAc+a1E8zDliwqYW0vOQ
	W4ldRpeV+kEE3F9WgjbGJB6Q4G7L6hc=
Received: from frank-G5-5590 (fttx-pool-194.15.85.231.bambit.de [194.15.85.231])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 542B81200CB;
	Sat, 19 Sep 2026 11:47:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Frank Wunderlich" <frank.wunderlich@linux.dev>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Mihai Ordean <research@mihaiordean.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] clk: mediatek: mt7988: keep combo-lane U3 PHY ref clock enabled
Date: Sat, 19 Sep 2026 13:47:40 +0200
Message-ID: <20260919114744.46777-2-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919114744.46777-1-linux@fw-web.de>
References: <20260919114744.46777-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mihai Ordean <research@mihaiordean.com>

CLK_INFRA_USB_PIPE is the reference clock of xphyu3port0, the U3/PCIe
combo serdes. On MT7988 that lane is shared between ssusb0's SuperSpeed
side and pcie2, but only the consumer that claims the PHY holds the gate.

On the BPI-R4 Pro, ssusb0 is configured USB2-only (u3p-dis-msk=1) and
pcie2 claims the lane for the CN13/CN15 M.2 slot, so pcie2 is the sole
holder. u3p-dis-msk does not remove ssusb0's SuperSpeed root hub: that is
decided by xhci_has_one_roothub(), which keys off usb3_rhub.num_ports
from the xHCI capability registers, so bus 2 is registered and live
regardless. When the M.2 slot is empty, pcie2 fails link training (-110)
and its error path calls phy_power_off()/phy_exit(), which gates this
clock - and sspxtp_sel with it, as nothing else consumes it. The still
registered SuperSpeed root hub is then left polling a serdes whose PHY
reference clock has just stopped, and asserts the shared SSUSB interrupt
outside the xHCI event ring; xhci_irq() reads USBSTS with EINT clear and
returns IRQ_NONE, so the core disables the line ("nobody cared") and the
next USB teardown blocks forever in xhci_disable_slot().

Boot logs show the storm threshold being crossed 86-107 ms after the
pcie2 probe failure, while the earlier combo-mux switch to PCIe mode
(~550 ms before) causes no trouble, pointing at the clock gating rather
than the mux as the trigger.

Mark the gate CLK_IS_CRITICAL so the combo lane keeps its reference clock.
Only port 0's gate is affected; ssusb1 uses CLK_INFRA_USB_PIPE_CK_P1.

Signed-off-by: Mihai Ordean <research@mihaiordean.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index 13ffa9d88e24..a8cbcb64d90f 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -225,7 +225,17 @@ static const struct mtk_gate infra_clks[] = {
 			  CLK_IS_CRITICAL),
 	GATE_INFRA3_FLAGS(CLK_INFRA_USB_FRMCNT_CK_P1, "infra_usb_frmcnt_ck_p1", "usb_frmcnt_p1_sel",
 			  9, CLK_IS_CRITICAL),
-	GATE_INFRA3(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10),
+	/*
+	 * Reference clock of the U3/PCIe combo serdes (xphyu3port0). The lane
+	 * is shared between ssusb0 and pcie2, but only the PHY consumer that
+	 * claims it holds this gate. On boards where pcie2 owns the lane, a
+	 * failed pcie2 probe (e.g. empty M.2 slot) calls phy_exit() and gates
+	 * this clock while ssusb0 still has a live SuperSpeed root hub on the
+	 * same PHY, which wedges the shared SSUSB interrupt. CCF cannot model
+	 * the cross-IP sharing, so keep the gate on.
+	 */
+	GATE_INFRA3_FLAGS(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10,
+			  CLK_IS_CRITICAL),
 	GATE_INFRA3(CLK_INFRA_USB_PIPE_CK_P1, "infra_usb_pipe_ck_p1", "usb_phy_sel", 11),
 	GATE_INFRA3(CLK_INFRA_USB_UTMI, "infra_usb_utmi", "top_xtal", 12),
 	GATE_INFRA3(CLK_INFRA_USB_UTMI_CK_P1, "infra_usb_utmi_ck_p1", "top_xtal", 13),
-- 
2.53.0

