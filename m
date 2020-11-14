Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC82C5519F
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 19:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4094B22280
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 19:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkTpQTcD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgKNTjf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Nov 2020 14:39:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:55284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgKNTjf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 14 Nov 2020 14:39:35 -0500
Received: from mail.kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26E9522275;
        Sat, 14 Nov 2020 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605382775;
        bh=OhUkYtHxpcowYlogkbZuwo4qzcsgKrOVLFlT2QSSKF4=;
        h=From:To:Cc:Subject:Date:From;
        b=CkTpQTcDtgyEw9tJHUAGAZ1XV9W2Vg8qYl1dTjglY+b7m8+blomMkD6a8TOSN5Pm0
         SUoHFHRmIW7CTHj2cm2Rq5ipegdfbR9KLjAByYNGvgcJSfGDdoqJbz8LeNpiOhTle/
         tDaiqKm4hIpanPcBCQBIVVrBrL1MG8p0zzW/w+VE=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v5.10-rc3
Date:   Sat, 14 Nov 2020 11:39:34 -0800
Message-Id: <20201114193934.785014-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to c277ca155d2f0028a5c79708426d3f79b54a5fc1:

  clk: imx8m: fix bus critical clk registration (2020-11-04 17:13:12 -0800)

----------------------------------------------------------------
Two small clk driver fixes

 - Make to_clk_regmap() inline to avoid compiler annoyance
 - Fix critical clks on i.MX imx8m SoCs

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: define to_clk_regmap() as inline function

Peng Fan (1):
      clk: imx8m: fix bus critical clk registration

 drivers/clk/imx/clk-imx8mm.c   | 10 +++++-----
 drivers/clk/imx/clk-imx8mn.c   |  6 +++---
 drivers/clk/imx/clk-imx8mp.c   | 10 +++++-----
 drivers/clk/imx/clk-imx8mq.c   |  8 ++++----
 drivers/clk/imx/clk.h          |  5 +++++
 drivers/clk/meson/clk-regmap.h |  5 ++++-
 drivers/clk/qcom/clk-regmap.h  |  6 +++++-
 7 files changed, 31 insertions(+), 19 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
