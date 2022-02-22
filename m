Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC62C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 19:52:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbiBVTwb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 14:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235319AbiBVTwa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 14:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CF917C4867
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 11:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645559524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yqAxAt97qCJLV5CPBezCxx4lwmzLsldJjCu+hXm/y4A=;
        b=AG6rcFtBC8eRl2lBpl5ZOlZy8FhGvdhyKRigesBsGYdDGORGgWUZ/Zp5JLi0OqCzgtF4t1
        FaxLvTdq1SQfuhD6arYtublG1EyHqLiC6xge2EDIUse+urbKfVgoQEnydvmhPe37USI/4B
        4UHdeyuSd82QjZWF9/2Gk7hmUBYwGvU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-jZB0VjauNxay_M9j4odpRA-1; Tue, 22 Feb 2022 14:52:03 -0500
X-MC-Unique: jZB0VjauNxay_M9j4odpRA-1
Received: by mail-qv1-f69.google.com with SMTP id fq2-20020a056214258200b0042c39c09e5dso828192qvb.18
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 11:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yqAxAt97qCJLV5CPBezCxx4lwmzLsldJjCu+hXm/y4A=;
        b=4GhXJmd+jFHpZ4c2gnOzmaCfxpuJaEFMEjK1gQsvK3qiH7y7WaxjYZHoP26HpbZLgc
         v4U6QmdZoEH2ELyjTRPExWqh5XBpxhn5+KDKnN8DLvMK6NkYWPy+fzxSOozrMhlER7A+
         ADCv6NrlcROH9cPCLkTazc0OgagxOtqBpLXz/GLGg4zH4yFCXqhPrGz1KKqWNEWYFTve
         B0fM2R0VBergaoZ3MI8W4rHzkEyQVYg8pwJ7cM9AeLElVCxgiOfnNPD8M2PXoZOpNEYs
         hUAotNkRkUV6JEgQe6tzCuDqBBJ/Alg7gTFhqDZAR0taeuHEPzgvIbC860yFL3AqPpY0
         kqQg==
X-Gm-Message-State: AOAM531tDo2XorpQ69cHX41eVbHmTVX74fEVMf0bvVrsveq4KG9x3D53
        h7n8/iap2w72fg6efQQY2nvnB1zKdGfd3YNcwrR5/NqSnAFB64mcgIZO9qWvwk3DtgUPgGMSrPk
        8o1bJTJKAksFLurjpDwfA
X-Received: by 2002:ac8:5ccc:0:b0:2de:2c05:a4d5 with SMTP id s12-20020ac85ccc000000b002de2c05a4d5mr9869936qta.77.1645559521587;
        Tue, 22 Feb 2022 11:52:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm0K5Nq0kkz2hfcMU9ijcXpKdvSZAutJr5ctmWgXao4fnPEQuBInwgg1GxR/g6ikbJVmux0g==
X-Received: by 2002:ac8:5ccc:0:b0:2de:2c05:a4d5 with SMTP id s12-20020ac85ccc000000b002de2c05a4d5mr9869904qta.77.1645559521315;
        Tue, 22 Feb 2022 11:52:01 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id x7sm364155qta.75.2022.02.22.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:52:00 -0800 (PST)
From:   trix@redhat.com
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, jesper.nilsson@axis.com,
        lars.persson@axis.com, rjui@broadcom.com, sbranden@broadcom.com,
        f.fainelli@gmail.com, narmstrong@baylibre.com,
        jbrunet@baylibre.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, dinguyen@kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@axis.com, linux-amlogic@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: cleanup comments
Date:   Tue, 22 Feb 2022 11:51:53 -0800
Message-Id: <20220222195153.3817625-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Tom Rix <trix@redhat.com>

For spdx
Space instead of tab before spdx tag

Removed repeated works
the, to, two

