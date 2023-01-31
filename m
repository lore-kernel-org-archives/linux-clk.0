Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398A8C38142
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 22:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjAaWed (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 17:34:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjAaWec (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 17:34:32 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6066113EB;
        Tue, 31 Jan 2023 14:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675204471; x=1706740471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D8gJi0ehG5WvTwectwLP//Bmc1IPekTGj1oNIj2Eicc=;
  b=kYqXdS+tad65k8TxdjpmShBjc/tLDWJZf2mMhbdEfbpZujosdjsU1TI7
   01RY/89bsWuqdmmltgsFACUkhVx5qDf8Rlnc1qQo9nXghrqGB3btGXVZ4
   EJgbgXL0eZ8OC/GacOi8Qw/yLuFY9ViCV9t65NStrtVlGFRcepm9DcqNA
   yEUeHeBYyr5Fvvnwfgv7LPMR6cXGtuf/XirIkNvbSi6abnm6viiGoQ8ip
   4ap1TDcg0mk+3F4Pw3AxTQzSiLrmP+MCZAUp28WmElqT1vrzN9D8O+2PK
   oy8gcskVMW15CcieCeTklckrQRSOdOOVsGicfDtiNiZXku9eiYccQzD8b
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="315948019"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="315948019"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 14:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788619371"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="788619371"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Jan 2023 14:34:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMzCt-0004lK-2T;
        Tue, 31 Jan 2023 22:34:27 +0000
Date:   Wed, 1 Feb 2023 06:33:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being
 programmed for CX GDSC
Message-ID: <202302010608.GDyw4Xuo-lkp@intel.com>
References: <20230131092432.122711-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131092432.122711-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.2-rc6 next-20230131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/clk-qcom-gpucc-sdm845-fix-clk_dis_wait-being-programmed-for-CX-GDSC/20230131-172656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230131092432.122711-2-dmitry.baryshkov%40linaro.org
patch subject: [PATCH 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
config: arm64-randconfig-r016-20230130 (https://download.01.org/0day-ci/archive/20230201/202302010608.GDyw4Xuo-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8222d81144cbdf9b51ffe1ffc61e16b471456329
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/clk-qcom-gpucc-sdm845-fix-clk_dis_wait-being-programmed-for-CX-GDSC/20230131-172656
        git checkout 8222d81144cbdf9b51ffe1ffc61e16b471456329
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/gpucc-sdm845.c:122:3: error: field designator 'clk_dis_wait' does not refer to any field in type 'struct gdsc'; did you mean 'clk_dis_wait_val'?
           .clk_dis_wait = 0x8,
            ^~~~~~~~~~~~
            clk_dis_wait_val
   drivers/clk/qcom/gdsc.h:47:17: note: 'clk_dis_wait_val' declared here
           unsigned int                    clk_dis_wait_val;
                                           ^
   1 error generated.


vim +122 drivers/clk/qcom/gpucc-sdm845.c

   118	
   119	static struct gdsc gpu_cx_gdsc = {
   120		.gdscr = 0x106c,
   121		.gds_hw_ctrl = 0x1540,
 > 122		.clk_dis_wait = 0x8,
   123		.pd = {
   124			.name = "gpu_cx_gdsc",
   125		},
   126		.pwrsts = PWRSTS_OFF_ON,
   127		.flags = VOTABLE,
   128	};
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
