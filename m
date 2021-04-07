Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB76C433B4
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 03:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 885F0613A7
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 03:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344475AbhDGDpJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Apr 2021 23:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbhDGDpJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Apr 2021 23:45:09 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718ADC06174A
        for <linux-clk@vger.kernel.org>; Tue,  6 Apr 2021 20:45:00 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id c7so13954858qka.6
        for <linux-clk@vger.kernel.org>; Tue, 06 Apr 2021 20:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=WkPRAEKQwKtnKMqu+pBgPjyw5DvsfDt17v5kQaXECno=;
        b=b3hmtr0mw+jBDREyzsEDnRIFrjnQfCM8VR/IjvFXjuEZz4w6r2IRdsMxZH49khr2RD
         5WwYe7quHcUdiOSy/KWLDMwRqD0vFXSi8ztr+FkWz/VX8/A5ZS0ZuqoHIfcoSnuAqPm7
         kEyqCN8szv/ubiygRj/axiDFXbfHzd4NwMEWm1JjEDk/uhxMn6DSzC98h6iZlzF17Fsj
         oG5W7m7It+bxYx9FTznk99aUHU0oiJd4BO+N4cfTO23HWrTUnwKEWcL0fIkkYpvNL+yX
         rU97YriUkQT26DRsWrkUOsdBSBWPAi6KlMN0aFwWKslQ1qBLESXDC/utQxE8fJPxDi3H
         eGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=WkPRAEKQwKtnKMqu+pBgPjyw5DvsfDt17v5kQaXECno=;
        b=AZR4cKzTsqrVBZEXt8i0T2EgHjk+Hjybcqu6yMY6zmEnK+b96UsgotWjdxlVuTKwYq
         3RmlMcomE+2bHmnxGRHvxGY589nkDRGFhSCgpvTVUE2PJdRmhaVgBHbjs1yez4p7tW3p
         rYWT9Lzc9RC5dTIZahLndML+tH5BPgrveUnz1V7duMFvtLZGGOV2MHOgt4+7xPsHmXBT
         IzJtfolJNtoJji39BkQ8IpxfXz2rNmjglyhZwLZzJUSOY55Q08DiS/x/wzNy4sa7GyXy
         74XHyQrP4iiBvXWtPCg25swDhMxYjqUrZRFgOsNMSy/CYzttk7AdkL7c7J4oGcOsKXGh
         OHqQ==
X-Gm-Message-State: AOAM533th7SNfOpfV3N/9rXz0le2acv6BlTLBs2Z8aG25a0ENcu9+dlm
        fuq4jyRPwLqajo3xc1/N+dbEqYP3ZHFf5tk=
X-Google-Smtp-Source: ABdhPJx3Jno6k4W07F4UPLHx0TiI197HKqsvqb4jQdJbWHhWyYmsZG713G5LM/frA1Z6dd30fNEYKaC3y/mgWmc=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:2dae:f92:7d76:4244])
 (user=saravanak job=sendgmr) by 2002:a0c:a5a5:: with SMTP id
 z34mr1731742qvz.4.1617767099615; Tue, 06 Apr 2021 20:44:59 -0700 (PDT)
Date:   Tue,  6 Apr 2021 20:44:53 -0700
Message-Id: <20210407034456.516204-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v1 0/2] Add sync_state() support to clock framework
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stephen,

We can decide later if both these patches land through clk tree or the
driver-core tree. The meat of the series is in Patch 2/2 and that commit
text gives all the details.

Saravana Kannan (2):
  driver core: Add dev_set_drv_sync_state()
  clk: Add support for sync_state()

 drivers/clk/clk.c            | 84 +++++++++++++++++++++++++++++++++++-
 include/linux/clk-provider.h |  1 +
 include/linux/device.h       | 12 ++++++
 3 files changed, 96 insertions(+), 1 deletion(-)

-- 
2.31.1.295.g9ea45b61b8-goog

