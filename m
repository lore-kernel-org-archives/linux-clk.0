Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3101FA3728
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 12:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BFF22168B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 12:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxHREG00"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405263AbfJPM7Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 08:59:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55119 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbfJPM7Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Oct 2019 08:59:24 -0400
Received: by mail-wm1-f67.google.com with SMTP id p7so2815403wmp.4;
        Wed, 16 Oct 2019 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N52hlJnsfFIOOWTHvFp/qjBhOkVh3s/l10lTxbzvdwk=;
        b=lxHREG00JgRNJN6vqVyEtnpLxHeOiwhECvF8ZrlixdqphxFqPyZHJEbdLiUFpK5SxV
         bKWIQk8vpKf7Y1IeVvFkibBp2+Lt7P3G16+cJMZPe1PIwVVBauK6sVJBRVZnFqt1rH39
         W+GBk+3Ogq7gbeddPnEDV9dDaF+gDFpKhFNSFNy0e0bKONaXdPDS6w6yV+9yCYSReH29
         HHjnMyLp7yEddLgg8k3gNp5znnJ+Ks99dK/EFJZzluq5mwmbLCt7PLnF//eIjt8PbS9D
         XTBC9nHpO5jzHnSTvJMIPx0eboVaw6KXgl+xegAjONo0nMXeaNB98Xa2heuZRBDQs4Ow
         UWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N52hlJnsfFIOOWTHvFp/qjBhOkVh3s/l10lTxbzvdwk=;
        b=fy+7T6TekmmohivjWnl0SInmE2cVfOVzf3ww+tPKGSqQyV/oWbb+h1NAzJma1ccV+j
         Vs0H9jIMEDaioOAzjgHN63jeo5jYmSl3mV9J3kkHI3/JK2+hLI9/2gYNS+yHus46Gp0/
         /Na9GpuRzQahK1GvKSQiu34v4UX/hOHnvXHNug3uUaWpzf+bDICF+8/F6+LD+4ToZTmO
         T1j5lGbHTmxFKfbEfudsxVDjL+1LcuDxadl24/oTO7TaQ2/dFJH7IrAZfZpIbnBO/67y
         rIxRe76lmxGUkDht7/TvQ/tx8gOaHBOi58+7ljEuFphhaNFiSILmCb8gj/bPW/4ztoXb
         dHFQ==
X-Gm-Message-State: APjAAAW5skz4cSe6hZ6oHJXSauS6Jwmw7Lzoqs7WcKuhVX5y/Fxb5n09
        cERQI3TyjHOPOwcI1kO8fo7fbbft
X-Google-Smtp-Source: APXvYqzKpAaGL8t4/0n/9ji8fdyWLeBwMB4yNHH6Lmwr42XuwpJfsJQWrH/atvz/Z0NRGwU8chBFAw==
X-Received: by 2002:a7b:cf28:: with SMTP id m8mr3366592wmg.63.1571230761785;
        Wed, 16 Oct 2019 05:59:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id l9sm2253916wme.45.2019.10.16.05.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 05:59:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] clk: tegra: SOR clock rework
Date:   Wed, 16 Oct 2019 14:59:14 +0200
Message-Id: <20191016125919.1773898-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Mike, Stephen,

this is a small series that I've been carrying around for a while now.
The goal is to rework the SOR clock implementation on older chips to
make it compatible with the implementation on Tegra186 and later. The
reason is that Tegra186 and later implement this as part of the BPMP
(a coprocessor used for boot and power management). BPMP's SOR clock
implementation is slightly different from the implementation that we
currently have in the CCF driver for earlier SoCs.

The SOR clock is used to drive HDMI and DP outputs on Tegra boards and
the differences in the clock handling make it very cumbersome to deal
with the clock in a unified way in the display driver. After these
patches, however, they work similarly enough to allow the same code path
to be used in the display driver.

Given that this set of patches needs to go in at the same time as the
Tegra display driver changes, it'd be great if you could provide an
Acked-by so that I can take these through the Tegra tree (or the Tegra
DRM tree). There aren't any build-time dependencies between this and the
display driver changes, but HDMI/DP won't be functional if this is
merged at a different time than the display driver changes. The display
driver changes themselves are fairly large and it isn't exactly clear
when they will get merged, so things will have to be carefully
coordinated, which will be easier if I do that myself.

Thanks,
Thierry

Thierry Reding (5):
  clk: tegra: Remove last remains of TEGRA210_CLK_SOR1_SRC
  clk: tegra: Move SOR0 implementation to Tegra124
  clk: tegra: Rename sor0_lvds to sor0_out
  clk: tegra: Reimplement SOR clock on Tegra124
  clk: tegra: Reimplement SOR clocks on Tegra210

 drivers/clk/tegra/clk-id.h                    |  4 +-
 drivers/clk/tegra/clk-tegra-periph.c          |  8 --
 drivers/clk/tegra/clk-tegra124.c              | 55 +++++++++++++-
 drivers/clk/tegra/clk-tegra210.c              | 75 ++++++++++++++-----
 .../dt-bindings/clock/tegra124-car-common.h   |  2 +-
 include/dt-bindings/clock/tegra210-car.h      |  5 +-
 6 files changed, 116 insertions(+), 33 deletions(-)

-- 
2.23.0

