Received: from sender4-pp-g125.zoho.com (sender4-pp-g125.zoho.com [136.143.188.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07ED371066;
	Wed, 28 Jan 2026 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769630402; cv=pass; b=u+1TzZA7gCR04LfJLKu6PJ5XyXqlMEwSwxUYkutS/34x6sy5dP9Z/ihgqZFTpeW5bPZIUWhqD9eY5oyMceUZb05347NG1OSU3+1+Ee8Zd/WrUvDlenyMeMukHkT2KFVNP0wuZ+S2/VOVDDoWpfscL34QVDbO62uqZ/Ghi2tReag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769630402; c=relaxed/simple;
	bh=f/wSdRTwZh3LEYt4kYb0V7cWU5kuteXCCJhTt4DqbMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLSUPonl++4J5S6Tw3FWBogr4c+qrQzsyTfjXb3Iu23Py8jMFDIarOXhAO0zSMxLDxxKrMg/0GIWhFOPxjp1MoPcB6rNntB5T2MHvTV8L4Xyqjl3LU7x7Xf4rHU8SKWx+JwMdA5Vc5vtGaFsCnyqsV6CJnN5Dsuo78f0Utb2mcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=hXA67C6b; arc=pass smtp.client-ip=136.143.188.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="hXA67C6b"
ARC-Seal: i=1; a=rsa-sha256; t=1769630373; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K8K1M48FQtq8OK965TzzmkPzV6n+11D+Rtl+8CkShhiMIk0JPcQWa3vkny45WxmCrTmZkIafYTo5+NSOiXBUKHxDjdnTCIxKzyb30p4RSLV/HVnTHVSPedRWi3WWA+pLhds1h9lDxozYT9iyZpU7Ys2Hjq93pO86NPMs5dzaEUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769630373; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h+PQPL67RL4bAsBdWDduxBsVgC9JO6Edm18OLOPlwRo=; 
	b=mi7B5xNwHXksFHBfS86lqtS1qYWaNNJ+uvcRqviW9zQLf24BlMSsyN8MAonMY++TU7aCGE7/wqOkUlebV/lXQODC/ode65PcItwRg2fWxNyc8cYJ9ykkL/oyY5rra57B9ntbly36YVjodSO/3Nqny8alu8lztKuOti0q4eoIdH0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769630373;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=h+PQPL67RL4bAsBdWDduxBsVgC9JO6Edm18OLOPlwRo=;
	b=hXA67C6bB8OSSAl7nJPnOw+v+s74tRLI4eSYG3qwavZNMmEOePOopXgW4r5IaMGf
	OkzF+LCVkqKEAqeRk9pQQ8U6cPeciI87vD+lbTlfl0PR9pfyRYVSpqpvMFX2lKydQPm
	L0HvwKwZj6+GVZXcdjEi/6vrpyLd275XoOrHyI1E=
Received: by mx.zohomail.com with SMTPS id 1769630370954180.7519708387673;
	Wed, 28 Jan 2026 11:59:30 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gIFIuICBBLg==?= Prado <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Wed, 28 Jan 2026 20:59:24 +0100
Message-ID: <5200578.ejJDZkT8p0@workhorse>
In-Reply-To: <176962688200.4027.9869545980331892869@lazor>
References:
 <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <3745487.e9J7NaK4W3@workhorse> <176962688200.4027.9869545980331892869@lazor>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, 28 January 2026 20:01:22 Central European Standard Time Stephen Boyd wrote:
> Quoting Nicolas Frattaroli (2026-01-28 09:04:55)
> > On Wednesday, 28 January 2026 15:47:08 Central European Standard Time Mark Brown wrote:
> > > 
> > > For the Avenger96 that says:
> > > 
> > > [    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
> > > [    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
> > > [    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
> > > [    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu
> > > 
> > > https://lava.sirena.org.uk/scheduler/job/2412562#L563
> > > 
> > 
> > Okay, on this one, there may be a problem in the clock tree.
> > ck_mpu is marked CLK_IS_CRITICAL, but its parent, pll1_p, is not. Clock
> > core doesn't seem to check whether any children of a clock are marked as
> > critical before disabling it.
> > 
> > I'm not super familiar with the intended semantics of critical clocks.
> > If we need to manually mark all parents of critical clocks as critical
> > as well, then a (potentially partial) fix for the Avenger96 might be:
> > 
> 
> Marking parents critical hasn't been strictly necessary so far because
> we've been relying on the prepare/enable count on a critical child to
> keep the parent prepared/enabled.
> 
> > 
> > I just looked for CLK_IS_CRITICAL clocks in that file that have the
> > CLK_OPS_PARENT_ENABLE flag, and marked their PLL parents as critical
> > as well.
> > 
> > An alternate approach would be to skip the parent enable/disable pair
> > in the problematic patch in __clk_core_init for clocks that are marked
> > as critical, because if the parent wasn't on for a critical clock then
> > we wouldn't be in that function, we would be dead.
> 
> The parent may not be known yet in __clk_core_init() because we lazily
> find parents. Putting it another way, we can get to the recalc_rate()
> call in __clk_core_init() for a clk with CLK_OPS_PARENT_ENABLE when the
> parent pointer is NULL. This hasn't been a problem because when we adopt
> the orphan clk the rate is recalculated (see
> clk_core_reparent_orphans_nolock()).

In this instance, it doesn't seem like the parent pointer is null, since
it does print a parent clock name. I think the problem really is that the
parent gets disabled before the CLK_IS_CRITICAL check re-enables it.

> I don't see an easy way out of this problem because in general we need
> to know a clk with CLK_OPS_PARENT_ENABLE is parented enough to be able
> to read the registers when calling clk_ops like recalc_rate() (and
> probably get_parent() as well meaning that clk_op can't touch
> hardware?). Maybe the simplest approach is to skip any sort of hardware
> access when this flag is set during setup and reparenting.

The issue both SoCs seem to run into is that the parent gets disabled
when it shouldn't be, which I fixed in [1]. I don't think any platform
that already worked before this change will stop working with this fix
and the fix for the fix in [1], because if the parent is absent, then
the enable/disables are no-ops anyway. NULL clocks are explicitly
handled by the common clock framework.

> BTW, I don't know what this patch is actually fixing, so I'm going to
> revert it. When it is resubmitted please describe the problem you're
> seeing.

The justification got lost in the revisions of the series this was done
in. It's to deal with the MediaTek MT8196's MFGPLL clocks, where the
parent clock needs to be on before the clock registers of the child
clock can be touched in any way. I first modeled this as an RPM clock,
but Angelo didn't like this approach, and with some hackery I could sort
of see that the child clock indeed does not tick if the would-be RPM clock
is off, so it must be a parent clock instead.

The problem with making it a parent clock and adding this flag to it though
is that the flag is not respected in recalc_rate, so it reads from an
unclocked register.

If you want me to make it an RPM clock instead, I can do that, but then
we're leaking that the NXP i.MX8MP has a broken clock driver into the
device tree bindings of the MediaTek MT8196 PLLs, which seems like a hard
sell for the DT bindings maintainers.

So in conclusion, I'm fairly confident I've found a fix for the fix, and
I'm also very confident the problem doesn't go as deep as you fear. I'll
squash the fix for the fix into the fix when I resubmit the fix with a
fix for the i.MX, but that'll have to wait until after -rc1 I think.

Kind regards,
Nicolas Frattaroli

Link: https://lore.kernel.org/all/20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com/ [1]


