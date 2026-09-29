Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681D52C11F3;
	Tue, 29 Sep 2026 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669173; cv=none; b=ovs/Ej15l3WZjmn82QX8eh4w/vr34pPDv7i9D/EB+TWKtwOIfG/Uk0WI/VfI+jqhFsEKxr48Wu4RsfWyK93ZFr9jEXPvfZTbxvhIY29JXtFN/lA3AmmCJsDgF2BuLXACbVq7u1acVVGq0ZxyknkizP09TaiLt4+62PXiZok7Uek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669173; c=relaxed/simple;
	bh=NQuYWNXbM0um/Bk7OR6ZqeBZzo7ZYc2JRC/8GYTckbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOcM/AeTSrFyLV8UPGcJV4xyFh+G16aZGejabGByzIx8IwLDwoqZ8kTKF/vgadOG1qypx0q47gJ3a8xw51vWxI85v9D7guUVOKbthiE2gWE1Ag4OS1Fy/p032QF7dLGNkiLZpteEnXp5o746dmLfzeYmPaN9m855c/n+dYVfRm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhc06+TD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhc06+TD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098921F000FF;
	Tue, 29 Sep 2026 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790669172;
	bh=pBbBU/HalPPdxadYVBZuB6Z8V7u65zmk+9HH6iJyTQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhc06+TDSSn0Qp2gvtELwnLLPGSzjUZ9bt5WehGAa6kt/hauPnB0fRp7DFBdAyu3R
	 NNhHDZmV7FdmcjjK/clPXhb/9xvxlFKkjU/USyJ397mLKQO6yexI5Vn2ZHWBaQiNtC
	 6LxvrL23+BktUa4LbIPzdDaUuMp9xzTcIQdI4JdcWtuvUEwnzscJoLVF0T5vE7wtpK
	 NS0Jk0DRNWjaJtb2irlJLlHp3qbUdzN2KymvqXNnX56HcMnaFfxG15SqsJFh99qH0J
	 PyjhjPyl+BDUF2OiIN9zx4RsMkyP+rVxLrE5//INogcLDTY8WNNL/qVB1I45ZDHJEF
	 7d1jZ7rVirlMg==
Date: Tue, 29 Sep 2026 10:06:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Message-ID: <20260929-smart-hairy-puma-e4cf8e@quoll>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-4-shengchao.guo@oss.qualcomm.com>
 <3l6v5idon2edkritzyqlmvdjn5ijt3lytp656sxicfnqah2rga@o6plxiv5d53u>
 <araTYLZoYUKyQw5b@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <araTYLZoYUKyQw5b@QCOM-aGQu4IUr3Y>

On Fri, Sep 25, 2026 at 11:29:36PM +0800, Shawn Guo wrote:
> On Fri, Sep 25, 2026 at 12:47:16PM +0300, Abel Vesa wrote:
> > On 26-09-25 00:11:52, Shawn Guo wrote:
> > > The videocc node passes GCC_VIDEO_AHB_CLK as its second input and stops
> > > there. videocc-sm8750.c declares its DT inputs as DT_BI_TCXO,
> > > DT_BI_TCXO_AO and DT_SLEEP_CLK, so the second input is the always-on
> > > board XO rather than an AHB clock, and the sleep clock is missing
> > > entirely.
> > > 
> > > The missing third input leaves video_cc_sleep_clk_src unable to resolve
> > > its parent, so it registers as an orphan clock and cannot be rated.
> > > The AHB phandle in the always-on XO slot is not resolved by the driver
> > > today, but it implies a parent relationship the hardware does not have.
> > > 
> > > Pass bi_tcxo_ao_div2 and the board sleep clock instead.
> > 
> > So videocc can still function properly without the GCC video AHB clock then?
> 
> I do not have a sm8750 device to test, but I did verify the same change
> on Nord, and videocc can still function properly.
> 
> Dropping gcc_video_ahb_clk as a videocc input clock shouldn't break
> sm8750 videocc from what I can see.
> 
> - The AHB clock isn't a videocc input at all. The videocc clocks array is

Why is not input? You keep using in the commit msg and here only driver
arguments. This is not an argument for hardware change.

>   positional and the driver maps index 0/1/2 to
>   DT_BI_TCXO/DT_BI_TCXO_AO/DT_SLEEP_CLK.
> 
> - gcc_video_ahb_clk cannot be consumed anyway. gcc_sm8750_probe() leaves
>   it always enabled in probe and never registers it as a clk at all. So

Again driver argument. So if driver did not leave it enabled, then
hardware would need it?

Best regards,
Krzysztof

