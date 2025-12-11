Received: from mail2.out.flockmail.com (mail2.out.flockmail.com [52.206.209.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D73322A
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 03:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.206.209.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765424080; cv=none; b=SUtjAivQLoAxOaQZt2p7htEcKGFncrQISiIAPG5djxGPIl3MV06oQLzyf689Aa/wNZgIx7Jg3lZeG6BJR9C2QAzLySq0NZaZ7fGmVsdkfjBX5O+GbhiyC6NyTUPDfhvbB97eQmVaslxBQMzySj8Fuwl0R9jiLhFiZuC/dhMOgeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765424080; c=relaxed/simple;
	bh=UUbEIjuzTCkyHBUkZ4tp7y1fS5OX2f6YTlMykZN9bnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtRegBuM+l7JFOyzXGAdkOy0mZ6yVKJVUuIehbt4AZfM7cGHe/rs/dhTu8k4EosYjGXf0UnD5HSNGvUiStHfRgYbf4VMd9oGsEApV+ZvDaXKWDwf6ZPqf2BlFPuvc/B7c6HSQl/k9361HqCtxsZ6p7TBnfTrEtnFSUoQBv72n58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=NaNJjnf9; arc=none smtp.client-ip=52.206.209.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="NaNJjnf9"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dRdKp3tpQz9rx9;
	Thu, 11 Dec 2025 03:26:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=G/iuUnjpcIevUzMMPzirSlOjACwdcdZsgXjZiOGXtCw=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=subject:references:mime-version:from:to:cc:in-reply-to:date:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765423598; v=1;
	b=NaNJjnf9R54AbOoy9olS0jWo1uXGTAv3OqUnuRGk/uFu3dmsvOK7Vdfhg38BX15wkCfu6kMt
	+DdgogPii7wGeSAcUujQpKIYMck4LqNfrgpTAzRzi7+KC0WxpX/LWgZCdx9+i2EZDcQcTUp34S4
	9KKgMlERIteK+fwOYnTrx3Oo=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dRdKk13CSz9rwy;
	Thu, 11 Dec 2025 03:26:33 +0000 (UTC)
Date: Thu, 11 Dec 2025 03:26:25 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/4] clk: spacemit: ccu_mix: add inverted enable gate
 clock
Message-ID: <aTo54Q3luukdJiJw@pie>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
 <20251211-k3-clk-v1-2-8ee47c70c5bc@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-k3-clk-v1-2-8ee47c70c5bc@gentoo.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765423598363540247.21635.6277641652149414312@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=TPG/S0la c=1 sm=1 tr=0 ts=693a39ee
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=7mOBRU54AAAA:8
	a=sWB5wAynvVkB54t-ZH0A:9 a=CjuIK1q_8ugA:10 a=wa9RWnbW_A1YIeRBVszw:22
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22

On Thu, Dec 11, 2025 at 09:19:42AM +0800, Yixun Lan wrote:
> K3 SoC has the clock IP which support to write value 0 for enabling the
> clock, while write 1 for disabling it, thus the enable BIT is inverted.
> So, introduce a flag to support the inverted gate clock.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 12 ++++++++----
>  drivers/clk/spacemit/ccu_mix.h | 12 ++++++++++++
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index 7b7990875372..14fbf7048c89 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -16,17 +16,19 @@
>  static void ccu_gate_disable(struct clk_hw *hw)
>  {
>  	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> +	struct ccu_gate_config *gate = &mix->gate;
> +	u32 val = gate->inverted ? gate->mask : 0;
>  
> -	ccu_update(&mix->common, ctrl, mix->gate.mask, 0);
> +	ccu_update(&mix->common, ctrl, gate->mask, val);
>  }
>  
>  static int ccu_gate_enable(struct clk_hw *hw)
>  {
>  	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>  	struct ccu_gate_config *gate = &mix->gate;
> +	u32 val = gate->inverted ? 0 : gate->mask;
>  
> -	ccu_update(&mix->common, ctrl, gate->mask, gate->mask);
> -
> +	ccu_update(&mix->common, ctrl, gate->mask, val);

An unrelated blank line gets removed here, is this intended?

>  	return 0;
>  }

Regards,
Yao Zi
