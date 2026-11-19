Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111100;
	b=eA+hHTVHEP4GEkryT6tCWs4mpBX6Pt0DQ/aIrnAKyykjorVqW+Nk1Tfl6tCrdIfh9Q+Z
	 6ao7WMXeHolFfIJLT/kFMJ/XumWK2kQou2dQkS12iKKmCCUdvATgipZgFJn7nzKTT0wQd
	 3NryEJsg7o6rl3N/YLinrgIqaGIVHu1gTu5Pn/2Td15l4Cf7wcKs2ouLZ5rTtZDKN6QeO
	 ba1324IM12usP5e0pbXgRmui2+8ox2Mtyjuk8886I5nEdzw1SltbyGMMFQovkpSwLss8D
	 Z7SyAqTq/3ZKDdGGTnOAtH0ByK5W9pbdiL42HA4koh8Rx4higfWGz50sTMVwbWIX/Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111100;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U7I0g+bU0sdoTYJW10ATCi0RI2EUlSB1/X8r7zW5Y8w=;
	b=vLpUgrBLKpD4QGqvcpvR6dsNUf3PQNH1489Isi/Rbj2AqT0yyM4TAt5L9G+a9BaTOb39
	 GJF1IUc7RO+JVl2xTY3Y80NfAz4JCncKKUvUdFjfOtVepftqsWzNj3b1UjmfXuCe2HOeN
	 +FW7gkMSHbTfyit2rfWL6+/ANYGVGKDt3hhGhT9UsN0KIczCoHiqcTIkFRvJx1OaWH4Xa
	 +UtXwxlEEtcGJYwVLnOeOJdhpBXa7WTh8wfiUW6nU8nMDYTM174vxisIkAtMj7FmOWJqw
	 V8AlIXHr2qZUtEpv+0pB0TxXEnpCNfERqhJS/+c99y5TNOTe3L0JGJdauMv0abZ8KSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=URMegtIw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0462E606A337;
	Thu, 19 Nov 2026 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=URMegtIw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795111099;
	b=YvKfuKEiOnNVlxfEy484aajO6O5Fw2mCLswYiU5AsUk3OsHHAN98HGI77fKdQfeOPWjN
	 EXlnEFdvST88ezr7RRvU8GAQPcOlUhlQBW/hIXwlOTaR3BKPWDfz2c6RfvD0SaOzRBC2W
	 j0wWtK+zzORozp7BEDJzwuJpU5u/Z+kJP45NX7KCNCeIl/eIFcR+xR72SJVuh0xwBTRQO
	 StHHz/TNDgderGk4XdpXtDNIsrGIkW50V9LD0/cJw0EeuBBHWjMYkLXRg8FwLCtfuILDJ
	 S8V1jDmi5tVnpZZ5gIiaD+Cj6dAWXrIULTu8t+ntxoyOYkFPA9NnGip10FtJMUtu5Wg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795111099;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U7I0g+bU0sdoTYJW10ATCi0RI2EUlSB1/X8r7zW5Y8w=;
	b=MsAZtNZq7xPGtNMnGqlvhr9Q5nLN0SN8ItIXB0vj0VNj3hY1SFExHhnTZ69Y+QrLpZNf
	 Ogas1Grnc+WvrkwNJRSAW4FgMYVMThFBYJQtqJ+FGb1kRQ9VFqBB6Z7bTU8aCsve0Ca5L
	 AXyWywNFI0jDGJiwVor5ScjvUvaaOnDA3h3V+PjFHCHXizaWq7bWX0/3Ih0zq0AQaY8M/
	 La5doXLLDynV8rFCsIoq5HPdzoS5OuLjpVSZnwCOD1rb19SyuedWaH4ymtiYzaqf+KJb1
	 0vLPs3BZ57M6A8grAX+sCQzAdrnNLea/nDbO8Kcsm9Jhl2LlyQev53Fh6UzZYsLytKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6D4E1F000C6;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111099;
	bh=U7I0g+bU0sdoTYJW10ATCi0RI2EUlSB1/X8r7zW5Y8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=URMegtIw4PK6kjLmYIiYUyiZ2rXuX2I3sEyXimq+9UjRfdgaQBR7wFaD3tzhHxkAz
	 OHNLLJAcMa0orudjI9ekVtxpvpfLGmRg/5vhal9/DNopLCYc+QZ/Vq/UwXpQ1bevlm
	 LwmtBOSgCYGDuIdJriEb+UEFeQPOMN+Zehna8VM4pFsqLmmWylHcdqkKkidivIhzCU
	 PK5s2u8UgOKCEsyYUyrXSJv1xoXA3tZs9U5kfT63Z0FpmeLJoUHZGveMMT6zhnvE6X
	 8zdFJk8y4YpmT85GJR6JpvzcQ47KH/+WL0kHiZb2guo6UXGQ0ueGU3ka0SkL50sB/2
	 8rOGxeGgtIZUA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 425984B3A6;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 19 Nov 2026 09:57:44 -0800
