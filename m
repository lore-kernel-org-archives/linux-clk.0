Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BFAC77B77
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 17:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDPRdZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 13:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDPRdY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 13:33:24 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1A792;
        Sun, 16 Apr 2023 10:33:23 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b8b19901fso206360b3a.3;
        Sun, 16 Apr 2023 10:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681666402; x=1684258402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5OXsid8SYL4GdSMfFGQSs/wdoDzyJyZpFKL7M/EWZU=;
        b=r26bZ91MxZ8MIhL3bXOVZym4OV4qGD+oXb+sZ6/Bbj88MEymCf06SEFfbJ1rJvc2q1
         deH0nKmnSkPXiGMsDh1RxIQjjNioNDR3L70xYvCpb2Inm0MnMR7n/+DGpkEtjgFcYajq
         X8MtthEibrfeXhnNPGsq6dO6V9SEASZIjbnyhFcD3zNaW8wdagJYamUA/l75EXgpkl6J
         GCMS75hM8XEm87oly5ydBtTc1eByYn2eL2Rpg97qU6+uhXownM7uxSbs29Q7IOyJCSmn
         GYFFRp+rmojhelvZprQysyptI+Od47EBs7GEdLJBUD3nrUzgqB/ySo7thbgcye8g33D2
         T1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681666402; x=1684258402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5OXsid8SYL4GdSMfFGQSs/wdoDzyJyZpFKL7M/EWZU=;
        b=a1tkmuWnIlv9JU1jN/JbjrxKtwOmqQVwoFWFXMNQY2WKkjiLDfJc2347/H/ULmJy4w
         DBlSPeMu9Y3loW1TPeB+Q4WPnQpo/qkCQeDv4A1jUsI8sI6WdTV+g3QQ0LlRf6LTmeKv
         NgYUGx2fNh9zd74WK9hPZS5dymP3CEVkRFXXmXaLZ3Ibe6PzChFg1L2NdTW83T895d5f
         8/hso3i4UVrnuZAGC8fjSxMSo2oSJrrhhFEXDow3tQ6RtAKBxBN5I3ttvQqiPzeH/Qzn
         PP3xZ4SfeksSc/5CSPpuZ04nqG90R4nQL2DWAzGIdyvguy/OUV9nSkBY9Swr3s2E2aDR
         yzmw==
X-Gm-Message-State: AAQBX9c//BNcAGUG09yc+NrC814eI4anOOoi3WGGnZVjwN2FS5cMpLM6
        g5dMy2ct2/QAvdlFIPjNWssT21sAkPjbk7FrCyg=
X-Google-Smtp-Source: AKy350YOHxcAsnUbt/l01GPFPoS+uNRrCZ4sZGsqnnlfixZL9Q6Mh+rLYgt5VRK0pg//bgX/I5e3zQ==
X-Received: by 2002:a05:6a00:240b:b0:637:c959:8ea1 with SMTP id z11-20020a056a00240b00b00637c9598ea1mr16584791pfh.22.1681666401849;
        Sun, 16 Apr 2023 10:33:21 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([104.28.245.200])
        by smtp.gmail.com with ESMTPSA id j22-20020a62b616000000b0062d90f36d16sm6110973pff.88.2023.04.16.10.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 10:33:21 -0700 (PDT)
From:   David Yang <mmyangfl@gmail.com>
To:     linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org, David Yang <mmyangfl@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] clk: Add basic register clock controller
Date:   Mon, 17 Apr 2023 01:32:56 +0800
Message-Id: <20230416173302.1185683-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These clocks were provided in `include/linux/clk-provider.h`, but lacks DT
bindings. Add a clock controller to avoid operation conflict on same
register.

v2: split clock controller and its clocks

Links:
v1: https://lore.kernel.org/r/20230414181302.986271-1-mmyangfl@gmail.com

David Yang (4):
  dt-bindings: clock: Add simple-clock-controller
  clk: Add simple clock controller
  dt-bindings: clock: Add gate-clock
  clk: gate: Add DT binding

 .../devicetree/bindings/clock/gate-clock.yaml |  58 ++++
 .../clock/simple-clock-controller.yaml        |  50 +++
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-gate.c                        |  81 +++++
 drivers/clk/clk-of.c                          | 292 ++++++++++++++++++
 drivers/clk/clk-of.h                          |  26 ++
 6 files changed, 508 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/gate-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/simple-clock-controller.yaml
 create mode 100644 drivers/clk/clk-of.c
 create mode 100644 drivers/clk/clk-of.h


base-commit: 7a934f4bd7d6f9da84c8812da3ba42ee10f5778e
-- 
2.39.2

