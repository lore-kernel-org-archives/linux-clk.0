Return-Path: <SRS0=/2Yr=RE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48A2C43381
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 10:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7598E2087E
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 10:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rerU53LB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfCAKVq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Mar 2019 05:21:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38945 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727920AbfCAKVp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Mar 2019 05:21:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id l5so25251254wrw.6
        for <linux-clk@vger.kernel.org>; Fri, 01 Mar 2019 02:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nElNlZouH94P7AzbldSSkfrMGRqzf/hdHWeWWp+K708=;
        b=rerU53LB+TkcD5/bPTwLLiFoMmhLcFeVnndc42pJ0NWBmToOLFtLS/tnCDlQmH+Y9R
         ksKXPxoVgTlFyDn1dmnrS/kFic/RzvaV7GkgsvQFq8oxiM6YZ1Zwl6dcLUYikGPYnRMQ
         10oUuzX2KwiF16h7HnDAJ0d9yOY+hFr4j//S4Ha2OCyhRfoGO2rRnUUHQxERd1qXKcyy
         31EsFt2sprzGd9tUGbK4FleihZuiQ3aOWxYDhVKtzF9VSszx/MdzdkBIqh2lTte7By6b
         J3v34v5H/1unr1tVMOkarugBFLXGgBa919Ga+Mie3r00Dspxl0rXAnTAfydtyO31jriN
         O3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nElNlZouH94P7AzbldSSkfrMGRqzf/hdHWeWWp+K708=;
        b=BeBIItzZ8vVzxUoq3ktVWB0txz6D0nhpeS24vSTl6PrbGfMhsVKvDE2aRoOQlC0c0u
         VspXpzcvz+/1ReQWXuITbxD0pYLhsV8WB2npqRaawPxV3Ai5AHcB5Z0JBP4g/Y6zZHAH
         7+wHBwvC6wqI9S2lvnK/R1/IKyV+ElriybshBFjQaoKlASGC4nIOK+5vWC4lvFISTzxs
         NBQwQFrADDJbI0NFLVbai+TJQUy9A412zeVNrMvJ8PDeoSKlbrsnkSkSWI7EwpZxEdlQ
         qbagA5/OFAOcpBlFVuGeEfI7sMWnoqJb/q3s9DSd9ViiYRIWM1q+r1wVeUbVjTrxvfJn
         PCFw==
X-Gm-Message-State: APjAAAUZv/eiq1L/A046AllrqeQwMu3yjiywFRwo63eYQdw9F+YFHFuA
        C0zjskyIgGdeJ2KRwKbq8ike8w==
X-Google-Smtp-Source: APXvYqxVgA392/3bl96BZwxC06Jd03FyoK+trN1mSRPNpZREOoGPzRYIAOWBJAbug1sMtRKNd6rkTA==
X-Received: by 2002:adf:c752:: with SMTP id b18mr2846977wrh.105.1551435704134;
        Fri, 01 Mar 2019 02:21:44 -0800 (PST)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f68sm14446626wmg.5.2019.03.01.02.21.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 02:21:43 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: meson: g12a: Add CPU Clock support
Date:   Fri,  1 Mar 2019 11:21:38 +0100
Message-Id: <20190301102140.7181-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds support for the clock tree feeding the 4xCortex A53
cpu cluster.

This patchet does not handle clock changing, this will be added in a
secondary patchset.

The CPU clock can either use the SYS_PLL for > 1GHz frequencies or
use a couple of div+mux from 1GHz/667MHz/24MHz source with 2 non-glitch
muxes.

The CPU clock must be switched to a safe clock while changing the clocks
before the non-glitch muxes. Proper support will be added later.

In this patchset, clocks are set read-only.

Neil Armstrong (2):
  clk: meson-g12a: add cpu clock bindings
  clk: meson: g12a: add cpu clocks

 drivers/clk/meson/g12a.c              | 348 ++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  25 +-
 include/dt-bindings/clock/g12a-clkc.h |   1 +
 3 files changed, 373 insertions(+), 1 deletion(-)

-- 
2.20.1

