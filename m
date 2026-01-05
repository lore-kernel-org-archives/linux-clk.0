Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE92332EBC
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630264; cv=none; b=so2R1b0ihy1FpXvaebC7dOdsr45Vg8wtpRC8DCAUcX+x40GiO2gfYbnByxHXRdsKDtle/+18/PYUOwGnQuTtDoo8n7NH7y4QaNd2FKnYNVGDNxFa9y7HH4p0U07F0vlBGiSnHn2wxJwcWr8VXCq0YpYLRH1fO3DhgPMc6i3QFK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630264; c=relaxed/simple;
	bh=MQJHVWGVMvEgY0pTCRXhfF0hcdx5A6vuZ3OGEmwJLyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txnT3LTE/plAVsEt9xlBWAKgm5wY++jm20tJNQvsDeg4hJAt93nY76rrEtEmfQ8AqSaHYXsbVeLkqjtyNEoqbMDe0LRojJMtnE+yao4JEOBaX7x3xKOXvXQhRpC4sqcENS7GLdaC2IN6z2RRFUqeURe7AzKzjmz+AxXVI2uo7PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dfaceec8deso61340137.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 08:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630259; x=1768235059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG5F5JQHgu2xOW906W6PARHJHbrMbK+KGI+iRwpYzNQ=;
        b=I1yiO0qk3qep0AFdZW20WGHDw6H2hxik+YxJGZ9EuQRPE2+17GYlLnCLqm7WDc2unX
         3NeG32RgbESWReHBsl9thM3evHG1qaaMFSaYRPDOGGAbEE7ZlErf9PQojPOFvxcwmWSg
         mOw/yndWsFQj+SMNAd8Ei6vUbar9HgyjVhcKRmolWlBW4XdYbj8048yP0CtI3mcjW4tk
         yfSPdu2xQrJwwkzY9yHukERL8lZSfD97cN8AZz88qpV1ssSAmaX9oeCPKoU+gdErLDO5
         /LpwHuX3G8nkRWaK1j4d60jo0CKeh223XPsALLEyxmdYChMRssIyQCkSwVwvB5I01Bs3
         S1OA==
X-Forwarded-Encrypted: i=1; AJvYcCWv9M80E6xYID8dTGKv+otQLnwlx0eghEPFrB55MvxDQCwZbjrixo8CYOXxEa9NaG+l/Oxh3k6RLbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAf5Aoz2ELOjs3xeTcE1fYqAttyrWylw3A0oJOkI9DI0PgFwY
	b9O0RZyiv8b5frK2PzYCs8d2mL07KPpRNCUAB9aRtXht9/s1ymoTuTlv7KZqtjl2
X-Gm-Gg: AY/fxX4ovaNmCs5kw5bv9OkyUYcRMLlc+LXz74sNp6V1wcea5c15dqdV4EDjUGrAl2H
	W5cyXNtH/jXC+OJq2Lsf7rOUCMZBmSv8VE8MABnI/BPzzJWHk4ABqTxLhLcKkZcKN8qNtotjxPA
	cRj15+3GjdC86FxLlPZWFSgKFATHKKsJQ6StKK4+FOO1kcEA8v5yFAiNcYoT7QhLJMWplBafrSr
	1ALYyjMYiFmN0K3mwHMftnfFocoEsE8tFr/I1ckeC/6MyeWJbmg6Xkl0PB5jmSuBXLFtaq375x8
	I5eQnN/x21fpWdSkOdQltpVLfEmxrC86u0aiqaD7u5TqorxAMZQ5Y6hdTxWnLDCIjIC32Wwn8p1
	xshl+3SPeJkseE3EstB/M8huPU9kdkza9h2DCUqHQ1BSAouv4ZlHgAXiuqdijzyTaWZ/rMNhAm0
	jmRq7P72t49041NA1fkFgSvMYx0cUo0kQ8E5bbD1YFWys09BDP
X-Google-Smtp-Source: AGHT+IHd8LtK/M6ou1uPeG6XeTZj0t5dADbzdxpjxxMCmTRU8vDv2IF7JaSsT2MUF4IGm1q5rypKzA==
X-Received: by 2002:a05:6102:2ad2:b0:5db:de8f:3278 with SMTP id ada2fe7eead31-5ec30b2c8ffmr2685857137.10.1767630257279;
        Mon, 05 Jan 2026 08:24:17 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-943417972f5sm13300960241.14.2026.01.05.08.24.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 08:24:16 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso57292241.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 08:24:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhwx7Itka+YJYD6cqfc+95rEy8ltQNSmRTPmHJ0KrHzMucmyB9TyfvjbIXJ0Zr/xrO4WF4RgHI8YQ=@vger.kernel.org
X-Received: by 2002:a05:6102:5544:b0:5db:dad4:840 with SMTP id
 ada2fe7eead31-5ec30b2d62amr3150905137.12.1767630256405; Mon, 05 Jan 2026
 08:24:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com> <TYRPR01MB1561941846EC8C92EEB39E1278586A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB1561941846EC8C92EEB39E1278586A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Jan 2026 17:24:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnY2D8vLMd0Y2ypeSr_nm6ziiyG57sUNqkgNM-Jn-_OA@mail.gmail.com>
X-Gm-Features: AQt7F2owp4Lx4gxw43Zb9iibAIGGiEAsj4FfeLdF5mBM8hUhf0xrJMxP_puaoqc
Message-ID: <CAMuHMdVnY2D8vLMd0Y2ypeSr_nm6ziiyG57sUNqkgNM-Jn-_OA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix CPG suspend/resume on RZ/T2H and RZ/N2H
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 5 Jan 2026 at 08:42, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > -----Original Message-----
> > This series fixes an issue when entering s2idle on RZ/T2H and RZ/N2H, as
> > the register layout in use by them was not accounted for, causing
> > aborts.
>
> Hi Geert! Was this skipped intentionally?

No, it is just suffering badly from the conference and holiday season...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
