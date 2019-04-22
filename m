Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AAAC282E3
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 06:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9177220859
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 06:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555914233;
	bh=cmne0L2hLgZuXmiWK/Cpu+Ae4cBLMlyeVsnXtb3KORI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ElNSZ2n/O9lg7QSBOrmz6C//q2mIwzXcim3wtNa/+36EH7BM4yC01TBDY8V4HPxps
	 mvMtF25SWE+SSPD6egRZv45qDCaMwvAuzO4qw8ACgIB06k9kiGKma20I1kW+ez9Vuv
	 uJ2mCy6KPHpkw0/cZrvjoMn417zJy9tFQ6kvNaRc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfDVGXx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Apr 2019 02:23:53 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39754 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfDVGXx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Apr 2019 02:23:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id e92so3546935plb.6
        for <linux-clk@vger.kernel.org>; Sun, 21 Apr 2019 23:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pdfFBDfokCWLN6gbxgvgTmNg2numVMs9rDN5jTqFicQ=;
        b=rnLOeOn5nxAJ204AgtkzCfbS0fs+yzU5t6UMvmUGMIgUXmCIjfbIKny3GJYudoLEXA
         xMI5DuTGVTb5UWJx4OcnS394VMfNW2xiBF2REvjTTZPoBvBCoNJ1SylYkbNQpm/Kb5Nm
         rSbOQ6fVN3vzu1/tkIQGN4il3A7X3eet7MP+EY3CAnrF3s7ZJQeX/mw2SvbOhR6/mXpj
         6A0HB/HYcwNpuYEDZf0wrQRJPxuDUUIhKPg9VFleBDUMFb+t6L7N1ofM/FAaH2eQtYPu
         kl9WNIbfPtpBDgx0t0X3i83zSOmxpWEL7EC1RNY26QcIPbLCDoGuqLTmDMkbe9pXUAgi
         2aUg==
X-Gm-Message-State: APjAAAX6fyOf7uQv8+ky5ycDozXOcJ0z+RxzG4HHXoaIGzkqu9ZtkOHg
        xGJFEonMjScLuOGbA0fR8Z/qqQ==
X-Google-Smtp-Source: APXvYqxMKzmkKH3ZyMB1Wxm/2EWWK0eNYRwH8B5I9h450ZtxvFGx4ab8bDiKcMcza/whvY0JE3ybLg==
X-Received: by 2002:a17:902:b48c:: with SMTP id y12mr19084940plr.280.1555914232660;
        Sun, 21 Apr 2019 23:23:52 -0700 (PDT)
Received: from localhost (98.142.130.235.16clouds.com. [98.142.130.235])
        by smtp.gmail.com with ESMTPSA id z14sm16261934pfn.161.2019.04.21.23.23.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 21 Apr 2019 23:23:52 -0700 (PDT)
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: [GIT PULL 3/3] i.MX7UPL clock changes for 5.2
Date:   Mon, 22 Apr 2019 14:23:14 +0800
Message-Id: <20190422062314.1354-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190422062314.1354-1-shawnguo@kernel.org>
References: <20190422062314.1354-1-shawnguo@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx7ulp-5.2

for you to fetch changes up to d058fb60d56b89548028acd6f70b8396e633ffc1:

  dt-bindings: clock: imx7ulp: remove SNVS clock (2019-03-20 16:00:03 +0800)

----------------------------------------------------------------
i.MX7UPL clock changes for 5.2:
 - Remove SNVS clock from i.MX7UPL clock driver and bindings, as the
   clock will be visible on M4 core only, and never be accessed by
   Cortex-A cores.

----------------------------------------------------------------
Anson Huang (2):
      clk: imx7ulp: remove snvs clock
      dt-bindings: clock: imx7ulp: remove SNVS clock

 drivers/clk/imx/clk-imx7ulp.c             | 1 -
 include/dt-bindings/clock/imx7ulp-clock.h | 1 -
 2 files changed, 2 deletions(-)
