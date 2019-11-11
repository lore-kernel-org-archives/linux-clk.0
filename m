Return-Path: <SRS0=ilwl=ZD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D0FC43331
	for <linux-clk@archiver.kernel.org>; Mon, 11 Nov 2019 14:45:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD57821655
	for <linux-clk@archiver.kernel.org>; Mon, 11 Nov 2019 14:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH8D87id"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfKKOpM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Nov 2019 09:45:12 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52432 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfKKOpM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Nov 2019 09:45:12 -0500
Received: by mail-wm1-f68.google.com with SMTP id l1so2236153wme.2;
        Mon, 11 Nov 2019 06:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ZCk1nM4YAgD144W77wosgsbKT3XhW43WmY2+JthDkk=;
        b=SH8D87idU7vOLTZshWePew3NB/DuUEKC+ntymJ/tXCHCSKD+p/FTaIbq1yg8ExY4L+
         Tn6E5TtI9adsujmF6UNWI31E6VWkHyIYnRteRpFBE6EPWg6Fl4k8l81xSsPTtvKIROw3
         t+dm7ujTXPaJJhPL+RMf9QqIjsCwWwHFD4ggBm7C08O6Po74H39gGeaAJwl8m8zpxBY7
         qSxFOgc4gsSmRNnoqKO7UWQYEZIPhx7MuUIjAMhgI4KlPW4m8OFcgBC2H93Z/KTrZcJm
         1n+ErIqkYPppyiMb/HZb90TBtOTz9po11Lja0kBNxN0uOCGwoC4KWkfQHn7G6hJMmLDe
         JDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ZCk1nM4YAgD144W77wosgsbKT3XhW43WmY2+JthDkk=;
        b=cxwOzekAIlGQ4MeaoWVvKgcT6z3YKM8XpEi3IkcLBE9iy1DVlINKqC58outZmffTnq
         DOCamvQ9l968zGPxoEi3I2fI3XYhiOe0yW/LwaBfxZJ+rzgr7qI3BNUWj3s6mkRqwhLW
         6AOwMCU9LJPSwtwZudM51NPqN4GDusVBLkzY5lESJMf/Oeze8975CFV2LXLv4mfRb3af
         fleQTzGHkm9vslplDJIbd50lKTmQ8uBqZtYNpDNzDYG1J6oeEhwii7C4n7aX1qCJ9i9Y
         ZN3KqxiwBbE9Du1NJ6tUJjmr0eqMwsqndLscI+igKOLyj9jfKmA1u7K/g/PvXl9o0BN8
         celQ==
X-Gm-Message-State: APjAAAWyC4x01wzT/QGgqiDnhe5qiacLcElE8y9qErT/MvRXNzQlb4j5
        /6SKeU0SSD5rPOisOS436Fk=
X-Google-Smtp-Source: APXvYqxiF27KKhMvNPHBXO8Hy/cLbNLQqOOkTh26wM03p0gH0WJSoaG1iOO3G00etDcVwosGo/1zJw==
X-Received: by 2002:a7b:c747:: with SMTP id w7mr22039301wmk.62.1573483509985;
        Mon, 11 Nov 2019 06:45:09 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id j14sm16827415wrp.16.2019.11.11.06.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 06:45:08 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL v2 1/2] clk: Changes for v5.5-rc1
Date:   Mon, 11 Nov 2019 15:45:06 +0100
Message-Id: <20191111144507.4027979-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Michael, Stephen,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-clk-core-v2

for you to fetch changes up to d9b86cc48283112f06738d45031b88bd3f9ecb92:

  clk: Add API to get index of the clock parent (2019-11-11 13:59:35 +0100)

This is an updated pull request that contains the revised version of the
new API as discussed with Stephen in this thread:

    https://lore.kernel.org/linux-clk/1565984527-5272-8-git-send-email-skomatineni@nvidia.com/

Thanks,
Thierry

----------------------------------------------------------------
clk: Changes for v5.5-rc1

Contains a single core API addition that allows clock providers to query
the parent index for a given struct clk_hw. This is used to implement
suspend/resume support on Tegra SoCs.

----------------------------------------------------------------
Sowjanya Komatineni (1):
      clk: Add API to get index of the clock parent

 drivers/clk/clk.c            | 18 ++++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 19 insertions(+)
