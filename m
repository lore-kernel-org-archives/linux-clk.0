Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810BA36EAB2;
	Wed, 14 Oct 2026 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004501; cv=none; b=ZEMlMemPfSGWhVp+umZR6WzJ3dGUqIc+pMQ20S6O8lXHlJHeKRSVWVT+5eZ732SP7rMTJKcVC1IAaiBaEvI8dmpxB4mcFsFd9G8kJvJJpjB2aXjcKmvWHw9kTLTIoD684TCP++HyZrzEzO6aQgSf0FhmJLKJDaHhGdQIxcLBqfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004501; c=relaxed/simple;
	bh=eH2Judo0oDaJoMduW8BZVfPz3bobRSuAdFGcSBEw4KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5+oW0AL91+giwXyt00Gw4UKSSYR+0avGW1aEGsyCNpFnoNfBeVbuMJUEjEhtEDk3uFvmNoIngF7zFCeVI448LIfl4kwR/5+RzKjLFRRQrj9mPFRm0LigUTsuznoEQKysrtG/OHEmeJHi3yLfvQM6UCdlwMe2uVapN0Zy6os4U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJ81klCR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJ81klCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792004500; x=1823540500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eH2Judo0oDaJoMduW8BZVfPz3bobRSuAdFGcSBEw4KI=;
  b=lJ81klCRHz3I/QlLW5LyUz1PbjXe18wnWgkWUU0ORSsbC/91XLvYW+rE
   NfWTMqEicbH4HwhW0tq/BPZlfVTm4E4lBK48o6BHcucGXwfiiBJ/NHTWf
   weSPgsZ6ke7br7yA2Ub/DIRRSdiFkjaEMH9LXWAvpCHFOKnffPXDnH4IM
   TYf94P9TLyXm+1D4LardacdCkx8RD2vDD5w/ZXJF/YGNhPZLAHe/gBiIU
   IqrnmJL8Vj84fOXI8I6Tud/D8gcTf+m9BDy+HMLmpn0JHiA2oHuSEj2AB
   WyxIlnw4+KvIZL/P9sVz4jw8ie2JDbKaNtYZacY4kLlgxoYuK6m4oaaNO
   w==;
X-CSE-ConnectionGUID: M3QE0IrhQQ+fskXrT+wEXw==
X-CSE-MsgGUID: wD7ziTVUS/yan0+REkp+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="770530"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="770530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 12:01:39 -0700
X-CSE-ConnectionGUID: 7ZOYIYY/T3atE/S9XHVClQ==
X-CSE-MsgGUID: w0sTSkONTIeOsmKMycL5Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1469613"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2026 12:01:36 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH4EH-00000000F5P-0Lnl;
	Wed, 14 Oct 2026 19:01:33 +0000
Date: Thu, 15 Oct 2026 03:01:28 +0800
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
Message-ID: <202610150234.1B8DywxX-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on becb95e45ef0dda9ffb35156d909d3da7a2789c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarath-Ganapathiraju-via-B4-Relay/dt-bindings-clock-qcom-Add-LPASS-VA-CSR-HeartBeat-pulse-clock/20261012-172258
base:   becb95e45ef0dda9ffb35156d909d3da7a2789c3
patch link:    https://lore.kernel.org/r/20261012-master-v11-2-15009e3ecac3%40oss.qualcomm.com
patch subject: [PATCH v11 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261015/202610150234.1B8DywxX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150234.1B8DywxX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150234.1B8DywxX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/m68k/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:391,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/clk-provider.h:10,
                    from drivers/clk/qcom/lpass-va-csr.c:6:
   drivers/clk/qcom/lpass-va-csr.c: In function 'lpass_va_csr_runtime_resume':
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:78:25: note: in expansion of macro 'NULL'
      78 | #define pm_clk_resume   NULL
         |                         ^~~~
   drivers/clk/qcom/lpass-va-csr.c:61:15: note: in expansion of macro 'pm_clk_resume'
      61 |         ret = pm_clk_resume(dev);
         |               ^~~~~~~~~~~~~
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   drivers/clk/qcom/lpass-va-csr.c:77:9: note: in expansion of macro 'pm_clk_suspend'
      77 |         pm_clk_suspend(dev);
         |         ^~~~~~~~~~~~~~
   drivers/clk/qcom/lpass-va-csr.c: In function 'lpass_va_csr_runtime_suspend':
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   drivers/clk/qcom/lpass-va-csr.c:83:16: note: in expansion of macro 'pm_clk_suspend'
      83 |         return pm_clk_suspend(dev);
         |                ^~~~~~~~~~~~~~
   drivers/clk/qcom/lpass-va-csr.c: At top level:
>> drivers/clk/qcom/lpass-va-csr.c:81:12: warning: 'lpass_va_csr_runtime_suspend' defined but not used [-Wunused-function]
      81 | static int lpass_va_csr_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/lpass-va-csr.c:55:12: warning: 'lpass_va_csr_runtime_resume' defined but not used [-Wunused-function]
      55 | static int lpass_va_csr_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/lpass_va_csr_runtime_suspend +81 drivers/clk/qcom/lpass-va-csr.c

    54	
  > 55	static int lpass_va_csr_runtime_resume(struct device *dev)
    56	{
    57		struct lpass_va_csr *csr = dev_get_drvdata(dev);
    58		const struct lpass_va_csr_data *data = csr->data;
    59		int ret;
    60	
    61		ret = pm_clk_resume(dev);
    62		if (ret)
    63			return ret;
    64	
    65		ret = regmap_write(csr->hb.regmap, LPASS_RATE_GEN_COUNTER_0,
    66				   data->counter_0);
    67		if (ret)
    68			goto err_pm_clk_suspend;
    69	
    70		ret = regmap_write(csr->hb.regmap, LPASS_RATE_GEN_DELAY, data->delay);
    71		if (ret)
    72			goto err_pm_clk_suspend;
    73	
    74		return 0;
    75	
    76	err_pm_clk_suspend:
    77		pm_clk_suspend(dev);
    78		return ret;
    79	}
    80	
  > 81	static int lpass_va_csr_runtime_suspend(struct device *dev)
    82	{
  > 83		return pm_clk_suspend(dev);
    84	}
    85	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
