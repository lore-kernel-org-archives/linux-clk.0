Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r1XnpDZv"
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C050B5
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 22:22:16 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so13658385e9.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Dec 2023 22:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702102935; x=1702707735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUfLyjWdTxwgSWGMLeNKXLU9SpqRs5Ux+VZkSWWMlxc=;
        b=r1XnpDZvR5BbJSkXog1a6oa+ELl0zmkSX+fqAPsGYyX3yOSTTrL0/ZW0QT64k3uaGR
         8yw2Xdfyk18Jlxt7wPTDefIbFvnfW0Id3pSyLRTno5aK1F4s3dXV9wb6Xt4bgjRUG9Fs
         ESjI5dHX0XFb6gqndmFKyz97tg97Biu851IVNb7Gbxj8WPXkC0HDW1BvvcvTuSfSSzC9
         VtGh/Yi1RXoJpdqqLjrsBh3D+sqZ+8bf1Dupei92CnUnmrjOBY0DYCCaD4lBQt1EPoI9
         3JphgjXQRlDMfOCbqrfM0pgtf/NP3vDgf1ARNePBQi6IaahFdjNq5c3K0EQFBGlfdgoD
         LJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702102935; x=1702707735;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUfLyjWdTxwgSWGMLeNKXLU9SpqRs5Ux+VZkSWWMlxc=;
        b=pW55nOpRx8dmuHzcmQTWfa6kiyZJV6FfsgRSaBjY9QzcRssZlDCfCQsj1MIfk8tv9j
         BttLdC7rhz9+O2Y50XTdslx6dpimTulQuHblbTfWT4I8ym3GEaPSjIeeRPORMxeLZ0W1
         3l9ONI994Smfl9UF1joNgYsH77GgRjqTbQ3emLwZZfN4TQN4WdlopohjwSpgd8ZBEi4I
         rnsty/Rcj5teXA9uwEncMOzJK7ZsNTxI1seB3NMqtuOVTSO3WuWWtk6Z2pwK2D3HR+8V
         fii3YDPmk/Xs5rb+VlX3nUy8qzO/laNz/Pjt42roWvxqXGN3zB+G90nHi65zNR4nJfso
         5VVQ==
X-Gm-Message-State: AOJu0Yw521RHBUfyyrHjui5FDHYJuKpCWjKafUnCIqbHiSupEuMoIx9v
	25jLTsXPfZ5JdS1YoTxs5QwRBw==
X-Google-Smtp-Source: AGHT+IFFrBy7iaKn0lxful6M0lWyJC8FTunVIKaO+dmv+Xj2upv4u13p3SvmzsaKkvkRJSjMMShrZA==
X-Received: by 2002:a05:600c:2154:b0:40c:3314:5be6 with SMTP id v20-20020a05600c215400b0040c33145be6mr655398wml.106.1702102934172;
        Fri, 08 Dec 2023 22:22:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm7394329wms.35.2023.12.08.22.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 22:22:13 -0800 (PST)
Date: Sat, 9 Dec 2023 09:22:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chen Wang <unicornxw@gmail.com>,
	aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v6 3/4] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <1a6e3fad-cbe2-461d-940c-601ab5197213@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang@outlook.com>

Hi Chen,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-soc-sophgo-Add-Sophgo-system-control-module/20231208-091702
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang%40outlook.com
patch subject: [PATCH v6 3/4] clk: sophgo: Add SG2042 clock generator driver
config: xtensa-randconfig-r071-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081933.MUdHNASt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312081933.MUdHNASt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312081933.MUdHNASt-lkp@intel.com/

smatch warnings:
drivers/clk/sophgo/clk-sophgo-sg2042.c:1282 sg2042_clk_init_clk_data() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1282 drivers/clk/sophgo/clk-sophgo-sg2042.c

7c68ebea1041f9 Chen Wang 2023-12-08  1258  static int __init sg2042_clk_init_clk_data(
7c68ebea1041f9 Chen Wang 2023-12-08  1259  	struct device_node *node,
7c68ebea1041f9 Chen Wang 2023-12-08  1260  	int num_clks,
7c68ebea1041f9 Chen Wang 2023-12-08  1261  	struct sg2042_clk_data **pp_clk_data)
7c68ebea1041f9 Chen Wang 2023-12-08  1262  {
7c68ebea1041f9 Chen Wang 2023-12-08  1263  	int ret = 0;
7c68ebea1041f9 Chen Wang 2023-12-08  1264  	struct sg2042_clk_data *clk_data = NULL;
7c68ebea1041f9 Chen Wang 2023-12-08  1265  	struct device_node *np_syscon;
7c68ebea1041f9 Chen Wang 2023-12-08  1266  
7c68ebea1041f9 Chen Wang 2023-12-08  1267  	np_syscon = of_parse_phandle(node, "sophgo,system-ctrl", 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1268  	if (!np_syscon) {
7c68ebea1041f9 Chen Wang 2023-12-08  1269  		pr_err("failed to get system-ctrl node\n");
7c68ebea1041f9 Chen Wang 2023-12-08  1270  		ret = -EINVAL;
7c68ebea1041f9 Chen Wang 2023-12-08  1271  		goto error_out;
7c68ebea1041f9 Chen Wang 2023-12-08  1272  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1273  
7c68ebea1041f9 Chen Wang 2023-12-08  1274  	clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
7c68ebea1041f9 Chen Wang 2023-12-08  1275  	if (!clk_data) {
7c68ebea1041f9 Chen Wang 2023-12-08  1276  		ret = -ENOMEM;
7c68ebea1041f9 Chen Wang 2023-12-08  1277  		goto error_out;
7c68ebea1041f9 Chen Wang 2023-12-08  1278  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1279  
7c68ebea1041f9 Chen Wang 2023-12-08  1280  	clk_data->regmap_syscon = device_node_to_regmap(np_syscon);
7c68ebea1041f9 Chen Wang 2023-12-08  1281  	if (IS_ERR_OR_NULL(clk_data->regmap_syscon)) {
7c68ebea1041f9 Chen Wang 2023-12-08 @1282  		pr_err("cannot get regmap_syscon %ld\n", PTR_ERR(clk_data->regmap_syscon));

I don't think device_node_to_regmap() can return NULL, but if it could
then it shouldn't be handled like this:

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/


7c68ebea1041f9 Chen Wang 2023-12-08  1283  		ret = -ENODEV;
7c68ebea1041f9 Chen Wang 2023-12-08  1284  		goto cleanup;
7c68ebea1041f9 Chen Wang 2023-12-08  1285  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1286  	clk_data->iobase_syscon = of_iomap(np_syscon, 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1287  	clk_data->iobase = of_iomap(node, 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1288  	clk_data->onecell_data.num = num_clks;
7c68ebea1041f9 Chen Wang 2023-12-08  1289  
7c68ebea1041f9 Chen Wang 2023-12-08  1290  	*pp_clk_data = clk_data;
7c68ebea1041f9 Chen Wang 2023-12-08  1291  	return ret;
7c68ebea1041f9 Chen Wang 2023-12-08  1292  
7c68ebea1041f9 Chen Wang 2023-12-08  1293  cleanup:
7c68ebea1041f9 Chen Wang 2023-12-08  1294  	kfree(clk_data);
7c68ebea1041f9 Chen Wang 2023-12-08  1295  
7c68ebea1041f9 Chen Wang 2023-12-08  1296  error_out:
7c68ebea1041f9 Chen Wang 2023-12-08  1297  	return ret;
7c68ebea1041f9 Chen Wang 2023-12-08  1298  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

