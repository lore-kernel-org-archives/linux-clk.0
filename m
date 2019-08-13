Return-Path: <SRS0=gnDx=WJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DBDC32750
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 08:57:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7575C2084D
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 08:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6j+im0d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfHMI50 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Aug 2019 04:57:26 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35833 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfHMI50 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Aug 2019 04:57:26 -0400
Received: by mail-pg1-f194.google.com with SMTP id n4so9180530pgv.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Aug 2019 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37bM+YYdRD9+p+K2GooCn2CzimziKBDE+/UWMv3v7Ko=;
        b=l6j+im0dcEApOcvPFl1n4C62I2MghWmNHeHxCVYjDCH+5yi9zYcBrbgD0XD1FPXQWK
         HFMhFgI/H4hmZwAAX9IzBefRSPSu+ABzJ6g/RzTm6PqyDZ6AzSlS/ItJ63FkCgOVEyRy
         LE9mvo7CSZp+JmIV07ApzzxJOV9WQUtkSzqt36bteyD2k0c/FuTb5JeNbhWj7PKbOm33
         HDo3CfU7GULEnn7N3q0G6VJ5pwKj3e4PbjMOifp+M/mPDfPo2D0yFc5CbdD7J5wRqfit
         moAQBShx1G8j1wNeOqeHe+5Kat9wvlnnRwaZp2bpd9haFS6q2LTxoZZp2OFmrVNv8p8Y
         6kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37bM+YYdRD9+p+K2GooCn2CzimziKBDE+/UWMv3v7Ko=;
        b=gopHiefO4lcZrLlCWouQUAvFKiQlz+Ls/GzzKpTvu8+mfT1Dq3i5pPO9J1kpGDHTCP
         u0ztNS9sBwN9VQOPWCyALqU6kIwC9uXy3/DnKi8yph+5MiZPHH9cV2wMWN9CSv/zPrJp
         9USJIZEz/yeRg//pjqJ0Cl73NsTcKHxVgGuwgCCcitwMDwkUO0/0vTdNuuUe3inmnnCp
         OkriZAPz5+5cl6Ru1ODPPYdpMRWGHFOzOgqztVlsR9v5Kdfgt7FcpmS5aJdElk0HiZqb
         K064m7wrg6dASFPQ4p8V7J23uYR3rqGqLWh/tW2qn62usaPoOv80beVkMLPbjiDs1gns
         7vwg==
X-Gm-Message-State: APjAAAWkpA8NNVrYSJxhGGW6riuNHhmyN0kvCchnBnmh/pHnpbJFWWyC
        CKOkhf/QQRh13oD15qNmRaM=
X-Google-Smtp-Source: APXvYqxCIxZZh9rt4cY6na/kBDK/+AQh4OlcNDY29NibndjPkrSR3E1QtKxCxaAPJ1VDwVNVyJyaSA==
X-Received: by 2002:a17:90a:30e6:: with SMTP id h93mr1185304pjb.37.1565686645478;
        Tue, 13 Aug 2019 01:57:25 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
        by smtp.gmail.com with ESMTPSA id s67sm1014503pjb.8.2019.08.13.01.57.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 01:57:25 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     vireshk@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] clk: spear: Make structure i2s_sclk_masks constant
Date:   Tue, 13 Aug 2019 14:27:14 +0530
Message-Id: <20190813085714.8079-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Static structure i2s_sclk_masks, having type aux_clk_masks, is only used
when it is passed as the sixth argument to function clk_register_aux().
However, clk_register_aux() is defined with its sixth argument as const.
Hence i2s_sclk_masks is not modified by clk_register_aux, which is also
the only usage of the former. Therefore make i2s_sclk_masks constant as
it is never modified.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/clk/spear/spear1340_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spear/spear1340_clock.c b/drivers/clk/spear/spear1340_clock.c
index e5bc8c828cf0..9163bbb46411 100644
--- a/drivers/clk/spear/spear1340_clock.c
+++ b/drivers/clk/spear/spear1340_clock.c
@@ -335,7 +335,7 @@ static const struct aux_clk_masks i2s_prs1_masks = {
 };
 
 /* i2s sclk (bit clock) syynthesizers masks */
-static struct aux_clk_masks i2s_sclk_masks = {
+static const struct aux_clk_masks i2s_sclk_masks = {
 	.eq_sel_mask = AUX_EQ_SEL_MASK,
 	.eq_sel_shift = SPEAR1340_I2S_SCLK_EQ_SEL_SHIFT,
 	.eq1_mask = AUX_EQ1_SEL,
-- 
2.19.1

