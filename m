Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C123D8101;
	Tue, 26 May 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801819; cv=none; b=amo4byXd/iPpYhk6SzLsbxD86VBd84lAXj0p8Eh8LV+K1iMO2MD4KpTuLomJlc9m5MZ2BlNogxiI/odTm1WCFU73+nPPpjpCbQeNHguiw+LBxs4nNfJ37j9CA9oqM3/EAgawqvH7sZf6BOUJQr3xQ6wgQdbq8Zd4VV9GKiGugPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801819; c=relaxed/simple;
	bh=xa6v7ngwc2cnj2rf28HH4G6L+Fet3va6uvGYQWGwXJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvIF4oZtwGwj7WaF7zkgKSM6b6u2I5vM3Fe/sEoY0AQs4k3oxgLt3PdJ2g7JrCav63xVVUFEUFtjiBVSv+Ro+Ao+8DJrnkBtSBJkU65T/5AIGJ+vq8Bgml4ETNYO0st00pUT9f4CMsToxRR8h0KUTegrPNavZwh9PUnA2YR/Iu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTi/aKLT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTi/aKLT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A441F00A3F;
	Tue, 26 May 2026 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779801818;
	bh=9fv80VV3utaUxsA1KkGnOso3BBAIoOuR6H5XCcuVXds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTi/aKLTZSU5m++odfVsqV0tvdnglLJGcUt1yQXeOcWjp16HnZX3gEzUPYFIJyFR4
	 5/5PpS8OOhURwqtbi2RTL4jyoITqoLKMuxjr80SLTrhUA8WY0MZsz9IhlwLP6GD9bj
	 AOfI255lVQnHYLngP29jtv7+RuCo60LxAK5xLpf9h+CZTZRl0rfKQ+xIZzaRRJyIyV
	 4HnJJCthLDeZOZ8l4+rneOLIcfPjblzCIZ3dNWANSGt5vdgv8BZtdh/FV4ITlphWil
	 Dj9bRVrDBoT0RmyGdvDdl5PhyWbv6pVGkYui+1c2kkXlSVpM6CkUdoidB9VaayVWJ/
	 /99rRGxhRac7A==
Date: Tue, 26 May 2026 13:23:35 +0000
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH 2/2] reset: spacemit: k3: fix USB2 ahb reset
Message-ID: <20260526132335-GKB3748271@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
 <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>

Hi Philipp Zabel,

On 02:58 Mon 18 May     , Yixun Lan wrote:
> According to SpacemiT K3's updated docs, the USB2 ahb reset and USB2 bus
> clock enable bit was wrongly swapped, the correct one should be:
> 
> Register : APMU_USB_CLK_RES_CTRL
> bit[1]   : usb2_port_bus_clk_en
> bit[0]   : usb2_port_ahb_rstn
> 
> Fixes: a0e0c2f8c5f3 ("reset: spacemit: k3: Decouple composite reset lines")
> Reported-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Would be it ok from your side to queue this patch for v7.2 cycle?
or do you want me to combine it and go via clk tree when sending PR to
Stephen? I think as long as they are accepted in same cycle, then should
be no problem, otherwise will result a broken USB2 driver.

P.S, we will activate USB2 driver for K3 in v7.2, so kicking this in
same cycle should be a good reason, no necessary to rush for v7.1 fix..

> ---
>  drivers/reset/spacemit/reset-spacemit-k3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
> index 9841f5e057b2..2e87f320cf11 100644
> --- a/drivers/reset/spacemit/reset-spacemit-k3.c
> +++ b/drivers/reset/spacemit/reset-spacemit-k3.c
> @@ -112,7 +112,7 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
>  	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
>  	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
>  	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> -	[RESET_APMU_USB2_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_USB2_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
>  	[RESET_APMU_USB2_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(2)),
>  	[RESET_APMU_USB2_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(3)),
>  	[RESET_APMU_USB3_A_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(5)),
> 
> -- 
> 2.54.0
> 

-- 
Yixun Lan (dlan)
