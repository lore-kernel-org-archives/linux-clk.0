Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723988;
	b=LQ/aN9NhU6YkKeSDfloZ4G/qVUcxOgG1CbX0PlGma2BCYFJCsfoSclAifKYMI53ZA3V4
	 pBAl7ggwAD0+Xs9WbbKyK20l0kTXR2AgbBz+jRVRUG+BkxaOUHIrPNnUycTGRSxNITlcj
	 6W4FDsB78s0FTyncrXBopdX0qnA2OP/mt3SyDr7SaAiL+xKzu7J14/XzLuGtLvY4KM7p1
	 00y6a4o095f71id0XBbToxvH1cPxqtfFGw5Lhn9donghN82MlLG474qUtwO86vhqWa4pP
	 JSBVcobgwdCqGuX2QaJPGoWbYh9txymFece6vF19dLTcG872bFdlT6+lwvCq+KWXkpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723988;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UD/foHw0BvnfH895HUVfxnwnVTVm+H1O95yVqicCrpA=;
	b=0rRdoORBEteloRzXBKMNSgjym+cu5huvOZ35LvlJ4Ejntfuye7k4Nlr1gTWeYs8qAd07
	 EkbI3MBMkQ+E69JhfW6XzvPEH82OXKvFHaPO9zdE2ELxnC3r32n1AiE64PGArXCkQZrSX
	 VNY2oo8o1YQ1yttNEgDO2hQuv9SJ9vUJtO/9zcq+kUHBZXgC/EROZwMJEZdrW4h2XMS97
	 OJ9INb+PeroI6vOUKXzw/5lpTQFXk4FvQ8RSGKgv8xnbEby1W7Y8IUh9+cp/L+JVbWefl
	 WJMj9l6/I/UuL7GUnIG1gFGEaU4ojkb9n6yVvnwvkNVrnhQbS/Rl4RAeIKo7ybFk81Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qv/KBXKL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF112606A323;
	Sun, 15 Nov 2026 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qv/KBXKL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEF31F000C4;
	Sun, 15 Nov 2026 06:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794723988;
	bh=UD/foHw0BvnfH895HUVfxnwnVTVm+H1O95yVqicCrpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qv/KBXKLZbBoPfwXpoR1RiblbGTfIC1o0cMclDCyVbZcQGXQHbR6BmG/CWPRuNrBZ
	 fJeIa+dRpylOs2b9hZBcnXV1ArgYPe6neo7OVk2TD6cQXYvKfw2cjo3GDJ4koc9ezI
	 F0cfEuQ0rNmf5ugmR9YB7UCXMiwH5bUC7T+EJ85EB/TeQJkVtgRjfCosQbkKi0+IQ5
	 eFXraDiXh5QL8OTblzGrwbp4zG4YL1cJfJh9BX8cM71gUCTQh8qYgWzfHZ1zFLb59j
	 /xH5CF7SFlB0VlvqmZQOufHE1FyO5XoCy88v/Dy6bAN+CBE4gSBYUqoeGurEJU5R9W
	 xKJPIl07IA4vw==
Message-ID: <sashiko-outbox-215248@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] drm/sun4i: Switch DE33 to split plane bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115061102.229680-9-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
 <20261115061102.229680-9-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 06:26:27 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/sun4i: stale @map kernel-doc entry on struct sun8i_mixer_cfg
--

commit 4d9d59875c066497d13ed0e8e40a5cc35799a204
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

drm/sun4i: Switch DE33 to split plane bindings

This commit switches DE33 mixer discovery to use the shared plane driver
and split register bindings, removing the legacy per-mixer DE33 plane setup.

> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index e2f83301aae8d..7abc88c898d92 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -202,7 +202,6 @@ struct sun8i_mixer_cfg {
>  	int			ui_num;
>  	unsigned int		de_type;
>  	unsigned long		mod_rate;
> -	unsigned int		map[6];
>  };

[Severity: Low]
Should the @map entry in the kernel-doc comment above struct
sun8i_mixer_cfg also be removed?  Leaving it causes scripts/kernel-doc
(and W=3D1 builds) to warn about an excess struct member description.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115061102.2296=
80-1-jernej.skrabec@gmail.com?part=3D8
