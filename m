Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778747B40D;
	Wed, 29 Jul 2026 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326520; cv=none; b=owXD3waEd0NN5k9i5kXM8fJusaxZ/yvhlzOIXVnfRlTO4k9X0/6FaBirsiZ7r/aRNi5zNh6rPtc58bwq+8/8BtwfOwNzwG/8yF/nNX8ZSKqHEYbJYVi8D5W1ta/OMZwAuuOx/sY46EF6ZVBRnux8xkLj93wCMWKzyUw0N2hKtK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326520; c=relaxed/simple;
	bh=w2DTi4murj2vKpLiI662adWYX3Ihvrtoh/OXug3aI9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ln9A/Ib0kDeHaFHmnEKG162wd9TSSnj0AtK3Oys9cuQ6cSXtc6YiDBe2ds5E9pJrTV9YisoLIQn0R6d5QJsZbPWD3CDVRHCDUmXd2Qoy49W+736ddvI/BpKiNJ5zaQLXm+x0lnFOd0w4kf7Pal52M+A7HlVOgcS3+UiKICyhszE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=LdNVV1QC; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="LdNVV1QC"
Received: from email.seznam.cz
	by smtpc-mxb-6fbd4fd44b-jrm75
	(smtpc-mxb-6fbd4fd44b-jrm75 [2a02:598:128:8a00::1000:910])
	id 389e55fc230cd8283c7bec7e;
	Wed, 29 Jul 2026 14:01:56 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1785326516;
	bh=0cNEBHJ8YypuAMvYccK19bwKBDUcOIjicYfN9f8bbGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=LdNVV1QCopv9mPJPDmq0viRuZJmLqGdbwbpWFP9070AS8V9DyarRZYqxvX7Y/rTM1
	 AFwZhs9PmLfYtOXMjDULoSb5Pn8IxQvskgUE1lyjAnxvcfst4A1ZHSVV8nKk1ELHUc
	 hyGXJE6hrdk3ZEstVkdPkSFSCk13ZtkjPYaHwpJ1paZAlYScfqANDCQmjsaawm1STb
	 JZTU/intlctQoXCA8rqFRhWBAvXpFzy1K2/HYEUuIlb1JobvLMMdFHynDS0U0iEer9
	 GxT1GssBEGGbFjEH8z4iIxq4e/8AXWyOKkBHMKvB+bLcXtebuOQflqNcrcUHYawUj/
	 VZvNyoC9R5g1A==
Received: from localhost (109-81-114-141.rct.o2.cz [109.81.114.141])
	by smtpd-relay-7b8c6c77dd-6k8bg (szn-email-smtpd/2.0.79) with ESMTPA
	id 75d33d37-4aa7-4501-bc9c-48347b9a01c8;
	Wed, 29 Jul 2026 13:58:34 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH v3 0/2] Add support for Si549 programmable clock
Date: Wed, 29 Jul 2026 13:53:08 +0200
Message-ID: <20260729115310.3490589-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds support for Si549 programmable oscillator. It's almost the
same as already supported Si544, except it uses different internal
oscillator frequency.

So new compatible strings are added, and driver data is extended
to carry both maximum output frequency and internal xtal frequency.

Changes in v3:
  Added missing xo_freq member description as found by kernel test robot:

  https://lore.kernel.org/oe-kbuild-all/202607291708.qFSxYL2s-lkp@intel.com/

Changes in v2:
  Fixed obvious stuff found by Sashiko (extra unused struct member),
  removing unneeded data argument to calculation functions, xo_freq
  is now passed in settings struct.

Pavel Löbl (2):
  dt-bindings: clock: si544: add si549 compatible
  clk: si544: add support for si549

 .../bindings/clock/silabs,si544.yaml          | 10 ++-
 drivers/clk/Kconfig                           |  6 +-
 drivers/clk/clk-si544.c                       | 83 +++++++++++++++----
 3 files changed, 76 insertions(+), 23 deletions(-)

-- 
2.53.0

