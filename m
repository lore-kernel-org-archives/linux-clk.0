Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E684427AC54
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944929; cv=none; b=VKNT6FTtNrgKhi/MAdLWHgMKNLQXmwk6xvlJR0i/s5ayBTjiCxOoGbMeTQ41ENmuoyDaoInGB4wiIclZshuG4/yF+200CVbv6yA/Jnz0lvG9u08xNADFQ7KIifc52wbWeiqr301NT2Ug98x89wBkSK8mQkM2yuV997VnNsb7+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944929; c=relaxed/simple;
	bh=6ooHVqkgaufBWaXV7TT6QR+J/ssAuon/HlFiDxRvLTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7GRiOjX/YDvrLSzUbGLauc8BhUZvGDvnxMXkiqNCungtAvTTVrPUdto2Po6wS9kbuY+KSOVufg6i1/j8IvJbtVsPN7I3AJ3LBLm+KOBg5O6N9gEKg/vdFEHDBvVkGcy7tdWnUrF2i59R+1EhOf5sVxH1JmR8ZBDO4J6Pwt1D3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ywGoep1e; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ywGoep1e"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E79001A1F99;
	Fri,  5 Dec 2025 14:28:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDB0E606AC;
	Fri,  5 Dec 2025 14:28:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 664AC102F0A98;
	Fri,  5 Dec 2025 15:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764944920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0YB7fP9VENcqaQTeiiX8csIXvdpiaRJlkFQtcTuMfAU=;
	b=ywGoep1eYds3wJFO6zaJUwHC9sKGeFl4VL1TNJji0Kyp2ad4Gc/AmLtw14ZNqAHVzO3M2Y
	XvQsNN7YJy5UMtDh/o98Jj3q5kLoez+mMt2aQBlXPLHRLr19ybqcvcPA3tFeTjBisXAZe6
	2dcOIrbp+/BtuPeeREdqjognfwqGZ/E5TX/gKauiCYglHYic7KxjpPiQ0DU/uoFZZzTFi7
	IltFS+d4OjVXrUuBLMM79zqWDvenbMA1gKbdnQYtSxg474wbIBduPyvMO6+vu3NXa+y9KA
	X+oUCO8ClVjQYPVetZrsXcoqNGC/hEIJXh1YX+dY9VBwDJKyhEh2VlvogmC5DA==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Fri, 05 Dec 2025 15:28:23 +0100
Subject: [PATCH v3 1/4] firmware: ti_sci: add BOARDCFG_MANAGED mode support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-1-d06963974ad4@bootlin.com>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
In-Reply-To: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
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
index 4a277937211f6..d77b631d9c855 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3772,8 +3772,11 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
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
@@ -4011,12 +4014,13 @@ static int ti_sci_probe(struct platform_device *pdev)
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
index 91f234550c438..5f5c1ae7a19a8 100644
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

