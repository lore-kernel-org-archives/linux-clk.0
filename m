Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC081DD0DC
	for <linux-clk@vger.kernel.org>; Mon,  6 Jan 2025 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161603; cv=none; b=DR7/m9D0zI/hfQRe8Du3uZumveLJfh6t1Jf8HZvjwXSW7N3TxyCteTTj4XFx0mBbwIgLJfNtczGq47ASvLIHX+BGMBocQeBUuLhegrqRndaNOLxnxSDp4SKp2FJsoTHYno1P0Rifkpi5vgp5PdrBYMNdzI7Ayh1XfpbBHojm24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161603; c=relaxed/simple;
	bh=A6JobZoPrq69BuqxXh3qmnmCjaegCYBZNWC2wJ3H0Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MyxXeIHXiQmhQkJmhiDyArUNMnBP1/NWLMlfMDa/+eolQNwW0K0CwjROIJX5QxIAe8F/iLWs4vD+t8kN6lWhHDmuRYm78p9WE2xg3k20Cdfe6t3On8gI9NCkzpMAOZpLzvBQZ2/Be4lHGW5PnzW7BPQlatoEaN68zmuua+3BGbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AIfrpsNC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AIfrpsNC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436a03197b2so49471735e9.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jan 2025 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736161598; x=1736766398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SV0FBVRxpsuCLb/nRDIZe8jsu0IEUwlF/EBuP03LhIc=;
        b=AIfrpsNC02vPkTNXQpYaZ7UAXd7rBuwJ8flvMn1A6TdNec5zIfAbrNmqcyKJHqcpew
         MnZcpGB+vSQNUHylUMQoeVmO/fBzFQV8LlmvEdcQQhJNoMQvd9kS1WHMPX4dm3hUetXU
         LrcIJcyf1c+WGdbCLrTbYAGc/slX8C+8AdDr9XKxyWLaaRU3X2ggRNVpRPyFsCSDApJs
         fhJKcyL6sWeVb7W610foBmaGWDGq7FzvHhg1JgjPgSqZKIWG74BpmeDPwaMiiZuPmDSg
         W5H92xrPdVINrXtUfWmU5zwvP8flqp5f71qlZ6vaKxsGLsvI6jRpYaxM8lLNlB5ggCJb
         WsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161598; x=1736766398;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV0FBVRxpsuCLb/nRDIZe8jsu0IEUwlF/EBuP03LhIc=;
        b=YQNf4a4eYEwC8anQkyK7DYvMPuwnAvV0oLBKyicJjCGNBj4vUXQ06Q2/N0Bzg8F4Av
         RYK9y0GR4HWs6B07/2Y1X9X2Tr1SNCKbFX0xz7Nt8S/68ALp5SEd086Mq1RujCiUlreq
         LXEo90cdfbPCBhxEXhG8883zZK97WNXbi+PlK0faxCZEQzfaDvooWd27iUYz2EdQec+Q
         OgXGfShKTE/sqvEYNogtyTsnz6ojQ2fp6xYc3Ej0DaZo8OOubcxLiB0zZDJT5KjwqTwR
         OtRflHRJfZYx00RnXqVCIrp929KSD86lCreEKGIF5KMIrDFjUkpNYIPTSzGFqHdaTU7U
         TvMw==
X-Forwarded-Encrypted: i=1; AJvYcCUZh73NFf3JWdUUgbLpGgl8TXelScJYZw2WR8VkcBHckLYIUV1/RGNIaEd7XvxBtktUxESOZHBRFtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY4EYvpj8YGohFHZrY7S4gFxkrd8TM1ss4gwh4Kbt+DVQl52rl
	ZkHfry3ZNGjUcCagRjDwjh8Ql1m9F7UnVhGYZCW3kSpPW6bCm4LYkf+EAnFDbhOmqMrxBDifHJr
	k
