Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF560FBF6;
	Fri, 24 Jan 2025 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737756789; cv=none; b=uf0ya9F7OKWIRvlzSyDcHWT2jS/9lsUurq79J1e9VVjGX7NL48HwJlDbrdEEf+31kdZ6stUMFAhC9ssAb9QPSHb2IhJkYF+l6XA06IpSpsTdYbTo80enkluUO1AMLgNQHPHNErqtwfdI7NfqtT3sFj4N8IB9S4xw2uzU401xZQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737756789; c=relaxed/simple;
	bh=FLQxdpJyzEswq1eRtOManUr7pSIYwE94iOEM13rvc9k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RP3wWU0QyWcl/B4968X3Gjx7FAvMdZ7kVd0x+HeslCBLNyY8EDJIELmINyqn2A50q4Z/DuCHMO+TQfJhf8tZAh35sfYC3Ykx76VSMBGHEUBrPQVJbAstPr/h2My8PyR/aRT9pkWXco+H1mtOT2BtgSW4BQghqUBkAuccH0H0+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F4MHvga5; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F4MHvga5"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50OMCwHR1453706
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Jan 2025 16:12:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737756778;
	bh=y7+b5EerjjTIE3Wsk1jqtJR/8IjX6fnXX+J4qrRjCq0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=F4MHvga5cX0TqxsmVhz4l+805ccejnhcAM2vF4VBTamkyVQu4I3qkG8DA6SbJnJOi
	 nAWctDvGDyR05p+A61lipm1q5Way+ZStqWQ0TJ9hJaAG5kyuKP1e3oowzTIesefcWZ
	 iWZ/v2ddmegVU1TblBl3W/Xq5XJtsRE984Hf38hY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OMCwcc106553;
	Fri, 24 Jan 2025 16:12:58 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 16:12:57 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 16:12:57 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OMCvsL127620;
	Fri, 24 Jan 2025 16:12:57 -0600
Date: Fri, 24 Jan 2025 16:12:57 -0600
From: Nishanth Menon <nm@ti.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Andrew Davis <afd@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Rob Herring
	<robh@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] clk: keystone: syscon-clk: Do not use syscon helper to
 build regmap
Message-ID: <20250124221257.z27tvyetd6mr74jn@recycled>
References: <20250123181913.597304-1-afd@ti.com>
 <20250123200209.lqdap6jdzz4ud37f@riveter>
 <4b93a51bffd5ff7365d3998df92f0554.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4b93a51bffd5ff7365d3998df92f0554.sboyd@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 11:01-20250124, Stephen Boyd wrote:
> Quoting Nishanth Menon (2025-01-23 12:02:09)
> > On 12:19-20250123, Andrew Davis wrote:
> > > The syscon helper device_node_to_regmap() is used to fetch a regmap
> > > registered to a device node. It also currently creates this regmap
> > > if the node did not already have a regmap associated with it. This
> > > should only be used on "syscon" nodes. This driver is not such a
> > > device and instead uses device_node_to_regmap() on its own node as
> > > a hacky way to create a regmap for itself.
> > > 
> > > This will not work going forward and so we should create our regmap
> 
> Please reference the commit where this won't work anymore. It's hard to
> know the urgency without this information.
> 
> > > the normal way by defining our regmap_config, fetching our memory
> > > resource, then using the normal regmap_init_mmio() function.
> > > 
> > > Signed-off-by: Andrew Davis <afd@ti.com>
> > 
> > Tested-by: Nishanth Menon <nm@ti.com>
> > 
> > Could we get this routed to master as fixes asap please to get a sane 6.14?
> > 
> 
> Sure. Can you resend with a Fixes tag?


I think it is less urgent for immediate window given Rob has posted
a restoration of behavior fixup[1]. This patch is still good to be
merged based on [2].


[1] https://lore.kernel.org/all/20250124191644.2309790-1-robh@kernel.org/
[2] https://lore.kernel.org/all/CAL_JsqKVydDqmr-gyn1wt=1PO_p1NMze+1D+4qXWxGiGVLV9EA@mail.gmail.com/

> 
> > This is part of the fixes TI K3 platforms boot issues reported in
> > https://lore.kernel.org/all/b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com/
> > 
> > on the latest linus master v6.13-5001-gd0d106a2bd21 + linux
> > next-20250123
> > 
> > Total set of patches tested with:
> > https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
> > https://lore.kernel.org/r/20250123181726.597144-1-afd@ti.com
> > https://lore.kernel.org/r/20250123181913.597304-1-afd@ti.com
> > https://lore.kernel.org/r/20250123182059.597491-1-afd@ti.com
> > https://lore.kernel.org/r/20250123182234.597665-1-afd@ti.com
> >

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
