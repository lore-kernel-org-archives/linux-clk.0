Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87942C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 22:10:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C6A361151
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 22:10:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhJMWMc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Oct 2021 18:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbhJMWMa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 18:12:30 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AA9C061749
        for <linux-clk@vger.kernel.org>; Wed, 13 Oct 2021 15:10:26 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id y16-20020a2586d0000000b005b752db8f97so4718866ybm.18
        for <linux-clk@vger.kernel.org>; Wed, 13 Oct 2021 15:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=4NNY1PtBKeyIqZOPwg+/5AAVACjBSk5jshBqw7DuzL4=;
        b=W989fGp2Jy+C3O/nJmqh54V/k5pFgE6DfAw6aGxL8sHj+L1+6FtN3BBYhq1l4ZfQnF
         RXl/yGkv49KjkW44REDBALFiLCZJ+YiHsGE/uzh96/Y5D76dln//kyllFeFoC891cjvE
         1qPAwTZZPx9EDzjSubXB/vSRBz0ZeKKukW2/0/jVzS3cikABkViOfYexOg20SFiRrjWv
         yI4+EFS8HeunyOG/3vukDQfSS+7TqMJZEoYNmH3v6IaScRvSqUDwhHT0ZKrur7yMQzV+
         B3O19iby3yXD0wP18T5kW89IdqMeB9eaHlIYJJPnTNjb7WYd/wIonoXVKvDcHQO1pnQn
         /L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=4NNY1PtBKeyIqZOPwg+/5AAVACjBSk5jshBqw7DuzL4=;
        b=uI9bHcBllfG+feBADa0DpKJyBxnRonN6pTAzBACfQyeYeQM8F5b+wC/dRTG0LbAxwH
         T1MlQEZr7dK4HLytLHZufkP5WYJOVTxSyx4h0Sp6E+kjixKHUGj3whiY2OAD5uwux5nf
         DOgquu5LchUKpudHZH8Hn/oqjEGZX9sCwaGu1EyIpd0yEsjkeuhTjCA1wC0Cauu3Upy3
         HGmbXaJ6RMxngXZyG644NN/yWWgj34LP1D0nGeilQECAlMYMk6e5bfnUlbs59J7OAn/z
         KoHLnZ3jKbHcJuSWc002kOG3b99bnFMxuzhmQH1YWUcBIDHHXqWRiGIeF6C/m2I3nz+4
         4maQ==
X-Gm-Message-State: AOAM5326UhHeZzv76YpeUbNo6gLnqWT+0FVk45PvXLZIgoPz7BPz+LVf
        NXwjgn8ht83ONQJudGmhltK6SzTcccBIY75g6GE=
X-Google-Smtp-Source: ABdhPJx4ZE2mglTj30k16i+fnsT/sKJTW41HKa4dN5F3/ZVirPoqa92T8oyqetS8eL3uFlvjOumKljzIzN9K+TAYsH4=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a25:5402:: with SMTP id
 i2mr2338150ybb.312.1634163026111; Wed, 13 Oct 2021 15:10:26 -0700 (PDT)
Date:   Wed, 13 Oct 2021 22:10:18 +0000
Message-Id: <20211013221021.3433704-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [RFT PATCH v3 0/2] clk: samsung: add common support for CPU clocks
From:   Will McVicker <willmcvicker@google.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These two patches were originally a part of the series [1]. They add
support to the common samsung clock driver to parse and register the
CPU clocks when provided. This allows for the samsung clock drivers to
simply provide a `struct samsung_cpu_clock` to `struct samsung_cmu_info`
and then call samsung_cmu_register_one(). With this new support, we can
now get rid of the custom apollo and atlas CLK_OF_DECLARE init functions.

Since I don't have the hardware to test these, I'm including the RFT tag
to try and get help testing and verifying these.

[1] https://lore.kernel.org/all/20210928235635.1348330-4-willmcvicker@google.com/

Will McVicker (2):
  [RFT] clk: samsung: add support for CPU clocks
  [RFT] clk: samsung: exynos5433: update apollo and atlas clock probing

 drivers/clk/samsung/clk-cpu.c        |  26 ++++++
 drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
 drivers/clk/samsung/clk.c            |   2 +
 drivers/clk/samsung/clk.h            |  26 ++++++
 4 files changed, 102 insertions(+), 72 deletions(-)

-- 
2.33.0.882.g93a45727a2-goog

