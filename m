Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BA125485F
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695709; cv=none; b=RmuWQgo2xbJwJIC60Xi+7mcss6SH2twfinHB0LxmOrLy8T0DujWp7JGHUA7eYI5aWu4eLPDum/aWkcqlHuPj/mCwOkTQbXYwKsVqPL6lHdOoXPZB5diwgiZHuETZT24RDi9txTqUDuTx8qFxBkG5qM6YlqpRkolkHteO+j2/rTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695709; c=relaxed/simple;
	bh=2D2pCQzookgwdAAtHFuVK0XP30EwZIqIZ0Ic1dDvTa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gidD/wU08I0vK+2fRAZCpwggWeWOVFcJ8PbFjWSIO4i4SU4ty00UQA4VKLxcpnZ/VdecO3E02UKyqzz+eiTGi3DxM7jd3JU+nUPEF7cC36yf5ULfaTe/Z6fl8XsYhVnh5GAOl3GgGswq/nyhINAYXInCJURdheMi4c4i84QMlM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=O21JBu3+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="O21JBu3+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-236470b2dceso36254585ad.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695707; x=1754300507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIg/1GBTKsBFC54o9wzP/NH34EZtppmVu7UpxaXegaQ=;
        b=O21JBu3+OquTQ3kxY/fAqBJybtCPDRIjRC+dugIYcZ7Klq6L06relZCz3bzpfWfUyL
         +7krQ2Nb511x/JE6QQNnAtRxWGcg8D82KlCk/AmHcpPYRA0fN0/SRTS0M5JJAGC/PZ5d
         ZlWGpohSFJ8c78VpABtkUVo5+Y65I/fas0V8UWT87j5JzD+sf+RRIQoWVpT2gT6yoThK
         yGE7RKupwPA6YjGJW4t7BSC+8xgRqRhORjScNCFzDeDqxuZvWBqlFIfPah+TmPLZmCgo
         NFYYxIraR5MOiKgYND9vcLtyGSHfD0ktCjxZBO436feiBwipKekPZIE9xt6VIAJpXcaL
         tbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695707; x=1754300507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIg/1GBTKsBFC54o9wzP/NH34EZtppmVu7UpxaXegaQ=;
        b=bnkVZm2dsot54jd7GFCbHMu8bQDThrAfZAN/cE5/c0KAHbaqKGddFcLiQ9k/qqXZAl
         c/q/YgZ+8zrDzL39UuLqkAZHjaP7gSzXfDLsTQtHSkpz/yPFIlr4uniLoyd1HUVac03W
         kQy2Ao8ffswvdf47s8z84rihBQPF9ZNkt5exXJ5cW4dPWiPiwkyqGaZVCavZg31yxl5H
         XKzdx9fw+HOU/tYbaHhQoSV4vZOzWKR+fnhgQIuPaZEUtwcxVqH1NHMmkG54FkBcNEHr
         WIdbPJ6iWWEcOV1Vv/MlBDmsd6b211f0Bf+Ce4DYPRZVDvTzsT3eL5NkR71L+WrYc8gO
         9T7w==
X-Forwarded-Encrypted: i=1; AJvYcCVAIP66y561Yq7F4pP6uQ4tlsT6WldlCEOPYOUjN7KURSCbgFUjOcn9qYnHdC3Amb6lWQgNdBg8Dyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9maFxOyk9Vb/gPsB+rQ9A2skfSWkW8G5Obx50PKUb4fj7K3J
	6oJ6AHSkNhXysooY/r2BLGEof8lC8qjTvnDG7hPZG1RC3QuI3qoIydrQGn2Ih3B0IoY=
X-Gm-Gg: ASbGncuv+MbFnMnsd2j7kO5tStbQOLTVEPfui2W1bFuVqiIJ6B4t+nWKJ+OiWtV7xhW
	BcG6D25PrPVql0l9Q7jLSfYHITK0xrdEHGrOuEPLSWVAdZhcdM79sk5iD1IU4xgWcYpDH/jgB4o
	hJxeTHyWEI+HWCyfHVvvZ38giIBc/uiSnnBsDjQxCvYGSzl71gi7JyIaPC23kF2DpCbZZWk/j+9
	l4aW1Kl4XHIypx1M+gIFQ9bxFC71Z1OCgnMDgtxXPAxSw+3Id4R0P89RHiaTC/EHZ6Gqwdu3CFI
	D3sYOeVRR4EzKZs/1m0CrTgGePVPSMFy8LFaVJ+PaZSfeF9/KAEkXVgumEl/8Y0097TVnH6hzJJ
	2cw3NRszuGD0Fci87NuGbA0Jqgex6JXN8MwAkmwf4ThzbbY9F9ICN98J0ifHJ
