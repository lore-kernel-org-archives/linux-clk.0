Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C014442315B;
	Wed, 13 May 2026 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676400; cv=none; b=KkzofWALZAx18vrDOLhWNpRA9ToSF/6mwUUGGHQtQ+brnw0weGqySDkswQhf3oC3j7NJ6KoWw02l0w5ypeIXAjg2EgJMlCHGJXiwsu4CkyKbrbRwhokozW+K0/ork7SCz82sFDNq4gyMZz78o984Bbkw78kmsiekYF60Hm0WNu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676400; c=relaxed/simple;
	bh=EjYJ7A5Qy1sodLBAVGnmWXpV2T6Zyw7nNfKiG2nplrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXnX6xxYsKHq6ymhOi43M45BdQlYqw5HsyFHbwdgHEN7ecD7oXx8aoNKtVmnss+C1hXrxio3uqTWbkxx9c3DFnIkj/RRDxwtCiwJ1t57zSQOPgGvMmwaBVaBfc87TOGtnvnYNlFo69dV3Af3iNCZClUa7J2drnrMzmKQzv5suS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xtaBPv7v; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xtaBPv7v"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5A56C5DC5B;
	Wed, 13 May 2026 12:47:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67EC15FE21;
	Wed, 13 May 2026 12:46:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DEC711AF9021;
	Wed, 13 May 2026 14:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778676396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gr9vUBUUEIYJs7gctY1dhD6Mbvo1bpv8AgjGvmqCtXo=;
	b=xtaBPv7v3g+it9QKcMqBPBP44bT/m/l5NqcedkU6NvEGwVIZLf2SHC/+q5cXjzSMQCI3WN
	x6mvhyAhRk/EZtkmbmw4iZWoT4Er2DMiQQkQnAsaxz+jINZTo87hpkdpwzpDwWXME+kKlS
	QqnSSl3qwT3wk479HXbnejw98Tlv3c/DMYLMOnYfTK619VrbcGr28CtTCZUL/voVz5zHlj
	GaVVibjj8OWccNJxcZBAcrgiixmzo8pwQvrZCiM+RwGhXL571Mt6OpBklyMxUQBVoFoE1N
	h40x5wVuBdpc8j6YJaKs7UnjfvY1fkLS9SUngAvG+Vo9ADtsOzrEHKhQuQoM9w==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Wed, 13 May 2026 14:46:23 +0200
Subject: [PATCH v8 1/4] firmware: ti_sci: add BOARDCFG_MANAGED mode support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-1-195b27f91519@bootlin.com>
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

In BOARDCFG_MANAGED mode, the low power mode configuration is done
statically for the DM via the boardcfg. Constraints are not supported, and
prepare_sleep() is not needed.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 10 +++++++---
 drivers/firmware/ti_sci.h |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index dd9911b1cc11..eaeaaae94142 100644
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
index 4616127e33ff..d5e06769b01c 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -150,6 +150,8 @@ struct ti_sci_msg_req_reboot {
  *		MSG_FLAG_CAPS_LPM_DM_MANAGED: LPM can be managed by DM
  *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
  *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
+ *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically
+ *			for the DM via boardcfg
  *
  * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
  * providing currently available SOC/firmware capabilities. SoC that don't
@@ -162,6 +164,7 @@ struct ti_sci_msg_resp_query_fw_caps {
 #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
 #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
 #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
+#define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
 #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
 	u64 fw_caps;
 } __packed;

-- 
2.53.0

