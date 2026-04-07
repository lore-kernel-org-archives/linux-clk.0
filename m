Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9BA3B636B;
	Tue,  7 Apr 2026 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571930; cv=none; b=TDNlFlLqJ8GzPvhyMEeKakosVQ5SUfvC2YN8PylVxImhIFb2+TcMg7PGdj4Plu2S3BgBe2YsTUA99ERo7A/EtJy1yVwdyj1nuvDOaA4dzuJUfghdD8qsePdfRSeFrlOLhxgIXzTOQTwcP/seJBzSxbTCFemNXd2iP9G4h25FwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571930; c=relaxed/simple;
	bh=Ks+waRkSUzy+GLZFcbPMVuAzuo3Ae+uTvMSOQlCbfiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzY47zdF/Hx88uf/KhcEl/+YjYd932ndAehGVEwWnrSVVUtxv8bghNt4ZMwawh6IsrnKG9jHCkr3JkfFA7pePg8vQODc8+rk34LWuiXaApnzsAEAH7C+4lM1PdYsPgLGWIQtPsRe2zJjd145y9M02O8kmn9G6yhIf8Vhgi1r5oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KOZExLBZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KOZExLBZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F1395C5B18E;
	Tue,  7 Apr 2026 14:25:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F00D603C7;
	Tue,  7 Apr 2026 14:25:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45AF210450229;
	Tue,  7 Apr 2026 16:25:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775571924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dL4dsqMjMrwqyoL9nvkjgCSi52nSoW/ZUZWX1IgXInE=;
	b=KOZExLBZDXrhnlaSmlaBl1w0gAJPfcOQqb9pxxUjrgMrWSQqYJgvZbVyFDMc9aP+KkpVqq
	Sh/sYUPGO4iibTJV3OYuzfpGiwWJRiborOBzHGvk9EzUqK4DEsWqestGtmBZdbDP53fnxn
	NMEv1p95znpaeTtfkleZ7+7LN2TKtFILGc7Gh3SOYDS0vj9AdoniSuyQ7djTIpm4BA5Cfx
	BmqWB9DEbANZfviaIiSeRajlB6g4Vp5RKdH1THXHdClDJ6zQUNBRvCScjXU/CNzDlpY6pj
	cfG+L21xmidLaVdmMdzuG2iDRMs9y9AIvZKDVCIOkd/A7fuQVTzn3POa1mGnyA==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Tue, 07 Apr 2026 16:25:07 +0200
Subject: [PATCH v5 2/4] firmware: ti_sci: add support for restoring IRQs
 during resume
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-2-97b28f2d93f9@bootlin.com>
References: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
In-Reply-To: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
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
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Some DM-Firmware are not able to restore the IRQ context after a
suspend-resume. The IRQ_CONTEXT_LOST firmware capability has been
introduced to identify this characteristic. In this case the
responsibility is delegated to the ti_sci driver, which maintains an
internal list of all requested IRQs. This list is updated on each
set()/free() operation, and all IRQs are restored during the resume_noirq()
phase.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 153 ++++++++++++++++++++++++++++++++++++++++++----
 drivers/firmware/ti_sci.h |   2 +
 2 files changed, 144 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index eaeaaae94142..b5c4324287b0 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -12,6 +12,7 @@
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
+#include <linux/hashtable.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -87,6 +88,16 @@ struct ti_sci_desc {
 	int max_msg_size;
 };
 
