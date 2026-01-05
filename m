Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7F3376A9
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614662; cv=none; b=JJGFdTf8mExcbZ5trCSz6QfrtmQYLarbMjRhBNMQMVM6Z4YSMox5/PncgDwDhwQBztvnnsOOBFJnIiB6vVd/tELWY/1lddtYh61JoUkx4jQTcMe65FS1tIuwsbvPwglRmTAbgFQbZIYYsL71B9K8f/+QjDreyIG0sn1hP/leSDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614662; c=relaxed/simple;
	bh=HGphxYDgwPpJOyCv+3RoVjNHHGj+TTQU/3r4/k523Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Q6vsaCCiP7ALGUnDXAISR5LBygas/gIATaBfONlw99l0XJoalZdCQIG12Ul8FJynpBw6CSt6opn+ZNaHHBE1BvMU7zeWC9Qivn9/yz3HCZTE2yPZvG6f8hsYrld42NflIVU0W/rHT0ga1BeoN+TRb09Zn19NKS5ojNhxeUV7z0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUb0Fzqz; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUb0Fzqz"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so91004235e9.3
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 04:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767614659; x=1768219459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAqNTTZl4XxJFY09eQkKsMLXLhSWhPw/RgBg90Ddzz8=;
        b=FUb0FzqzMFJFdxX5XkTenC2c73/Yr683oOe65VeVIh8mv/BQVh6kesdwWtdvadqgJj
         Kov0wLi+6jTVpLO1ueXtBmWFLTq1qEYy8BsEdjS8vv/W8QbVopfsjUAWNCGOygezRK/C
         16x0TAhvmmkt30VDYbzLEb/NvrUOP9kPnFdXDd3MYzdf/ZvPG/rJT9oDKu8zc1aq6aDg
         JvH0OqaChFcZ3251CaWU4QCRODPaxJIOZUW3vQ2GWAH1E3okULWACdIIc+ERARBEwLEu
         FVVqScwLbzvwrptI3rd9lWoKJx1bNtXH9L1aYE5Fd5YzcexssO9DFuajzY63Ex/xUeeu
         Ed7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614659; x=1768219459;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAqNTTZl4XxJFY09eQkKsMLXLhSWhPw/RgBg90Ddzz8=;
        b=Pcov5wpKT+csnQPhGBS2GiTekVktCyB/Wk6TTVvKdA42z6RGcx0RkkNGaVOtE7gjDd
         wVBxc/HuqUj9DYHuuo30+2NTN0e2fQc4acSeizWMezHNvIJZuP0Ysi9cCKPk+Pj1b7Wd
         AJFgR8Vcoh9z/Ad84aV+oKtmK12+kBcSNw6ae7Lx/db+JAxHWWfvkBjF0Vv0ShWnBDmN
         4b9uOWzZJVOfZSJu+AVkCicD2JJQLMaNnDthUQPDLpSPox9n4pQ8vN/AQG4J+FjaAjBX
         h6S26xztQvmlevz6TtfSN6dwIT7KA6CBCFmMyRmfae/DoSnPNzd5EHXljlYx/UCxPAXy
         t7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4um+ktpnOi/n1zhmVtTuvRcKgryvCW3fK8T64qmotZCode0HUWskplMrsTZZbgsR7j/NkfEKiYLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzld1ZAXAHAQAP1h8FZHZzy0drKntBB1rG/g3Etq/hEmu9oLE9R
	m7izFFzvrRd1o2wd/QLg/8rIKBLAZJ0ZaFIqS2Kpje+74fjk8lI/NK7AjuL7WA5mzPs=
X-Gm-Gg: AY/fxX5OXdvcJvxlAnGz9g0ZIjOLZEAAP360VqKqW9LrmcbSJx+TjKNSOesRsVUawt7
	SZifW8duWMNHxD563aVhRmeaSorlwGJgylXU4CvrDJ2gpN4UWebg4CQdTgi7sTtMbIQUmhiwUBj
	QwgPSh2+VlYf4HKBaiSwrvX7K4sh43a3YSDu0DT5XIglliqDUUKaPmZW/RPD2FgWZtCTJzpx6Y1
	fCPQzYkQSw5kV4f5NuE9HR6MOIYOuEx/szudO9rLOfs7IYaKtwG2udBjHRTKFpbotdH4Wszj5+m
	aHXwWxbIskEgwjU10n8G6aMQKVpj+6Z8RcsSVaeBqklejRaluRhCagZ3sgN1r8OkcXvnSLFSNYT
	92I6fZWkAGqua9Fhv2OtcQS6f4I29BHL5nPsGoDymQrs8PLrZVmSij7UKkFVXh+j67CgkyE3Z5P
	XKykZsSono+RPiNUop
X-Google-Smtp-Source: AGHT+IFbi0j/vNdxfH/mBHODZsP5f/kPvrCzx0fxoQCCcx6Xdp5Oym4jRSP/et3DTSTSOHpScvtwoA==
X-Received: by 2002:a05:600c:4e8e:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47d1957b120mr629644115e9.17.1767614658422;
        Mon, 05 Jan 2026 04:04:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13e2e0sm184586775e9.1.2026.01.05.04.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:04:18 -0800 (PST)
Date: Mon, 5 Jan 2026 15:04:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yu-Chun Lin <eleanor.lin@realtek.com>,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	eleanor.lin@realtek.com
Subject: Re: [PATCH 6/9] clk: realtek: Add support for mux clock
Message-ID: <202512310307.swVDgnPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229075313.27254-7-eleanor.lin@realtek.com>

Hi Yu-Chun,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20251229-155549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251229075313.27254-7-eleanor.lin%40realtek.com
patch subject: [PATCH 6/9] clk: realtek: Add support for mux clock
config: loongarch-randconfig-r072-20251231 (https://download.01.org/0day-ci/archive/20251231/202512310307.swVDgnPU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512310307.swVDgnPU-lkp@intel.com/

smatch warnings:
drivers/clk/realtek/clk-regmap-mux.c:23 clk_regmap_mux_get_parent() warn: signedness bug returning '(-22)'

vim +23 drivers/clk/realtek/clk-regmap-mux.c

f53de7a7df69f0 Yu-Chun Lin 2025-12-29   9  static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
                                                  ^^
This function returns negative error codes so it needs to be type int.

f53de7a7df69f0 Yu-Chun Lin 2025-12-29  10  {
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  11  	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  12  	int num_parents = clk_hw_get_num_parents(hw);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  13  	u32 val;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  14  	int ret;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  15  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  16  	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  17  	if (ret)
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  18  		return ret;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  19  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  20  	val = val >> clkm->shift & clkm->mask;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  21  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  22  	if (val >= num_parents)
f53de7a7df69f0 Yu-Chun Lin 2025-12-29 @23  		return -EINVAL;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  24  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  25  	return val;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  26  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

