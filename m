Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692348125C
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496550; cv=none; b=c6QweOI5DRWC50g2ePzSVTh0biAccKA196qMpXWtyiI3qSopGLhiEq6TQIQSH7W6IFCTbsfbdOq+ixjOOck7BxOM5NDDf/OZPPL/C8/UnF8EFhGhi6kPeSbj5Zo4JQkrbOZ1M84u40MwfGf1eeROxxi78XoPP+ifPk9upeAcDQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496550; c=relaxed/simple;
	bh=zy9SqZgZxUx6odgCUdJ3l3chdPu76ryK/kRXQOy9IZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUJSc9broRC2WNGynRR6+C9yO5ldsgVFpxf7pOZJ8ksl1uLhOHXnezkOGg9FkyE8Rb+Qbci2iEralYlEOkXUTXCn20taofV8VAsucVGZXzTFsqJfesfeQxvXdYM2xgq8WBi1G4cExDEoGBJkMUBrNf0llxJbDyPL/sIasen7mwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTYMYdk9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uKWcsd7F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTYMYdk9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uKWcsd7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+64RL1MUhJVflWQ0/Hrf9COdjHtondF6tiwJq41sfAg=;
	b=DTYMYdk9BalkLgOcuVVY4dQoaiUBvZsnHx/cO4kXyQGYp157/yRCBG/OcK56P2Z5a947xV
	hG1VqDFD9hO6XWe0cogBdyWeuvD0DXipENKIjAeD6uatR+FFpmiVSF9BVEWwu3D4qm1wT0
	RuzRxzubJRp85fsO927nujBrvEGkXig=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-CCljs5x4OCm5LuG-62trnw-1; Wed, 03 Jun 2026 10:22:27 -0400
X-MC-Unique: CCljs5x4OCm5LuG-62trnw-1
X-Mimecast-MFC-AGG-ID: CCljs5x4OCm5LuG-62trnw_1780496546
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51771d41426so30112801cf.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496546; x=1781101346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+64RL1MUhJVflWQ0/Hrf9COdjHtondF6tiwJq41sfAg=;
        b=uKWcsd7Fgwtg9+yzPsQHPbui06xGX/cC9irnx3cZK+Rsv2ddJZWs/gvirzvkA9351N
         VEzgmVnmCcLq333amKI4fEPcBRfZXQm7g5WDSyxse0xUPqAtt7lnhFZkeXm5CZrb6j3w
         MsffaJqwRIloC0Bn643wuUj5OdBqvUkJgozw3zU56SoShGRS7/uRGF9WyiBiiGw+qzli
         gcylpgRiBrlQOrohB0AoRJpJ/Y1LjNVgH0TnzZa07oxQ7bCcicaRFPrWDeUN7xQDqM7h
         QvSY3Q1ykfZgl6TXZ9GIgzh6H58nxWHTIzNOgpX91F4Nne0l0Jv+8Rc7yg0t4KNM6i+W
         KyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496546; x=1781101346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+64RL1MUhJVflWQ0/Hrf9COdjHtondF6tiwJq41sfAg=;
        b=NzrUJpjk1dnBG7ac6CtUeQvDqYB+gm3eGGpWysROCMy+oxpgc+NeOT//pn944E8LS5
         0lobLkgXS5xtyDuXZcplE3zpAdKSRUFGrtKaCCeR0+qjc4kGgeC2++v3e0nwRRSwlfvR
         pW4Ll9/LuQQoQBlinv3LCKZjNyUOkjoyfJTsXQTrtbRqrafFq0/P+riuO8RdW0xH3tu8
         rKR715+covFU3jNYJAUyqNn2TvKHKvwUwa00oOoWgfbW/jugxtV2xRXItYUFsvbErW/M
         QWHTA1f1gi8S2glGK0iMt6wT/GJFBOKLidwydh12/J59iXMjaXDT4gqjF/+MNnTScBrn
         45qA==
X-Gm-Message-State: AOJu0Yw4Q2XwZJnF5w91s4Y9UlpD0CbZq0R5p5ZRSC0QSUt86RJ9eN/O
	lDozyRhjlODBFgOZGBlYgv17AxnmBidzw9e5FJJ16vSiENTICc2HcQCfzH9KsTzxDN3hjLauDvz
	9QuZACn03MabPWhCI1t/4TiWhHYig2VZM6ruGgySoEOnS1CrRaDBAvY0VN5Y/eA==
X-Gm-Gg: Acq92OFOm6+/rfxYvcmg65bMuYLhpeprsD60cwiC+QoDRBCJHhgQhzBWEmJ97EY1LRO
	4sWEWNI7baKb6qlIVY1DshLczioygVYbDuouOvDH4aWOFA3WKE4Ee63R6iioD8ABsSNLzfVx4cU
	lxS+38JrD2Q0ULmc5ryyCqhxWCVvdD6t2/qHTpj6JwfHASaCBbmHR4G7Vd+DiBex2OhVhIyhqSF
	mMdY1DoHhTBBTKO4OW77z5iBVNq9xDt0sKTcK0rv19dsdzo2pGFbm6lBX6UxX9qXWus+Qyaknyb
	90vC2GFvtLyzEFNVEfOv4CGWgRMrZXRhfrsj0AMdyH9MLY+Zy67LGkrSh9LirQY1dbB3RFsNP5j
	8yRYx5acV97b7BIClTugtnquW5WdGzPc+Nx44cOHaZCUgdpK1FkWrL/FLVla6U9gdpaxTqek=
