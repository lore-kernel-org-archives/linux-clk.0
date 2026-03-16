Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB91D514E;
	Mon, 16 Mar 2026 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679841; cv=none; b=aVG1ufLudkufQ3QM+9j1nF8ppATeoulEyZP79ocJphvqk4ZuSL3AvDK5DvJj0NrvKlZBvHL4tKSEgUtLJHZYZXr2LY/OmEDC9wUKivgbZ4q6ElDMWZ29yJsvPfwERJoBDZDUnVOYHN8RmeGfVvXon1V9VdM9hDQzELz708McFV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679841; c=relaxed/simple;
	bh=2dKLFBkPS2Cl4sadTn2RqlfUwE1zv44uEXP1KtOK67c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2ZUD2GdBP63dVcJq/S++mM7lJsVQkU4lndfzcwD6AapC4Jx6k9RAd3bjrpeAlL/ZD1b3v2etg10TFaCfiq0hDedxw0ntCqwaFL7BM1lkuRFOgCT7ASq0AA1e299/reosS659uT08zO9NssbMDpoA97WOPzYwHMvbsvDHGo4ncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkOg8IKR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkOg8IKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773679840; x=1805215840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2dKLFBkPS2Cl4sadTn2RqlfUwE1zv44uEXP1KtOK67c=;
  b=JkOg8IKRKbcAp+Oq3BvNiy3V2J8yjS10LSz5tRucKTCjfMz1j8OxzcBU
   oSLFUa8gg8AnQ//FZu9Xr9kUDCsDhRF1yWn5rM2HbLAltwYEZnLDOCodY
   Pll3U7AO6Q5gnQf1B7uTTnAVz7EgwH1BtGVRsXPoeDPSBQkE7V46j7Rh0
   ayrrHme0vpVZMcNEiNPfd6ILQeawPnCwUT4E6V0c6cVY8330o3zBAjtnK
   pnyXtoS/YngdnWAB7xvFukxQYNmPZRzi14f0qsUshrLkSTaAnHh6cPDuq
   6JrCKb0qxdLwXjjmy+YsMYIGa/CJs2NP5R81LXhUBdVEklu5RqqYh4V+A
   w==;
X-CSE-ConnectionGUID: /PkxiaTgQgiCB7ZBYYYBEw==
X-CSE-MsgGUID: fUunrR/LSPaoQs83v0cP0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74592422"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74592422"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:50:39 -0700
X-CSE-ConnectionGUID: lhtJDUz3SRG9OV9eGLTIgQ==
X-CSE-MsgGUID: zxt3S7hHRTutKhr8HqSJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226653943"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:50:36 -0700
Date: Mon, 16 Mar 2026 18:50:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Chen-Yu Tsai <wenst@chromium.org>, Felix Gu <ustc.gu@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Maxime Ripard <mripard@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL] clk: round one of improvements for v7.1
Message-ID: <abg02kmJvZITPdgx@ashevche-desk.local>
References: <abLV9vjYxXsKciHW@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abLV9vjYxXsKciHW@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Mar 12, 2026 at 11:04:22AM -0400, Brian Masney wrote:
> Hi Stephen,
> 
> Here's a pull for some fixes and improvements for the clk subsystem
> that's been posted over the last month. Details are in the signed git
> tag. I didn't include any new drivers, or changes where it looks like
> there is a submaintainer that typically sends you a pull separately.
> 
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/masneyb/linux tags/clk-for-stephen-round-1-v7.1
> 
> for you to fetch changes up to 5e31ef47fa888c9ce117a85bff6a7df26cb2c337:
> 
>   clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver (2026-03-12 09:45:03 -0400)

Hmm... CLK tree has not been updating for 3+ weeks.
Should we start being worried?

-- 
With Best Regards,
Andy Shevchenko


