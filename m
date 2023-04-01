Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA09C761A6
	for <linux-clk@archiver.kernel.org>; Sat,  1 Apr 2023 02:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbjDACoN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 22:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbjDACoM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 22:44:12 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A4E11EAD
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 19:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680317051; x=1711853051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbEbsKMc9MhjmKuTRlR3fVGeqdGfMrZ3ac6yj9i2FZ0=;
  b=KQ9sO/GGZ35HTJGjswbrmrjxqIngyW0kQu7vFXK7XSrBswUh481wFmE7
   aMlwqwJM3MBUPMfpGNQQmxDM/7FgabumNd0RzPec6e358N7Gh8i0J7w2D
   LvM+0m7YpXOz5Rx0nQ04+/+1LqblPBh9ZfUVbRr+Up/6d5Gwe1wizWmsR
   MRshrEX/snCcxL+w1ebND+9HP0wVbHXwaotJpAjBX2CNgyICrMwp8RWTL
   G31p2NnYksR5sRL0c8ORViRPiFQEUsRg1xyi2MANQ7ubXsKOO/FeY0N2Y
   gsK2xwMrNYQXDfo2LvUQiFkG85AwsrNUpPX/vq/x05JAnehNDXa/fXVrI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339100177"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="339100177"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 19:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="754588766"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="754588766"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2023 19:44:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1piRDs-000MOT-0c;
        Sat, 01 Apr 2023 02:44:08 +0000
Date:   Sat, 1 Apr 2023 10:43:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [clk:clk-mediatek 80/82]
 drivers/clk/mediatek/clk-mt8188-wpe.c:91:31: error:
 'clk_mt8188_vpp1_id_table' undeclared here (not in a function)
Message-ID: <202304011039.UBDX1UOT-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   0d2f2cefba64729a0730ce183ad58cf3e7929b94
commit: f42b9e9a43e300ef94c3dc0381cc60f50e46e1fe [80/82] clk: mediatek: Add MT8188 wpesys clock support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230401/202304011039.UBDX1UOT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=f42b9e9a43e300ef94c3dc0381cc60f50e46e1fe
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-mediatek
        git checkout f42b9e9a43e300ef94c3dc0381cc60f50e46e1fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011039.UBDX1UOT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from drivers/clk/mediatek/clk-mt8188-wpe.c:9:
>> drivers/clk/mediatek/clk-mt8188-wpe.c:91:31: error: 'clk_mt8188_vpp1_id_table' undeclared here (not in a function)
      91 | MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp1_id_table);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:243:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:243:21: error: '__mod_platform__clk_mt8188_vpp1_id_table_device_table' aliased to undefined symbol 'clk_mt8188_vpp1_id_table'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/clk/mediatek/clk-mt8188-wpe.c:91:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
      91 | MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp1_id_table);
         | ^~~~~~~~~~~~~~~~~~~


vim +/clk_mt8188_vpp1_id_table +91 drivers/clk/mediatek/clk-mt8188-wpe.c

    85	
    86	static const struct of_device_id of_match_clk_mt8188_wpe[] = {
    87		{ .compatible = "mediatek,mt8188-wpesys", .data = &wpe_top_desc },
    88		{ .compatible = "mediatek,mt8188-wpesys-vpp0", .data = &wpe_vpp0_desc },
    89		{ /* sentinel */ }
    90	};
  > 91	MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp1_id_table);
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
