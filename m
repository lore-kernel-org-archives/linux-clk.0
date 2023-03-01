Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9464FC7EE33
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 21:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjCAV4R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 16:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCAV4Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 16:56:16 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6992E2F783
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 13:56:15 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id e11so2374841ioe.3
        for <linux-clk@vger.kernel.org>; Wed, 01 Mar 2023 13:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677707775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McTsAUqZkAV7zLauInuOHjFJwSfQC5KCbYHZ7tClzx0=;
        b=GSfw6y2jwfXAO84+XOFSKmMOyhVYcb0FBs4DA5wBW4X1TNCWlTBpFs0v/ATCvTABuz
         yAFY2SJ0ZOHJRA8BfYbqYmRmpDqIt1B7YJnqmJWPNvEaEQNU6xkTDGXQA/vwGuwhzHLp
         eqTQ2cDNGBEOnVlEcA3BgMLx1agMfveEWQpP/vySWcfU9I04ql1+50dFVjvSemWJA4Hn
         p90ome3dFWb97JKYm4iimncvAsewGUYuBtfywTWVSOGCzHoi6fThVdf9vfGG54jzfPCl
         FxP+U7f0p4Laj0quE021lCR1obclEgccpOP4DqkyTccADlkMWBjU+tv+vcvAnQkbu8tQ
         wWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677707775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McTsAUqZkAV7zLauInuOHjFJwSfQC5KCbYHZ7tClzx0=;
        b=rnABc+/YCY+au6btDSkPDxGfkm7T+j1cFI/BGm59uyRaCmpPWvFFnkETMvQu8xtsZW
         B6baRmEjD8pD++UNrirmzn87o98SXJx9YOfMOGDkjyYdoLuWUTXJEpcEgmPzVKi8+1KE
         mSFKjgSy2E96g+6sZjEkgKrvihiL0eXGkh2BrHwATXxp66YoNQiRBwmPmayJo3VpqadM
         2TdleLVxfjcfaBsKnt0AZk/XZAipl7f/sgICl2CsHn6LvfzBuXM28Oq2HBG9Es8hwUq8
         PvOcWMVDvgLKFsYQ2vrIolDSRcF3fL8luqx4Fc1cy5D7aSdbjWrS62+NCNYN6L61s8sU
         sKDA==
X-Gm-Message-State: AO0yUKU2nyF4mPZ1a47IoVbaarxocWVRcZot/J+xdKFL1+5bzabLk7zG
        O/mMRE836nwCzDxYrbUtlMe6xQ==
X-Google-Smtp-Source: AK7set9v+6S+jkNczgInoCYidsVF/TPDbuPIyPu1sWj5CWZeRLH/mskaNR6+wApnTy7apiOsK0TUiw==
X-Received: by 2002:a05:6602:180b:b0:74d:1ccb:e5a5 with SMTP id t11-20020a056602180b00b0074d1ccbe5a5mr4789817ioh.6.1677707774817;
        Wed, 01 Mar 2023 13:56:14 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a5ec10b000000b0074c9a4bb374sm4173479iol.11.2023.03.01.13.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 13:56:13 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH v2 3/4] clk: renesas: r9a06g032: document structs
Date:   Wed,  1 Mar 2023 16:55:19 -0500
Message-Id: <20230301215520.828455-4-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230301215520.828455-1-ralph.siemsen@linaro.org>
References: <20230301215520.828455-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add some kerneldoc comments for the structures.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---

Changes in v2:
- tweak a few comments
- document remaining fields of clkdesc struct
- fix typo

 drivers/clk/renesas/r9a06g032-clocks.c | 50 +++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 79b78e68c272..10c85e4417d5 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -29,6 +29,27 @@
 #define R9A06G032_SYSCTRL_USB_H2MODE  (1<<1)
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
 
+/**
+ * struct r9a06g032_gate - clock-related control bits
+ * @gate:   clock enable/disable
+ * @reset:  clock module reset (active low)
+ * @ready:  enables NoC forwarding of read/write requests to device,
+ *          (eg. device is ready to handle read/write requests)
+ * @midle:  request to idle the NoC interconnect
+ *
+ * Each of these fields describes a single bit in a register,
+ * which controls some aspect of clock gating. The @gate field
+ * is mandatory, this one enables/disables the clock. The
+ * other fields are optional, with zero indicating "not used".
+ *
+ * In most cases there is a @reset bit which needs to be
+ * de-asserted to bring the module out of reset.
+ *
+ * Modules may also need to signal when the are @ready to
+ * handle requests (read/writes) from the NoC interconnect.
+ *
+ * Similarly, the @midle bit is used to idle the master.
+ */
 struct r9a06g032_gate {
 	u16 gate, reset, ready, midle;
 	/* Unused fields omitted to save space */
@@ -43,7 +64,34 @@ enum gate_type {
 	K_DUALGATE	/* special for UARTs */
 };
 
-/* This is used to describe a clock for instantiation */
+/**
+ * struct r9a06g032_clkdesc - describe a single clock
+ * @name:      string describing this clock
+ * @managed:   boolean indicating if this clock should be
+ *             started/stopped as part of power management
+ * @type:      see enum @gate_type
+ * @index:     the ID of this clock element
+ * @source:    the ID+1 of the parent clock element.
+ *             Root clock uses ID of ~0 (PARENT_ID);
+ * @gate:      clock enable/disable
+ * @div_min:   smallest permitted clock divider
+ * @div_max:   largest permitted clock divider
+ * @reg:       clock divider register offset, in 32-bit words
+ * @div_table: optional list of fixed clock divider values;
+ *             must be in ascending order, zero for unused
+ * @div:       divisor for fixed-factor clock
+ * @mul:       multiplier for fixed-factor clock
+ * @group:     UART group, 0=UART0/1/2, 1=UART3/4/5/6/7
+ * @sel:       select either g1/r1 or g2/r2 as clock source
+ * @g1:        1st source gate (clock enable/disable)
+ * @r1:        1st source reset (module reset)
+ * @g2:        2nd source gate (clock enable/disable)
+ * @r2:        2nd source reset (module reset)
+ *
+ * Describes a single element in the clock tree hierarchy.
+ * As there are quite a large number of clock elements, this
+ * structure is packed tightly to conserve space.
+ */
 struct r9a06g032_clkdesc {
 	const char *name;
 	uint32_t managed:1;
-- 
2.25.1

