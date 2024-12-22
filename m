Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC0185B67;
	Sun, 22 Dec 2024 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734883738; cv=none; b=egedYp34xljTW28wKbI503GpJqrKNmxrbdlwvMuaTxTuxnWoV6Ky1F6+02nXFLD20fvf0xJbLR9AG/pGB0xzOtn7/7TlWGjpMUVaO+J7puP8A/L30yHc5GHZIpOAxXyD9ZuTjScR0+5ebX9M80V4ChDbm5nfQWZ87KWQVE8vBBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734883738; c=relaxed/simple;
	bh=Mg4JqELBWl33hxA7WoGXdlwQKoT/c0enxWkde29SZlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FjyqECNymQv+V9Imb3EE+79HfVTD4ibvUHSAD1D41ShInAsVUepAUpW8g78B/m3u8nNP6N26ID38sJV9Xgzk9pTSXlyrNXhjv3AbiCmpBGFxu2AMK7yCPBYY6SBsrBbmknI6yGnMsW5F0sUXoCkTx5ooYs1x+mS14LIxaOWB0/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=mtx3UF6M; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="mtx3UF6M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OJAa8ZOX3JItAwodoe1YGgwTpC/WvMlwN7ZuIURxJy4=; b=mtx3UF6MStD6lN0ZiHem1bMs0J
	TiC9lzMHSVEIOhhbC6DUZxlciz2kHnxOzRwZ4SfajY5h3b7nmd9LAmYoWU19C0HBY9/mhk9UHoXLu
	fk5PrNo0Sn7IWVyL4LEkqIqUFJFasvHUr/YD3sWRGG688nEAsGVwus1R6FNrqAU8dYHQEA6EzTLWA
	lOWEy0runwT/HFb196+jYXs8c4eJVmZ/8Ds7zC17lznGEj3rmvz1VjApdC2kn0DVUsXiU4YL69ll4
	SLNB4ZOPHNOp6Jl5hgwngPzwpY/DHE5z2rKRkHW+iEsVvlILxPofzTjWDQuNVri7aWuETYmmXuf90
	yjUUlsgA==;
Received: from i53875adc.versanet.de ([83.135.90.220] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tPOVe-0007gW-Uv; Sun, 22 Dec 2024 17:08:50 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/38] clk: rockchip: add dt-binding header for rk3562
Date: Sun, 22 Dec 2024 17:08:49 +0100
Message-ID: <2261039.72vocr9iq0@diego>
In-Reply-To: <20241220103825.3509421-3-kever.yang@rock-chips.com>
References:
 <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-3-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 20. Dezember 2024, 11:37:48 CET schrieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add the dt-bindings header for the rk3562, that gets shared between
> the clock controller and the clock references in the dts.
> Add softreset ID for rk3562.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
>  include/dt-bindings/clock/rk3562-cru.h | 733 +++++++++++++++++++++++++
>  1 file changed, 733 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rk3562-cru.h
> 
> diff --git a/include/dt-bindings/clock/rk3562-cru.h b/include/dt-bindings/clock/rk3562-cru.h
> new file mode 100644
> index 000000000000..1b5a63a7e98d
> --- /dev/null
> +++ b/include/dt-bindings/clock/rk3562-cru.h
> @@ -0,0 +1,733 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2022-2024 Rockchip Electronics Co., Ltd.
> + * Author: Finley Xiao <finley.xiao@rock-chips.com>
> + */

Forgot to add:

We might want to follow newer file naming conventions, see 
- include/dt-bindings/clock/rockchip,rk3576-cru.h
- include/dt-bindings/clock/rockchip,rk3588-cru.h

and please dual license, as
/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */


Heiko


