Received: from bayard.4d2.org (bayard.4d2.org [5.78.89.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9BF1F428A;
	Tue, 21 Jan 2025 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.89.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737478893; cv=none; b=cTa3hx37agXHIM5333wB1c/EgNwwjoiXAYI18uEN1g9+FNB7nLAL6Tub/OgawNqhPXUPjtQ5VDM8bTLhpcdmaxel0GaNw0eMbn0jM0JyybKe8qowR+LE5BVsgV4vwCa24LuL5msKc9yjrMhpYGf3iYaYJ7V0549vsc85ZhRSGMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737478893; c=relaxed/simple;
	bh=7CSf6dLaH8VILX0EoYfv/LTfKH5Yoo3KoCqLXPP7k0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZkn+PljS5sSLJ4AMRkRdj8WGmXmCzwmtmL0znEzue77FXRnO0LSBrOhw0UvXxu2hy8q4/ocuJBLLKP3bwBXp7sf+b9PBT004r/MGmnzy57mlJya92z9sROZq2sNt86zviVi1hSyH376MOXVXBO2QQziihGRMloLCtIB6ryaWNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=btm1jgg+; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=2C28ssWd; arc=none smtp.client-ip=5.78.89.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="btm1jgg+";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="2C28ssWd"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id D5181122FE25;
	Tue, 21 Jan 2025 09:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1737478881; bh=7CSf6dLaH8VILX0EoYfv/LTfKH5Yoo3KoCqLXPP7k0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btm1jgg+/4iSVe75FCDShwPZWhquIW4c76Rz9wjWs74KCVmzrddP87MG4//yHY6gQ
	 CnxfiUs2Nbq7lrzjcLrb2eTndCzN8xdKfiIetjYeNT5UWnuDlTxD1r8uGMh22H11Lg
	 bgvMZgvIpE2/esmmrmuXb/dgpftgwbGZh5e6swYFBueHqS4pjaUT+OoSJnNz7VEHwo
	 doJ/IlsN2wLNR1dmw1Ardwy7m6SKXU7/RhpsiQ15UsyUHVttyOJvhedrdTUslKb1BD
	 E29CMGzDGRtfzrWtgCwBk2IxAcPpFz+cBNLF9ADpuZ3H81CGiFQ7pyobsYRp2L/Xz/
	 0L05l6P7y0ZKg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vj9yeAEfATGS; Tue, 21 Jan 2025 09:01:20 -0800 (PST)
Received: from ketchup (unknown [183.217.82.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5AE3B122FE21;
	Tue, 21 Jan 2025 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1737478880; bh=7CSf6dLaH8VILX0EoYfv/LTfKH5Yoo3KoCqLXPP7k0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2C28ssWdvFSaaBULlzF4dwI7Km3aQCJOI5t6DkwXnjuTCYoe4LT3noZBGf5W/nKgh
	 Diu6iwOjFOO0kfgyXiuUAy3QABxpxRm3IHQj2TvWHfIdWcSDloU4abVwynFjw7vlwV
	 GE7WCjcKnyofRNDxXi1sr8WMUfJ3R8XdCevBQdSlDkhCvlhxlkq2Inm/6x2Q+qNTZ4
	 gkm36Kq7aewYSuw/qR6cM94AoNLOquQypVn0wkAuCthmntB2IsCdXgp7EUZEnVEld5
	 UThFmCObs4mZLcEt9DSxUvw8hUAMXx/790I7Mz2/v/6ydmTf/W6mNMBrFiuTF3jh4I
	 wt1ZqiUsWRuvQ==
Date: Tue, 21 Jan 2025 17:01:03 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Samuel Holland <samuel.holland@sifive.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 3/4] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <Z4_Sz7xj03AQPJ1G@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-5-heylenay@4d2.org>
 <81bc81b0-9b0e-4e71-b34a-e74730eda44f@sifive.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81bc81b0-9b0e-4e71-b34a-e74730eda44f@sifive.com>

On Wed, Jan 15, 2025 at 11:25:15PM -0600, Samuel Holland wrote:
> Hi Haylen,
> 
> On 2025-01-03 3:56 PM, Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and is managed by several independent controllers in
> > different SoC parts (APBC, APBS and etc.), thus different compatible
> > strings are added to distinguish them.
> 
> I was surprised that your DT binding didn't describe any clocks produced by one
> of these blocks and consumed by another one of them, so I took a look at the driver.
> 
> > Some controllers may share IO region with reset controller and other low
> > speed peripherals like watchdog, so all register operations are done
> > through regmap to avoid competition.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  drivers/clk/Kconfig               |    1 +
> >  drivers/clk/Makefile              |    1 +
> >  drivers/clk/spacemit/Kconfig      |   20 +
> >  drivers/clk/spacemit/Makefile     |    5 +
> >  drivers/clk/spacemit/ccu-k1.c     | 1747 +++++++++++++++++++++++++++++
> >  drivers/clk/spacemit/ccu_common.h |   51 +
> >  drivers/clk/spacemit/ccu_ddn.c    |  140 +++
> >  drivers/clk/spacemit/ccu_ddn.h    |   84 ++
> >  drivers/clk/spacemit/ccu_mix.c    |  304 +++++
> >  drivers/clk/spacemit/ccu_mix.h    |  309 +++++
> >  drivers/clk/spacemit/ccu_pll.c    |  189 ++++
> >  drivers/clk/spacemit/ccu_pll.h    |   80 ++
> >  12 files changed, 2931 insertions(+)
> >  create mode 100644 drivers/clk/spacemit/Kconfig
> >  create mode 100644 drivers/clk/spacemit/Makefile
> >  create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >  create mode 100644 drivers/clk/spacemit/ccu_common.h
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 
> > ...
> >
> > +/*	APBS clocks start	*/
> > +
> > +/* Frequency of pll{1,2} should not be updated at runtime */
> > +static const struct ccu_pll_rate_tbl pll1_rate_tbl[] = {
> > +	CCU_PLL_RATE(2457600000UL, 0x64, 0xdd, 0x50, 0x00, 0x33, 0x0ccccd),
> > +};
> > +
> > +static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
> > +	CCU_PLL_RATE(3000000000UL, 0x66, 0xdd, 0x50, 0x00, 0x3f, 0xe00000),
> > +};
> > +
> > +static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
> > +	CCU_PLL_RATE(3000000000UL, 0x66, 0xdd, 0x50, 0x00, 0x3f, 0xe00000),
> > +	CCU_PLL_RATE(3200000000UL, 0x67, 0xdd, 0x50, 0x00, 0x43, 0xeaaaab),
> > +	CCU_PLL_RATE(2457600000UL, 0x64, 0xdd, 0x50, 0x00, 0x33, 0x0ccccd),
> > +};
> > +
> > +static CCU_PLL_DEFINE(pll1, "pll1", pll1_rate_tbl,
> > +		      APB_SPARE1_REG, APB_SPARE2_REG, APB_SPARE3_REG,
> > +		      MPMU_POSR, POSR_PLL1_LOCK, CLK_SET_RATE_GATE);
> > +static CCU_PLL_DEFINE(pll2, "pll2", pll2_rate_tbl,
> > +		      APB_SPARE7_REG, APB_SPARE8_REG, APB_SPARE9_REG,
> > +		      MPMU_POSR, POSR_PLL2_LOCK, CLK_SET_RATE_GATE);
> > +static CCU_PLL_DEFINE(pll3, "pll3", pll3_rate_tbl,
> > +		      APB_SPARE10_REG, APB_SPARE11_REG, APB_SPARE12_REG,
> > +		      MPMU_POSR, POSR_PLL3_LOCK, 0);
> > +
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d2, "pll1_d2", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(1), BIT(1), 0, 2, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d3, "pll1_d3", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(2), BIT(2), 0, 3, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d4, "pll1_d4", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(3), BIT(3), 0, 4, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d5, "pll1_d5", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(4), BIT(4), 0, 5, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d6, "pll1_d6", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(5), BIT(5), 0, 6, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d7, "pll1_d7", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(6), BIT(6), 0, 7, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d8, "pll1_d8", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(7), BIT(7), 0, 8, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d11_223p4, "pll1_d11_223p4", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(15), BIT(15), 0, 11, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d13_189, "pll1_d13_189", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(16), BIT(16), 0, 13, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d23_106p8, "pll1_d23_106p8", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(20), BIT(20), 0, 23, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d64_38p4, "pll1_d64_38p4", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(0), BIT(0), 0, 64, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_aud_245p7, "pll1_aud_245p7", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(10), BIT(10), 0, 10, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_aud_24p5, "pll1_aud_24p5", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(11), BIT(11), 0, 100, 1, 0);
> > +
> > +static CCU_GATE_FACTOR_DEFINE(pll2_d1, "pll2_d1", CCU_PARENT_HW(pll2),
> > +			      APB_SPARE8_REG,
> > +			      BIT(0), BIT(0), 0, 1, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll2_d2, "pll2_d2", CCU_PARENT_HW(pll2),
> > +			      APB_SPARE8_REG,
> > +			      BIT(1), BIT(1), 0, 2, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll2_d3, "pll2_d3", CCU_PARENT_HW(pll2),
> > +			      APB_SPARE8_REG,
> > +			      BIT(2), BIT(2), 0, 3, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll2_d4, "pll2_d4", CCU_PARENT_HW(pll2),
> > +			      APB_SPARE8_REG,
> > +			      BIT(3), BIT(3), 0, 4, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll2_d5, "pll2_d5", CCU_PARENT_HW(pll2),
> > +			      APB_SPARE8_REG,
> > +			      BIT(4), BIT(4), 0, 5, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll2_d6, "pll2_d6", CCU_PARENT_HW(pll2),
> > +			      APB_SPARE8_REG,
> > +			      BIT(5), BIT(5), 0, 6, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll2_d7, "pll2_d7", CCU_PARENT_HW(pll2),
> > +			      APB_SPARE8_REG,
> > +			      BIT(6), BIT(6), 0, 7, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll2_d8, "pll2_d8", CCU_PARENT_HW(pll2),
> > +			      APB_SPARE8_REG,
> > +			      BIT(7), BIT(7), 0, 8, 1, 0);
> > +
> > +static CCU_GATE_FACTOR_DEFINE(pll3_d1, "pll3_d1", CCU_PARENT_HW(pll3),
> > +			      APB_SPARE11_REG,
> > +			      BIT(0), BIT(0), 0, 1, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll3_d2, "pll3_d2", CCU_PARENT_HW(pll3),
> > +			      APB_SPARE11_REG,
> > +			      BIT(1), BIT(1), 0, 2, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll3_d3, "pll3_d3", CCU_PARENT_HW(pll3),
> > +			      APB_SPARE11_REG,
> > +			      BIT(2), BIT(2), 0, 3, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll3_d4, "pll3_d4", CCU_PARENT_HW(pll3),
> > +			      APB_SPARE11_REG,
> > +			      BIT(3), BIT(3), 0, 4, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll3_d5, "pll3_d5", CCU_PARENT_HW(pll3),
> > +			      APB_SPARE11_REG,
> > +			      BIT(4), BIT(4), 0, 5, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll3_d6, "pll3_d6", CCU_PARENT_HW(pll3),
> > +			      APB_SPARE11_REG,
> > +			      BIT(5), BIT(5), 0, 6, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll3_d7, "pll3_d7", CCU_PARENT_HW(pll3),
> > +			      APB_SPARE11_REG,
> > +			      BIT(6), BIT(6), 0, 7, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll3_d8, "pll3_d8", CCU_PARENT_HW(pll3),
> > +			      APB_SPARE11_REG,
> > +			      BIT(7), BIT(7), 0, 8, 1, 0);
> > +
> > +static CCU_FACTOR_DEFINE(pll3_20, "pll3_20", CCU_PARENT_HW(pll3_d8), 20, 1);
> > +static CCU_FACTOR_DEFINE(pll3_40, "pll3_40", CCU_PARENT_HW(pll3_d8), 10, 1);
> > +static CCU_FACTOR_DEFINE(pll3_80, "pll3_80", CCU_PARENT_HW(pll3_d8), 5, 1);
> > +
> > +/*	APBS clocks end		*/
> > +
> > +/*	MPMU clocks start	*/
> > +static CCU_GATE_DEFINE(pll1_d8_307p2, "pll1_d8_307p2", CCU_PARENT_HW(pll1_d8),
> > +		       MPMU_ACGR,
> > +		       BIT(13), BIT(13), 0, 0);
> 
> Here you have a clk_hw from one driver instance (pll1_d8_307p2) pointing to a
> clk_hw from another driver instance (pll1_d8).

