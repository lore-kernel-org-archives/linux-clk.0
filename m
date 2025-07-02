Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFF1F463A
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433286; cv=none; b=ru2gAsfq8slN+KDmYlJY2DQf2inJlUmKwgl8/0nr6WLGRz3dPbyntsFsHb6qdMTgLbM5EpmbiCHoz1/TiBwCdOARXf/smvy6+mNEeffAzbsgsP+CRf1NXthwPrd90dK+GHpkiZlhwVUjEPZkRRq2G61RVFXlwF+NYIQTszdgzWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433286; c=relaxed/simple;
	bh=eP0nLjelGbOd1owGOdUwIHJWAQpQfBfflyMTXkP8FKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ky9VdJxyyI8Ju+LyJddI3xGG/PpMOGdg0bTyOj8g0yWYdjjBC+kBGuw9lDjWQppOeNKOWbkhAvI9bnhq9ooiSvnOcP26n+Z9LgO6DlvYGGuLbjKPSqB3RgjfX1MsQfW2S/zRSljcztvtOSqcP8c2fN2ahhvz6R1755RYbnRXRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Dq0XblWg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Dq0XblWg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234b9dfb842so36868215ad.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433284; x=1752038084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP6ThGaZGs8MyIgO+nprUM8QR3vfVMjtp+0dcAYkEZA=;
        b=Dq0XblWgS/84zlSmjzNjs7zph1Am4Wd0xmREaSF4C7/keZPjL69r/SMTTPbk29Qrum
         i1qPoC6gT/Lf3t8X0grrZVdRh5S0oCPRPFghJA4fSm7NQqfSsZf3DgEd+nDzio11vuZ8
         3PHydDHH6ab9m5rX0oPOAgZqnC0XBz3AWUiDcCdGh7p9AWnNg9Seu1wmxkUqv7M9iCwz
         q/Iok2gVgk7k2xW2eOR1flcGBVxS8hMLppyFx7Nak4BcDO0wG7jahuzxe9nIIBVS0nI5
         /MhPLwxFBjsWi5OV4OoTZ7dE9PuFzK4J1i/Na85D2ppNdvSTLF0t1wR8dYwhuVXw9834
         R6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433284; x=1752038084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP6ThGaZGs8MyIgO+nprUM8QR3vfVMjtp+0dcAYkEZA=;
        b=VYoecvWIVsZni1SanpkOlXITl3iajq/FToPg6tk3vaPP3e/mXFaMZVzWtxAqB+1JmC
         fLYuIIEGoKfUHr2DMgdjoLWDjUZbjtyxILV7aYULRG+qL5hZwZhj+gxpHU4p6LDyBgy6
         5wg+er1u3B2JVkrBWLED+SpzRk7/KnaKxSi6B+3Rk0YhiUovRdvdx3nCGKc/qwliDb/q
         rAryopY5+7e9IX+DMvXyQccnCDx6j2FULDh0ZU2K2ST6zjUSkT9CztWFk1OieAOeWEhi
         2s3oNjDH16KU11e+V4TeK7FAwaDqzN8HHCy4jOET+bw+bzDskuEz0p7TAuRrKjTGQ/DN
         YW1g==
X-Forwarded-Encrypted: i=1; AJvYcCUsxXoJiO2aw303IuyokX+fTzEoGSKa5qvV1I2NB4Ka8eQI4Og7VnbRM0tdNTPyz8hTHiWBq2t8XZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YznuJ02wrpqXLaM0Kh6XOeqLcQ60iwxP1WrRSxn3gR+Z/RymLnt
	XKT4vzDKA/YTbh4SbkFTYMNtk3tLwnqatBlCR9YRK06m008P38q11YioYpLGGkFUzeE=
X-Gm-Gg: ASbGncs4eSK6bzwESqCPiAXkvJGIGQunl/5PatvytUnggF6IxDEp1JXKed4FitM9bP2
	meOWXu1L5uCbiGb39xelZB+UfirjxfrGQkKu/ZpLVH6mVAfzly0acMcO6bnCTAE18fFU41K737P
	Gr0uSDn+mWPQ8/CLsFFZa0PnKu6JQPI0z5eT7iLdmcbl0pGAuvnKqfJ77ZkXgNzexF1Py9dduzy
	UhKt6Za7X1HjzTwmkpmOX5z6E0mJMaIs+XPlecYOgsOGkYtPRZ35k+pi/Gz1g3neaPlca3558GV
	V2hFMrsFpgTAroSLIYj0gFMzi3Njd3fc3yPcsyKNlexI0CrAQogjhO873fQfp5sImhYGpNzlVEG
	oK+uxE2FGuBOi1XhX
X-Google-Smtp-Source: AGHT+IHW6+yjygzJaRYVJbk398vw/ZCnNjzG8uYmd5NcS+WaiG0hLE/XIX5nmwnliNsaVR742l1nrQ==
X-Received: by 2002:a17:903:1a2e:b0:232:59b:58fe with SMTP id d9443c01a7336-23c6e4d6e93mr19975825ad.1.1751433284391;
        Tue, 01 Jul 2025 22:14:44 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:43 -0700 (PDT)
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
Subject: [PATCH v7 05/24] mailbox: Allow controller specific mapping using fwnode
Date: Wed,  2 Jul 2025 10:43:26 +0530
Message-ID: <20250702051345.1460497-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
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

