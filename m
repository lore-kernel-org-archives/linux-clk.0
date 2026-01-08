Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1F3815D6
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 12:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875961; cv=none; b=UtUR1jxnumuuw73+5fmvOtyok/o1Mk5UENUMNKNdA7sCLoUti+rgcaUWOrnsMxOKVSW+9qYbace9ZelcVagbEDjkNI6adn4rM5fNZwzA8XwcP3SibM6Rps8sDAOZ6fSJxCHAAtib4KkaxyW3nDg/FAFfqzUKxavJhMdiCOVMyog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875961; c=relaxed/simple;
	bh=WC3uYKd4/f6Vde2p8a+mUChwObaCtYpLEvINds9n0r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNcoCOvXljCHfgeUqDAwhJvilnRXsAV+rNGcidVRXvI3m8CQqXAYC1lDADoodszLYXT4+EpLAY55515g1vlWUM1LEii9BRBYWWqATBMjrF2+uNOG0xCriPxG5dudw+oNcoFHV2hsYTRCqjnx8FemPnVbWflAGFfFY2PbcxUh03M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso2685329137.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 04:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875957; x=1768480757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lFdiq7Kd8jcUn0UfsFN902y3LB21vpaGTSMoUSM1Rg=;
        b=Z2zNJG1bqnrpC5e1ZUJycrdC1jl3vyjzhLwIShhvFHlBA2SY0jm4GQfLgGxjeHhdEO
         jubnJZVlU9xMdxopOAkglj3vkIwoyX0B9P6FRFoO0ilAsjVidiFiBMIwJgcbShBiKRt7
         BRG4Ct/56voFZxyehgnKS80aTJB5DF8nHspZ5U31iozti4AquoyFPzvWUZjqhAXVPVD2
         vTRNNzSqkqvDZvV04xUnz4uuRchHNmpSnmSFmqeFjNUEc4rxWZo/+eUXZ0bHI+BYBH5z
         5JmUVuprL73/1pFexVJBjJvOAqsqUtPIQ8P/pAc96nlUA5TJ9yDGh2ZUkInB9E9SCwdP
         qOwA==
X-Forwarded-Encrypted: i=1; AJvYcCUK4BlzdPYpJ5n8JyWaXEh9j4nx5lwnVQJ+ie6fabFZoFMe2XuYRW3d9FgJXLN515vniS3AfOhowBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPO5udiPvD9YQHVpHSI5/0VpIN8fK83Omx8M0wjWjUzsvyEfF
	FIs+z68ZHTKrnnIdr54dGBH4oscmXiKeD2IP1doV50Rv+3CIapgazhro5WE1039Nnj0=
X-Gm-Gg: AY/fxX7lbGZ9bmC5M38A8kBZ8mbKoMB90tFCzepySnN43X2qRQhjMIpGLxCk30KooKo
	SjyaD7SW4V4YD35b9hNaH1DrvWpzLKdI50MrM3GsAj/OAsoivg3B+rFdeT1jNKR6uD7wfQMl+dH
	imkYC5BtVRyM2xDkyKcEcWINWs41J2Sx9cF97YHCJz3mZxnCy7TP70ApH9iuGcHyVQ/QhbMSGgt
	5A/+NTehoa6XxciuagbkBbvo5MG6BRXtQqoOLk9Dyi7M/lCtHQ20xnPTX4MUoh8lnYIgud0sOOD
	ICw3ZRNDOJRxh7Y8H3Jf0Mq/IJ9okydr9KBM0o/B1i6pFVES3E7d89TdPhz3roDJ99e/St9/jYY
	hWJeLMsbrug/DySkWa6oldJD7QnFUZmeCXj+hAMIKo8smWUQ5SHOD+SP8lhc8y6HGqF+V4Hta8X
	ukyt321xknQrU2IRtquDTtEJmuQAXwPOaTzFgusap8F7wQgZvW
X-Google-Smtp-Source: AGHT+IEXuInqYj9/V0udWr2VOSLdgOp2LaiVoxIyxqF3v4Hakjls7kcyYFQ6T5k1eHFOM5ZUN+Z43w==
X-Received: by 2002:a05:6102:5706:b0:5ec:14b6:87b6 with SMTP id ada2fe7eead31-5ecb68d3c2fmr2032036137.26.1767875957219;
        Thu, 08 Jan 2026 04:39:17 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122d3040sm5611395241.4.2026.01.08.04.39.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:39:16 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5eb3c50c688so2160548137.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 04:39:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+fiP01kGcxzNakf5FvFhe9sqiBQ2zzvE3rB/5VZEYtIVBavqQWBTBGV29+zlMURSC4LEcBGI6n+o=@vger.kernel.org
X-Received: by 2002:a05:6102:dc6:b0:5db:3d11:c8d3 with SMTP id
 ada2fe7eead31-5ecb1e8de77mr2236719137.8.1767875956411; Thu, 08 Jan 2026
 04:39:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108123433.104464-1-biju.das.jz@bp.renesas.com> <20260108123433.104464-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260108123433.104464-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 13:39:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVr3Miyq+X_7p3WXC-rBxbhF=sT7TR2ztX3TB1jLPQ1Bw@mail.gmail.com>
X-Gm-Features: AQt7F2omDcJzqHunFWBMk_zmpDyoi-qCpdliOqTIUGhTgLZHXOdiILu0JcnuVYM
Message-ID: <CAMuHMdVr3Miyq+X_7p3WXC-rBxbhF=sT7TR2ztX3TB1jLPQ1Bw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 13:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> If the assert() fails due to timeout error, set the reset register bit
> back to deasserted state. This change is needed especially for handling
> assert error in suspend() callback that expect the device to be in
> operational state in case of failure.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Added the variable "mon" in __rzv2h_cpg_assert() and used in
>    readl_poll_timeout_atomic() instead of reusing "value".
>  * Dropped the assert check in error path and simplified value using xor.
>  * Added Rb tag from Geert.

Thanks, will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
