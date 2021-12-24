Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA59FC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 24 Dec 2021 14:32:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbhLXOcN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Dec 2021 09:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhLXOcM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Dec 2021 09:32:12 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AFFC061401
        for <linux-clk@vger.kernel.org>; Fri, 24 Dec 2021 06:32:12 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id g7-20020a7bc4c7000000b00345c4bb365aso4665812wmk.4
        for <linux-clk@vger.kernel.org>; Fri, 24 Dec 2021 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=user-agent:from:to:cc:cc:subject:date:message-id:mime-version;
        bh=J/sv0TNCM9qhpmuWLLjcw321btDF9NYLzz+0+v/rVkY=;
        b=Ikaxk4kRWp4PpqKW5C3ydChMKXHguNjcmX6LJJP9b5DNCRq0Tfatz3s9ZNuDs/4gKm
         45Qb6bYc8SKqgsP6lA8RisrDX2ymvdfl0lrFwWHc859ANlTu/suJhEH1nlF72sM7wyDv
         cgTOmytcKqpteLv35kXO0ReqPxVLohucthJ2waT5JrAnwsWLClzVpveD/etX9IDfXbnB
         r4qMeAYEzbBqAPp5sor8UZEHKvYi65tosjZtdHRKEi7b1KA1niY18q0N9YNzZ8/ZVSGG
         KtzdQNR8wqmbkFAfUz4fAODzvEPfQfin46m6/wCYkZpQogu6RNW3fn06ds6x7Uzm1Qzd
         sjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:from:to:cc:cc:subject:date:message-id
         :mime-version;
        bh=J/sv0TNCM9qhpmuWLLjcw321btDF9NYLzz+0+v/rVkY=;
        b=gF6fa2BKMuc41mEsOEuWl8GpmemQEq5VzKMld/tey8Ha5W0R0OFMJE1sei5zT3ZPmQ
         /+maX8jvV+4DMYUaGJNFK5cl3mjuTkgq1Zm/GJcQQofPywvEXtPa9EZBCdl0qg1lzbWE
         WwUVpJNexHC8ZC2IOyq/WTjpILdMwX6OfHt/nFpvzaKo9eBEpzrQ8eCdQwcLZ9yylcgM
         HlSS/L4TTwbeNeSegLFh4GWr5JKO3c4EqghGflm6RFmsOyJEhe1TMRZoq1rUot1hslz7
         K4CqZUGMAGjba2DwfKsrRi5UGFHdCVNIInukYHJsIvGA5L17X9rpYV8KcrbLNVvl+QIY
         oydw==
X-Gm-Message-State: AOAM533IwqpDF/yJBGpxZyoOtJHe3eUrPWkgBUW8Pgzd4uCHcEIN5iGo
        CZrd8r1B+ZBDG5EIx/JQ+mLV0g==
X-Google-Smtp-Source: ABdhPJzGVqOsXGzYJm90HcX971AuK9CKo0663Sce/buXN8Zo0HNnK3lLg3vPNUena2m2PfJVI/wEfQ==
X-Received: by 2002:a1c:1d17:: with SMTP id d23mr5094399wmd.105.1640356331093;
        Fri, 24 Dec 2021 06:32:11 -0800 (PST)
Received: from localhost ([2a01:e0a:1a5:7ee0:ef0c:e38f:5a0f:262f])
        by smtp.gmail.com with ESMTPSA id c7sm8992009wri.21.2021.12.24.06.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 06:32:10 -0800 (PST)
User-agent: mu4e 1.6.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     sboyd@kernel.org
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic update for v5.17
Date:   Fri, 24 Dec 2021 15:27:48 +0100
Message-ID: <1ja6gqhy52.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here is the amlogic clock update for v5.17. Just a single fix this time
Please pull

Happy Holidays
Cheers

Jerome

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.17-1

for you to fetch changes up to ff54938dd190d85f740b9bf9dde59b550936b621:

  clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB (2021-11-30 10:28:52 +0100)

----------------------------------------------------------------
Amlogic clock updates for v5.17

* Fix MPLL0 gxbb SDM enable

----------------------------------------------------------------
Martin Blumenstingl (1):
      clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB

 drivers/clk/meson/gxbb.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)
