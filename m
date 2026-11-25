Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643863;
	b=Tz4XzWPGee4WMkyTXm8yriUvcwD5XEushVNNuWw+G8CbC8HaLbxJdTt7Vds604mTOFlZ
	 ddbl+bSGPEM3KnrQOrkpsssT3MlqZQc8MdQWSiMBxCR7ohwnBYIJ9T/lq3BrqMwgyeCpW
	 h0DDRaHolbU4VU+aQOWZ/MspFZ6GQ2GnP1S95ujwX7EC76i8Wl8cYfYEiqfkovwfmFVAJ
	 T32iPmvsA1Od3tfSw0BxvMQ+nWaiSEWc6zdwLsFbhszIom3Sr/5jg5kE6s7iz1qnQ5Fuu
	 3yXfVFFm4S8cMHqL77x4ay0jMmvWXk3p/hd3QL1l40g4LnH3081Nc6Sx/wyBt0D2UEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643863;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fQSJlq2AB9gSSiRXHYp7CIMNPJd6C/z8QNb96gGU/Io=;
	b=rV1Vag7PD/Mt7qMkBieB/nksmd/rUg1WzCS1vBwslYcovJQAV7Q6pfEgHtzN4U+Hwk+P
	 eb2/SnOyIsMPoHPgBjyEQO/cIjs7CmcREOnYrUcRWccv9oVlJDZ9IwMuU3pbMCJ4V2XLA
	 NFh/d14f01TZCBX9Rr0CUstk7qmqAZCXpx0iGOUpYo7n2QcC2K4AvUiaCWwLCEzLmREWq
	 +onEW+vt+E++FfBWpVARFH9VGt4n9OBpp8a18g9GNIWdGSM4oLKWy7eKF8qkDyHMqdVke
	 7rqP64ZZBbFJpX+w0uCjFDaeM2ibLvkUVpKG36JmO8Obgk3DxC9fLRfXUKLtJHPWtyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dvWh1JfU;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AF606A321;
	Wed, 25 Nov 2026 21:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114AF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dvWh1JfU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795643862; x=1827179862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pZh7FPy1aRkXInOd3Z/lqy51P/H4KfXJDCzy5vYW68Y=;
  b=dvWh1JfUPT3iCHVmrASvgn4ZpXZk16048LVbpXkJg6pMZ/Q88TCOpvVp
   99psw2SvAAPgszw3xqe4zFDgKNX3wdrUaiQutwnhDMwKDqkgGmKCXoAjq
   GCQr4/x1hrj5JnT3LYH+EoVpqcTZ4r7q9RaDeW19D+knSn4wBAUZ8ll+O
   GzzpC0l2bHYTTi/m8LAUVSfsR9DGSVy+mzw8W2Du5BKgOs1PAo/CTiK3J
   Ls+WyrockeVN13pOSMpjWkKHLowvBimkWrdum4osMQgSQ9sCsG8/NlDIm
   gz8OkIPmnB0sdReyB+Vp/2sv/INX8WRr6E/HUqYFFxYDWVKV1GiDyC4pN
   A==;
X-CSE-ConnectionGUID: Wg2/JX6AQNicn62bB38vpg==
X-CSE-MsgGUID: 7tmkhYjsQ3uu9jg74MV95g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4446498"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4446498"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:57:42 -0800
X-CSE-ConnectionGUID: HkRkHbzMTgG06ER/z44mbw==
X-CSE-MsgGUID: s2DEfbL2R6S8bPeeGAfkTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12569558"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2026 13:57:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWKze-00000001Sji-1nMK;
	Wed, 25 Nov 2026 21:57:34 +0000
Date: Thu, 26 Nov 2026 05:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: Re: [PATCH v4 3/7] media: i2c: add s5k5e8 image sensor driver
Message-ID: <20261126053002.F2AZOt2m-lkp@intel.com>
References: <20261125123146.379057-4-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125123146.379057-4-hikmahgumelar@gmail.com>

