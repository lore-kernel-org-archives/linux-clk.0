Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93CEC61DA4
	for <linux-clk@archiver.kernel.org>; Sat, 18 Mar 2023 12:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjCRM1r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Mar 2023 08:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCRM1r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Mar 2023 08:27:47 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D1735EED
        for <linux-clk@vger.kernel.org>; Sat, 18 Mar 2023 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679142466; x=1710678466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cl2kE6gh14p8PaJXQQlhqYjl5zl0pxtfMDfCUID6wEY=;
  b=SgNsSu5MZOt3S7OHIMIxH3GuSx61wMdRk2w8FwG3/qua2PTiJ2s+PFHA
   AbEJ5nZEz2kbgjE0n63/th+6jsMxPgv0/J3pjhwnSuX64duyn/RJPgrQJ
   E0HASy/IRc1yvvQ/qIxWhrRRIlwzE7tjwP1HqtOpFnznYttijuITikzad
   5RklsjwUryRyWvjKhbFmTkLB6Hvsw9Xt9ZYnJTyppEFnVK/GS4EBF5Ir9
   TOLyXByBPdUxrfcohTaxJZrKQFbsijM2wKSZW9b8j/g3RZox+AubvXye7
   1XIJ1Evwiyfpt7f9AYtP4nFxHzdMXggVRgs4Y4CMKROeKDu3rRtr2YoTh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="401006419"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="401006419"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 05:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="682964523"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="682964523"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Mar 2023 05:27:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pdVex-000A3W-0F;
        Sat, 18 Mar 2023 12:27:43 +0000
Date:   Sat, 18 Mar 2023 20:27:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: [clk:clk-mediatek 5/62] clk-mt8173-apmixedsys.c:undefined reference
 to `mtk_clk_unregister_pllfhs'
Message-ID: <202303182019.n5idhG3T-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   eddc63094855f411455db85b77eb8439201dc779
commit: 45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425 [5/62] clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
config: riscv-randconfig-r042-20230312 (https://download.01.org/0day-ci/archive/20230318/202303182019.n5idhG3T-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-mediatek
        git checkout 45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303182019.n5idhG3T-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_remove':
>> clk-mt8173-apmixedsys.c:(.text+0x32): undefined reference to `mtk_clk_unregister_pllfhs'
   riscv64-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_probe':
>> clk-mt8173-apmixedsys.c:(.text+0xa0): undefined reference to `fhctl_parse_dt'
>> riscv64-linux-ld: clk-mt8173-apmixedsys.c:(.text+0xba): undefined reference to `mtk_clk_register_pllfhs'
>> riscv64-linux-ld: clk-mt8173-apmixedsys.c:(.text+0x16c): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
