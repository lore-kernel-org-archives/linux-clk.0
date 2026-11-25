Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641399;
	b=HiT9nOpF3btdbLPASCqREFTyhuwIlGkbFiNxQow5qWkhXZAZuQUEqGl0oXrEDme4OshQ
	 aS91AE+OOUfGuO9rVbadrFMfudvncRpZli+jEEdtMjFkGvR6S0MaHgaqAuh0IVwCUDSNI
	 OEtwhFVA8BLFpDlifbRU0jevEg5vQQTAbCKNFjaffmh1BB0aB0J+CpJ0lIlAnTle3IV0x
	 Skn/1b5zxkjYFknyYYk4yuc6Bj5p8+gs/NN+o5TCUVPE+eH5H4JBdc+V+S0n6LnwscDmT
	 /0a5J3MCx8H7+WUP+XSCCzHooZnkUT7GhCTVX7j6url2v+82jXTIsK6xbn2k8ZdW/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641399;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ER0yHM5O5GqEO5chNXvtZnc3KsEHdcqrL05ZLV075RI=;
	b=XeTtNEq7AS0odCTmEoQmw9eiSdV/UiievZFcGu5E4zBzjlX+hlbf9rb4Cy37BIS+nF5g
	 +eTiucK3POFTZk6Y2EFoj1TH1ULD10jw/FHVzhxEfgVNCgcbK1l9hxNunFmMI/SaQtBKl
	 /scTxW5uWIGbBihT17wl5dJAyc/AiTDbYdaNEWyNiYXZSSOboW3EMeYtpHGsPyk4YcjFG
	 vxrnwNdUJ3GYfjKH2VvJJNAvscajS2dth8x35/RzM9+qn1/tjQAwxGUEv3kNdf9IY1svp
	 VkjxT55TJRN0PM2220VkSrsTP/HqGgtKL7vCttTyvBi486HUrL25dd6okTRo8Znf/mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CC7jnVMz;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5D606A323;
	Wed, 25 Nov 2026 21:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A5D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CC7jnVMz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795641399; x=1827177399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aJsn4yhVh63zpfNygBfk8wAhAtcIyT5bj7Sk7IhYui8=;
  b=CC7jnVMzIA4mGtnRQzTA8i2Mj52Uw3CUUDAdkW2sAwXTvCYlS20GTY2a
   lIh3fglfT69QaHDi8S/Zx+kSrqVRI0g9Hy+gZPKKYLCULxvKo7nQeZc+r
   LQ7aR7/HO+DQ7YQnrqy5Qp4XoOE9WYe3X6tTjXF7Rb9uGoe21hGy7sng6
   vYz3eU4ZpQXwTwYimdzYLhvOcm3ee6KU4hEBQ2XgVQmdh2Ph6NLjMQ92J
   RxrgbVbMj8dxN/BtpStOxygDKq/Cx1lXIlsehoofan/JS/xugROWheWXn
   2+JM3iakQZ2RPMto3M4LubTmO0sdob/qWFvpHN7WCgHmCUynMFO/3XG5S
   Q==;
X-CSE-ConnectionGUID: pMhya9g5Qia7sONHE1zpmg==
X-CSE-MsgGUID: YVCDh0UCTbat7/Be+/k7yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4550177"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4550177"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:16:38 -0800
X-CSE-ConnectionGUID: 6C8URDGxSZ+kOjUe4+NxQg==
X-CSE-MsgGUID: dzmsQjFMRCSGcaAoL2QwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11997210"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2026 13:16:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWKLv-00000001SeY-2IWO;
	Wed, 25 Nov 2026 21:16:31 +0000
Date: Thu, 26 Nov 2026 05:16:07 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: Re: [PATCH v4 3/7] media: i2c: add s5k5e8 image sensor driver
Message-ID: <20261126050920.4VswFHsj-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261126/20261126050920.4VswFHsj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126050920.4VswFHsj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126050920.4VswFHsj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/imx219.c: In function 'imx219_probe':
>> drivers/media/i2c/imx219.c:1209:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c' [-Wimplicit-function-declaration]
    1209 |         imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/imx219.c:1209:24: error: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1209 |         imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                        ^
--
   drivers/media/i2c/imx412.c: In function 'imx412_probe':
>> drivers/media/i2c/imx412.c:995:23: error: implicit declaration of function 'devm_cci_regmap_init_i2c' [-Wimplicit-function-declaration]
     995 |         imx412->cci = devm_cci_regmap_init_i2c(client, 16);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/imx412.c:995:21: error: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     995 |         imx412->cci = devm_cci_regmap_init_i2c(client, 16);
         |                     ^
--
   drivers/media/i2c/s5kjn1.c: In function 's5kjn1_probe':
>> drivers/media/i2c/s5kjn1.c:1305:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c' [-Wimplicit-function-declaration]
    1305 |         s5kjn1->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/s5kjn1.c:1305:24: error: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1305 |         s5kjn1->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                        ^


vim +/devm_cci_regmap_init_i2c +1209 drivers/media/i2c/imx219.c

