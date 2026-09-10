Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2449BD6A;
	Thu, 10 Sep 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047137; cv=pass; b=cxj2I1AZnKyBfTfyCWAiBfgjvcf9xCy3JhprQjL2Vv0G2spcvBsqUxfKxRXTgeHitMU9yXm0orSgm45ymNF9iryCGncma+PaXdoX3g8MMOKDR+BjiBOQVJmkag6J2WwYiguWCa7ZyQMx6oSHouuwsuOugef3kTX36Z/EoUWMZ4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047137; c=relaxed/simple;
	bh=7vm9LXBnBksA7BUFdsEzvRoWR4iuOsiQeSyFd63loFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVNHM0JvcHyHh2m6+D+VcdR5zRreaRUeL4zvFon4I+MZJnJ/M5a6J9TotmS3kbZpdMa2IireF/F5dIim/8NSsDVvPHojKU86w1LkAwl8yDVpvibkNtcmX0hxbGg7j8nbPTxZWdDaohR04JLnO0ItVuF6Hg2Qc1xr/qfW/BicSgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=lgmF7+hd; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="lgmF7+hd"
ARC-Seal: i=1; a=rsa-sha256; t=1789047110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PWleW4TiyktR2f0EHZ9mwGoDojVKJftnewHry74RhnvpGAvtKipeyRDDUoOMARIcxwbFS4jCiyE2/dZquBT5Sufm/j84i8GEW8PjOTJ0KykuDLdvTZ5TBmkYUsAsb51lUkyWiCHaj2+jV9rZzy+k8U5mV6CQ5CYnR8ke+9lxxyQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789047110; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QH+V9w9Z80FoWtzevrNm8AoJe6kQe6v9Q0++V5yLfDs=; 
	b=cY+1fW+XDwvoCBE4MbMYO92tLurFAnByflni2Ex5Ygxhp/emLcfH9IalQZA8wIUcISNEmjmsxSci6/B073aRfE9jEoV68UNCn0zQ75yCeos0TFieIsfhtOVxFQVj2bXcEeIrTNL/DCk25gdIm2/r6YsjGsCChp828H3lVQGo59c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789047110;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=QH+V9w9Z80FoWtzevrNm8AoJe6kQe6v9Q0++V5yLfDs=;
	b=lgmF7+hdb6EFZi7h2f5+cgYne1yz7xjTWBiRWsQ3mii7W1ME9QtCkcjeAtete8yr
	cwPdcrWSRlEJC4MW8wQR5cwxE9zB6wWsSL6iO9XX03uSGdV/XVLtOXcM1ivXoIKgppb
	9ljJhdVT/4nE91vgBBLDqyfhRNNV+3UdQbxQvscs=
Received: by mx.zohomail.com with SMTPS id 1789047108143553.7058137232074;
	Thu, 10 Sep 2026 06:31:48 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:31:30 +0000
From: Yao Zi <me@ziyao.cc>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Yixun Lan <dlan@kernel.org>, Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 4/5] clk: spacemit: reject rate changes to running
 firmware PLLs
Message-ID: <aqKxMmgpFLE3CmQ8@pie>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
 <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.29.40
X-ZohoMailClient: External

On Wed, Sep 09, 2026 at 10:07:04PM +0800, Troy Mitchell wrote:
> CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
> running by firmware can have a zero prepare count, so this flag alone
> cannot prevent set_rate() from reprogramming a live PLL.

Would it be a better idea to simply turn off the PLL before reprogramming,
since protected by CLK_SET_RATE_GATE, re-programming never happens when
the PLL is required by downstream? This also seems to be simpler.

> Check the hardware state and reject set_rate() while either the enable
> or lock bit is set on K1 PLLs and K3 PLLAs. Propagate register read/write
> failures and reject rate requests with no table candidate. Callers must
> still move consumers away and stop the PLL before changing its rate.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Fixes: 3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Best regards,
Yao Zi
