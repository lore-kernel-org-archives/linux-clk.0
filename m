Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A598C433F4
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 10:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2564720883
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 10:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="bquvQUQK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2564720883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbeIXQNX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 12:13:23 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40359 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbeIXQNX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 12:13:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id o2-v6so2822436wmh.5
        for <linux-clk@vger.kernel.org>; Mon, 24 Sep 2018 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=imbjK81jVRpEHkR4I0gKczalGuY2afrY9ylxpTqoEdU=;
        b=bquvQUQKF23S/krIlBtPBfSlm4C5X4X74objq3j8i5yfNZUeE2CQv0sE2IIBIrY6TC
         b6Bp4MyssApejL0e+XFuVMLyYzz+AIBbk949QfIW95JixLqhLtDjFKgfIDQXlf4IFVwB
         fmVQKRTClquTOg8ms5HaP43OSDhFifMG328kfAB5/PjZGTNCiQn3+F/vWiJkqIBVUSuY
         Uc6B/fSpWiCZ8hq50FzshYxVA3Ddia3H98ZoCIASubyP8x/3yL8LTy8ckzgqEiTytm73
         DudsnN6Pd4ESStRlgCftCpORiXzQz50OpdkJFDReH9B4Kd6Ckl0x3m6lC31BZhcCE0jX
         OAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=imbjK81jVRpEHkR4I0gKczalGuY2afrY9ylxpTqoEdU=;
        b=CZrnC76J6blaTzX7dOwNm406xI4U3EB9mEupCarkhSQAaw1rQB6VmrNo3KHYlFeR6s
         /eIXkX7XGNXAeKzg/aN4nDS+9tMSqjYO9ysX0TwbacbOpui3+ykhxesNL02tIA9s1YTf
         BbfW4Lfu7BZhFY4jaa6CZMrAN/sJokYMOiTzBL+C8FXpVxVzxp8d3DGNpofXT2yP0J1f
         AwmhSjjWWVlNutBQkau/Oa8pX525GkFmdVyPKWRbj+i8PKHsFsBg/w6UtMFS+sIiyCm3
         wpn2qaDTFcwF/QLMl9IDbniCx+pyzlv9cr9b37ZsiETcLIUrYc1a38VFJhN5LPjYL38o
         FL9A==
X-Gm-Message-State: APzg51Dvtn0Kq8rkemM4rcvmeldURzPfVZNEkXqNliVuFfKGAR2smzD9
        KG3YiEBVS6hj3tvPwDlE3cn6jQ==
X-Google-Smtp-Source: ACcGV60uNz03eCyjgHIy1QlDYkKGTtTRXyIFjDSlgMLWjEnd2XOXq7chhBkDMGylsoO8SrtVQFzpIQ==
X-Received: by 2002:a1c:d141:: with SMTP id i62-v6mr6188892wmg.113.1537783922357;
        Mon, 24 Sep 2018 03:12:02 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-2-33.w90-86.abo.wanadoo.fr. [90.86.1.33])
        by smtp.gmail.com with ESMTPSA id o12-v6sm3291728wrj.58.2018.09.24.03.12.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Sep 2018 03:12:01 -0700 (PDT)
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
Subject: [PATCH v3 0/4] devres: provide and use devm_kstrdup_const()
Date:   Mon, 24 Sep 2018 12:11:46 +0200
Message-Id: <20180924101150.23349-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924101146.TfH_f_1UGfCexi5hc3M34QWGE-grWV-DlK-SVQmUaqA@z>

This series implements devm_kstrdup_const() together with some
prerequisite changes and uses it in pmc-atom driver.

v1 -> v2:
- fixed the changelog in the patch implementing devm_kstrdup_const()
- fixed the kernel doc
- moved is_kernel_rodata() to asm-generic/sections.h
- fixed constness

v2 -> v3:
- rebased on top of 4.19-rc5 as there were some conflicts in the
  pmc-atom driver
- collected Reviewed-by tags

Bartosz Golaszewski (4):
  devres: constify p in devm_kfree()
  mm: move is_kernel_rodata() to asm-generic/sections.h
  devres: provide devm_kstrdup_const()
  clk: pmc-atom: use devm_kstrdup_const()

 drivers/base/devres.c          | 43 ++++++++++++++++++++++++++++++++--
 drivers/clk/x86/clk-pmc-atom.c | 19 ++++-----------
 include/asm-generic/sections.h | 14 +++++++++++
 include/linux/device.h         |  5 +++-
 mm/util.c                      |  7 ------
 5 files changed, 63 insertions(+), 25 deletions(-)

-- 
2.18.0

