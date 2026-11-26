Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709489;
	b=txno3vZthJJoPjgmCU4RBQcYYITTfcfNhfyLzqYdXTCd6Vhq1kSSDbkNmW98p4RNJHKN
	 Q+vRoBzPbLH5nhKsfEke2i9+1KXStNGECG78iOIfNb0LKL01ZHHt1KYing927DGYOCcZu
	 nQfy0hQd7cL70o7gmIh76yw4izAWpaYrKs6B/tCkLteP/wmPFvzm/ptQUH9Ot4dn7xMVk
	 0iNWTaYisXuSYj7huIvtncc8IBxXO8WIajHYO7+2EIF+/To2wJZSSWX1+xw58tWqJdthU
	 CsWb38VaWyIVFzmBnTIIa6An9V8OI2R9NY+aoBoj4vRR6f08UaSkm9+mWqn4xR/HizQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709489;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jcQVmIDn9FBKfmQ1PlZYAu7JDZvGMn062EqTFp9zR2s=;
	b=3b3cDGqNEwu8FzT1iKAJ2W+PuxEQAX9lgXVdSLXEIT8oves112obsRg2tHzMphFGDJM7
	 BWyxzzs0+2yzvxH96Bzgjir+qytLv3Ks9t4qApgUHFfDv5PtUnwtW3Mz5mecS7YGrhJ6D
	 1q0FZQt71LfZCq3SXLJlR5/Jjtl+RxDHVIdH+DL/48Qz7w49bK5ss6cC31DT6r9acDDT7
	 ILsPMq9un25V2Y1PquACU+ci2qDhuUzgQlaUPq28u4DmuMcg1jx43eXXIeJVgfwaPddIE
	 IDt/hOePSbdLLTkgAHWbYjsWDDYHdoy/nYlrXKNOfkdsrF2hZ9bkJ9vQXZ9UvOD3o8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bNO/ZuX/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE870606A686;
	Thu, 26 Nov 2026 16:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNO/ZuX/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795709488;
	b=AvKF5HmyZXrU1X5P/OBAGGNRo2pVlbENjNUFpuxgebKEBHCG2u4a+gX7jJiqY/CH0yyY
	 SJGZh35KVyXT7OzNnZ0Wz0cFYfRHFOl1Rj/YSWwSiH//Ro8fO8VvV2/H1Nd24EFPQMMbf
	 Y1rQQjgb+6Dec9c1t2v6gqvHrMhIyzFb0gCmoMnYNQGJNq1szxzgCdKi4R/xXdSQ2kaJo
	 uq+kR5qQuUVPxggnuhdZNHrnC1LVtOs+HAiapw5R2+ycvyLgQdXHXXX5hU+ksP7O6a+th
	 oxRtTRNKeafT+MvHDJlaF04fcaj3PlWYQzMta1VhxA9m4bjGxoMyzsdMPG9iiNekf+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795709488;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jcQVmIDn9FBKfmQ1PlZYAu7JDZvGMn062EqTFp9zR2s=;
	b=n99RknFUWXChQmXAZeH78z/Sxv39p4n3ypyn/HtZCsazLCtXENprVhrI3YobsR4N87Fz
	 Lz9HdO2GO31FdKLWvqTkld6+waZKjbSEs4/gAtuEUrr/Wum221FAUsboSypgBt424yk43
	 kKqmLg69hgSMZYqHDweyQXr9B8AsoVCbZMpULx49aYejCdJdkTu9mJxuvV5lHGd+NOZIX
	 aw9opSuYmTOa4wg7y2SWyfXfbhndpUDPFk0m9E2sAy1/K4eCksRGmOZMdPXAqG6p33AkA
	 MZusnIrget5Bjt80q1/4DZZMO+vaZP62t8dOA+qLyuyaMC3ZEK5d6JwvNtuG4BqPJEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCF5D1F000D4;
	Thu, 26 Nov 2026 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709488;
	bh=jcQVmIDn9FBKfmQ1PlZYAu7JDZvGMn062EqTFp9zR2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bNO/ZuX/DLH9jGTD0A4ZQwITOg+RxKYPvhiq45tjEEjTgNEiapB+owIqVgJt7mrVb
	 snvgg1+Xy+Zq9Goavx10kp5GiDTBmaXHUwKX2j9evqSJ7o8z3/HM1SCFuvsiQwTXrv
	 6GZpjcl8WEGxl+QgVf6ksFxTGrkLyeopNT8rRhdX92eIhPBPKGeGCClbeYe2edug2N
	 yODxlGN90lDrATdZGEUE+XVpab1eZsR8DKBlnfcj40b238EZzDzJUZsiG0zfGnRm1S
	 JMIG2qNnE7xjKab+Y/Op6faKggO/H8qpzaJu/qJl/+cKRNxqysayMP/Y23lhQyxiYk
	 DA5Nrz65/5QLw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 65C814D704;
	Thu, 26 Nov 2026 16:11:14 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 26 Nov 2026 08:11:06 -0800
Subject: [PATCH v4 2/3] clk: renesas: r9a06g032: Add reset controller
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
Message-Id: <20261126-rzn1-miic-resets-v4-2-4f73af81d779@reliablecontrols.com>
References: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
In-Reply-To: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795709473; l=4247;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=d5S+pJMq+GdGiRcScbgQkAtDilD3W740omT+17Nfe0k=;
 b=63DE9o8hbeouiFQl6hghqGZ1wahGRCSPMMh1vnxOu6SS0VzTsImmOa6RGwqpG4BX5HQ0lwBX7
 c071KlN0HzcBr4gMC3EsZl8khwiPz3wWsGXenvH6n/Z6mlW/wEPEpmG
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
 drivers/clk/renesas/Kconfig            |  1 +
 drivers/clk/renesas/r9a06g032-clocks.c | 65 ++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index a02ca6b096c0..a38795e2bca2 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -187,6 +187,7 @@ config CLK_R8A78000
 
 config CLK_R9A06G032
 	bool "RZ/N1D clock support" if COMPILE_TEST
+	select RESET_CONTROLLER
 
 config CLK_R9A07G043
 	bool "RZ/G2UL clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 3df3f2b2c6de..b2ed348c1ece 100644
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
@@ -1307,6 +1314,57 @@ static void __init r9a06g032_init_h2mode(struct r9a06g032_priv *clocks)
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
+	/*
+	 * Figure 7.3 and 7.4 in the RZN1 Introduction Manual recommends
+	 * a 5us delay for reset to propegate after assert or deassert
+	 */
+	udelay(5);
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
@@ -1394,6 +1452,13 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
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


