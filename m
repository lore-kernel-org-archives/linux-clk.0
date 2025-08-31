Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2B30CDA5;
	Sun, 31 Aug 2025 15:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756652426; cv=none; b=hJzEmUVl7YLHNsXkkof/nQ8HrrOBirxs2fLfgs5wBHU/g/M0zhxFMkKk59TSJSotxQS6gw5jB1E4KATSoXS+5qr2JgUTwACswQQdtVTdQxlLDS3hnfbDLvhdg2W28bvsi9swAB09QDng0KE13qxq1UCquCxEZqXARyEvL9LJfnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756652426; c=relaxed/simple;
	bh=V0GR8mvge54HoSDwcR9UzepT6wR5N7eBHAo4hMpnWS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BbaSAZWGmT4oYvjXkBAMvnr/2oQaRmV36OOVuwSnvB/CPt+mmUukOlPyg+iN6lMHyxI4UpUal9lneEjLOeh9ZAxAUvKrF/zYVfmhl++j68PbR8DX7yTnWd/cRQciS9598hLpjq4w45zPzOhQxJM/ihzlLjvi8ef+QwgfEk9LTHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LfMXg7NI; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LfMXg7NI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Fr6WeyZngKjkJ5+vVtCZO61j1ruKlxiA/dfdiEwKXnQ=; b=LfMXg7NI+LMPnZfVWumdDKjTyJ
	0uX6YKgMouWgKkBiHu6f+kxKivGn9BwAMdUyKqPq4yCbL/qgdjLvWsXMEwCdRuvwyXhaYysFpgmzs
	kyxCUbdhxD8IvEaKjipla6gnREgCpzdQiit83mftQoPsBM0H8z8NfyLuSw5yUbG0EOwd03aTElKA0
	eV/5b1XpLlAM3X5/+0E2vrey41ZB0Mel1vM3R9aZtvQL5hDS3qGOzWChpTL80SfNJbffKz2vgowZK
	XC2bPf/Qk3F6s91Ir5dkICdjdvAUYhuwdDF3YZ2V36gPCD4Dl67f8wdKgzLNEDcO/6Vb2vdiHlMmo
	x5MDfHJA==;
Received: from i53875b56.versanet.de ([83.135.91.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usjXF-0007mn-4M; Sun, 31 Aug 2025 17:00:01 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Date: Sun, 31 Aug 2025 17:00:00 +0200
Message-ID: <2235041.irdbgypaU6@diego>
In-Reply-To: <20250831104855.45883-4-cn.liweihao@gmail.com>
References:
 <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-4-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,
Am Sonntag, 31. August 2025, 12:48:51 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> Add a clock id for mipi dsi reference clock, mipi dsi node used it.
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

you missed a number of devicetree maintainers, Rob thankfully does
not need to do this on his own anymore.

so please get the appropriate list of maintainers via scripts/get_maintaine=
r.pl

Change itself looks fine though.

Heiko

> ---
>  include/dt-bindings/clock/rk3368-cru.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings=
/clock/rk3368-cru.h
> index ebae3cbf8..b951e2906 100644
> --- a/include/dt-bindings/clock/rk3368-cru.h
> +++ b/include/dt-bindings/clock/rk3368-cru.h
> @@ -72,6 +72,7 @@
>  #define SCLK_SFC		126
>  #define SCLK_MAC		127
>  #define SCLK_MACREF_OUT		128
> +#define SCLK_MIPIDSI_24M	129
>  #define SCLK_TIMER10		133
>  #define SCLK_TIMER11		134
>  #define SCLK_TIMER12		135
>=20




