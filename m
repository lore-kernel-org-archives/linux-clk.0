Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3992FD1B1
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447579; cv=none; b=SVSJs6qXl6qzN1nL5hed60WJ3MyTMSJKVcfAd8bmldYu2OyeqnYs8r5uLgiyxxPQ5EvlxkzpjxZ0JfTKrisUpquKd7E5JeoliFxrFrV5kTjRpupGaLtfS2SOfMBiA4LP0sBakdZq8TC/DyloDP0cCH+VnOd6GXPdx4duV0sobeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447579; c=relaxed/simple;
	bh=IA1YBUMs/iIQl36lh0k9HyH0QwFi5qeoZtBc3SU2miA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzgqsLzQyakX149osWzxluMMPUFmsgqkcvd+Deqs5KnbGx+8eey1pCcqWZxMrqsGymVa5/JXs2XTfjpVhcUrT+b9fU9Mu35IatQ4VTDHZLQAyvjLI0j6YoHG14UaMQlSJXUyztNYIw6N2LlfmH//6H3bJOZornrHAAgdIpfQMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rwDoe2Yz; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rwDoe2Yz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sgtQYzUApyiQz10T+cRb0FtV8nPLoTQ14FL2GFbOzVA=; b=rwDoe2YzEogG3q5VbAAnz2K9FW
	WkyQwHzqTTkxbZ7/fKJ3r+GNGrcS8PaytSJr8KuPFUEi9t3FfQKka2ocYyPTj9l9k7swIKnz7AvrO
	a5ae8yeqFqLte5IiiumNNUAkWs2ToYTIiNxWE2YDThq6Qi2GSXuGPz+EMwL7uVXcOh1I/T1LaVrMo
	vpX2dq2muAfl3HyDweAmFy4ik+knL+dcW+h52e4+Eanc2GcJQvVKv1FuFfOpsDvm/m2GxNAgpc1ex
	2V/oE40vHFfeSns0JSNPCIJ5uyTCElWisKwBX28vXCVP11kiUfadNrW3Et2OlUnribZG0UoBvuZPV
	zhCFWCRw==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoQo-002Czn-Vb; Wed, 18 Feb 2026 21:45:59 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Feb 2026 17:44:59 -0300
Subject: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
In-Reply-To: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5144; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=IA1YBUMs/iIQl36lh0k9HyH0QwFi5qeoZtBc3SU2miA=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliT45j6LIUMOG+Wd1sW9pNM7ypsiQP42M1KoQ
 PxsTOYMkeeJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk+AAKCRA/8w6Kdoj6
 qln2CADfJXhF/h7MuQ2xD10xBv8GfzdHfEnRl6FxgRsgPtMiecFZb/cjQy70YeYu8XgQ8t1spQx
 v2OkKQ13gMqOfbOS5VD+YeYefy1/Nd+osgTOzRtGYjAzratxfBFiRDjiJaH+4DYyi32fFW6wfm0
 LPpqDjgufQBVNNL4bVVIZAHBkHLm7rYcCbnVzKUNLupKKuEHopcnilx7CzS9ctel6eMzNEyaTx4
 eBOYIjzA68YndHWpR7C68vbMailgLTlMkixngrIzwo6QN1tddgEdDQjisjMbQYo3f+hnBIPjjM2
 PMQey2m6/lkieZvM6nMC8xb5Q2/ve1sbIR6wL0K4NV9Ax3yI
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. To achieve meaningful power savings, the
clock rate must be set to the minimum before disabling. This might be
fixed in future firmware releases.

Rather than pushing rate management to clock consumers, handle it
directly in the clock framework's prepare/unprepare callbacks. In
unprepare, set the rate to the firmware-reported minimum before
disabling the clock. In prepare, for clocks marked with `maximize`
(currently v3d), restore the rate to the maximum after enabling.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 61 ++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9162f0ae31e330c46f6eafdd00350599b0eede..0d6e4f43c3bac0e7b38934c5c6e4db51211233de 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -66,7 +66,8 @@ const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
-	unsigned long	min_rate;
+	u32		min_rate;
+	u32		max_rate;
 	bool		minimize;
 	bool		maximize;
 	u32		flags;
@@ -289,16 +290,22 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 static int raspberrypi_fw_prepare(struct clk_hw *hw)
 {
 	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk_variant *variant = data->variant;
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 state = RPI_FIRMWARE_STATE_ENABLE_BIT;
 	int ret;
 
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
-	if (ret)
+	if (ret) {
 		dev_err_ratelimited(rpi->dev,
 				    "Failed to set clock %s state to on: %d\n",
 				    clk_hw_get_name(hw), ret);
+		return ret;
+	}
+
+	if (variant->maximize)
+		ret = raspberrypi_fw_set_rate(hw, variant->max_rate, 0);
 
 	return ret;
 }
@@ -306,10 +313,19 @@ static int raspberrypi_fw_prepare(struct clk_hw *hw)
 static void raspberrypi_fw_unprepare(struct clk_hw *hw)
 {
 	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk_variant *variant = data->variant;
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 state = 0;
 	int ret;
 
+	/*
+	 * On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
+	 * actually power off the clock. To achieve meaningful power consumption
+	 * reduction, the driver needs to set the clock rate to minimum before
+	 * disabling it.
+	 */
+	raspberrypi_fw_set_rate(hw, variant->min_rate, 0);
+
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
 	if (ret)
@@ -334,7 +350,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 {
 	struct raspberrypi_clk_data *data;
 	struct clk_init_data init = {};
-	u32 min_rate, max_rate;
+	unsigned long rate;
 	int ret;
 
 	data = devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
@@ -354,18 +370,20 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 
 	data->hw.init = &init;
 
-	ret = raspberrypi_clock_property(rpi->firmware, data,
-					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
-					 &min_rate);
-	if (ret) {
-		dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
-			id, ret);
-		return ERR_PTR(ret);
+	if (!variant->min_rate) {
+		ret = raspberrypi_clock_property(rpi->firmware, data,
+						 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
+						 &variant->min_rate);
+		if (ret) {
+			dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
+				id, ret);
+			return ERR_PTR(ret);
+		}
 	}
 
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
-					 &max_rate);
+					 &variant->max_rate);
 	if (ret) {
 		dev_err(rpi->dev, "Failed to get clock %d max freq: %d\n",
 			id, ret);
@@ -376,7 +394,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	if (ret)
 		return ERR_PTR(ret);
 
-	clk_hw_set_rate_range(&data->hw, min_rate, max_rate);
+	clk_hw_set_rate_range(&data->hw, variant->min_rate, variant->max_rate);
 
 	if (variant->clkdev) {
 		ret = devm_clk_hw_register_clkdev(rpi->dev, &data->hw,
@@ -387,20 +405,11 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
-	if (variant->maximize)
-		variant->min_rate = max_rate;
-
-	if (variant->min_rate) {
-		unsigned long rate;
-
-		clk_hw_set_rate_range(&data->hw, variant->min_rate, max_rate);
-
-		rate = raspberrypi_fw_get_rate(&data->hw, 0);
-		if (rate < variant->min_rate) {
-			ret = raspberrypi_fw_set_rate(&data->hw, variant->min_rate, 0);
-			if (ret)
-				return ERR_PTR(ret);
-		}
+	rate = raspberrypi_fw_get_rate(&data->hw, 0);
+	if (rate < variant->min_rate) {
+		ret = raspberrypi_fw_set_rate(&data->hw, variant->min_rate, 0);
+		if (ret)
+			return ERR_PTR(ret);
 	}
 
 	return &data->hw;

-- 
2.52.0

