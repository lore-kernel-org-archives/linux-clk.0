Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9D7C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jul 2022 08:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbiGMIXo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jul 2022 04:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235619AbiGMIXN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2022 04:23:13 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9111724F12
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 01:21:17 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id i8-20020a17090a4b8800b001ef8a65bfbdso2390077pjh.1
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 01:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5tqKmI0VtDav4ikokY0BzkYbycUnUxRQ6P+/2oYKpE=;
        b=a7N3b5EUaL7IAQGgk/tg9fBS5xWt/oI88kNN3Ka8ICnGZuY+llH+mjd0vSJMYO7Chz
         ppeKVX+nDXuJzLSCYom74OLx+Wts00I2An62EJ8GBTHHn7Y6Ph/63CV9Ur/qTExHHhi0
         Aefn0JxibQbjbpUnJ4HXXHslE1frvl0Xad5OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5tqKmI0VtDav4ikokY0BzkYbycUnUxRQ6P+/2oYKpE=;
        b=SdOEtUWF6EuYdaWbvG7NZ7g7XuxHw6oH63c19gEyH0C9DTAygi9wI7fvdkKD3SsJaX
         lIMSlggPAi15yOX9tcV9ick6fsAi/7iwOPmsMmvQqusaq9LaqqB6TlbQ4vxbjKX4Bwfv
         HkzQYx8RhJH66VZhU59EXPjlBoNeTXyUvQ2oinGYO4L9VZTJj1qCGgqWKZjaMi+M9Jea
         kkP2H6K6QtWGKEpDrjsJ2dnc+C0H2HM8L1ZlIFvJ0Vhsuvwv6oyMnDJhHmfVtQfRkYSv
         +soJ8oFgLTniAZE0MsHGSliaSzAkup11fbqtQ2S4rm0kDe+Pof6Pv9yi5KYm8CAYRYKO
         24/g==
X-Gm-Message-State: AJIora+tzEpelhpky7OMuochz76wq8/2mwi7aYms3dBMcpZajcPmD+K3
        3e4UpwAwl6jvhSlq1qL9498FeQ==
X-Google-Smtp-Source: AGRyM1uu4akTezwMzGdR0eJQ60s6v0evsIm8YEeeL5lCapS3JSnaGoHdbdpf7uzWtmUvA52hAn6NGA==
X-Received: by 2002:a17:90b:4d01:b0:1ef:d39b:b140 with SMTP id mw1-20020a17090b4d0100b001efd39bb140mr2595551pjb.82.1657700477146;
        Wed, 13 Jul 2022 01:21:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1a9:ca7d:e86f:cf6f])
        by smtp.gmail.com with ESMTPSA id k11-20020aa7972b000000b005281d926733sm8220461pfg.199.2022.07.13.01.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 01:21:16 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
Subject: [PATCH v2 0/2] clk: Fix CLK_OPS_PARENT_ENABLE and runtime PM
Date:   Wed, 13 Jul 2022 16:21:09 +0800
Message-Id: <20220713082111.2233016-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
2.37.0.170.g444d1eabd0-goog

