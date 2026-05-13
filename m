Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544A7423A7C;
	Wed, 13 May 2026 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676403; cv=none; b=TgCCJpyQM2ZXuQvR/rVmD5dsQCkGy6GQxxTirk/6Qoi4p2IpZ86YfLtDDjrAfQpEQHipqQekBJXs2Yqs+Q3xrhV1FXAXS/Hkwa7p2bQTSSv7SMaic93P9deZl5s5pM5uI5YfWwD1tKnAUco54/fwhSz6ejNJ7eY7/+bSsX0Po7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676403; c=relaxed/simple;
	bh=ElRYnTWngdhpoAfbPWzTtdhaDN4SIaSNaee9d0X1qtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRXn5+DIl8DYjA8E2Bq7ZF6gk5zG9HVBA+o+DYCOq4d02ALwnYUfz8cPE7Zmon/oi2g/fJ40KbTBzDIhRi6BLBG3WK43oN3PCnvqInK0zvmBKKLKzBZscqVF75pWczhV8ZQO4kgkKr2V+OZtWawXlhXBcf176ugNQyILTzVQfYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qp9CAPln; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qp9CAPln"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA56A1A3596;
	Wed, 13 May 2026 12:46:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF0435FE21;
	Wed, 13 May 2026 12:46:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84BDF11AF8D31;
	Wed, 13 May 2026 14:46:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778676398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hmYbtkhOi7mFxa8E1rD1eqvuX38zQrTTZJJctqMVrmo=;
	b=Qp9CAPln5+7UP5w3i0bsiPwq6M9D+ZDNA08Ycq0+t5BjCSTbreO36jHZeZHyYaHEtSW11X
	hIVddL+KO36IJYwcE+CLPKMvln81EDw8qGU89dIE/aAnac7Y4/JL1+s8REjlDDlUsz+eW/
	vQ27siMlR+OE5mnjFsmYo7XgAIYObaLQ78gEa4Tj7qnt6scc3e7bQUWPV8Yw3HYMajxKlm
	clyH33wqgsajdzc0kVtodHWct/DlERsPX4rVeaMUBPvpW1iOigcC8nVS6GeeHK46zF5Ou8
	y/0IaSN1Jdy2JwixOp0DwNRmAbIASPOKAaEbWuypyLLSZCU3DlgZmkr+iLmcCg==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Wed, 13 May 2026 14:46:24 +0200
Subject: [PATCH v8 2/4] firmware: ti_sci: add support for restoring IRQs
 during resume
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-2-195b27f91519@bootlin.com>
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

