Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C316D3EF0C5;
	Mon, 18 May 2026 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102329; cv=pass; b=qHpAMXl+myFgqyG02sfKNYmsNqdEB++UvLqfrrFyesvXdxtzp4k2+QqOgPLmFzJ2gX7jUxqgjFVn9jaxowlMRlscdrAHQLAEv23WRh9A+ZyHxv4MC6R3BBVLByGKM7XaDWI85BqqSZHSkBZGV1mEe38EJVWpsTiHxwCmdOcvPJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102329; c=relaxed/simple;
	bh=xXxWi+o9DH47nHPdoxzPOIMkApvtONEn9s5y/XBJsPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3SdzjKoOnu945SZ0eHMc37xpQB16xkXGr0ADF99R8bvf2wtWcU/KBa3BPYFGZ6IFayR35XM9Z2wX3BudN/WprCnQlbkEWQcCmJr4ALeMpv50nLQtF2vrX1+oz6H7JPmYGfYM3lbkx6kvJYmiWG8MXgOtU4CzvTWUT5dWJpU5Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=aeqFUWAF; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="aeqFUWAF"
ARC-Seal: i=1; a=rsa-sha256; t=1779102291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gn2kIEfJnwoF952tKIfQO+fHEYobNWlBLWQIaDUJeWYWQypX9jSEbCOWUpPb/leEkBY9al4eJ11RlgaSQBvGd3w173cP7TDy6vL1+nD4ctRkYU8Aks5ttibDg5vvsO2YW4eDoj9D4JmziR6INEHzpIZt5ct0k5DujzPpYvOrLXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779102291; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/pVSe07C+oBTUCWlNEbbGEQrf5pQhGx3DMPEzrhy4EY=; 
	b=aVEcFowiZIDprVhADm7fZGpqCwnPZYxbEtRV8/vFH/Azr+aZiB/r1x6va0GYtgkLewSMFuZU8jKWmp4fbEVDFiqs53ukls/XpxSoer/KRXAnPfftsfjFBgzGg3uDTMXuDnRvZNro54nCJWBjrFQiZEWI0bx4K1qLisGmIuO/0E0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779102291;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=/pVSe07C+oBTUCWlNEbbGEQrf5pQhGx3DMPEzrhy4EY=;
	b=aeqFUWAFnS5fLHghxrKypEHX41FcGvmy7CmS4Y9qwzkJ1HBKqMHjY2DmaHbhlD/i
	wtHrc8CqRTdzTG+ZEKBvWVLTU/rjSMiIXiFl3qPePtLr6YH+2jZtnDwPx0++SfNDjSc
	iFkf+mY8g022SiT4HZhimDbc7rydzygZe/aTykkU=
Received: by mx.zohomail.com with SMTPS id 1779102289610999.3891060736657;
	Mon, 18 May 2026 04:04:49 -0700 (PDT)
Date: Mon, 18 May 2026 11:04:39 +0000
From: Yao Zi <me@ziyao.cc>
To: Chuanhong Guo <gch981213@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for
 sf21-topcrm
Message-ID: <agryR7TRtYeILSeb@pie>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
X-ZohoMailClient: External

On Sun, May 17, 2026 at 10:12:56PM +0800, Chuanhong Guo wrote:
> Add the device tree binding header for Siflower SF21A6826/SF21H8898
> toplevel clock and reset module. The header covers both clock and
> reset IDs provided by the block.

Would it be better to split reset stuff into a separate header in
dt-bindings/reset, so it ends up with a clearer structure? This
shouldn't cost a lot.

Regards,
Yao Zi

> CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
> This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
> clock gate/mux in between. An alias is created for this clock
> to make available clock names align with the datasheet.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  include/dt-bindings/clock/siflower,sf21-topcrm.h | 63 ++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
