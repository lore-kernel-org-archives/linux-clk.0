Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317969;
	b=Et8kTzZHxWTqRXFSvlnWbfzJApP/jOJ+EJS3flyAYqTnJuR1e9CskC8bL1uvLYMfgI0i
	 1ueWRAymQ4EvxInwIZoOV6/g+1JJ8QpNEW6S954+ofaO0AYX8t7za5kpcSzrdWmQmJASU
	 qRcoD42oMdFRO5xN48MwYslsrRkJHBX/PDlaQFPue7lUvp3DOPnyH6fRBKI6LDB7BdopY
	 9qhnE/GF593QhTd+Z5rscpiPZfkCjnny/G4wTmNrcOUkFMNotdZY3CYK58pZDv4FoM4JK
	 VgUxLl6aF4eGFp7pE8bDPuHkgeXxxx+1xarnkJ8Se0TaCmZSUZ2PNGIA3i08d99Uvvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317969;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=kSnlaqH2icJsjwNTkwpevxyVadDJDL69yr1qt1A0z9U=;
	b=tsj5BbvDGlKJ3aSF+p3uh5XPYrK64pFKGATHaKyh1tEmj6oQWkBRM5JsMbgh2UDxXPNB
	 WRkywy6TiJudMUWIPwIbWw7d2yzL9sArlRzMKueab6fNqK2VbB9zwpF4Uz0eFZ5DrtLEP
	 +hxQ35pmY1TiafDRW5RUnR5+Z0DVi9Ps7L8XFFOpF8LP4nWIT95Jj3SrsDtxpNxICq5mM
	 bIFZw4VpnDM9t/dy1yL3vg41v2ueEYfrUownoNs14NSSSxdJa6lM1GiomE1imiKpsl69V
	 Mh9kau7VzGOUWtX6ZnjJ8g9LsIPDJoEEdzHkp0GK+b8R+pW/2NIPSZZbyfBCMR5LG4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910F3606A74F
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 13:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910F3606A74F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso254476066b.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 05:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317968; x=1794922768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kSnlaqH2icJsjwNTkwpevxyVadDJDL69yr1qt1A0z9U=;
        b=gfTjOKHIV/Ip3WQBaCDUHmJvhnnxRMo75pgOebqoFMRwmraEmf5iFbdus0PHrO9rND
         pxNlAh2iP1oly1fgt5QRNNPz/MHaqUml1isIBbrKXq3tJiOwN0ugm0as760vCtz3fWpL
         HYEOg5UBpSZUcczF/TsFQ6vxeMHEv2Md/wbVZXUGYpUddbrho88Rp1x1VRpOWutuvERv
         eiGtRduRs6zWV0hASsmH+gclHTU6PvwXhx3PfkKnK+FZBrnonNakqvOBeqM8MAeXsFB9
         iIN6zPJ+AwvX6koulXY7MRRYf5bcSr+jqt0X4D0Pr06iUVpHbDu64SJ8yGUtY/3+a0GG
         y+dg==
X-Forwarded-Encrypted: i=1; AL+hErHgtxyolJ7z0maTgD/JRYmp+DiwHYxjYUAxD9HXIbmBMYRAf4RWZEWLasshJJ0HGELHe30//sJukrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dzmdy6XpHl1ktlfLtifcVjMOwo7qC9OuLnzKfOfPq07pj+SDK
	ThBsKYYZcfBBPNqSqIMPfTh4MDUITCmTDCmYDRwUvExnb/eM+Q/YxAIWxW0mZ/jiX/A=
X-Gm-Gg: AYBFou0bt8ZrHUHinYA4mpQnJw7RemBGAups/oZjZ2tlbp6mTZ0Xgue4n7rKu2GwHDx
	BhT5TKL5Yznw/ssa8fvgGd8mKv7CCLFyy90VKnPYIVl3Am9W5ZsxauQaRTdJpx8K2rTnyOj73uT
	eduT4X6q/SpAtKZPSp7JPf2L+i4Q+Dl5lb8ImPqEWTAZvJTOglYd2yikqaDMzWNqGpptNRyZXp1
	T1y56AFo70Xntihl4RNQJy0212EIgXd05sqt0qo9uY0kfLP8WBzDs0nL2XPh263CMWs7mXANzKS
	lNVd5wpMqKqLAmjpBYZ+UTCnlvk7njGml68OzEYm4i/JboY1pSznz2vcTKktZPfvrcgd2QpinzE
	UKcPpRIMtV8ur3MXqb+FJDbUXKcUN878rvsu9sLBzmJiNHpm+/v8yxJxZIDFVcMs6k0OPYJ8RwL
	OI9TvUvwhuWlnXBTvqq9iKoO3a5xj9YY370/+6n/Bs5SbmUEKDemrNJ1zViM/FhaHklduXUYakj
	9yIMfiNFGm9f+tO/OF4WqQPw+xRomu2uJxu7tmJf1iR3q/hTSfC82sCc7qev7Lxqb1TugAXy9Sy
	r9kQ9PymHXVqpYSisrRRnxez8P9OjRnc0PS7s8saWrcvY6wcp7CMEDaSg5XCJ3pIKFUF7wSRzP0
	00oAugsLUAZRa
X-Received: by 2002:a17:907:a892:b0:c40:b59:f with SMTP id a640c23a62f3a-c504967babamr231349666b.47.1794317967813;
        Tue, 10 Nov 2026 05:39:27 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56f034sm109280566b.14.2026.11.10.05.39.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:39:27 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40f29667e6so298148966b.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 05:39:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFm/DAQE+rMbDspkSH+Sw+MHtx+Z6KyaTAhx3JWM5CzSBilg1VR8uwE+BT6khL5Ke6OewdALwYj20A=@vger.kernel.org
X-Received: by 2002:a17:907:2d06:b0:c46:a607:6922 with SMTP id
 a640c23a62f3a-c5049585db5mr235694366b.25.1794317961521; Tue, 10 Nov 2026
 05:39:21 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106110923.164090-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261106110923.164090-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXppNKiFH-Q+q_fZNwCABWw8KG2Jcwc9jL5+GmNFuouHw@mail.gmail.com>
X-Gm-Features: AclHuK_lqFzG1K7YY8lxHYxynu6A8iqMxQa89_kBquxOkn_I_cpIfpAejrm3I1U
Message-ID: <CAMuHMdXppNKiFH-Q+q_fZNwCABWw8KG2Jcwc9jL5+GmNFuouHw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 12:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Renamed adc_pclk_gear to pllcm33_adc_pclk_gear
> - Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2
> - Renamed adc_adclk_gear to pllcm33_adc_adclk_gear
> - Renamed adc_0_pclk to adc_0_pclk
> - Renamed adc_0_adclk to adc_adclk

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
