Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169603A3811;
	Wed, 18 Mar 2026 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837407; cv=pass; b=KD6jzwVPCStBQYbmzw3iek9Gq0tr3gj5O5KMFLEUe7KNZDqjqs/bW7V+DjHNqH0VHYFBfMVc317B0/niCtsnrnI1uP8+2ocW89yR1ai/dy3kXix+BsbvlWM8u5OZ20aeGjEFM10OXEx5cLNf4iU6SC1QUT88/tQCFVOwUgnfzfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837407; c=relaxed/simple;
	bh=xp2+KXWMoCS68GBhKubDEdw9t8R6SkP9dmD027p2X+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B5+/hGvn/EQ6s1tnsOSf8WZOBiOy5jtTN/XEVfBq+grJyhsIP4Ds9E9tmcthUxcMA2YW71a/G5Eba8lqPYSd+mNRYiIULsJymUPIE58919qrD+Sflqcbt+cnZcO8I4W+PKUzYS73X9okPNak/MX44wVHH2k6lvDjpcNQVcSZk6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Z+jonyye; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Z+jonyye"
ARC-Seal: i=1; a=rsa-sha256; t=1773837347; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CBxN97Qi19FNhuvIfPGCePkR+Vur/noh/3S3UvtMbpsVRDjLf6VDzcHgk/WhS339vaDil74464iYL4jCd9Cx8p6znZJe/Sf4KGF/XJLvw9bXd9GtLBvKU7vHfBoJDrrWFGdElDLLtvE3uE1MIskAZlwUQjQXzM9MVYdcFzyD4kA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773837347; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V46uq1gIonA11FIl2YA34cg/6cf19A3UTojwMYo+WeI=; 
	b=SiLEBhTbUzdDS9z8Ibt9cxreqzfEaJDt+8L/R8kpFwQaNxSwIK5J1Yd53CbjVQa3Exrfr1V6fJip/6DLybYTZuokNLHU/gTB8yYVKtFhM2P1ILPP/WyZVo73DHTgjwPICUFJkOB2CwAWhJTFXTY98qNA1C8b3+GNH+HIjsI+XQ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773837347;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=V46uq1gIonA11FIl2YA34cg/6cf19A3UTojwMYo+WeI=;
	b=Z+jonyyeWBANmIkrXlBQ4qqJ6EKmGlg2pFvrpCxdhKC/Lowhjv1xXCFNwsB/GKAA
	YZE1D53DdLBz/mJRvwohVEMgY8Qx/jSDLGp1vxFO5gRTyFL9hcxnF4kSqJkyTng7xfV
	M5NTXun2HvxzEnDMX0N/W4DY/FlGkcMu1qF8KNqE=
Received: by mx.zohomail.com with SMTPS id 1773837345790539.4413022581078;
	Wed, 18 Mar 2026 05:35:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Daniele Briguglio <hello@superkali.me>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>
Subject:
 Re: [PATCH 2/3] clk: rockchip: allow grf_type_sys lookup in aux_grf_table
Date: Wed, 18 Mar 2026 13:35:41 +0100
Message-ID: <13714918.O9o76ZdvQC@workhorse>
In-Reply-To: <20260316-rk3588-mclk-gate-grf-v1-2-66fb9a246718@superkali.me>
References:
 <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
 <20260316-rk3588-mclk-gate-grf-v1-2-66fb9a246718@superkali.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 16 March 2026 14:06:32 Central European Standard Time Daniele Briguglio wrote:
> Remove the grf_type_sys exclusion from the auxiliary GRF table lookup
> in rockchip_clk_register_branches(). Previously, branches with
> grf_type_sys always used ctx->grf directly, bypassing the aux_grf_table.
> 
> This is a problem on SoCs like RK3588 where ctx->grf points to the
> PHP_GRF (set via the CRU's rockchip,grf phandle), but GATE_GRF clock
> entries need to access the SYS_GRF instead.
> 
> With this change, grf_type_sys branches first check the aux_grf_table,
> and fall back to ctx->grf if no entry is found. This is backwards
> compatible: on SoCs that do not register grf_type_sys in the
> aux_grf_table, the behavior is unchanged.
> 
> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---
>  drivers/clk/rockchip/clk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index e8b3b0b9a4f8..911e6b610618 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -509,10 +509,9 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
>  		clk = NULL;
>  
>  		/* for GRF-dependent branches, choose the right grf first */
> -		if ((list->branch_type == branch_grf_mux ||
> -		     list->branch_type == branch_grf_gate ||
> -		     list->branch_type == branch_grf_mmc) &&
> -		    list->grf_type != grf_type_sys) {
> +		if (list->branch_type == branch_grf_mux ||
> +		    list->branch_type == branch_grf_gate ||
> +		    list->branch_type == branch_grf_mmc) {
>  			hash_for_each_possible(ctx->aux_grf_table, agrf, node, list->grf_type) {
>  				if (agrf->type == list->grf_type) {
>  					grf = agrf->grf;
> 
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Kind regards,
Nicolas Frattaroli


