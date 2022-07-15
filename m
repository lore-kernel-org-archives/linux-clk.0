Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35534C43334
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiGOQAd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbiGOQAb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:00:31 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F283B958C
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:30 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 738123200A1E;
        Fri, 15 Jul 2022 12:00:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900828; x=1657987228; bh=1G
        97Dj1/Ohm0XJf/uReagTeiymec0XmW4E32+p8ZpD0=; b=kT3yOQIP4NSBa4t7WY
        KUnIvgnNQjKIIpdN4O1cTfsfGEWKArCg8B7LmnDxxzN+4EujdiEy5Z5JxwcFDjo+
        if3SK3Ar6vUOM3eR0RC+5OfGuvvp8t9uZEDc2EYqw3GNdgh2Pbak0YsUQUcxj0BH
        e9o6ePS9S+wyX19zJszcRQRlSc0FDegq/gDHIHSR/RhdsXOtGBFqWiPK23PlgbMV
        K6Vh7F9pG4GQvf1vO1duwzy9jLqvjoCIsjC4soI5MwzGTyORFb12fah2lqXmaLW7
        MHFeC/ayeOWTgaLSL9hqW0u+x1122/B9pbiKzC5Y7o085Pd4Cpx1PNPhHq0Ix47z
        aS3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900828; x=1657987228; bh=1G97Dj1/Ohm0X
        Jf/uReagTeiymec0XmW4E32+p8ZpD0=; b=1BlsT+FgxVQ8C5xXr2CoE6P04oJBX
        GpfjKjablUvv9zYLfefexhaDZCqqX52SKOj/DzyodXD4J06uwNshgh3CobRWC7Rc
        bn6VA28p34DPXGqy6vRLlPiQAfha83fb6nHkHBUZWBXcDgnBnL5aEz2kpdqDk5RU
        3lb4all423PDZTeyNuOEDbMAePJgudQigLx2jdb+BtO2NWF6ez4Lbgd0zhaHMki2
        Fe1t2QYDZam0cA/cpjEmDAgsFLVmOPNQ240Zd4uiAKnZRSlKZnvTWcY3ka98QaLr
        m2YM81idBbyIcHlsIDUy7eimAJqxXBt7l9jdMn7aLnA4uFhzjgjx3XaNg==
X-ME-Sender: <xms:G4_RYvo9CMktU861Hi_MfBwQb9yXjvDoO-EU30hE13XMB4P7GZgOdQ>
    <xme:G4_RYpobnzawnCEddm-GVbeoCwPgRYVFkfyZ1QDz72_EJUm98i9Ds7DNimXCWIWHa
    V3_GtkWKGBv_ETe740>
X-ME-Received: <xmr:G4_RYsN04ym-rxHGMFAQpIOQ2qvaesgbrw3aB2cD35_sQ48qsF1i5DjDJPnK32uaNJvZAl5jwyNPRT9Sf0F_y_nFIBW16oPZnJmcAgI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G4_RYi5VZzP6e4m_DpzCcF4__HCZREHbwhdEobaYTEdDm_XEfItMVQ>
    <xmx:G4_RYu5cMmDFhxFdQkqlj9pR9kTBsn1kfS5dAXrhryIUKy0QC32VcA>
    <xmx:G4_RYqgBPsW7Jvat5WXJA5k9lHqChUBbJaXdioRHXDxj7eJUDjDFBQ>
    <xmx:HI_RYrwGwr0nPfSajhxWmEqkfc3NpgRWDTD8A1OS1H5bZiT7sgVnmw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:27 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 02/28] clk: bcm: rpi: Add a function to retrieve the maximum
Date:   Fri, 15 Jul 2022 17:59:48 +0200
Message-Id: <20220715160014.2623107-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The RaspberryPi firmware can be configured by the end user using the
config.txt file.

Some of these options will affect the kernel capabilities, and we thus
need to be able to detect it to operate reliably.

One of such parameters is the hdmi_enable_4kp60 parameter that will
setup the clocks in a way that is suitable to reach the pixel
frequencies required by the 4k at 60Hz and higher modes.

If the user forgot to enable it, then those modes will simply not work
but are still likely to be picked up by the userspace, which is a poor
user-experience.

The kernel can't access the config.txt file directly, but one of the
effect that parameter has is that the core clock frequency maximum will
be much higher. Thus we can infer whether it was enabled or not by
querying the firmware for that maximum, and if it isn't prevent any of
the modes that wouldn't work.

The HDMI driver is already doing this, but was relying on a behaviour of
clk_round_rate() that got changed recently, and doesn't return the
result we would like anymore.

We also considered introducing a CCF function to access the maximum of a
given struct clk, but that wouldn't work if the clock is further
constrained by another user.

It was thus suggested to create a small, ad-hoc function to query the
RaspberryPi firmware for the maximum rate a given clock has.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c        | 28 ++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-clocks.h | 15 +++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-clocks.h

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6c0a0fd6cd79..182e8817eac2 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+#include <soc/bcm2835/raspberrypi-clocks.h>
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
 enum rpi_firmware_clk_id {
@@ -254,6 +255,33 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
+{
+	const struct raspberrypi_clk_data *data;
+	struct raspberrypi_clk *rpi;
+	struct clk_hw *hw;
+	u32 max_rate;
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	hw =  __clk_get_hw(clk);
+	if (!hw)
+		return 0;
+
+	data = clk_hw_to_data(hw);
+	rpi = data->rpi;
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
+					 &max_rate);
+	if (ret)
+		return 0;
+
+	return max_rate;
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_clk_get_max_rate);
+
 static const struct clk_ops raspberrypi_firmware_clk_ops = {
 	.is_prepared	= raspberrypi_fw_is_prepared,
 	.recalc_rate	= raspberrypi_fw_get_rate,
diff --git a/include/soc/bcm2835/raspberrypi-clocks.h b/include/soc/bcm2835/raspberrypi-clocks.h
new file mode 100644
index 000000000000..ff0b608b51a8
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-clocks.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_CLOCKS_H__
+#define __SOC_RASPBERRY_CLOCKS_H__
+
+#if IS_ENABLED(CONFIG_CLK_RASPBERRYPI)
+unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk);
+#else
+static inline unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
+{
+	return ULONG_MAX;
+}
+#endif
+
+#endif /* __SOC_RASPBERRY_CLOCKS_H__ */
-- 
2.36.1

