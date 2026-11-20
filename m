Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209464;
	b=l+TArRQDKXizhazuimdI2o/tWJ0odx4srCcIPbwHabrqlORyi9d4NbjPy1rTR2hHO69c
	 OpZ/9snFHctFAikgAbbFoJer9TOgs1WAXXCOnt3RpANhqI9vMqt9kdbOQzPOQ/PMOE3F9
	 slPWaAqjhH7izy19N8q/tOTpcYQ3QSPM/oD3IL4GzU/A7KsJTvrOjA8YN3gvf5OgT8NJp
	 uRwcFJHEoTSTYrQK3ylYBgvC4L9pNdn14U5uiI/A5RDMTR0odPjQ9OLuD4QlSd2tNE9os
	 aqD2LeN6qNXijwxHmpAO0S2d6NeWrtKi3HLybW1JvWOAgCUB3PabBdhX9vyLy/sqWbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209464;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EuzUw5f1Ud4d58uJ/5SD6e0UG01nBBOaet58WDQ1pco=;
	b=2tcbyWv67o/IwwVFXUTojpFe8sU8/ihnLHdzLJ8EgBhQT4vPw9qlJdEYSAgtnip0/wtr
	 Lo+P9SDXKYVKlqxfUu3pBWiF+qBOMZcX3gRppZUvMTyhO1cZCgTrrPATh96O4tw3NmtRx
	 QjVSz+hJMDJ3HFw1sEQpkXQ58udJv/lfDi+uBnyWrwD1EstNK+EewrFN/ctki4Uqv3Ajh
	 jddX8W9HFKBh6Oe84hqaoQobracSt07ol7RMXFooaKO27flcVUrWTf5jVqI0BwxBiYVJw
	 mCwh6SX7IAxm6l6G63alq5wbgh8y2HhguV1dMyNuXeBoTmsCAzmE55JoidWjHFuA34w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nIWcPUnf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9607606A692;
	Fri, 20 Nov 2026 21:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nIWcPUnf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795209464;
	b=Zxvnofe04qEkAYgy3wt7tBouCtbB8wu2X2Bj/UndBbKHYRQMsqd2sbsC2oQ3e2OT56j6
	 T2IvyGGxdN3FuEuVz+htHt7Y3VHoHdCZi15t3sAzVVA0Fdpl3IHfeNzdCrRgzptdRVvwm
	 RLgdJRd5QkqsdlL+WJNsRQ6rDs0wySq/qoSOWCnpTrxF6l2Z1ov9IUprt/lNfQCtDgXy2
	 Rre9oNy/a2aAkdkSxOvL1IEiARMWy1R38qj41YbhCVWmGcinwfifTpCdR/4nXtYOTpbk4
	 5AweXwUOnpTuxPL0LYejyKUg05K52Ze1gZIdoEE2KBosy091/AoPU84JM6+R0lmWW7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795209464;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EuzUw5f1Ud4d58uJ/5SD6e0UG01nBBOaet58WDQ1pco=;
	b=DLhKsoLHAUo1Td6ZJe/05btcqYyzdDSgH+vEMJVNEtvpQcx509SoqThW1dvEs0+XoDbx
	 32MfHfJeCVDqgjtfNLHHt+Nsu9SCZe5G713jbqWsbOpDEtdBnAtUwyO75JA1Yc4+OnWFz
	 xNq2JI9t1p8vv+4YLDNhArYBirpbr2ZQLrjBbcUwseaJBeAWkMcWxmIZp39nmDf9M5ZTS
	 uLgkTjGsaVOqAnLxPAXWAJJ1mZQ7XTwO5dGHsVusCNRFEaaqk+gCks0W4K6jN4bBAiTWf
	 IxoEDb3PrsSVkjHImw5u4Xfi0M6Ket9qfO3rj5ERATDVd5MFEJ7xsf9XiVqQLFKRkQg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8212C1F000D2;
	Fri, 20 Nov 2026 21:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209464;
	bh=EuzUw5f1Ud4d58uJ/5SD6e0UG01nBBOaet58WDQ1pco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nIWcPUnf08xoLeij2YAKK2wcqwuT7MGzm+secu5ctzAbPXQ1GfJTsA0bQQwpoiDNJ
	 Pzw0xkfOOL45huNn9HCHnSmeDWTUsqGA2z5sbdvKrSsdVmJyxPyAhiNkCKj+V0lq2T
	 shaxw9qlXSnyngyXfhWo+MCsu86lpid89TtWl06epM582AVIf86mbQTrxvA7BVH4Ri
	 s1zlxWWWxMx5bGM6wAKwjvjd6crwntC4W8aDPdU06v8EM82u/cqFPsA7mXjIGRMj0+
	 Au8tU5+xtPa+qA0HRFwkVayErwOn/HPU0Dz5CK8LrBmZHKrfQlBpntkm0VH3YNZtTs
	 GtSt+m9+3bBGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 10F364BA34;
	Fri, 20 Nov 2026 21:17:35 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Fri, 20 Nov 2026 13:16:53 -0800
Subject: [PATCH v2 2/3] clk: renesas: r9a06g032: Add reset controller
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
Message-Id: <20261120-rzn1-miic-resets-v2-2-f1cfa678615b@reliablecontrols.com>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
In-Reply-To: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795209454; l=3581;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=0g2POWYtRvVzTZboWK18HFCjFplyLI4cdWVXHncFx6c=;
 b=QMkBThHxywhVBLfVFrdgLcxZpBDdWZ6PFT7jnP/0dmMSDwdV1Nv+kwM1uSZBgs6bPQwN6pqac
 FqWzmjgr/DjBbOHtuME8ADSGktNm1nLqizBJisd6JhkvJWVR9mJ1ZhH
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
index 3df3f2b2c6de..a474302987aa 100644
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
@@ -675,7 +676,13 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		RB(0xec, 16), RB(0xec, 17), RB(0xec, 18), RB(0xec, 19)),
 };
 
+static const struct regbit r9a06g032_resets[] = {
+	[R9A06G032_RST_TS]	= RB(0x188, 3),
+	[R9A06G032_RST_MIIC]	= RB(0x188, 4),
+};
+
 struct r9a06g032_priv {
+	struct reset_controller_dev rcdev;
 	struct clk_onecell_data data;
 	spinlock_t lock; /* protects concurrent access to gates */
 	void __iomem *reg;
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


