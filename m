Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D3DC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 11:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiGKL43 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 07:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGKL42 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 07:56:28 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDCD326DD
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:56:26 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g1so5889789edb.12
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7PtfrXO1muPciH2j8bRjfuNDfP1Fsd4zwF2waXvYN50=;
        b=onJg3HN0oCrv0W9dCJRxiNKQyqV0TFr8Dfwdc6eY989ZSl6ci0/0AY2iXw2m4ibjeH
         0OjAJXtJYm1FPVegXDX5Gvdh4tEDG9PMMK1MDRnVw65gG+UOrFGa3r1PCKFWXz8IbDYe
         Xku+4mbYsI6U+HV+o47l+gFl9fNlAO6fHYzIDhVkLTrUDpTKWGOD2F39yTxbpEPZt1cX
         tdb791uUZvPSSo2YwpY0j6fB5gOzUhdEKV6AN0W/hgPp3G4883XWlecmnuyaatZdpHtm
         wQasHxidD1d0T9fW9LYURrF4UtYTzcXoBU0MbwlIJxf5D+0e8v9Qb1ZMzBG/rU74QlxC
         VFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7PtfrXO1muPciH2j8bRjfuNDfP1Fsd4zwF2waXvYN50=;
        b=S/Ar9pA3Zf5bjCVDaJ6uzrLDm7Ob2i90G0giMgoSXnkHgd+ai4PE91QNqzEz4gz3sR
         lNr6Epcu7aphqtTXBuKAOzirY0Fmv+yKOVOftA6bJVDGMvWxo6ZlOcpCD7bu6cPJbbpD
         kUQWnBkWlC2/ifFVNcSsW32RZMc/e5EWA/ZiHHynDgWzCJeB47j/Z0yXYawvVCSUpgp3
         7gzp42RCDXeAhPNB0GOPt2ojILuJQZ6/CSVXRenjl/Wh7luCGGrDJeT7HdKzjTNoe9kQ
         Y+qmWifi2jm+uiAIy/1KwMa8A1DHocGDm1kXKwC/9wmAquFYaEmRyv2TzUx+YxMJuEWq
         jJqw==
X-Gm-Message-State: AJIora8R1jUvXt3B+BC6/euk3M07wbNKp9tHZs+jSonkF7jykz4ecZbC
        jwg+heVLkEqYtC8q2RwcHHSexQ==
X-Google-Smtp-Source: AGRyM1vMfIA4XQ6ZtFet6Vbj8aoaBP0vzK/gnYP4nB46mV88UIvfjrpml3nHPraiPFFSJbxez3fkQw==
X-Received: by 2002:aa7:d389:0:b0:43a:56c0:c863 with SMTP id x9-20020aa7d389000000b0043a56c0c863mr24055139edq.373.1657540585360;
        Mon, 11 Jul 2022 04:56:25 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z9-20020a170906270900b00722e50dab2csm2594932ejc.109.2022.07.11.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 04:56:24 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v5.20
Date:   Mon, 11 Jul 2022 14:55:42 +0300
Message-Id: <20220711115542.1015136-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-5.20

for you to fetch changes up to c196175acdd3ab06114bde2955971bc7282f2b85:

  clk: imx: clk-fracn-gppll: Add more freq config for video pll (2022-06-16 17:28:59 +0300)

----------------------------------------------------------------
i.MX clock changes for 5.20

- Correct adc1, nic_media and edma1's parents for i.MX93
- Fix rdiv, mfd values, the return rate in recalc_rate and add more
  frequencies in the table for fracn-gppll

----------------------------------------------------------------
Haibo Chen (1):
      clk: imx93: use adc_root as the parent clock of adc1

Jacky Bai (1):
      clk: imx93: Correct the edma1's parent clock

Liu Ying (1):
      clk: imx: clk-fracn-gppll: Return rate in rate table properly in ->recalc_rate()

Peng Fan (4):
      clk: imx93: correct nic_media parent
      clk: imx: clk-fracn-gppll: fix mfd value
      clk: imx: clk-fracn-gppll: correct rdiv
      clk: imx: clk-fracn-gppll: Add more freq config for video pll

 drivers/clk/imx/clk-fracn-gppll.c | 36 +++++++++++++++++++++---------------
 drivers/clk/imx/clk-imx93.c       |  6 +++---
 2 files changed, 24 insertions(+), 18 deletions(-)
