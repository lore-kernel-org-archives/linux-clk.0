Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7748CC43334
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 11:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiGLLcR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 07:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232194AbiGLLcL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 07:32:11 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F54657258
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 04:32:09 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 73so7279752pgb.10
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 04:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oyv6ls5n5LtXZ+eFrLN0Kgir8c8eeeHctyKmi21xDfU=;
        b=ImsYx5Ku+Ab8MqVb/ZzRH9XFV9El4m+WUWrW9VTtX2efmRpl6j584D6ilTaioM7GuY
         3VWIEvaYsJqJnJa8kNtQyoKP3nRUjATbmmw20kX0OzdXf2ckm2LhB7D57Z1bD50XZDfH
         PlJK0/nVT2+QXEt8i3DxTxerhl831H78bmZxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oyv6ls5n5LtXZ+eFrLN0Kgir8c8eeeHctyKmi21xDfU=;
        b=mAychO5q6Wy2QhVC8pj82cRD0MDDxXRUZl5+ksI4kbkMQEbgYN3LBiRSrdUvkH/n+1
         TLAkSrtg1emS19Vxiv18LOJqAtDs7YQJ34FutCHwHLiVFgaUJkYCy1cDuMrpaI1EMiw1
         DyINp5JEW9Yq/vCJms8eAcmxvYseVamKxEwE0tbvID3ykpUaQbo4nH2KF8Ya2DO58qqZ
         S9CB/BayaFxzv6nP/6ra2KbcIukfsgJ3iswnfExbvmYfnV78R0TJSV+EjJJL06YlXiAw
         nB7cTVBF/RSHwtRNeGpUqp2Jin2RcLMn47toNs5CS95A8qAs/4s2/JdIg9S1euI8RPkk
         tROw==
X-Gm-Message-State: AJIora+6+fb7AAdYDgAgvdZ7FXOgmnzuwxyotCu57yhxHXLpZC2Pqveb
        jYPaHqRkNzad4ketBgC8kl44OQ==
X-Google-Smtp-Source: AGRyM1vNTI7P5FFRL8K9PK2KWyhjO0NXooJUOhB6blvPca1HMAd1tLyTL0bTIb9nIiSlIRA9J2QFCg==
X-Received: by 2002:a63:2c89:0:b0:411:66bf:9efc with SMTP id s131-20020a632c89000000b0041166bf9efcmr19639098pgs.589.1657625528922;
        Tue, 12 Jul 2022 04:32:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1a9:ca7d:e86f:cf6f])
        by smtp.gmail.com with ESMTPSA id m12-20020a170902f64c00b0016bf9437766sm6527972plg.261.2022.07.12.04.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 04:32:02 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
Subject: [PATCH 0/2] clk: Fix CLK_OPS_PARENT_ENABLE and runtime PM
Date:   Tue, 12 Jul 2022 19:31:05 +0800
Message-Id: <20220712113107.871623-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

Here are a couple fixes for the clk core. They are unrelated but overlap
in diff context, so I'm sending them together.

Patch 1 makes the clk core honor CLK_OPS_PARENT_ENABLE for clk gate ops.
Without this, dumping clk_summary on the MT8192 would cause the system
to hang.

Patch 2 reorders the runtime PM call in clk_core_unprepare() to match
the order described in its original commit, and the opposite of that
in clk_core_prepare().


Regards
ChenYu

Chen-Yu Tsai (2):
  clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
  clk: core: Fix runtime PM sequence in clk_core_unprepare()

 drivers/clk/clk.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

-- 
2.37.0.144.g8ac04bfd2-goog

