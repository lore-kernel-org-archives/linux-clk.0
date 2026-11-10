Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319921;
	b=07fUMffk/BMRFMyJN1hRce+8lEk5ylNBfqZLnDrFilE9LtYjDneKTOrnomgT54z/m2Et
	 ojkbSRNx56dmpG/C5X4eOPW9GRKr+zDqjKjYsTu8eRhZvCSQo5uhrkFgJ9YrJbx7K8fbv
	 dRz7Cm3ELzbuaPQoN/u8AlIAD1jZz1DaiG3vQSxcPZmNGx+bQ5LLs9Yy3E11mPXqSUA72
	 vbx5zTOWSd3U722khjQjpcJKASxpe6NZ0XW01q7+t374XTbbhKIMl9OJSp6JQLGNoB+/K
	 efT3aCqip6LRbxmN6pxabtipkJe+YLXbpGrXcoIgTlnPvPKQDPkyy6PzdoByF6W9pdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319921;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=JRlTB/Oq0MlZ1FntrVFpPEXr0i4FFsjXVYH+2p/mtY8=;
	b=FrJF6sYlnhGPEPlrcPt6tU1TLuEI7y2doP++bTsc7MskuVrRmDkM3F1S3PzcFZ5oiXVT
	 QiyTxcwAm1gwKM8ifmv/iy0KCZ4Ur8vUVL8Am+eDdUdgc8M0CbxRw85JzLZathMUAn+wY
	 o9TLfTHXwG0XXhDKlQPrMVWaBL5ifOEGEkYKC8FA29NWDU8/YBBmHKAT2c8CfiZFZHjIn
	 FWpHPSq1Kw5GNA88AQQ+JxgWJQKpEfGCcNDUxHcB3rRepImlu31ksrNuQSQ1sf0ecdmcR
	 oc5LHmZx/ROfktlTLoLRvFPVLyZi8qWm0wqBEenAe92eYHfFZk87tsQJFiXE9sBQdHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="SyA5/nIq";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE62060A380F;
	Tue, 10 Nov 2026 14:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE62060A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SyA5/nIq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794319920; x=1825855920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qNtMH7l1kU6ZZbKE7+CnTRLFKr9x7riNWahstWq+vdw=;
  b=SyA5/nIqpYQmyQOREPRL/ZZ/30ZIyRSDSN29juuIxOzC4+lGHc7miVRt
   c2oLzPeZ4U1EXeLwaxbjPlxtKA1/A1lsmoP45dc8jdRF1gJWjyXgTPO3B
   /D7OhpKoIxD/BZwqehqVmlwETEbSs907G6gTyOY8M0LZIxBKbFcSrFxt0
   YDJDRerxrl1uIhcizRzTVtarhJrnoLHsKVvonSnnNZjStTY49CZbLY5Sh
   aqrRsPxP2vmIDHs/1ovf/pUJGFIVqZDjK3mv4xm8Bf411cMQkE7mezfyJ
   1zFL4Jv7W7xfK9nnvy3Icxf5coouDdpfcG2AUPayAeY0owBr+trTkN8wM
   w==;
X-CSE-ConnectionGUID: FouLpKS8TueSSkTrllyUZg==
X-CSE-MsgGUID: bm5IsMSnRqWb6rnUreIdJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3056122"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3056122"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:12:00 -0800
X-CSE-ConnectionGUID: 9jp5mXF7SQ6yZQExcMRuPA==
X-CSE-MsgGUID: FjuImkjfRqe1iQ4XjmnGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8303202"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:11:55 -0800
Date: Tue, 10 Nov 2026 16:11:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avMmKJpczepWTRdc@ashevche-desk.local>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10>
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
In-Reply-To: <avMM8z-LYncKS8ip@x1g10>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 10, 2026 at 07:24:19AM -0500, Brian Masney wrote:
> On Tue, Nov 10, 2026 at 09:46:29AM +0100, Arnd Bergmann wrote:
> > On Tue, Nov 10, 2026, at 09:27, Krzysztof Kozlowski wrote:
> > > On 10/11/2026 09:23, Arnd Bergmann wrote:

...

> > > There is a build dependency - DTS needs clock binding
> > > header - so it has to be second, unless the dependency
> > > is decoupled.
> > 
> > Ok, I see. Let's go with Brian's suggestion then.
> 
> I see that the pinctrl driver was merged into v7.4-rc1 and also
> lists ARCH_AMBARELLA. It doesn't cause any build warnings or issues, so
> I'm fine with this too just as long as ARCH_AMBARELLA is going to appear
> in the tree.

We have a bug about dangling / orphaned symbols in Kconfig. It's discouraged to
have them. I dunno if we get the checker patch being applied (it was some
activity a few months ago).

-- 
With Best Regards,
Andy Shevchenko


