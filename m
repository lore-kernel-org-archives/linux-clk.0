Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89962C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 20:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E29E2075C
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 20:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wtmlVeo6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfCSUDi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 16:03:38 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:53881 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfCSUDi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 16:03:38 -0400
Received: by mail-wm1-f47.google.com with SMTP id e74so18147531wmg.3
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 13:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:openpgp:autocrypt:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=WpnIZou/SZYV4cXG99Y+VTUtfseFOoZs7/D8cWviIU4=;
        b=wtmlVeo6OihF0VTCXvrSlyYX+LVlU1eYJsfI6YRgVmn9YzV9c9To2GifiWPYGIG3Jj
         Q8SnBVHs/oM1YSaU25DZd1tY81opFwCKibLp9THA7Ykj3PQ5yQwS0z3wBKUlSEL9/lGh
         BtT0g/wje3qn57oXCHHNuhJ2xZ0HtHpKJIydaEL1/6v8jUNnOjcvuHJr5TB5XZF0xjH8
         mlpJyTYMKbEncWDMthADnat3pqwPpR5kK4gTf9z0jXWSFgnPAzEb8zglWCxh4sK6olAQ
         kFBDuH7hGS8Y+oiMxURlfOPZ9xm7WaDZqutqxNzdhCW87zi4bzBkMeQ05efZVrsRkoCB
         JvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WpnIZou/SZYV4cXG99Y+VTUtfseFOoZs7/D8cWviIU4=;
        b=kY5YA1/sUXHsMK2kpCOS9k9bxBG1Wat//CAYBRvDcNP8ZN2jqJwByMbkyJd701tSsd
         05Loi/gkyDd0rbNphVxbKAPZx+V5Yp1773wbtdEoPkcNhernBuIEy/NE9Ha2BW2oFhcq
         QOE6NP0CJgEqkjyFQA/G/1OYOWqHzvbysdfUIQRRkRVxt49R83Ktw3R3ZKiscAjH3eEE
         LmzbIX6Hoc4DsUogtmM/skyOBSCDoTTI6ZFQ3TE0gpCs6MmoDPvi334zLkIRzIUJf7Re
         e4/Wdh7Ly3SsOhNkI+sklitu/0c5u5l+Rva8s6VYFsZ92p0QM4GgFVQtXFL/+Y7bE0cN
         wYGA==
X-Gm-Message-State: APjAAAVUhmSZ0Zr4UoKe+LXwLrqGE2Y9ZsSs18My5K1Y9EKz3Xlitwn2
        FnyDKvY2lTH80pZDA/HgmfhcIw==
X-Google-Smtp-Source: APXvYqwrv+TRHzc/SuHE+nSI5avWsgEnDxVF+0K9+kdxQsVSySbwfE20cueOAGDIs/AVMQC72p+dhA==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr4818174wmg.96.1553025815712;
        Tue, 19 Mar 2019 13:03:35 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id a9sm9991605wrt.29.2019.03.19.13.03.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 13:03:35 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: fixes for v5.1
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1aff3a5c-75d3-5fd3-1aed-88eab2add828@baylibre.com>
Date:   Tue, 19 Mar 2019 21:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear clock maintainers,

Below is a request to pull amlogic clock fixes for v5.1
These changes fixes a couple of simple mistakes I did while adding video
clocks to G12A, and a fix from Maxime fixing the Video Decoder clocks
rate rounding.

Cheers
Neil

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-fixes-for-5.1

for you to fetch changes up to 9e05e49c29fde3f5e0d82542cb89e26c0bc828d0:

  clk: meson-g12a: fix VPU clock parents (2019-03-19 17:38:41 +0100)

----------------------------------------------------------------
First round of fixes for meson clocks targeted for v5.1:
- g12a: Fix VPU clock parents and mux mask
- gxbb: Add CLK_DIVIDER_ROUND_CLOSEST to video decoder clocks

----------------------------------------------------------------
Maxime Jourdan (2):
      clk: meson-gxbb: round the vdec dividers to closest
      clk: meson: g12a: fix VPU clock muxes mask

Neil Armstrong (1):
      clk: meson-g12a: fix VPU clock parents

 drivers/clk/meson/g12a.c | 6 +++---
 drivers/clk/meson/gxbb.c | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)
