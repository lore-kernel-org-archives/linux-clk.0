Return-Path: <SRS0=CLUx=3Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2817C2D0DB
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jan 2020 13:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5F59215A4
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jan 2020 13:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNGZUaJY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgA0NHv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jan 2020 08:07:51 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38395 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgA0NHv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jan 2020 08:07:51 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so2031881wmj.3;
        Mon, 27 Jan 2020 05:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+dzkmbwqLGiC0MDMF81pgmYjZXwtIkKBaIdBuFT5sU=;
        b=rNGZUaJYay2e3SWKx2q2j+p56NV+lxua2rPwyleA5R3GWe2Aw/miDB95e/KPv/S6qC
         qDDT4NhJEXw0HpPCs5dSVOwfK2So+QXCxj/XcaFqlTghB/MVybXojiyKKdcIJbjAVAhB
         F7FzkTh7uprWKfb7ngI3QKIUOR1ccQLvYQ+2vF6aTCAfTtoJq/9pY/NOAFxNVmqf5iS3
         F/S/gG3FuowUVuqck+zZQYXyFu9lrt6qRBlK9RofxvTDOk9WE0EMiWxKrDyx4Umcwkd3
         ckax+VtmOMARjMWzNCV4+HVFfxcdMREfu1yLCY40n73eLLyvH70FxYaV65O8Pjj9qukr
         VYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+dzkmbwqLGiC0MDMF81pgmYjZXwtIkKBaIdBuFT5sU=;
        b=J9KZfllbijg5Ydvmf6xM5edR0Ihyxu9cRwlK2hnrO0qw+euDoXMrp1bl04QvN+yA38
         rZ1vk5wh62FerF4YyoyRCcWZ4Tht2HaMBJoDZyke0mfAn2g71rdu5x4VtvxCsovhhp9b
         VzQWaD3V2OdaKXH1bOhqtU8dQS+Kr0LmULeMf7/U5fBCD2UrqQJE4XXJLaal2XaWi144
         /ZVvoHEwPiyaORF/n/rcCwoEGQuOaDau/cS77m7DSYukznn346s/gn7S41JhY80AjmyQ
         NM6VipcW32PwfqYEFF5SGv08vJH+pWFFeB5XIU3IludIsmxIKCRH+ZH0Grl0VTnkfyaX
         YhSA==
X-Gm-Message-State: APjAAAUTrLQnzIbMKFuN3vvZLRVKg/NLKHMBVjIWbal8Ziznv7yGgAuc
        2tcfwkg3HEkl5U4VOv0c0/vc9q1h
X-Google-Smtp-Source: APXvYqwU9YEOASPpW7H4UxdwkHB8XzHVfD7/u4oVVF1ff8rGi7aSuk1kO9xQIxZcujz7jHnrV6txEA==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr11074022wmi.168.1580130469110;
        Mon, 27 Jan 2020 05:07:49 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id b21sm19731261wmd.37.2020.01.27.05.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 05:07:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.6-rc1
Date:   Mon, 27 Jan 2020 14:07:47 +0100
Message-Id: <20200127130747.2287794-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.6-clk

for you to fetch changes up to 41a1f096e94c9559b45ccce43fba94913ebc7313:

  clk: tegra20/30: Explicitly set parent clock for Video Decoder (2020-01-10 15:50:43 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.6-rc1

This contains some minor fixes and cleanups for Tegra clocks.

----------------------------------------------------------------
Dmitry Osipenko (3):
      clk: tegra: divider: Check UART's divider enable-bit state on rate's recalculation
      clk: tegra20/30: Don't pre-initialize displays parent clock
      clk: tegra20/30: Explicitly set parent clock for Video Decoder

Sowjanya Komatineni (1):
      clk: tegra: clk-dfll: Remove call to pm_runtime_irq_safe()

Stephen Warren (1):
      clk: tegra: Mark fuse clock as critical

 drivers/clk/tegra/clk-dfll.c         | 3 +--
 drivers/clk/tegra/clk-divider.c      | 9 +++++++--
 drivers/clk/tegra/clk-tegra-periph.c | 6 +++++-
 drivers/clk/tegra/clk-tegra20.c      | 4 +---
 drivers/clk/tegra/clk-tegra30.c      | 4 +---
 5 files changed, 15 insertions(+), 11 deletions(-)
