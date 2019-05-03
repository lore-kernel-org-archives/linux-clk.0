Return-Path: <SRS0=gieW=TD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C25C43219
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 02:45:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D82CF2085A
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 02:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfECCpb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 May 2019 22:45:31 -0400
Received: from mga09.intel.com ([134.134.136.24]:14422 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfECCpb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 2 May 2019 22:45:31 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 May 2019 19:45:30 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 May 2019 19:45:29 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hMOCX-0005Lh-4W; Fri, 03 May 2019 10:45:29 +0800
Date:   Fri, 3 May 2019 10:44:38 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [clk:clk-parent-rewrite 70/78]
 drivers/clk/sunxi-ng/ccu_mux.c:271:37: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <201905031035.c6g9CPB4%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-parent-rewrite
head:   f5e93ab2421d0dd27acac9159d9c4834cd5705e7
commit: c4e54e4bc72df9c60801981f828a62de2f5707f0 [70/78] clk: sunxi-ng: Migrate to .get_parent_hw clk op
reproduce:
        # apt-get install sparse
        git checkout c4e54e4bc72df9c60801981f828a62de2f5707f0
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/sunxi-ng/ccu_mux.c:271:37: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [usertype] original_index @@    got har [usertype] original_index @@
>> drivers/clk/sunxi-ng/ccu_mux.c:271:37: sparse:    expected unsigned char [usertype] original_index
>> drivers/clk/sunxi-ng/ccu_mux.c:271:37: sparse:    got struct clk_hw *
>> drivers/clk/sunxi-ng/ccu_mux.c:272:65: sparse: sparse: non size-preserving pointer to integer cast

vim +271 drivers/clk/sunxi-ng/ccu_mux.c

8adfb086 Chen-Yu Tsai 2016-08-25  257  
8adfb086 Chen-Yu Tsai 2016-08-25  258  /*
8adfb086 Chen-Yu Tsai 2016-08-25  259   * This clock notifier is called when the frequency of the of the parent
8adfb086 Chen-Yu Tsai 2016-08-25  260   * PLL clock is to be changed. The idea is to switch the parent to a
8adfb086 Chen-Yu Tsai 2016-08-25  261   * stable clock, such as the main oscillator, while the PLL frequency
8adfb086 Chen-Yu Tsai 2016-08-25  262   * stabilizes.
8adfb086 Chen-Yu Tsai 2016-08-25  263   */
8adfb086 Chen-Yu Tsai 2016-08-25  264  static int ccu_mux_notifier_cb(struct notifier_block *nb,
8adfb086 Chen-Yu Tsai 2016-08-25  265  			       unsigned long event, void *data)
8adfb086 Chen-Yu Tsai 2016-08-25  266  {
8adfb086 Chen-Yu Tsai 2016-08-25  267  	struct ccu_mux_nb *mux = to_ccu_mux_nb(nb);
8adfb086 Chen-Yu Tsai 2016-08-25  268  	int ret = 0;
8adfb086 Chen-Yu Tsai 2016-08-25  269  
8adfb086 Chen-Yu Tsai 2016-08-25  270  	if (event == PRE_RATE_CHANGE) {
8adfb086 Chen-Yu Tsai 2016-08-25 @271  		mux->original_index = ccu_mux_helper_get_parent(mux->common,
8adfb086 Chen-Yu Tsai 2016-08-25 @272  								mux->cm);
8adfb086 Chen-Yu Tsai 2016-08-25  273  		ret = ccu_mux_helper_set_parent(mux->common, mux->cm,
8adfb086 Chen-Yu Tsai 2016-08-25  274  						mux->bypass_index);
8adfb086 Chen-Yu Tsai 2016-08-25  275  	} else if (event == POST_RATE_CHANGE) {
8adfb086 Chen-Yu Tsai 2016-08-25  276  		ret = ccu_mux_helper_set_parent(mux->common, mux->cm,
8adfb086 Chen-Yu Tsai 2016-08-25  277  						mux->original_index);
8adfb086 Chen-Yu Tsai 2016-08-25  278  	}
8adfb086 Chen-Yu Tsai 2016-08-25  279  
8adfb086 Chen-Yu Tsai 2016-08-25  280  	udelay(mux->delay_us);
8adfb086 Chen-Yu Tsai 2016-08-25  281  
8adfb086 Chen-Yu Tsai 2016-08-25  282  	return notifier_from_errno(ret);
8adfb086 Chen-Yu Tsai 2016-08-25  283  }
8adfb086 Chen-Yu Tsai 2016-08-25  284  

:::::: The code at line 271 was first introduced by commit
:::::: 8adfb08605a99d742853ff8cf4da5bc68db2028a clk: sunxi-ng: mux: Add clk notifier functions

:::::: TO: Chen-Yu Tsai <wens@csie.org>
:::::: CC: Maxime Ripard <maxime.ripard@free-electrons.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
