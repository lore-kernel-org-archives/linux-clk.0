Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAFA38E124;
	Tue, 24 Feb 2026 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935125; cv=none; b=Xbz3LvrYqC1Hltv+cZnQ82QAM8UT5ZvTUVmvcMQfxkTMe7HKKmQU0GYfyVjNHi+DgU92qt+F9nC3XlF/KRV74x9e3WZuUry26HChU2rbbYos4gGnr99TC2AADwLakmx1ICnHYIv+GmbHvtENwSB7u5uZJYGcZ0O+CrXjsff+AJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935125; c=relaxed/simple;
	bh=QI6NX28N5fcLaFUiysJcVWpMy5ErvmYspRd2DD5fumY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brSkSBn9+fZeMOhGpNb+ZkElXs4UyKoYnqkbLx4o/uH0KWpO51DxI2KP6Jr4H0ZSH78CoGBxnm/gMuGRVQACoAPIDtk2oornnAsuIr53wXXtkpgFmMA8QiNmWshOE/ZEi426CptuA07m0yP44viBTy5QUa57guYGwBZyIB0heaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5oFmRLs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5oFmRLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771935124; x=1803471124;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QI6NX28N5fcLaFUiysJcVWpMy5ErvmYspRd2DD5fumY=;
  b=G5oFmRLsJYPJBP8Sz6IY20JRi10ibLWBh/u2yj5NSL71Xq9MUQLmMPG0
   GMbnyBaxWSzWa2vOXMiREdwWoGIcaAgVmVMvoPrCLMfdKKwE8vdqPxXIC
   IsMUOUP+FUHSRrC8g9o3zCt8NJ+cA9gf/pTq+lWMNQgH3EOIrKdRPk9Nu
   H4F65CxoreR3WmGUx66VkGYW58vk1neNpUIuz1M/GiKTwc+fgagu0uF48
   ItyJE0HKZCNcVEA6z3leN2xR9WkKJCK+Y0XjwVGaM9IYJLsfK1O3eDi7K
   lcHQFA4zhReaJ5YNs1HIKftQDwK1B6ZLQnRXiIvWPWF/MDJf4fqnPVjpV
   Q==;
X-CSE-ConnectionGUID: OKAS+/geRNCxjI1MIQ6RDw==
X-CSE-MsgGUID: ZpP2O8t+QtSm3z5/VBT7YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72920582"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72920582"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:12:03 -0800
X-CSE-ConnectionGUID: Got761D9Tsekh3muES1nTQ==
X-CSE-MsgGUID: MYmUcr+/T+OfFfYAmrYCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214127531"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 04:12:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 91E0998; Tue, 24 Feb 2026 13:12:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 0/3] clk: x86: lpss-atom: A couple of cleanups and a feature
Date: Tue, 24 Feb 2026 13:09:19 +0100
Message-ID: <20260224121159.3503754-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of cleanups for the clk-lpss-atom driver.
No functional changes intended.

On top of them, one feature is added.

Changelog v2:
- reshuffled code to add variables when it's needed (Stephen)
- added third patch

v1: 20240822161452.1780149-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (3):
  clk: x86: lpss-atom: Use predefined constants from units.h
  clk: x86: lpss-atom: Use temporary variable for struct device
  clk: x86: lpss-atom: Read frequency from the property

 drivers/clk/x86/clk-lpss-atom.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.50.1

