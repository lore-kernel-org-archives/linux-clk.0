Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3E39DBF4
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491664; cv=none; b=D4DrM4kx2zDh8CxIH2m/BH493OEBFRV2Y0NZlloWs6nMBBu+X+YuFff+zB0z4W9Mnvb5SZE5FKu96UwjiQb4BUGgBZL+xI6e8u+rP7+eCa89IJGdJySXj0ruv0RnkexP10KUflBjSl/X1lzesKv55/+JBT6Fzd5RXDTjeCXX9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491664; c=relaxed/simple;
	bh=FvhmOVc3rcOJNkTIOHLcNd2AWDDDczEt68+M8meg1Aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwFVqAJNqOuJENB8y6HmKq1RvICi0UkLKQIxD4UK2t68R7HC3B8YfB0ltFfoA1Unz+9QJ71VaqnVoM0SvANU5zL6AbHk1HQljOCBFPuqflBnWXNX7GNu1fZJMBmRH20+VGsCUjbW7Po5qXVfHOBacsKYgrBmJ8JRX+zlHMLn4r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZS7W54IG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rNnVuWfo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZS7W54IG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rNnVuWfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PGYnFsTCfLymbdR2HkfdxWn8artWtpe8LqSA1kqAwdQ=;
	b=ZS7W54IGLCFxpwLMstYmrWtZg61jnkne4U0eJ5fMB2EAEtfVJeJVVAoKKOMbCpKzdEZStG
	QypQvxzah3wu6nCGCV2dSynmndST6YNa/Ae2ctW6FMLNbALIsAsCaSrsjp5qVAQEARvjoy
	6nlGKp+rOmSM19MReTA7XT2Hvqqu7ug=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-lSpbarpJNCC7K0Xx4E5dOA-1; Fri, 26 Jun 2026 12:34:19 -0400
X-MC-Unique: lSpbarpJNCC7K0Xx4E5dOA-1
X-Mimecast-MFC-AGG-ID: lSpbarpJNCC7K0Xx4E5dOA_1782491659
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b8def69so19324131cf.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491659; x=1783096459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGYnFsTCfLymbdR2HkfdxWn8artWtpe8LqSA1kqAwdQ=;
        b=rNnVuWfo+LZNJ2psdMTMDN88z2+Jf+OLVujzsqy6i41m7T2jzehQKkl+ImnWEFRoGG
         F1VrGjcSbp4MwCuvE4sqrYQ8JlGxWeENsXvk61SU/nFbS1FTBju5VhooYdnENviN2zWe
         sVan75lfzWjCmpDOmRRj3KxqaeIjZ9jLOxjFUzTuAQKhhx2zN7xQ7vPk2RwekkgcO412
         Zfu/AS9faSR3ZaNRUCy/ICZtSFUqhjbdqGlqG0SYFH6tkR4/zC2qyn2Ri+iKQX4QoecV
         4G6zy23pIi/zBF2OvvlXysgyB9BCT3NA3Yupf1o8ukeacfzYPUVWTb9VjVaC7BAt0rjy
         J+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491659; x=1783096459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PGYnFsTCfLymbdR2HkfdxWn8artWtpe8LqSA1kqAwdQ=;
        b=JSBkgiPfFByWHEq3hZqRkB4U6U56x+0rDTTDu6ouUK3P6iJnAINhMJYkcypGwUz3vO
         cHOXJg3U22XYEtoLcFxwfBh94Pkl3Y0FeHuVTBJi65Zumvmj2ad1h36cFDR90Hhh4PLT
         OfZSwHCQtdt1oslhH1vgBZmVcAwOI8qfdPwsxDW5AJsqZT6Ww6YxWw3R/4ayNQq0CaKN
         FR1TfhoXSXuX0gGi5PBYq8SRtOu9uPlmV6+/ics7BNjZBjUQt+kniSB/cX39Mt7w/Uft
         iSTVe7e13/vNbEaFHvUbHINZklmZsgcEW3WlV1xcJAGgqiTMij8y4YBU/v/GEp0IgAOZ
         cR7g==
X-Forwarded-Encrypted: i=1; AFNElJ8u9CzVycry7PXr1lOJmQgOad/F8pwt7yXIm59PxosUagg/jwVDvItH39YtOL1CO9TFmh2xDyUEqmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHZ+1cuS+gQYrc+dw0O3EIty/yBRiO0Ud364NlsU0GMs95vY3V
	MgFuNSNHmkvFUVv1A/mR/GeyD1fbPpmM0MpC1aipZL1UrrGrKWIz0v7uufXhSaNKV6lU3B7ZXox
	ZO1fbKHRcgeqNb9vsQaM5BN75WM6CvC0hYSdTSpknFVoPpAHEEVqWORFYbEpAnw==
X-Gm-Gg: AfdE7cncwH4EilgYTdff8MrSALcfrU5ENwVB1xtj5YhnjftcTU7RXInXNwQ7RW4y13L
	OrBbnCs/I7nsBjU4PCZWk40fT6roMRtUrmCLTW2f8gSosNw+Cz4nMxSZrg/YUmjtTeGaTwxVdOk
	+Z8tD8IwBxZcJGQWFb7Ds022YyN7qU9kybK79NPpAFfSPBlt8/BcATJ9V72rSBfokCaWCh5vpo8
	9KXqQp6oyMx/IxQNnBgdyHsPNM6eAb5cR+vD887FWlNp4G5NOmXjrvopZkbcdZwxTBFUa0Et7Ta
	rj5SXfE6dA4sOu1yAH7dtSp1fpHTkhHp4rV1DewjCvMb+MAfe8GExx9QUXyVQIIJTezxlRW42+K
	tCZtSbtD9CnTPMuWnZnExm72ru/m60DTxb9if6t4q2+2CZGQd8g==
