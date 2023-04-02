Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D19C6FD1D
	for <linux-clk@archiver.kernel.org>; Sun,  2 Apr 2023 03:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjDBDDw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Apr 2023 23:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBDDv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Apr 2023 23:03:51 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338111F7B3
        for <linux-clk@vger.kernel.org>; Sat,  1 Apr 2023 20:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680404630; x=1711940630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aZifsaAEso7qXDiYmzrkdxCr4EDkLyzHawHD9RGCQQ=;
  b=ZA0AyOWuZszjWDwe8Ap4rOCZN1mnmKmR/crFtiIybBwjaE2BWcyF6L5l
   vJrorY8pXqP556SBMtyCoYQ1P3IHWNeZZLlsoyVBHQiUnFZOeLtYNfc4X
   DUJ75En2vO56B1N1CHaeYwAfS8lEjO+qmWtu2AegNl3v8wtULl545mDDN
   TGCil43OHMqDiTIqKQULySnOOQVoPLBs6VK6eJOtMXeIY2/CY+9oMEZbP
   wyvrUpmKpQXdbx6Y9hgbb01yLFjnqNsGeSXI49FgUXSe8/41d9RA5P8Oc
   ZOxNS/v+66pfQKzjLVphJ3fblV0PnSoM6dzY2jVi99o3qxLmMQ5tedG4V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="406741672"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="406741672"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 20:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="754819234"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="754819234"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2023 20:03:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pio0Q-000NCL-2a;
        Sun, 02 Apr 2023 03:03:46 +0000
Date:   Sun, 2 Apr 2023 11:02:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [clk:clk-mediatek 82/82] FATAL: modpost:
 drivers/clk/mediatek/clk-mt8188-adsp_audio26m: sizeof(struct
 platform_device_id)=24 is not a modulo of the size of section
 __mod_platform__<identifier>_device_table=392.
Message-ID: <202304021055.WDhQPcoS-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   0d2f2cefba64729a0730ce183ad58cf3e7929b94
commit: 0d2f2cefba64729a0730ce183ad58cf3e7929b94 [82/82] clk: mediatek: Add MT8188 adsp clock support
config: microblaze-randconfig-r024-20230402 (https://download.01.org/0day-ci/archive/20230402/202304021055.WDhQPcoS-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=0d2f2cefba64729a0730ce183ad58cf3e7929b94
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-mediatek
        git checkout 0d2f2cefba64729a0730ce183ad58cf3e7929b94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304021055.WDhQPcoS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> FATAL: modpost: drivers/clk/mediatek/clk-mt8188-adsp_audio26m: sizeof(struct platform_device_id)=24 is not a modulo of the size of section __mod_platform__<identifier>_device_table=392.
Fix definition of struct platform_device_id in mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
