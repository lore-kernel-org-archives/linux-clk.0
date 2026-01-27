Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39852222AA;
	Tue, 27 Jan 2026 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537925; cv=pass; b=NMWn2iw0PnSt/WQWk7m9w1E//fIgG5NkOWwR6VkT3oR2yJllE7G78nV/7Ms37Bt8+V63bv2pgBjG7imGgq0NIHd/nkE+7U2Hyx2XgIvPGU200hA9hulEuYyHlnhEAG+bKlVsYfcYOaJ9J8q2CZ1ax4QKHLlqyp8X+mHekXK3uCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537925; c=relaxed/simple;
	bh=9iCO1wGIfJOwBpVB8m67cNrfBretpFbo+vDZybEnHKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJsu2BPZ1qlGWl5ZXZHDhMn///joOcHmZEUax/3G14DXwNQ/FgCFZbWBWiFJzrAR9qMfkB+z5NgSDll044qSM47a0iZ8leglXv4hHoyQHtn619hm/CZG4slcWyR4QhrD5RxkWMtWQu1NS/DDs83K5HrEmibz/Q5grNGtocSe7Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=cgyGGkii; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="cgyGGkii"
ARC-Seal: i=1; a=rsa-sha256; t=1769537891; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fEb0Cw0/fBkS8pB0EZvsd01qretjQhA9PdmsjDAZ2GyHqlsAwojf9WvigoKbhEdpZFndyMkv+fPCTQAtVFxTEEMO3W9tNaxKQTXWaEzvhZtn2INA42ZQaitNZYDILx7m+TnXWk+2m0wzyW4G/7T0yYs8xFQ4UlCF6HXkjyvNwBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769537891; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1O10nq57uF2yonMLHejTJonR3kk2tYwvSO30+vtuA7Q=; 
	b=Udg8Byuy82YLS3nLoyIU67KXzJ9Jo2n15L1LIv0ZbWZmijGKUbK0KWSI26REhRRnhVTtfm+58TLJArSSxVokMMBfXtrpaoOIkLmv/x0BhwEX3bBL2nuGSdNjA8ca4jSOwUn9ucBWNRZyvJy6OKVlnL1U8FC5jW4zj3ZfUr641b0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769537891;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=1O10nq57uF2yonMLHejTJonR3kk2tYwvSO30+vtuA7Q=;
	b=cgyGGkiipdrS15+YkTQU3VtWMDwt3STN5bYx656tenyNtnVtPXA4PeTjgpF9qlEt
	EJNKoG8RiZZfemBiNic0WN4pLV3I6hcyOWJNHY0lLzOxLzt4idbPvN+sK4VO9xZFJ5J
	ZzI/VI4v1vHHGbBPzIGp6xh61Vw48cb+FWkJ6jgQ=
Received: by mx.zohomail.com with SMTPS id 1769537889900300.4354081160377;
	Tue, 27 Jan 2026 10:18:09 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Tue, 27 Jan 2026 19:18:02 +0100
Message-ID: <6800096.lOV4Wx5bFT@workhorse>
In-Reply-To: <4ea31b0d-af6e-44f7-86e4-35a43b8c71e7@sirena.org.uk>
References:
 <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
 <4ea31b0d-af6e-44f7-86e4-35a43b8c71e7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 27 January 2026 18:25:04 Central European Standard Time Mark Brown wrote:
> On Tue, Jan 27, 2026 at 05:01:35PM +0000, Mark Brown wrote:
> > On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> > > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > > operations, such as setting the rate or switching parents. However,
> > > another operation that can and often does touch actual hardware state is
> > > recalc_rate, which may also be affected by such a dependency.
> > 
> > I'm seeing boot regressions in -next on the Avenger96 which bisect to
> > this patch in -next.  The board resets during startup:
> 
> I am also seeing some similar regressions even earlier on i.MX8MP
> platforms, though they're resetting even earlier before any output is
> produced (even with earlycon).  Didn't confirm yet with a revert or
> anything though.
> 

Someone else seemingly bisected to this commit on i.MX8MP as well
and replied to the RESEND of the series, and confirmed with a
revert[1].

I'm somewhat surprised by this, because to me it doesn't make intuitive
sense that some platforms would rely on CLK_OPS_PARENT_ENABLE to not
enable the parent clock during a recalc.

Can someone let me know which clocks (with which parent) in those
affected devices is causing this? I'm wondering if this change
unmasked some undeclared dependency that it's now stumbling over
because it's enabling the parent earlier than ever.

Would appreciate if we could fix up the affected platforms rather
than revert this, because the platform I added this for was
definitely using a parent-child relationship, and definitely
needed to have the parent clock on during recalc.

I can always bring back the RPM model I went for previously, but
that feels like more of a hack around this caveat than a proper
description of the clock relationship.

To not have me break everyone's -next for days on end, feel free
to drop this patch. MT8196, which this was added for, doesn't boot
with mainline yet anyway.

Kind regards,
Nicolas Frattaroli

https://lore.kernel.org/all/6239343.lOV4Wx5bFT@steina-w/ [1]




