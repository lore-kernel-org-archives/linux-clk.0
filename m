Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F55AC433F4
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 10:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17EAA20833
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 10:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Uy6pZDm6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17EAA20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbeIXQN1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 12:13:27 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35339 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbeIXQNZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 12:13:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id o18-v6so9438695wmc.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Sep 2018 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=38j/leseIFaYyx4yzFjMEUsIrw9mip1Szaiqm4tzm/A=;
        b=Uy6pZDm6z/fl0jre25cfBjomNanGjgb8D5SlflebK4Dq53aCng4x8B/xsSiEuoljv3
         101hdyhZJRdiq1/LK2s2DYanexvieCFQqeRwuu5m3dGgKgsSIvaLaJ9FbXuS23DChcPW
         aDm6egXgtPBVwFwDkSDQTGokT7Umb7qL+Wkt2AWw+Vx87mWsKncg/A43TTnFs7BlHu2H
         f+AFCKKUZJ/eD5mpxpoIAwgmjfB6WAcqUVHtGVgTlElhqcRjB8HsJ5Y/78uN2J9xQgvL
         LHgVUwyoSq6yH00fcHDUwjZDzxbVDgVYVhRvJSbr2ctIuIsTIdtQpNX8YuDqVb+KWpUP
         LVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=38j/leseIFaYyx4yzFjMEUsIrw9mip1Szaiqm4tzm/A=;
        b=iS14Sh7HKJhlZxoRLDEdoVi1R3MvvjXuzPgBYiv7N5sCfzxH0IWzK2XHeYZ96Aud+U
         HZxIOWPvT6vVqldSKP3ShYuMSwsxaBLYWGoq3xb7gf5VgL9Go3jO9IQHDsw9zoLzwdms
         lbUDawsJVwXKv4OxgRl8mPIhBnZjZhkIK451WiHrPQiKzpST3SmEwQD0tNCWHHOSB5OQ
         ur1Z9v/tvON4JI8htFLwxOPu003gEl17yYliJMzfPxX7PjrFKm1QdNK+HLGLEGSm/asv
         rgOdgDk3RRXNIycZ3ykUV1sqLje5Xr+EMuroS4HromJkTyjdUHeI6Jpbnr5NdPTQ3udj
         2YQQ==
X-Gm-Message-State: ABuFfogwYr0xn28lzRB3ADK8XQn7YUZaRoJvp6S5boW4VFrtw+Qen64G
        rObrFDMkMOv7clOBCCKAUE6uVA==
X-Google-Smtp-Source: ACcGV605psT+bg6McVRzros1Jf9FORPXMAjXqmI/96ORXIfiqHRHrFOhI/+9JRilgZIocmyDiIQAdQ==
X-Received: by 2002:a1c:4182:: with SMTP id o124-v6mr6764650wma.101.1537783923860;
        Mon, 24 Sep 2018 03:12:03 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-2-33.w90-86.abo.wanadoo.fr. [90.86.1.33])
        by smtp.gmail.com with ESMTPSA id o12-v6sm3291728wrj.58.2018.09.24.03.12.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Sep 2018 03:12:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joe Perches <joe@perches.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Michal Hocko <mhocko@suse.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <guro@fb.com>,
        Huang Ying <ying.huang@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 1/4] devres: constify p in devm_kfree()
Date:   Mon, 24 Sep 2018 12:11:47 +0200
Message-Id: <20180924101150.23349-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180924101150.23349-1-brgl@bgdev.pl>
References: <20180924101150.23349-1-brgl@bgdev.pl>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924101147.hDLEf2pmoZag_8jLPFNtYVYkXwBPHcYJzPcHJi3nX8A@z>

Make devm_kfree() signature uniform with that of kfree(). To avoid
compiler warnings: cast p to (void *) when calling devres_destroy().

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/base/devres.c  | 5 +++--
 include/linux/device.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index f98a097e73f2..438c91a43508 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -885,11 +885,12 @@ EXPORT_SYMBOL_GPL(devm_kasprintf);
  *
  * Free memory allocated with devm_kmalloc().
  */
-void devm_kfree(struct device *dev, void *p)
+void devm_kfree(struct device *dev, const void *p)
 {
 	int rc;
 
-	rc = devres_destroy(dev, devm_kmalloc_release, devm_kmalloc_match, p);
+	rc = devres_destroy(dev, devm_kmalloc_release,
+			    devm_kmalloc_match, (void *)p);
 	WARN_ON(rc);
 }
 EXPORT_SYMBOL_GPL(devm_kfree);
diff --git a/include/linux/device.h b/include/linux/device.h
index 8f882549edee..33f7cb271fbb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -692,7 +692,7 @@ static inline void *devm_kcalloc(struct device *dev,
 {
 	return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
 }
-extern void devm_kfree(struct device *dev, void *p);
+extern void devm_kfree(struct device *dev, const void *p);
 extern char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp) __malloc;
 extern void *devm_kmemdup(struct device *dev, const void *src, size_t len,
 			  gfp_t gfp);
-- 
2.18.0