Yes, there're cross references between different controllers, indexed
with struct clk_hw. I have to admit that it isn't a common design
pattern among clock drivers.

> If the consumer instance is
> probed first, pll1_d8 won't have been registered with the clock core, so you are
> quite likely to dereference a null hw->core pointer.

But I don't think null pointer dereferencing would happen.

When a struct clk_hw gets registered through devm_clk_hw_register(),
the real parenting work is done in __clk_init_parent() called by
__clk_core_init(): the former'll find struct clk_core of the parent
isn't initialized, thus invoke clk_core_fill_parent_index() to try a
search.

In this case, the search will always fail since the parent hasn't been
registered as struct clk_core. So __clk_core_init() will mark it as an
orphan and afaik CCF won't touch the core field of its parent at all. As
far as we keep in mind that stuff like clk_hw_get_parent_by_index() may
fail when writing the driver, everything should work.

> The normal way to handle relationships between clock controller instances is by
> referencing the clocks in the consumer's devicetree node, and using .fw_name in
> the parent_data. Unfortunately, it seems there are quite a lot of clocks that
> would need to be included in the DT binding to do that.

Yeah. As Krzysztof has concerns on splitting multiple clock controllers
as well, it's necessary to discuss possibility of merging them together
(then we're more likely to make the driver bug-free).

Thanks for your time and review!

> Regards,
> Samuel
> 

Best regards,
Haylen Chu

> > ...
> > +/*	APMU clocks end		*/
> > +
> > +static struct clk_hw_onecell_data k1_ccu_apbs_clks = {
> > +	.hws = {
> > +		[CLK_PLL1]		= &pll1.common.hw,
> > +		[CLK_PLL2]		= &pll2.common.hw,
> > +		[CLK_PLL3]		= &pll3.common.hw,
> > +		[CLK_PLL1_D2]		= &pll1_d2.common.hw,
> > +		[CLK_PLL1_D3]		= &pll1_d3.common.hw,
> > +		[CLK_PLL1_D4]		= &pll1_d4.common.hw,
> > +		[CLK_PLL1_D5]		= &pll1_d5.common.hw,
> > +		[CLK_PLL1_D6]		= &pll1_d6.common.hw,
> > +		[CLK_PLL1_D7]		= &pll1_d7.common.hw,
> > +		[CLK_PLL1_D8]		= &pll1_d8.common.hw,
> 
> referring to here ^
> 
> > +		[CLK_PLL1_D11]		= &pll1_d11_223p4.common.hw,
> > +		[CLK_PLL1_D13]		= &pll1_d13_189.common.hw,
> > +		[CLK_PLL1_D23]		= &pll1_d23_106p8.common.hw,
> > +		[CLK_PLL1_D64]		= &pll1_d64_38p4.common.hw,
> > +		[CLK_PLL1_D10_AUD]	= &pll1_aud_245p7.common.hw,
> > +		[CLK_PLL1_D100_AUD]	= &pll1_aud_24p5.common.hw,
> > +		[CLK_PLL2_D1]		= &pll2_d1.common.hw,
> > +		[CLK_PLL2_D2]		= &pll2_d2.common.hw,
> > +		[CLK_PLL2_D3]		= &pll2_d3.common.hw,
> > +		[CLK_PLL2_D4]		= &pll2_d4.common.hw,
> > +		[CLK_PLL2_D5]		= &pll2_d5.common.hw,
> > +		[CLK_PLL2_D6]		= &pll2_d6.common.hw,
> > +		[CLK_PLL2_D7]		= &pll2_d7.common.hw,
> > +		[CLK_PLL2_D8]		= &pll2_d8.common.hw,
> > +		[CLK_PLL3_D1]		= &pll3_d1.common.hw,
> > +		[CLK_PLL3_D2]		= &pll3_d2.common.hw,
> > +		[CLK_PLL3_D3]		= &pll3_d3.common.hw,
> > +		[CLK_PLL3_D4]		= &pll3_d4.common.hw,
> > +		[CLK_PLL3_D5]		= &pll3_d5.common.hw,
> > +		[CLK_PLL3_D6]		= &pll3_d6.common.hw,
> > +		[CLK_PLL3_D7]		= &pll3_d7.common.hw,
> > +		[CLK_PLL3_D8]		= &pll3_d8.common.hw,
> > +		[CLK_PLL3_80]		= &pll3_80.common.hw,
> > +		[CLK_PLL3_40]		= &pll3_40.common.hw,
> > +		[CLK_PLL3_20]		= &pll3_20.common.hw,
> > +
> > +	},
> > +	.num = CLK_APBS_NUM,
> > +};
> > +
> > +static struct clk_hw_onecell_data k1_ccu_mpmu_clks = {
> > +	.hws = {
> > +		[CLK_PLL1_307P2]	= &pll1_d8_307p2.common.hw,
> 
> from here ^
> 
> > +		[CLK_PLL1_76P8]		= &pll1_d32_76p8.common.hw,
> > +		[CLK_PLL1_61P44]	= &pll1_d40_61p44.common.hw,
> > +		[CLK_PLL1_153P6]	= &pll1_d16_153p6.common.hw,
> > +		[CLK_PLL1_102P4]	= &pll1_d24_102p4.common.hw,
> > +		[CLK_PLL1_51P2]		= &pll1_d48_51p2.common.hw,
> > +		[CLK_PLL1_51P2_AP]	= &pll1_d48_51p2_ap.common.hw,
> > +		[CLK_PLL1_57P6]		= &pll1_m3d128_57p6.common.hw,
> > +		[CLK_PLL1_25P6]		= &pll1_d96_25p6.common.hw,
> > +		[CLK_PLL1_12P8]		= &pll1_d192_12p8.common.hw,
> > +		[CLK_PLL1_12P8_WDT]	= &pll1_d192_12p8_wdt.common.hw,
> > +		[CLK_PLL1_6P4]		= &pll1_d384_6p4.common.hw,
> > +		[CLK_PLL1_3P2]		= &pll1_d768_3p2.common.hw,
> > +		[CLK_PLL1_1P6]		= &pll1_d1536_1p6.common.hw,
> > +		[CLK_PLL1_0P8]		= &pll1_d3072_0p8.common.hw,
> > +		[CLK_PLL1_351]		= &pll1_d7_351p08.common.hw,
> > +		[CLK_PLL1_409P6]	= &pll1_d6_409p6.common.hw,
> > +		[CLK_PLL1_204P8]	= &pll1_d12_204p8.common.hw,
> > +		[CLK_PLL1_491]		= &pll1_d5_491p52.common.hw,
> > +		[CLK_PLL1_245P76]	= &pll1_d10_245p76.common.hw,
> > +		[CLK_PLL1_614]		= &pll1_d4_614p4.common.hw,
> > +		[CLK_PLL1_47P26]	= &pll1_d52_47p26.common.hw,
> > +		[CLK_PLL1_31P5]		= &pll1_d78_31p5.common.hw,
> > +		[CLK_PLL1_819]		= &pll1_d3_819p2.common.hw,
> > +		[CLK_PLL1_1228]		= &pll1_d2_1228p8.common.hw,
> > +		[CLK_SLOW_UART]		= &slow_uart.common.hw,
> > +		[CLK_SLOW_UART1]	= &slow_uart1_14p74.common.hw,
> > +		[CLK_SLOW_UART2]	= &slow_uart2_48.common.hw,
> > +		[CLK_WDT]		= &wdt_clk.common.hw,
> > +		[CLK_RIPC]		= &ripc_clk.common.hw,
> > +		[CLK_I2S_SYSCLK]	= &i2s_sysclk.common.hw,
> > +		[CLK_I2S_BCLK]		= &i2s_bclk.common.hw,
> > +		[CLK_APB]		= &apb_clk.common.hw,
> > +		[CLK_WDT_BUS]		= &wdt_bus_clk.common.hw,
> > +	},
> > +	.num = CLK_MPMU_NUM,
> > +};
> > +
> > +static struct clk_hw_onecell_data k1_ccu_apbc_clks = {
> > +	.hws = {
> > +		[CLK_UART0]		= &uart0_clk.common.hw,
> > +		[CLK_UART2]		= &uart2_clk.common.hw,
> > +		[CLK_UART3]		= &uart3_clk.common.hw,
> > +		[CLK_UART4]		= &uart4_clk.common.hw,
> > +		[CLK_UART5]		= &uart5_clk.common.hw,
> > +		[CLK_UART6]		= &uart6_clk.common.hw,
> > +		[CLK_UART7]		= &uart7_clk.common.hw,
> > +		[CLK_UART8]		= &uart8_clk.common.hw,
> > +		[CLK_UART9]		= &uart9_clk.common.hw,
> > +		[CLK_GPIO]		= &gpio_clk.common.hw,
> > +		[CLK_PWM0]		= &pwm0_clk.common.hw,
> > +		[CLK_PWM1]		= &pwm1_clk.common.hw,
> > +		[CLK_PWM2]		= &pwm2_clk.common.hw,
> > +		[CLK_PWM3]		= &pwm3_clk.common.hw,
> > +		[CLK_PWM4]		= &pwm4_clk.common.hw,
> > +		[CLK_PWM5]		= &pwm5_clk.common.hw,
> > +		[CLK_PWM6]		= &pwm6_clk.common.hw,
> > +		[CLK_PWM7]		= &pwm7_clk.common.hw,
> > +		[CLK_PWM8]		= &pwm8_clk.common.hw,
> > +		[CLK_PWM9]		= &pwm9_clk.common.hw,
> > +		[CLK_PWM10]		= &pwm10_clk.common.hw,
> > +		[CLK_PWM11]		= &pwm11_clk.common.hw,
> > +		[CLK_PWM12]		= &pwm12_clk.common.hw,
> > +		[CLK_PWM13]		= &pwm13_clk.common.hw,
> > +		[CLK_PWM14]		= &pwm14_clk.common.hw,
> > +		[CLK_PWM15]		= &pwm15_clk.common.hw,
> > +		[CLK_PWM16]		= &pwm16_clk.common.hw,
> > +		[CLK_PWM17]		= &pwm17_clk.common.hw,
> > +		[CLK_PWM18]		= &pwm18_clk.common.hw,
> > +		[CLK_PWM19]		= &pwm19_clk.common.hw,
> > +		[CLK_SSP3]		= &ssp3_clk.common.hw,
> > +		[CLK_RTC]		= &rtc_clk.common.hw,
> > +		[CLK_TWSI0]		= &twsi0_clk.common.hw,
> > +		[CLK_TWSI1]		= &twsi1_clk.common.hw,
> > +		[CLK_TWSI2]		= &twsi2_clk.common.hw,
> > +		[CLK_TWSI4]		= &twsi4_clk.common.hw,
> > +		[CLK_TWSI5]		= &twsi5_clk.common.hw,
> > +		[CLK_TWSI6]		= &twsi6_clk.common.hw,
> > +		[CLK_TWSI7]		= &twsi7_clk.common.hw,
> > +		[CLK_TWSI8]		= &twsi8_clk.common.hw,
> > +		[CLK_TIMERS1]		= &timers1_clk.common.hw,
> > +		[CLK_TIMERS2]		= &timers2_clk.common.hw,
> > +		[CLK_AIB]		= &aib_clk.common.hw,
> > +		[CLK_ONEWIRE]		= &onewire_clk.common.hw,
> > +		[CLK_SSPA0]		= &sspa0_clk.common.hw,
> > +		[CLK_SSPA1]		= &sspa1_clk.common.hw,
> > +		[CLK_DRO]		= &dro_clk.common.hw,
> > +		[CLK_IR]		= &ir_clk.common.hw,
> > +		[CLK_TSEN]		= &tsen_clk.common.hw,
> > +		[CLK_IPC_AP2AUD]	= &ipc_ap2aud_clk.common.hw,
> > +		[CLK_CAN0]		= &can0_clk.common.hw,
> > +		[CLK_CAN0_BUS]		= &can0_bus_clk.common.hw,
> > +		[CLK_UART0_BUS]		= &uart0_bus_clk.common.hw,
> > +		[CLK_UART2_BUS]		= &uart2_bus_clk.common.hw,
> > +		[CLK_UART3_BUS]		= &uart3_bus_clk.common.hw,
> > +		[CLK_UART4_BUS]		= &uart4_bus_clk.common.hw,
> > +		[CLK_UART5_BUS]		= &uart5_bus_clk.common.hw,
> > +		[CLK_UART6_BUS]		= &uart6_bus_clk.common.hw,
> > +		[CLK_UART7_BUS]		= &uart7_bus_clk.common.hw,
> > +		[CLK_UART8_BUS]		= &uart8_bus_clk.common.hw,
> > +		[CLK_UART9_BUS]		= &uart9_bus_clk.common.hw,
> > +		[CLK_GPIO_BUS]		= &gpio_bus_clk.common.hw,
> > +		[CLK_PWM0_BUS]		= &pwm0_bus_clk.common.hw,
> > +		[CLK_PWM1_BUS]		= &pwm1_bus_clk.common.hw,
> > +		[CLK_PWM2_BUS]		= &pwm2_bus_clk.common.hw,
> > +		[CLK_PWM3_BUS]		= &pwm3_bus_clk.common.hw,
> > +		[CLK_PWM4_BUS]		= &pwm4_bus_clk.common.hw,
> > +		[CLK_PWM5_BUS]		= &pwm5_bus_clk.common.hw,
> > +		[CLK_PWM6_BUS]		= &pwm6_bus_clk.common.hw,
> > +		[CLK_PWM7_BUS]		= &pwm7_bus_clk.common.hw,
> > +		[CLK_PWM8_BUS]		= &pwm8_bus_clk.common.hw,
> > +		[CLK_PWM9_BUS]		= &pwm9_bus_clk.common.hw,
> > +		[CLK_PWM10_BUS]		= &pwm10_bus_clk.common.hw,
> > +		[CLK_PWM11_BUS]		= &pwm11_bus_clk.common.hw,
> > +		[CLK_PWM12_BUS]		= &pwm12_bus_clk.common.hw,
> > +		[CLK_PWM13_BUS]		= &pwm13_bus_clk.common.hw,
> > +		[CLK_PWM14_BUS]		= &pwm14_bus_clk.common.hw,
> > +		[CLK_PWM15_BUS]		= &pwm15_bus_clk.common.hw,
> > +		[CLK_PWM16_BUS]		= &pwm16_bus_clk.common.hw,
> > +		[CLK_PWM17_BUS]		= &pwm17_bus_clk.common.hw,
> > +		[CLK_PWM18_BUS]		= &pwm18_bus_clk.common.hw,
> > +		[CLK_PWM19_BUS]		= &pwm19_bus_clk.common.hw,
> > +		[CLK_SSP3_BUS]		= &ssp3_bus_clk.common.hw,
> > +		[CLK_RTC_BUS]		= &rtc_bus_clk.common.hw,
> > +		[CLK_TWSI0_BUS]		= &twsi0_bus_clk.common.hw,
> > +		[CLK_TWSI1_BUS]		= &twsi1_bus_clk.common.hw,
> > +		[CLK_TWSI2_BUS]		= &twsi2_bus_clk.common.hw,
> > +		[CLK_TWSI4_BUS]		= &twsi4_bus_clk.common.hw,
> > +		[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
> > +		[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
> > +		[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
> > +		[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
> > +		[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
> > +		[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
> > +		[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,
> > +		[CLK_ONEWIRE_BUS]	= &onewire_bus_clk.common.hw,
> > +		[CLK_SSPA0_BUS]		= &sspa0_bus_clk.common.hw,
> > +		[CLK_SSPA1_BUS]		= &sspa1_bus_clk.common.hw,
> > +		[CLK_TSEN_BUS]		= &tsen_bus_clk.common.hw,
> > +		[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
> > +	},
> > +	.num = CLK_APBC_NUM,
> > +};
> > +
> > +static struct clk_hw_onecell_data k1_ccu_apmu_clks = {
> > +	.hws = {
> > +		[CLK_CCI550]		= &cci550_clk.common.hw,
> > +		[CLK_CPU_C0_HI]		= &cpu_c0_hi_clk.common.hw,
> > +		[CLK_CPU_C0_CORE]	= &cpu_c0_core_clk.common.hw,
> > +		[CLK_CPU_C0_ACE]	= &cpu_c0_ace_clk.common.hw,
> > +		[CLK_CPU_C0_TCM]	= &cpu_c0_tcm_clk.common.hw,
> > +		[CLK_CPU_C1_HI]		= &cpu_c1_hi_clk.common.hw,
> > +		[CLK_CPU_C1_CORE]	= &cpu_c1_core_clk.common.hw,
> > +		[CLK_CPU_C1_ACE]	= &cpu_c1_ace_clk.common.hw,
> > +		[CLK_CCIC_4X]		= &ccic_4x_clk.common.hw,
> > +		[CLK_CCIC1PHY]		= &ccic1phy_clk.common.hw,
> > +		[CLK_SDH_AXI]		= &sdh_axi_aclk.common.hw,
> > +		[CLK_SDH0]		= &sdh0_clk.common.hw,
> > +		[CLK_SDH1]		= &sdh1_clk.common.hw,
> > +		[CLK_SDH2]		= &sdh2_clk.common.hw,
> > +		[CLK_USB_P1]		= &usb_p1_aclk.common.hw,
> > +		[CLK_USB_AXI]		= &usb_axi_clk.common.hw,
> > +		[CLK_USB30]		= &usb30_clk.common.hw,
> > +		[CLK_QSPI]		= &qspi_clk.common.hw,
> > +		[CLK_QSPI_BUS]		= &qspi_bus_clk.common.hw,
> > +		[CLK_DMA]		= &dma_clk.common.hw,
> > +		[CLK_AES]		= &aes_clk.common.hw,
> > +		[CLK_VPU]		= &vpu_clk.common.hw,
> > +		[CLK_GPU]		= &gpu_clk.common.hw,
> > +		[CLK_EMMC]		= &emmc_clk.common.hw,
> > +		[CLK_EMMC_X]		= &emmc_x_clk.common.hw,
> > +		[CLK_AUDIO]		= &audio_clk.common.hw,
> > +		[CLK_HDMI]		= &hdmi_mclk.common.hw,
> > +		[CLK_PMUA_ACLK]		= &pmua_aclk.common.hw,
> > +		[CLK_PCIE0]		= &pcie0_clk.common.hw,
> > +		[CLK_PCIE1]		= &pcie1_clk.common.hw,
> > +		[CLK_PCIE2]		= &pcie2_clk.common.hw,
> > +		[CLK_EMAC0_BUS]		= &emac0_bus_clk.common.hw,
> > +		[CLK_EMAC0_PTP]		= &emac0_ptp_clk.common.hw,
> > +		[CLK_EMAC1_BUS]		= &emac1_bus_clk.common.hw,
> > +		[CLK_EMAC1_PTP]		= &emac1_ptp_clk.common.hw,
> > +		[CLK_JPG]		= &jpg_clk.common.hw,
> > +		[CLK_CCIC2PHY]		= &ccic2phy_clk.common.hw,
> > +		[CLK_CCIC3PHY]		= &ccic3phy_clk.common.hw,
> > +		[CLK_CSI]		= &csi_clk.common.hw,
> > +		[CLK_CAMM0]		= &camm0_clk.common.hw,
> > +		[CLK_CAMM1]		= &camm1_clk.common.hw,
> > +		[CLK_CAMM2]		= &camm2_clk.common.hw,
> > +		[CLK_ISP_CPP]		= &isp_cpp_clk.common.hw,
> > +		[CLK_ISP_BUS]		= &isp_bus_clk.common.hw,
> > +		[CLK_ISP]		= &isp_clk.common.hw,
> > +		[CLK_DPU_MCLK]		= &dpu_mclk.common.hw,
> > +		[CLK_DPU_ESC]		= &dpu_esc_clk.common.hw,
> > +		[CLK_DPU_BIT]		= &dpu_bit_clk.common.hw,
> > +		[CLK_DPU_PXCLK]		= &dpu_pxclk.common.hw,
> > +		[CLK_DPU_HCLK]		= &dpu_hclk.common.hw,
> > +		[CLK_DPU_SPI]		= &dpu_spi_clk.common.hw,
> > +		[CLK_DPU_SPI_HBUS]	= &dpu_spi_hbus_clk.common.hw,
> > +		[CLK_DPU_SPIBUS]	= &dpu_spi_bus_clk.common.hw,
> > +		[CLK_DPU_SPI_ACLK]	= &dpu_spi_aclk.common.hw,
> > +		[CLK_V2D]		= &v2d_clk.common.hw,
> > +		[CLK_EMMC_BUS]		= &emmc_bus_clk.common.hw,
> > +	},
> > +	.num = CLK_APMU_NUM
> > +};
> > +
> > +struct spacemit_ccu_data {
> > +	struct clk_hw_onecell_data *hw_clks;
> > +	bool need_pll_lock;
> > +};
> > +
> > +struct spacemit_ccu_priv {
> > +	const struct spacemit_ccu_data *data;
> > +	struct regmap *base;
> > +	struct regmap *lock_base;
> > +};
> > +
> > +static int spacemit_ccu_register(struct device *dev,
> > +				 struct spacemit_ccu_priv *priv)
> > +{
> > +	const struct spacemit_ccu_data *data = priv->data;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < data->hw_clks->num; i++) {
> > +		struct clk_hw *hw = data->hw_clks->hws[i];
> > +		struct ccu_common *common;
> > +		const char *name;
> > +
> > +		if (!hw)
> > +			continue;
> > +
> > +		common = hw_to_ccu_common(hw);
> > +		name = hw->init->name;
> > +
> > +		common->base		= priv->base;
> > +		common->lock_base	= priv->lock_base;
> > +
> > +		ret = devm_clk_hw_register(dev, hw);
> > +		if (ret) {
> > +			dev_err(dev, "Cannot register clock %d - %s\n",
> > +				i, name);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> > +					   data->hw_clks);
> > +}
> > +
> > +static int k1_ccu_probe(struct platform_device *pdev)
> > +{
> > +	const struct spacemit_ccu_data *data;
> > +	struct regmap *base_map, *lock_map = NULL;
> > +	struct device *dev = &pdev->dev;
> > +	struct spacemit_ccu_priv *priv;
> > +	struct device_node *parent;
> > +	int ret;
> > +
> > +	data = of_device_get_match_data(dev);
> > +	if (WARN_ON(!data))
> > +		return -EINVAL;
> > +
> > +	parent   = of_get_parent(dev->of_node);
> > +	base_map = syscon_node_to_regmap(parent);
> > +	of_node_put(parent);
> > +
> > +	if (IS_ERR(base_map))
> > +		return dev_err_probe(dev, PTR_ERR(base_map),
> > +				     "failed to get regmap\n");
> > +
> > +	if (data->need_pll_lock) {
> > +		lock_map = syscon_regmap_lookup_by_phandle(dev->of_node,
> > +							   "spacemit,mpmu");
> > +		if (IS_ERR(lock_map))
> > +			return dev_err_probe(dev, PTR_ERR(lock_map),
> > +					     "failed to get lock regmap\n");
> > +	}
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->data	= data;
> > +	priv->base	= base_map;
> > +	priv->lock_base	= lock_map;
> > +
> > +	ret = spacemit_ccu_register(dev, priv);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register clocks\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct spacemit_ccu_data k1_ccu_apbs_data = {
> > +	.need_pll_lock	= true,
> > +	.hw_clks	= &k1_ccu_apbs_clks,
> > +};
> > +
> > +static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> > +	.need_pll_lock	= false,
> > +	.hw_clks	= &k1_ccu_mpmu_clks,
> > +};
> > +
> > +static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> > +	.need_pll_lock	= false,
> > +	.hw_clks	= &k1_ccu_apbc_clks,
> > +};
> > +
> > +static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> > +	.need_pll_lock	= false,
> > +	.hw_clks	= &k1_ccu_apmu_clks,
> > +};
> > +
> > +static const struct of_device_id of_k1_ccu_match[] = {
> > +	{
> > +		.compatible	= "spacemit,k1-ccu-apbs",
> > +		.data		= &k1_ccu_apbs_data,
> > +	},
> > +	{
> > +		.compatible	= "spacemit,k1-ccu-mpmu",
> > +		.data		= &k1_ccu_mpmu_data,
> > +	},
> > +	{
> > +		.compatible	= "spacemit,k1-ccu-apbc",
> > +		.data		= &k1_ccu_apbc_data,
> > +	},
> > +	{
> > +		.compatible	= "spacemit,k1-ccu-apmu",
> > +		.data		= &k1_ccu_apmu_data,
> > +	},
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
> > +
> > +static struct platform_driver k1_ccu_driver = {
> > +	.driver = {
> > +		.name		= "spacemit,k1-ccu",
> > +		.of_match_table = of_k1_ccu_match,
> > +	},
> > +	.probe	= k1_ccu_probe,
> > +};
> > +module_platform_driver(k1_ccu_driver);
> > +
> > +MODULE_DESCRIPTION("Spacemit K1 CCU driver");
> > +MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
> > ...
