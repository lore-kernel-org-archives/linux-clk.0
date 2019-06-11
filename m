Return-Path: <SRS0=yexa=UK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E41C4321A
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 12:23:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 482662089E
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 12:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YsYy1GQV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388708AbfFKMXh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jun 2019 08:23:37 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:41415 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388573AbfFKMXg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jun 2019 08:23:36 -0400
Received: by mail-wr1-f42.google.com with SMTP id c2so12790223wrm.8
        for <linux-clk@vger.kernel.org>; Tue, 11 Jun 2019 05:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=c73N5jUPM/J0OD+sWtA4JTF4ruEO6lqjlOFnfBibFJ4=;
        b=YsYy1GQVeHNTQznm9/zw9NwkAReGWAuXSF/wJB+OrCZRtpbp+rjw/uhQxFOTSY8jGc
         cdTQUPKB3/YClD6yimkLAnJNgPN7iAnSGY+cR/dSXGqAsiMz2XE8rKZ7aSPlDT86B51W
         i7fdCnAbqeSWReVeapblyV6F5E+MEs2t6CuVZt7ZlUWzx6s8PpiarBMxdMMHASnL0WqW
         TRSyQ5adYSe7qyBtaq0M1yuGWTEg9GX010tMqlbD44g2Fwp2o9jLe0mi2tir4a4vHxTm
         dQK3B9nExt6fKC7OAozQrP/Na35nKC9PWYko9AWsWNBQsV2GEoT/5iaPmiMBOMrbxVCa
         xmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=c73N5jUPM/J0OD+sWtA4JTF4ruEO6lqjlOFnfBibFJ4=;
        b=Nc+wbVlmh+UelkRjP8BuPOpTywpnXeUR1OBkESmZeCjAUeXsckkRcMJD0YlD4koSF1
         yjR/psXApSe6z+90/CKGqARZdkuuVp6ZHUJP/622oI6jA0UDguCytuQCJLoiiql98Vf+
         gV+EgmWzeQKqZ+M1HZaJTuVbCPxr5wWhoADuUlrTobHYO3Zdwr3r1/J2MNVdILiG6Kw0
         8oGIBrmw+R3EZCL+yE/XxlbfwXGny7998bfi4AXaNOvc1cuN5Jo+REGPVCAV/EfRAS8c
         IipaCMRZN6RpGqwXh9fVg31xsAlpvWHHpZuxRwA7ieAA2CV8w7cr4Jyb5o1pJXRZe5P3
         wy7w==
X-Gm-Message-State: APjAAAUhanzPgQQoTWcDWbW4W8ncS5jnt2vflGc+7y3O2j2UnPDNxJaQ
        ngAjLXxrIlXADE0+vVIU2LPVrA==
X-Google-Smtp-Source: APXvYqwYlZ+zFYRWi8q9YLBImzdjepRt/8CxplAnJJHZ/hUrbiOzzjhfkLhOcltyUANCG0YK5OxoGQ==
X-Received: by 2002:adf:fbc2:: with SMTP id d2mr2661934wrs.334.1560255814706;
        Tue, 11 Jun 2019 05:23:34 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b2sm19572023wrp.72.2019.06.11.05.23.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 05:23:34 -0700 (PDT)
Message-ID: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
Subject: [GIT PULL] clk: meson: fixes for v5.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Date:   Tue, 11 Jun 2019 14:23:33 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear clock maintainers,

Below is a request to pull a couple of fixes on Amlogic clocks for v5.2
These are typos in recently added clocks, the most annoying one being in
the DT binding identifier on the MPLL50M which is used by the network PLL.

Regards

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes

for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:

  clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)

----------------------------------------------------------------
MPLL50M DT bindings typo fix
Meson9 VPU typo fixes

----------------------------------------------------------------
Jerome Brunet (1):
      clk: meson: fix MPLL 50M binding id typo

Martin Blumenstingl (1):
      clk: meson: meson8b: fix a typo in the VPU parent names array variable

 drivers/clk/meson/g12a.c              |  4 ++--
 drivers/clk/meson/g12a.h              |  2 +-
 drivers/clk/meson/meson8b.c           | 10 +++++-----
 include/dt-bindings/clock/g12a-clkc.h |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)



