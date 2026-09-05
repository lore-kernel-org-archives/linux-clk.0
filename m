Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0704B049A
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622361; cv=none; b=hcOZq9ib7+KyPK9AcTZMVrkEh4og8UCQBvRpYvM9WXRZG+yWIqKX/iTA40KUywGVhnSy6NN9QXSiw0PxddTd4SFucqikOVxAG9t0x7s5jha3rCY8AOwhKQTfLZkMEpUpZ7NsvAwTFONOjACpOtiXZhDHPSWC3vdwseuUhRRo83Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622361; c=relaxed/simple;
	bh=oLDcY6kImT6VejPH+8oQ5pUx6Jmf88kTwnGUpUh8fuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuP04c02WpGB/tBTEU/vy3ylN+FMD1gVGBQR5efgCELoyfNoK3SW1iBVb6WapWDJiRT38PBae19zBo9LMY8Xf73PrhHm9iI+67sfE2FKh4d6I/u5FWSHtuCSG5h7A5yjALl5X9fMPUZrHy1fLeSdn01Uh6rgD7fEnfv9+PvjOP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba14so1776900f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622358; x=1789227158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6cvLPMe39R/AaBDs2Mh5u5mXzrtCLtGEuv4B7IhLgiQ=;
        b=BRcdXrOWcS8WAOI6D/1ZQUVJlCGkIg8btiiFLKpqaIqIUBUlcuY/uIbgcxJHHsbDz1
         asrNEJgC10Fn+nxEZJ0aGx6qfwtAfjjjhPE/JnKc1HSimimQKpUOHjDlIxJKNChCxtqz
         WrGmdG9ErcHTUBEnIHdCQiZ+BPsdvevyTzpHysTDMlQyApYneoO+UlCzxnWzB8a/Nf4K
         9M2RIRaYpBrTfoKQIaAK/1tBJZK0VdYQ3C7jZCGfuPH4dmg4bxf5wQ7ZEpM5rmK1lyOz
         GRQPjQcACfVfxWYl/ro4S940ieEXU6N6XkrTZcuFJ0zzr5JBacKXqCcoltgzTHWtf+iK
         21YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXNX5BFm2IiGYaQBlllnzK3gHepucO7ST0xt2lhmf4iBBPVhHPl2sAJdnHmP1F31kxk4T05GFuYWE=@vger.kernel.org
X-Gm-Message-State: AFuF++l6ywmRs/Lwm8EEOwMo5I6LMI4XedDOSDqVLyPpXQSyIx+qfxJ6
	ow5H+nNMxbezQ/OjEO6IWXISqzJ1fyOQ2g5oEUs099yyScd3UJFAHWjG
X-Gm-Gg: AYBFou3NatjngMg0GUsXy9f0JGVWBT+XDpc4USFfOC7SjQbFHqG+5YXM3vFGCdSLEMK
	QwMr6yGxfAJvNxZ0xNoWPXY9blbWqvn2iUiKFd03Asz/hOt1Wt76w7p+W/Y+ybPr8wGrKRL3rrN
	nZfBBAo71qmQhP7qBJB07JIztgsoH3mGlcuZSYJXiuJANLStY5FKMNOzYdhPlakhaKIG+HGi2wO
	PTvTYpn7VfyUvhjKADai7UdX5fEpLpH4vJ54fQKxTmJU8YVREPkd4DJ26OXByh36y9ErNu0S/LQ
	3UVUMR4hU+sg6GZCX6z4DNdaSNnlC/zhSuYpKhTLcJNDVgm2XUQi3s6hIf81BCHml5pwnztH+rv
	UWeZ49fM8WjNDPWlpN10jSmmYzwCBJg5jGTuSaTR4rpMGeJ1n/0bBrzDJffBKykWFE1Kpy0eLmb
	VlDloshoynjhCJeDnkiEmaczrKvoDbmLA2MOeALyRUaMaIo3VukGoJHieQ24SL/ZkgieCAagA1E
	/Y5tb36+i7LK5bX4N+6XmVJr0fd+bH+MqCh
X-Received: by 2002:a05:6000:470c:b0:485:8a46:705c with SMTP id ffacd0b85a97d-4858a4671b8mr11204628f8f.46.1788622357649;
        Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] mmc: meson-gx: enable the bus pipeline clock on T7
Date: Sat,  5 Sep 2026 16:32:32 +0100
Message-ID: <20260905153234.133217-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the T7 SoC, the bus path between the SD/eMMC controllers and the
NIC_MATRIX fabric goes through a pipeline stage inserted by the hardware
design to help timing closure. The stage has its own gate clock and,
when that clock is disabled, a controller that starts a DMA transfer can
never complete it, hanging the storage devices and, from there, the
whole system.

Add a dedicated match data for the amlogic,t7-mmc compatible that makes
the driver claim and enable the "pipeline" clock for as long as the
device is bound.

The clock is deliberately not optional: the hardware cannot do DMA
without it, and failing the probe with a clear error is preferable to
booting and hitting an undiagnosable DMA hang later.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..c0f1e929fc13 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -139,6 +139,7 @@ struct meson_mmc_data {
 	unsigned int always_on;
 	unsigned int adjust;
 	unsigned int irq_sdio_sleep;
+	bool has_pipeline_clk;
 };
 
 struct sd_emmc_desc {
@@ -1204,6 +1205,15 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (IS_ERR(core_clk))
 		return PTR_ERR(core_clk);
 
+	if (host->data->has_pipeline_clk) {
+		struct clk *pipe_clk;
+
+		pipe_clk = devm_clk_get_enabled(&pdev->dev, "pipeline");
+		if (IS_ERR(pipe_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pipe_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson_mmc_clk_init(host);
 	if (ret)
 		return ret;
@@ -1322,12 +1332,22 @@ static const struct meson_mmc_data meson_axg_data = {
 	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
 };
 
+static const struct meson_mmc_data meson_t7_data = {
+	.tx_delay_mask	= CLK_V3_TX_DELAY_MASK,
+	.rx_delay_mask	= CLK_V3_RX_DELAY_MASK,
+	.always_on	= CLK_V3_ALWAYS_ON,
+	.adjust		= SD_EMMC_V3_ADJUST,
+	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson_mmc_of_match[] = {
 	{ .compatible = "amlogic,meson-gx-mmc",		.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxbb-mmc", 	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxl-mmc",	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxm-mmc",	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-axg-mmc",	.data = &meson_axg_data },
+	{ .compatible = "amlogic,t7-mmc",		.data = &meson_t7_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, meson_mmc_of_match);
-- 
2.55.0

