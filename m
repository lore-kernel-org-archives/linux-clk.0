Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83D34FF5B;
	Fri, 23 Jan 2026 07:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769151895; cv=none; b=TlSrzvJnu8wGfYRQxCFGubKYjapD1ATVrnk/EQt3sgF5na04o/Z6hzBpsPsdTQ/Yl2cKUIVQfZbWTQ+kWiNp0wCl+wD/EZ0SK9R5ax+F9KwnOeYrpmyMPNPQIrbxb0LwFIZQFthAVS+pJula9tw33w434Sny6UyHcqVX1EbUW6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769151895; c=relaxed/simple;
	bh=GmuuJ/Cvslff5ZuKmPfah+mae6v3I0Ocxmn9Mpws1Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/gRK0Y+2QcT3aeVHDTx0cGtq3kDpDv7Pbuoe1ihMDiYiLXqveND8aC24iIVGAVIovdX4VygUX5uwcNFAqU9zxuiWCLdqhosuj1F8VhpCm9Xfgxd0nAgxDCe/5nSsAi05BpWhl2gA/I75r6ShFHOM5JroQPJvm6NcO9iFs7f0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeZoA2Xz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeZoA2Xz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769151891; x=1800687891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GmuuJ/Cvslff5ZuKmPfah+mae6v3I0Ocxmn9Mpws1Qw=;
  b=QeZoA2XzT4gQDPtARavbFGIYXx35nJNI0HF2GctC5UvH7pvtFfHWERTz
   j4GfgDICCxHJo+gq0SWthp303tKI+hkFTEZuLkRILW2W50PNqdaQUUrWh
   d0FytWbRc46n1Pu/aM9NOlb3eJIgyaQHtnfsdzK1YEcaEx30bxYqvcfcV
   4kMEORxkm//rY3n87oQ1YGcMxHXBIHE7YksUvwdzJv6i/UL+3gJDXhHVQ
   BfHdhRQNHGw8S+UkgHRk5J6LFRSk3KIP3ch391LrylYZozAg0grfGXD3H
   e/BZefpW7DuhcvWf2ibWKHpjf/zrW8Ojke1/GcJRSU2gjF+9swpvlho1i
   w==;
X-CSE-ConnectionGUID: DzF/A/umSNq9sAj3GHfgQQ==
X-CSE-MsgGUID: a4LzkF9lTNi1HG5pdNThvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74034304"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="74034304"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 23:04:42 -0800
X-CSE-ConnectionGUID: GYRlra5nRZyY6FyBGLASbQ==
X-CSE-MsgGUID: QDxjfPAzTkad+3BbclmPvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211954459"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jan 2026 23:04:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjBDe-00000000TcY-3HmG;
	Fri, 23 Jan 2026 07:04:34 +0000
Date: Fri, 23 Jan 2026 15:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org,
	mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v2 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <202601231402.YbzFbWJb-lkp@intel.com>
References: <20260122-atlantis-clocks-v2-3-c66371639e66@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-atlantis-clocks-v2-3-c66371639e66@oss.tenstorrent.com>

Hi Anirudh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Srinivasan/dt-bindings-soc-tenstorrent-Add-tenstorrent-atlantis-syscon/20260123-064135
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260122-atlantis-clocks-v2-3-c66371639e66%40oss.tenstorrent.com
patch subject: [PATCH v2 3/3] clk: tenstorrent: Add Atlantis clock controller driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260123/202601231402.YbzFbWJb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231402.YbzFbWJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231402.YbzFbWJb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/tenstorrent/atlantis-ccu.c: In function 'atlantis_cadev_release':
>> drivers/clk/tenstorrent/atlantis-ccu.c:832:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     832 |         kfree(to_atlantis_ccu_adev(adev));
         |         ^~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c: In function 'atlantis_ccu_adev_register':
>> drivers/clk/tenstorrent/atlantis-ccu.c:852:17: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     852 |         cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
         |                 ^~~~~~~
>> drivers/clk/tenstorrent/atlantis-ccu.c:852:15: error: assignment to 'struct atlantis_ccu_adev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     852 |         cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
         |               ^


vim +/kfree +832 drivers/clk/tenstorrent/atlantis-ccu.c

   827	
   828	static void atlantis_cadev_release(struct device *dev)
   829	{
   830		struct auxiliary_device *adev = to_auxiliary_dev(dev);
   831	
 > 832		kfree(to_atlantis_ccu_adev(adev));
   833	}
   834	
   835	static void atlantis_adev_unregister(void *data)
   836	{
   837		struct auxiliary_device *adev = data;
   838	
   839		auxiliary_device_delete(adev);
   840		auxiliary_device_uninit(adev);
   841	}
   842	
   843	static int atlantis_ccu_adev_register(struct device *dev,
   844					      struct atlantis_ccu *ccu,
   845					      const struct atlantis_ccu_data *data,
   846					      const char *adev_name)
   847	{
   848		struct atlantis_ccu_adev *cadev;
   849		struct auxiliary_device *adev;
   850		int ret;
   851	
 > 852		cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
   853		if (!cadev)
   854			return -ENOMEM;
   855	
   856		cadev->regmap = ccu->regmap;
   857	
   858		adev = &cadev->adev;
   859		adev->name = adev_name;
   860		adev->dev.parent = dev;
   861		adev->dev.release = atlantis_cadev_release;
   862		adev->dev.of_node = dev->of_node;
   863	
   864		ret = auxiliary_device_init(adev);
   865		if (ret)
   866			goto err_free_cadev;
   867	
   868		ret = auxiliary_device_add(adev);
   869		if (ret) {
   870			auxiliary_device_uninit(adev);
   871			return ret;
   872		}
   873	
   874		return devm_add_action_or_reset(dev, atlantis_adev_unregister, adev);
   875	
   876	err_free_cadev:
   877		kfree(cadev);
   878	
   879		return ret;
   880	}
   881	static int atlantis_ccu_probe(struct platform_device *pdev)
   882	{
   883		const struct atlantis_ccu_data *data;
   884		struct device *dev = &pdev->dev;
   885		int ret;
   886	
   887		struct atlantis_ccu *ccu = devm_kzalloc(dev, sizeof(*ccu), GFP_KERNEL);
   888	
   889		if (!ccu)
   890			return -ENOMEM;
   891	
   892		ccu->dev = dev;
   893	
   894		ccu->base = devm_platform_ioremap_resource(pdev, 0);
   895		if (IS_ERR(ccu->base))
   896			return dev_err_probe(dev, PTR_ERR(ccu->base),
   897					     "Failed to map registers\n");
   898	
   899		ccu->regmap = devm_regmap_init_mmio(dev, ccu->base,
   900						    &atlantis_ccu_regmap_config);
   901		if (IS_ERR(ccu->regmap))
   902			return dev_err_probe(dev, PTR_ERR(ccu->regmap),
   903					     "Failed to init regmap\n");
   904	
   905		data = of_device_get_match_data(dev);
   906	
   907		ret = atlantis_ccu_clocks_register(dev, ccu, data);
   908		if (ret)
   909			return dev_err_probe(dev, ret, "failed to register clocks\n");
   910	
   911		ret = atlantis_ccu_adev_register(dev, ccu, data, data->reset_name);
   912		if (ret)
   913			return dev_err_probe(dev, ret, "failed to register resets\n");
   914	
   915		return 0;
   916	}
   917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
