Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C34D328610;
	Tue, 30 Jun 2026 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782859843; cv=none; b=tuP4GAZJgpZ+mnKAnHglG3GbhLzswvn1ig6cJgWtDDAU780yUXbP86JbNXL/6eJAOGQlRZIOSfF8ue+LCb7XBHb3jZbGP3knK6KSrpWizVBvaUum2W2g1vxqzKgvlvJTSApSL8EueTnFQqDaOPK+/wS4zt17aKxtME7wXP5p5b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782859843; c=relaxed/simple;
	bh=WK65EqWG49fz7Gei0aplao/IdtWr3EkbeUgsCfjj4N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBfBG7QFtujOfGnHBAexmdQDFNuJEgXmtFD6laVA4jlmCb/2rPoV53tmfY/bJMp/amwuU/NSulpIN/u7Dfn3+m/kHBLvj19zk2RGWe6Q4SHZPdT6pLvHsHe2vzOAtbqQPfFjuSr0BJ+S3ulo6mO5GkoDOhJMXAaSHdKPvA6O48M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=nv6C1qCZ; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="nv6C1qCZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=4yOHXYidOTt8EhkcSsV80MxwAjWABsRVdmYL86w7iKY=; b=nv6C1qCZ52dQll0ATVWSGqe61j
	4GGPxai7Q/raLVXMvWoQ5+8asMYzfXqfDlrjwOhFvHTY3WNhIljufACORK1A1RSc8OnPrVv1uXV80
	7rB1YPCnN9fhwe2JG5MlrXWjvL6dMsr49mFyXqcMXWE2DDOVyFGB7HOCX74d9X29cGe85wgySbEkN
	fy+PxMWty6OyWs6rtTJHPf5an7OkYQ0ky4rGhtmqD6h3tbvpihcniA64emjVcZBu7PVaYzqqqugrA
	nH7+GXRf9t+Y7X42UW+55iH5NK+VaUjsMMAJJvh0E1v/AhgRoYMFgirglEIGDZF86rmEbMZEp8H00
	vOEyxhFQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wehHV-0000000DyYV-30ci;
	Wed, 01 Jul 2026 00:50:17 +0200
Date: Wed, 1 Jul 2026 00:50:17 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Drew Fustini <fustini@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: spacemit: k3: set hdma clock as critical
Message-ID: <akRIKSoI8zWlfcfJ@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Drew Fustini <fustini@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
 <20260630-06-clk-hdma-critial-v1-1-443c0ac88c5f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-06-clk-hdma-critial-v1-1-443c0ac88c5f@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026-06-30 08:53, Yixun Lan wrote:
> HDMA clock is responsible for the internal TCM access path of X100 RISC-V
> core, so set the clock flag as critical to prevent it from being shut off,
> otherwise the Linux system will hang.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Reported-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu-k3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> index cb0c4277f72a..f0160b4c0e1b 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -1026,7 +1026,7 @@ CCU_MUX_DIV_GATE_DEFINE(isim_vclk_out3, isim_vclk_parents, APMU_SNR_ISIM_VCLK_CT
>  /* APMU clocks end */
>  
>  /* DCIU clocks start */
> -CCU_GATE_DEFINE(hdma_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_CLK_EN, BIT(0), 0);
> +CCU_GATE_DEFINE(hdma_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_CLK_EN, BIT(0), CLK_IS_CRITICAL);
>  CCU_GATE_DEFINE(dma350_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_SDMA_CLK_EN, BIT(0), 0);
>  CCU_GATE_DEFINE(c2_tcm_pipe_clk, CCU_PARENT_HW(axi_clk), DCIU_C2_TCM_PIPE_CLK, BIT(0), 0);
>  CCU_GATE_DEFINE(c3_tcm_pipe_clk, CCU_PARENT_HW(axi_clk), DCIU_C3_TCM_PIPE_CLK, BIT(0), 0);

Thanks for the patch. It fixes a system hang occuring when a vector 
instruction access generates a page fault.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
