Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2660FC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 00:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06CA664F95
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 00:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhCLAK4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 19:10:56 -0500
Received: from mga02.intel.com ([134.134.136.20]:57105 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229664AbhCLAKo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Mar 2021 19:10:44 -0500
IronPort-SDR: fu1/pKLYP6BlWdah7qeNJ0B3VND0kAhYtjsvAJgN4gWsDCESZH/ISaxkIHlhXKcCjC68HwHDcg
 HNT9oi6R+3Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="175875855"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="175875855"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 16:10:37 -0800
IronPort-SDR: EkjB85kJ1VR+9Es5oCfG7MFROPzyTthcVFYIp9/WbB8z0Xe5MhCanXT5MtKYUKYYAa6yti7wnk
 GNQNf4rt+AjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="589398276"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Mar 2021 16:10:35 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lKVNy-00012o-KP; Fri, 12 Mar 2021 00:10:34 +0000
Date:   Fri, 12 Mar 2021 08:09:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     kbuild-all@lists.01.org, mike.looijmans@topic.nl,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [RFC PATCH] clk: si5341: si5341_remove() can be static
Message-ID: <20210312000951.GA55322@475579a52fda>
References: <20210311222436.3826800-7-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311222436.3826800-7-robert.hancock@calian.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 clk-si5341.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index f01a20fdf0054..5a3128e58f18e 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1707,7 +1707,7 @@ static int si5341_probe(struct i2c_client *client,
 	return err;
 }
 
-int si5341_remove(struct i2c_client *client)
+static int si5341_remove(struct i2c_client *client)
 {
 	struct clk_si5341 *data = i2c_get_clientdata(client);
 	int i;
