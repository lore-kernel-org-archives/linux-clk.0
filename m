Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D2DC07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA7DE20892
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evQmFRzx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA7DE20892
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbeLGOVW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 09:21:22 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38591 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbeLGOVW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 09:21:22 -0500
Received: by mail-ed1-f65.google.com with SMTP id h50so3850869ede.5;
        Fri, 07 Dec 2018 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qu/VJJX+53IykYtE1WLaYtwjfh15qV/ceiDEkuy3ekc=;
        b=evQmFRzxPM26XrG/ycFNZZ43rIRPxwrmHy8qAOgR3xv9sBYxCyFSii1OtMjtbkJ5FN
         2x/YUE8gqFiJ94H/2AoIiWo2AQJC4mqDRLaspN4KC/QP/FHr6WW796oMmSdkbSMqzmxt
         mKwe5ChrCjY8WElkBE+lqYdKq1z8HNkXsTStO5uW5bhEQXm5AoTJXAK3mWtaHS4GNgEQ
         6l4XCOV8eyx9JfzlX8aP85dDevsU5PN/WZiucbwFgfsmX6xm+0EwyNQcOf+a9OqEdy4O
         T7SW8SENUuPoi7EVr7kWUDPDG/KV6enL4e4extKbjG0Q+f2doy+6DSaPMcqjKeAqF8gf
         Bd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qu/VJJX+53IykYtE1WLaYtwjfh15qV/ceiDEkuy3ekc=;
        b=SpcsZp5IopSGNVCWxkiLWGdZ5unWiN0pBDCesvLmtVg3HxesoOcIpaNnQOyuE0TUHM
         xJiv3elFF/jDTVZaimfDb7CVijnx7PzYM5/zJU7/Oj7vSGps6Ue/S4xA34ZWmYoOxf5T
         2semIAaqnjriDa+P9NjOnw7PjhYAtmOdO+1NOQWWcnK5YSbS7V5A6g9ZYwm9hWFvm7OS
         cx+//Yq1ELiNQ5tRn/5AinhTOjNv+EgXr1BaQ/kTWCY/o51qE2F2YFC2cR2d+HpfzOPu
         71DtaKiM2iQ2c8sFIbYsiwAwThYRG7i32YNjApowE5PEkTZb9vHRzzU4cVVrVoOLkKuv
         GBzA==
X-Gm-Message-State: AA+aEWZVQlofso8rCMAMrTTUVGYQUn33WHqzjujXnV6gAZTq/ipX3Zcs
        HK4Frlv7QNPTore82tcZpnI=
X-Google-Smtp-Source: AFSGD/VIE1g5UFA8Hs+Fgr1Yrl0NVlXh6+dXNq2wk10o8giysHXaMSKSUo8O+ddckU7wGiUYJ6tTOQ==
X-Received: by 2002:a17:906:7692:: with SMTP id o18-v6mr2073762ejm.63.1544192480480;
        Fri, 07 Dec 2018 06:21:20 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
        by smtp.gmail.com with ESMTPSA id e54sm1071722edd.71.2018.12.07.06.21.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Dec 2018 06:21:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v4.21-rc1
Date:   Fri,  7 Dec 2018 15:21:19 +0100
Message-Id: <20181207142119.9574-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Michael, Stephen,

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-clk

for you to fetch changes up to d14ce174ca02ee2a9f390b9e279663b3a848a48b:

  clk: tegra20: Check whether direct PLLM sourcing is turned off for EMC (2018-11-08 12:47:18 +0100)

Turns out that these were not build-time dependencies for the EMC series
after all, but since I already have them in a branch, I might as well
send them out.

Thanks,
Thierry

----------------------------------------------------------------
clk/tegra: Changes for v4.21-rc1

This contains the clock driver changes needed to support the EMC
controller on Tegra20.

----------------------------------------------------------------
Dmitry Osipenko (2):
      clk: tegra20: Turn EMC clock gate into divider
      clk: tegra20: Check whether direct PLLM sourcing is turned off for EMC

 drivers/clk/tegra/clk-tegra20.c | 46 ++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 10 deletions(-)
