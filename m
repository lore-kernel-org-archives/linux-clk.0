Return-Path: <SRS0=a4ME=TW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F715C072B5
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 01:15:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E60C217D9
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 01:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7zUbSkf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbfEVBPQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 21:15:16 -0400
Received: from mail-pg1-f175.google.com ([209.85.215.175]:37709 "EHLO
        mail-pg1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfEVBPQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 21:15:16 -0400
Received: by mail-pg1-f175.google.com with SMTP id n27so406303pgm.4
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 18:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=B43ZvY9Pih8gF9rNgrprI7+aOAj3WLqNtbVbB4LmDsg=;
        b=f7zUbSkfEtRBSQ238IKl1yTWzFYz0OLFYVtHnqzofrICkCfhRO0OJJl6srRe+I7oFo
         0kvaUv0p0k/B2fXM7pwQLMo3WDOIT+CZeKTulGphvrIqQ4dHUtkhRbAHMlVkOkVJz3rE
         dcWKOp5OBejfGHYoHlMRBrlgnmWbn3dyqBGP7EJWOiD9KDxew5fkVEftgD3ak7YF26pF
         RMkUqltK30ZE6OAxeX0RltToKIisNNxxnFR+qTUgCA73v3uNeJL0jPKMmoOZmlFqPGqm
         Z9hVLIkhjuH8hnF+h7qcCvxmpk8xSJwIO9ihgACdryWa/PfpGMxrUzlhqz42xTqV8HDM
         1bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=B43ZvY9Pih8gF9rNgrprI7+aOAj3WLqNtbVbB4LmDsg=;
        b=QFhaggOk+YmnMpOgKCs28qPk4qe0wuD3OO4TcvhA89tG+ODriAnUYxFZltQprLcNL9
         AGo1R2nxLYTVfCPCg/ZWRGyC0ICeCj401bdYCF4kpan+k0NaHM+gcixQPrHvAmYPLhvM
         kR98TZFoMZOvd5IGvciPOeD/M0BHTLQCvfLoX/spExv7yARCu7TIxJsQ0yl4zz4o517B
         nhFKSUIvwZXQcojIpwPLst/QBscY5ln+zLlj+BHs97ipmSkt+6/Xm8ywuP/Xy93tcBUd
         r5oNZ+A0XYAynAAuK3Nvx9OX+486ubGt+Tp4HE/0QMwS4OUaheQdR8E94M++vmiQOgMW
         SovA==
X-Gm-Message-State: APjAAAUUAA277UoyO4ylqJBzhPv2+yIZB8rSu7apZcXz+pPtmIF3T03M
        MRpeo+Asx2uzx2rEB62DJf4q1g==
X-Google-Smtp-Source: APXvYqxj8pVUmnXAq+rDFDlWDGnFnjxLabBHSByB5kIk9hD3o9P8TXDscTJ2+tKGPBHVoajbuZI/Hw==
X-Received: by 2002:a63:1f04:: with SMTP id f4mr87295648pgf.423.1558487716008;
        Tue, 21 May 2019 18:15:16 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id e184sm31756061pfa.169.2019.05.21.18.15.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:15:15 -0700 (PDT)
From:   Chunyan Zhang <zhang.chunyan@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 0/3] Return immediately if sprd_clk_regmap_init() fails
Date:   Wed, 22 May 2019 09:15:00 +0800
Message-Id: <20190522011504.19342-1-zhang.chunyan@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The function sprd_clk_regmap_init() doesn't always return success,
drivers should return immediately when it fails ranther than
continue the clock initialization.

The patch 1/3 in this set switchs to use devm_ioremap_resources()
instead of of_iomap(), that will make caller programs more simple.

Chunyan Zhang (3):
  clk: sprd: Switch from of_iomap() to devm_ioremap_resource()
  clk: sprd: Check error only for devm_regmap_init_mmio()
  clk: sprd: Add check the return value of sprd_clk_regmap_init()

 drivers/clk/sprd/common.c     | 9 +++++++--
 drivers/clk/sprd/sc9860-clk.c | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.17.1

