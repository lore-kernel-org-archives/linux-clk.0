Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B51C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbiGKPYe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbiGKPYe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:34 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170671C104
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:33 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 7898C5C018F;
        Mon, 11 Jul 2022 11:24:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553072; x=1657639472; bh=kc
        0LhrREJaSLjGZGNe+G8sefyqMcr+/UopruD5gecOs=; b=TN719PUY694JVheAyZ
        mKBjdikvy1KrBK9HwBhCacBbIvZCuu1kExYeZ3xLWVD4/iRmDizibiiNd35efdOW
        rqNijlKsPS8ZlkqPGQScRN3FT63+OcYCZMyh5ZVShNCvEWhmJ//etMpkx/vzleVG
        mJWIhRREYxJOkIIj5DUlSxSljqbHkz8PD7uln/1GCxCCgkS1eJ8wkCh7OQfCr6aO
        XQsog1yrz48tqX8jp4q4++Qn9tOHFhyr2ghFj04k+e326Nx8zYKxNdKedX/2r3fU
        M8IHw9K0r3mkmOxq8ys42RfauqP6H9LrW1dm4eFu8tyWP4kpCyuXkMW10eGx7NDx
        h8VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553072; x=1657639472; bh=kc0LhrREJaSLj
        GZGNe+G8sefyqMcr+/UopruD5gecOs=; b=xA/Q3I/vzQeYwXKErW33naMltHaoy
        VnJa1FPzpX5Aj7gj/5Ym911j8OjSWyhwrdFdx8rqcQ3O1ludkLTZZdIZfRWBRvzG
        zvKvBDVq/h8oZBNNTLkF8cUJk3W8RuNPqP7HEAzLdDYd2VoEpitQevNdbFtgb88g
        fewViTMkV/8vHk6/Ecui+iF/eH2fnjnGnvUxNISZf4QePD561hmanTHxc4iX0DY2
        mG4I5Uv3NU/JwO0x7ACEi76GBatCmUyg8EbCAwxF+D9mUawG1nodg2BR6eTcYX/T
        WFJXNmuygc2CEUi0eVGJHIm7S7Cd4M15J90cGs9oV5is12//N+jUaRskA==
X-ME-Sender: <xms:sEDMYnJXA2H3dZzMQqJLljA2paLon_OSlVURN2DRCSxVjeYKvhBjQg>
    <xme:sEDMYrLDChCknOrrakoWpzYy0r8_506_JASGUoK1lqPara-j7EK2iFh2D8w1EdcO8
    QBCv3rEBCGxXlKQG0o>
X-ME-Received: <xmr:sEDMYvuW3zucrSV0m2PSvmvBvjzQvIMCKz2EoOVYzl8hhAxVbiqWMwjlyIOFzJCmKeQl8v9kir7Qr3wTX2DzoIv2C8apcCAdOlMEbes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sEDMYgY3IH6uWusAUizL5rhhata5GhRYVQ9H3XOwhEQy3OcNkgvQ6g>
    <xmx:sEDMYuaV8s6CeqxCh-fq282tqCcLBJUAv9Wklz_XFNVq-S3aBefahQ>
    <xmx:sEDMYkAT5TRxjQ8q-TM_mJxdNpyMjMv4FJppVmjruXyyF5RP8ZmVBw>
    <xmx:sEDMYrRtYi2ZOq5eMgE2kYLorDqqeW3LZZ2jZc1A9ZKLDhXW8PY_0w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 02/28] clk: bcm: rpi: Add a function to retrieve the maximum
Date:   Mon, 11 Jul 2022 17:23:58 +0200
Message-Id: <20220711152424.701311-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
 drivers/clk/bcm/clk-raspberrypi.c        | 27 ++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-clocks.h | 15 +++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-clocks.h

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6c0a0fd6cd79..bbdc428feb4e 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -254,6 +254,33 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
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

