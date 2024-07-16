Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E2837143
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 07:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721115936; cv=none; b=LsCGXqFUKONMmnCWpzrNmNSTzAJb8k+xEbMl+8OkxEtmh8vex23OjLM/rgwyZu0eCovOuoWVPyFdbJSNhwaBTe3XluQ7NDqH55SQqy1vvNrr/CyaTWjC/U3Hzm0ytXOUsERdQoevOQxfUYa8bDWSk+dnXep1PrQquJ/X4yLwHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721115936; c=relaxed/simple;
	bh=QOLjTyNu9QmTi9kAURATDN/kTT2ZRnXtK1CeLFiiCIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIYWev1eJqVP0YE7j5zaMUFkXOju4v+pGRS3wsitZhXenurogqSzMGrNJ6EREAT3ZS55ohWh+4/Ro3VWbmhwOrvkY/x1XYP0HdHOw5F25lMuDlgK+H8BMouIW9ZQ7UccHOfxc4PYiGVCUQ43mU/PcY873FLvDMwD3Lk+CXEVNh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqSf6rsj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqSf6rsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721115934; x=1752651934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QOLjTyNu9QmTi9kAURATDN/kTT2ZRnXtK1CeLFiiCIA=;
  b=bqSf6rsjb1tq0z8kgLXjTMqZja2hfcN/OgN1jcjZl4OMi+d33aCQmr2k
   OP//uGQthKqEP4Uj/PntUqrD06CinJcKwsCtmbAZx/kfESEpbHtGhfqEX
   VRhg9W83DR3TYSAheZJ1APhYIhuhkkoU28iK2n9H9sctv2puqYyOLskq5
   G99HC8NrxPkPRsPjYrtPphRbSoJCAjv2U5euTq1aowDZnJr8txgra5eUf
   9wKd1w1JO8VinnIfbVJ0tcKu5ULAAggOA+PEWC9dh912mHjUqS9v+2P35
   CyxbE8MWdtK7j3JTQLrnniQdkrcR6fLKNx6EkZwZVuox9e/xV79YLJaMc
   A==;
X-CSE-ConnectionGUID: HsXuM0KgSuSc06F8ifxEZg==
X-CSE-MsgGUID: Nnb+llkXRQaBg+FeL68pMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29948503"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="29948503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 00:45:33 -0700
X-CSE-ConnectionGUID: yVg/BbDQRyOnsBoiTZoJCQ==
X-CSE-MsgGUID: Pmd9gcvyRaOGRnTms3N3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="73146095"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jul 2024 00:45:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTcsL-000f1W-0q;
	Tue, 16 Jul 2024 07:45:29 +0000
Date: Tue, 16 Jul 2024 15:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [clk:clk-kunit 9/10] ERROR: modpost:
 "__dtbo_kunit_clk_fixed_rate_test_begin"
 [drivers/clk/clk-fixed-rate_test.ko] undefined!
Message-ID: <202407161539.CA6OYeLn-lkp@intel.com>
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
commit: 077e2382fafec5681f0ca189595b63a3a4952610 [9/10] clk: Add KUnit tests for clk fixed rate basic type
config: i386-randconfig-001-20240716 (https://download.01.org/0day-ci/archive/20240716/202407161539.CA6OYeLn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407161539.CA6OYeLn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407161539.CA6OYeLn-lkp@intel.com/

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
ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/kunit_clk_fixed_rate_test.dtbo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/kunit_clk_fixed_rate_test.dtbo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/uapi-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/packet-serdes-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/of_test.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/of/kunit_overlay_test.dtbo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/kunit_overlay_test.dtbo.o
>> ERROR: modpost: "__dtbo_kunit_clk_fixed_rate_test_begin" [drivers/clk/clk-fixed-rate_test.ko] undefined!
>> ERROR: modpost: "__dtbo_kunit_clk_fixed_rate_test_end" [drivers/clk/clk-fixed-rate_test.ko] undefined!
ERROR: modpost: "__dtbo_kunit_overlay_test_begin" [drivers/of/overlay_test.ko] undefined!
ERROR: modpost: "__dtbo_kunit_overlay_test_end" [drivers/of/overlay_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