+/**
+ * struct ti_sci_irq - Description of allocated irqs
+ * @node: Link to hash table
+ * @desc: Description of the irq
+ */
+struct ti_sci_irq {
+	struct hlist_node node;
+	struct ti_sci_msg_req_manage_irq desc;
+};
+
 /**
  * struct ti_sci_info - Structure representing a TI SCI instance
  * @dev:	Device pointer
@@ -101,6 +112,7 @@ struct ti_sci_desc {
  * @chan_rx:	Receive mailbox channel
  * @minfo:	Message info
  * @node:	list head
+ * @irqs:	List of allocated irqs
  * @host_id:	Host ID
  * @fw_caps:	FW/SoC low power capabilities
  * @users:	Number of users of this instance
@@ -117,6 +129,7 @@ struct ti_sci_info {
 	struct mbox_chan *chan_tx;
 	struct mbox_chan *chan_rx;
 	struct ti_sci_xfers_info minfo;
+	DECLARE_HASHTABLE(irqs, 8);
 	struct list_head node;
 	u8 host_id;
 	u64 fw_caps;
@@ -2301,6 +2314,32 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	return ret;
 }
 
+/**
+ * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
+ * @irq:	irq to hash
+ *
+ * Return: the computed hash value.
+ */
+static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
+{
+	return irq->src_id ^ irq->src_index;
+}
+
+/**
+ * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
+ *                       compared)
+ * @irq_a:	irq_a to compare
+ * @irq_b:	irq_b to compare
+ *
+ * Return: true if the two irqs are equal, else false.
+ */
+static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
+			     struct ti_sci_msg_req_manage_irq *irq_b)
+{
+	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
+		       sizeof(*irq_a) - sizeof(irq_a->hdr));
+}
+
 /**
  * ti_sci_set_irq() - Helper api to configure the irq route between the
  *		      requested source and destination
@@ -2324,15 +2363,43 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
 			  u16 dst_host_irq, u16 ia_id, u16 vint,
 			  u16 global_event, u8 vint_status_bit, u8 s_host)
 {
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq *desc;
+	struct ti_sci_irq *irq;
+	int ret;
+
 	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
 		 __func__, valid_params, src_id, src_index,
 		 dst_id, dst_host_irq, ia_id, vint, global_event,
 		 vint_status_bit);
 
-	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				 dst_id, dst_host_irq, ia_id, vint,
-				 global_event, vint_status_bit, s_host,
-				 TI_SCI_MSG_SET_IRQ);
+	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				dst_id, dst_host_irq, ia_id, vint,
+				global_event, vint_status_bit, s_host,
+				TI_SCI_MSG_SET_IRQ);
+
+	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
+		return ret;
+
+	irq = kzalloc_obj(*irq, GFP_KERNEL);
+	if (!irq)
+		return -ENOMEM;
+
+	desc = &irq->desc;
+	desc->valid_params = valid_params;
+	desc->src_id = src_id;
+	desc->src_index = src_index;
+	desc->dst_id = dst_id;
+	desc->dst_host_irq = dst_host_irq;
+	desc->ia_id = ia_id;
+	desc->vint = vint;
+	desc->global_event = global_event;
+	desc->vint_status_bit = vint_status_bit;
+	desc->secondary_host = s_host;
+
+	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
+
+	return 0;
 }
 
 /**
@@ -2358,15 +2425,46 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
 			   u16 dst_host_irq, u16 ia_id, u16 vint,
 			   u16 global_event, u8 vint_status_bit, u8 s_host)
 {
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq irq_desc;
+	struct ti_sci_irq *this_irq;
+	struct hlist_node *tmp_node;
+	int ret;
+
 	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
 		 __func__, valid_params, src_id, src_index,
 		 dst_id, dst_host_irq, ia_id, vint, global_event,
 		 vint_status_bit);
 
-	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				 dst_id, dst_host_irq, ia_id, vint,
-				 global_event, vint_status_bit, s_host,
-				 TI_SCI_MSG_FREE_IRQ);
+	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				dst_id, dst_host_irq, ia_id, vint,
+				global_event, vint_status_bit, s_host,
+				TI_SCI_MSG_FREE_IRQ);
+
+	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
+		return ret;
+
+	irq_desc.valid_params = valid_params;
+	irq_desc.src_id = src_id;
+	irq_desc.src_index = src_index;
+	irq_desc.dst_id = dst_id;
+	irq_desc.dst_host_irq = dst_host_irq;
+	irq_desc.ia_id = ia_id;
+	irq_desc.vint = vint;
+	irq_desc.global_event = global_event;
+	irq_desc.vint_status_bit = vint_status_bit;
+	irq_desc.secondary_host = s_host;
+
+	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
+				    ti_sci_irq_hash(&irq_desc)) {
+		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
+			hlist_del(&this_irq->node);
+			kfree(this_irq);
+			return 0;
+		}
+	}
+
+	return 0;
 }
 
 /**
@@ -3847,7 +3945,10 @@ static int ti_sci_suspend_noirq(struct device *dev)
 static int ti_sci_resume_noirq(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
-	int ret = 0;
+	struct ti_sci_msg_req_manage_irq *irq_desc;
+	struct ti_sci_irq *irq;
+	struct hlist_node *tmp_node;
+	int ret = 0, i;
 	u32 source;
 	u64 time;
 	u8 pin;
@@ -3859,6 +3960,32 @@ static int ti_sci_resume_noirq(struct device *dev)
 			return ret;
 	}
 
+	switch (pm_suspend_target_state) {
+	case PM_SUSPEND_MEM:
+		if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST) {
+			hash_for_each_safe(info->irqs, i, tmp_node, irq, node) {
+				irq_desc = &irq->desc;
+				ret = ti_sci_manage_irq(&info->handle,
+							irq_desc->valid_params,
+							irq_desc->src_id,
+							irq_desc->src_index,
+							irq_desc->dst_id,
+							irq_desc->dst_host_irq,
+							irq_desc->ia_id,
+							irq_desc->vint,
+							irq_desc->global_event,
+							irq_desc->vint_status_bit,
+							irq_desc->secondary_host,
+							TI_SCI_MSG_SET_IRQ);
+				if (ret)
+					return ret;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+
 	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
 	/* Do not fail to resume on error as the wake reason is not critical */
 	if (!ret)
@@ -4014,13 +4141,14 @@ static int ti_sci_probe(struct platform_device *pdev)
 	}
 
 	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
-	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s\n",
+	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s\n",
 		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
 		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : ""
+		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : "",
+		info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : ""
 	);
 
 	ti_sci_setup_ops(info);
@@ -4053,6 +4181,9 @@ static int ti_sci_probe(struct platform_device *pdev)
 	list_add_tail(&info->node, &ti_sci_list);
 	mutex_unlock(&ti_sci_list_mutex);
 
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
+		hash_init(info->irqs);
+
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "platform_populate failed %pe\n", ERR_PTR(ret));
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index d90de59e29eb..67f16e8c69a1 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -151,6 +151,7 @@ struct ti_sci_msg_req_reboot {
  *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
  *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
  *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically for the DM via boardcfg
+ *		MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: DM is not able to restore IRQ context
  *
  * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
  * providing currently available SOC/firmware capabilities. SoC that don't
@@ -164,6 +165,7 @@ struct ti_sci_msg_resp_query_fw_caps {
 #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
 #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
 #define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
+#define MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST	TI_SCI_MSG_FLAG(14)
 #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
 	u64 fw_caps;
 } __packed;

-- 
2.53.0

