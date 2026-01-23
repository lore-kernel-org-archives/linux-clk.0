Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48832741AB;
	Fri, 23 Jan 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168520; cv=none; b=sLS7l9tAS5ejiJvSvlqzEKr1b12yITBPtZGxgjgpoWSuTOAc0kp9wYVR/s1BRbKGwNLz+r4k4tOMQQKXnLPfjAoB85AIzxiGrg85QzaPPU5yOyApnHOgMlP2FV7474YWcWVOGvTDUiAPLu1gLLJYBKUlh9LzjKndbVHrP66/fcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168520; c=relaxed/simple;
	bh=V4Mf94EcyIDXzX94gvCBbKbFzNKoA9nJp5TA6mm7760=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJpEs4YuFaS0BJGIxDEvRB8PSPp6mrb3EvgdpLr2aazbV9guzk2m7fpY8g4gHRyg7E+LGPIvaGcfMAosU5p6ENyebmMYjVyIA41hljH12R7Cw77/esvarylRHSi0MmDhgXbt8RupGVPVtaGG1JTTto4x8l3VQ2Toen3nJyC7g8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hD/o+oIW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hD/o+oIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769168519; x=1800704519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V4Mf94EcyIDXzX94gvCBbKbFzNKoA9nJp5TA6mm7760=;
  b=hD/o+oIWEnXcTH+JgQzNqvNShvGI30jRUrmGDPxDINFaOSHFwsGVeAKS
   m+8WS9Yb68i1uSABYfLSNrNt+wyB1o5/TXSZcPrYUkMP2gmabW2SZLXlL
   SKLeJr3V8eIGQ6b0r+tiJ8EydYEto/XjFUWTj7gedAuStgcBtIP6l+dF9
   5XKP9dydGXkMdkteQDLWytikBTU0zA8MQ4aQLoA0JL5kGcZHDG72i+gmI
   101R5g7BZ24QiN2bhZuN1+8GrxkR4k3xdwQpzFpS5qAodl1YlKDO5dkwy
   h87CrF6O0RvIp7MzP+u59zjRXGk6tOLIpwq6wtz8guZWBaYz+oPLG5jPc
   Q==;
X-CSE-ConnectionGUID: e7PbWnynTs2S0kYkKfMZAA==
X-CSE-MsgGUID: f7lp4HQ4RMucuP/ES1X91A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70481953"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70481953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:41:58 -0800
X-CSE-ConnectionGUID: HfX8Xg9RSGi7be1Lr3RVNg==
X-CSE-MsgGUID: /0HznFOTRbCyDXyBJf4gng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211130239"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2026 03:41:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjFXy-00000000Tty-0dUd;
	Fri, 23 Jan 2026 11:41:50 +0000
Date: Fri, 23 Jan 2026 19:41:30 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v2 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <202601231918.PQTTcbRG-lkp@intel.com>
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
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260123/202601231918.PQTTcbRG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231918.PQTTcbRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231918.PQTTcbRG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/tenstorrent/atlantis-ccu.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/clk/tenstorrent/atlantis-ccu.c:832:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     832 |         kfree(to_atlantis_ccu_adev(adev));
         |         ^
>> drivers/clk/tenstorrent/atlantis-ccu.c:852:10: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     852 |         cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
         |                 ^
>> drivers/clk/tenstorrent/atlantis-ccu.c:852:8: error: incompatible integer to pointer conversion assigning to 'struct atlantis_ccu_adev *' from 'int' [-Wint-conversion]
     852 |         cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:877:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     877 |         kfree(cadev);
         |         ^
   1 warning and 4 errors generated.


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
