Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95096341050;
	Fri, 19 Dec 2025 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766172746; cv=none; b=c/jejM91fuX1HV1OMl8FgvQFDW0khOfKlyBMBb6pMhqay1ZSrssSDbP49XsQcV7v+/xix/iM7VrtLIJjMFsBrJfrFtRf3Rfn9Wl9BlxpDIFY/YVcVD8hqfVN79VGT1rmUQHng8OJGWVDXP3zeDuh1wQrjlBYRiZgNxOujey7Pco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766172746; c=relaxed/simple;
	bh=dxdW68X2kvLQgIr4oNlWMogIiBjhXtoI9Gpq80I84oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH7Sgy0zeiuSPmsZ0cG+lHWd1lfKHSsPvYrFOt3l0VVAUJfyJsiN2A3ezKEU3tTRoaFoJ7AqKUGd60uL/+2egj0emW647cbNiPnyuAJaXw4Ei2wtScFZGKunyD5tFvVKlIj4BQfSnoScOaOvLJLWm/OQuW1vUiYi5/C2Uc6iyxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2Hk/sUS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2Hk/sUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227CDC116B1;
	Fri, 19 Dec 2025 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766172746;
	bh=dxdW68X2kvLQgIr4oNlWMogIiBjhXtoI9Gpq80I84oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2Hk/sUSg4OqBlDtU58XABw0wWGbLVpkC2I8FBz9kZo0dTu6zsCwm+ICKhyWBm9Wo
	 Ujn72u37NBQmzYsiyI1avGwf2y8P0OdLCFSY7VEFgu8C9OeXhGvHfO1Bv8JosjqLdD
	 LSVEaNb9NOX32DcFw6Sveko/O3UJYx/p48+PdXp/3uYxrqq1oXJP2AwSOXK3Pj9IZb
	 opuTk7YvtGsNKsPHzrK2XZFx2fkaZFGmgOZi3+O4fWpVQelsUvMlVYCYewmUO5EDxM
	 UcXbIUo6skcH1CjiL5IFUoTlbuCTVnXxpmWATECg26ZW9wP6cFatZo+dznw6sZz2l+
	 UG4+aUp7gy+0A==
Date: Fri, 19 Dec 2025 11:32:24 -0800
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>, Yao Zi <me@ziyao.cc>
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
Subject: Re: [PATCH 0/7] Implement CPU frequency scaling for TH1520
Message-ID: <aUWoSNI2mFaPARfI@x1>
References: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>

On Thu, Nov 20, 2025 at 01:14:09PM +0000, Yao Zi wrote:
> On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
> reparented to one of the two PLLs: either to cpu_pll0 indirectly through
> c910_i0_clk, or to cpu_pll1 directly. This series fixes a bug in PLL
> enabling code, supports rate change for PLL, and finally implements
> frequency scaling support for c910_clk.
> 
> However, to achieve reliable frequency scaling, CPU voltage must be
> adjusted together with frequency, and AON-firmware-based PMIC support
> for TH1520 SoC is still missing in mainline. Thus PATCH 7 that fills OPP
> table for TH1520 CPU and enables CPUfreq is only for testing purpose,
> not intended for upstream (yet).
> 
> Testing is done on Lichee Pi 4A board, only operating points safe
> to be used with the the default PMIC configuration are enabled in
> devicetree. I've confirmed there's a performance gain when running
> coremark and some building work compared to the case without cpufreq.
> 
> This series is based on next-20251120, thanks for your time and review.
> 
> Yao Zi (7):
>   dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
>   clk: thead: th1520-ap: Poll for PLL lock and wait for stability
>   clk: thead: th1520-ap: Add C910 bus clock
>   clk: thead: th1520-ap: Support setting PLL rates
>   clk: thead: th1520-ap: Add macro to define multiplexers with flags
>   clk: thead: th1520-ap: Support CPU frequency scaling
>   [Not For Upstream] riscv: dts: thead: Add CPU clock and OPP table for
>     TH1520
> 
>  arch/riscv/boot/dts/thead/th1520.dtsi         |  35 ++
>  drivers/clk/thead/clk-th1520-ap.c             | 350 +++++++++++++++++-
>  .../dt-bindings/clock/thead,th1520-clk-ap.h   |   1 +
>  3 files changed, 379 insertions(+), 7 deletions(-)
> 
> -- 
> 2.51.2
> 

Applied to thead-clk-for-next, thanks!

[1/7] dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
      https://git.kernel.org/fustini/c/5f352125f8a0
[1/7] clk: thead: th1520-ap: Poll for PLL lock and wait for stability
      https://git.kernel.org/fustini/c/892abfbed71e
[2/7] clk: thead: th1520-ap: Add C910 bus clock
      https://git.kernel.org/fustini/c/b436f8a82aaa
[3/7] clk: thead: th1520-ap: Support setting PLL rates
      https://git.kernel.org/fustini/c/238cc6316a88
[5/7] clk: thead: th1520-ap: Add macro to define multiplexers with flags
      https://git.kernel.org/fustini/c/5dbee3503771
[6/7] clk: thead: th1520-ap: Support CPU frequency scaling
      https://git.kernel.org/fustini/c/30441a56b1d1

-Drew