Replacements
much much to a much
'to to' to 'to do'
aready to already
Comunications to Communications
freqency to frequency

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/at91/sckc.c              | 2 +-
 drivers/clk/axis/clk-artpec6.c       | 2 +-
 drivers/clk/bcm/clk-iproc.h          | 2 +-
 drivers/clk/bcm/clk-kona-setup.c     | 2 +-
 drivers/clk/clk-fractional-divider.c | 2 +-
 drivers/clk/clk-si5341.c             | 2 +-
 drivers/clk/meson/meson8b.c          | 2 +-
 drivers/clk/mmp/pwr-island.c         | 2 +-
 drivers/clk/socfpga/clk-gate-s10.c   | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 2d65770d8665..fdc9b669f8a7 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -535,7 +535,7 @@ static int clk_sama5d4_slow_osc_prepare(struct clk_hw *hw)
 
 	/*
 	 * Assume that if it has already been selected (for example by the
-	 * bootloader), enough time has aready passed.
+	 * bootloader), enough time has already passed.
 	 */
 	if ((readl(osc->sckcr) & osc->bits->cr_oscsel)) {
 		osc->prepared = true;
diff --git a/drivers/clk/axis/clk-artpec6.c b/drivers/clk/axis/clk-artpec6.c
index f95959ff85ac..a3f349d4624d 100644
--- a/drivers/clk/axis/clk-artpec6.c
+++ b/drivers/clk/axis/clk-artpec6.c
@@ -2,7 +2,7 @@
 /*
  * ARTPEC-6 clock initialization
  *
- * Copyright 2015-2016 Axis Comunications AB.
+ * Copyright 2015-2016 Axis Communications AB.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/bcm/clk-iproc.h b/drivers/clk/bcm/clk-iproc.h
index a48ddd3e0b28..d7e5b94bed45 100644
--- a/drivers/clk/bcm/clk-iproc.h
+++ b/drivers/clk/bcm/clk-iproc.h
@@ -89,7 +89,7 @@
  * Parameters for VCO frequency configuration
  *
  * VCO frequency =
- * ((ndiv_int + ndiv_frac / 2^20) * (ref freqeuncy  / pdiv)
+ * ((ndiv_int + ndiv_frac / 2^20) * (ref frequency  / pdiv)
  */
 struct iproc_pll_vco_param {
 	unsigned long rate;
diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
index e65eeef9cbaf..5dd65164c8b1 100644
--- a/drivers/clk/bcm/clk-kona-setup.c
+++ b/drivers/clk/bcm/clk-kona-setup.c
@@ -510,7 +510,7 @@ static bool kona_clk_valid(struct kona_clk *bcm_clk)
  * placeholders for non-supported clocks.  Keep track of the
  * position of each clock name in the original array.
  *
- * Allocates an array of pointers to to hold the names of all
+ * Allocates an array of pointers to hold the names of all
  * non-null entries in the original array, and returns a pointer to
  * that array in *names.  This will be used for registering the
  * clock with the common clock code.  On successful return,
diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 4274540327ce..8efa5142ff8c 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -34,7 +34,7 @@
  * and assume that the IP, that needs m and n, has also its own
  * prescaler, which is capable to divide by 2^scale. In this way
  * we get the denominator to satisfy the desired range (2) and
- * at the same time much much better result of m and n than simple
+ * at the same time a much better result of m and n than simple
  * saturated values.
  */
 
diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 071f5a1c8a1c..41851f41b682 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -655,7 +655,7 @@ static unsigned long si5341_synth_clk_recalc_rate(struct clk_hw *hw,
 	f = synth->data->freq_vco;
 	f *= n_den >> 4;
 
-	/* Now we need to to 64-bit division: f/n_num */
+	/* Now we need to do 64-bit division: f/n_num */
 	/* And compensate for the 4 bits we dropped */
 	f = div64_u64(f, (n_num >> 4));
 
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index cd0f5bae24d4..8f3b7a94a667 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2232,7 +2232,7 @@ static struct clk_regmap meson8b_vpu_1 = {
 };
 
 /*
- * The VPU clock has two two identical clock trees (vpu_0 and vpu_1)
+ * The VPU clock has two identical clock trees (vpu_0 and vpu_1)
  * muxed by a glitch-free switch on Meson8b and Meson8m2. The CCF can
  * actually manage this glitch-free mux because it does top-to-bottom
  * updates the each clock tree and switches to the "inactive" one when
diff --git a/drivers/clk/mmp/pwr-island.c b/drivers/clk/mmp/pwr-island.c
index ab57c0e995c1..edaa2433a472 100644
--- a/drivers/clk/mmp/pwr-island.c
+++ b/drivers/clk/mmp/pwr-island.c
@@ -76,7 +76,7 @@ static int mmp_pm_domain_power_off(struct generic_pm_domain *genpd)
 	if (pm_domain->lock)
 		spin_lock_irqsave(pm_domain->lock, flags);
 
-	/* Turn off and isolate the the power island. */
+	/* Turn off and isolate the power island. */
 	val = readl(pm_domain->reg);
 	val &= ~pm_domain->power_on;
 	val &= ~0x100;
diff --git a/drivers/clk/socfpga/clk-gate-s10.c b/drivers/clk/socfpga/clk-gate-s10.c
index 32567795765f..3930d922efb4 100644
--- a/drivers/clk/socfpga/clk-gate-s10.c
+++ b/drivers/clk/socfpga/clk-gate-s10.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier:	GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017, Intel Corporation
  */
-- 
2.26.3

