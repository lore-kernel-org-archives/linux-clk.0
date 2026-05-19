Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487953AFCF7;
	Tue, 19 May 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203235; cv=none; b=D5T/WMDxCOThFes2xKKbz4I6KLe0jFeR4UtIOHTcwrFABRV2BqaeioKLKbdOAM9UnAe0drF2tMFmZo5jdmmACmZUHCOfGEYG3qovhmDjsAmc1IWB/GMNJ4SPQSVU7zAyK3vNCKQDMPtEDswur4uI+XgaFtoTicoXTg2sShaVc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203235; c=relaxed/simple;
	bh=5zlMNkF6ZSMC1mI9ibmcHgg23KBECfDr8t8Gd6b4wOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggItPgPkfm5inw9mvJ1iUo88mL6BVKVVLB7GaI0UFs7CGetcAnIbjnDfHlieCnHHsk5SODqfisqVaKe3NX34fhzuRAsjGSKmy9kYWyN9o7vcqO/Z4rijhqv/72oY9pldINAoWxMyJJIs3UyjAhBtEvP0su9SKIXaEguxVKnCp4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SoqECM2l; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SoqECM2l"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31346C5DC78;
	Tue, 19 May 2026 15:08:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E794B5FFC8;
	Tue, 19 May 2026 15:07:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5760107E9447;
	Tue, 19 May 2026 17:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779203232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YliU0SqTVIFTPQYQo+zUBoJDL7BLjGL23Z606hla9Qk=;
	b=SoqECM2lCSr9g2u3eeg+mMKFPpKsH9SKuGnpxTQblTm4wz9aQmWAiYT1qFlYmZFEADVFwb
	gwES1ZruI21gM4oVwHFxjVQYom7yHRSJRzMphMdWjYCIwFk5coTMvx9xViOU2l5aRUurh4
	totr8JsyKCv5k4nk/GirN/2CRqShUZ43m/r+9tUxURpbNdH78LJs2Km7Cx3PJN7ehqIHBc
	XMHq2/Tt44s7B305/63k9OMmOWk+iseVdVJB9Q6ryQHt5Yzx35HSlpTqCGSdwnrhucOpxo
	BIxQtf74GSoF4G2NqBENP6BBuTJAuXdigv/rsoOYoZVBEih+zDXBbrzfcLmW4A==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Tue, 19 May 2026 17:06:59 +0200
Subject: [PATCH v9 4/4] firmware: ti_sci: add support for restoring clock
 context during resume
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-ti-sci-jacinto-s2r-restore-irq-v9-4-c550a8ae0f31@bootlin.com>
References: <20260519-ti-sci-jacinto-s2r-restore-irq-v9-0-c550a8ae0f31@bootlin.com>
In-Reply-To: <20260519-ti-sci-jacinto-s2r-restore-irq-v9-0-c550a8ae0f31@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Some DM-Firmware are not able to restore the clock rates and the clock
parents after a suspend-resume. The CLK_CONTEXT_LOST firmware capability
has been introduced to identify this characteristic. In this case the
responsibility is therefore delegated to the ti_sci driver, which uses
clk_restore_context() to trigger the context_restore() operation for all
registered clocks, including those managed by the sci-clk. The sci-clk
driver implements the context_restore() operation to ensure rates and clock
parents are correctly restored.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 9 +++++++--
 drivers/firmware/ti_sci.h | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index e42cce4298a8..29caa33dbc4d 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
@@ -4012,6 +4013,9 @@ static int ti_sci_resume_noirq(struct device *dev)
 				}
 			}
 		}
+
+		if (info->fw_caps & MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST)
+			clk_restore_context();
 		break;
 	default:
 		break;
@@ -4172,14 +4176,15 @@ static int ti_sci_probe(struct platform_device *pdev)
 	}
 
 	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
-	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s\n",
+	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s%s\n",
 		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
 		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : ""
+		info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : "",
+		info->fw_caps & MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST ? " Clk-Context-Lost" : ""
 	);
 
 	ti_sci_setup_ops(info);
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index ad69c765d614..8fccbcd1c9a2 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -154,6 +154,8 @@ struct ti_sci_msg_req_reboot {
  *			for the DM via boardcfg
  *		MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: DM is not able to restore IRQ
  *			context
+ *		MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST: DM is not able to restore
+ *			Clock context
  *
  * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
  * providing currently available SOC/firmware capabilities. SoC that don't
@@ -168,6 +170,7 @@ struct ti_sci_msg_resp_query_fw_caps {
 #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
 #define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
 #define MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST	TI_SCI_MSG_FLAG(14)
+#define MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST	TI_SCI_MSG_FLAG(15)
 #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
 	u64 fw_caps;
 } __packed;

-- 
2.53.0