X-Received: by 2002:a05:620a:4096:b0:915:8f08:5f9d with SMTP id af79cd13be357-9158f086545mr424084585a.56.1780496546319;
        Wed, 03 Jun 2026 07:22:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:915:8f08:5f9d with SMTP id af79cd13be357-9158f086545mr424078585a.56.1780496545742;
        Wed, 03 Jun 2026 07:22:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Jun 2026 10:21:49 -0400
Subject: [PATCH 4/4] clk: implement sync_state support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-clk-sync-state-v1-4-457120eed200@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
In-Reply-To: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8197; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zy9SqZgZxUx6odgCUdJ3l3chdPu76ryK/kRXQOy9IZ8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULGaIv3q08v28UiOhF9xnOK1ME46ulmFgsbzGllhyk
 OPz69h7HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwk+TIjw5uvxyYeDeKVLDEw
 NIgI+tqzbMPZpNiAt990l6ZVT6/7fI7hF9OyhgfP0juy/bnjzx8+mXbZRMpF/0tQ1Ix0o/qHKkt
 /cwMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

Let's go ahead and add a framework-level sync_state callback for the clk
subsystem. If a driver doesn't have a sync_state callback configured,
which is the 99+% use case today, then let's set it up to use the
clk_sync_state() introduced in this commit so that no driver changes
are needed.

At the time of this writing, there are currently only 7 clk drivers that
implement sync_state, and all are Qualcomm SoCs where they interact with
the interconnect framework via icc_sync_state(). A shared helper has
been created for this platform that calls clk_sync_state(). It is
expected that any new clk drivers that want to implement their own
sync_state will also need to call clk_sync_state() at the end of their
custom sync_state callback.

There will be several stages of disabling unused clks:

- The first phase will be executed at late_initcall and it will only
  disable unused clks that do not have a struct dev.
- The sync_state callback will be invoked for each clk driver once all
  consumers have probed.

This is based on previous attempts by Saravana Kannan and Abel Vesa
that are linked below.

This change was tested on a Thinkpad x13s laptop.

    [    0.308051] clk: Disabling unused clocks not associated with a device
    [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
    [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
    [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
    [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
    [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
    [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
    [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
    [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
    [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
    [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
    [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
    [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
    [   21.081996] va_macro 3370000.codec: clk: Disabling unused clocks
    [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
    [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clocks
    [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused clocks

Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
---
 drivers/clk/clk.c | 71 +++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9cb2b42d1be4..ab3f8becda0c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1442,14 +1442,39 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+/*
+ * Returns true if @core should be skipped during an unused-clock sweep for
+ * @dev.  When @dev is NULL the sweep is the global late_initcall pass; when
+ * @dev is non-NULL the sweep is a per-device sync_state pass.
+ */
+static bool clk_core_skip_unused(struct clk_core *core, struct device *dev)
+{
+	/*
+	 * At late_initcall, skip clocks that belong to a device — they will be
+	 * handled at sync_state time.
+	 */
+	if (!dev && core->dev)
+		return true;
+
+	/* When called from sync_state, only process clocks for this device. */
+	if (dev && core->dev != dev)
+		return true;
+
+	return false;
+}
+
+static void clk_unprepare_unused_subtree(struct clk_core *core,
+					 struct device *dev)
 {
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_unprepare_unused_subtree(child);
+		clk_unprepare_unused_subtree(child, dev);
+
+	if (clk_core_skip_unused(core, dev))
+		return;
 
 	if (core->prepare_count)
 		return;
@@ -1467,7 +1492,8 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	}
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core,
+				       struct device *dev)
 {
 	struct clk_core *child;
 	unsigned long flags;
@@ -1475,7 +1501,10 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_disable_unused_subtree(child);
+		clk_disable_unused_subtree(child, dev);
+
+	if (clk_core_skip_unused(core, dev))
+		return;
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_prepare_enable(core->parent);
@@ -1508,7 +1537,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
+static bool clk_ignore_unused;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
 	clk_ignore_unused = true;
@@ -1516,7 +1545,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static int __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 	int ret;
@@ -1526,7 +1555,10 @@ static int __init clk_disable_unused(void)
 		return 0;
 	}
 
-	pr_info("clk: Disabling unused clocks\n");
+	if (dev)
+		dev_info(dev, "clk: Disabling unused clocks\n");
+	else
+		pr_info("clk: Disabling unused clocks not associated with a device\n");
 
 	ret = clk_pm_runtime_get_all();
 	if (ret)
@@ -1538,16 +1570,16 @@ static int __init clk_disable_unused(void)
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	clk_prepare_unlock();
 
@@ -1555,11 +1587,16 @@ static int __init clk_disable_unused(void)
 
 	return 0;
 }
+
+static int __init clk_disable_unused(void)
+{
+	return __clk_disable_unused(NULL);
+}
 late_initcall_sync(clk_disable_unused);
 
 void clk_sync_state(struct device *dev)
 {
-	/* Will fill in */
+	__clk_disable_unused(dev);
 }
 EXPORT_SYMBOL_GPL(clk_sync_state);
 
@@ -4345,8 +4382,16 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->dev = dev;
 	clk_pm_runtime_init(core);
 	core->of_node = np;
-	if (dev && dev->driver)
+	if (dev && dev->driver) {
 		core->owner = dev->driver->owner;
+
+		/*
+		 * If a clk provider sets their own sync_state, then it needs to
+		 * also call clk_sync_state(). dev_set_drv_sync_state() won't
+		 * overwrite the sync_state callback.
+		 */
+		dev_set_drv_sync_state(dev, clk_sync_state);
+	}
 	core->hw = hw;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;

-- 
2.54.0

