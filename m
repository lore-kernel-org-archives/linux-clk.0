Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524482652A2;
	Tue, 11 Aug 2026 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451427; cv=none; b=RZNF5UTU0AsAbx8jn1tmO4X+c4qHmSsKcA2tEJsAgQ4YeQVpR2aUMaKj9T+BXu+uO28QnpZHwoHOC0DgR0iNxlftud7GY4HBtzidHHy75d929c7nPIF51zpxxaOG8E7vilUoU96huEFXdKgo2wJA26xp3yx/lRrAqAsc6NY5spY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451427; c=relaxed/simple;
	bh=L4wS135raQL9yAvIEjvL2iifjW04RO3yfx34u80Am5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIlrcCAg9sepdXZzSChWd6IL4kdUav6Ps8GYwJ/1E4n5TNRkT6Scgo3Yhz7lunkBk/mRW8syy5EPiTouBFDP3PJSuRccqKTD2EHfngerFFle7dmNQwa0zHzq/R93wtF5fP4cZJozId4fER1JSMakVAxKb3j8y+pPKAHbHLWwz1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEoSaTKo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEoSaTKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786451425; x=1817987425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L4wS135raQL9yAvIEjvL2iifjW04RO3yfx34u80Am5w=;
  b=bEoSaTKoFV5goligV4v3qnAbhoOSAWGarV36a22yHC/lzgM6nN9FBeQG
   veej0NnKtOj4Pt/QxZBFfkiipwHfJjnGIWU1gV75bemXfKGjONYTq6Bv+
   gSgJkUSDMhG8kVDAknX9mrStMTaczsT3OJtPGTwiVNTgx2lOd0+aslHOt
   pNCGUN0zrDk8nGy2atd1FwSrRTqVj2BhlIYUlYPa2rB7KwOVFpVSAilQa
   MHm6xjueUWobBmB/UTGgfRtwFH/jViP2kvdH2+xc/mzWH8Nl/qP+QEoQi
   SK3nlICTXqqegt7qe5dj1ArMPTV/D4bnE3wFZtH4k4dq6fT3rXuQDav/M
   w==;
X-CSE-ConnectionGUID: P7DTpMIFR2+kR+uEXWmBCg==
X-CSE-MsgGUID: WVkQuZuBRp6leb0MEEEvqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86912172"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86912172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 05:30:25 -0700
X-CSE-ConnectionGUID: aJPAxQBaQnmYcbqPVa9myA==
X-CSE-MsgGUID: U+QPQXIkRkmd55u5z7lVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="262014516"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Aug 2026 05:30:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtlca-00000000OlK-1eYp;
	Tue, 11 Aug 2026 12:30:20 +0000
Date: Tue, 11 Aug 2026 20:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	David Lechner <david@lechnology.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] clk: davinci: add COMPILE_TEST support
Message-ID: <202608111912.YS4Vg7Jh-lkp@intel.com>
References: <20260719214214.726826-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719214214.726826-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v7.2-rc7 next-20260807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/clk-davinci-add-COMPILE_TEST-support/20260810-131535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260719214214.726826-1-rosenp%40gmail.com
patch subject: [PATCHv2] clk: davinci: add COMPILE_TEST support
config: xtensa-randconfig-r051-20260811 (https://download.01.org/0day-ci/archive/20260811/202608111912.YS4Vg7Jh-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608111912.YS4Vg7Jh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608111912.YS4Vg7Jh-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
>> xtensa-linux-ld: drivers/clk/davinci/pll.o:(.init.literal+0x10): undefined reference to `of_da850_pll0_init'
>> xtensa-linux-ld: drivers/clk/davinci/pll.o:(.rodata+0x1178): undefined reference to `da850_pll0_init'
>> xtensa-linux-ld: drivers/clk/davinci/pll.o:(.rodata+0x1194): undefined reference to `da850_pll1_init'
>> xtensa-linux-ld: drivers/clk/davinci/pll.o:(.rodata+0x12a0): undefined reference to `of_da850_pll1_init'
   xtensa-linux-ld: drivers/clk/davinci/pll.o: in function `__da850_pll0_of_clk_init_declare':
   pll.c:(.init.text+0x1e): undefined reference to `of_da850_pll0_init'
>> xtensa-linux-ld: drivers/clk/davinci/psc.o:(.rodata+0x6b8): undefined reference to `da850_psc0_init_data'
>> xtensa-linux-ld: drivers/clk/davinci/psc.o:(.rodata+0x6d4): undefined reference to `da850_psc1_init_data'
>> xtensa-linux-ld: drivers/clk/davinci/psc.o:(.rodata+0x7e0): undefined reference to `of_da850_psc0_init_data'
>> xtensa-linux-ld: drivers/clk/davinci/psc.o:(.rodata+0x8a4): undefined reference to `of_da850_psc1_init_data'
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