X-Gm-Gg: ASbGncuL6C2cpPuI58rPDd9mrWQy3BC//meVrao2quQPNJk/zBNxqrhrkCgRxgPPQ7s
	GJtJDFCXRpr5JBAm788uKcE3oOBmuj0G5Fhk2mTCQyjfJ2OXbDrT3vRbbuUOl+hEmTBPwGCt346
	YXCzJTBtXNeWWv0OyotQHSFGrZCdqJThUmxThHdVb+/3P8S78wOibCJNKPe2mf4VimkdmZcK6xh
	Qyg+mviwVrazkc8m2j73jMc7yKkNh5WITjNHjHeiIGqW6D8NnyF2L5RFWCTBg==
X-Google-Smtp-Source: AGHT+IGYhdHyJQz2T6sQnktrmfPOEHIa+NxQvfHmqaXAv8NSDYeXhh8uDw3YLAg6DXD0ySC+Pw0+TA==
X-Received: by 2002:a05:600c:1d0c:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-43668b78e66mr508486965e9.30.1736161598070;
        Mon, 06 Jan 2025 03:06:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364b0532a6sm577668545e9.1.2025.01.06.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:06:37 -0800 (PST)
Date: Mon, 6 Jan 2025 14:06:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 11/18] clk: imx: add support for i.MX8MN anatop clock
 driver
Message-ID: <a495faf8-6cfb-4d24-b7b5-cd94e1a8b3ca@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229145027.3984542-12-dario.binacchi@amarulasolutions.com>

Hi Dario,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/dt-bindings-clock-imx8mm-add-VIDEO_PLL-clocks/20241229-225716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241229145027.3984542-12-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v8 11/18] clk: imx: add support for i.MX8MN anatop clock driver
config: arm-randconfig-r071-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311031.781qvq8q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412311031.781qvq8q-lkp@intel.com/

smatch warnings:
drivers/clk/imx/clk-imx8mn-anatop.c:244 imx8mn_anatop_clocks_probe() error: buffer overflow 'hws' 62 <= 62

vim +/hws +244 drivers/clk/imx/clk-imx8mn-anatop.c

87df58feb5834e Dario Binacchi 2024-12-29   40  static int imx8mn_anatop_clocks_probe(struct platform_device *pdev)
87df58feb5834e Dario Binacchi 2024-12-29   41  {
87df58feb5834e Dario Binacchi 2024-12-29   42  	struct device *dev = &pdev->dev;
87df58feb5834e Dario Binacchi 2024-12-29   43  	struct device_node *np = dev->of_node;
87df58feb5834e Dario Binacchi 2024-12-29   44  	void __iomem *base;
87df58feb5834e Dario Binacchi 2024-12-29   45  	int ret;
87df58feb5834e Dario Binacchi 2024-12-29   46  
87df58feb5834e Dario Binacchi 2024-12-29   47  	base = devm_platform_ioremap_resource(pdev, 0);
87df58feb5834e Dario Binacchi 2024-12-29   48  	if (IS_ERR(base)) {
87df58feb5834e Dario Binacchi 2024-12-29   49  		dev_err(dev, "failed to get base address\n");
87df58feb5834e Dario Binacchi 2024-12-29   50  		return PTR_ERR(base);
87df58feb5834e Dario Binacchi 2024-12-29   51  	}
87df58feb5834e Dario Binacchi 2024-12-29   52  
87df58feb5834e Dario Binacchi 2024-12-29   53  	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
87df58feb5834e Dario Binacchi 2024-12-29   54  						    IMX8MN_ANATOP_CLK_END),

IMX8MN_ANATOP_CLK_END is IMX8MN_ANATOP_CLK_CLKOUT2

