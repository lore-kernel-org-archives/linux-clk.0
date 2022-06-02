Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB1DC433EF
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jun 2022 08:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbiFBI0T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jun 2022 04:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbiFBI0T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jun 2022 04:26:19 -0400
X-Greylist: delayed 1327 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Jun 2022 01:26:17 PDT
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70DE26D36D
        for <linux-clk@vger.kernel.org>; Thu,  2 Jun 2022 01:26:15 -0700 (PDT)
Received: from ipservice-092-217-081-045.092.217.pools.vodafone-ip.de ([92.217.81.45] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1nwfoB-0006H9-5h; Thu, 02 Jun 2022 10:03:55 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] ARM: imx25: print silicon revision, support 1.2
Date:   Thu,  2 Jun 2022 10:03:41 +0200
Message-Id: <20220602080344.208702-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Resurrect the unused function to print the imx25 silicon revision at
startup. Add support for revision 1.2.

Martin Kaiser (3):
  ARM: imx25: support silicon revision 1.2
  clk: imx25: print silicon revision during init
  clk: imx25: make __mx25_clocks_init return void

 arch/arm/mach-imx/cpu-imx25.c | 2 ++
 drivers/clk/imx/clk-imx25.c   | 5 +++--
 include/soc/imx/revision.h    | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.30.2

