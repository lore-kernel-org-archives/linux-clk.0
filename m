Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009816;
	b=2LGAQ+LDsM9zVqpKWTarZkQScUjBeKPvbUYTohkl1ZnBteBGZs3sHHs9n1sAfHIxff5H
	 EiF6t9q0C6EW2A6ts8Yrq9gX1fSDy989iZpMCVmim5S4OynP5tTWFPkizT7bNXzZ17RDS
	 AuXrcc8DXHZiMn8qVDLhIZUujVWMM27QNkunfli97bWpboQtsZQSSoqaJH5waQwjkmmkR
	 FcmifQyTRuNrZ0+c0FZAX/Jl/1Ez85LpnseRIyFHqeo+89Q3diPxGqq3GPHmk+PBZcEE/
	 GKduOSQw5Ot8Qvw98MKtv2JNr7gvATrzEroZhoSJI+GKUS7pYT2k+RAyy3R4lbS5XFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009816;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jwXQSkgeTDUCwcRst5l5tu5yBS+0uD1rATX61ggobOM=;
	b=47VMQTOwczcFOw2bcME2rV8BmQhfrGXE3zNSon79cRrpB/rN83S2Y0nc8vr8sTAtrFn7
	 Ib5QSKK4dnFehXr/4In9Z3vaeCIt0pScVkOc4xK3oKP9SQYVHgnFz/uNq5N2oEJpy1kzE
	 vNk5+cLWfk5rEkXoXwg/Z5iNmTdqHskqY93eZOMhxsptCbLrxB2jzPPABHCqk96dHbQEa
	 r7PwVA7RLdZ8zgj0xpsvhiPypHHI1KOy3aimcmzsJg8rZal4ifthOHWRToZlGPqpqUGW3
	 GJrLT9kwfed8+MdYEg3NNGQ3ONlNvIg2V2byWL9g1lnxHlYBkvw+PyytkhO97+EEDDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdYaNOuC;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C7A606A31D;
	Mon, 26 Oct 2026 10:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C7A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdYaNOuC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793009815; x=1824545815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sccwMZ5lXE/ezOElJpzKdefyC1MnNFSrtljA29CphbE=;
  b=CdYaNOuCD9WEoR4IPwsjA6SLGAcFHdHTqqimyzZ3dWNr0lMg8+aFWudt
   CakNiOkxLy0FXjJjG0CKowQkVAaF3wGWMiIH8sbXn+rDU2nzYFfbezVUI
   NjVGB/TDiD30UEXhnb/z5KRLyCUtf8S6Ru0w8S/ZAxwL5cKtJnVmVhAEj
   0BODvYvy/ekCR7cgipkvTpHaKWBh6zv2g9iJvbYazqsBP27Z83M1F5fxH
   t0mmCK2rIyqpvOMr7u/WSAGob1YQXhnXLtU26KFMguUcKlT3Hzyy5L8Q8
   +9UfRfkkcCIHMcr7rt0mJm+TJQPjrEvCqfhfQMDY7RJ4iFal+PzBZ82ff
   g==;
X-CSE-ConnectionGUID: 2mglNuEgRyquAt3ES0L4Tw==
X-CSE-MsgGUID: 8I6HiwEbSXWSgwl0brCsIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1550512"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1550512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:16:54 -0700
X-CSE-ConnectionGUID: 9tru8aW9RbW/ONVFgc4DNQ==
X-CSE-MsgGUID: EUsbzJQ4RWuCnYnFSGXC1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4579780"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2026 03:16:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLHl0-00000000Vm2-0tdH;
	Mon, 26 Oct 2026 10:16:46 +0000
Date: Mon, 26 Oct 2026 18:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
	Paul Boddie <paul@boddie.org.uk>,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 2/4] clk: ingenic: Add Ingenic X1600 CGU clock driver
 support
Message-ID: <202610261821.QhaEUvEU-lkp@intel.com>
References: <50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns@goldelico.com>
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
In-Reply-To: <50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns@goldelico.com>

Hi Nikolaus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v7.3 next-20261023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/H-Nikolaus-Schaller/dt-bindings-clock-Add-Ingenic-X1600-CGU-bindings/20261025-201824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns%40goldelico.com
patch subject: [PATCH 2/4] clk: ingenic: Add Ingenic X1600 CGU clock driver support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261026/202610261821.QhaEUvEU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261821.QhaEUvEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261821.QhaEUvEU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/ingenic/x1600-cgu.c:129:38: warning: variable 'm' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     129 |         for (od_combined = od_combined_min; od_combined <= od_combined_max; od_combined++) {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/x1600-cgu.c:141:8: note: uninitialized use occurs here
     141 |         *pm = m;
         |               ^
   drivers/clk/ingenic/x1600-cgu.c:129:38: note: remove the condition if it is always true
     129 |         for (od_combined = od_combined_min; od_combined <= od_combined_max; od_combined++) {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/x1600-cgu.c:115:17: note: initialize the variable 'm' to silence this warning
     115 |         unsigned long m, n;
         |                        ^
         |                         = 0
>> drivers/clk/ingenic/x1600-cgu.c:129:38: warning: variable 'n' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     129 |         for (od_combined = od_combined_min; od_combined <= od_combined_max; od_combined++) {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/x1600-cgu.c:142:8: note: uninitialized use occurs here
     142 |         *pn = n;
         |               ^
   drivers/clk/ingenic/x1600-cgu.c:129:38: note: remove the condition if it is always true
     129 |         for (od_combined = od_combined_min; od_combined <= od_combined_max; od_combined++) {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/x1600-cgu.c:115:20: note: initialize the variable 'n' to silence this warning
     115 |         unsigned long m, n;
         |                           ^
         |                            = 0
   2 warnings generated.


vim +129 drivers/clk/ingenic/x1600-cgu.c

   104	
   105	static void
   106	x1600_pll_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
   107			      unsigned long rate, unsigned long parent_rate,
   108			      unsigned int *pm, unsigned int *pn, unsigned int *pod,
   109			      unsigned int *pod1)
   110	{
   111		const unsigned int od_max = pll_info->od_max - 1;
   112		const unsigned int od1_max = pll_info->od1_max - 1;
   113		const unsigned int m_max = GENMASK(pll_info->m_bits - 1, 0);
   114		const unsigned int n_max = GENMASK(pll_info->n_bits - 1, 0);
   115		unsigned long m, n;
   116		unsigned int od = 1, od1 = 1;
   117		const unsigned long fvco_min = 600000000, fvco_max = 2400000000;
   118		unsigned long fvco;
   119	
   120		/*
   121		 * Combined output divider range:
   122		 *
   123		 * ceil(fvco_min / rate) - fvco_max / rate
   124		 */
   125		unsigned int od_combined_min = (fvco_min + rate) / rate;
   126		unsigned int od_combined_max = fvco_max / rate;
   127		unsigned int od_combined;
   128	
 > 129		for (od_combined = od_combined_min; od_combined <= od_combined_max; od_combined++) {
   130			od = int_sqrt(od_combined);
   131			od1 = od_combined / od;
   132	
   133			/* od == floor(sqrt(od_combined)); od1 >= od */
   134			if ((od * od1 == od_combined) && od <= od_max && od1 <= od1_max) {
   135				fvco = rate * od_combined;
   136				rational_best_approximation(fvco, parent_rate, m_max, n_max, &m, &n);
   137				break;
   138			}
   139		}
   140	
   141		*pm = m;
   142		*pn = n;
   143		*pod = od;
   144		*pod1 = od1;
   145	}
   146	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
