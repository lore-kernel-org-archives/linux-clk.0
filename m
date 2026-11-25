Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622062;
	b=aeWhE59f5LzNtby6QIWeDOof2yb/w6hoyt651BpRmQtHnHuqvE7Jsrj7Gv0SJa5eDNeR
	 bD9C8/R74fNLyB7EPP/LLOtshB00AUQo6RzS6XKwOr6Iwr1qLK4MWZw9e4knWt8XKDyHr
	 OVo/CirCIj7e/nOwMzeLCO0OJM6tIzqqrBJB0aj9WNRtwnLo3JduzzQ0zwYIADOQLxkJ2
	 Wu0C253XnGWx/pxKFE5ezx1WtVnDO0XikTXLDNW/PpSVxqNI3smAaRyyz9KsIs9hUfOCe
	 O1dwYy+sbI+jCh2FM2rI3Iemqkn3zIRhKs0upJrAt/VWhdVcdUe6gfTtuCa4gVbxuXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622062;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Tg7Y6fsUTdK0KtqMbKOQDO0R7PtYKluU/YHBu4uWNu4=;
	b=y+fcjvaWLIrRHMezTmN3rA+VHnVPKAz9Skoex5IRI+O5PbChJle4LRJzmnOmy+g5FHmw
	 3Fnh6vCIN9sK0N3mvPkPCLrUC7aLBwFZUEhADdOxtrIhfxOuhpRxMugs/IDSgIYP4TOve
	 WLX+QqyqYBOZBHFlp2PjDzGorUcWSxSOREEVouH1niR63J0VHjk/QltUzRs++AGQLlX6S
	 a6hk5yFcSKoIcFeSQZqZ6dOnviIA3voTg3RiMr2S7vODzxMuoIUrLVfzhVVLEk+SpKYVX
	 wmPO/YZpr888qg121uotU/25tNSF5nT6Y49kf3Z4kIcUGA/1vqkAiFYlfCLliKXteJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VoxlA5/F";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB6606A68E;
	Wed, 25 Nov 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoxlA5/F
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795622062;
	b=rTvofHR7rmRx0CPzDk+dVF61exLVoE+Vx/GIPTdntGNFn/kYtmtCHIz8Tb3wyNeIeia8
	 x38sMbaDfeBMicNKmrxEShIYDPLJlVMTcohtSdt0TnTKRXcMaAAJFCtiTOxsyhHSDznNV
	 JihLDnjNBrH4kKa51qYqv9LWydq6fHKDmTNTsYUWDtMf99b6eHAaLZ1JLl/sUb7vDgiDS
	 p7S5UVdS42iWFH7t0uzy9ZkK1K/3zm0cEeUR1u1NSj+A1G0RRYv3JPbVM2cZI9T5BY1Re
	 PAZbbDXX9h4e4I/e0SC32PHO8ZFUoRleqW90Gho2yayZsMa8x2YLhF3XH94HyWaBpdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795622062;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Tg7Y6fsUTdK0KtqMbKOQDO0R7PtYKluU/YHBu4uWNu4=;
	b=bqaAhsxN5fCJmucDytYiLk7IwRMk1KEZUDPkAsv+x658pstvzCJTkrUgBeXg/6P5ZiHV
	 cock75eDeR2rpbrNZJTib0MsbtDMOS4neSnt60H+RNQ5Yj0zwiU4AQgHNuMVV2wU65wBv
	 2qHqCrYSewYiXvK9d/mVyIl63rGyyXnZyge5TnnTwYt7WZ8/cyxJU5BICnUfZBSttyh8N
	 lnuV218aZUw5OytOFDzmCtQSdMNptzqGqxmIM4Y4IrpmZD+CGLoiO3PyatKrHLC5a1laT
	 d5pIFD0XBtZqxbLMclX/T4n9fJ9Oj9dosJo4Gh0z+eUnyk45EZv3+r6KXNk0eiXDR9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 375DA1F000E0;
	Wed, 25 Nov 2026 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795622062;
	bh=Tg7Y6fsUTdK0KtqMbKOQDO0R7PtYKluU/YHBu4uWNu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VoxlA5/FuUQHLyRKNnHjlbJ+9xmcuJ5Ly4T/Xf0sL5OVLAG+n5mehazaPui3yUxVx
	 6Ew93Jy/SjCK/kmJgr9vUY2kJyT0Pwz0nmR3lzAyJuBmb/gp7HdHhwcCgjezi/EVv0
	 jmMRzqTcjzmeo45cHHq01KB6wLxF9HELBs1n92eXJu16X5NTeVKTXEJvwxI6kCOHRz
	 ZDkqVUOzl17Bl5A9EEd4xThvZYCZEnGiD0MFQ6NVdUwXROrD7zfe+8nIe559hgPK24
	 JKxqYoIVuc20z9+ovgR7QqQUIdnev1SeN32ooLJq5mc+We4OWeyAGBSG4QR9i/0jCU
	 1S1zPuZSM87iw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B44F84CF48;
	Wed, 25 Nov 2026 15:54:08 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Wed, 25 Nov 2026 07:53:44 -0800
