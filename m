Return-Path: <SRS0=gieW=TD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0EEC43219
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 08:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFB852075C
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 08:21:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbfECIVo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 May 2019 04:21:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:30207 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbfECIVo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 May 2019 04:21:44 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 May 2019 01:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,425,1549958400"; 
   d="scan'208";a="296629461"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 May 2019 01:21:42 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hMTRt-0005fY-PN; Fri, 03 May 2019 16:21:41 +0800
Date:   Fri, 3 May 2019 16:21:21 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Paul Walmsley <paul.walmsley@sifive.com>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [clk:clk-sifive-fu540 3/3]
 drivers/clk/sifive/fu540-prci.c:534:41-42: WARNING: Use ARRAY_SIZE
Message-ID: <201905031619.nJ5l01Tg%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-sifive-fu540
head:   85ed1c299cca9beb5df6006361cf18bfa2305836
commit: 85ed1c299cca9beb5df6006361cf18bfa2305836 [3/3] clk: sifive: add a driver for the SiFive FU540 PRCI IP block

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/clk/sifive/fu540-prci.c:534:41-42: WARNING: Use ARRAY_SIZE

vim +534 drivers/clk/sifive/fu540-prci.c

   508	
   509	/**
   510	 * __prci_register_clocks() - register clock controls in the PRCI with Linux
   511	 * @dev: Linux struct device *
   512	 *
   513	 * Register the list of clock controls described in __prci_init_plls[] with
   514	 * the Linux clock framework.
   515	 *
   516	 * Return: 0 upon success or a negative error code upon failure.
   517	 */
   518	static int __prci_register_clocks(struct device *dev, struct __prci_data *pd)
   519	{
   520		struct clk_init_data init;
   521		struct __prci_clock *pic;
   522		int parent_count, i, clk_hw_count, r;
   523	
   524		parent_count = of_clk_get_parent_count(dev->of_node);
   525		if (parent_count != EXPECTED_CLK_PARENT_COUNT) {
   526			dev_err(dev, "expected only two parent clocks, found %d\n",
   527				parent_count);
   528			return -EINVAL;
   529		}
   530	
   531		memset(&init, 0, sizeof(struct clk_init_data));
   532	
   533		/* Register PLLs */
 > 534		clk_hw_count = sizeof(__prci_init_clocks) / sizeof(struct __prci_clock);
   535	
   536		for (i = 0; i < clk_hw_count; ++i) {
   537			pic = &__prci_init_clocks[i];
   538	
   539			init.name = pic->name;
   540			init.parent_names = &pic->parent_name;
   541			init.num_parents = 1;
   542			init.ops = pic->ops;
   543			pic->hw.init = &init;
   544	
   545			pic->pd = pd;
   546	
   547			if (pic->pwd)
   548				__prci_wrpll_read_cfg(pd, pic->pwd);
   549	
   550			r = devm_clk_hw_register(dev, &pic->hw);
   551			if (r) {
   552				dev_warn(dev, "Failed to register clock %s: %d\n",
   553					 init.name, r);
   554				return r;
   555			}
   556	
   557			r = clk_hw_register_clkdev(&pic->hw, pic->name, dev_name(dev));
   558			if (r) {
   559				dev_warn(dev, "Failed to register clkdev for %s: %d\n",
   560					 init.name, r);
   561				return r;
   562			}
   563	
   564			pd->hw_clks.hws[i] = &pic->hw;
   565		}
   566	
   567		pd->hw_clks.num = i;
   568	
   569		r = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
   570						&pd->hw_clks);
   571		if (r) {
   572			dev_err(dev, "could not add hw_provider: %d\n", r);
   573			return r;
   574		}
   575	
   576		return 0;
   577	}
   578	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
