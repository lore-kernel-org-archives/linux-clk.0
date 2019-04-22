Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5E1C282E1
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 06:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05E4C20859
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 06:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555914227;
	bh=YfRI7Rxe7q3HxjC2AfjeQu8fjgMSoPVkh9+ZeBwTu7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=OcTbsYLW4UoNTB9b7eUiQviN3TEJ7iGxBHv4nPLbBYjOLxnztoJZik4ftKCAluaV6
	 zeqoBkioOGvduVmpw/MswrNAL3V16IpAbGlqSSB4hTXKPosAMBR0TP0pi23iXS7oWf
	 2D9bFSGi5kHbh8b02NSw7PXkp1vL4OKi5rtHO15s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfDVGXq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Apr 2019 02:23:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44967 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfDVGXq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Apr 2019 02:23:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id y13so5217797pfm.11
        for <linux-clk@vger.kernel.org>; Sun, 21 Apr 2019 23:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dhnJQEJIbjqmnmRU53KQwsemtNtBiydoERs2zy3Z5uM=;
        b=WU5nH/oRaAXHaq7aFG72f6bd+OCvpl+tyl4yPcsv76naS8OY7mm7kn3E/AoSCbLc1q
         2emsoD1ddyyY0fMGvjotTi1bsNAtxIHFQk/iFsWn5X6FI4u49ULccL1f3JN9WNewp4lv
         XTkAtbckaEFXL/BNwZpvQO77qOWtFgVgGpM1dqfaf66t3BoDEHAiODKUH+vkGFss0H8t
         zY3/944oiRgWN+SpVDrjXm3j02hiV3N7QoNQ+pcQv/0asIKLdkPH/8+mxthVP+mfonQb
         agGCpzUETiTGdqHnzCpHI843NgZlUuCkO9SdS7HU+jWLZyoVy7X9Ga7OyIQAz7fqeMqa
         JnsQ==
X-Gm-Message-State: APjAAAXtQa6YNz6AsuOfbUSeoXfMq1rHdDCjFF6EFf8PltjrOlAB1yiZ
        Yi1Vm5sFSDxHmNeIQwjpAa9H1v2HHLI=
X-Google-Smtp-Source: APXvYqyyQjLIIxsRAZxMeUGwBFWK+QQmUK6PVAPjqUjBCiDsvlxnRHLtOdUmWgvxydjJBTqkpofUUQ==
X-Received: by 2002:a63:1509:: with SMTP id v9mr17250376pgl.194.1555914226040;
        Sun, 21 Apr 2019 23:23:46 -0700 (PDT)
Received: from localhost (98.142.130.235.16clouds.com. [98.142.130.235])
        by smtp.gmail.com with ESMTPSA id e4sm18242499pgd.32.2019.04.21.23.23.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 21 Apr 2019 23:23:45 -0700 (PDT)
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: [GIT PULL 2/3] i.MX5 clock changes for 5.2
Date:   Mon, 22 Apr 2019 14:23:13 +0800
Message-Id: <20190422062314.1354-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190422062314.1354-1-shawnguo@kernel.org>
References: <20190422062314.1354-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx5-5.2

for you to fetch changes up to de348df5b389f7ddab388934e84f24d8a9f3c961:

  clk: imx: rename clk-imx51-imx53.c to clk-imx5.c (2019-04-15 17:09:23 +0800)

----------------------------------------------------------------
i.MX5 clock changes for 5.2:
 - A couple of patches from Jonathan Neuschäfer to improve i.MX5 clock
   driver for i.MX50 support.
 - Rename file clk-imx51-imx53.c to clk-imx5.c, as it covers support for
   all i.MX5 series SoCs including i.MX50.

----------------------------------------------------------------
Jonathan Neuschäfer (2):
      clk: imx5: Fix i.MX50 mainbus clock registers
      clk: imx5: Fix i.MX50 ESDHC clock registers

Shawn Guo (1):
      clk: imx: rename clk-imx51-imx53.c to clk-imx5.c

 drivers/clk/imx/Makefile                          |  2 +-
 drivers/clk/imx/{clk-imx51-imx53.c => clk-imx5.c} | 59 +++++++++++++++++------
 2 files changed, 46 insertions(+), 15 deletions(-)
 rename drivers/clk/imx/{clk-imx51-imx53.c => clk-imx5.c} (94%)
