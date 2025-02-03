Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1AE1FC7F0
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572640; cv=none; b=pSTLy/c+aICG/tvjZ9OtJKi9B6DjveVHLzDqEPqNvVoCWAou/cMh1dlCwO87E2QI4YIvzsu2vE03wwp3hTBgarwBHkJfemkh/GQ4EzTp1I7E/Y7m+fT8v6g+pKOQ4f6D/vU6IwJl0ZYILN3WdzJBQQtIZACWHpA7P/NNoY5WKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572640; c=relaxed/simple;
	bh=9w8wGjwMumRcEE6hnGXig5P3qw6fsQCcwbQXfbC5A90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPzo8nQzOTm/epys/HWsQ+zR1upp6F6tsYrIM+nP0L5Ruk6TQS9aJFeTkl+aUSySKcNoyShEB5tgGowAirTQAA0v/i7DpNIiJUv+mHQaOH9OI7ftiFBQtmf/0ctNuR/TU1Vp8XuK8vMYLyuA8LCkauKxHubDttyNAMqFjtqhTaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=h1CcQ5a3; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="h1CcQ5a3"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467b955e288so45741021cf.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572637; x=1739177437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEEke79FPqkO/VnndNMxidgQ7SLPxTG5sIoJEJG0Da4=;
        b=h1CcQ5a3Ue7AjWcaJS2dYurxN8ukUAiZETzRHYTPBRPo+E4LrDK8xO6DxgJEzVSDv/
         19cM4WrgvRircYE4HbBmUcnwBi49mUxtOi6lbqQGV0RYebQz7cYwojdggSO7/eINI32O
         LPJP/6tP7S7ApvneKacdoBChPWeRhjVfkDQ7+pAYXw4WHrVPNqkWetvMmoq9LvRmMBh2
         BkidAOM7l3uStGAQjE+iNQIHrwaDVxVBJaSWhP9dmVo8sAUn3NJCVom24+MQ876pJGA6
         LlfgmVwVruf1DTzZ3GZo1B1WlF7UHY2d6xoa69//8MW9agxnPEwvHqQQ2SAFwO+og+sO
         KNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572637; x=1739177437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEEke79FPqkO/VnndNMxidgQ7SLPxTG5sIoJEJG0Da4=;
        b=Beu4MHAp4FGAG0F/de61FOVqR/fL/mQ9Uw47xcEgGlBfp3Y2/rsaDOaMwTfCVyDBBN
         hlp56v2/qsWT2ldRUnGBg1QC4djCZiDNDDTtW2A0hlQtcaO0TY+Qs4k/M1SPpiZKGr+p
         kVNZYdZVD0xHLlYuGvP509VsaxsKIkHAPccZ3k20JAKTk4sLrjAMiL0NIOafm0G7UtdI
         bGgG7WZ+qAS9pI+lRRgnkdlscx9U+uwRCnQbghq5H7PtUfAUcRXqr1YQTaGRKf2U2Ejm
         pporQWgpXNAx8TW0hqpAfeZegP0x+13U44ymlAzwEVTNwuQ7laETU8upFlZZNUUlR914
         +vog==
X-Forwarded-Encrypted: i=1; AJvYcCUUZ/zaZBjyB0KBMaMntxFZXl+ywpl2OhQRhwo1BRI0ml+t9+zw2cz/23I3ehgyuLOvVGsP4SAUqeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGI38bdMqpa51eeJeP/XqnJLYjZFWCbDRnCSyE/7O9yKs2Euz
	cNl4nha74zUmTjbsRVj2uXjm2ZCQf6v3XkQdXCf46X6eyonjv2K4xdU5WEOFu1g=
X-Gm-Gg: ASbGncsSTcpEj6kzAWOtxMI84ddwRczhF+s5zu28SwfuOYV9p6C32xx3KxLtY22tvFz
	PaLFshqL9+Ms4/j+wb3oruATFNi7hHrWBGTnPRqGL6ef+3FyTmywUgXgCoDUl+lWP577u+bZhZd
	xuZT6P1u4Yjpit0DlA67SAGTi+dfsxNTHuJyMs0U4KyctOjqQdT+nncpHpvL2cioCmHtINULb85
	zpZ2ai6GD10Vy7xE6EfcoyF5WSHPQnDNGLRoPCAfoK/foGs8F13w0kGXGDh4DK4s8eZxWIehfC7
	56R3/TVqMDTTnG4oJZMLqn+APKqWbN6d6mfZObvjRkwhU7/PpdnjZcY=
X-Google-Smtp-Source: AGHT+IE+IlnE299Q+aB/GfcKf7IAlDPJGgUE1d2TnvZN/4dFlqe7+8HMm41wGojjNhxhbX5xqmUG+Q==
X-Received: by 2002:a05:622a:1356:b0:467:87f4:a29f with SMTP id d75a77b69052e-46fd0bce85dmr283644871cf.45.1738572637284;
        Mon, 03 Feb 2025 00:50:37 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:50:35 -0800 (PST)
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
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 06/17] mailbox: Allow controller specific mapping using fwnode
Date: Mon,  3 Feb 2025 14:18:55 +0530
Message-ID: <20250203084906.681418-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
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
 drivers/mailbox/mailbox.c          | 44 ++++++++++++++++++------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..447edd212f0f 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -402,20 +402,29 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
+	struct fwnode_reference_args fwspec;
 	struct device *dev = cl->dev;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
 	int ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	if (!dev) {
+		pr_debug("%s: No owner device\n", __func__);
 		return ERR_PTR(-ENODEV);
 	}
 
 	mutex_lock(&con_mutex);
 
-	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
+	if (fwnode_property_get_reference_args(dev->fwnode, "mboxes",
+					       "#mbox-cells", 0, index, &fwspec)) {
+		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		mutex_unlock(&con_mutex);
+		return ERR_PTR(-ENODEV);
+	}
+
+	if (dev->of_node &&
+	    of_parse_phandle_with_args(dev->of_node, "mboxes",
 				       "#mbox-cells", index, &spec)) {
 		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
 		mutex_unlock(&con_mutex);
@@ -423,14 +432,20 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 	}
 
 	chan = ERR_PTR(-EPROBE_DEFER);
-	list_for_each_entry(mbox, &mbox_cons, node)
-		if (mbox->dev->of_node == spec.np) {
+	list_for_each_entry(mbox, &mbox_cons, node) {
+		if (mbox->fw_xlate && mbox->dev->fwnode == fwspec.fwnode) {
+			chan = mbox->fw_xlate(mbox, &fwspec);
+			if (!IS_ERR(chan))
+				break;
+		} else if (mbox->of_xlate && mbox->dev->of_node == spec.np) {
 			chan = mbox->of_xlate(mbox, &spec);
 			if (!IS_ERR(chan))
 				break;
 		}
+	}
 
-	of_node_put(spec.np);
+	if (dev->of_node)
+		of_node_put(spec.np);
 
 	if (IS_ERR(chan)) {
 		mutex_unlock(&con_mutex);
@@ -449,15 +464,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
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
@@ -495,8 +503,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
 static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+fw_mbox_index_xlate(struct mbox_controller *mbox,
+		    const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -549,8 +557,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	mutex_lock(&con_mutex);
 	list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 6fee33cb52f5..74352c244aba 100644
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

