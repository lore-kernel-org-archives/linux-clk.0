Return-Path: <SRS0=ekiN=X3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759EBECE58C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Oct 2019 09:15:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B3EE20679
	for <linux-clk@archiver.kernel.org>; Wed,  2 Oct 2019 09:15:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="T/aGw4jB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfJBJPy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Oct 2019 05:15:54 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33440 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJBJPj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Oct 2019 05:15:39 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so18750302wrs.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Oct 2019 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nE4XL8qms/9Kpgy3n+0LiYMlRLilMKnu0uTWVFko214=;
        b=T/aGw4jBTIUHeH9SKGQLtK1hvCEFgU+EMbG+nv70eK/25cpAooafnR8JbK4j/uyYFy
         IuVO65n51+KadCsWy1hwU16qrq3ujxIUpZVP/E+jc6d4VzIBwCsSLrFX08ZRyepE+Q5M
         SVBgd9lMVOlZGao1ZypNTExynwUn7IzZGEeivtTBnw7Hm5lhkN8OyaroXPUNtDdeLaQH
         bfZcY/3vqaGDIj5ctUMEvX88YDnzl5FLgQXFS2q64VNckirJ3rDGJMHcKaqSBJar7Q7a
         dq/32C3NeflV3mh7SeOrS3O6m9x856HR3M448QwkMPFYqRnSt84hWZef1o5dqWvNB3XZ
         3YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nE4XL8qms/9Kpgy3n+0LiYMlRLilMKnu0uTWVFko214=;
        b=Pi12JyQ2kc1YM6mHVR7wkQowF1+glJP3wYlUQhlNDWt4ikaiMZKuEWToCdBzu+WsT3
         dEQA6SqJWn/DVFC/2q6qVIo9Hrva9RiAqy4rVdHkZnQWDhwZMP7cBKU/SQxH6uE8Tleu
         7pxPJJ+C4rf0X9ZCBkYAp/Ou77BzXAW8d6yNU4ASd1gum0D7YRdK5eI+9B3f81X4bApk
         s8ixZa1oeg9f4xh13FZhhzgPX4aa9nRmO0+m/ZKmwNyA03MCsALAts703QI67PDh8qri
         7f6kBoAR6SRfAVxsJqkBhbyxzrjmu1fi58gaho86j6DaydojdsILF9LKuR+10XG6yaIk
         X0wQ==
X-Gm-Message-State: APjAAAUub51c/gXY2gzIy6DZbNqse38UQ2uRMlinbz7R+z8z6eTOFl4+
        gMp2LQewGHKBQdFWrFHAXQFMGg==
X-Google-Smtp-Source: APXvYqymrSpIQdJa2W/1+In8Zgc9ChQQebe+UJurZWszpY6vhZXVv5ks8iziGJ7wEuF/wSAOsbv+ZA==
X-Received: by 2002:a5d:4083:: with SMTP id o3mr1938600wrp.216.1570007736610;
        Wed, 02 Oct 2019 02:15:36 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r13sm32913737wrn.0.2019.10.02.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 02:15:35 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] clk: meson: axg-audio: fix regmap last register
Date:   Wed,  2 Oct 2019 11:15:26 +0200
Message-Id: <20191002091529.17112-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191002091529.17112-1-jbrunet@baylibre.com>
References: <20191002091529.17112-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since the addition of the g12a, the last register is
AUDIO_CLK_SPDIFOUT_B_CTRL.

Fixes: 075001385c66 ("clk: meson: axg-audio: add g12a support")
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
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

