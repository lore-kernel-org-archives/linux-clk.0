Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A3B436BC6;
	Tue,  4 Aug 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831068; cv=pass; b=DjSBti6igX+vvi5OdDg+LZm6q3F1xYPF/tYfbRKLb9B0TCaP9eFbc42poIdFs/V+U+vz/7Jt3gm/+LcPRlzejs7Ee+0sTwmI4M4FybmGMOZUqXS2QyFQD5GOrb+vcAhbo8EPUWXlBWl6LL6udM6ktMPWbfDRyTG2yOS73ZoHuBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831068; c=relaxed/simple;
	bh=6iE1had4Tg/gR0N8etf03PCwEV/trK2r9t6ymr9IPEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GacXaN2FSonCsNbDBFrpZKEh699Vreq46ER/pu9ndfNhcwxWyyKFhrZ7oBkfT0NiexUidbPv7ejskg/9Mpn/s6/JJmdD+bMrQM2JsXWT4cHljuWl413AWD9q1dpPiXejLSQvkjQpnRTtPyFoEddED2mi9xpCZRLgpGTNrMNkcSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=ak86VaXI; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="ak86VaXI"
ARC-Seal: i=1; a=rsa-sha256; t=1785831029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QLFfD1V+4nQg5tkAgOyb25zWmDiwfVkh8QfkmFdrnqGMcSwbIwPPlhAEo3ufL4bhC0xieYoX+UbpBE4xWj8Ol5hJ4T6CliKdqgWlraL3tAuylSRDfdCPfPsyi8nOXkzLvNg4tYBRDPfuKSDUkWRCJLE+6ZYxq3i2TflWI67SGUA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785831029; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6iE1had4Tg/gR0N8etf03PCwEV/trK2r9t6ymr9IPEg=; 
	b=KwbX9K3oE2geWJjVPNeiMO56FgO9ztodEKLXzVYpB8HTUdTwS3bAt5iiJ7K+dROFUfGO2h4CBW3bLslrAQ7Y3OpddqDvV+ZM3SuQSr74Yukc5YUon4OyR4Un1WwQsqduui3RbblU8Bqj90ec2e8YKB9uM8kjykW8RibsEbmRtmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785831029;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=6iE1had4Tg/gR0N8etf03PCwEV/trK2r9t6ymr9IPEg=;
	b=ak86VaXIIMkrnmk5pJ98XNGP4niTPwXb6zjaTL2AwzA38i4LpOW0EmyWXPaPOW7U
	GsmdOEkx3f/xTNLuS21iA2fOgVHpWni1e0yeRAOouIe14Hs9TELcShb6MezcOoyvz+m
	dTd9rpoeYXJfBUppxrEZYgFaPlOTQkJGz+3CWCXc=
Received: by mx.zohomail.com with SMTPS id 1785831026677755.103961666094;
	Tue, 4 Aug 2026 01:10:26 -0700 (PDT)
Date: Tue, 4 Aug 2026 08:10:14 +0000
From: Yao Zi <me@ziyao.cc>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 1/2] clk: spacemit: re-enable PLLs after init
Message-ID: <anGeZk0-YShccqwE@pie>
References: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
 <20260804-k3-pll5-pll8-1800mhz-v1-1-a3a75866ce32@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-k3-pll5-pll8-1800mhz-v1-1-a3a75866ce32@linux.spacemit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/285.815.77
X-ZohoMailClient: External

On Tue, Aug 04, 2026 at 12:02:55AM -0700, Troy Mitchell wrote:
> The PLL and PLLA init callbacks gate off and reprogram a PLL when its
> firmware configuration is absent from the rate table. However, they
> leave the PLL gated off after updating the registers.

I don't think this patch makes sense.

If this PLL is essential for some components of the systems to work,
there's no chance to re-program it safely after the kernel gets started,
since all the PLLs in K1 and K3 are specified as CLK_SET_RATE_GATE.

If the essential clocks could be re-parented glitchlessly, registering
a notifier and re-parenting it before the PLL disables might be a
solution. In this case, we need to delay the operation in
ccu_pll*_init() until clock registration fully completes.

Otherwise, re-enabling the PLL seems totally extra here, they could be
enabled on the fly when it's going to be used.

> Re-enable the PLL to complete the sequence and propagate any lock
> timeout to clock registration.

Regards,
Yao Zi

> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Fixes: 3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
