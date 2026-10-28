Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181212;
	b=EXd3H9HAkO4Ddt4lgIQBaXuSkXBOcL9yHWV1OqGR6+exs0ej4TZjKzi3x+ro01ThzSnn
	 FhcPxq3Fo35KlIT/aqexrclCk7vHDqzlNBAeEIjYRMvse3+Nv6QdLjAmX77o4DhzHBP1u
	 m3ajFZQkYn6eJI29IOD5qvuujARCA9CD08dvkastFRHOT70b3FCMLuFRPI4P88eBOjEmC
	 dn9cP/gImods9wctHOLaXMVH4NjVjlVWP5YEqfuUp3hiocN9ZnOoL9uLw/f0+Iqqwd9Gk
	 58shF0kRbSpydV45ydm9h3yHNK46Fighh+pLifBdBIeaM5YI9fJLTs6rc5Nh3Kedd6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181212;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
	b=WoSn00kk3o2e1osU9eMDZGfL2TH9U+jU6xpa0xprI3cQhjE01a3Bu+kranKdFpEJ+e1H
	 Ybo7IEpryXTTkZFvAIIxJksxqkHykhZFY6oVXfr/XfFR5ZKMV9xKGKqxWbW7g6v+TRR3K
	 hVgxnZP+s05g+Jcwp2GWPrqSCR/B6yv+DkAEj21Q9gQ9/e54GnArd14NkbzMO8PXMhKyw
	 OaX2nX/beOGJAhUyT0SzRCoWy15F+P+SGsu5VjQjVrSAWjtGhjfEZiLzfI0DlNmsfSPqf
	 X8EEh1myLg1lU3T1JqCb11McQw+gm/46/M1oDgZisBssDr0ZjME064hp2jEUQadcywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C11606A31A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C11606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-990835cec4bso500418241.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 02:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181211; x=1793786011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
        b=mQVD4l0kyySpxeaD+XQ51KW+Lf35C0RaB/edpu35hndqyUpWQ+CNYz7BYkyl2YAK3J
         SQb0raqYgFZYwqhQkWCH18SZzVFUm/ol+m8aF3hIBYOqnGONUgrrvSocB5xKCBoZTIxl
         TqzFRf8uvPfyml+f3ZkkGtuOdcd906633Oe9S3V3RoinGCsZjewP9dYgO9Yr6edGzH74
         fj2hGnchFv2O/CpZJvpPv4KmwG5i7Xz9FNpy6ybR/lqFe2cHrJavlsNZwoV7MJur9Ma0
         jCQQsKyFjiJjo5Gh0BSBhaSdyyaK9SqQUUwS63mpkrVW3D9/x/3RKMtlxMQwqabOBFlJ
         8RtA==
X-Forwarded-Encrypted: i=1; AKwUvBwfZIIkP7KH/3eXUK+5B73DZkBTYNyiDUerVjcPBymgHLsGz+2h+vrxpV7ulGmSDGycuYgQsyyFjvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM6qssZJE5xaQpi8h+dRA7f2cDf+wA/8pMxK9JbK4zBUXjHyo+
	XOTQkKZWO7CKrbiShGmVb5xEeKNygJz75r5Pyqz3yLnuE4iPafLb3Qam1BbZxm5X
X-Gm-Gg: AYBFou3mk+/uoNJCtZ/Iv42J0JD4Ew4RsLi2JKdVkuUXPctWjgYyCRfq6RI33nykrwQ
	7EbW5T1c057DSLZ/HxSKQyDE4HmvsZUNB6uxneHspIsmcEg/5Rw5jJEXZftyERewzShqOHlftu5
	l/geHp5EpsL02r3UhNqI0SkvqOIMguGpmqtzyrPsJx2TuRisKOEgVqdreUQPhLcRoeEvbLS8yKG
	MTXn+3D+K9vqFXJXBFb/OMajqtVDUENN4p2TATnVlZe99dkanFtXNYqebPzSXh7F84+LSuuvPj0
	0MJfig1JvjTSMyMNZ7P+jagd/8txGkjry1K9obRQXrMTtyf2dN51Y19a+XxGkVUoFSghhBHmi4D
	bh/NU1hFk9e8ahQgLAq/zLs/iaK2GRhdpui0XnPRIrvNvNB3x2eE8PS+6Nwiuh8B1/TbAGF+dbs
	1/tfnI046pQTGIpTEBk1nELBCOMAJa8vFdYcLwZh7PexP0XvWDZh95+9CvRzstl8tEvakZxmAg2
	Ddy+8b+G7oQR0Blqm1Z+KebmBvLVYvj3njcjt8jefV2Au+JpM6P5JwdfavPmKFqo6Ar0nkSGBrf
	L7brsNb7OiW0Z85I9AimLSnshZvv1zAKpX69yk5nkr7T1djuBVplwp86sg6i3ETUL5Q=
X-Received: by 2002:a05:6102:3f94:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d039efc0d7mr810303137.0.1793181211124;
        Wed, 28 Oct 2026 02:53:31 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259c4dd0sm5293042241.3.2026.10.28.02.53.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:53:30 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-990835cec4bso500407241.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 02:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByx/MkxqMgmwofwHC2O5og0IBb+Fo53HFauizADu8vgrM3a3PlCJoG4xEVsxST7ZudXYX/mh20g9hU=@vger.kernel.org
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d03a47e768mr803872137.18.1793181210633; Wed, 28 Oct 2026
 02:53:30 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
 <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 10:53:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
X-Gm-Features: AclHuK9BGkRKGrsUq56mu96OMIK1DMZBGsGDXPyfwPmkMrcZVroZETBYHJfP3k4
Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 28 Oct 2026 at 10:47, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
> <geert+renesas@glider.be> said:
> > When a gpio device node has no gpio-ranges property,
> > pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
> >
> > Restore the ability to use GPIOs before pin control support is added by
> > using the gpiolib helpers instead, which cater for this use case.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This sound like a fix? Can you add the Fixes tag? Is this patch independent

Sort of, but no upstream system needs it, so I don't think it is worth
adding a Fixes tag.
ISTR we used to have GPIO nodes without gpio-ranges on other R-Car
platforms before, when pin control was not yet available, but DTS
history doesn't provide any evidence of that...

> from the rest?

Yes, it can be applied independently.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
