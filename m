Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A26D3F0AAD;
	Fri, 11 Sep 2026 06:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106981; cv=pass; b=PXiyuiTBXfOshrtR6E9TJu4SVh3IptIcWqK/NYGVjQkiGrgFCItjHNevLSeMz4Xgv1nuRMPDR9WQvcjx0DSheaa/UuD4fILz7inw6bYZus4wj6XSphk+SbcIK7nwsIGYdFfp+YMQ8xi8kCz7VRWFmZK8nDLmOvmNa1glE0fAWds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106981; c=relaxed/simple;
	bh=lXI6Xn+i8JvmZ2r1sj3SEtFizb9NlaHcaZbdD/xGw3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d69o3SmQkq2Tsv9hDbJSsAtI/YHVdp5/ppuWqYW8EWTDjPQpEstPqPdV23STKsg+O3phhq9csQ+UIYbqVyM4xC7flj6zsmuq8icKT0GBXlkS1gDr8o4hIXaRJG9J13bD8oD+4msfB6/V3C9yc4qgSQJnPglT3nnPFDWAsZpw6bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=EKdB/M5Y; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="EKdB/M5Y"
ARC-Seal: i=1; a=rsa-sha256; t=1789106942; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MOdMMOA11nW6/J/W5UFmtmBK+Myeyrj9e4toNDjwVC6ozieasXr3f+Gddaim3g2OZAeFQRJuU9UugusvP3HdfByrZlAmNZWcOXjgFJtqD92zPZaMFi5AglvCYPahR33kuXXLGs85Gqjlu0O4EEZXQH2Gq+0QzzGjyCyDcOIzm10=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789106942; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BzCWIm9SHWefUAfRNuRqKetUCaMam98cRazVY0T6n/Q=; 
	b=EHNXosPFiWD9gKtKX/rOoy0Aq0RPTa+lAyRI71yFewPwzVx6jrDCVloWAUhP33D+iJt3uLW1y7V0zdgvbqcWqRloTYD5oWMJXbtPMhKTNk8Q8jmVf3N8WBkK3VNbrYNxYgkT1MtxqYxU+FF+XMRRcjjyjxG+Itzu1xIpHWCJqYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789106942;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=BzCWIm9SHWefUAfRNuRqKetUCaMam98cRazVY0T6n/Q=;
	b=EKdB/M5YRvPU4+d8P1+0AhgvguH8AVpGPwkMhjr+oAKdaz9S/KDjP3JkjXaerv4T
	NcbFZiYWds6qL9sDauM0YUpxpUAh2fnAMC0HyvxzAfF60bkx76FTbC2cA8hDqbrHclM
	Jxph0tnkk2lAiivc08DiQjMWfOyMwspreIS5IBqA=
Received: by mx.zohomail.com with SMTPS id 1789106940627378.773449342185;
	Thu, 10 Sep 2026 23:09:00 -0700 (PDT)
Date: Fri, 11 Sep 2026 06:08:46 +0000
From: Yao Zi <me@ziyao.cc>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
	"Yao Zi" <me@ziyao.cc>, "Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>,
	"Yixun Lan" <dlan@kernel.org>, "Alex Elder" <elder@riscstar.com>,
	"Inochi Amaoto" <inochiama@outlook.com>,
	"Haylen Chu" <heylenay@4d2.org>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] clk: spacemit: reject rate changes to running
 firmware PLLs
Message-ID: <aqOa7jnonuXhUoy5@pie>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
 <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
 <aqKxMmgpFLE3CmQ8@pie>
 <DLC48RE9YAU6.1YO47FZILOUWJ@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLC48RE9YAU6.1YO47FZILOUWJ@linux.spacemit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.97.79
X-ZohoMailClient: External

On Fri, Sep 11, 2026 at 10:02:47AM +0800, Troy Mitchell wrote:
> On Thu Sep 10, 2026 at 9:31 PM +08, Yao Zi wrote:
> > On Wed, Sep 09, 2026 at 10:07:04PM +0800, Troy Mitchell wrote:
> >> CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
> >> running by firmware can have a zero prepare count, so this flag alone
> >> cannot prevent set_rate() from reprogramming a live PLL.
> >
> > Would it be a better idea to simply turn off the PLL before reprogramming,
> > since protected by CLK_SET_RATE_GATE, re-programming never happens when
> > the PLL is required by downstream? This also seems to be simpler.
> Then assigned-clock-rates on the PLL provider node?

Protecting PLL from rate-changing when it's enabled, and re-programming
the PLL to a recommended rate, are separate goals. This review comment
only focuses on the former (i.e. changes in this patch).

> I tested this
> on K3: .set_rate() was called during provider registration, with PLL3's
> prepare count still zero while the CPUs were running on it. Disabling
> PLL3 hung the board. CLK_SET_RATE_GATE therefore does not protect users
> that CCF has not yet accounted for.

I think it's caused by asynchronous probing. The APMU controller might
probe and register clocks after the PLL one, so the prepare/enable
counters of the PLLs might not match the reality during the gap.

> 
> -- 
> Troy Mitchell
> 

Best regards,
Yao Zi
