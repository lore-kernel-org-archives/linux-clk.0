Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBD4195F17
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721123694; cv=none; b=bUjw8CeBD0QSIKabM+dO2awucE+ocgJlSklO1AM3U3SrUypeTFwNNJ3l3H7fTnCGzHPKyVCnI5jSvF+Y3MV9iR5SSjyp0EO15V+KKS0prP6KHUxIahTQ/x/XICOpQH9nisKmu31ZTZoLB85WZg+F+1sbX5ET7+P6ztSH0xF/mMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721123694; c=relaxed/simple;
	bh=ZPb5imWfzGDWAAu2GyDOPfBLXm3faEwF4zRISOWssjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekYnnT3XyPZ/3fnTAm78AoMGy6Umuuzqokuty3BW2GCd7v9mMJ8E0Xt0FTLpiTn0PjQ3RqEDwSeu5ofVLm1uHcdyC5TWNZpxdDOHqN8cl0/zFX9FiQAnL8fmIu16+6AE2Jq4bM2cXiiO9N2h28/2AI5tJf7nPA40BsLcHkE7Oj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfMEffS8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfMEffS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721123691; x=1752659691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPb5imWfzGDWAAu2GyDOPfBLXm3faEwF4zRISOWssjA=;
  b=RfMEffS8jA+jRbg0LqVf1L32qb3rAOHnaQuMO0YQJ1WnDjRJ1SszK9Jc
   k1fiB95zR4qZTBviBbiMecffGXIGMW/39Pyj7X2RVMW/eDlOrKcaIRKcl
   fZQ+rzqBdWhuX+vTPytA/qkfKWR3qqPbM9Pjm121ntP0yDCnAG+5uk6Ek
   0rXqaOXo8/ZJFd6X7e5KkhS/gxSDk7CqSJrOInzS8k9OXszKaPnNBb95u
   UqZaWZElhEp5AiQHKkHkQy5oXvJ1GNm1rfnA2YEK2QJVLqN4zOo+YLyf/
   rJWHZ/TxTxQkFuRTKMQFI4bbYy7lCGZFDYRTdnI/GlARUXNonro0vHGdI
   g==;
X-CSE-ConnectionGUID: zZS6gQaTSyaff57PTMhlBQ==
X-CSE-MsgGUID: MTPrI4prT/WNAm1uurzcbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="21462921"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="21462921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 02:54:50 -0700
X-CSE-ConnectionGUID: Up+zKD7xTg2MmG728Q/ZMQ==
X-CSE-MsgGUID: BMrmQZyKTwmYNPrUkDcEvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="50342627"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jul 2024 02:54:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTetS-000f6Y-1a;
	Tue, 16 Jul 2024 09:54:46 +0000
Date: Tue, 16 Jul 2024 17:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	David Gow <davidgow@google.com>
Subject: [clk:clk-kunit 10/10] ERROR: modpost:
 "__dtbo_kunit_clk_parent_data_test_begin" [drivers/clk/clk_test.ko]
 undefined!
Message-ID: <202407161711.qDtiW4s1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-kunit
head:   9f8bbc66021282d0646d1f8422265c72e671b5d1
commit: 9f8bbc66021282d0646d1f8422265c72e671b5d1 [10/10] clk: Add KUnit tests for clks registered with struct clk_parent_data
config: i386-randconfig-001-20240716 (https://download.01.org/0day-ci/archive/20240716/202407161711.qDtiW4s1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407161711.qDtiW4s1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407161711.qDtiW4s1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/time_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example-test.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/kunit_clk_parent_data_test.dtbo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/kunit_clk_parent_data_test.dtbo.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/kunit_clk_fixed_rate_test.dtbo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/kunit_clk_fixed_rate_test.dtbo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/uapi-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/packet-serdes-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/of_test.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/of/kunit_overlay_test.dtbo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/kunit_overlay_test.dtbo.o
>> ERROR: modpost: "__dtbo_kunit_clk_parent_data_test_begin" [drivers/clk/clk_test.ko] undefined!
>> ERROR: modpost: "__dtbo_kunit_clk_parent_data_test_end" [drivers/clk/clk_test.ko] undefined!
ERROR: modpost: "__dtbo_kunit_clk_fixed_rate_test_begin" [drivers/clk/clk-fixed-rate_test.ko] undefined!
ERROR: modpost: "__dtbo_kunit_clk_fixed_rate_test_end" [drivers/clk/clk-fixed-rate_test.ko] undefined!
ERROR: modpost: "__dtbo_kunit_overlay_test_begin" [drivers/of/overlay_test.ko] undefined!
ERROR: modpost: "__dtbo_kunit_overlay_test_end" [drivers/of/overlay_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
