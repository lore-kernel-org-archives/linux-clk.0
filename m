Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0805EC282E1
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 06:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA63D213A2
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 06:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555914221;
	bh=so2IQuSWD6ZaH5gpjvUE4vmj5uroAljRaSMxOoJM4Cs=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=GPFii9i7RMUXK+h33Q9U5+fknLc0utl1CrTIChi4WRC+Bb/zBI50i3DPiMoilpHDU
	 q+YtWbcthNLe167JLlA/190cHBI+KcRDkk16sQdnQxBo/QDw4YQ7Gl1obX6LaF4jxl
	 NgXi802uinZ6YitZfFfDPiluF/SmIgGDZ3E59aOE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfDVGXl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Apr 2019 02:23:41 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43217 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfDVGXk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Apr 2019 02:23:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id n8so5322386plp.10
        for <linux-clk@vger.kernel.org>; Sun, 21 Apr 2019 23:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=N/lfYI0cXuViCNJjEQTXsvDFJtm544bjPdmz9VfOyRo=;
        b=qzUqTt86Gvc+jaYx3xDT4sjAcRYW6qf18MLYrT8ybuMtumpvFtzNIOIHReaTg9epq0
         h+BAPQchpo2f+Xy7ehhnrDz5jb8rbfwAO8hWDRkgVtvqndQdSN9j4AGaRkwLnOR6wEmj
         hghcjDlkuAgZDT2wvXsK8MGKEzdwtEWup0TFAqyOckuTUqxIEyrYbq02Vb6en1NNGZlH
         9hCMJ+PY+LgSmwdzCAaT5ZEmq+ZseQwEw2E7jFdi7g3glVhco9XzIbMH7iAAfwSMELc5
         DSH0SBaK+KeD8ATOltHd+hFUZHIJRMZGZoGx9Hohfua5exQyvHR5AJ6MVbr3wgZKib9B
         ng3A==
X-Gm-Message-State: APjAAAWxAfD09HI+8YH8shp6sw4Uif+SDYXtH9GqZIvsWgpGwP5moAab
        niizur01JRFxxoJOXbN/5moIic0otaI=
X-Google-Smtp-Source: APXvYqwqDfkK5LmS5nD1yZYUWuSfEeDp8Y3e/jzAtBc6Tbl49bvLiPA8u+zP1ArRhdis2z34UZ9GOA==
X-Received: by 2002:a17:902:8a81:: with SMTP id p1mr18765345plo.106.1555914220309;
        Sun, 21 Apr 2019 23:23:40 -0700 (PDT)
Received: from localhost (98.142.130.235.16clouds.com. [98.142.130.235])
        by smtp.gmail.com with ESMTPSA id y19sm17070744pfn.164.2019.04.21.23.23.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 21 Apr 2019 23:23:39 -0700 (PDT)
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: [GIT PULL 1/3] i.MX common clock changes for 5.2
Date:   Mon, 22 Apr 2019 14:23:12 +0800
Message-Id: <20190422062314.1354-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.2

for you to fetch changes up to 48a15bb42df85d30e13281642a12fd27221668fa:

  clk: imx: Remove unused imx_get_clk_hw_fixed (2019-03-26 16:49:49 +0800)

----------------------------------------------------------------
i.MX common clock changes for 5.2:
 - Clean up unused imx_get_clk_hw_fixed() inline function.

----------------------------------------------------------------
Abel Vesa (1):
      clk: imx: Remove unused imx_get_clk_hw_fixed

 drivers/clk/imx/clk.h | 5 -----
 1 file changed, 5 deletions(-)
