Return-Path: <SRS0=sOJR=XT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD04C432C1
	for <linux-clk@archiver.kernel.org>; Tue, 24 Sep 2019 15:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6C1220665
	for <linux-clk@archiver.kernel.org>; Tue, 24 Sep 2019 15:34:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rjG+varg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390092AbfIXPeK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Sep 2019 11:34:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34918 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389948AbfIXPeK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Sep 2019 11:34:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id y21so576026wmi.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2019 08:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dh9XywZyLTCEU9VpEXYE79qPuQujE0B5wNNWQ2nxxJ4=;
        b=rjG+vargwxDj2KwtJjtaacIpP3swgMu2v3aY0fGPy5zJZ16OcMyTzhvhMn5HRMn1qE
         yiQC+8r+QYnwpvDuhsKYrDQMGlh2w2e6Y/PqePq0PEZJ6zvxursSYeUGIEeH+dj8u6LB
         uH6DvPLfD5xb68bFpB8t418bjzp0o8ULmn0cieweGdzRxQgknQ8s7T1iPFz9DMqNGXJr
         cL2eE2SGZMzq6aqbQV4mWhdghCEyixRQOR0aSaP1WhX6WnP/QspAEZ2cewmxjMAC0WLh
         IFlK3BDwGB2ZRIzjOW3nPoCGe7td+2wUM/lM6P0kFemkH7urSee3oKU4J6axhvyaEWDy
         0k1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dh9XywZyLTCEU9VpEXYE79qPuQujE0B5wNNWQ2nxxJ4=;
        b=faGn2h3uDlzDWauP3UJNtAajJbWIhTTHHMIPqrezaMI8y5fBsQnmSZhugUbCmOGMJc
         0dPAE92I6//kvXf+FcPk6JlN0xBoPjSU/UqBVXWN0043sDeOfb4e0KyFZ34T5deuDUvd
         Zs0n8m8gyohg7CfP2uFJ9FSgMFt6yh/ydwC3S2zs/TMMfQhiqDwuOY3vURyMYquhi2IM
         okM4s43EjCAmzUVT5MApSs96sGQJBk1ZJCSe8FM4cVP7Ac/P941/74M7RNZcHomrLvaO
         651xVVnQkQA+q8r6pV8MdyI1mOOo/6o1XpcJPQutT+NHpk+ETx7S8dEsR9jrJxPgQEaO
         TVQg==
X-Gm-Message-State: APjAAAU+3lAoF7qMSETK8RJq8R+6f4Mt1f7HC4R8piRslI/NaGM5bAbE
        KJk0QpqUT/YuRSKpiL8IKyEOUA==
X-Google-Smtp-Source: APXvYqwlGBXRElDM0eApws6AZRjIJQE3BqxPvg9sVjwLZTzu1UoqZpL4jIGeUerFnD4Hh2/e3Vf/dQ==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr784182wmg.38.1569339248189;
        Tue, 24 Sep 2019 08:34:08 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id d10sm144240wma.42.2019.09.24.08.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 08:34:07 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] clk: meson: axg-audio: fix regmap last register
Date:   Tue, 24 Sep 2019 17:33:53 +0200
Message-Id: <20190924153356.24103-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924153356.24103-1-jbrunet@baylibre.com>
References: <20190924153356.24103-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since the addition of the g12a, the last register is
AUDIO_CLK_SPDIFOUT_B_CTRL.

Fixes: 075001385c66 ("clk: meson: axg-audio: add g12a support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 60ac71856e5e..4b34601342bb 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -997,7 +997,7 @@ static const struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= AUDIO_CLK_PDMIN_CTRL1,
+	.max_register	= AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 struct audioclk_data {
-- 
2.21.0

