Return-Path: <SRS0=nGmH=4W=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD493C3F2D7
	for <linux-clk@archiver.kernel.org>; Thu,  5 Mar 2020 09:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95D992073D
	for <linux-clk@archiver.kernel.org>; Thu,  5 Mar 2020 09:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z+TR8WC9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgCEJr7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Mar 2020 04:47:59 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:50978 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgCEJr7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Mar 2020 04:47:59 -0500
Received: by mail-wm1-f41.google.com with SMTP id a5so5454272wmb.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2020 01:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version;
        bh=poeMjG8rAZ3jdKnjKjqMvGT7pDny+HSkArRD2RHp7Ek=;
        b=Z+TR8WC9GscfVVlIMbVCiyN1T1cgCr0p7tMMPO6DQmgGM3/HOjkGzfWssnxVcsAP2O
         HxpquAX/l9yekwLvk4/xCtwYMcldU3p/V8NWt5JAVld+7p75wg4Nx7FKT6nnLAXXbR3K
         ZKRf9q3Gf7C4z/GxNBK6G2ZLmYLybWnVYqmcQvXotqVEyvg5NpqwrnhcVy93pPHHr0zG
         a6tkga8Z6b30zUDb0OMrm9/0rrDwkPH0pYf2yTTr2Qe14gwrpaie4agtfd9DKh71XQPU
         HxkET4zzKD3VaKvsD61/KzC6i3rl5/3BXC5H7bQuF8yhu7rRucmNX9RQ45HE//6d7KwZ
         Q6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version;
        bh=poeMjG8rAZ3jdKnjKjqMvGT7pDny+HSkArRD2RHp7Ek=;
        b=QId4u0jPAtcAWBtkrQ7bs4w7TlSRHw7x3Yo5umSdt01kvbf0PSxjc10xpYA30PdtgB
         ORfz6R/V/4nCUjv3bV/+/Kyv5iActwsM5LzSw6NUOOqIHZCSNuTzDTNlbPYB145ZkEFa
         dR16vuYbse/0zmxirEf6zIzjklRhVJMgzvkQR2EAsAQpLcQ/mdTHIppB7ZEHuyjVa9yj
         MH4z3uOTY37+AEf4Jd2sI1M0XnXWHIMbZT9/6jQG3dCouEnZnumF4WfDQzLdlFRFwpMq
         05RfGsQNYjhirspAZh9vAwsMMl1SvRTZ9TX6FV5X3xxoxkW2LdhjCjxF/P6PvKsRTt1e
         bydA==
X-Gm-Message-State: ANhLgQ3mgvJCeMX/lt6t57gfSsQFaXDalqsLpSyh6xm6YM/WCBUOUgFB
        VDml651hY/Lr8YXbdlSoaRLegg==
X-Google-Smtp-Source: ADFU+vsIK4VLakdc5xbQnKSxaaDlv5HL2uAuTWY7gEvbKwA9rEzZpQtHn0hJwR3p+tHf022aDVWNFA==
X-Received: by 2002:a05:600c:104d:: with SMTP id 13mr8474198wmx.50.1583401675396;
        Thu, 05 Mar 2020 01:47:55 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s7sm5452352wrm.13.2020.03.05.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 01:47:54 -0800 (PST)
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [GIT PULL] Amlogic clock updates for v5.7
Date:   Thu, 05 Mar 2020 10:47:53 +0100
Message-ID: <1jy2sfnnee.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen

Here are the amlogic clock updates for this cycle. 

Cheers
Jerome

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.7-1

for you to fetch changes up to 71202c412478d6553281726a6772d0d5510c42fb:

  clk: meson: meson8b: set audio output clock hierarchy (2020-02-21 11:44:41 +0100)

----------------------------------------------------------------
First round of amlogic clock updates for v5.7

* Update audio clock gate hierarchy for meson8 and gxbb
* Update g12a spicc clock sources

----------------------------------------------------------------
Jerome Brunet (4):
      dt-bindings: clk: meson: add the gxl internal dac gate
      clk: meson: gxbb: add the gxl internal dac gate
      clk: meson: gxbb: set audio output clock hierarchy
      Merge branch 'v5.7/dt' into v5.7/drivers

Martin Blumenstingl (1):
      clk: meson: meson8b: set audio output clock hierarchy

Neil Armstrong (2):
      dt-bindings: clk: g12a-clkc: add SPICC SCLK Source clock IDs
      clk: meson: g12a: add support for the SPICC SCLK Source clocks

 drivers/clk/meson/g12a.c              | 129 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   6 +-
 drivers/clk/meson/gxbb.c              |  21 +++---
 drivers/clk/meson/gxbb.h              |   2 +-
 drivers/clk/meson/meson8b.c           |  21 +++---
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 include/dt-bindings/clock/gxbb-clkc.h |   1 +
 7 files changed, 164 insertions(+), 18 deletions(-)
