Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795F5389452;
	Tue,  5 May 2026 16:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998057; cv=none; b=qNPXbf3MEPjo3fDZ0WXq92cDA4P/XvaPPtURmUaLBXjGoeGngOZ/cBqOm/436OOcZLVhChAyd7FhUEhCqeUvnjVJOItW/GXVyNlGNfzVCXbWeQtsNPXqwetWBDoSr0glFt62nVXSrlCUK9rXLpm3SDjjCmeGPMANoNBvjChxs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998057; c=relaxed/simple;
	bh=C8efCugq5/wF4si+DgA/qFTAdUR0kg1MpKn17jk6yuM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQaw+fW3PGLy2ZkpYZZt8XmeSdPc05OnofHIUkO/hMgzGRiasC7KwiAcuIWHcOMV6CylV7k2PE0AdCG18CcpyQsu6MJa/MlMpi6ppROn8Cm+I+CWL7Mpu4yumzfxJvUiDsmFe9iYkbi5KBMd7mf7gXbWd6u21NABjUSDjLdjX2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FnqFTI+o; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FnqFTI+o"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 887F21C2B;
	Tue,  5 May 2026 09:20:48 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0581E3F763;
	Tue,  5 May 2026 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777998053; bh=C8efCugq5/wF4si+DgA/qFTAdUR0kg1MpKn17jk6yuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FnqFTI+oE0YtcnjRCbvYHUF8oZI18TcjaZur9kjU8zGkkPPaFMnJykcV6ZwmQYroB
	 QbYiwMfaZHg/ifnCvZ4ddY0gQIN1gwFUQRdBnC6UlAhZdUMKM4Lyw2RZVYYj4YV56p
	 0EZDUcGxKllp0vr0FwW5BhjWUmsBTMH/KDsod0II=
Date: Tue, 5 May 2026 18:20:17 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
Message-ID: <20260505182017.10d71c11@ryzen.lan>
In-Reply-To: <afoRe6DI4GJIVtg4@shepard>
References: <20250307002628.10684-1-andre.przywara@arm.com>
	<20250307002628.10684-9-andre.przywara@arm.com>
	<afoRe6DI4GJIVtg4@shepard>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 5 May 2026 17:49:15 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> > Add the clocks driving some core system related subsystems of the SoC:
> > the "CE" crypto engine, the high speed timers, the DRAM and the associated
> > MBUS clock, and the PCIe clock.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> > 
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > index 17a4ffc0b7f52..c59f3f789d052 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c  
> 
> [...]
> 
> > +static const struct clk_parent_data hstimer_parents[] = {
> > +	{ .fw_name = "hosc" },
> > +	{ .fw_name = "iosc" },
> > +	{ .fw_name = "losc" },
> > +	{ .hw = &pll_periph0_200M_clk.hw },
> > +};
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > +				       hstimer_parents, 0x730,
> > +				       0, 0,	/* M */  
> 
> I was looking at the A523 ccu code and see lots of
> SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.
> 
> Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_GATE
> instead? It would surely be less confusing.
> 
> One difference would be that the ops end up as ccu_div_ops instead of
> ccu_mp_ops. Do you need ccu_mp_ops for some reason?

Yes, please double check that (as it *is* confusing), but to me it
looks like the CCU_M_ version has just a pure divider, whereas in
CCU_MP_ the P is a *shift*, and the M a divider. Those timer clocks just
feature a shift, which I don't think we have seen before?

Cheers,
Andre
