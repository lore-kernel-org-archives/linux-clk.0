Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D343148CF;
	Wed, 28 Jan 2026 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617932; cv=pass; b=jkZghw3nZMWKXmNtO2BsbtJ6AUnBiEYpxGSs3vBLsiN5fpttY6xYJ0OHHvH3LS9mmG9BZR6oJXutwJqHOvqU4w6ZePK7EKWfJffX0G3hxBMZFH0gojpKj+6yfw1wLiTfqk+47Y5b+ERWOMtBuKu1vbullFH3rJXcjpMJJ26RVyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617932; c=relaxed/simple;
	bh=RnJatRpB2fsKQQVLbKsKdBWC5ZbQqYhGTTVZu42Ja9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTLniWB2iP1utiKWsq3BPytx9MY/EnfLP7I/OYA02okcd44L8Nw+7xuYl6ZimNc+b+xGbFDZiooxD+XecNpVbFJ88mzgyiCgKP5qfk2TepM3gU/cp8QeUjgOZWNaW8+BxzIqsD8decqJJDxJ1qGUuU5v+5iFnew4BKwo6LFTkG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=VjVYoi0i; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="VjVYoi0i"
ARC-Seal: i=1; a=rsa-sha256; t=1769617904; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l0Cg2TLttp29EHOBbwKdxXJx+xlCqUIDwMhiHRrGcQlQGxQAl+cbZZerzf/yJHdqENXi5i78EEPnmq3+QYV8q4vvV8IWlYbvGN/uJ2gzeEBvDZDAM43l9ZOg2u9FUdZXXcQ/4FA6I3JNJSz/PcWLCLwi3su1GgLBc67MIQTpbHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769617904; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8fXtwqHC1+p9P6rO/BH9MhMmi1JYpoUyS2OtqfTLx8w=; 
	b=Tit4ublDdDnnqeUwnRqbpWJRVKT2vv0aWR/loA9NmvlXRdcRjBDS5VAeiKKTrvLV95CzNrJRCUA99UMmD/Y3Ve7pOUTOY8K7CzHXlr4RlBw37CABf1RKXLKJP6x+hNzoIDQZix9WO0j8K573szEPYqwghhyqk5mFQDRu7b+4oYE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769617904;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=8fXtwqHC1+p9P6rO/BH9MhMmi1JYpoUyS2OtqfTLx8w=;
	b=VjVYoi0i5YsN0KQC4EBuW3yAqSs2dSzu7H9QUTMdimJxMNtl7zz2WeKlWSLiSvpZ
	dEGVTOldZ2er6i/gG0zTZPIQ9pWpS0jMY3Sg1r2xtX4ibMZJqQkwvOnzgF/sGX6VkBX
	iW/vsl23jzF/L9HMyNIHIEIYD7a6NuSUtxDl5vVw=
Received: by mx.zohomail.com with SMTPS id 1769617901729754.2671002504206;
	Wed, 28 Jan 2026 08:31:41 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mark Brown <broonie@kernel.org>
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
Date: Wed, 28 Jan 2026 17:31:35 +0100
Message-ID: <4040610.5fSG56mABF@workhorse>
In-Reply-To: <9ed19fb1-258f-44c4-b816-73c0d7d28a6e@sirena.org.uk>
References:
 <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <5050249.GXAFRqVoOG@steina-w>
 <9ed19fb1-258f-44c4-b816-73c0d7d28a6e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, 28 January 2026 16:21:47 Central European Standard Time Mark Brown wrote:
> On Wed, Jan 28, 2026 at 03:55:54PM +0100, Alexander Stein wrote:
> 
> > This is for TQMa8MPxL/MBa8MPxL:
> 
> > [    1.452788] __clk_core_init: enabling parent audio_pll1_out for clkout1_sel
> > [    1.457677] __clk_core_init: disabling parent audio_pll1_out for clkout1_sel
> > [    1.464270] __clk_core_init: enabling parent audio_pll1_out for clkout2_sel
> > [    1.471760] __clk_core_init: disabling parent audio_pll1_out for clkout2_sel
> > [    1.478360] __clk_core_init: enabling parent sys_pll2_500m for arm_a53_div
> > [    1.485259] __clk_core_init: disabling parent sys_pll2_500m for arm_a53_div
> 
> As expected same result on i.MX8MP-EVK.
> 

This one puzzles me a little. arm_a53_div is neither marked critical
nor is its parent. If arm_a53_div is required for the system to function,
then I'd have expected at least it to be marked as critical, allowing us
to do the workaround in init I proposed as an alternate solution for the
stm32mp1 in my other reply.

Also, after reading the code some more, I think that alternate solution
has a simpler implementation: move the parent disable to after the

  if (core->flags & CLK_IS_CRITICAL) {

check in __clk_core_init.

One explanation is that some other critical clock hangs off sys_pll2_500m,
but we're spoiled for choice here. I can't think of a simple fix right now
that I feel confident in.

Every IMX8MP composite clock that isn't critical seems to set
IMX_COMPOSITE_CLK_FLAGS_DEFAULT, which includes CLK_OPS_PARENT_ENABLE,
which seems like a pretty weird choice to make when you then rely on
the parent not getting touched during __clk_core_init.

I will try to get an RFC fix out tonight (CET). I think STM32MP1 is
falling over because I messed up, and i.MX8MP is falling over due to
a combination of me messing up and its clock driver messing up.

Kind regards,
Nicolas Frattaroli