Subject: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
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
Message-Id: <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
In-Reply-To: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111097; l=3698;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=K55PGhDwoeO0SnRKw9KIc71iX+MI6F5UGeo6Fl4rgqg=;
 b=/xzBEMOSa6Ag5ThW111yAz4JSl7e4KnR37Ab2clbt8Jk+rmxL1fmeISH6HFSHk14JLdZLQ0rY
 UOyw+PTObnyDihP9ReuckRXnsv1MEMkerCQCaPpz7bAT++Rk5kh5kF0
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
 drivers/clk/renesas/r9a06g032-clocks.c | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 3df3f2b2c6de..547e8d82f1cf 100644
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
@@ -675,6 +676,11 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		RB(0xec, 16), RB(0xec, 17), RB(0xec, 18), RB(0xec, 19)),
 };
 
+static const struct regbit r9a06g032_resets[] = {
+	RB(0x188, 3),
+	RB(0x188, 4),
+};
+
 struct r9a06g032_priv {
 	struct clk_onecell_data data;
 	spinlock_t lock; /* protects concurrent access to gates */
@@ -1307,6 +1313,56 @@ static void __init r9a06g032_init_h2mode(struct r9a06g032_priv *clocks)
 	writel(usb, clocks->reg + R9A06G032_SYSCTRL_USB);
 }
 
+
+#define rcdev_to_priv(x)	container_of(x, struct r9a06g032_priv, rcdev)
+
+static int r9a06g032_reset_set(struct reset_controller_dev *rcdev,
+				  const char *func, bool set, unsigned long id)
+{
+	struct r9a06g032_priv *priv = rcdev_to_priv(rcdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	clk_rdesc_set(priv, r9a06g032_resets[id], set);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int r9a06g032_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	r9a06g032_reset_set(rcdev, "reset", true, id);
+	udelay(5);
+	return r9a06g032_reset_set(rcdev, NULL, false, id);
+}
+
+static int r9a06g032_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return r9a06g032_reset_set(rcdev, "assert", false, id);
+}
+
+static int r9a06g032_reset_deassert(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	return r9a06g032_reset_set(rcdev, "deassert", true, id);
+}
+
+static int r9a06g032_reset_status(struct reset_controller_dev *rcdev,
+			   unsigned long id)
+{
+	struct r9a06g032_priv *priv = rcdev_to_priv(rcdev);
+
+	return clk_rdesc_get(priv, r9a06g032_resets[id]);
+}
+
+static const struct reset_control_ops r9a06g032_reset_ops = {
+	.reset = r9a06g032_reset,
+	.assert = r9a06g032_reset_assert,
+	.deassert = r9a06g032_reset_deassert,
+	.status = r9a06g032_reset_status,
+};
+
 static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1404,6 +1460,14 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 	if (error)
 		dev_err(dev, "Failed to populate children (%d)\n", error);
 
+	clocks->rcdev.ops = &r9a06g032_reset_ops;
+	clocks->rcdev.of_node = np;
+	clocks->rcdev.of_reset_n_cells = 1;
+	clocks->rcdev.nr_resets = ARRAY_SIZE(r9a06g032_resets);
+	error =  devm_reset_controller_register(dev, &clocks->rcdev);
+	if (error)
+		return error;
+
 	return 0;
 }
 

-- 
2.53.0


