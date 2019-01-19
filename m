Return-Path: <SRS0=Arik=P3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA42C61CE8
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jan 2019 20:51:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6B132086A
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jan 2019 20:51:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ovLXPns6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729244AbfASUva (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Jan 2019 15:51:30 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50546 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729210AbfASUva (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Jan 2019 15:51:30 -0500
Received: by mail-wm1-f65.google.com with SMTP id n190so7531486wmd.0
        for <linux-clk@vger.kernel.org>; Sat, 19 Jan 2019 12:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D8GzsuGIY+2IwCvvQJKrmjMBhUhjETBp1QUWiVjEP6g=;
        b=ovLXPns6H/1n+bxUQgtSijMLLp9HWubPS2iprDkMlqaRmpxbKxQKkC7pwM5I8udij6
         trJCNj4f4HOJaCUhraUPetxOvSd5YObvWZzgVmikHVDkUfmlNG5yxkz6Evu69jtew5ox
         /ff3JqJnMy3VbqiDUJDqdk7SzdUxEgAFxfJypp8hrvLENzRGde9y8VM4hIk9MPFQMe2u
         mO1ksjV0r2/j+ExVR7NsV4lN2qKeK9uWVHaE1zENQpCLzE2rrnHBFX5uzmsWKLXb2nnn
         DHPq0PHTtyjOblXyVvmCNCFZ67b27yZ76UTSADDmoAaRaFiQLzUDIXPOIOyBVxep82op
         zLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D8GzsuGIY+2IwCvvQJKrmjMBhUhjETBp1QUWiVjEP6g=;
        b=JVbFqYLJ1iKiRm3xxuXmVRYtz6Dt9zYw7oTWCkW85ncXGZH+6dm4ywgXC8dtCJnZlK
         pmJbGxqKtuj/dTf/aZvP6cX23FzIQKN12pMXd3hAP49+S+GjmJ0yAVCWIWUhiqArhaZJ
         5Rchekb16xCWnsFF1CrjgDCappFrLLOUV+ZPJxWFPZH5Tl+4z3Xo78RskbIegxW7KCtM
         NcVnCZhB+AWybSQMSQJTvzUPcrLyL3fYdGxP1+J7gPnrkLERskT5lquhGSZNNpoviZgQ
         8rVu/294BrsBYtyheEBZoV+/Bz400M98sPglIezI9J0QHpW2FuH5NbhBfCQK12JDmAJg
         T07w==
X-Gm-Message-State: AJcUukdP4lMLPQbMGZlK7U5y6RDrDpgdAxIHKzMNwlKXmHEASYdWw/k7
        mwc+sitAF8gAu+U8Kbu2w+I=
X-Google-Smtp-Source: ALg8bN6Kbc3kdLaVfYXLaPjGHHIKNRJiuGJkqmsYrDQUV1CATv+V2qtzGm40C0QOhSxSo2nWcipMpQ==
X-Received: by 2002:a1c:6657:: with SMTP id a84mr18531361wmc.23.1547931088231;
        Sat, 19 Jan 2019 12:51:28 -0800 (PST)
Received: from blackbox.darklights.net (p200300DCD73A8100FDA9BD4E9DEACC2C.dip0.t-ipconnect.de. [2003:dc:d73a:8100:fda9:bd4e:9dea:cc2c])
        by smtp.googlemail.com with ESMTPSA id 10sm58176662wmy.40.2019.01.19.12.51.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Jan 2019 12:51:27 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-amlogic@lists.infradead.org, narmstrong@baylibre.com,
        jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
Date:   Sat, 19 Jan 2019 21:51:19 +0100
Message-Id: <20190119205121.9621-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It turns out that I'm not good at spelling "APB". Unfortunately an ABP
(instead of APB) typo snug into two clocks in v5.0.

Currently there are no users of that clock yet, so fix it now
before it's too late (meaning before it's used by <something>).

I decided to go the "normal" route where we can have separate
branches for the dt-bindings and the drivers in the clk-meson
repo. This means:
- new (typo-free) clock #define
- change the clock controller to use the new #define
- (next development cycle) drop the old #define


Changes since v1 at [0]:
- split into a dt-bindings and clock controller driver patch


[0] https://patchwork.kernel.org/cover/10742001/


Martin Blumenstingl (2):
  dt-bindings: clock: meson8b: add APB clock definition
  clk: meson: meson8b: fix the naming of the APB clocks

 drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
 drivers/clk/meson/meson8b.h              |  2 +-
 include/dt-bindings/clock/meson8b-clkc.h |  1 +
 3 files changed, 15 insertions(+), 14 deletions(-)

-- 
2.20.1

