Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD0375F9A
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534378; cv=none; b=F5v4yf9YwlQbX13NjJz5Pj4gGd/EXcVgYXnx338UrhTuX9aMYBIwDMvvKme+jO+qcHWGfqYohCuyuLjFe/532K00eYhYk+gTRLv5NTn1ayvL+a5oYijyheQ10duRbxQlk2V1Qh6GNK11IXr3jdQfwHwk7q44a9CxphbY2cABQPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534378; c=relaxed/simple;
	bh=0p1MucUCBy9HlnC2t/Ylb4wiPxkTu5iCplhs+cOZep0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEdKzy9t99a/8MCoMMUb2nWBq42JyzJ6NKU3JNhCAmwhjR7zM/tVQ673ci0EfP06qUvlzCOddn0q7tZt8032ngtv0Ixeya0wYsw42n7XapZ8K+9Qpez5r+rJLSwtys/rx2iKg9N+lCUhT0ydFSJuIfZ1K2v16GJ0q3anpc9wZsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzcAzESr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzcAzESr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534376; x=1807070376;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=0p1MucUCBy9HlnC2t/Ylb4wiPxkTu5iCplhs+cOZep0=;
  b=jzcAzESrw090vMLewaCUC3bRXLvNPVbqPY/VixeeKokytMXP5w3anvfM
   3RPJ5qbCRfvJOTqKk7HuFiYU7pv9daDBW1/0bUhO+5uVBy5EOOsZngO8i
   uQw9D9Fsyc+6j4IW4I8Loy3CEcnEFgfdGoJ2990B4O9CwYPtxim5Lyy0R
   Mehud9v+5zoDDwmLHrCm/ErG+R+iJdHtm4LiCLrRoxXRMR+Is5UF952We
   LzsdUMgmDX1TysLs+bSKisvrVEC5KxTsw5MAVQ1jVlr+ORlD3UphelJab
   Q5JNL7hQUeBsdpYbW+rXqVWekXKkucbllPggR6xMcRUWRGE5SDIVBt19s
   Q==;
X-CSE-ConnectionGUID: tI1KQZSUTYCukEfgXIRtvA==
X-CSE-MsgGUID: VamP2UGPQ42pagx8wIXnEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76204313"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76204313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:59:36 -0700
X-CSE-ConnectionGUID: QIRvG/KIRL6UJUCbizKSkw==
X-CSE-MsgGUID: xzUm/JGvTCepmp2TeCUFjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251193014"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:59:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xbB-0000000006f-15VW;
	Tue, 07 Apr 2026 03:59:33 +0000
Date: Tue, 7 Apr 2026 11:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: mvebu: use kzalloc_flex
Message-ID: <202604051615.3w1LlikE-lkp@intel.com>
References: <20260402002011.89926-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402002011.89926-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v7.0-rc6 next-20260403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/clk-mvebu-use-kzalloc_flex/20260405-093941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260402002011.89926-1-rosenp%40gmail.com
patch subject: [PATCH] clk: mvebu: use kzalloc_flex
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260405/202604051615.3w1LlikE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051615.3w1LlikE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051615.3w1LlikE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/mvebu/common.c:289:1: warning: unused label 'gates_out' [-Wunused-label]
     289 | gates_out:
         | ^~~~~~~~~~
   1 warning generated.


vim +/gates_out +289 drivers/clk/mvebu/common.c

a97fbc3ee3e2a53 Thierry Reding        2025-10-29  236  
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  237  void __init mvebu_clk_gating_setup(struct device_node *np,
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  238  				   const struct clk_gating_soc_desc *desc)
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  239  {
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  240  	struct clk *clk;
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  241  	void __iomem *base;
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  242  	const char *default_parent = NULL;
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  243  	int n;
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  244  
f571053152f6607 Thomas Petazzoni      2014-11-21  245  	if (ctrl) {
7fbb639aea35383 Colin Ian King        2019-04-16  246  		pr_err("mvebu-clk-gating: cannot instantiate more than one gateable clock device\n");
f571053152f6607 Thomas Petazzoni      2014-11-21  247  		return;
f571053152f6607 Thomas Petazzoni      2014-11-21  248  	}
f571053152f6607 Thomas Petazzoni      2014-11-21  249  
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  250  	base = of_iomap(np, 0);
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  251  	if (WARN_ON(!base))
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  252  		return;
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  253  
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  254  	clk = of_clk_get(np, 0);
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  255  	if (!IS_ERR(clk)) {
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  256  		default_parent = __clk_get_name(clk);
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  257  		clk_put(clk);
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  258  	}
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  259  
c3d0c641ee00fc0 Rosen Penev           2026-04-01  260  	/* Count, allocate, and register clock gates */
c3d0c641ee00fc0 Rosen Penev           2026-04-01  261  	for (n = 0; desc[n].name;)
c3d0c641ee00fc0 Rosen Penev           2026-04-01  262  		n++;
c3d0c641ee00fc0 Rosen Penev           2026-04-01  263  
c3d0c641ee00fc0 Rosen Penev           2026-04-01  264  	ctrl = kzalloc_flex(*ctrl, gates, n);
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  265  	if (WARN_ON(!ctrl))
f98d007d332b819 Jisheng Zhang         2013-08-23  266  		goto ctrl_out;
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  267  
c3d0c641ee00fc0 Rosen Penev           2026-04-01  268  	ctrl->num_gates = n;
c3d0c641ee00fc0 Rosen Penev           2026-04-01  269  
87e392164ab6c0f Mike Turquette        2014-08-27  270  	/* lock must already be initialized */
87e392164ab6c0f Mike Turquette        2014-08-27  271  	ctrl->lock = &ctrl_gating_lock;
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  272  
f571053152f6607 Thomas Petazzoni      2014-11-21  273  	ctrl->base = base;
f571053152f6607 Thomas Petazzoni      2014-11-21  274  
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  275  	for (n = 0; n < ctrl->num_gates; n++) {
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  276  		const char *parent =
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  277  			(desc[n].parent) ? desc[n].parent : default_parent;
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  278  		ctrl->gates[n] = clk_register_gate(NULL, desc[n].name, parent,
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  279  					desc[n].flags, base, desc[n].bit_idx,
87e392164ab6c0f Mike Turquette        2014-08-27  280  					0, ctrl->lock);
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  281  		WARN_ON(IS_ERR(ctrl->gates[n]));
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  282  	}
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  283  
a45184099affdd5 Sebastian Hesselbarth 2013-05-11  284  	of_clk_add_provider(np, clk_gating_get_src, ctrl);
f98d007d332b819 Jisheng Zhang         2013-08-23  285  
a97fbc3ee3e2a53 Thierry Reding        2025-10-29  286  	register_syscore(&clk_gate_syscore);
f571053152f6607 Thomas Petazzoni      2014-11-21  287  
f98d007d332b819 Jisheng Zhang         2013-08-23  288  	return;
f98d007d332b819 Jisheng Zhang         2013-08-23 @289  gates_out:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
