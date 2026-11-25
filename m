Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795569257;
	b=CkDz5Sil08CxvV4J96YVNOTHYvgC6LZm51xqNMfC3E0wY4FjNVY0gcFT8pPFna9YrBlG
	 re9VX60mgukjRrAMKUsHA4jDv186k2+3Ws0RFVZqdNaphoaGTbkl5xHsdemt1vPj6f3JT
	 GJag2CLXDSx/gPCOTB70fUkfngaW5laOA/hV+sAtrRdZtkHPubS0SLlMtBnJpLFWEERmZ
	 gVs3gdw9USeFz+eG3aYShig7cTQW2hgOWHys9ePmHqUN81J7j5WFHCEjauqt7MYroyEU2
	 HPYDMlJwFDcpRWTfdxiXF/qbXYiL8f6802eSJctvFFhKzvWVfsHQwZ0VPyeeZXyzNog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569257;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LHJCgD46BHZFlg4y5YlSWkbsWdLocvFadLaw/xj7LI4=;
	b=DB9FvBnNzV1Ph5FLqh6n87cEOyql8hDPSsNlD02Dtw6JYynRVRpCDO5Lnw8uTt8w+W6b
	 h6jYJVXap079GnZumUDYnt0L/DPL4Orsch4VRSXaBQ7aYBgoYnEgrZfHFt7FAFPlpPD1c
	 fzIPZl34hifj7bOSznoIDePJO5QLDnaTNnB71wOO6ua7NPBysUzE0kqbRK3kEGFc08ZNN
	 uBE9EW1vopojK6JdWj/KkMswKwJ2yFgaFzJ7RzEbfwTF4Fd1tfGj+CztUZSMCxz3MZe0/
	 mFOWP+wq5sCPMPol8ePdvoQXn0Ab6hu4uXA++0XS0WmGvdBF6aJXENYxPSra3bp1s4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="d53/3epU";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468E606A31E;
	Wed, 25 Nov 2026 01:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A468E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d53/3epU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795569256; x=1827105256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RVmXkbcmTdebG9jhnv0WvsAA9iprgh7mGs8s+3jbhGE=;
  b=d53/3epUKkKU3pioyqR4EFGmAFM/7EGa9k37aFudHu3SIjtQi/JseU0U
   6RWGSndylYAOdm04XxeeFNMX+gH09JaksMZ7GyUDt5oInWxVyFa2kld/Y
   hSExVIn9fQB1pn48QQJCY2WrACZmm+1yd/gTYIvzhbpobcBHpbSFWyRlW
   8VUCOoP5TKuP4rSlM/5owQVUkhN4/FrOldwDhoGLdtjldqp8MLjCI573w
   ZMdsriltDAf0W3llIgHEjSGKkRI4otab7bk4bzj85X1n+UJabqgWfIcs+
   3mzb3l3RjxP6817orG4uPoPpLhn4PSCXR0wI7aF68Tnd+Fb89Ddw3s6Sd
   g==;
X-CSE-ConnectionGUID: 6Dhtfkb0RleXWErNQizxUA==
X-CSE-MsgGUID: fRmKtfwPQ/OhV3bPajszFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4407644"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4407644"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 17:14:15 -0800
X-CSE-ConnectionGUID: jG7m6XPJRU2lvktZFwp+qw==
X-CSE-MsgGUID: n10h878PTsu3/lG5PSLd1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="13400136"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 24 Nov 2026 17:14:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW1aI-00000001QbG-3geK;
	Wed, 25 Nov 2026 01:14:06 +0000
Date: Wed, 25 Nov 2026 09:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paul Burton <paulburton@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joseph Telaak <joseph@telaak.dev>
Subject: Re: [PATCH v5 6/6] reset: Add Siflower SF19A2890 peripheral reset
 driver
Message-ID: <20261125084324.IBaFeULM-lkp@intel.com>
References: <20261123-sf19a2890-sysm-v5-6-4ba44a0db17d@telaak.dev>
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
In-Reply-To: <20261123-sf19a2890-sysm-v5-6-4ba44a0db17d@telaak.dev>

Hi Joseph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fc1f8f0ceb3b949b58c2f7819976644f5cf84249]

url:    https://github.com/intel-lab-lkp/linux/commits/Joseph-Telaak-via-B4-Relay/MIPS-Add-support-for-Siflower-MIPS-SoCs/20261123-234121
base:   fc1f8f0ceb3b949b58c2f7819976644f5cf84249
patch link:    https://lore.kernel.org/r/20261123-sf19a2890-sysm-v5-6-4ba44a0db17d%40telaak.dev
patch subject: [PATCH v5 6/6] reset: Add Siflower SF19A2890 peripheral reset driver
config: hexagon-randconfig-1001-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125084324.IBaFeULM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125084324.IBaFeULM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125084324.IBaFeULM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-sf19a2890-periphcrm.c:130:34: warning: unused variable 'sf19a2890_periphrst_ids' [-Wunused-const-variable]
     130 | static const struct of_device_id sf19a2890_periphrst_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/sf19a2890_periphrst_ids +130 drivers/reset/reset-sf19a2890-periphcrm.c

   129	
 > 130	static const struct of_device_id sf19a2890_periphrst_ids[] = {
   131		{ .compatible = "siflower,sf19a2890-gmac-crm", .data = &sf19a2890_gmac_rst },
   132		{ .compatible = "siflower,sf19a2890-gpio-crm", .data = &sf19a2890_single_rst },
   133		{ .compatible = "siflower,sf19a2890-i2c-crm", .data = &sf19a2890_single_rst },
   134		{ .compatible = "siflower,sf19a2890-pwm-crm", .data = &sf19a2890_single_rst },
   135		{ .compatible = "siflower,sf19a2890-rf-crm", .data = &sf19a2890_wlan_rst },
   136		{ .compatible = "siflower,sf19a2890-spi-crm", .data = &sf19a2890_spi_rst },
   137		{ .compatible = "siflower,sf19a2890-timer-crm", .data = &sf19a2890_single_rst },
   138		{ .compatible = "siflower,sf19a2890-uart-crm", .data = &sf19a2890_uart_rst },
   139		{ .compatible = "siflower,sf19a2890-usb-crm", .data = &sf19a2890_usb_rst },
   140		{ .compatible = "siflower,sf19a2890-wdt-crm", .data = &sf19a2890_single_rst },
   141		{ .compatible = "siflower,sf19a2890-wlan24-crm", .data = &sf19a2890_wlan_rst },
   142		{ .compatible = "siflower,sf19a2890-wlan5-crm", .data = &sf19a2890_wlan_rst },
   143		{ /* sentinel */ }
   144	};
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
