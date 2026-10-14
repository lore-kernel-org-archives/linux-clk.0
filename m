Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAACA3FA5E4;
	Wed, 14 Oct 2026 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003898; cv=none; b=E/r0P/zTIsmCXLHp7sQCU4ppjX3goDG2HKM/4H+pP7yrgV1FSakUwjp7gkUQT24W6NnW7uoIVPujqvFm5FQlhR0cuv8DGUg0iVTQ3BvnpHotusgMRvk/S6Knn56/HuJ5tc3FIwX+1x5Fgy8TdOFkANxcb99NvgS7vjHZvyM9rQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003898; c=relaxed/simple;
	bh=s/i8RPjRgl4wPrFTH5nImV2yVSNtfDmN232WCrWgTBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBoUjWhGQzZwo8klywMzbmw3+GQqIas21BwFxRHa6nuv7CGHpicjRonoAc7kNaHsyUeqH0AChCWUp67HbFOomCdlDOxD3TFCumdBKkVjtex/0zptj45pSIiULtHdH8d7oUu2xPZ+VeNZhaZYClCFUM8in7FGo8YdLlJRjyekuO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWccwvWx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWccwvWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792003898; x=1823539898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/i8RPjRgl4wPrFTH5nImV2yVSNtfDmN232WCrWgTBQ=;
  b=YWccwvWxaGH3f7mPiSFqjkIQSuOWFx0JQk2oKa3Wi/ejrCdMM0DimkHf
   nJ9Moj+SWrFVXHvtC6m5ykKVOZ8OXaP1eV0Cxk8QYZv02ikl/tkY3V35/
   3008/UC0cqC7Z0VbHTOVclUoYT2P/j8v04n+gXdRLE5XMsBXk0JP3AAlz
   wEyA/oZ/QYXGnBs8BJ6wQ61YLHc0+cCYpkyhNJoQBTp1h0C8AE4n3mPkr
   zo5wivTimIdDeMRyXj7slfv4v8/aQHxhkWDUKgL//SnMdffk50nYqOUe6
   hpJOLf4QwELYU29+ckkCaQCWYpm9WY5OFTUjoowZFcp5rZmube5MW6yMJ
   w==;
X-CSE-ConnectionGUID: 9BCBBmCwT2mxRY3lNUI+Mw==
X-CSE-MsgGUID: cLR35IqBRwuPZlDeErDzxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="650250"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="650250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:51:37 -0700
X-CSE-ConnectionGUID: 0eg66OL7RyamEFcMixabuQ==
X-CSE-MsgGUID: dZRf945+SmqDgyMp7XaU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1522678"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 11:51:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH44Z-00000000F4d-0i0R;
	Wed, 14 Oct 2026 18:51:31 +0000
Date: Thu, 15 Oct 2026 02:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>,
	andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	sarath.ganapathiraju@oss.qualcomm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v11 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Message-ID: <202610150244.4heS16Km-lkp@intel.com>
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
config: powerpc64-randconfig-1000-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150244.4heS16Km-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150244.4heS16Km-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150244.4heS16Km-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/lpass-va-csr.c:61:21: error: called object type 'void *' is not a function or function pointer
      61 |         ret = pm_clk_resume(dev);
         |               ~~~~~~~~~~~~~^
   drivers/clk/qcom/lpass-va-csr.c:77:16: error: called object type 'void *' is not a function or function pointer
      77 |         pm_clk_suspend(dev);
         |         ~~~~~~~~~~~~~~^
   drivers/clk/qcom/lpass-va-csr.c:83:23: error: called object type 'void *' is not a function or function pointer
      83 |         return pm_clk_suspend(dev);
         |                ~~~~~~~~~~~~~~^
   3 errors generated.


vim +61 drivers/clk/qcom/lpass-va-csr.c

    54	
    55	static int lpass_va_csr_runtime_resume(struct device *dev)
    56	{
    57		struct lpass_va_csr *csr = dev_get_drvdata(dev);
    58		const struct lpass_va_csr_data *data = csr->data;
    59		int ret;
    60	
  > 61		ret = pm_clk_resume(dev);
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
