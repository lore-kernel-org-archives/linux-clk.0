Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A75B30C371
	for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 21:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779658100; cv=none; b=nyyTiwephywf69MDrV3tAcol72eXkGW/tyYlFGH7TZOHbCPjkVCf4ob4/5Lsjvn+ejSqMaXi0ev13Qru3gSrKQM0s7DnJi+blcZkgwT8Wp4qfYhXQQ08WaPelGyzdmVONbZOQtNZq2KxBdB6zRGocITrPS4yKzpDT50lj/WwP4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779658100; c=relaxed/simple;
	bh=6w+/iSJRWut/D1sqx5dV3SWtkjaFwtBwoEXiJRSLQ+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnIG1JfSq5HY3y887BllsITh5rF4eCkiYLUHtXPhm+md7Rh9rNKi8flnEe+X6wkS+zixpPPLsZ1JPB9ARnc0os7skaM1v3IxXl4T4VZj0mC+0zkq6yYy9xZQr4qn0uIgBKF+OjYNiOPADCvLcEyXYbp0rnPv60wdBn/3HvehfHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd8faef2e18so1026873066b.3
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 14:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779658097; x=1780262897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6w+/iSJRWut/D1sqx5dV3SWtkjaFwtBwoEXiJRSLQ+s=;
        b=BnNzI7h0xeZMCrQ8Iqt4FMBPMSXcy97mkUKAmDi/Y46AT1ykRLrYYglgdWcwL2Dwbm
         u4nnrDHvvHLfc5dh5sLsSO+gkFYxktlRGzXiByZTocgPxMJYvIvtPNDk1xtQwTRgNNQ4
         601/sYYrg/Pr+orZmewsG7xl6j3LEV6uQmV62xhQv9iUjLAdqdqln4HA9n58BlSEH7d+
         KP1+Cq+Ccd6ym3b1dmoKth0nBr6f0HnKnNOwnRn9Pu2IzbUkq8Bgi9vhtWhZ/pxVGeRb
         7pXtxOXOXDgNeCEJn/ED8QOtw20eUEGCtlx2aG4npmM6zS4tw+Z73Efwx7vNIb0P5lBm
         geug==
X-Forwarded-Encrypted: i=1; AFNElJ9yaqXW7vkGJc6W9OHaWnjPYIb29tHZU8I+pXlqJ24vsXhlv07FPBmW0SEn3NXl3eonofeflOW2eNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6K158kyW62TbSOxxOBtyPGI8b+EA3AMKayR8G/edwqI23bX3V
	XdLxnr2hY+qt9x8guEdU/qSrC/UTlcdDEevhlibCw86E16o0yuox5EnXaZ/XP2WOuGs=
X-Gm-Gg: Acq92OG3bDaz5MH3Dctdk5LHhB66r83Lwlo6ME/YtkUhfgTwNmbz4gXXUX/zwVZY9AQ
	4V2+NipWn44p0qs5C7bzO4LVnAv8r4zFJH6mQILzqfa9nRMoC9gOoyXdnPFCTzcN2qGMlyc37ao
	OOwmcODNdmK4uECCPM04E0INwXcQOkrAAXil0TRSvdOHIZosjvcOdjzHJkIKGm8oxBwNLBHYgwx
	9Q52tyjHtQE0ClJf1AA+mvsUTD6fj7XMkxcMiR55IGYY+MGHz7sfviI9Uc1I3GA/wzHlAfttKVs
	ao3FqDAzvv4ROuwA7yuuichnAqgNBBhRc9X5pFyBgI85JM/D0CW+KIB/xpS5zCP7OxUMOmkoQvn
	3l9aoRTV/9s3kxrPGwP79zp7iYJ1KP95DKoKbRghNdgJWLLnyoDc5jJLDcjVv232sSaqdYZbT5M
	VX1SxC+saHvTg/zfxN8jEr4BqFT/aiQlsK66AtYgGAHH66k61w52Y=
X-Received: by 2002:a17:906:eec4:b0:bc3:c6a4:a819 with SMTP id a640c23a62f3a-bdd267c8393mr728111866b.36.1779658096915;
        Sun, 24 May 2026 14:28:16 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc30508d7sm334568066b.18.2026.05.24.14.28.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 14:28:16 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4585a116a4aso7448770f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 14:28:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LRqE62DWviYu3TqFKa4E9nQdIhSIexk9DK5kfixsVeP1PAakYfYMQEtO4wIouj7oeB/ARnWk/kpc=@vger.kernel.org
X-Received: by 2002:a2e:b8d3:0:b0:38e:4810:4f44 with SMTP id
 38308e7fff4ca-395d8bd88a8mr40151971fa.4.1779657657216; Sun, 24 May 2026
 14:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-8-jernej.skrabec@siol.net> <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
In-Reply-To: <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 25 May 2026 00:20:42 +0300
X-Gmail-Original-Message-ID: <CAGb2v64UvgqOPuZwayBmSUhQA1VwBBDpFn7ok0d7OVHjhzz=2Q@mail.gmail.com>
X-Gm-Features: AVHnY4LF9PZK6soJXHv0nl5iKDfqAVEgS-xhOR9JBN-5Ngh0yXQO9LbOCoc_jy0
Message-ID: <CAGb2v64UvgqOPuZwayBmSUhQA1VwBBDpFn7ok0d7OVHjhzz=2Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > As it turns out, current H616 DE33 binding was written based on
> > incomplete understanding of DE33 design. Namely, planes are shared
> > resource and not tied to specific mixer, which was the case for previou=
s
> > generations of Display Engine (DE3 and earlier).
> >
> > This means that current DE33 binding doesn't properly reflect HW and
> > using it would mean that second mixer (used for second display output)
> > can't be supported.
> >
> > Remove layer register space, which will be represented with additional
> > node, and replace it with phandle, which will point to that new, shared
> > node. That way, all mixers can share same layers.
> >
> > There is no user of this binding yet, so changes can be made safely,
> > without breaking any backward compatibility.
>
> There is user. git grep gives me:
> drivers/gpu/drm/sun4i/sun8i_mixer.c
>
> which means this is a released ABI. As I understood, the old code was

We held off on merging the DT changes so that we could rework this.
I can't find the actual request though. It was probably over IRC.

> working fine but just did not support all use cases. Why this cannot be
> kept backwards compatible?

AFAIK the "planes" block is shared between two display mixers. As the
commit message explains, this prevents using the second mixer, since
only one of them can claim and map the register space. And on the H700
(which is the same die as the H616 discussed here but with more exposed
interfaces), there could actually be a use case for the second mixer.

Hope that explains things.


ChenYu
