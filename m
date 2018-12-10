Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28B0C04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B823920672
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PGWyH6gv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B823920672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbeLJQTY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 11:19:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51274 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbeLJQRq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 11:17:46 -0500
Received: by mail-wm1-f68.google.com with SMTP id s14so11598797wmh.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Dec 2018 08:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4e160jMcepVwiZJsNnnNpZImXigG1UFlKIJPHI/u0ZU=;
        b=PGWyH6gvEgGECqR9NF5BNxl0Py6/byXoGInOFkKVE+0+88Y6FLxsgIjb3fU8ieU/hH
         Rv0xxhJBemSjkPY8qFJr8c2kWelzVfj7BtoPAlZdBWoHM0nxyNAj4bWx58RFyUlZgemy
         4vm3NxVQbl8K/WBJvIyxDtABM3SpgGeLKSnvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4e160jMcepVwiZJsNnnNpZImXigG1UFlKIJPHI/u0ZU=;
        b=lRbNFUllb4Zc07b16tTzbXmVct2fLm+UIzBzjwcnFhQsBjeiyWRHO0FXXwAd8SdhFw
         uDqzToy9jiwFakCQGHQiJHywifdNOWwFB/48/S1Da+45q39ZACAsEjFUNpJK3Kq+216c
         5eXx336Lqp4JFCC7IE6lsJyoLmK5qtyovo5WGArixvfzsgvP65Xr6nQVTX/41bkixXwg
         Qh2+70DtPHW9OLZdNvixDH9lOzxfoDcmPvDCIXWiRrardAd9n/phSwP2+tJby9tCdmxU
         P1/5Tsp7lZqq/jCuncCSnvQVLIQUP6ymLo36D7bpDPbNpNYCXZR4aXXiEXBORpjmTvrh
         cQZQ==
X-Gm-Message-State: AA+aEWbOy0jGM79zTYdn9K+6C5G20ggAsVsjJ6ETCPno3ex3wKoBNYxI
        yOnRkkzQKt7UzG/iPkloEZNqUw==
X-Google-Smtp-Source: AFSGD/VQBz0t2kPLdQnvQlYVMUvZlYL6BnJVEo5bd5LCWWxO1MKzpIa0c7RdrVi/0rm4J+4hN9teWg==
X-Received: by 2002:a1c:8b09:: with SMTP id n9mr11192943wmd.38.1544458663940;
        Mon, 10 Dec 2018 08:17:43 -0800 (PST)
Received: from localhost.localdomain (ip-162-59.sn-213-198.clouditalia.com. [213.198.162.59])
        by smtp.gmail.com with ESMTPSA id b13sm8397503wrn.28.2018.12.10.08.17.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 08:17:43 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v5 00/17] drm/sun4i: Allwinner A64 MIPI-DSI support 
Date:   Mon, 10 Dec 2018 21:47:12 +0530
Message-Id: <20181210161729.29720-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series fixed the issues related to work DSI on 2-lane panel
which is reported on previous version[1][2][3]

This supposed to be a clean series, where it support Allwinner A64 MIPI-DSI
support for 4-lane, 2-lane DSI panels.

This series fixed all previous series comments along with checkpatch
warnings/error.

Changes for v5:
- collect Rob, Acked-by
- droped "Fix VBP size calculation" patch
- updated vblk timing calculation.
- droped techstar, bananapi dsi panel drivers which may require
  bridge or other setup. it's under discussion.
Changes for v4:
- droppoed untested CCU_FEATURE_FIXED_POSTDIV check code in
  nkm min, max rate patches
- create two patches for "Add Allwinner A64 MIPI DSI support"
  one for has_mod_clk quirk and other one for A64 support
- use existing driver code construct for hblk computation
- dropped "Increase hfp packet overhead" patch [2], though BSP added
  this but we have no issues as of now.
  (no issues on panel side w/o this change)
- create separate function for vblk computation 
- enable vcc-dsi regulator in dsi_runtime_resume
- collect Rob, Acked-by
- update MAINTAINERS file for panel drivers
- cleanup commit messages
- fixed checkpatch warnings/errors

[3] https://patchwork.kernel.org/cover/10680247/
[2] https://patchwork.kernel.org/patch/10657541/
[1] https://patchwork.kernel.org/patch/10657619/

Note: the respetive dts consumer for dsi will send once the panel
driver finalized or in burst mode patch series.

Any inputs,
Jagan.

Jagan Teki (17):
  clk: sunxi-ng: Add check for minimal rate to NKM PLLs
  drm/sun4i: sun6i_mipi_dsi: Add has_mod_clk quirk
  drm/sun4i: sun6i_mipi_dsi: Add Allwinner A64 MIPI DSI support
  dt-bindings: sun6i-dsi: Add compatible for A64 MIPI DSI
  drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param
    transfer
  drm/sun4i: sun6i_mipi_dsi: Fix TCON DRQ set bits
  drm/sun4i: sun6i_mipi_dsi: Refactor vertical video start delay
  drm/sun4i: sun6i_mipi_dsi: Fix DSI hbp timing value
  drm/sun4i: sun6i_mipi_dsi: Fix DSI hblk timing calculation
  drm/sun4i: sun6i_mipi_dsi: Add DSI hblk packet overhead
  drm/sun4i: sun6i_mipi_dsi: Fix DSI hfp timing value
  drm/sun4i: sun6i_mipi_dsi: Set proper vblk timing calculation
  drm/sun4i: sun6i_mipi_dsi: Add support for VCC-DSI voltage regulator
  dt-bindings: sun6i-dsi: Add VCC-DSI supply property
  clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
  dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
  arm64: dts: allwinner: a64: Add DSI pipeline

 .../bindings/display/sunxi/sun6i-dsi.txt      |   5 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  45 +++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |   1 +
 drivers/clk/sunxi-ng/ccu_nkm.c                |   5 +
 drivers/clk/sunxi-ng/ccu_nkm.h                |   1 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 118 ++++++++++++++----
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |   8 ++
 7 files changed, 159 insertions(+), 24 deletions(-)

-- 
2.18.0.321.gffc6fa0e3

