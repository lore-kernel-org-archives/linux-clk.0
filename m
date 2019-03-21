Return-Path: <SRS0=PHVF=RY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1B9C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Mar 2019 02:06:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBC2C218A2
	for <linux-clk@archiver.kernel.org>; Thu, 21 Mar 2019 02:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbfCUCGS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Mar 2019 22:06:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:59053 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfCUCGS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Mar 2019 22:06:18 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Mar 2019 19:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,251,1549958400"; 
   d="gz'50?scan'50,208,50";a="154270855"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2019 19:06:02 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1h6n5m-00081Z-FJ; Thu, 21 Mar 2019 10:06:02 +0800
Date:   Thu, 21 Mar 2019 10:05:31 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [clk:clk-parent-rewrite 32/32]
 drivers/clk/microchip/clk-core.c:293:3: warning: this 'if' clause does not
 guard...
Message-ID: <201903211028.8uJfEKLw%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-parent-rewrite
head:   6a6d2ba76f95f9e4f7afea765841f40eb33d55d4
commit: 6a6d2ba76f95f9e4f7afea765841f40eb33d55d4 [32/32] stash megadiff!
config: mips-pic32mzda_defconfig (attached as .config)
compiler: mipsel-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6a6d2ba76f95f9e4f7afea765841f40eb33d55d4
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=mips 

All warnings (new ones prefixed by >>):

   drivers/clk/microchip/clk-core.c: In function 'roclk_get_parent':
>> drivers/clk/microchip/clk-core.c:293:3: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      if (refo->parent_map[i] == v)
      ^~
   drivers/clk/microchip/clk-core.c:294:45: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
       return clk_hw_get_parent_by_index(hw, i);return clk_hw_get_parent_by_index(hw,
                                                ^~~~~~
   drivers/clk/microchip/clk-core.c: In function 'roclk_set_rate':
>> drivers/clk/microchip/clk-core.c:544:13: warning: initialization makes integer from pointer without a cast [-Wint-conversion]
     u8 index = roclk_get_parent(hw);
                ^~~~~~~~~~~~~~~~
   drivers/clk/microchip/clk-core.c: In function 'sclk_get_parent':
   drivers/clk/microchip/clk-core.c:834:3: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      if (sclk->parent_map[i] == v)
      ^~
   drivers/clk/microchip/clk-core.c:835:45: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
       return clk_hw_get_parent_by_index(hw, i);return clk_hw_get_parent_by_index(hw,
                                                ^~~~~~

vim +/if +293 drivers/clk/microchip/clk-core.c

ce6e1188 Purna Chandra Mandal 2016-05-13  281  
6a6d2ba7 Stephen Boyd         2019-02-28  282  static struct clk_hw *roclk_get_parent(struct clk_hw *hw)
ce6e1188 Purna Chandra Mandal 2016-05-13  283  {
ce6e1188 Purna Chandra Mandal 2016-05-13  284  	struct pic32_ref_osc *refo = clkhw_to_refosc(hw);
ce6e1188 Purna Chandra Mandal 2016-05-13  285  	u32 v, i;
ce6e1188 Purna Chandra Mandal 2016-05-13  286  
ce6e1188 Purna Chandra Mandal 2016-05-13  287  	v = (readl(refo->ctrl_reg) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
ce6e1188 Purna Chandra Mandal 2016-05-13  288  
ce6e1188 Purna Chandra Mandal 2016-05-13  289  	if (!refo->parent_map)
6a6d2ba7 Stephen Boyd         2019-02-28  290  		return clk_hw_get_parent_by_index(hw, v);
ce6e1188 Purna Chandra Mandal 2016-05-13  291  
ce6e1188 Purna Chandra Mandal 2016-05-13  292  	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
ce6e1188 Purna Chandra Mandal 2016-05-13 @293  		if (refo->parent_map[i] == v)
6a6d2ba7 Stephen Boyd         2019-02-28  294  			return clk_hw_get_parent_by_index(hw, i);return clk_hw_get_parent_by_index(hw,
6a6d2ba7 Stephen Boyd         2019-02-28  295  												   -EINVAL);
ce6e1188 Purna Chandra Mandal 2016-05-13  296  }
ce6e1188 Purna Chandra Mandal 2016-05-13  297  

:::::: The code at line 293 was first introduced by commit
:::::: ce6e1188465998820e7182455261b1f5d508ca17 CLK: microchip: Add Microchip PIC32 clock driver.

:::::: TO: Purna Chandra Mandal <purna.mandal@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--1yeeQ81UyVL57Vl7
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
nAAA

--1yeeQ81UyVL57Vl7--
