Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156F44C502;
	Wed, 14 Oct 2026 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967029; cv=none; b=HhVOa8qWosObpbxxGmrE9OklPbM/OYCkb1j0SuOBalMpdzWEs1b+l3FVmg67VNMaMQgLyyftE+mqxEScRmBsWoemrsdvlGqfGJnS43OxgFLlAVTAFmaHkj5nNVg+PPRWhlrztG0fLcQvfASKwoSVbGaaFcgoJV5ysAsYBomoFUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967029; c=relaxed/simple;
	bh=KkZwlhXb7ppouEWVWD59Fver9AGZ9taM6rrP0X+t6q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufwG8GtYbwYSle0DaYYyXMMQ1Osqce9UQ471ioUIiufI7zDGLdtMhPxxad+V1R7DsPlukG5Krx4nrjt5pzgwQ35wsHfUFlip++NWLDgWcYkP37He5Z2yZMl4DXVxlzGzDys5uwriEZGbK2p4DlULilECiMQOL4ya0vDAKm8Itqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnf6f0/l; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnf6f0/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791967028; x=1823503028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KkZwlhXb7ppouEWVWD59Fver9AGZ9taM6rrP0X+t6q4=;
  b=cnf6f0/lGKnQUF9tEzOr1Rg6Zp61ZSS+opJpvl3vgxmPbqt6G0Ti0bAZ
   6RxpZMDYex578bffBX3XznuUPPTVoLvCQLIO3UIO6mpP9qSThijzhzRnd
   aec25PEFu8qEyYfVn0NLv46wJICSup34WWQXwe50OHw8rv8q9PsNlQWqt
   ED0BnOXGwauVNRtE+Xt+MYMOSowILUq9TXzpLDdxsT/Iv+xaw/8kohHRJ
   EwZfVV+hUjDWPoJwrxS4uMGKOIz2mMjEX1T9JHh/i2dxnw1h1nCl1FHUL
   VY1HQ46uta0QhCea9xxxhZmXkPNiFms/vVLN36PQpJnpGJb4DQkYyn+IQ
   g==;
X-CSE-ConnectionGUID: yB9xy+YqSs2+E90xXLcGiQ==
X-CSE-MsgGUID: id6nK5hSQcCarrl05hlzvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="737485"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="737485"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 01:37:08 -0700
X-CSE-ConnectionGUID: GDhnAS2fTa2fxnusGSge9Q==
X-CSE-MsgGUID: gGbEeHzqS0W1AP4lc+mGVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1473407"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2026 01:37:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGuTs-00000000EOd-1RUK;
	Wed, 14 Oct 2026 08:37:00 +0000
Date: Wed, 14 Oct 2026 16:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>,
	andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	sarath.ganapathiraju@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v11 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Message-ID: <202610141629.Jo17UNWq-lkp@intel.com>
References: <20261012-master-v11-2-15009e3ecac3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-master-v11-2-15009e3ecac3@oss.qualcomm.com>

Hi Sarath,

kernel test robot noticed the following build errors:

[auto build test ERROR on becb95e45ef0dda9ffb35156d909d3da7a2789c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarath-Ganapathiraju-via-B4-Relay/dt-bindings-clock-qcom-Add-LPASS-VA-CSR-HeartBeat-pulse-clock/20261012-172258
base:   becb95e45ef0dda9ffb35156d909d3da7a2789c3
patch link:    https://lore.kernel.org/r/20261012-master-v11-2-15009e3ecac3%40oss.qualcomm.com
patch subject: [PATCH v11 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261014/202610141629.Jo17UNWq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141629.Jo17UNWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610141629.Jo17UNWq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/parisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:391,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/clk-provider.h:10,
                    from drivers/clk/qcom/lpass-va-csr.c:6:
   drivers/clk/qcom/lpass-va-csr.c: In function 'lpass_va_csr_runtime_resume':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:78:25: note: in expansion of macro 'NULL'
      78 | #define pm_clk_resume   NULL
         |                         ^~~~
   drivers/clk/qcom/lpass-va-csr.c:61:15: note: in expansion of macro 'pm_clk_resume'
      61 |         ret = pm_clk_resume(dev);
         |               ^~~~~~~~~~~~~
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   drivers/clk/qcom/lpass-va-csr.c:77:9: note: in expansion of macro 'pm_clk_suspend'
      77 |         pm_clk_suspend(dev);
         |         ^~~~~~~~~~~~~~
   drivers/clk/qcom/lpass-va-csr.c: In function 'lpass_va_csr_runtime_suspend':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   drivers/clk/qcom/lpass-va-csr.c:83:16: note: in expansion of macro 'pm_clk_suspend'
      83 |         return pm_clk_suspend(dev);
         |                ^~~~~~~~~~~~~~
   drivers/clk/qcom/lpass-va-csr.c: At top level:
   drivers/clk/qcom/lpass-va-csr.c:81:12: warning: 'lpass_va_csr_runtime_suspend' defined but not used [-Wunused-function]
      81 | static int lpass_va_csr_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/qcom/lpass-va-csr.c:55:12: warning: 'lpass_va_csr_runtime_resume' defined but not used [-Wunused-function]
      55 | static int lpass_va_csr_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/parisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:391,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/clk-provider.h:10,
                    from lpass-va-csr.c:6:
   lpass-va-csr.c: In function 'lpass_va_csr_runtime_resume':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:78:25: note: in expansion of macro 'NULL'
      78 | #define pm_clk_resume   NULL
         |                         ^~~~
   lpass-va-csr.c:61:15: note: in expansion of macro 'pm_clk_resume'
      61 |         ret = pm_clk_resume(dev);
         |               ^~~~~~~~~~~~~
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   lpass-va-csr.c:77:9: note: in expansion of macro 'pm_clk_suspend'
      77 |         pm_clk_suspend(dev);
         |         ^~~~~~~~~~~~~~
   lpass-va-csr.c: In function 'lpass_va_csr_runtime_suspend':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   lpass-va-csr.c:83:16: note: in expansion of macro 'pm_clk_suspend'
      83 |         return pm_clk_suspend(dev);
         |                ^~~~~~~~~~~~~~
   lpass-va-csr.c: At top level:
   lpass-va-csr.c:81:12: warning: 'lpass_va_csr_runtime_suspend' defined but not used [-Wunused-function]
      81 | static int lpass_va_csr_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lpass-va-csr.c:55:12: warning: 'lpass_va_csr_runtime_resume' defined but not used [-Wunused-function]
      55 | static int lpass_va_csr_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +8 include/linux/stddef.h

^1da177e4c3f415 Linus Torvalds   2005-04-16  6  
^1da177e4c3f415 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f415 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e2182874324727 Richard Knutsson 2006-09-30  9  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
