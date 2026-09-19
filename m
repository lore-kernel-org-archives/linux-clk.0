Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8907081A;
	Sat, 19 Sep 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818481; cv=none; b=JPvnxW/6TqAnllFluZinmvyxYfzleMy4orYePIw+BYRBYBxKl3UssZFblYs0vbj10msjP7v2tSUWR/fkfyql3asriUuEKSiKZ8S6B8oQLMwwcy98DBl5mn5wKy7o+3GL1dSs9wDHSV82A05aqv5A2DGQEme39Jq7DdQnow/kwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818481; c=relaxed/simple;
	bh=Z/TRizmrXg+Bsd2IumXmZ0uTgR+p8ZOhFd0fZ0FY6Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j307qxwvkOfq9XBoFozo4dezY1pq40aT0b3xwkGdMU2MVkYfIOs0pvrvw25h/z22xZ1+XbxOn0LreEcqt115Q/cfxr+YJkfTVyA9AGzMgV6InbpUVP+j3tVjSRuZEgwMPP0SIfUody8qEUI0c5+ajzMzxFVRtokmSf4bmSPOxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=Be5xim/O; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="Be5xim/O"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 7D97A605DA;
	Sat, 19 Sep 2026 11:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789818477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8lvLoyNmO9WZfY0yU7JJZrlzQZGhrSGjy40UrHLMKiM=;
	b=Be5xim/OskQ6ebSDGg2mm+GYs1LUnMt9dZzPX6ICurYjOI0BPH/c/LUfniJckvUcojuiaO
	zJmUUhbdMpxa0m+2kNiexEm9Cm8Tg6QWpDUt8u5JUzQzX9JoesJK7sRUZtlex57CDaMxyk
	WUetQFxmNRpNOmNZQkCLY+T7pALTxdQ=
Received: from frank-G5-5590 (fttx-pool-194.15.85.231.bambit.de [194.15.85.231])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 455EE1200CB;
	Sat, 19 Sep 2026 11:47:57 +0000 (UTC)
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
Subject: [PATCH 2/2] usb: xhci-mtk: power down u3 ports skipped by u3p-dis-msk
Date: Sat, 19 Sep 2026 13:47:41 +0200
Message-ID: <20260919114744.46777-3-linux@fw-web.de>
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

xhci_mtk_host_enable() skips ports flagged in "mediatek,u3p-dis-msk"
entirely: it neither powers them up nor powers them down, leaving them
in their power-on/bootloader default state, which on MediaTek IPPC is
powered up and host-selected. The mask exists precisely for ports whose
USB3 PHY is not usable - on BPI-R4 Pro (MT7988A) ssusb0's U3 SerDes
lane is shared with (and muxed to) PCIe2, so the board DT masks U3 port
0 and omits the xphy U3 port from "phys".

The result on that board is a U3 port that is powered and host-selected
but has no initialized PHY and a MAC clock domain that is never
released from reset (the driver deliberately excludes STS1_U3_MAC_RST
from its stability poll for masked ports). This holds the controller's
level interrupt permanently asserted with a status the xHCI interrupt
handler cannot acknowledge:

  [    2.455798] xhci-mtk 11190000.usb: irq 120, io mem 0x11190000
  [    2.861314] irq 120: nobody cared (try booting with the "irqpoll" option)
  [    3.242105] [<0000000014dcb6ae>] usb_hcd_irq
  [    3.246371] Disabling IRQ #120

Once the spurious-IRQ detector disables the line, the fully functional
USB2 bus on the same controller dies with it: xHC commands are queued
but their completions never interrupt, the first hub_event needing a
command parks in D state holding the hub lock

  [  126.053644] Workqueue: usb_hub_wq hub_event
  [  126.053742]  xhci_disable_slot+0xb4/0x188
  [  126.053757]  xhci_free_dev+0xfc/0x2a4
  [  126.053771]  hub_event+0x1364/0x1a0c

and device_shutdown() blocks behind it on reboot, hanging the system.

Explicitly park masked ports by setting CTRL_U3_PORT_PDN and
CTRL_U3_PORT_DIS, mirroring what host_enable() does in reverse for
active ports. xhci_mtk_host_disable() already skips masked ports, which
remains correct as they are now already down.

Signed-off-by: Mihai Ordean <research@mihaiordean.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/usb/host/xhci-mtk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 60af5fe29bd4..016a4902fc4c 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -219,6 +219,19 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 	/* power on and enable u3 ports except skipped ones */
 	for (i = 0; i < mtk->num_u3_ports; i++) {
 		if ((0x1 << i) & mtk->u3p_dis_msk) {
+			/*
+			 * Park skipped ports instead of leaving them in
+			 * their power-on default state: the port's PHY may
+			 * be uninitialized or its SerDes lane owned by
+			 * another controller (e.g. PCIe), in which case a
+			 * powered-up port whose MAC clock domain is never
+			 * released from reset can hold the interrupt line
+			 * asserted, getting it disabled by the spurious
+			 * IRQ detector and killing the whole host.
+			 */
+			value = readl(&ippc->u3_ctrl_p[i]);
+			value |= CTRL_U3_PORT_PDN | CTRL_U3_PORT_DIS;
+			writel(value, &ippc->u3_ctrl_p[i]);
 			u3_ports_disabled++;
 			continue;
 		}
-- 
2.53.0

