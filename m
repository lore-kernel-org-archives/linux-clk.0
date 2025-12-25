Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705A3D3B3;
	Thu, 25 Dec 2025 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766648881; cv=none; b=eCqLNbzdqh8gzTTT578Qg6o/h89o2zNEgN+RORrfliFYjoGz1caE7Fkdo0FxOsw5KD/UNxMfyBft6wcpJs4IZ4/18NGI9IYovSZ9ImqrOL5p3lGplSD0xAZc4Eh5IwujSDD5nplORUWwqsgSGSwIF+BsppqJlla4+4e0lhjZcgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766648881; c=relaxed/simple;
	bh=qkFtS0tU+hPAO86pGnO+Q9wZJVOF4wKvHVlwO7gN+LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHpyzQowExLb1kUHfEjATWLXHQsXfO8262pXemrX6aiV/kRMk75tzqIenKMvgRtvEjo+febpOy/DbOa1WZWe44ufPrEqoDa5yDTQvzpxRI1kOXjtnnV/HHABBR8fJ+UaDOiILgzSsb/o4jVlO8fqY/5r0W9Gdo3E41mL5jZRSqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8A9A3341093;
	Thu, 25 Dec 2025 07:47:58 +0000 (UTC)
Date: Thu, 25 Dec 2025 15:47:44 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Message-ID: <20251225074744-GYA2000703@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>

Hi All,

On 09:11 Sat 20 Dec     , Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module,
> the auxiliary device id need to be adjusted, otherwise reset driver
> will fail to probe.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/reset/reset-spacemit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> index e1272aff28f7..0bfd90567011 100644
> --- a/drivers/reset/reset-spacemit.c
> +++ b/drivers/reset/reset-spacemit.c
> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>  
>  #define K1_AUX_DEV_ID(_unit) \
>  	{ \
> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.name = "spacemit_ccu." #_unit "-reset", \
To distinguish support from K3 SoC, the k1 namespace still need to be
kept, I will update this in next version

-- 
Yixun Lan (dlan)
