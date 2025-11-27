Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2736299924;
	Thu, 27 Nov 2025 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240573; cv=none; b=QnIwOObQ2t0eLOHqy/EEJsWvQXEQbOP60DoLLTQZGVqtejqagfVpcz/+Z5Zuhb+7jnJRwXTaoYl/ny7PlSqWyC/X0C7e3qi/skCBXjNM8c60votGnownNHvNB76zZpVr1l92eKMG1VBafrIowO9rLwVUqZvwU+qNuu2PVzmuF0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240573; c=relaxed/simple;
	bh=OsCOQZ0wJFvLDRxVwe+wdQlNNCsZ4xJwf0WdrLJtB/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ot+2gwWGVuyi7AtSAH9kBlrP2OQqDHm+xKDEwguuaSOuuzn5sclDguTxiEsnktUTuMZY9oPxG1KRL/DhBKFyNso4NtLiZAV9xVICJgNrGTy5UYZNHc1Em0cq2NMg00s6+cUr58zTpxYyb65ZuMz/7w+ihTzG5pTGa8q7kGOf/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjZHlkRx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjZHlkRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764240571; x=1795776571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OsCOQZ0wJFvLDRxVwe+wdQlNNCsZ4xJwf0WdrLJtB/s=;
  b=QjZHlkRxWvr4lDVE8lr6jc5HGZd9XuPsLIWXNcfrB2qBOAI3sVK2ljex
   jFmAkuO+qlYAT9si5fmCiYFxIiIEzm7oo4n37hUfRNfzrbvI3djlhWU6Q
   ahPTcdtfa03Dgzb9spvyArsL4dkh/aiXYuAQhOnivmxs+GCp0rz6UDiL5
   fAEMgJ6mtxf8DV7CP82i5L/DZigRr2cWb2rpK2OPl+DRdEWcYLZRFvS/i
   MyhHyc376AqJC4JKEzqwm1X/qfL9F/4i7MbvlIRfS8GGrHu5jbi2gGmnF
   xOe2gKEjFkioaKzBXmkoMaT/NcjsVlm5R9Opbo9DALcK0ldRPTlW2TUgN
   g==;
X-CSE-ConnectionGUID: logxsTdAQcCYBsMJinSJbA==
X-CSE-MsgGUID: SsMiQWPhR8uTVsXME99Fmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66320605"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66320605"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 02:49:30 -0800
X-CSE-ConnectionGUID: ZKKJGma7SBW3emgtxhsMYQ==
X-CSE-MsgGUID: g1ZU5blmQCa3gmkBY/mMVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192457255"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2025 02:49:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOZZ0-000000004bl-073O;
	Thu, 27 Nov 2025 10:49:26 +0000
Date: Thu, 27 Nov 2025 18:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202511271825.EYuE2LK5-lkp@intel.com>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>

Hi Brian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92fd6e84175befa1775e5c0ab682938eca27c0b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251126-035403
base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9%40redhat.com
patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251127/202511271825.EYuE2LK5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271825.EYuE2LK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271825.EYuE2LK5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler_types.h:617:9: note: in expansion of macro '_compiletime_assert'
     617 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:597:23: note: in definition of macro '__compiletime_assert'
     597 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:617:9: note: in expansion of macro '_compiletime_assert'
     617 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:567:27: note: in definition of macro '__unqual_scalar_typeof'
     567 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:41:34: error: 'SYSCALL_WORK_SYSCALL_TRACEPOINT' undeclared (first use in this function)
      41 | #define SYSCALL_WORK_EXIT       (SYSCALL_WORK_SYSCALL_TRACEPOINT |      \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:42:34: error: 'SYSCALL_WORK_SYSCALL_TRACE' undeclared (first use in this function)
      42 |                                  SYSCALL_WORK_SYSCALL_TRACE |           \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:43:34: error: 'SYSCALL_WORK_SYSCALL_AUDIT' undeclared (first use in this function)
      43 |                                  SYSCALL_WORK_SYSCALL_AUDIT |           \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:44:34: error: 'SYSCALL_WORK_SYSCALL_USER_DISPATCH' undeclared (first use in this function)
      44 |                                  SYSCALL_WORK_SYSCALL_USER_DISPATCH |   \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:45:34: error: 'SYSCALL_WORK_SYSCALL_EXIT_TRAP' undeclared (first use in this function)
      45 |                                  SYSCALL_WORK_SYSCALL_EXIT_TRAP |       \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/traps.h: At top level:
>> arch/x86/include/asm/traps.h:38:26: warning: 'struct math_emu_info' declared inside parameter list will not be visible outside of this definition or declaration
      38 | void math_emulate(struct math_emu_info *);
         |                          ^~~~~~~~~~~~~
>> arch/x86/include/asm/traps.h:45:46: warning: 'struct stack_info' declared inside parameter list will not be visible outside of this definition or declaration
      45 |                                       struct stack_info *info);
         |                                              ^~~~~~~~~~
   arch/x86/include/asm/traps.h: In function 'cond_local_irq_enable':
   arch/x86/include/asm/traps.h:50:17: error: 'struct pt_regs' has no member named 'flags'
      50 |         if (regs->flags & X86_EFLAGS_IF)
         |                 ^~
   arch/x86/include/asm/traps.h:50:27: error: 'X86_EFLAGS_IF' undeclared (first use in this function)
      50 |         if (regs->flags & X86_EFLAGS_IF)
         |                           ^~~~~~~~~~~~~
   arch/x86/include/asm/traps.h: In function 'cond_local_irq_disable':
   arch/x86/include/asm/traps.h:56:17: error: 'struct pt_regs' has no member named 'flags'
      56 |         if (regs->flags & X86_EFLAGS_IF)
         |                 ^~
   arch/x86/include/asm/traps.h:56:27: error: 'X86_EFLAGS_IF' undeclared (first use in this function)
      56 |         if (regs->flags & X86_EFLAGS_IF)
         |                           ^~~~~~~~~~~~~


vim +38 arch/x86/include/asm/traps.h

da654b74bda14c include/asm-x86/traps.h      Srinivasa Ds    2008-09-23  37  
d315760ffa261c arch/x86/include/asm/traps.h Tejun Heo       2009-02-09 @38  void math_emulate(struct math_emu_info *);
6ac8d51f01d345 include/asm-x86/traps.h      Jaswinder Singh 2008-07-15  39  
300638101329e8 arch/x86/include/asm/traps.h Tony Luck       2020-10-06  40  bool fault_in_kernel_space(unsigned long address);
300638101329e8 arch/x86/include/asm/traps.h Tony Luck       2020-10-06  41  
6271cfdfc0e473 arch/x86/include/asm/traps.h Andy Lutomirski 2016-08-30  42  #ifdef CONFIG_VMAP_STACK
44b979fa302cab arch/x86/include/asm/traps.h Peter Zijlstra  2021-09-15  43  void __noreturn handle_stack_overflow(struct pt_regs *regs,
44b979fa302cab arch/x86/include/asm/traps.h Peter Zijlstra  2021-09-15  44  				      unsigned long fault_address,
44b979fa302cab arch/x86/include/asm/traps.h Peter Zijlstra  2021-09-15 @45  				      struct stack_info *info);
6271cfdfc0e473 arch/x86/include/asm/traps.h Andy Lutomirski 2016-08-30  46  #endif
6271cfdfc0e473 arch/x86/include/asm/traps.h Andy Lutomirski 2016-08-30  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
