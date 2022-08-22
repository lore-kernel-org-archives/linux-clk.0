Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F37C28D13
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 08:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiHVIOq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 04:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiHVIOo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 04:14:44 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056E61B7B2
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 01:14:43 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g18so10226075pju.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=vFL4Ok6aVz+SF4AwWxLqDJ9FHif8ySEihParxtYrieU=;
        b=byGR/js11m4a8Js4TSQCX47v+0BUDKlOmW4jrvz+e1uNJeU7y2gEvVdl7VJwzGPvUi
         fsk+l1iQUDEZrrivhKeoUL+vHAMvMk9UgYv9U9t4Oe8k805g27z4t3vLplIAc/zalee/
         UkrohqvCiKb93QewIV1rqfjJF7IyqR+GS/wn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=vFL4Ok6aVz+SF4AwWxLqDJ9FHif8ySEihParxtYrieU=;
        b=RwQn2saatU2w3aIZrS2OgTVN6x0E+0CsyboHLwtPrwRjCn7nB8CIeZILegmlytRMKb
         mhiJOgaNHqz/thQUSfyi9AqdEVGDC/2aRSEsCZ4kBxYP4OPnfYT1HbSYelGlhuJQ/SPp
         1B0rjNnUuK3Lexi31K4wSBRaV1i6ft8CIJp6no9mtNdulc2ynJ7nmYsxAVrjuDkw89nK
         VgoyDxbVHUovZ03YtWqL770Da710BQM3xhLulQJLmGrY61XQVYOVcoBdUws9YvtSzh3z
         9+MUklrR34c68kOQ11IETVeb54bbYjOpvOIxnh5BjmwDcXJVa82rygXDV0aUC0/xYZba
         ioqA==
X-Gm-Message-State: ACgBeo0ykFtHPMR9CR7Eiay5M64JNgBrt/hr+Y/w7WGUiIgbVaS2LnZ2
        lBke2F9LFCj5NbN2jMsUTDRMGA==
X-Google-Smtp-Source: AA6agR5x1ulnqmLHSRLCyJZRdkdDCiS5g9qlKQK1unmkvno1XeD7aFXF1CYQBd5BdFlFECphtFU0Nw==
X-Received: by 2002:a17:902:be02:b0:172:d409:e057 with SMTP id r2-20020a170902be0200b00172d409e057mr9499042pls.90.1661156082565;
        Mon, 22 Aug 2022 01:14:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d583:9d7d:3429:1b4b])
        by smtp.gmail.com with ESMTPSA id f184-20020a6238c1000000b00536b3fe1300sm1204858pfa.13.2022.08.22.01.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 01:14:42 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 0/2] clk: Fix CLK_OPS_PARENT_ENABLE and runtime PM
Date:   Mon, 22 Aug 2022 16:14:22 +0800
Message-Id: <20220822081424.1310926-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

Resending this series from last month. This is now based on
next-20220822, but should apply cleanly to v6.0-rc1.

Here are a couple fixes for the clk core. They are unrelated but overlap
in diff context, so I'm sending them together.

Patch 1 makes the clk core honor CLK_OPS_PARENT_ENABLE for clk gate ops.
Without this, dumping clk_summary on the MT8192 would cause the system
to hang.

Patch 2 reorders the runtime PM call in clk_core_unprepare() to match
the order described in its original commit, and the opposite of that
in clk_core_prepare().

Changes since v1
- Use clk_core_{enable,disable}_lock() instead of non-locking variant.
  Reported by Nícolas
- Added coverage for clk_core_is_prepared()
- Correct sequencing in clk_core_is_enabled() so that runtime PM is
  handled before parent clock is enabled, matching other functions.


Regards
ChenYu

Chen-Yu Tsai (2):
  clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
  clk: core: Fix runtime PM sequence in clk_core_unprepare()

 drivers/clk/clk.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

-- 
2.37.1.595.g718a3a8f04-goog