1283b3b8f82b90 Dave Stevenson   2020-01-20  1191  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1192  static int imx219_probe(struct i2c_client *client)
1283b3b8f82b90 Dave Stevenson   2020-01-20  1193  {
1283b3b8f82b90 Dave Stevenson   2020-01-20  1194  	struct device *dev = &client->dev;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1195  	struct imx219 *imx219;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1196  	int ret;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1197  
4dd10fbbeb9c33 Kees Cook        2026-10-28  1198  	imx219 = devm_kzalloc_obj(&client->dev, *imx219);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1199  	if (!imx219)
1283b3b8f82b90 Dave Stevenson   2020-01-20  1200  		return -ENOMEM;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1201  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1202  	v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
5755be5f15d9e6 Laurent Pinchart 2023-11-27  1203  	imx219->sd.internal_ops = &imx219_internal_ops;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1204  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1205  	/* Check the hardware configuration in device tree */
ceddfd4493b334 Adam Ford        2022-12-20  1206  	if (imx219_check_hwcfg(dev, imx219))
1283b3b8f82b90 Dave Stevenson   2020-01-20  1207  		return -EINVAL;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1208  
852798cc8a4536 Laurent Pinchart 2023-09-24 @1209  	imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
03479d5673138b Umang Jain       2024-03-20  1210  	if (IS_ERR(imx219->regmap))
03479d5673138b Umang Jain       2024-03-20  1211  		return dev_err_probe(dev, PTR_ERR(imx219->regmap),
03479d5673138b Umang Jain       2024-03-20  1212  				     "failed to initialize CCI\n");
852798cc8a4536 Laurent Pinchart 2023-09-24  1213  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1214  	/* Get system clock (xclk) */
33cce53627a5e0 Mehdi Djait      2025-06-26  1215  	imx219->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
03479d5673138b Umang Jain       2024-03-20  1216  	if (IS_ERR(imx219->xclk))
03479d5673138b Umang Jain       2024-03-20  1217  		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
03479d5673138b Umang Jain       2024-03-20  1218  				     "failed to get xclk\n");
1283b3b8f82b90 Dave Stevenson   2020-01-20  1219  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1220  	imx219->xclk_freq = clk_get_rate(imx219->xclk);
03479d5673138b Umang Jain       2024-03-20  1221  	if (imx219->xclk_freq != IMX219_XCLK_FREQ)
03479d5673138b Umang Jain       2024-03-20  1222  		return dev_err_probe(dev, -EINVAL,
03479d5673138b Umang Jain       2024-03-20  1223  				     "xclk frequency not supported: %d Hz\n",
1283b3b8f82b90 Dave Stevenson   2020-01-20  1224  				     imx219->xclk_freq);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1225  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1226  	ret = imx219_get_regulators(imx219);
03479d5673138b Umang Jain       2024-03-20  1227  	if (ret)
03479d5673138b Umang Jain       2024-03-20  1228  		return dev_err_probe(dev, ret, "failed to get regulators\n");
1283b3b8f82b90 Dave Stevenson   2020-01-20  1229  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1230  	/* Request optional enable pin */
1283b3b8f82b90 Dave Stevenson   2020-01-20  1231  	imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
1283b3b8f82b90 Dave Stevenson   2020-01-20  1232  						     GPIOD_OUT_HIGH);
943b1f27a3eead Chen Ni          2026-02-04  1233  	if (IS_ERR(imx219->reset_gpio))
943b1f27a3eead Chen Ni          2026-02-04  1234  		return dev_err_probe(dev, PTR_ERR(imx219->reset_gpio),
943b1f27a3eead Chen Ni          2026-02-04  1235  				     "failed to get reset gpio\n");
1283b3b8f82b90 Dave Stevenson   2020-01-20  1236  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1237  	/*
1283b3b8f82b90 Dave Stevenson   2020-01-20  1238  	 * The sensor must be powered for imx219_identify_module()
1283b3b8f82b90 Dave Stevenson   2020-01-20  1239  	 * to be able to read the CHIP_ID register
1283b3b8f82b90 Dave Stevenson   2020-01-20  1240  	 */
1283b3b8f82b90 Dave Stevenson   2020-01-20  1241  	ret = imx219_power_on(dev);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1242  	if (ret)
1283b3b8f82b90 Dave Stevenson   2020-01-20  1243  		return ret;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1244  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1245  	ret = imx219_identify_module(imx219);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1246  	if (ret)
1283b3b8f82b90 Dave Stevenson   2020-01-20  1247  		goto error_power_off;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1248  
e3e5d172d5fce9 Laurent Pinchart 2023-09-24  1249  	/*
e3e5d172d5fce9 Laurent Pinchart 2023-09-24  1250  	 * Sensor doesn't enter LP-11 state upon power up until and unless
ca45448a56659c Lad Prabhakar    2020-03-10  1251  	 * streaming is started, so upon power up switch the modes to:
ca45448a56659c Lad Prabhakar    2020-03-10  1252  	 * streaming -> standby
ca45448a56659c Lad Prabhakar    2020-03-10  1253  	 */
852798cc8a4536 Laurent Pinchart 2023-09-24  1254  	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
852798cc8a4536 Laurent Pinchart 2023-09-24  1255  			IMX219_MODE_STREAMING, NULL);
ca45448a56659c Lad Prabhakar    2020-03-10  1256  	if (ret < 0)
ca45448a56659c Lad Prabhakar    2020-03-10  1257  		goto error_power_off;
852798cc8a4536 Laurent Pinchart 2023-09-24  1258  
ca45448a56659c Lad Prabhakar    2020-03-10  1259  	usleep_range(100, 110);
ca45448a56659c Lad Prabhakar    2020-03-10  1260  
ca45448a56659c Lad Prabhakar    2020-03-10  1261  	/* put sensor back to standby mode */
852798cc8a4536 Laurent Pinchart 2023-09-24  1262  	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
852798cc8a4536 Laurent Pinchart 2023-09-24  1263  			IMX219_MODE_STANDBY, NULL);
ca45448a56659c Lad Prabhakar    2020-03-10  1264  	if (ret < 0)
ca45448a56659c Lad Prabhakar    2020-03-10  1265  		goto error_power_off;
852798cc8a4536 Laurent Pinchart 2023-09-24  1266  
ca45448a56659c Lad Prabhakar    2020-03-10  1267  	usleep_range(100, 110);
ca45448a56659c Lad Prabhakar    2020-03-10  1268  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1269  	ret = imx219_init_controls(imx219);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1270  	if (ret)
1283b3b8f82b90 Dave Stevenson   2020-01-20  1271  		goto error_power_off;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1272  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1273  	/* Initialize subdev */
17971a430ff90d Tommaso Merciai  2024-10-29  1274  	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1275  	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1276  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1277  	/* Initialize source pad */
1283b3b8f82b90 Dave Stevenson   2020-01-20  1278  	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1279  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1280  	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1281  	if (ret) {
03479d5673138b Umang Jain       2024-03-20  1282  		dev_err_probe(dev, ret, "failed to init entity pads\n");
1283b3b8f82b90 Dave Stevenson   2020-01-20  1283  		goto error_handler_free;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1284  	}
1283b3b8f82b90 Dave Stevenson   2020-01-20  1285  
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1286  	imx219->sd.state_lock = imx219->ctrl_handler.lock;
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1287  	ret = v4l2_subdev_init_finalize(&imx219->sd);
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1288  	if (ret < 0) {
03479d5673138b Umang Jain       2024-03-20  1289  		dev_err_probe(dev, ret, "subdev init error\n");
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1290  		goto error_media_entity;
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1291  	}
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1292  
42eceae9793566 Sakari Ailus     2025-01-10  1293  	pm_runtime_set_active(dev);
42eceae9793566 Sakari Ailus     2025-01-10  1294  	pm_runtime_enable(dev);
42eceae9793566 Sakari Ailus     2025-01-10  1295  
15786f7b564eff Sakari Ailus     2021-03-05  1296  	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1297  	if (ret < 0) {
03479d5673138b Umang Jain       2024-03-20  1298  		dev_err_probe(dev, ret,
03479d5673138b Umang Jain       2024-03-20  1299  			      "failed to register sensor sub-device\n");
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1300  		goto error_subdev_cleanup;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1301  	}
1283b3b8f82b90 Dave Stevenson   2020-01-20  1302  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1303  	pm_runtime_idle(dev);
5bd6b8c1bb2d49 Tarang Raval     2025-03-06  1304  	pm_runtime_set_autosuspend_delay(dev, 1000);
5bd6b8c1bb2d49 Tarang Raval     2025-03-06  1305  	pm_runtime_use_autosuspend(dev);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1306  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1307  	return 0;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1308  
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1309  error_subdev_cleanup:
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1310  	v4l2_subdev_cleanup(&imx219->sd);
42eceae9793566 Sakari Ailus     2025-01-10  1311  	pm_runtime_disable(dev);
42eceae9793566 Sakari Ailus     2025-01-10  1312  	pm_runtime_set_suspended(dev);
e8a5b1df000e1a Jacopo Mondi     2023-07-10  1313  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1314  error_media_entity:
1283b3b8f82b90 Dave Stevenson   2020-01-20  1315  	media_entity_cleanup(&imx219->sd.entity);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1316  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1317  error_handler_free:
1283b3b8f82b90 Dave Stevenson   2020-01-20  1318  	imx219_free_controls(imx219);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1319  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1320  error_power_off:
1283b3b8f82b90 Dave Stevenson   2020-01-20  1321  	imx219_power_off(dev);
1283b3b8f82b90 Dave Stevenson   2020-01-20  1322  
1283b3b8f82b90 Dave Stevenson   2020-01-20  1323  	return ret;
1283b3b8f82b90 Dave Stevenson   2020-01-20  1324  }
1283b3b8f82b90 Dave Stevenson   2020-01-20  1325  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
