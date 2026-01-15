Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0E241C63;
	Thu, 15 Jan 2026 01:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441815; cv=none; b=SbVGe30eHomwTK4zYAKAGGA5Tqoey6RaVrYMjwUJoR+Bj6SH4sN1EtbKgpr9c9apxcYekWichHDhy3IVRIBKEerNEiyuoo1ygT7dEy+u0cF2/4E4VoPk+B2sFXs9aKzfdIrWKaXM7J7T1DbWfIIu+1AH2E7gQEajNO0FeSizAbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441815; c=relaxed/simple;
	bh=HT9KhvfEL51j6LmqfG+h7ryX8XjjUq1a+PKewitsH6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICFKm+raYAhwWl0QnZ223piNknKdy2qyp6sGFIPxswPcfDO7lSG5opIAh8/ehdx9zHZwOXkRLSrVOYQk8uhgNuniFK++AaKdvicTuZJbf1jvFTOIg84d/o6OZ/DjhHuhDR7RUeDz4O7MszmAuwx48r8j1Qyp/7rbd6qMZgfUrlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1FPZdxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1FPZdxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92977C4CEF7;
	Thu, 15 Jan 2026 01:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768441814;
	bh=HT9KhvfEL51j6LmqfG+h7ryX8XjjUq1a+PKewitsH6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1FPZdxaNCMPPJy1rc/yLdWArPG1EzMZCTEVCGqrr5NFtdZYFIpwYzQX0os1fa3ml
	 Tzu3hptM7UCx4qZY+MqKUY8guAe1gFRHRGMdYqIv3fH/IyuPHHEP+Hnx1r/pa3z/dJ
	 6nQFZKCZVDaXUUH6HWnu504WBlo1BnGdhmC1pWinGoGEWFDqy+A0B1vFvUBkMCTho7
	 pRbp7HQqc4OXiGhRbN0jOHJYM2TVzUSpLOmESqgldLLrWhpe7qAG7QDusdkCmTNLI3
	 Lco+9zVE8TdGw7TlNJQtwCWNpoGHEY0ayoHP/2+xY16vAWuBmr9iuM9sPVy8d3DjSH
	 wMbNqZ/Ly0Lfg==
Date: Wed, 14 Jan 2026 17:50:13 -0800
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>, Yao Zi <me@ziyao.cc>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 0/7] Implement CPU frequency scaling for TH1520
Message-ID: <aWhH1aFUIieN4zVj@x1>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <aUWoSNI2mFaPARfI@x1>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUWoSNI2mFaPARfI@x1>

On Fri, Dec 19, 2025 at 11:32:24AM -0800, Drew Fustini wrote:
> On Thu, Nov 20, 2025 at 01:14:09PM +0000, Yao Zi wrote:
> > On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
> > reparented to one of the two PLLs: either to cpu_pll0 indirectly through
> > c910_i0_clk, or to cpu_pll1 directly. This series fixes a bug in PLL
> > enabling code, supports rate change for PLL, and finally implements
> > frequency scaling support for c910_clk.
> > 
> > However, to achieve reliable frequency scaling, CPU voltage must be
> > adjusted together with frequency, and AON-firmware-based PMIC support
> > for TH1520 SoC is still missing in mainline. Thus PATCH 7 that fills OPP
> > table for TH1520 CPU and enables CPUfreq is only for testing purpose,
> > not intended for upstream (yet).
> > 
> > Testing is done on Lichee Pi 4A board, only operating points safe
> > to be used with the the default PMIC configuration are enabled in
> > devicetree. I've confirmed there's a performance gain when running
> > coremark and some building work compared to the case without cpufreq.
> > 
> > This series is based on next-20251120, thanks for your time and review.
> > 
> > Yao Zi (7):
> >   dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
> >   clk: thead: th1520-ap: Poll for PLL lock and wait for stability
> >   clk: thead: th1520-ap: Add C910 bus clock
> >   clk: thead: th1520-ap: Support setting PLL rates
> >   clk: thead: th1520-ap: Add macro to define multiplexers with flags
> >   clk: thead: th1520-ap: Support CPU frequency scaling
> >   [Not For Upstream] riscv: dts: thead: Add CPU clock and OPP table for
> >     TH1520
> > 
> >  arch/riscv/boot/dts/thead/th1520.dtsi         |  35 ++
> >  drivers/clk/thead/clk-th1520-ap.c             | 350 +++++++++++++++++-
> >  .../dt-bindings/clock/thead,th1520-clk-ap.h   |   1 +
> >  3 files changed, 379 insertions(+), 7 deletions(-)
> > 
> > -- 
> > 2.51.2
> > 
> 
> Applied to thead-clk-for-next, thanks!
> 
> [1/7] dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
>       https://git.kernel.org/fustini/c/5f352125f8a0

Conor - can I included this binding patch in my thead clk pull request
to Stephen?

Thanks,
Drew
