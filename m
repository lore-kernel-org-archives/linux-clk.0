Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0D264A7F
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753706196; cv=none; b=cerUtmbdJCjce/BOiC/0ax8g21jna5sq1bomKvzSZdN/TXDg/BWhnQugEDU5v454Ae/3CmXNusrOhuQPlEBRfLhVV2Wz/Z2xkRqoo8KbmSfJmmS/eLJBRodSAsKEtG90wjGw3UDf9LZ+Mxp/zEwgWpean2ty2zK4PZqO5t/7EZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753706196; c=relaxed/simple;
	bh=pZZomASi24vggMR8j71ADAoeO3BXAe5jDYmwLalGNxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDoU4mXrRfq9Q6xlvRRxhIBC08mqWuyQhyhHbvQtFUoYH+igruqf2MCoFx2tbLKyRZ+crNCEzJHCPt2ojhhJa/IMqtvgCxSON45tq1qQe9jbCDr1gDYYxc7DrSQixFmbPCCLQD+MgwXXQf2bWCnNHSj5pTq18rHSTmHVwmJQ9M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kWLH9hHV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kWLH9hHV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OK5T6uLGwmqn3hf1RmQGBueNfkd9EIhFCH8Lf+T1dH4=; b=kWLH9hHV9FwGnzuLVaUm5i56+P
	EhJuA5KZLglaBdxkl1ID8nlApi5OYmtg9BZge0EDaWB1zPxfmE8WI1Ad0aJQVHErdnXPpFatCXhBj
	hd7q18TiWktk1zeaB5fSJjCq5FkRTeI/qaWQtupQivld3BAovUg8M6nm+noyhyNkcFLt8mjLp2Qwc
	pbauB3uwRLXwVJiJnAhdwuPKuQ5glF7Tfd+SXqw5X3E6drlo48NOMJ4lDhfAHlX80hscae1whydxJ
	pEAWnRx8KRY4teQkLB/z5R7eON4allTr/Bxta4oP+cwEeVCF0pzJ7lyTupD671Bph2eO9546b9f56
	h8io8efg==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1ugN5e-004u0J-9I; Mon, 28 Jul 2025 14:36:26 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 28 Jul 2025 09:35:38 -0300
Subject: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
In-Reply-To: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4285; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pZZomASi24vggMR8j71ADAoeO3BXAe5jDYmwLalGNxQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoh26+suwpumaA/wn+o2MjmzSVpSXOUkLEBC56k
 q7kRLvz5BiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIduvgAKCRA/8w6Kdoj6
 qr/jCADgO02yc7qcjaMiFwUuEvy50CDhC+sepCAyp2+fSb4QTq5oj3h3Oc0Oq/VdPYslrovrVXI
 9Ol8N0vo7erv/C6qCjUu1pvBKoMQCI5jPTcqqO/K1mqwqyAyrUCH5eVMoTgFZiJ7wj2TKgb//ww
 99nhNkO0jfany3jhizw4XykRlMaH3q6RDuEExQuXHvEXlURYhXMLlU5jc4K7d+PEvjtyAl/+7+U
 LZbIWJvQJPjB0nvftbyi90KQUvMc7f+w9nn01GxhbKSPx8J32llhOEEJIWEER8zxeQS1V8gw7gf
 Z6koR4sDZkH4ykwgmOJiFTm81zHjUUesBEj3XbOgHbd4SDEo
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Currently, when we prepare or unprepare RPi's clocks, we don't actually
enable/disable the firmware clock. This means that
`clk_disable_unprepare()` doesn't actually change the clock state at
all, nor does it lowers the clock rate.

From the Mailbox Property Interface documentation [1], we can see that
we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
prepare and an unprepare hook for RPi's firmware clock.

As now the clocks are actually turned off, some of them are now marked
with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
early boot or are required during reboot.

Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface [1]
Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 41 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 8e4fde03ed232b464165f524d27744b4ced93a60..a2bd5040283a2f456760bd685e696b423985cac0 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
+	u32		flags;
 };
 
 static struct raspberrypi_clk_variant
@@ -75,6 +76,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_ARM_CLK_ID] = {
 		.export = true,
 		.clkdev = "cpu0",
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_CORE_CLK_ID] = {
 		.export = true,
@@ -90,6 +92,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * always use the minimum the drivers will let us.
 		 */
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
@@ -115,6 +118,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * drivers will let us.
 		 */
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -127,6 +131,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
@@ -135,6 +140,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
@@ -259,7 +265,40 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int raspberrypi_fw_prepare(struct clk_hw *hw)
+{
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk *rpi = data->rpi;
+	u32 state = RPI_FIRMWARE_STATE_ENABLE_BIT;
+	int ret;
+
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
+	if (ret)
+		dev_err(rpi->dev, "Failed to set clock %d state to on: %d",
+			data->id, ret);
+
+	return ret;
+}
+
+static void raspberrypi_fw_unprepare(struct clk_hw *hw)
+{
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk *rpi = data->rpi;
+	u32 state = 0;
+	int ret;
+
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
+	if (ret)
+		dev_err(rpi->dev, "Failed to set clock %d state to off: %d",
+			data->id, ret);
+}
+
+
 static const struct clk_ops raspberrypi_firmware_clk_ops = {
+	.prepare        = raspberrypi_fw_prepare,
+	.unprepare      = raspberrypi_fw_unprepare,
 	.is_prepared	= raspberrypi_fw_is_prepared,
 	.recalc_rate	= raspberrypi_fw_get_rate,
 	.determine_rate	= raspberrypi_fw_dumb_determine_rate,
@@ -289,7 +328,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	if (!init.name)
 		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = variant->flags | CLK_GET_RATE_NOCACHE;
 
 	data->hw.init = &init;
 

-- 
2.50.0

