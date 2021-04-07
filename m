Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1714AC433B4
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 03:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEA17613CD
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 03:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344574AbhDGDpM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Apr 2021 23:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344546AbhDGDpL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Apr 2021 23:45:11 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2783C06174A
        for <linux-clk@vger.kernel.org>; Tue,  6 Apr 2021 20:45:02 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id n67so7379801ybf.11
        for <linux-clk@vger.kernel.org>; Tue, 06 Apr 2021 20:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=iAoCwns4tGDUg+Uupy+j5nADfE99sMComaQjSmba07U=;
        b=RiWn/u2mZTBsRW/4i84DxQpGr9bI9wMIqSGA26L4TryZfHh2/SzOuISYwZZCiyTDCC
         N+cS/VK4cdvRl+f/QSKveQLdCa4g672T+pazc0IkCR31ZLwrRbZzlx2/4K/oMahavy2u
         53O6fQYl9RTexvci0kG2f4c80VB5atBISmioOHhVi+KSYLj6XOjXC8jjxYUfiv/OzVeU
         uytuu5ytliEKP3WVGToSTDFyKxH/iTJR3RMjcPQGaNjXbpXpjeZKcEFdnl2SEf/2l8df
         ICGaAJngl6pC0VFmnnIPg0asiNDFH203XevwFGtHIe1Jl9O1NdoFgWzQaBtS6arZkJEo
         0oJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iAoCwns4tGDUg+Uupy+j5nADfE99sMComaQjSmba07U=;
        b=VtThok3biDmk5DlFhoZrLCiHXn9/JDyMDj9B6u3WALHiv1+QFIXjZiQz7KXn9KATtq
         xewV21xs7CNKTgu4iqdiMut0sv8Zmjr5Xh72srqEcD5Gy8bD2PwW5/t/0IE8aKETKZZk
         pzNkX+4gpAr7uR7eOxrs3r3BDrsVw5CdWtou3VpPjayxvc9gDa8FfOUgB4Dh4k1ktH+1
         auEOPAJNjlkkdBAB7olemHV3fNJdE5wB4lpyXNOxNfxpWDGSOffjNZnTIeA3/1QaBLO5
         2umBGK7pW7s7ybvZHun7nV66Ea9zygh4qqU2ndrRPRujHWf0P7EKl7e4o8G+KvHZ/XtO
         Vnhw==
X-Gm-Message-State: AOAM530hcXmkKBVWU9EtSUQM4BjZIhqxU2Z5GbFHt7DR+I1u9mOURshp
        hoj89cQtkrbBJQW9326HGemnj2LLx38mvso=
X-Google-Smtp-Source: ABdhPJwjxk8SfBcyekuL2Zau91IWhPYkx+vU5RoutnJcGE1efAe3lRJyXGsBWK6DT6+gSEVhKXawXWMaGdQcSvg=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:2dae:f92:7d76:4244])
 (user=saravanak job=sendgmr) by 2002:a25:ab2f:: with SMTP id
 u44mr1756605ybi.158.1617767101994; Tue, 06 Apr 2021 20:45:01 -0700 (PDT)
Date:   Tue,  6 Apr 2021 20:44:54 -0700
In-Reply-To: <20210407034456.516204-1-saravanak@google.com>
Message-Id: <20210407034456.516204-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210407034456.516204-1-saravanak@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v1 1/2] driver core: Add dev_set_drv_sync_state()
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

This can be used by frameworks to set the sync_state() helper functions
for drivers that don't already have them set.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 include/linux/device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index ba660731bd25..35e8833ca16b 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -778,6 +778,18 @@ static inline bool dev_has_sync_state(struct device *dev)
 	return false;
 }
 
+static inline int dev_set_drv_sync_state(struct device *dev,
+					 void (*fn)(struct device *dev))
+{
+	if (!dev || !dev->driver)
+		return 0;
+	if (dev->driver->sync_state && dev->driver->sync_state != fn)
+		return -EBUSY;
+	if (!dev->driver->sync_state)
+		dev->driver->sync_state = fn;
+	return 0;
+}
+
 /*
  * High level routines for use by the bus drivers
  */
-- 
2.31.1.295.g9ea45b61b8-goog