Subject: [PATCH v3 2/3] clk: renesas: r9a06g032: Add reset controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-rzn1-miic-resets-v3-2-f25a4b656d71@reliablecontrols.com>
References: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
In-Reply-To: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795622048; l=3636;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=8ZpDxQOtHtigAsvBd6sduY/iCNGxQHa4R86Sa1oElX8=;
 b=3IWaBuVyNriTbMUZ8sKQJUQtljALgnBry5hL/52CYiCLzk6EwoKVjIm9FC3NbsraltXKoTDYG
 rb7Vf5AztoyCWbJm3aIirjfqWD4Q34ya2EyHu3cF79GHAnapzkv1aVr
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

The rzn1 system controller has two resets that need to be cleared for the
mii converter to work. They are not directly associated with any clocks
so they need a reset controller to set them.

They are documented in the PWRCTRL_SWITCHCTRL (0x4000C188) register as:

Bit 3: RSTN_CLK25 - Active low Reset for Timestamp signal selection logic
Bit 4: RSTN_ETH - Active low Reset for RGMII/RMII Converter (50 MHz).

Add a reset controller and add resets for those bits.

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 3df3f2b2c6de..fc4433c3d327 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -21,6 +21,7 @@
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
 #include <linux/reboot.h>
+#include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/soc/renesas/r9a06g032-sysctrl.h>
 #include <linux/spinlock.h>
@@ -675,10 +676,16 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		RB(0xec, 16), RB(0xec, 17), RB(0xec, 18), RB(0xec, 19)),
 };
 
+static const struct regbit r9a06g032_resets[] = {
+	[R9A06G032_RST_TS]	= RB(0x188, 3),
+	[R9A06G032_RST_MIIC]	= RB(0x188, 4),
+};
+
 struct r9a06g032_priv {
 	struct clk_onecell_data data;
 	spinlock_t lock; /* protects concurrent access to gates */
 	void __iomem *reg;
+	struct reset_controller_dev rcdev;
 };
 
 static struct r9a06g032_priv *sysctrl_priv;
@@ -1307,6 +1314,51 @@ static void __init r9a06g032_init_h2mode(struct r9a06g032_priv *clocks)
 	writel(usb, clocks->reg + R9A06G032_SYSCTRL_USB);
 }
 
+static inline
+struct r9a06g032_priv *priv_from_rcdev(struct reset_controller_dev *resetdev)
+{
+	return container_of(resetdev, struct r9a06g032_priv, rcdev);
+}
+
+static int r9a06g032_reset_set(struct reset_controller_dev *rcdev,
+				bool set, unsigned long id)
+{
+	struct r9a06g032_priv *priv = priv_from_rcdev(rcdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	clk_rdesc_set(priv, r9a06g032_resets[id], set);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int r9a06g032_reset_assert(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	return r9a06g032_reset_set(rcdev, false, id);
+}
+
+static int r9a06g032_reset_deassert(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	return r9a06g032_reset_set(rcdev, true, id);
+}
+
+static int r9a06g032_reset_status(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	struct r9a06g032_priv *priv = priv_from_rcdev(rcdev);
+
+	return !clk_rdesc_get(priv, r9a06g032_resets[id]);
+}
+
+static const struct reset_control_ops r9a06g032_reset_ops = {
+	.assert = r9a06g032_reset_assert,
+	.deassert = r9a06g032_reset_deassert,
+	.status = r9a06g032_reset_status,
+};
+
 static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1394,6 +1446,13 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	clocks->rcdev.ops = &r9a06g032_reset_ops;
+	clocks->rcdev.of_node = np;
+	clocks->rcdev.nr_resets = ARRAY_SIZE(r9a06g032_resets);
+	error =  devm_reset_controller_register(dev, &clocks->rcdev);
+	if (error)
+		return error;
+
 	error = r9a06g032_add_clk_domain(dev);
 	if (error)
 		return error;

-- 
2.53.0