X-Received: by 2002:a05:622a:14cf:b0:51a:8c97:9383 with SMTP id d75a77b69052e-51a8c979583mr9914641cf.58.1782491606770;
        Fri, 26 Jun 2026 09:33:26 -0700 (PDT)
X-Received: by 2002:a05:622a:14cf:b0:51a:8c97:9383 with SMTP id d75a77b69052e-51a8c979583mr9905721cf.58.1782491596909;
        Fri, 26 Jun 2026 09:33:16 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:45 -0400
Subject: [PATCH 4/4] clk: implement sync_state support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260626-clk-sync-state-v1-4-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9876; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FvhmOVc3rcOJNkTIOHLcNd2AWDDDczEt68+M8meg1Aw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh5m/m9abbz7oEzpCqddVqnMpo2i8adyxd5OyuBhO
 /L6o2tzRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABPRX8bw32md7uEH31RNIwsn
 CAtMj0to+az3eHbbC6ZLnm+jN06YYMnI8D1Ei08t/0/vd9d9zyunsN1dw1VwbX3Zjm1fRd7VOcW
 mswIA
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

    [    0.366737] clk: Disabling unused clocks not associated with a device
    [    0.367232] PM: genpd: Disabling unused power domains
    [    7.791413] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
    [    7.799702] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
    [    8.548820] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
    [    9.121849] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
    [    9.121985] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
    [    9.122691] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
    [    9.122760] disp_cc-sc8280xp af00000.clock-controller: clk: Disabling unused clocks
    [    9.142121] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
    [    9.169149] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
    [   16.057997] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
    [   16.058149] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
    [   16.334879] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
    [   16.706113] camcc-sc8280xp ad00000.clock-controller: clk: Disabling unused clocks
    [   21.565731] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
    [   21.597069] va_macro 3370000.codec: clk: Disabling unused clocks
    [   21.605039] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
    [   21.630313] wsa_macro 3240000.codec: clk: Disabling unused clocks
    [   21.635069] tx_macro 3220000.txmacro: clk: Disabling unused clocks

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on AML-S905X-CC, AML-S805X-CC, BPI-M2S, BPI-M5
Tested-by: Xuyang Dong <dongxuyang@eswincomputing.com> # hfp550
Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
---
 drivers/clk/clk.c   | 78 ++++++++++++++++++++++++++++++++++++++++++++---------
 include/linux/clk.h | 14 ++++++++++
 2 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..2b6fae54702a 100644
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
@@ -1516,17 +1545,27 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static int __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 	int ret;
 
 	if (clk_ignore_unused) {
-		pr_warn("clk: Not disabling unused clocks\n");
+		/*
+		 * Only show this message once for the providers that are not
+		 * associated with a device, which is the first pass of
+		 * disabling unused clocks. Otherwise it'll show up for each
+		 * clk provider as well.
+		 */
+		if (!dev)
+			pr_warn("clk: Not disabling unused clocks\n");
 		return 0;
 	}
 
-	pr_info("clk: Disabling unused clocks\n");
+	if (dev)
+		dev_info(dev, "clk: Disabling unused clocks\n");
+	else
+		pr_info("clk: Disabling unused clocks not associated with a device\n");
 
 	ret = clk_pm_runtime_get_all();
 	if (ret)
@@ -1538,16 +1577,16 @@ static int __init clk_disable_unused(void)
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
 
@@ -1555,8 +1594,19 @@ static int __init clk_disable_unused(void)
 
 	return 0;
 }
+
+static int __init clk_disable_unused(void)
+{
+	return __clk_disable_unused(NULL);
+}
 late_initcall_sync(clk_disable_unused);
 
+void clk_sync_state(struct device *dev)
+{
+	__clk_disable_unused(dev);
+}
+EXPORT_SYMBOL_GPL(clk_sync_state);
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
@@ -4339,8 +4389,10 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->dev = dev;
 	clk_pm_runtime_init(core);
 	core->of_node = np;
-	if (dev && dev->driver)
+	if (dev && dev->driver) {
 		core->owner = dev->driver->owner;
+		dev_add_sync_state(dev, clk_sync_state);
+	}
 	core->hw = hw;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 998ba3f261da..31a0c9224c46 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -846,6 +846,20 @@ void devm_clk_put(struct device *dev, struct clk *clk);
  */
 
 
+/*
+ * clk_sync_state - sync_state callback to disable unused clocks
+ * @dev: the clock provider device whose unused clocks should be disabled
+ *
+ * It is called by the driver core once all consumers of @dev have probed,
+ * and disables any clocks belonging to @dev that are unused at that point.
+ *
+ * If a clock provider doesn't have a sync_state callback, then the framework
+ * will set up clk_sync_state() on your drivers behalf. If your driver needs
+ * a sync_state callback, then that callback also needs to call
+ * clk_sync_state().
+ */
+void clk_sync_state(struct device *dev);
+
 /**
  * clk_round_rate - adjust a rate to the exact rate a clock can provide
  * @clk: clock source

-- 
2.54.0

