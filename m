Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CB1C7618A
	for <linux-clk@archiver.kernel.org>; Sat, 18 Mar 2023 12:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCRM1t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Mar 2023 08:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCRM1s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Mar 2023 08:27:48 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C9D35EE1
        for <linux-clk@vger.kernel.org>; Sat, 18 Mar 2023 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679142466; x=1710678466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4uKCE6hBcUQ7DN5slUxXsahuEIyHc6ytTV7jgdT7fA=;
  b=LDFlH8PUqyeMyFq5/iLBqxCRZIPFshedM/WDMtSd0Nz5vnwLXWe1Z0p/
   LehVEzazTs/93NlD4inHWMFl7TjSee+Gp3sB6CfV31zEukNSiiIw472VM
   6FoXDa71gvdFsMcm2gTYyD/vyLVx8khddsRxnYQ65iZKofRMkqljxBOT0
   UBWtom40ndV8EBJzPT9m1QrybO/HPl4qT30ni3HEuNOBnTVW6B/tb85Qc
   BmKXDnYB2S00ddCC3Y0C73o82UXIKq6YwyynyiOCi49h4gJiYZmi8Rmre
   MTWDctdsFXU+sfu/gpaMv3O/FUFadjjyFCYqGczujc6pePdWLtD3Ofgll
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337136997"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="337136997"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 05:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926457559"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="926457559"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Mar 2023 05:27:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pdVex-000A3Y-0N;
        Sat, 18 Mar 2023 12:27:43 +0000
Date:   Sat, 18 Mar 2023 20:27:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: [clk:clk-mediatek 5/62] arc-elf-ld:
 clk-mt8173-apmixedsys.c:undefined reference to `mtk_clk_unregister_pllfhs'
Message-ID: <202303182041.EbxBxTlR-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   eddc63094855f411455db85b77eb8439201dc779
commit: 45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425 [5/62] clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
config: arc-randconfig-r043-20230312 (https://download.01.org/0day-ci/archive/20230318/202303182041.EbxBxTlR-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-mediatek
        git checkout 45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303182041.EbxBxTlR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_remove':
   clk-mt8173-apmixedsys.c:(.text+0x24): undefined reference to `mtk_clk_unregister_pllfhs'
>> arc-elf-ld: clk-mt8173-apmixedsys.c:(.text+0x24): undefined reference to `mtk_clk_unregister_pllfhs'
   arc-elf-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_probe':
   clk-mt8173-apmixedsys.c:(.text+0xb6): undefined reference to `fhctl_parse_dt'
>> arc-elf-ld: clk-mt8173-apmixedsys.c:(.text+0xb6): undefined reference to `fhctl_parse_dt'
>> arc-elf-ld: clk-mt8173-apmixedsys.c:(.text+0xd0): undefined reference to `mtk_clk_register_pllfhs'
>> arc-elf-ld: clk-mt8173-apmixedsys.c:(.text+0xd0): undefined reference to `mtk_clk_register_pllfhs'
   arc-elf-ld: clk-mt8173-apmixedsys.c:(.text+0x142): undefined reference to `mtk_clk_unregister_pllfhs'
   arc-elf-ld: clk-mt8173-apmixedsys.c:(.text+0x142): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