Some DM-Firmware are not able to restore the IRQ context after a
suspend-resume. The IRQ_CONTEXT_LOST firmware capability has been
introduced to identify this characteristic. In this case the
responsibility is delegated to the ti_sci driver, which maintains an
internal list of all requested IRQs. This list is updated on each
set()/free() operation, and all IRQs are restored during the resume_noirq()
phase.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 201 +++++++++++++++++++++++++++++++++++++++++++---
 drivers/firmware/ti_sci.h |   3 +
 2 files changed, 192 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index eaeaaae94142..35ee8cc830c8 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -12,11 +12,13 @@
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
+#include <linux/hashtable.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -87,6 +89,16 @@ struct ti_sci_desc {
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
@@ -101,6 +113,8 @@ struct ti_sci_desc {
  * @chan_rx:	Receive mailbox channel
  * @minfo:	Message info
  * @node:	list head
+ * @irqs:	List of allocated irqs
+ * @irq_lock:	Protection for irq hash list
  * @host_id:	Host ID
  * @fw_caps:	FW/SoC low power capabilities
  * @users:	Number of users of this instance
@@ -118,6 +132,8 @@ struct ti_sci_info {
 	struct mbox_chan *chan_rx;
 	struct ti_sci_xfers_info minfo;
 	struct list_head node;
+	DECLARE_HASHTABLE(irqs, 8);
+	struct mutex irq_lock;
 	u8 host_id;
 	u64 fw_caps;
 	/* protected by ti_sci_list_mutex */
@@ -2301,6 +2317,32 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
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
@@ -2324,15 +2366,60 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
 			  u16 dst_host_irq, u16 ia_id, u16 vint,
 			  u16 global_event, u8 vint_status_bit, u8 s_host)
 {
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq *desc;
+	struct ti_sci_irq *irq;
+	int ret;
+
+	/*
+	 * Lock for set_irq() and free_irq() to keep the IRQ hash list
+	 * consistent only if MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST is set. Else
+	 * IRQ hash list is not used.
+	 */
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
+		mutex_lock(&info->irq_lock);
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
+		goto end;
+
+	irq = kzalloc_obj(*irq, GFP_KERNEL);
+	if (!irq) {
+		ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				  dst_id, dst_host_irq, ia_id, vint,
+				  global_event, vint_status_bit, s_host,
+				  TI_SCI_MSG_FREE_IRQ);
+		ret = -ENOMEM;
+		goto end;
+	}
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
+end:
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
+		mutex_unlock(&info->irq_lock);
+	return ret;
 }
 
 /**
@@ -2358,15 +2445,56 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
 			   u16 dst_host_irq, u16 ia_id, u16 vint,
 			   u16 global_event, u8 vint_status_bit, u8 s_host)
 {
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq irq_desc;
+	struct device *dev = info->dev;
+	struct ti_sci_irq *this_irq;
+	struct hlist_node *tmp_node;
+	int ret;
+
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
+		mutex_lock(&info->irq_lock);
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
+		goto end;
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
+			goto end;
+		}
+	}
+
+	dev_warn(dev, "%s: should not be here, IRQ was not found in hash list\n",
+		 __func__);
+
+end:
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
+		mutex_unlock(&info->irq_lock);
+	return ret;
 }
 
 /**
@@ -3847,7 +3975,10 @@ static int ti_sci_suspend_noirq(struct device *dev)
 static int ti_sci_resume_noirq(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
-	int ret = 0;
+	struct ti_sci_msg_req_manage_irq *irq_desc;
+	struct ti_sci_irq *irq;
+	struct hlist_node *tmp_node;
+	int ret = 0, err = 0, i;
 	u32 source;
 	u64 time;
 	u8 pin;
@@ -3859,13 +3990,50 @@ static int ti_sci_resume_noirq(struct device *dev)
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
+				if (ret) {
+					dev_err(dev, "failed to restore IRQ with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d, via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
+						irq_desc->valid_params,
+						irq_desc->src_id,
+						irq_desc->src_index,
+						irq_desc->dst_id,
+						irq_desc->dst_host_irq,
+						irq_desc->ia_id,
+						irq_desc->vint,
+						irq_desc->global_event,
+						irq_desc->vint_status_bit);
+					err = ret;
+				}
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
 		dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
 			 source, pin, mode);
 
-	return 0;
+	return err;
 }
 
 static void ti_sci_pm_complete(struct device *dev)
@@ -4014,13 +4182,14 @@ static int ti_sci_probe(struct platform_device *pdev)
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
@@ -4053,6 +4222,14 @@ static int ti_sci_probe(struct platform_device *pdev)
 	list_add_tail(&info->node, &ti_sci_list);
 	mutex_unlock(&ti_sci_list_mutex);
 
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST) {
+		ret = devm_mutex_init(dev, &info->irq_lock);
+		if (ret)
+			goto out;
+
+		hash_init(info->irqs);
+	}
+
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "platform_populate failed %pe\n", ERR_PTR(ret));
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index d5e06769b01c..ad69c765d614 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -152,6 +152,8 @@ struct ti_sci_msg_req_reboot {
  *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
  *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically
  *			for the DM via boardcfg
+ *		MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: DM is not able to restore IRQ
+ *			context
  *
  * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
  * providing currently available SOC/firmware capabilities. SoC that don't
@@ -165,6 +167,7 @@ struct ti_sci_msg_resp_query_fw_caps {
 #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
 #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
 #define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
+#define MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST	TI_SCI_MSG_FLAG(14)
 #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
 	u64 fw_caps;
 } __packed;

-- 
2.53.0

