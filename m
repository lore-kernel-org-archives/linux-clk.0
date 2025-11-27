Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB38322DD4;
	Thu, 27 Nov 2025 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232760; cv=none; b=EFequt7/u9Y6La+E59cXKvQ42PXEu73ZhGn0TeLnQkhJktSO7DSY/hSwz4YWJpaWoPYcVCciw7rdRgMYgCwYJJv5OJfSK+LPiSPaHIwZ9xOLp+puC9VNqORhompn5YcAuX4pz/Kl4Jtc9oNVUIUj8hCheTO4ycv4enPssHHLr4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232760; c=relaxed/simple;
	bh=ZUioTVBthdgmRBP7GEsGgxhi5knAOAe82w+wuzPc49U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYAK+0w0jmc1JNW35Nia55aIDW8bKQyXU+PV8Sit4aXSoKh9+MeCUYqcEQ3OK6KhNNLjHOTSheidpI1FCYh8Af176RziMK0TYuYEc/LGmcFQWukAxMitzIohR+GipsR6dJ3rIB2d2snmOzupZwqnlqc8pxnqO7X6/YC3pSm2uqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J/xFbqtS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J/xFbqtS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF38B1A1DBC;
	Thu, 27 Nov 2025 08:39:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A539B6068C;
	Thu, 27 Nov 2025 08:39:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D59A8102F260E;
	Thu, 27 Nov 2025 09:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764232754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tT5X9D++8AQ5f39cwRsCj5QQMa94hrAR/HjLCHFeZLs=;
	b=J/xFbqtSBCNdGXWh5+pFiJO8MuCNgFiQWQn0NYIaS1buaZ8WRW7z3T6c051cj8NLfTLbVD
	gy/bN1BfCO6xA9Gp3KqA7xqMYCzNRDiQwwO+p9EG113e7IjFilghEidtPm5QQjGQbq6dMB
	gV6rsp7sLLIio4SmAfKU3glLbYVvG7sDv70O4AZ+IjZelsQ45xlnblwHswxLT8RGnJIr4A
	bWoW9jtbL91ZGK6zQBDtNip/AbRMjYqV1ScJuG6bp0s6BNbOUcQC3yrHe1UlUSxJcKQr0a
	qOf1NDIpZJpRo2KDJ5JM0Lu44Z1mi/j0QS7z2Pr3qRzWNtZjxwY9cQsWvZSJGw==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Thu, 27 Nov 2025 09:38:55 +0100
Subject: [PATCH RFC v2 1/4] firmware: ti_sci: add BOARDCFG_MANAGED mode
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-1-a487fa3ff221@bootlin.com>
References: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
In-Reply-To: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

In BOARDCFG_MANAGED mode, the low power mode configuration is done
statically for the DM via the boardcfg. Constraints are not supported, and
prepare_sleep() is not needed.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 10 +++++++---
 drivers/firmware/ti_sci.h |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index d1faa47576199..4afe1c4872ff8 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3693,8 +3693,11 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
 			return ti_sci_cmd_prepare_sleep(&info->handle,
 							TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED,
 							0, 0, 0);
+		} else if (info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED) {
+			/* Nothing to do in the BOARDCFG_MANAGED mode */
+			return 0;
 		} else {
-			/* DM Managed is not supported by the firmware. */
+			/* DM Managed and BoardCfg Managed are not supported by the firmware. */
 			dev_err(info->dev, "Suspend to memory is not supported by the firmware\n");
 			return -EOPNOTSUPP;
 		}
@@ -3932,12 +3935,13 @@ static int ti_sci_probe(struct platform_device *pdev)
 	}
 
 	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
-	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s\n",
+	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s\n",
 		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
-		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : ""
+		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
+		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : ""
 	);
 
 	ti_sci_setup_ops(info);
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 7559cde17b6cc..3638c68351705 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -150,6 +150,7 @@ struct ti_sci_msg_req_reboot {
  *		MSG_FLAG_CAPS_LPM_DM_MANAGED: LPM can be managed by DM
  *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
  *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
+ *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically for the DM via boardcfg
  *
  * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
  * providing currently available SOC/firmware capabilities. SoC that don't
@@ -162,6 +163,7 @@ struct ti_sci_msg_resp_query_fw_caps {
 #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
 #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
 #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
+#define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(10)
 #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
 	u64 fw_caps;
 } __packed;

-- 
2.51.0

