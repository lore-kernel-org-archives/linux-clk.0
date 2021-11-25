Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82A9C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 25 Nov 2021 13:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354414AbhKYNFx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:05:53 -0500
Received: from mga07.intel.com ([134.134.136.100]:62029 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354958AbhKYNDw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Nov 2021 08:03:52 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="298916910"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="298916910"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 04:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="650735465"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2021 04:51:36 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqEDv-0006Mx-V3; Thu, 25 Nov 2021 12:51:35 +0000
Date:   Thu, 25 Nov 2021 20:50:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, sboyd@kernel.org,
        rafael@kernel.org, linux-clk@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Vijendar.Mukunda@amd.com,
        Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
        Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 1/7] x86: clk: Add check for PCI root port for fch
 fixed clk support
Message-ID: <202111252001.0psIb0sd-lkp@intel.com>
References: <20211125062036.1185994-2-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125062036.1185994-2-AjitKumar.Pandey@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Ajit,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on rafael-pm/linux-next linus/master v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ajit-Kumar-Pandey/x86-clk-clk-fch-Enhanced-48Mhz-fixed-clk-support/20211125-142523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20211125/202111252001.0psIb0sd-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/ad72f6072b56c2ad466eef386eca2d1a8ba48e2d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ajit-Kumar-Pandey/x86-clk-clk-fch-Enhanced-48Mhz-fixed-clk-support/20211125-142523
        git checkout ad72f6072b56c2ad466eef386eca2d1a8ba48e2d
        # save the config file to linux build tree
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/x86/clk-fch.c: In function 'fch_clk_remove':
>> drivers/clk/x86/clk-fch.c:97:23: warning: variable 'fch_data' set but not used [-Wunused-but-set-variable]
      97 |  struct fch_clk_data *fch_data;
         |                       ^~~~~~~~


vim +/fch_data +97 drivers/clk/x86/clk-fch.c

421bf6a1f061a6e drivers/clk/x86/clk-st.c  Akshu Agrawal     2018-05-09   93  
d9b77361c1a5155 drivers/clk/x86/clk-fch.c Akshu Agrawal     2020-07-31   94  static int fch_clk_remove(struct platform_device *pdev)
421bf6a1f061a6e drivers/clk/x86/clk-st.c  Akshu Agrawal     2018-05-09   95  {
19fe87fd854a92c drivers/clk/x86/clk-fch.c Akshu Agrawal     2020-07-31   96  	int i, clks;
19fe87fd854a92c drivers/clk/x86/clk-fch.c Akshu Agrawal     2020-07-31  @97  	struct fch_clk_data *fch_data;
ad72f6072b56c2a drivers/clk/x86/clk-fch.c Ajit Kumar Pandey 2021-11-25   98  	struct pci_dev *fch_dev;
19fe87fd854a92c drivers/clk/x86/clk-fch.c Akshu Agrawal     2020-07-31   99  
19fe87fd854a92c drivers/clk/x86/clk-fch.c Akshu Agrawal     2020-07-31  100  	fch_data = dev_get_platdata(&pdev->dev);
421bf6a1f061a6e drivers/clk/x86/clk-st.c  Akshu Agrawal     2018-05-09  101  
ad72f6072b56c2a drivers/clk/x86/clk-fch.c Ajit Kumar Pandey 2021-11-25  102  	fch_dev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
ad72f6072b56c2a drivers/clk/x86/clk-fch.c Ajit Kumar Pandey 2021-11-25  103  	if (!fch_dev)
ad72f6072b56c2a drivers/clk/x86/clk-fch.c Ajit Kumar Pandey 2021-11-25  104  		return -ENODEV;
ad72f6072b56c2a drivers/clk/x86/clk-fch.c Ajit Kumar Pandey 2021-11-25  105  
ad72f6072b56c2a drivers/clk/x86/clk-fch.c Ajit Kumar Pandey 2021-11-25  106  	clks = pci_match_id(fch_pci_ids, fch_dev) ? CLK_MAX_FIXED : ST_MAX_CLKS;
19fe87fd854a92c drivers/clk/x86/clk-fch.c Akshu Agrawal     2020-07-31  107  
19fe87fd854a92c drivers/clk/x86/clk-fch.c Akshu Agrawal     2020-07-31  108  	for (i = 0; i < clks; i++)
421bf6a1f061a6e drivers/clk/x86/clk-st.c  Akshu Agrawal     2018-05-09  109  		clk_hw_unregister(hws[i]);
19fe87fd854a92c drivers/clk/x86/clk-fch.c Akshu Agrawal     2020-07-31  110  
421bf6a1f061a6e drivers/clk/x86/clk-st.c  Akshu Agrawal     2018-05-09  111  	return 0;
421bf6a1f061a6e drivers/clk/x86/clk-st.c  Akshu Agrawal     2018-05-09  112  }
421bf6a1f061a6e drivers/clk/x86/clk-st.c  Akshu Agrawal     2018-05-09  113  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
