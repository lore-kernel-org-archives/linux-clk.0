Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083758;
	b=V+CrOGuoEfF9bC8dRSK5zP0unYyRCv3uvJ/D8QjkherCiy8+HwjsPQmGqHaBhuOlpOVX
	 0EI4le1ZTfbfsOCBiRyOwCX3GofncvP67I4o83+5A4fMj+YkUvNKid3e+LWrAP+6y+pT7
	 WVybBqVcmYcVaKn4JtvtcMaT5z8jHrOKG7ESFV+YyeISaYz2SjNsCSSEyaJNXcZtOou+y
	 Ijxfn2ZGFhb7jOGVwYEXphON2IVQzGUtIRudm4xZ8FWPXGJ5/u53zKMMkuw/Bf+8kRwXE
	 Y+ImT+JXvBxrN/EKIea5p7ayjTwB/6RMLLt1PokuzsV0thq6DDgAMt/TwSKuwn95Afw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=/6d8JpJvsm5E+CxxvIOJP8Z2ErAigEBUqVsjQpPuLoU=;
	b=bACdqf/EHwuwVNcEdqcChC9c+uZYPBONcqVYwB5J2k8x1iN2dwet3Gim2F+PobPyGXQQ
	 fD3P3U7wIB71gBDl4ogme/t/49I7hIGRUrESKWCFy1W0wfYbHcfaeHyjs48FIwGR+qP/1
	 kz6YHuawxMeRdcICVMd6TCWEgTnBbcRCSz65jDmZVa5bF6/r3ajutTu7uyUG2SJ6HAOJ+
	 vtT2hrUPx7VkDSQdyOD/kEU1r8+2H7YYLS4Wdh8/yMO4nunN37kWHR7tjmC1G34eN7eXk
	 CaIKJkUAIT6Cibzc3FmTiGNtzk+cwf/xXPCgWlOJQbrMjXMpZsYbelStUdV4B5oqopQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWjn9KWH;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC4606A320;
	Thu, 19 Nov 2026 10:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWjn9KWH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795083757; x=1826619757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sxqRokLTTP1WzLKQkGtBUXqw1JiewEaY5o+OWISfVtU=;
  b=lWjn9KWHUe/gVt9dZCB/F7gndvUukupi1Kj8Md7yJjDAiyAtsJ0DC3wi
   wWYFLeERJxfsD3VSF+xgfaDvgMjs+w/ASrsZVYp1JoFELXVevzO6BYJqz
   4uSAGBcObhbj+ETklXPGRpf3cUT1lG4j/N3r21kSd2YY7kicUOiTq0koD
   NeJHlpqQLY7blshYyh7NI0JNbPul++n7YiS5M2b7XWT5+csq4UvR7KfMS
   pRuWNHoQP8p/p+99Da1EOj1vfmVlyzq+LK/IbhDDq6WLKL6jN8000rSJn
   5ZlMnjRQZHkPn3XGwbZQnkK0gTp6IJxTkNlTWTq7vKShwdxyasMG8lKa5
   g==;
X-CSE-ConnectionGUID: VaEIFkP2ROucnPDjwUuRCA==
X-CSE-MsgGUID: cYgSYDRjTNeGJ1kB50POHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3966033"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3966033"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 02:22:36 -0800
X-CSE-ConnectionGUID: 12qW9BOATrS2WfXj5AnY4Q==
X-CSE-MsgGUID: 5EN8y2AHQxerqRKpFqhD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10731979"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 02:22:32 -0800
Date: Thu, 19 Nov 2026 12:22:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Brian Masney <masneyb@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 4/6] clk: ambarella: add CV75 RCT clock controller
Message-ID: <av7N5VMXS6OiNYrh@ashevche-desk.local>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
 <20261119-cv75-soc-v12-4-e5a03cca8b05@ambarella.com>
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
In-Reply-To: <20261119-cv75-soc-v12-4-e5a03cca8b05@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 19, 2026 at 06:13:22PM +0800, Long Zhao via B4 Relay wrote:
> 
> Add a table-driven CCF driver for the CV75 root clock tree. Register
> the core PLL, AHB/APB fixed factors and UART0 composite clock, with
> osc supplied via clk_parent_data.

...

> +config CLK_AMBARELLA_CV75
> +	bool "Ambarella CV75 RCT clock controller"
> +	depends on ARCH_AMBARELLA || COMPILE_TEST
> +	default ARCH_AMBARELLA
> +	help
> +	  Say Y here to enable the Ambarella CV75 RCT clock controller.

Tell a bit more when it's required. For example, if it's necessary to boot the
system or if it's just a bunch of some peripheral clocks that don't affect any
basic stuff. Note, checkpatch complains if the help text is less than 3 lines.


...

> +static const struct cv75_pll cv75_plls[] = {
> +	CV75_PLL(CV75_GCLK_CORE, "core", 0x000, 0x004, 0x100,
> +		 0, &cv75_ccu.core),
> +	CV75_PLL(-1, "pll_enet", 0x520, 0x524, 0x528,
> +		 0, &cv75_ccu.enet),
> +	CV75_PLL(-1, "pll_sd", 0x4ac, 0x4b0, 0x4b4,
> +		 0, &cv75_ccu.sd),
> +};

Now it can occupy less LoC.

static const struct cv75_pll cv75_plls[] = {
	CV75_PLL(CV75_GCLK_CORE, "core", 0x000, 0x004, 0x100, 0, &cv75_ccu.core),
	CV75_PLL(-1, "pll_enet", 0x520, 0x524, 0x528, 0, &cv75_ccu.enet),
	CV75_PLL(-1, "pll_sd", 0x4ac, 0x4b0, 0x4b4, 0, &cv75_ccu.sd),
};

-- 
With Best Regards,
Andy Shevchenko


