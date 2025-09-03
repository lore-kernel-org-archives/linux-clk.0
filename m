Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B61C1EE7C6;
	Wed,  3 Sep 2025 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901772; cv=none; b=d2odz4lVLMLw/NiFkoc7rylYOaw70uNn7f1eAASDquD8QCXS2PnJ0A/1NVLGD1Nsu+0Yd5AJdSd3B88DLEWdlxkHMI70akg+yreOmfLXs4qUumkIu2SEhogytfcQxGErAgh1/IWXMuVOtzrulPapNhX/oTIQwoibvk/5W9nVuoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901772; c=relaxed/simple;
	bh=XoWNPmKUKdXbwTs6tbvJduVJT8/38isykp611QdsF0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PON2M8WkBiUI7fMyV6gmrNwEhkjBTiXLq5UHl24gvL9ilQeHcnPAC+8pJUJohxcPXolGf3qGM726A2EsuCsoAZd+q7HlyaEdy1iWApWfR5ayRfeZspBIV1r0hD6kpihZr/A03cqHhyvKi5yQKxmcjBR9H0NBRBdiUH/bCKrCE+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EO5NQoNp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EO5NQoNp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=McfUlmNWXahZ5b3iibcvLakQVppuaRB/2ZGlhVmpKJ4=; b=EO5NQoNp/9z6s3T7xfSArrxHMa
	Laq3wXi7iyKd5j7gcXB6sMqM5d/aH811t+FRIe6qDqmrs99BqS33rEzbVla2D+/vexsSUjgNqJVgt
	djD1KZs0aMPJ4mQ2Rs0E5J7HzGwa86F54XL9015GfLeXeLcyX+WVJBeZS63phtQB/CNDeUxlug+Kj
	Ot3z1aE+5vUVbkK+T5YcCBB1b8vXJRvUMrdNR0DlSE3WQ4PDYRuUql2fUgB1CXqQwR9SijPT/APD3
	i9EnIVjbbxwOn8Lq0hOY6vQcIQcLslzqxGf+eBK2/TcL5aSxycPBxWQ32yHgEIuze0rschz62Z8L4
	SwkIBR8A==;
Received: from [213.70.33.227] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utmPF-000551-5Q; Wed, 03 Sep 2025 14:16:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>,
 andy.yan@rock-chips.com
Cc: hjc@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject:
 Re: [PATCH v1 2/7] drm/rockchip: vop: add lut_size for RK3368 vop_data
Date: Wed, 03 Sep 2025 14:16:04 +0200
Message-ID: <5726817.Isy0gbHreE@phil>
In-Reply-To: <20250831104855.45883-3-cn.liweihao@gmail.com>
References:
 <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-3-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Sonntag, 31. August 2025, 12:48:50 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> VOP driver need a correct lut_size to work normally.

please add a comment where that value is coming from.
Because the vop in the vendor kernel is so vastly different.


Thanks
Heiko

>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/dr=
m/rockchip/rockchip_vop_reg.c
> index d1f788763..219f8c2fa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -880,6 +880,7 @@ static const struct vop_data rk3368_vop =3D {
>  	.win =3D rk3368_vop_win_data,
>  	.win_size =3D ARRAY_SIZE(rk3368_vop_win_data),
>  	.max_output =3D { 4096, 2160 },
> +	.lut_size =3D 1024,
>  };
> =20
>  static const struct vop_intr rk3366_vop_intr =3D {
>=20




