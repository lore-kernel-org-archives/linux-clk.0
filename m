Return-Path: <SRS0=s9Xv=RI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C38C43381
	for <linux-clk@archiver.kernel.org>; Tue,  5 Mar 2019 04:49:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CC9B2082C
	for <linux-clk@archiver.kernel.org>; Tue,  5 Mar 2019 04:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gpYMhnbK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbfCEEtn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Mar 2019 23:49:43 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:47092 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfCEEtn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Mar 2019 23:49:43 -0500
Received: by mail-pg1-f195.google.com with SMTP id 196so4717974pgf.13
        for <linux-clk@vger.kernel.org>; Mon, 04 Mar 2019 20:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k7wULXXbasfiJzjma87EPvIMtuy4uP4l7hd9LnQo2Ms=;
        b=gpYMhnbKloRJllZAIQBHZnN6i9bi2oW1nE6dif/rEpAZgs+d/Lv/sDiIRV7P3NgZbl
         z8UpIfBYynxakaFKKJOmy7kSG/1lQHNalLyzz+opU/2/gf7hy68X1KNS5YYq2Ol8GaUU
         mKV9E5e1rk4CAuliDncKlP26YiT8FF0CbWMtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k7wULXXbasfiJzjma87EPvIMtuy4uP4l7hd9LnQo2Ms=;
        b=jokJUY7jDBVMEPCwalNNu1+wN/V9D31bRd1cgXofhkhC35Rilvmu5uZqSRws1kWURN
         J00ypPnoG95gx9vQTS+l2+Bnu8KxmGyDN/wTEGf6H16gzr48qr4XqexW1O3fP1woYUXs
         cZwmnZLkIh4QA0uVF9d82NEhgmqY/YTdEHlwJkWWPnRmTDv94FmNRNbcToN9zx9hsH3o
         gDvhDJzw9qu6BwGme1RZAlqfBkrc7+fjrL8tcmApCcxXKTXacFQSAI75XdqKKl7ACkQn
         aVLpGuSoMt0ouUHfayAqKzg5zsvaPD3TwvxHQ+4MWsGkEKRURYRBwPh4RE7yJJd0IDDn
         GYeg==
X-Gm-Message-State: APjAAAWeoOwMJbrojGDk9wmmnydvrdLZvq4aSHsf7XfOuDGABkq2++/a
        ahu3l3Hr/5tvx4lapolI1JA2HA==
X-Google-Smtp-Source: APXvYqxagnb2X0j1Cs0vJg2qbYSrSE8QmUo3yMrLrSnBV7OTdM7NjrAI6FU/U6zf7NNZAy0A50Vn+Q==
X-Received: by 2002:a17:902:6f08:: with SMTP id w8mr24407125plk.5.1551761382586;
        Mon, 04 Mar 2019 20:49:42 -0800 (PST)
Received: from exogeni.mtv.corp.google.com ([2620:15c:202:1:db8d:8e3f:2514:5db8])
        by smtp.gmail.com with ESMTPSA id z15sm15893883pgc.25.2019.03.04.20.49.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 20:49:41 -0800 (PST)
From:   Derek Basehore <dbasehore@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, heiko@sntech.de,
        aisheng.dong@nxp.com, mchehab+samsung@kernel.org, corbet@lwn.net,
        jbrunet@baylibre.com, Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v2 0/6] Coordinated Clks
Date:   Mon,  4 Mar 2019 20:49:30 -0800
Message-Id: <20190305044936.22267-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.21.0.352.gf09ad66450-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v2 changes:
-Unrolled recursion in unprepare/disable for
"clk: Remove recursion in clk_core_{prepare,enable}()"
-Fixed issue with "clk: fix clk_calc_subtree compute duplications"
-Fixed bug with too few allocated clk_change structs in
"clk: add coordinated clk changes support"
-Further cleaned up patches

Here's the first set of patches that I'm working on for the Common
Clk Framework. Part of this patch series adds a new clk op,
pre_rate_req. This is designed to replace the clk notifier approach
that many clk drivers use right now to setup alt parents or temporary
dividers. This should allow for the removal of the
CLK_RECALC_NEW_RATES flag and the implementation of a better locking
scheme for the prepare lock.

Derek Basehore (5):
  clk: fix clk_calc_subtree compute duplications
  clk: change rates via list iteration
  clk: add coordinated clk changes support
  docs: driver-api: add pre_rate_req to clk documentation
  clk: rockchip: use pre_rate_req for cpuclk

Stephen Boyd (1):
  clk: Remove recursion in clk_core_{prepare,enable}()

 Documentation/driver-api/clk.rst |   7 +-
 drivers/clk/clk.c                | 659 +++++++++++++++++++++++--------
 drivers/clk/rockchip/clk-cpu.c   | 256 ++++++------
 include/linux/clk-provider.h     |  10 +
 4 files changed, 642 insertions(+), 290 deletions(-)

-- 
2.21.0.352.gf09ad66450-goog

