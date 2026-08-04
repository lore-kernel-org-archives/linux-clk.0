Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB73590C3
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 02:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785811546; cv=pass; b=R1DPw5dXV2RCqKcCeP2AP1Y9OGlK1FKbU5XfQJcvy0vh14m6f62IWp4XXZNIceVWmECtAfQRD8I/ln3wRv/uXkHUZZw4QoF/x//WdV+stt/U8r1ZCaBpzTfNIoSBaJXApnRGrtK2U0W7HoenDe4uljdARYzQx6yy+YWXignz0bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785811546; c=relaxed/simple;
	bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBJ1jP/KV8/tX6ttglngJwRaU4y7sG6AbS8PjZM7VWSb8TKV4iB6wJbSk2JxJpB3Xa9qkvhiihNYvrlO3ql1SyFsq+TmuYZ4UP7AP4CCRyNRg1iu17da2GQvk+PQm8+ktz+tCfBf2vnKNB4OxSY5C8wMQ0JFwH/7oGdijee3mQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WgErTmhf; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WgErTmhf"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ed2a00f12so58825487b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 19:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785811544; cv=none;
        d=google.com; s=arc-20260327;
        b=laPNZcmS4gdlIEiNHNqkZa4e2XcRxBaxDfYn4JOnYo257VM6hO8xUBAFMEjHKQFlAm
         k1lhVwVfmv1FbeLH11El6HHkzlUyS8/YtJitZu8nWcvo0ezn/uDO10JsliO9eoITuyYS
         Q8mGT80Dfst7nRSH77CYNnS/04/4zM1ATgcxoLfLoZ47yZZPDgU6urptcOVXx2ndtLqK
         bP+kCB+5osvHM0Ie8YLK6GFiA/scLOU0KIIaakXq5lQ4Ys4GVi16rf61fpfAHoPRPdZm
         pet7AFpRKbtzU0aTQi6G66ySfaB2wWv+3gOHV2YGwZ/n+wGOKhf90C118xuoLacWZLNL
         Bjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        fh=F23BjIVx11IkcVpvyQ+/Z2I4yl1wIpeQzbi4b+6jku0=;
        b=Vg9HWNMFBVzbpFpBX7P813v/0Le14ktpYk4xTHtKBdofFPe5iwnLAPYupOhasOdrIK
         UBuotmgXaPVQvhjTkLP4c1bU+fmhigpX70dAOcwNjn/Yb4cEpY1A7qM55M9oBjWvcDrR
         euJHL5nOeV6Ke/nobZe42bxLV2bHhf4eWGVBIg6CESM44t6YMK4C0qxKP9cW20g8Wucn
         c6txz6bHSYEdh9pDpge+vk8iEi3oKhL9IcMcPp4H1FvRYdmoIKHMyXNPznAHHeIOnHdx
         NIYe+9EY5zd7p0Xj9+7PanGC3AGajjFdUiJOujdiXxRC4an3FWl7zYZk2IErFtMIApCG
         IXsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785811544; x=1786416344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        b=WgErTmhfNRjNzhJhVn1FMcCJZc198tvCR2mywUwTerla7mLgodvReQHOaXBoMRh2Bk
         p8MDcwBiF5wgNmjRtmlukA3PGBxMXvSt5GJiP1wFZBfBNFTjBM+fYDauqE3vPQ5+4u0/
         w1Sc02oG6DtdJNiQG2ebax7JXtN8ewys652WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811544; x=1786416344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        b=NWEfYXTgBgf/4cMeovO8vavQ6bqPkCCGw6nHHWhLaWEQTnbBKj6O6kDkfdBojb2c4k
         oqtMGhk+ko08FbeXqJ0eS7YJ1IMYlkVAXhSGjmH/iOWSB4Br5z1Bc2hngiYEphH7HXts
         gGop7LnHePxP19CYFRC5Uv8OuzWMpiObh+wtmmrVsDZ4oi+8NU68zA0pw2JJaAIsM12x
         OEUykHcDcyk8r1SKrlk1FhtaT83NXrqXx2eJbkSdJaSY2eoTfeJhyR9Jx7LMGSY/4Bxu
         OFBCOWba/pnkTI24Aj7ttIWAlu1zcL9PuagEfP0qDV9fJeIewdSpOUIFpenOn6FraM4X
         jWFg==
X-Forwarded-Encrypted: i=1; AHgh+RrRfaf/IIqtjIl/rlXGJsgBYSdLxbKfXLQi0ZHeadz73Wnax2DloDlqTAijvCP+oO0lCMtSboik+z4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxv/xUKCS9dd2qymvvuaCo02DN45r5X4Qw1VkXGVoxlSAGyzAU
	TNAwYajr856V2OMxeg9w5jNsmKcBRAWykhLikrFlKMFICXlLc/mAYR1LXttBLPrXJ9OX22j7QsW
	4+pHVjPsM2QcrAQ2NvkSNBgDHkY0RX/nHf6nq4Lzm
X-Gm-Gg: AR+sD13+5LCtBDc1Xx/S5k1wpsdcoOgBa2OX2bwtXH/dKJYuccxzyALqtm9qjfYAdC/
	xOy1tUIyVda9IKgcArYHGtm9m3EgqJY0fbLcATGtd22BOVnx7ajR6/7cCUhfImrU26ZLDECcFj4
	B1ePPT1kBdc/VNs79jeCSwgWPr76d9xFaH/cjgghfU5H3T73HcvAzocbjeG2K6Sg2KW344LZeE1
	yicJKh4cJYcRReEsfIeQqA+dGzrxvpPy9qf6YY1X80U7Oq9q9iNJueP4L91NcqmySow5P5CjL6G
	SpVrKi4U7ULeqMfX5l3JSi3yvwfUGX6yj4J5u4+rmjHBIO4=
X-Received: by 2002:a05:690c:6d07:b0:81f:27f8:2de4 with SMTP id
 00721157ae682-81fd4a04799mr160372987b3.8.1785811544182; Mon, 03 Aug 2026
 19:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803141659.559129-1-akkun11.open@gmail.com> <20260803141659.559129-14-akkun11.open@gmail.com>
In-Reply-To: <20260803141659.559129-14-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Aug 2026 10:45:33 +0800
X-Gm-Features: AUfX_mwLcNdgKSX0dY1YbYf9cwLK9DsvJWUXl-Ukek71RJiEJ4s-l_75YEo7Ku0
Message-ID: <CAGXv+5HRsFFhzSYPdk-zmipLTVwxPkHLbuFP=wn_f_D+3ejAMQ@mail.gmail.com>
Subject: Re: [PATCH 13/32] clk: mediatek: mt2701: Switch to common
 probe/remove helpers
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Haotian Zhang <vulab@iscas.ac.cn>, Kees Cook <kees@kernel.org>, 
	Miles Chen <miles.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Sam Shih <sam.shih@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 10:18=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> The MT2701 clock drivers can use the MediaTek clock framework
> common initialization sequence. Reduce boilerplate code by creating
> struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

For all the subsequent conversion patches, please try to mention _what_
led to the converted driver being able to use the common helpers, i.e.
what prevented it from being used before. Was it the PLL, or PLLFH, or
something else?

Details matter.


ChenYu
