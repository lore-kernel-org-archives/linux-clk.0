Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D39130ACF
	for <linux-clk@vger.kernel.org>; Wed,  8 May 2024 20:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715201543; cv=none; b=CR0bGPufJx9D+yFu4yu2nsmtJcyrj02FDQ1mnkGoEKvMmH7BpcnOD5TUHeUoL+wNWodaquOc1mKR47MWa82+SFv4smfeifp6GmCOuiUhfwUmpkjcBdfJRt0tTdGZqJQ+A4oSsQfCBwd807Am0VwsB6madtx7EfeoCdub3xEFu4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715201543; c=relaxed/simple;
	bh=p+hc+OA2iCLCTepSnlLlQPjrNwZJrh8G7ChR6vwC3vY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1pTGBZA6oCpJ3H557sX2u2kgA7JZ7KfdtIGJ6uYfnp0TKl5xFwrs6VRS46lnBT+IqqtlOfNRpH+eOYNCvqYV5rDyMvv+QrOcZyDoi8qz/FgTeUDDIOzrhtauzRxxOX4udi4vREmvNsRm4DaS2DNBW5gI/lzOajr/zoPgtGiDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dfi+CvcQ; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dfi+CvcQ"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-de5b1e6beceso270456276.0
        for <linux-clk@vger.kernel.org>; Wed, 08 May 2024 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715201541; x=1715806341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+hc+OA2iCLCTepSnlLlQPjrNwZJrh8G7ChR6vwC3vY=;
        b=Dfi+CvcQ1tnVNA/9QYJx1Oe5Mu5DQU6hWMsqkFgCa5jhHR/mJS3weI40FMH9vXCOsm
         oibX0aNWzOfzGiDrxRHuGIrFFPIQZcfEv2qhhKm1Sfl0g0ENSLzSVuktIp1KiqGfBRX/
         rPMy/6vaSj1kVK7LY1181+2RWVc6czChGWyOQ02s2noe+yrjVBcTfTBE6Y+Ukuto97gd
         frQAyCMvVEkAcf6kLr7ioDoBYBtyDKP2e8sRl3QRbjtTAx0uk2dy16iQkC42Qrim2CTs
         fvlWYNIuct9DjIzeZZhaacvmwPJyvgOZIXpr7gyKphj6SKCZ+WcCKW0A0xaCQEEFIWXF
         CoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715201541; x=1715806341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+hc+OA2iCLCTepSnlLlQPjrNwZJrh8G7ChR6vwC3vY=;
        b=iLx72d/P+/v2rD0ib8FgXVUhfQmknM+HvhhNoVFvPQeTInbJFyFBgDJUiOzXa/Ljyx
         VDXig/0/SVN3fqkoMDxsgiJ/sJ1p0ECmXn2shy/Pfcwfy5liJ/l7/IyE8K7X3x5kPav5
         p2zGfwTJUnuJ7pDTLI2JSvs2I3RRff1tT/H8hjEb9jsI21cFj6mcWkHGhPtqGErRInhk
         GpWNospnMZVcruIZSqjY/q20PDiFW1yzpEfnNDskPVX0Y4j+XejsqVq5MkxfvThRlQgJ
         WJzLR8vPzaZZvFoORv496oTgt0oKQ5fv7gSZgMRsfAOd6WuOMpqpQfL5S74YgYkK14v2
         w38g==
X-Gm-Message-State: AOJu0YymXToOD5nb2NOU4Km6bjM2axuJi9321+7b6fzKoLYd1WTH708m
	I9eCz8ppLBxnmB9tZYz3qHPoJkVOzBuu3sNyf3bamwSDkkcGh/dVS37foepn3vURdgUWSswJx63
	Nyka4b/XImcLefuSw+duxn8NLB0MBCpnZUNcFiw==
X-Google-Smtp-Source: AGHT+IF4xwRhzJxSLcmGAjfMW/Ca8OBmnmyryFGPuWCqEjcaYNQiCPcJ9EBFy8Xy7r/a++IRKIMbf67vWhWe0XdfywY=
X-Received: by 2002:a05:6902:4f4:b0:de6:b58:fe72 with SMTP id
 3f1490d57ef6-debb9dc3424mr4139892276.58.1715201539541; Wed, 08 May 2024
 13:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240507064445eucas1p1bfc17da4f824ef46567774634482f12f@eucas1p1.samsung.com>
 <20240507064434.3213933-1-m.szyprowski@samsung.com>
In-Reply-To: <20240507064434.3213933-1-m.szyprowski@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 8 May 2024 15:52:08 -0500
Message-ID: <CAPLW+4=0_ErruqVsSUkKfzw0+m3i8J=jn8A_SEnwLKWZX1Oyuw@mail.gmail.com>
Subject: Re: [PATCH] clkdev: fix potential NULL pointer dereference
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 1:45=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> dev_fmt argument is optional, so avoid dereferencing it unconditionally.
>
> Fixes: 4d11c62ca8d7 ("clkdev: report over-sized strings when creating clk=
dev entries")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>

Thanks for fixing this, Marek! I tested it on the E850-96 board, and
it fixes the boot on current kernel-next for me (next-20240508). Feel
free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

[snip]
