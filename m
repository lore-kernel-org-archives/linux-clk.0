Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227539768C
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 21:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644242; cv=none; b=RoXkq9EGMGsne1I2jvyHmBZ5wO351pP3pFSd5N3+36SxSOMjS7l+Jt7wl8JdUDbZXgHaboCu3RpEDDBarhemXKUeh1c3TaQHf/TMgR2pFcFpvJ00jpqtynNMfoHqdGRYYpGwkBIXNctK2ylOy8rH2o9yXRcPY7XIvOhCAoze5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644242; c=relaxed/simple;
	bh=J7gYEeWCxB1tJhgelNOaDUWno2W5LahEOqzwNzbFLVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sz41wSl/Zw6RLnbt8T5cHSaMCFaKlhPY/QVvKhx2TnUdtz1fl3AxA0QnRGe3oQNRQyjzl6T+/AnDW68ihZxLEDeKzVecryW0jKFG6R/iHyhtYTzQDAtqtPnT3sTNydWrvY979wwgtPNwNjRthEBygmzkS8TOfC4QlXwSk9lHQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eWv+aoXx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i0HEcqKq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eWv+aoXx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i0HEcqKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjvCrBMszrMJ2Knwf+augk31h+3piL8f3cGGXhlSVYM=;
	b=eWv+aoXxcChxzz8FjqaYS1AZQRJs1JpnKQddLaqtVPfWXiV2SKZUx5e4SOI5NJqEegPLjf
	jHwCELgmcnFaIGDr+FDtNWy3Bzjoq76aJnypH/KmtFpbgEpMutVObHDDRQK73rnmVjxBf2
	4n161aFmLdIDnVNwrdRh/kxR5A7xKKA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-LuFAVSDsNDm1ea_KBPQUrw-1; Tue, 16 Jun 2026 17:10:33 -0400
X-MC-Unique: LuFAVSDsNDm1ea_KBPQUrw-1
X-Mimecast-MFC-AGG-ID: LuFAVSDsNDm1ea_KBPQUrw_1781644233
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cea98a0effso108025746d6.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644233; x=1782249033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjvCrBMszrMJ2Knwf+augk31h+3piL8f3cGGXhlSVYM=;
        b=i0HEcqKqMIZ+c3Zaa813guyHu78yIMOZYRDgGTKFN+vezcyTbjDeRDA76NCoTH2OUs
         8tBVgU/KJBHQwHxwZWAF7AR6I8msHFz115eG9YI/NgNiXhECkQuW6ftgr9q9mkOjWz12
         dOdt5X6Og529+uu+Bqci2ZpeU3gQ8JW82CRMS2LDAZq7w+VAvrdpoE+fDvQwgJO8UjRx
         nN83z1oPl9Ur1S+cPQDhH43apeHxh19xyqu8furrU3bHHJpFLB17HdxT+pG3/II45ZPV
         lHijOVC6ZNnBElpDhnpZHOcWA6j7pxJu/5SFonb/bvd7HuLtyPjyYgJ3CC3LbR4dzyjo
         56iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644233; x=1782249033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BjvCrBMszrMJ2Knwf+augk31h+3piL8f3cGGXhlSVYM=;
        b=Ejq7Qo+3Fj/IJJFYEi3Z2xxOnYQCzNVbzLhxIRsmkuFCHq06I+kHHChP/yWF97oimM
         IW68BKyyBQfK/zg4ARyo+RwLrnY6qDebMXKgBkh4qBK1PFVX7Ckuf4NbTd3DBP+8A6ng
         FYcSsJj32aOtqXxH51QnwSkra7d8r1MpM0VWo+BOyCOX/7DAb9B5qmyGXsy347mgcL5A
         jbvE4KHDhjT0zgqBTqia9ikeF0YZo3Tc0PaIyh/KV4KVPPgZZUnb9w6Lo7mEimWsv2F4
         WZ9SWh5DCyttRn1jKlCe9vf9iIF0TNOZDqdRxJYetoSX6GKG4Li1jKL5L2qGva5JvfgZ
         xGmQ==
X-Gm-Message-State: AOJu0YxAFh9LclPC1pmPnG3mAyYaMshBGbP4n/BCYSnGpugIPCLg+ldU
	7sFuo4mTWFyAC8Goj/8r0eSb5zwJ2qyq3FmNF0kgc/iUUrF4+YIyhmTqYd5Q2W3evWg1GbiMAio
	u0g3jOyk8+E8D5uQQrVXybmscisDw6hEDqJI2KgE9pMyPgKS5KxhBupV0WBEG0Q==
X-Gm-Gg: Acq92OEf7hIDRQQQ+cRsq+NkeUd/C0qF9bdOHSyAbK+mRdGYH8Oq8RNnyWuV9ztKGHJ
	hgKWj1yudMU6kOjj4zqBOuebrYQfAI0cmvs47doOPgfZwqJTTory8z0OttNQtCpzQeB+iMs5K8R
	8iKsc0i1zKuPLW9G4DOQC3eCR8ndPdat+nwnRAXXPNwBHtSvRPyOPQW3BFx2t64NTvhdS1e0V7r
	/f+8hypbZS3pGMOmo8OFD5KFiQDheS3EhxAtAb/L2yE4aYYHJUnWmvJzBKyw2l5tK8gL5MTU1wd
	8C5F7xAQX8iSlY4Hm1LjwZJtTrVYpiT13Cmm/vnQoYVrEhA9G7leej94FtPFzNGVNIGj3b2nM9S
	jySWkpNC+a+gVdZOLSSkmipXTRaEumczitAb0F6aoWevdEDg3BY+mXLY4fVEosQ==
X-Received: by 2002:a05:6214:dc1:b0:8ca:ee3:6ea9 with SMTP id 6a1803df08f44-8db83137b85mr14865436d6.20.1781644232458;
        Tue, 16 Jun 2026 14:10:32 -0700 (PDT)
X-Received: by 2002:a05:6214:dc1:b0:8ca:ee3:6ea9 with SMTP id 6a1803df08f44-8db83137b85mr14864746d6.20.1781644231926;
        Tue, 16 Jun 2026 14:10:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:47 -0400
Subject: [PATCH v2 5/5] clk: implement sync_state support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8302; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=J7gYEeWCxB1tJhgelNOaDUWno2W5LahEOqzwNzbFLVk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+9ZZTSpv2+qfIN0QZzpS14dZQV2jxQ77bXvuKafv
 s0R9a+po5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgImcDGRk6DvyRl26aAfTX/uf
 hovu3I5muH/KqP/qwZ0OUyK+n1+u95ORYfH/Mju+FU+ShENM+0/UxaecNVjopqhtKL/7j8c8du/
 vjAA=
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

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
---
 drivers/clk/clk.c | 72 +++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9cb2b42d1be4..7a15cceec620 100644
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
 
@@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
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
+		 * overwrite the sync_state callback, and this call will fail
+		 * with -EBUSY.
+		 */
+		dev_set_drv_sync_state(dev, clk_sync_state);
+	}
 	core->hw = hw;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;

-- 
2.54.0

