Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A258262FF8;
	Thu, 27 Nov 2025 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764275643; cv=none; b=g5A7loH0S/P44Mb6UWmexXyiffM/hT9Z3momor42bpwcpquiN4FAgUHT16rMwh1EGY4sc/6fOyk/z2cu6f4VlGvaZM9xe385I/1+n59pyrrPC0/44Eue20sU8l0huRwQM161CctqA5tR3IKTIm5v9RZo0WLuLADceVVpuBSNoiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764275643; c=relaxed/simple;
	bh=iaUkQzHWoFtelBiaVO6hPpyfUhchc6MEcbKNHDj+YO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNFFu3RV3rvY1YrbKKwIa4GlHQLtwBbchEkzbcJCbgI2QIrIZwV4hsctH2wbhoyNlPpR3kWw94hUP32KOLQk+ykTZLwdosHUIf+END00BbpxlmjxNT0NqJ9Z2gK7PZjydk+t837ZZkzs5D2lQ0VMawztMpqHnwXIauocaF2R0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfAQPPNr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfAQPPNr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99949C4CEF8;
	Thu, 27 Nov 2025 20:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764275643;
	bh=iaUkQzHWoFtelBiaVO6hPpyfUhchc6MEcbKNHDj+YO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfAQPPNrkwDVGw1LMaEzzsxYcumtf2XjM0DixGYbmPfpXORU9ijySXiOMMY5bM3x5
	 cKGV3KOAC1wchviAmtEagCtsi1DFDsbi1xtvLxzVZ/lCo8wyaPwSMBOLxAO4vH5/vw
	 cO/hxQYAtt62LYFyXXXDpinq6jreqVvkRuVa/HV93Nu83g9LI+8JnxJ7XgF2Dxa+Qc
	 Ucn6o148G+8yHwZhgVsVqlAvKJpLJay2xm41q9DO1TGff5Z+PBCeJYLEPFJSIhvVXH
	 ARAAMl/Sq6a3H85AjcpxC3JC5MPS7QFFD/+qi5T6FSuuCltobAZqCqjRycKQGclY5K
	 fDnL/MsLvN9FQ==
Date: Thu, 27 Nov 2025 14:33:58 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
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
Subject: Re: [PATCH 6/7] clk: thead: th1520-ap: Support CPU frequency scaling
Message-ID: <aSi1tlmBdZ5fZHqR@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-7-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-7-ziyao@disroot.org>

On Thu, Nov 20, 2025 at 01:14:15PM +0000, Yao Zi wrote:
> On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
> reparented to one of the two PLLs: either to cpu_pll0 indirectly through
> c910_i0_clk, or to cpu_pll1 directly.
> 
> To achieve glitchless rate change, customized clock operations are
> implemented for c910_clk: on rate change, the PLL not currently in use
> is configured to the requested rate first, then c910_clk reparents to
> it.
> 
> Additionally, c910_bus_clk, which in turn takes c910_clk as parent,
> has a frequency limit of 750MHz. A clock notifier is registered on
> c910_clk to adjust c910_bus_clk on c910_clk rate change.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 148 +++++++++++++++++++++++++++++-
>  1 file changed, 146 insertions(+), 2 deletions(-)
[...] 
> +/*
> + * c910_clk could be reparented glitchlessly for DVFS. There are two parents,
> + *  - c910_i0_clk, dervided from cpu_pll0_clk or osc_24m.

Typo: 'derived' instead of 'dervided'.

[...]

Unless there are other comments that require changes, I can fix up the
typo when applied.

Reviewed-by: Drew Fustini <fustini@kernel.org>
