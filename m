Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5739C3DA7D
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 09:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbjACJYM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 04:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237216AbjACJXh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 04:23:37 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720D3114E
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 01:23:36 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id w3so362787ply.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 01:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaEgQoi2wV88iETdzvSp20U7Cda3EBi9Iq1BYplBC3U=;
        b=fRKiuLLPQXtm+PoLAnEO0C/uRszb5OZg3YHcvW2RCgSXdgYSqmUNIVOR6Yw5IkkkHr
         +QjxZ3RVzCBOcOirYxxHt0r1WoqCp6tPnX+mb/UoZ6kAIx7Lm+E/ou+rSr9EZ2qoQeD6
         bIpAN5WyNbnUdEwIzQE/O3pT9ZYGzuzsfHPQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaEgQoi2wV88iETdzvSp20U7Cda3EBi9Iq1BYplBC3U=;
        b=sMIdTQfKHEoELmo4ysneJrFY63T6Vb5DQLuPFc919iBIYJxgDRJgivMRadTnUzVuu0
         fzKG5qz0KxdSEdT9CaOZbnfIb2lFD4fr/24DYa+wX15gSju9YI99QIApnSqFqfHMGBgR
         p1UTOOPg97QFfxCGwa/Cd0ntNmcoYI2fK2lKs8+6C0z/wqkrsUZOrNFawr7IJ1ZyvQa6
         3uJKwFA3XxNzOuYLlfDvrGHfg0Cv/rO0VzCxapQIsOvJV5OwlDP6HEJzpoVZUi96mHHv
         nk7oPeqonjU24qvpg/AJAYggmTsFJlujT+8iF52yqLWw2LaacP3iRnjqi7EJMO/WQBZn
         pQxw==
X-Gm-Message-State: AFqh2krDcdrwZ8+kH5cEommyeEKpIvnGIDTvl2UtlrQznh6xUqEgyOWE
        8EsjFqGCLSVnWV2cc0J3ysEeiA==
X-Google-Smtp-Source: AMrXdXscvLpHbGWlFWU5ZkobIrKEQnk7OF5Eruk64rC/Zl69xEwyZqBgAT2SpMsWhcqVpsg57yVxIg==
X-Received: by 2002:a17:902:f112:b0:189:9ee0:cc8e with SMTP id e18-20020a170902f11200b001899ee0cc8emr40941085plb.57.1672737815982;
        Tue, 03 Jan 2023 01:23:35 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:96d9:31a:590:4d72])
        by smtp.gmail.com with ESMTPSA id y126-20020a636484000000b0049f5da82b12sm6868632pgb.93.2023.01.03.01.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 01:23:35 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: core: Honor CLK_OPS_PARENT_ENABLE in clk_core_is_enabled
Date:   Tue,  3 Jan 2023 17:23:30 +0800
Message-Id: <20230103092330.494102-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In the previous commits that added CLK_OPS_PARENT_ENABLE, support for
this flag was only added to rate change operations (rate setting and
reparent) and disabling unused subtree. It was not added to the
clock gate related operations. Any hardware driver that needs it for
these operations will either see bogus results, or worse, hang.

This has been seen on MT8192 and MT8195, where the imp_ii2_* clk
drivers set this, but dumping debugfs clk_summary would cause it
to hang.

Prepare parent on prepare and enable parent on enable dependencies are
already handled automatically by the core as part of its sequencing.
Whether the case for "enable parent on prepare" should be supported by
this flag or not is not clear, and thus ignored for now.

This change solely fixes the handling of clk_core_is_enabled, i.e.
enabling the parent clock when reading the hardware state. Unfortunately
clk_core_is_enabled is called in a variety of places, sometimes with
the enable clock already held. To avoid deadlocking, the core will
ignore readouts and just return false if CLK_OPS_PARENT_ENABLE is set
but the parent isn't currently enabled.

Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is a less invasive version of "clk: core: Honor CLK_OPS_PARENT_ENABLE
for clk gate ops" [1] which caused regressions on i.MX platforms.

My guess is that the i.MX clock driver uses clk_hw_is_enabled() in it's
set_rate callback, in which the new code causes a deadlock.

v3 drops the enable parent on prepare/unprepare bits, as it's unclear
who benefits from it, and the locking is hard to get right. The part in
clk_core_is_enabled() is changed into a bypass path, as described in the
commit message. This fixes the issue I'm seeing, and hopefully doesn't
change the behavior on other platforms.

[1] https://lore.kernel.org/linux-clk/20220822081424.1310926-2-wenst@chromium.org/

 drivers/clk/clk.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e62552a75f08..496b86e2753c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -244,6 +244,17 @@ static bool clk_core_is_enabled(struct clk_core *core)
 		}
 	}
 
+	/*
+	 * This could be called with the enable lock held, or from atomic
+	 * context. If the parent isn't enabled already, we can't do
+	 * anything here. We can also assume this clock isn't enabled.
+	 */
+	if ((core->flags & CLK_OPS_PARENT_ENABLE) && core->parent)
+		if (!clk_core_is_enabled(core->parent)) {
+			ret = false;
+			goto done;
+		}
+
 	ret = core->ops->is_enabled(core->hw);
 done:
 	if (core->rpm_enabled)
-- 
2.39.0.314.g84b9a713c41-goog

