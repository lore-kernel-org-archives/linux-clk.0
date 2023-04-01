Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A3DC6FD1D
	for <linux-clk@archiver.kernel.org>; Sat,  1 Apr 2023 23:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjDAXGv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Apr 2023 19:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjDAXGu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Apr 2023 19:06:50 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E1927828
        for <linux-clk@vger.kernel.org>; Sat,  1 Apr 2023 16:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680390409; x=1711926409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2IDBXEc2GzDdhXFuJyPLEpslmwtlwRbU3d8GHoNbD8=;
  b=FcQyRsdwTtKby6i3njiPr+r1d35iN2Z+1j341zv5DmuPYqWiSl0GSyrw
   1ICHkeNvOHu11GgWSZ8o/WCqQ4ALVT3zYSQWP8nWAj8f449vIQVI7H891
   NUlnsynV1irxhYJNQW34ID4dbBqNc12h9eC+LLQ6rR0xfXPTFWmOWqJr5
   4m3CJ5IQ+8bqgsCNIt/nWZ0ffuOXZnMgOyxljzWGcDatB/dMOA2RYawFH
   qM5PCtGz0oEeSB/61HjTUBw9H7xtnvwxhdnylawwVKod0T7wW1F2YQ68/
   gOrTbsIRXej/XIScFqEHr3f2C9/KGYBDm8kLM8FzipU3DR8YTvdt2dS00
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="406730814"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="406730814"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 16:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="796555740"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="796555740"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2023 16:06:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pikIz-000N6N-0l;
        Sat, 01 Apr 2023 23:06:41 +0000
Date:   Sun, 2 Apr 2023 07:05:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [clk:clk-mediatek 81/82] FATAL: modpost:
 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap: sizeof(struct
 platform_device_id)=24 is not a modulo of the size of section
 __mod_platform__<identifier>_device_table=784.
Message-ID: <202304020649.QO2HlpD5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   0d2f2cefba64729a0730ce183ad58cf3e7929b94
commit: 1b5e5299dd35da0dff2d454826a60870237837da [81/82] clk: mediatek: Add MT8188 imp i2c wrapper clock support
config: parisc-randconfig-m041-20230402 (https://download.01.org/0day-ci/archive/20230402/202304020649.QO2HlpD5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=1b5e5299dd35da0dff2d454826a60870237837da
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-mediatek
        git checkout 1b5e5299dd35da0dff2d454826a60870237837da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020649.QO2HlpD5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> FATAL: modpost: drivers/clk/mediatek/clk-mt8188-imp_iic_wrap: sizeof(struct platform_device_id)=24 is not a modulo of the size of section __mod_platform__<identifier>_device_table=784.
Fix definition of struct platform_device_id in mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
