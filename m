Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B403CB57C
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166983; cv=pass; b=ej4Rhk+iSGyEUjRcmioPuv1OEzNQILEC1pav+IZlhhHTEvwYNxV0Yt/wCn/sCQTkc7vFWBYQf1uPvQnnohuB0viIxnh18/YhQWbbeytgeli5bgDxEO3Ncd5atZf1ft5PzvJtNjSYJFhFjYlZmzjwU83sL1DfGVSkJyKOxXSqjqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166983; c=relaxed/simple;
	bh=6Gdm/Jwa++tYCYBFL3h6ykFgGzgM/L/iYtKQijxE/DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xgg5cKsYRUY8+5jmz/Afistvxw5z2g4T9xJl9/pNdIiTMQPp4j/d6yG/lqWkQ4XE5RvqXk33FszRM0SPN+Hw7S0XG/ZSRK9uVsKFw3e3oickHBTAbtYnQE2N6k3yWDeuPV7xo6HhQ5n5c/q7FGw3DKsaXKtt0T9TJP7lWMQrfKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gxS25cX7; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gxS25cX7"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66e63afda8fso972882d50.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 02:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788166981; cv=none;
        d=google.com; s=arc-20260327;
        b=V2qPBowWPOu6CB/l1KHtXfUzqaC7Wt5is2QwPXARMWpAfR3Dd/iGPd9PT0ZQvTtJ+y
         JrQvJ1Qr830628yTe7B0gVXBkuX3HGl0wTI18f+OGUA00I6ZQsLcXli7FnQL1csqM+3Q
         ClDqh/+6n1XsaUg5u8EVSqW7fAl+fqnvTq7My4mE/yqvy9bzFQM/A6DPoyVn1nHkcL1I
         xHNfN0jKoiiqGfvEpQl7bQwJr9Kxf6BP/ZRKm3Bb2FKlBTZYWfZWyTEwhyFmcyGTCKNE
         Xif2j16oqBwFPs4+FX0xBIH5wW1vko/kYjt8lxbKR909dIsGOVDSIu0MELm9E1ouCB4a
         GPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        fh=JB4lpmF6j3FuzTPAmsiIkEVI1cmbLIkrFdxRfqC0y9I=;
        b=IrK6RXOauwqsVzp6vff9FagL67GbFM7XTJ03FxIfIn0tpvFLPdeU0EAHJCIVITXbny
         nFxlxbu4c1XZ8kdhexTZJMo58myHdpbfzmSd8cXQyGvoHEI/83gQIvmXsnRsruLqHVzV
         i3bk5D3e2QwbEilCaUmyL828D7GkiSa2s0jnxm0bj+RH/oG749z7c5kVjNWl8hVvlGmI
         SB/YuXlcKdV6hF+pt6VgYEs8Y3lEEesqS/f3uEsiPc7QteY1lWtVGW/aKcnbnWK5ILcS
         7agnZ0Isyi7E5pAIh8C6jReMgIXhKOCBqJi+qDpWiupFMquX+WFlnELuFToEAGGOvckA
         MQXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788166981; x=1788771781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        b=gxS25cX7MAPuDkGYYMpRu/B0tb/U0Ofrw4GkY2KSp6/H5JP+q4J+jB55lgrTVepUf4
         /8A1RxtOvXnosSZHZiuH6cmmTbqvJf5Ohd5hYc0kMRscToOmolILKEWSELXv7u3e7NCL
         h3ogp9DXbBBPYOmhxmcFjxIPP/6tUW+Q/Izx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166981; x=1788771781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        b=cvgcoKl1DJXWArZSFOme8CZcgMzHUdsTrJ2MuQ1JUClvX47AR8wckR+GaNQDr3dHSd
         di2Z9fCWmjYblwwZRGlq/WqAQfzikf/9ZwufUwUOCrbaNIWA0qsIT40taqxDj3aizLP7
         ZXUEKLjpmlbtJ8cOliY5wRp4vHCBBvyJdkXPD8DdsoxyPLrjIDczDD5OXod8TvEHfFQm
         zUAwF9mkfYYfq3cTAEPqhGLP4iU6tjaFoP4b11cXWXniMrUuSzPRkapj7axaSuFSjl2g
         /CyN0nP8ODQLPnlYJaHg9H9hNo0IwnRS9xOTCugqsDvIBUmSP2u9yLdAlQMME0pm/GHn
         FtlQ==
X-Forwarded-Encrypted: i=1; AKwUvByX3npr0f1VORgL5mHkf2z7daze72Wli6g313PGkotQ034nOcBCbcStaZGT0yW3sAidJb+CnmZjYrg=@vger.kernel.org
X-Gm-Message-State: AFuF++nCfLfYTHl32nw4XGNDps0+LgR2vbLdVAuN/6ReB1Pi50eGOLy8
	GX/zjVTIIyeSb8cAM0YFnPebMl7c8QEkC7o3BinG7u4y2TUpI9mfY4gVd8ddHtem2/LVHsi0JTP
	fnAdNUMNG2eAcn7TXsRTH4+KQFvDrBoiL7jYIbNjl
X-Gm-Gg: AYBFou0Hs+MjKEjxakDxx3tI6cuE2qJkmJ3MEV/wN0FznfjDoGUSAgTWEVJzn30AWHx
	tZFROVjDApze2cp7Mq3J6OoXl/RP1P1nqMs1igQJ3dLSCzr6T3iu9ESMrwNRBHtOQtzNP9s1tuK
	u69hQw0Kojw3zGPlfWMuN/dBcJvribmIKJ5qWnUxBSULLKIqCBFYdsOni7WTNkxLXnCBWyt83Np
	7Ay3HzhGxQk+ZOu4nrlSw9+K1jJApMMmKdfxh95WEKJSreF8roGNrQ8w/FS1sRgyUhKZOtvt8gx
	4+MCrn5kJYNLHAM3Gocb0UFomDdyLo/SYfcGb0D1XWsLZFqXVAjEelho9N5b16W5+GIteTYM8Q=
	=
X-Received: by 2002:a53:b9c9:0:b0:66d:289f:6498 with SMTP id
 956f58d0204a3-66f814d5729mr574191d50.36.1788166981090; Mon, 31 Aug 2026
 02:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
In-Reply-To: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 31 Aug 2026 17:02:49 +0800
X-Gm-Features: AcwNN1VqX8uTSrN71dAKaA8eOGbgkkf6CrhjupqKO6wVb7uBj_O5pF3ip4I9SqE
Message-ID: <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
> adding a depend on OF, the following warning is triggered:
>
> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
>   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIATE=
K || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]

I guess this happens on COMPILE_TEST=3Dy with !OF architectures.

> This patch explicitly adds a dependency on OF to solve this issue.
>
> Cc: stable@vger.kernel.org
> Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks!
