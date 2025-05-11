Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544AF1DC9A3
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970856; cv=none; b=YkDBfurRpLpt4zuuoJ7SXPh3xCA3Gl64rSF757FW1ZchoJ2d7zOc4XRYfmy3Kz2Vz7BHgr6qujnWbtZXCC2uveJbgw/HmeYC8egjaEvC8B/B+xmeq5lH0mtso4VDTEISVG0QyBvzbqktozqSTvIdxndf5ZeME391akfABa4pjsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970856; c=relaxed/simple;
	bh=g2XqVbxqcV7WBB8IUvgJxiIMFjUcEpNuvTGW42Cuh18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeTsHaSaAefJ4j2eCDLcVbWMdDaZDt8CI5yLhBFpvKjDp35qyXUV67YdwcC/Qh2rAAHf8MSVziQxoe+J2EFmg4j5lTOCodxSp77QvwLlM2z+mXP2p/UC6DyGy+6oRuTsCrs2f5w1MkSpMyESW8ZrFfkxG9sLI+/36c9K/ltAsjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=agRozwxs; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="agRozwxs"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e5df32197so36243205ad.0
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970855; x=1747575655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cUhTlBPCx/RyxrDK4rJSeeuJgXjq8E3p5DHEKMIX0g=;
        b=agRozwxseeyxTujk5njOVXzxEJmEF8kktN1V2P2myqsT6G/9Otl0IgP9LRxDc22048
         xCXKinziqADqNxgeetjNSfFPFQrVrI6o2pG0Lb91C4L4ZvRoJljDRr7Sx1Kn7pjnNLs/
         rLu8+U4PJPd5abzKth5Ulq45h6U99+2Fdlt2xDqbOs5xXc3cmr/Kn7KkebRWf/uy1J1J
         EY72yLZtr/WlUr/A8ESrj4qAMXpN2RsaiOs8HZ1JXEvg4NKUklR4yhX+1/ioMzji5kSC
         v1O7gxEbXcboDmv8bQFXuwzImx+UWOzVYaasa+ufJwqXO0xr+3yXDIxOSLUfxipuV+WK
         xf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970855; x=1747575655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cUhTlBPCx/RyxrDK4rJSeeuJgXjq8E3p5DHEKMIX0g=;
        b=t2h4vtxTwZMQz5r5MFlgrU+nO+pchxmSW/4waJXIz/O5JH6W3OGbZwuO5cbqQlo6xM
         kysdfzSvl1HHZgNOC1XnGHrVCzhYdjt5KOVTs6ykqw4S5GgCDujBMzGvnGP3REMY5MYs
         I18nxnUpmFlnI26C12jA9w8h3iIKGOrTcGFDNbxGh9A/bU0qousaxatwfnEi635wHOVG
         aW3VFDyvKbFX3ljlfKcw2Ki0s8NdEWBcqk68ARQ9tE3eM5Xr4U24XNDgPRWiCqC6MVJZ
         D0wGeoksb6NgalzvkBH3D/rrCWVZ4oY543rtftkgHRyH7R5cEb1Su0culEn29hcBnd0s
         7heQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV59VwDA7DUrEVSx11NaCrhkZThZbJiUlRT0n8vfLfEVqxdg+xe/DDzbvBj1Sb1tMDWS7SFdOtQio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvvqQogvc2g04Txfx1BdAHLs5BAjhzDXszYgR15ZwjNTbJln5
	0qeavXCp5N3hnEFhlBIBaIDaWIJidyENkCsrVYGIGQUOh/NwCKF9XcWDlJHh/v/thAkLoZVkb8p
	W
X-Gm-Gg: ASbGncu4dekbkNOmJPkr+RjfN0tO1zp7cELW7qh9O0Vt4t+piZ/9uLlLUeUROlx+3X1
	NGnH3LyMpg3YZFN8BEK+1mJdwQQefXrSsnx3EqoWy80NDSwZKoeNC1U+CCzXfu0rGcgv2UqGjTQ
	1kpUdCi1vmntGdpLZyxCwBU41ij4aulFYZDhyNqaHf2hvblNUxhn5/9zMaBeqv/LXF8obBwcUq/
	DuLO9kyUzJrpRfPq9/Xd9pxSfqZv+M1vaMe7mGC5aSVa2zgblUsea44gj649xk3oBcMfr4uVf4D
	Pq3fHom3Ufx48lN/JYUM7dn+uyMI6sN6MjwJwx/875XTmVGhh5mJAWqLWjPWrgn+ZDryjATNiYg
	uk03nvelvLaIkQg==
X-Google-Smtp-Source: AGHT+IHDFcgf/Q1YCLdknZTt9nRZWla2DHaCojWqgGJ4RbiVsHVnEoQNqVZO0AbPN3LFSDThkG8o2w==
X-Received: by 2002:a17:902:f54d:b0:223:628c:199 with SMTP id d9443c01a7336-22fc91a8c87mr141296155ad.52.1746970854557;
        Sun, 11 May 2025 06:40:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:53 -0700 (PDT)
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
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 06/23] mailbox: Allow controller specific mapping using fwnode
Date: Sun, 11 May 2025 19:09:22 +0530
Message-ID: <20250511133939.801777-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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
 drivers/mailbox/mailbox.c          | 48 +++++++++++++++++-------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0593b4d03685..a7ab1b4450a3 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -399,35 +399,50 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
+	struct fwnode_reference_args fwspec;
 	struct device *dev = cl->dev;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
-	int ret;
+	int i, ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	if (!dev || !dev->fwnode) {
+		pr_debug("%s: No owner device\n", __func__);
+		pr_debug("%s: No owner fwnode\n", __func__);
 		return ERR_PTR(-ENODEV);
 	}
 
-	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
-					 index, &spec);
+	ret = fwnode_property_get_reference_args(dev->fwnode, "mboxes",
+						 "#mbox-cells", 0, index, &fwspec);
 	if (ret) {
 		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
 		return ERR_PTR(ret);
 	}
 
+	memset(&spec, 0, sizeof(spec));
+	if (dev->of_node) {
+		spec.np = to_of_node(fwspec.fwnode);
+		spec.args_count = fwspec.nargs;
+		for (i = 0; i < spec.args_count; i++)
+			spec.args[i] = fwspec.args[i];
+	}
+
 	mutex_lock(&con_mutex);
 
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
+	fwnode_handle_put(fwspec.fwnode);
 
 	if (IS_ERR(chan)) {
 		mutex_unlock(&con_mutex);
@@ -446,15 +461,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
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
@@ -492,8 +500,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
 static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+fw_mbox_index_xlate(struct mbox_controller *mbox,
+		    const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -544,8 +552,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	mutex_lock(&con_mutex);
 	list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 5fb0b65f45a2..b91379922cb3 100644
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

