Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BE7C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jan 2022 23:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245394AbiAFXOn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jan 2022 18:14:43 -0500
Received: from mga04.intel.com ([192.55.52.120]:15272 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234795AbiAFXOn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jan 2022 18:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641510883; x=1673046883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VdB8zoGzAq2HP/5Qq4vGBPUgmCdC3fOj8qRknx+miG8=;
  b=CsOQqeEu78TvbCw3Ut8rJaxgMKtfdS0TSss9D89f7hLOotZLSbOu1i16
   JDniuK+gF8aekgW0tiBNd2BNpzjn8LfGJlOzcN4FfDl/XxcpPsNObr55N
   WSq4rNeuvv3QDcN6ndGOeM0HO1L+/scwnes/1a1FhdQBhcWTYMsHi6L1q
   QZVcQW7nzNU1VrWz6CwgcxuN4oaYIPrqsXcOrQNbJkWsrRpiR03uHw99S
   chEtvGIg46scbSSr4Rpdq/a7dbEHf9MYXfvqIF5G7mjexb4XlQ5yt22mG
   ewMy5qu69vvBG7mPd/PAtpzVc4l8/h4ZOpj7a+hzCUh0Yx213gh7F5rWX
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241574641"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="241574641"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 15:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="473112295"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jan 2022 15:14:34 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n5bxo-000I4o-Tu; Thu, 06 Jan 2022 23:14:32 +0000
Date:   Fri, 7 Jan 2022 07:13:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [clk:clk-toshiba 3/4] drivers/clk/visconti/pll.c:292:20: warning:
 address of array 'ctx->clk_data.hws' will always evaluate to 'true'
Message-ID: <202201070705.HU38Acnr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-toshiba
head:   70faf946ad975c64efb2eb809f9139f304a494b0
commit: b4cbe606dc3674b25cb661e7cd1a1c6ddaaafaaa [3/4] clk: visconti: Add support common clock driver and reset driver
config: arm64-randconfig-r003-20220106 (https://download.01.org/0day-ci/archive/20220107/202201070705.HU38Acnr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=b4cbe606dc3674b25cb661e7cd1a1c6ddaaafaaa
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-toshiba
        git checkout b4cbe606dc3674b25cb661e7cd1a1c6ddaaafaaa
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/visconti/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/visconti/pll.c:292:20: warning: address of array 'ctx->clk_data.hws' will always evaluate to 'true' [-Wpointer-bool-conversion]
           if (ctx->clk_data.hws && id)
               ~~~~~~~~~~~~~~^~~ ~~
   1 warning generated.


vim +292 drivers/clk/visconti/pll.c

   287	
   288	static void visconti_pll_add_lookup(struct visconti_pll_provider *ctx,
   289					    struct clk_hw *hw_clk,
   290					    unsigned int id)
   291	{
 > 292		if (ctx->clk_data.hws && id)
   293			ctx->clk_data.hws[id] = hw_clk;
   294	}
   295	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
