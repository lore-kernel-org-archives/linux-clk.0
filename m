Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA82C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 16 Oct 2021 10:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA053611C1
	for <linux-clk@archiver.kernel.org>; Sat, 16 Oct 2021 10:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240285AbhJPKwy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Oct 2021 06:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233698AbhJPKwx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Oct 2021 06:52:53 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4E5C061570
        for <linux-clk@vger.kernel.org>; Sat, 16 Oct 2021 03:50:45 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m22so31095662wrb.0
        for <linux-clk@vger.kernel.org>; Sat, 16 Oct 2021 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mSTXmeX4sFrog+3nTR6inAdAdU/+pQPl/AxORL6OElA=;
        b=ip81vhs46kUsPTF1X/uzvoPnllvQY4CGnhpICvG9xvNO0HEyJt5O5c7pThjkqay2pf
         0G1wBoMhUD4TwnlI91DD9DZfZCnmdphvAyObwm7YAH4Re2gboH5vOOvkBoC/8+DpE0fM
         VfWkQZvX7A9cmQ8xpy12x+vZNTwjvbKEP5ysldUUpSCfWvQ3ZlhmMdm2rdU3omANAySR
         MY3kl+QMHXtO625cZ1ebhoISMd1iVy2rlE0umeCxf6I6cdFfh76X7F3fVw9e56phhg3h
         jrQVCYCjQ8++NTV3u2cUsH5pJlW0E6OVVfsjjXxrrdPJsfqUtkFVqJbC+HqOI5Gp8KlB
         suRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mSTXmeX4sFrog+3nTR6inAdAdU/+pQPl/AxORL6OElA=;
        b=s8pmLEepAdaxH+8N862RVr2IbYcb/rq/eV07At3VuGrVEsSDlCuCyZNIdkYEhwtl3o
         JHz2lNd1eb/oX8YmIdG3XMYqAkc7xbxCk+7sv7LbHIDA4Tcy961KTyIkfzmoEtGWfeE0
         kKTUd6uH8y+QygN0f95mKJHG/TvMptVSKNnlknljQRn3OCc7PcpPqNP3CTmWWcNUYysa
         F/Bu/Cuknul2NGqv3WJc0aJc6nRGKGKJ4le1lUFMaGy1RmsSrV30lV2VSGJEhLloe2ad
         ie/znLe/q4wx+D4cF3H+XtXukGV65s7oatLgXJIe7sbU/sWY2NxXd9uxS0/XJtIcxdkS
         4pPw==
X-Gm-Message-State: AOAM533va7TLtWEs7wO19HJKbvp1TtiJvdK3EweBYe6mImoZoQUkS+l+
        GGw/P3l+FanJxr6eOxAtTDc6CzRYw+k=
X-Google-Smtp-Source: ABdhPJwQ+2KaoYY2Wd3UdDLl/jkJ9ImDKPLj7xga2DvjHIpZE8WohAHYurxp1GBBC/8rCS7Ul7yQrQ==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr7848763wrs.46.1634381443635;
        Sat, 16 Oct 2021 03:50:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b82-9800-f22f-74ff-fe21-0725.c22.pool.telefonica.de. [2a01:c22:7b82:9800:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id d8sm7415796wrv.80.2021.10.16.03.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 03:50:43 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, knaerzche@gmail.com,
        mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH clk-fixes v1 0/2] Fix clk-composite to support .determine_rate
Date:   Sat, 16 Oct 2021 12:50:20 +0200
Message-Id: <20211016105022.303413-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Alex reports [0] that commit 69a00fb3d69706 ("clk: divider: Implement
and wire up .determine_rate by default") breaks Rockchip platforms
because the parent is not considered anymore. This is because
clk-composite skips the "best parent" selection when
rate_ops.determine_rate is set. Above commit does this by adding
clk_divider_ops.determine_rate by default (then the Rockchip platform
drivers are using clk_divider_ops as rate_ops in clk-composite).

With these two patches a revert of above commit is not needed anymore
(which would result in a revert of five follow-up commits as well).
Instead the first patch changes the order so clk_divider_ops which
has both, .determine_rate and .round_rate are supported by clk-divider
(again).
The second patch makes clk-composite use (and even prefer)
rate_ops.determine_rate when available.

Special thanks to Alex for his patience and helping test these patches
off-list (since I don't have any board with Rockchip SoC).

At least the first patch should go into -fixes.


[0] https://lore.kernel.org/linux-clk/4eb964ac-4fff-b59d-2660-2f84d8af5901@gmail.com/


Martin Blumenstingl (2):
  clk: composite: Also consider .determine_rate for rate + mux
    composites
  clk: composite: Use rate_ops.determine_rate when also a mux is
    available

 drivers/clk/clk-composite.c | 76 +++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 24 deletions(-)

-- 
2.33.1

