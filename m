Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4E1C48BCD
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 21:12:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32108613F2
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 21:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhFIVOB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jun 2021 17:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhFIVOB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Jun 2021 17:14:01 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10230C061574
        for <linux-clk@vger.kernel.org>; Wed,  9 Jun 2021 14:12:06 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id z8so26942544wrp.12
        for <linux-clk@vger.kernel.org>; Wed, 09 Jun 2021 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:message-id:date:mime-version;
        bh=3VtZ8ivaZvGzK6Q1s3dI3c9qaKU47zDuYw8RL8xc2lc=;
        b=SBfTK/ksMVjYx1JSJn/DqFxv4tUY9JJUVK27Kl8WOCOp61H7xuCGKLdva1v8/8m7w7
         PSD0OfU90j/oxzYUqquuSGTKuAfo5vKV9hXSwoO5l4mbimZtpgS8ba6EZWiV+1gTt2aI
         TWwvIPtl4umSjNPiZjw9bSANLMADqxENv5/GzR7Q4A7QhnPocoNiIlGji1ALkibrccc8
         ZB5btbuJkPy5noNfAjk5TC8oqAGoTq+NNiskHieboLMjh+gjwdRJ9+CIktrcTizqNPeq
         vYJwnvjn5lviCLkLPfu279CIbRAyJ+7qvDuUoXfxGAufPF76OA8NyHPtc1ccFt0biydz
         yJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:message-id:date
         :mime-version;
        bh=3VtZ8ivaZvGzK6Q1s3dI3c9qaKU47zDuYw8RL8xc2lc=;
        b=Lak6Sah00achsI9vyOZHGaJUUds8q97j7yNdqIl5MqD5jjKyqj9ge1a7ueBmj617b1
         B9sW+QP6sSEA2acFDj0kV9jvAhJJLUFTc7GDN7Z6qN9HB2nbjK0eSEN/Y/hR3vBdzdB3
         WY+e4OL2dNtG12ptPpCi+wKdT0LtW17Q7AhYpDzm4IZtwURfQc/2R/c3vKsOKuC1nbF5
         oqNlo9pLwkj4t6ne5UPdSa0ig+8KN8n0wqb10VMtS0da8lzMjSPHhGFCHlZbbdK2KIdy
         OECDOEClhra453aaXSbjg1HvjTGZfGaPvGtP/46ukkU4Na/7MbGue1FbQfrPeNzX0gnr
         nWxg==
X-Gm-Message-State: AOAM5323n9+eWcgUQ6gZOzh4FaX2BQF1pPKXI9bD3SWirZuWolb8eCeX
        6BoWbraa1uFQzwt8xKTPGKS6Hw==
X-Google-Smtp-Source: ABdhPJxm0KumdxJ4X/b0nxIMWOW9OqcX4x3xSUJgPGSBixUDqwWMmR+eUSjag7O+08+8JpfImBLl9w==
X-Received: by 2002:a5d:4567:: with SMTP id a7mr1759586wrc.362.1623273124616;
        Wed, 09 Jun 2021 14:12:04 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id g17sm1346392wrh.72.2021.06.09.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:12:04 -0700 (PDT)
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic updates for v5.14
Message-ID: <1j4ke6215o.fsf@starbuckisacylon.baylibre.com>
Date:   Wed, 09 Jun 2021 23:12:03 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here are the updates of the amlogic clocks for v5.14. Nothing out the
ordinary. Please pull.

Thx.
Cheers

Jerome

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git clk-meson-v5.14-1

for you to fetch changes up to 8271813e404cd0620f99fbccffd2746f85a17259:

  clk: meson: g12a: Add missing NNA source clocks for g12b (2021-06-09 21:39:50 +0200)

----------------------------------------------------------------
Amlogic clock updates for v5.14

* Use determine_rate() for the pll ops instead of round_rate()
* Restrict gp0/1 and audio plls range on g12a/sm1
* Improve axg-audio controller error on deferral
* Add NNA clocks on g12a

----------------------------------------------------------------
Jerome Brunet (2):
      clk: meson: g12a: fix gp0 and hifi ranges
      clk: meson: axg-audio: improve deferral handling

Martin Blumenstingl (1):
      clk: meson: pll: switch to determine_rate for the PLL ops

Nick Xie (1):
      clk: meson: g12a: Add missing NNA source clocks for g12b

 drivers/clk/meson/axg-audio.c |  5 ++---
 drivers/clk/meson/clk-pll.c   | 26 +++++++++++++++-----------
 drivers/clk/meson/g12a.c      |  8 +++++++-
 3 files changed, 24 insertions(+), 15 deletions(-)
