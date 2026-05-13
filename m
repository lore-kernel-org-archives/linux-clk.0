Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D14266BE
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676408; cv=none; b=gMssP3yhjDEDp7ygI7t0xyEyicOcTLgb109nYLaTUKr3VsRmspV/ml51m3UTj/i5K10y96mj/82ohth/vGIyBuQqDnx/a7V8ZmFKeIODh4fsfdS98/l86mxF5R6A31rSkSidZBtxl6s0fY/qSrzaP9IpbOfJb9zzGP2WH/SzaEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676408; c=relaxed/simple;
	bh=mn9v4Jci0YOwIvdmXT9J7xZkE341zUlyuNaWPr+XMHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzwZKSVFBSAmry2oCHWlE3GdUxoUJQW1TFe34VAuUYURDkUKY35LtAFDywXEZXP3jY1tLjPyhuypHX+twzbIxcguIpQyq4eK5HNqoUf03o+0DRMucDRwQPsjdzPgzGCue/o75PsyNsIRCu3AMh3lg+Uv94MHWkzNki/H9nDMUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tmXHKE1E; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tmXHKE1E"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D40554E42C90;
	Wed, 13 May 2026 12:46:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A82B85FE21;
	Wed, 13 May 2026 12:46:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C28611AF9021;
	Wed, 13 May 2026 14:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778676402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p14WDIXpDS2Y/643k25wA4EWCTYbuLSUg5gK5bpvta8=;
	b=tmXHKE1Eh9ntOS2F2G/41OYWgbw2bAilGGKnpnzaW/+PY3QPapMZpRSQl9GStfeT0T64wy
	qwJgU3DDyQvLi2IaSLmSwSs8I/jsZbVOTy8I5TDmBBtqSN04LHCX0ugyUCSn5scHVdY5Cm
	rRVM/WClUuVftnHQd98erQQ2PcbRbwGvitXe3HundiHSNltadU9DKRWMLwyIUWIn7HU5Dz
	ciFm70Kh9JrSYkVH63gZAZttSdzJ8Nqin2Wh0AXbRiOIsmCFEhyua7OeTKgiWHHHSFJhXN
	fc/c7yiCWkcKmBy+Itgd/+IE7SZFtd2y3DUEwqgSEGHvmhKojOxNZrrmUHBmuw==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Wed, 13 May 2026 14:46:26 +0200
Subject: [PATCH v8 4/4] firmware: ti_sci: add support for restoring clock
 context during resume
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-4-195b27f91519@bootlin.com>
References: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
In-Reply-To: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
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
index 35ee8cc830c8..1e58560b1dd6 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
@@ -4022,6 +4023,9 @@ static int ti_sci_resume_noirq(struct device *dev)
 				}
 			}
 		}
+
+		if (info->fw_caps & MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST)
+			clk_restore_context();
 		break;
 	default:
 		break;
@@ -4182,14 +4186,15 @@ static int ti_sci_probe(struct platform_device *pdev)
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

