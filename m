Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D5C2E7180;
	Thu, 19 Mar 2026 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908183; cv=none; b=s+3DhGmj46+qfPOafRfKv0oQRzjIarSKHAJZAeQdhxgmhlqgiYF0S+KDGSGm6GmDwbpwMye8c4gRNC/VGyDl8+aht3fZ5+wnLLceJ08d6/fyx4YwitSXh2lvvS1UEVJ1bghBPLidcprZL9bapYcA5RWy9pJop977Yv4IliMNlHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908183; c=relaxed/simple;
	bh=r3IeYS8hW1srdAKxbHBU3Z1pFg9Grc+Dt8XhxBV4PL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kix/1jZ3Iz9jn60z9ghLPm2V2hkweBbVZw30jrFJ1yrFGRXmYTFm0+ZuJz703o8Sc/e+6szDHvEqCNMr0YF3vDO/tfm+1Jq3hm3doj7ceHmisdyG2DppsM0z4DhK0vR81LRnAaOeHwnttuzytNFc+zKaZhaUZhZrCSkcJ/s2cW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VG+w61xT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG+w61xT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773908180; x=1805444180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r3IeYS8hW1srdAKxbHBU3Z1pFg9Grc+Dt8XhxBV4PL8=;
  b=VG+w61xTgp3FXOVV2vorRb2ehfI8Tmq2ucDB2SjcO37IHALYMjsJJl9K
   tE8zWRKgmWerLy65j0oeKRP5IS+nGkQJZeo3vTD3LBd8M7QQMMeN05G9G
   GNPPhWAqj1wu98I8gZMifiN4JAj6d/AQhibao/YlL5z6Lk0PLX//g2o52
   fZsCBCgwG6eKrdV0y+75BPDI3W/o1fDTNl/K+JFZusYeyiXiuZtb7KK4q
   LMQjMeRNAhxoAkIIGielnzB8iRnP0vX2+XpVK8uzuvpulBYmhCJCW8s6R
   eT1MlCvi4Y+TMdqkLCz6Rfue2p04+hUX78Y08nf3yjQcPZOP3hZ4W7nVM
   g==;
X-CSE-ConnectionGUID: h+aYAs8iSseS03QJFw7kCw==
X-CSE-MsgGUID: jSd1vJmrQUyvvp0Tt+4z6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85602415"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="85602415"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:16:20 -0700
X-CSE-ConnectionGUID: KcOGHWmzS4ySIdEvVBXEOg==
X-CSE-MsgGUID: bnCQ+ctGTx+SvZsKF8aOnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="220294281"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Mar 2026 01:16:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w38YB-000000004nd-3SRY;
	Thu, 19 Mar 2026 08:16:15 +0000
Date: Thu, 19 Mar 2026 09:15:18 +0100
From: kernel test robot <lkp@intel.com>
To: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH 1/2] clk: Add clock controller guard
Message-ID: <202603190902.jG6JLJIo-lkp@intel.com>
References: <20260318-feature-clock-guard-v1-1-6137cb4084b7@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-feature-clock-guard-v1-1-6137cb4084b7@bruker.com>

Hi Vyacheslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4f3df2e5ea69f5717d2721922aff263c31957548]

url:    https://github.com/intel-lab-lkp/linux/commits/Vyacheslav-Yurkov-via-B4-Relay/clk-Add-clock-controller-guard/20260319-151001
base:   4f3df2e5ea69f5717d2721922aff263c31957548
patch link:    https://lore.kernel.org/r/20260318-feature-clock-guard-v1-1-6137cb4084b7%40bruker.com
patch subject: [PATCH 1/2] clk: Add clock controller guard
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603190902.jG6JLJIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190902.jG6JLJIo-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/clk/clkctrl-guard.c: 16 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