87df58feb5834e Dario Binacchi 2024-12-29   55  				   GFP_KERNEL);
87df58feb5834e Dario Binacchi 2024-12-29   56  	if (WARN_ON(!clk_hw_data))
87df58feb5834e Dario Binacchi 2024-12-29   57  		return -ENOMEM;
87df58feb5834e Dario Binacchi 2024-12-29   58  
87df58feb5834e Dario Binacchi 2024-12-29   59  	clk_hw_data->num = IMX8MN_ANATOP_CLK_END;
87df58feb5834e Dario Binacchi 2024-12-29   60  	hws = clk_hw_data->hws;
87df58feb5834e Dario Binacchi 2024-12-29   61  
87df58feb5834e Dario Binacchi 2024-12-29   62  	hws[IMX8MN_ANATOP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
87df58feb5834e Dario Binacchi 2024-12-29   63  	hws[IMX8MN_ANATOP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
87df58feb5834e Dario Binacchi 2024-12-29   64  	hws[IMX8MN_ANATOP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
87df58feb5834e Dario Binacchi 2024-12-29   65  
87df58feb5834e Dario Binacchi 2024-12-29   66  	hws[IMX8MN_ANATOP_AUDIO_PLL1_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   67  		imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   68  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   69  	hws[IMX8MN_ANATOP_AUDIO_PLL2_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   70  		imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   71  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   72  	hws[IMX8MN_ANATOP_VIDEO_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   73  		imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   74  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   75  	hws[IMX8MN_ANATOP_DRAM_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   76  		imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   77  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   78  	hws[IMX8MN_ANATOP_GPU_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   79  		imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   80  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   81  	hws[IMX8MN_ANATOP_M7_ALT_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   82  		imx_clk_hw_mux("m7_alt_pll_ref_sel", base + 0x74, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   83  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   84  	hws[IMX8MN_ANATOP_ARM_PLL_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   85  		imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   86  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   87  	hws[IMX8MN_ANATOP_SYS_PLL3_REF_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29   88  		imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2,
87df58feb5834e Dario Binacchi 2024-12-29   89  			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
87df58feb5834e Dario Binacchi 2024-12-29   90  
87df58feb5834e Dario Binacchi 2024-12-29   91  	hws[IMX8MN_ANATOP_AUDIO_PLL1] =
87df58feb5834e Dario Binacchi 2024-12-29   92  		imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel",
87df58feb5834e Dario Binacchi 2024-12-29   93  				   base, &imx_1443x_pll);
87df58feb5834e Dario Binacchi 2024-12-29   94  	hws[IMX8MN_ANATOP_AUDIO_PLL2] =
87df58feb5834e Dario Binacchi 2024-12-29   95  		imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel",
87df58feb5834e Dario Binacchi 2024-12-29   96  				   base + 0x14, &imx_1443x_pll);
87df58feb5834e Dario Binacchi 2024-12-29   97  	hws[IMX8MN_ANATOP_VIDEO_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29   98  		imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel",
87df58feb5834e Dario Binacchi 2024-12-29   99  				   base + 0x28, &imx_1443x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  100  	hws[IMX8MN_ANATOP_DRAM_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29  101  		imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50,
87df58feb5834e Dario Binacchi 2024-12-29  102  				   &imx_1443x_dram_pll);
87df58feb5834e Dario Binacchi 2024-12-29  103  	hws[IMX8MN_ANATOP_GPU_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29  104  		imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64,
87df58feb5834e Dario Binacchi 2024-12-29  105  				   &imx_1416x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  106  	hws[IMX8MN_ANATOP_M7_ALT_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29  107  		imx_clk_hw_pll14xx("m7_alt_pll", "m7_alt_pll_ref_sel",
87df58feb5834e Dario Binacchi 2024-12-29  108  				   base + 0x74, &imx_1416x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  109  	hws[IMX8MN_ANATOP_ARM_PLL] =
87df58feb5834e Dario Binacchi 2024-12-29  110  		imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84,
87df58feb5834e Dario Binacchi 2024-12-29  111  				   &imx_1416x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  112  	hws[IMX8MN_ANATOP_SYS_PLL1] = imx_clk_hw_fixed("sys_pll1", 800000000);
87df58feb5834e Dario Binacchi 2024-12-29  113  	hws[IMX8MN_ANATOP_SYS_PLL2] = imx_clk_hw_fixed("sys_pll2", 1000000000);
87df58feb5834e Dario Binacchi 2024-12-29  114  	hws[IMX8MN_ANATOP_SYS_PLL3] =
87df58feb5834e Dario Binacchi 2024-12-29  115  		imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", base + 0x114,
87df58feb5834e Dario Binacchi 2024-12-29  116  				   &imx_1416x_pll);
87df58feb5834e Dario Binacchi 2024-12-29  117  
87df58feb5834e Dario Binacchi 2024-12-29  118  	/* PLL bypass out */
87df58feb5834e Dario Binacchi 2024-12-29  119  	hws[IMX8MN_ANATOP_AUDIO_PLL1_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  120  		imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1,
87df58feb5834e Dario Binacchi 2024-12-29  121  				     audio_pll1_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  122  				     ARRAY_SIZE(audio_pll1_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  123  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  124  	hws[IMX8MN_ANATOP_AUDIO_PLL2_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  125  		imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1,
87df58feb5834e Dario Binacchi 2024-12-29  126  				     audio_pll2_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  127  				     ARRAY_SIZE(audio_pll2_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  128  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  129  	hws[IMX8MN_ANATOP_VIDEO_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  130  		imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1,
87df58feb5834e Dario Binacchi 2024-12-29  131  				     video_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  132  				     ARRAY_SIZE(video_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  133  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  134  	hws[IMX8MN_ANATOP_DRAM_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  135  		imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1,
87df58feb5834e Dario Binacchi 2024-12-29  136  				     dram_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  137  				     ARRAY_SIZE(dram_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  138  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  139  	hws[IMX8MN_ANATOP_GPU_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  140  		imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1,
87df58feb5834e Dario Binacchi 2024-12-29  141  				     gpu_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  142  				     ARRAY_SIZE(gpu_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  143  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  144  	hws[IMX8MN_ANATOP_M7_ALT_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  145  		imx_clk_hw_mux_flags("m7_alt_pll_bypass", base + 0x74, 28, 1,
87df58feb5834e Dario Binacchi 2024-12-29  146  				     m7_alt_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  147  				     ARRAY_SIZE(m7_alt_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  148  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  149  	hws[IMX8MN_ANATOP_ARM_PLL_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  150  		imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84, 28, 1,
87df58feb5834e Dario Binacchi 2024-12-29  151  				     arm_pll_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  152  				     ARRAY_SIZE(arm_pll_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  153  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  154  	hws[IMX8MN_ANATOP_SYS_PLL3_BYPASS] =
87df58feb5834e Dario Binacchi 2024-12-29  155  		imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114, 28, 1,
87df58feb5834e Dario Binacchi 2024-12-29  156  				     sys_pll3_bypass_sels,
87df58feb5834e Dario Binacchi 2024-12-29  157  				     ARRAY_SIZE(sys_pll3_bypass_sels),
87df58feb5834e Dario Binacchi 2024-12-29  158  				     CLK_SET_RATE_PARENT);
87df58feb5834e Dario Binacchi 2024-12-29  159  
87df58feb5834e Dario Binacchi 2024-12-29  160  	/* PLL out gate */
87df58feb5834e Dario Binacchi 2024-12-29  161  	hws[IMX8MN_ANATOP_AUDIO_PLL1_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  162  		imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  163  				base, 13);
87df58feb5834e Dario Binacchi 2024-12-29  164  	hws[IMX8MN_ANATOP_AUDIO_PLL2_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  165  		imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  166  				base + 0x14, 13);
87df58feb5834e Dario Binacchi 2024-12-29  167  	hws[IMX8MN_ANATOP_VIDEO_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  168  		imx_clk_hw_gate("video_pll_out", "video_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  169  				base + 0x28, 13);
87df58feb5834e Dario Binacchi 2024-12-29  170  	hws[IMX8MN_ANATOP_DRAM_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  171  		imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  172  				base + 0x50, 13);
87df58feb5834e Dario Binacchi 2024-12-29  173  	hws[IMX8MN_ANATOP_GPU_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  174  		imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  175  				base + 0x64, 11);
87df58feb5834e Dario Binacchi 2024-12-29  176  	hws[IMX8MN_ANATOP_M7_ALT_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  177  		imx_clk_hw_gate("m7_alt_pll_out", "m7_alt_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  178  				base + 0x74, 11);
87df58feb5834e Dario Binacchi 2024-12-29  179  	hws[IMX8MN_ANATOP_ARM_PLL_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  180  		imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  181  				base + 0x84, 11);
87df58feb5834e Dario Binacchi 2024-12-29  182  	hws[IMX8MN_ANATOP_SYS_PLL3_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  183  		imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass",
87df58feb5834e Dario Binacchi 2024-12-29  184  				base + 0x114, 11);
87df58feb5834e Dario Binacchi 2024-12-29  185  
87df58feb5834e Dario Binacchi 2024-12-29  186  	/* SYS PLL1 fixed output */
87df58feb5834e Dario Binacchi 2024-12-29  187  	hws[IMX8MN_ANATOP_SYS_PLL1_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  188  		imx_clk_hw_gate("sys_pll1_out", "sys_pll1", base + 0x94, 11);
87df58feb5834e Dario Binacchi 2024-12-29  189  	hws[IMX8MN_ANATOP_SYS_PLL1_40M] =
87df58feb5834e Dario Binacchi 2024-12-29  190  		imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
87df58feb5834e Dario Binacchi 2024-12-29  191  	hws[IMX8MN_ANATOP_SYS_PLL1_80M] =
87df58feb5834e Dario Binacchi 2024-12-29  192  		imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
87df58feb5834e Dario Binacchi 2024-12-29  193  	hws[IMX8MN_ANATOP_SYS_PLL1_100M] =
87df58feb5834e Dario Binacchi 2024-12-29  194  		imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
87df58feb5834e Dario Binacchi 2024-12-29  195  	hws[IMX8MN_ANATOP_SYS_PLL1_133M] =
87df58feb5834e Dario Binacchi 2024-12-29  196  		imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
87df58feb5834e Dario Binacchi 2024-12-29  197  	hws[IMX8MN_ANATOP_SYS_PLL1_160M] =
87df58feb5834e Dario Binacchi 2024-12-29  198  		imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
87df58feb5834e Dario Binacchi 2024-12-29  199  	hws[IMX8MN_ANATOP_SYS_PLL1_200M] =
87df58feb5834e Dario Binacchi 2024-12-29  200  		imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
87df58feb5834e Dario Binacchi 2024-12-29  201  	hws[IMX8MN_ANATOP_SYS_PLL1_266M] =
87df58feb5834e Dario Binacchi 2024-12-29  202  		imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
87df58feb5834e Dario Binacchi 2024-12-29  203  	hws[IMX8MN_ANATOP_SYS_PLL1_400M] =
87df58feb5834e Dario Binacchi 2024-12-29  204  		imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
87df58feb5834e Dario Binacchi 2024-12-29  205  	hws[IMX8MN_ANATOP_SYS_PLL1_800M] =
87df58feb5834e Dario Binacchi 2024-12-29  206  		imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
87df58feb5834e Dario Binacchi 2024-12-29  207  
87df58feb5834e Dario Binacchi 2024-12-29  208  	/* SYS PLL2 fixed output */
87df58feb5834e Dario Binacchi 2024-12-29  209  	hws[IMX8MN_ANATOP_SYS_PLL2_OUT] =
87df58feb5834e Dario Binacchi 2024-12-29  210  		imx_clk_hw_gate("sys_pll2_out", "sys_pll2", base + 0x104, 11);
87df58feb5834e Dario Binacchi 2024-12-29  211  	hws[IMX8MN_ANATOP_SYS_PLL2_50M] =
87df58feb5834e Dario Binacchi 2024-12-29  212  		imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
87df58feb5834e Dario Binacchi 2024-12-29  213  	hws[IMX8MN_ANATOP_SYS_PLL2_100M] =
87df58feb5834e Dario Binacchi 2024-12-29  214  		imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
87df58feb5834e Dario Binacchi 2024-12-29  215  	hws[IMX8MN_ANATOP_SYS_PLL2_125M] =
87df58feb5834e Dario Binacchi 2024-12-29  216  		imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
87df58feb5834e Dario Binacchi 2024-12-29  217  	hws[IMX8MN_ANATOP_SYS_PLL2_166M] =
87df58feb5834e Dario Binacchi 2024-12-29  218  		imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
87df58feb5834e Dario Binacchi 2024-12-29  219  	hws[IMX8MN_ANATOP_SYS_PLL2_200M] =
87df58feb5834e Dario Binacchi 2024-12-29  220  		imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
87df58feb5834e Dario Binacchi 2024-12-29  221  	hws[IMX8MN_ANATOP_SYS_PLL2_250M] =
87df58feb5834e Dario Binacchi 2024-12-29  222  		imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
87df58feb5834e Dario Binacchi 2024-12-29  223  	hws[IMX8MN_ANATOP_SYS_PLL2_333M] =
87df58feb5834e Dario Binacchi 2024-12-29  224  		imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
87df58feb5834e Dario Binacchi 2024-12-29  225  	hws[IMX8MN_ANATOP_SYS_PLL2_500M] =
87df58feb5834e Dario Binacchi 2024-12-29  226  		imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
87df58feb5834e Dario Binacchi 2024-12-29  227  	hws[IMX8MN_ANATOP_SYS_PLL2_1000M] =
87df58feb5834e Dario Binacchi 2024-12-29  228  		imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
87df58feb5834e Dario Binacchi 2024-12-29  229  
87df58feb5834e Dario Binacchi 2024-12-29  230  	hws[IMX8MN_ANATOP_CLK_CLKOUT1_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29  231  		imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4,
87df58feb5834e Dario Binacchi 2024-12-29  232  				clkout_sels, ARRAY_SIZE(clkout_sels));
87df58feb5834e Dario Binacchi 2024-12-29  233  	hws[IMX8MN_ANATOP_CLK_CLKOUT1_DIV] =
87df58feb5834e Dario Binacchi 2024-12-29  234  		imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128,
87df58feb5834e Dario Binacchi 2024-12-29  235  				   0, 4);
87df58feb5834e Dario Binacchi 2024-12-29  236  	hws[IMX8MN_ANATOP_CLK_CLKOUT1] =
87df58feb5834e Dario Binacchi 2024-12-29  237  		imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
87df58feb5834e Dario Binacchi 2024-12-29  238  	hws[IMX8MN_ANATOP_CLK_CLKOUT2_SEL] =
87df58feb5834e Dario Binacchi 2024-12-29  239  		imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4,
87df58feb5834e Dario Binacchi 2024-12-29  240  				clkout_sels, ARRAY_SIZE(clkout_sels));
87df58feb5834e Dario Binacchi 2024-12-29  241  	hws[IMX8MN_ANATOP_CLK_CLKOUT2_DIV] =
87df58feb5834e Dario Binacchi 2024-12-29  242  		imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128,
87df58feb5834e Dario Binacchi 2024-12-29  243  				   16, 4);
87df58feb5834e Dario Binacchi 2024-12-29 @244  	hws[IMX8MN_ANATOP_CLK_CLKOUT2] =
                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Corruption.

87df58feb5834e Dario Binacchi 2024-12-29  245  		imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
87df58feb5834e Dario Binacchi 2024-12-29  246  
87df58feb5834e Dario Binacchi 2024-12-29  247  	imx_check_clk_hws(hws, IMX8MN_ANATOP_CLK_END);
87df58feb5834e Dario Binacchi 2024-12-29  248  
87df58feb5834e Dario Binacchi 2024-12-29  249  	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
87df58feb5834e Dario Binacchi 2024-12-29  250  	if (ret < 0) {
87df58feb5834e Dario Binacchi 2024-12-29  251  		imx_unregister_hw_clocks(hws, IMX8MN_ANATOP_CLK_END);
87df58feb5834e Dario Binacchi 2024-12-29  252  		return dev_err_probe(dev, ret,
87df58feb5834e Dario Binacchi 2024-12-29  253  				     "failed to register anatop clock provider\n");
87df58feb5834e Dario Binacchi 2024-12-29  254  	}
87df58feb5834e Dario Binacchi 2024-12-29  255  
87df58feb5834e Dario Binacchi 2024-12-29  256  	dev_info(dev, "NXP i.MX8MN anatop clock driver probed\n");
87df58feb5834e Dario Binacchi 2024-12-29  257  	return 0;
87df58feb5834e Dario Binacchi 2024-12-29  258  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