X-Google-Smtp-Source: AGHT+IFlHjmFiEXU2dJH97grCLi/iSNAvTJn9LNOpuW/QlLPoDnHitMrBp8pd3yh4EaT11w8/znf0A==
X-Received: by 2002:a17:902:f652:b0:23c:8f4c:6658 with SMTP id d9443c01a7336-23fb315ab2bmr140862815ad.25.1753695707124;
        Mon, 28 Jul 2025 02:41:47 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:41:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v9 05/24] mailbox: Allow controller specific mapping using fwnode
Date: Mon, 28 Jul 2025 15:10:13 +0530
Message-ID: <20250728094032.63545-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce optional fw_node() callback which allows a mailbox controller
driver to provide controller specific mapping using fwnode.

The Linux OF framework already implements fwnode operations for the
Linux DD framework so the fw_xlate() callback works fine with device
tree as well.

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/mailbox.c          | 65 ++++++++++++++++++------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae222073..2acc6ec229a4 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 
 #include "mailbox.h"
@@ -383,34 +384,56 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
-	struct device *dev = cl->dev;
+	struct fwnode_reference_args fwspec;
+	struct fwnode_handle *fwnode;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
+	struct device *dev;
+	unsigned int i;
 	int ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	dev = cl->dev;
+	if (!dev) {
+		pr_debug("No owner device\n");
 		return ERR_PTR(-ENODEV);
 	}
 
-	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
-					 index, &spec);
+	fwnode = dev_fwnode(dev);
+	if (!fwnode) {
+		dev_dbg(dev, "No owner fwnode\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	ret = fwnode_property_get_reference_args(fwnode, "mboxes", "#mbox-cells",
+						 0, index, &fwspec);
 	if (ret) {
-		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
 		return ERR_PTR(ret);
 	}
 
+	spec.np = to_of_node(fwspec.fwnode);
+	spec.args_count = fwspec.nargs;
+	for (i = 0; i < spec.args_count; i++)
+		spec.args[i] = fwspec.args[i];
+
 	scoped_guard(mutex, &con_mutex) {
 		chan = ERR_PTR(-EPROBE_DEFER);
-		list_for_each_entry(mbox, &mbox_cons, node)
-			if (mbox->dev->of_node == spec.np) {
-				chan = mbox->of_xlate(mbox, &spec);
-				if (!IS_ERR(chan))
-					break;
+		list_for_each_entry(mbox, &mbox_cons, node) {
+			if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
+				if (mbox->fw_xlate) {
+					chan = mbox->fw_xlate(mbox, &fwspec);
+					if (!IS_ERR(chan))
+						break;
+				} else if (mbox->of_xlate) {
+					chan = mbox->of_xlate(mbox, &spec);
+					if (!IS_ERR(chan))
+						break;
+				}
 			}
+		}
 
-		of_node_put(spec.np);
+		fwnode_handle_put(fwspec.fwnode);
 
 		if (IS_ERR(chan))
 			return chan;
@@ -427,15 +450,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
 struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name)
 {
-	struct device_node *np = cl->dev->of_node;
-	int index;
-
-	if (!np) {
-		dev_err(cl->dev, "%s() currently only supports DT\n", __func__);
-		return ERR_PTR(-EINVAL);
-	}
+	int index = device_property_match_string(cl->dev, "mbox-names", name);
 
-	index = of_property_match_string(np, "mbox-names", name);
 	if (index < 0) {
 		dev_err(cl->dev, "%s() could not locate channel named \"%s\"\n",
 			__func__, name);
@@ -470,9 +486,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
-static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+static struct mbox_chan *fw_mbox_index_xlate(struct mbox_controller *mbox,
+					     const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -523,8 +538,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	scoped_guard(mutex, &con_mutex)
 		list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index ad01c4082358..80a427c7ca29 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -66,6 +66,7 @@ struct mbox_chan_ops {
  *			no interrupt rises. Ignored if 'txdone_irq' is set.
  * @txpoll_period:	If 'txdone_poll' is in effect, the API polls for
  *			last TX's status after these many millisecs
+ * @fw_xlate:		Controller driver specific mapping of channel via fwnode
  * @of_xlate:		Controller driver specific mapping of channel via DT
  * @poll_hrt:		API private. hrtimer used to poll for TXDONE on all
  *			channels.
@@ -79,6 +80,8 @@ struct mbox_controller {
 	bool txdone_irq;
 	bool txdone_poll;
 	unsigned txpoll_period;
+	struct mbox_chan *(*fw_xlate)(struct mbox_controller *mbox,
+				      const struct fwnode_reference_args *sp);
 	struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
 				      const struct of_phandle_args *sp);
 	/* Internal to API */
-- 
2.43.0