Hi Hikmah,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261124]
[cannot apply to robh/for-next linuxtv-media-pending/master media-tree/master linus/master v7.4-rc4 v7.4-rc3 v7.4-rc2 v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hikmah-Gumelar/clk-qcom-gcc-msm8953-fix-csi_phytimer_clk_src-100MHz-parent/20261125-193140
base:   next-20261124
patch link:    https://lore.kernel.org/r/20261125123146.379057-4-hikmahgumelar%40gmail.com
patch subject: [PATCH v4 3/7] media: i2c: add s5k5e8 image sensor driver
config: hexagon-randconfig-1000-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126053002.F2AZOt2m-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126053002.F2AZOt2m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126053002.F2AZOt2m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/st-mipid02.c:847:19: error: call to undeclared function 'devm_cci_regmap_init_i2c'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     847 |         bridge->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                          ^
>> drivers/media/i2c/st-mipid02.c:847:17: error: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
     847 |         bridge->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/media/i2c/thp7312.c:2097:20: error: call to undeclared function 'devm_cci_regmap_init_i2c'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2097 |         thp7312->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                           ^
>> drivers/media/i2c/thp7312.c:2097:18: error: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
    2097 |         thp7312->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_cci_regmap_init_i2c +847 drivers/media/i2c/st-mipid02.c

642bb5e88fed89e Mickael Guene 2019-04-09  803  
642bb5e88fed89e Mickael Guene 2019-04-09  804  static int mipid02_probe(struct i2c_client *client)
642bb5e88fed89e Mickael Guene 2019-04-09  805  {
642bb5e88fed89e Mickael Guene 2019-04-09  806  	struct device *dev = &client->dev;
642bb5e88fed89e Mickael Guene 2019-04-09  807  	struct mipid02_dev *bridge;
642bb5e88fed89e Mickael Guene 2019-04-09  808  	u32 clk_freq;
642bb5e88fed89e Mickael Guene 2019-04-09  809  	int ret;
642bb5e88fed89e Mickael Guene 2019-04-09  810  
4dd10fbbeb9c337 Kees Cook     2026-10-28  811  	bridge = devm_kzalloc_obj(dev, *bridge);
642bb5e88fed89e Mickael Guene 2019-04-09  812  	if (!bridge)
642bb5e88fed89e Mickael Guene 2019-04-09  813  		return -ENOMEM;
642bb5e88fed89e Mickael Guene 2019-04-09  814  
642bb5e88fed89e Mickael Guene 2019-04-09  815  	bridge->i2c_client = client;
642bb5e88fed89e Mickael Guene 2019-04-09  816  	v4l2_i2c_subdev_init(&bridge->sd, client, &mipid02_subdev_ops);
642bb5e88fed89e Mickael Guene 2019-04-09  817  
642bb5e88fed89e Mickael Guene 2019-04-09  818  	/* got and check clock */
642bb5e88fed89e Mickael Guene 2019-04-09  819  	bridge->xclk = devm_clk_get(dev, "xclk");
642bb5e88fed89e Mickael Guene 2019-04-09  820  	if (IS_ERR(bridge->xclk)) {
642bb5e88fed89e Mickael Guene 2019-04-09  821  		dev_err(dev, "failed to get xclk\n");
642bb5e88fed89e Mickael Guene 2019-04-09  822  		return PTR_ERR(bridge->xclk);
642bb5e88fed89e Mickael Guene 2019-04-09  823  	}
642bb5e88fed89e Mickael Guene 2019-04-09  824  
642bb5e88fed89e Mickael Guene 2019-04-09  825  	clk_freq = clk_get_rate(bridge->xclk);
642bb5e88fed89e Mickael Guene 2019-04-09  826  	if (clk_freq < 6000000 || clk_freq > 27000000) {
642bb5e88fed89e Mickael Guene 2019-04-09  827  		dev_err(dev, "xclk freq must be in 6-27 Mhz range. got %d Hz\n",
642bb5e88fed89e Mickael Guene 2019-04-09  828  			clk_freq);
642bb5e88fed89e Mickael Guene 2019-04-09  829  		return -EINVAL;
642bb5e88fed89e Mickael Guene 2019-04-09  830  	}
642bb5e88fed89e Mickael Guene 2019-04-09  831  
642bb5e88fed89e Mickael Guene 2019-04-09  832  	bridge->reset_gpio = devm_gpiod_get_optional(dev, "reset",
642bb5e88fed89e Mickael Guene 2019-04-09  833  						     GPIOD_OUT_HIGH);
642bb5e88fed89e Mickael Guene 2019-04-09  834  
61c03b631b74a38 Chuhong Yuan  2019-10-17  835  	if (IS_ERR(bridge->reset_gpio)) {
61c03b631b74a38 Chuhong Yuan  2019-10-17  836  		dev_err(dev, "failed to get reset GPIO\n");
61c03b631b74a38 Chuhong Yuan  2019-10-17  837  		return PTR_ERR(bridge->reset_gpio);
61c03b631b74a38 Chuhong Yuan  2019-10-17  838  	}
61c03b631b74a38 Chuhong Yuan  2019-10-17  839  
642bb5e88fed89e Mickael Guene 2019-04-09  840  	ret = mipid02_get_regulators(bridge);
642bb5e88fed89e Mickael Guene 2019-04-09  841  	if (ret) {
642bb5e88fed89e Mickael Guene 2019-04-09  842  		dev_err(dev, "failed to get regulators %d", ret);
642bb5e88fed89e Mickael Guene 2019-04-09  843  		return ret;
642bb5e88fed89e Mickael Guene 2019-04-09  844  	}
642bb5e88fed89e Mickael Guene 2019-04-09  845  
6223dafa3c9111d Alain Volmat  2023-11-25  846  	/* Initialise the regmap for further cci access */
6223dafa3c9111d Alain Volmat  2023-11-25 @847  	bridge->regmap = devm_cci_regmap_init_i2c(client, 16);
6223dafa3c9111d Alain Volmat  2023-11-25  848  	if (IS_ERR(bridge->regmap))
6223dafa3c9111d Alain Volmat  2023-11-25  849  		return dev_err_probe(dev, PTR_ERR(bridge->regmap),
6223dafa3c9111d Alain Volmat  2023-11-25  850  				     "failed to get cci regmap\n");
6223dafa3c9111d Alain Volmat  2023-11-25  851  
642bb5e88fed89e Mickael Guene 2019-04-09  852  	bridge->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
642bb5e88fed89e Mickael Guene 2019-04-09  853  	bridge->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
04d170b288b3404 Alain Volmat  2023-11-25  854  	bridge->sd.internal_ops = &mipid02_subdev_internal_ops;
642bb5e88fed89e Mickael Guene 2019-04-09  855  	bridge->sd.entity.ops = &mipid02_subdev_entity_ops;
642bb5e88fed89e Mickael Guene 2019-04-09  856  	bridge->pad[0].flags = MEDIA_PAD_FL_SINK;
642bb5e88fed89e Mickael Guene 2019-04-09  857  	bridge->pad[1].flags = MEDIA_PAD_FL_SINK;
642bb5e88fed89e Mickael Guene 2019-04-09  858  	bridge->pad[2].flags = MEDIA_PAD_FL_SOURCE;
642bb5e88fed89e Mickael Guene 2019-04-09  859  	ret = media_entity_pads_init(&bridge->sd.entity, MIPID02_PAD_NB,
642bb5e88fed89e Mickael Guene 2019-04-09  860  				     bridge->pad);
642bb5e88fed89e Mickael Guene 2019-04-09  861  	if (ret) {
642bb5e88fed89e Mickael Guene 2019-04-09  862  		dev_err(&client->dev, "pads init failed %d", ret);
04d170b288b3404 Alain Volmat  2023-11-25  863  		return ret;
04d170b288b3404 Alain Volmat  2023-11-25  864  	}
04d170b288b3404 Alain Volmat  2023-11-25  865  
04d170b288b3404 Alain Volmat  2023-11-25  866  	ret = v4l2_subdev_init_finalize(&bridge->sd);
04d170b288b3404 Alain Volmat  2023-11-25  867  	if (ret < 0) {
04d170b288b3404 Alain Volmat  2023-11-25  868  		dev_err(dev, "subdev init error: %d\n", ret);
04d170b288b3404 Alain Volmat  2023-11-25  869  		goto entity_cleanup;
642bb5e88fed89e Mickael Guene 2019-04-09  870  	}
642bb5e88fed89e Mickael Guene 2019-04-09  871  
642bb5e88fed89e Mickael Guene 2019-04-09  872  	/* enable clock, power and reset device if available */
a74e17ca6443260 Alain Volmat  2024-10-08  873  	ret = mipid02_set_power_on(&client->dev);
642bb5e88fed89e Mickael Guene 2019-04-09  874  	if (ret)
642bb5e88fed89e Mickael Guene 2019-04-09  875  		goto entity_cleanup;
642bb5e88fed89e Mickael Guene 2019-04-09  876  
642bb5e88fed89e Mickael Guene 2019-04-09  877  	ret = mipid02_detect(bridge);
642bb5e88fed89e Mickael Guene 2019-04-09  878  	if (ret) {
642bb5e88fed89e Mickael Guene 2019-04-09  879  		dev_err(&client->dev, "failed to detect mipid02 %d", ret);
642bb5e88fed89e Mickael Guene 2019-04-09  880  		goto power_off;
642bb5e88fed89e Mickael Guene 2019-04-09  881  	}
642bb5e88fed89e Mickael Guene 2019-04-09  882  
642bb5e88fed89e Mickael Guene 2019-04-09  883  	ret = mipid02_parse_tx_ep(bridge);
642bb5e88fed89e Mickael Guene 2019-04-09  884  	if (ret) {
642bb5e88fed89e Mickael Guene 2019-04-09  885  		dev_err(&client->dev, "failed to parse tx %d", ret);
642bb5e88fed89e Mickael Guene 2019-04-09  886  		goto power_off;
642bb5e88fed89e Mickael Guene 2019-04-09  887  	}
642bb5e88fed89e Mickael Guene 2019-04-09  888  
642bb5e88fed89e Mickael Guene 2019-04-09  889  	ret = mipid02_parse_rx_ep(bridge);
642bb5e88fed89e Mickael Guene 2019-04-09  890  	if (ret) {
642bb5e88fed89e Mickael Guene 2019-04-09  891  		dev_err(&client->dev, "failed to parse rx %d", ret);
642bb5e88fed89e Mickael Guene 2019-04-09  892  		goto power_off;
642bb5e88fed89e Mickael Guene 2019-04-09  893  	}
642bb5e88fed89e Mickael Guene 2019-04-09  894  
a74e17ca6443260 Alain Volmat  2024-10-08  895  	/* Enable runtime PM and turn off the device */
a74e17ca6443260 Alain Volmat  2024-10-08  896  	pm_runtime_set_active(dev);
a74e17ca6443260 Alain Volmat  2024-10-08  897  	pm_runtime_get_noresume(&client->dev);
a74e17ca6443260 Alain Volmat  2024-10-08  898  	pm_runtime_enable(dev);
a74e17ca6443260 Alain Volmat  2024-10-08  899  
a74e17ca6443260 Alain Volmat  2024-10-08  900  	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
a74e17ca6443260 Alain Volmat  2024-10-08  901  	pm_runtime_use_autosuspend(&client->dev);
a74e17ca6443260 Alain Volmat  2024-10-08  902  	pm_runtime_put_autosuspend(&client->dev);
a74e17ca6443260 Alain Volmat  2024-10-08  903  
642bb5e88fed89e Mickael Guene 2019-04-09  904  	ret = v4l2_async_register_subdev(&bridge->sd);
642bb5e88fed89e Mickael Guene 2019-04-09  905  	if (ret < 0) {
642bb5e88fed89e Mickael Guene 2019-04-09  906  		dev_err(&client->dev, "v4l2_async_register_subdev failed %d",
642bb5e88fed89e Mickael Guene 2019-04-09  907  			    ret);
642bb5e88fed89e Mickael Guene 2019-04-09  908  		goto unregister_notifier;
642bb5e88fed89e Mickael Guene 2019-04-09  909  	}
642bb5e88fed89e Mickael Guene 2019-04-09  910  
642bb5e88fed89e Mickael Guene 2019-04-09  911  	dev_info(&client->dev, "mipid02 device probe successfully");
642bb5e88fed89e Mickael Guene 2019-04-09  912  
642bb5e88fed89e Mickael Guene 2019-04-09  913  	return 0;
642bb5e88fed89e Mickael Guene 2019-04-09  914  
642bb5e88fed89e Mickael Guene 2019-04-09  915  unregister_notifier:
3c8c153914812a9 Sakari Ailus  2021-03-05  916  	v4l2_async_nf_unregister(&bridge->notifier);
3c8c153914812a9 Sakari Ailus  2021-03-05  917  	v4l2_async_nf_cleanup(&bridge->notifier);
a74e17ca6443260 Alain Volmat  2024-10-08  918  	pm_runtime_disable(&client->dev);
a74e17ca6443260 Alain Volmat  2024-10-08  919  	pm_runtime_set_suspended(&client->dev);
642bb5e88fed89e Mickael Guene 2019-04-09  920  power_off:
a74e17ca6443260 Alain Volmat  2024-10-08  921  	mipid02_set_power_off(&client->dev);
642bb5e88fed89e Mickael Guene 2019-04-09  922  entity_cleanup:
642bb5e88fed89e Mickael Guene 2019-04-09  923  	media_entity_cleanup(&bridge->sd.entity);
642bb5e88fed89e Mickael Guene 2019-04-09  924  
642bb5e88fed89e Mickael Guene 2019-04-09  925  	return ret;
642bb5e88fed89e Mickael Guene 2019-04-09  926  }
642bb5e88fed89e Mickael Guene 2019-04-09  927  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
