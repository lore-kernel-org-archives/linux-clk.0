Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF319992C
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715562; cv=none; b=Z6GyIqbKmTnB268IYNUbcRrysO9rTwqp/r8NUr71dd2mC06BEBws/+mesjPgXQm+YfsK3vOa+B0luPYbQB3lAwblFGhc623PbmsAhmoEz4WaZP2m0M/+D1IhskSvQuBWBwM/XFV/gSPIT8Y+33l9BLhvpkBbupfWQuFhIqnfdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715562; c=relaxed/simple;
	bh=uE6zepwOl2z1+COed/KllN9wAqHdEuXlf0sVx3b9Uuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0rAoLxH+b/n7jUMGVNRJuodd3Ov3i7UfwHBemqAUw4dCI9puV623SURqSdpPglOYrvQPex8v+Pk3WtcwpL2y0qJnc2ugJW4AAV7giwdhZBdBT2YfuirEHXNF6XttuwC7mhCVk4QbmZrJCb1CX8Qfg5DSnoBwyDlOm9i3KUWJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so1432321137.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 00:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715560; x=1764320360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsQ8cDkyT01+wOfENQ+tLoOAH/3N4WY8TL/xOv6Ppek=;
        b=w5jHrRy+DJw/2qk7cmaWqLG0ZLwCC93UUCJTFu63OCRkO3+sJ7aEf9iIyE6H7doo7J
         BiKQATZny44dIbtRjxfBiE1ir7hAwU+UCtSLfSjDpUpfPqmc0E1oeQ2jpTF6n3joHc60
         w7eW2y94cSBDzDWIJV6/gyqwH2Kk1muLfEDCVuzRSGOo7ApjXc4gzJpwIKdTEWt9oZJq
         FyE8qBy/kkt0e4X2OVQskmWUKrW3cwCFzOB8gqdbwb/50xUKTZ9FhohYtYZsdCu6NuKV
         acNRQbjgcnUhSE899nCc8CLSvQe1ktBIVDuA+bsJPm2xTE4va7lMYMJ2G4V8fG9OboQ0
         QLhg==
X-Forwarded-Encrypted: i=1; AJvYcCU7VK+6G6xJAkO1vmwhG/jZ7xKo6AjoDmUfuJdam/jLcVbWnGC8u5G6xhqxtcF2mmwRjcJPcZXYZFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTLUTsM4CiT/RlkVY+dquNZFiRjOmMF380i5tzACeh5FmVXBxG
	AqgzlL9KsPENRbF+1xCeiPl6uynLd/C6YwSxhMkoENgmNS5ic5PdHou4BkCC483v
X-Gm-Gg: ASbGnctqaazVFrbB8+TLgnS4DgsZ8vjUndzZHBjluk90QpUWxlb5Lw6LPHlRi/NAGsn
	lCulNIlftioEHOUpyQ8SkawsQmztD2pgZ+wdMw6lhvUmv2hXYofr3fOz5pvX7cCT8/sXVctg7PH
	OoOWhqrvclFWWWBQZmtRw/tQE5arGVqOMWqm9Hg4O4hBVMI61XZlTV8lURayMFinr7u8faY5xF7
	S7hzFKUkFUE6VP1pabpthHk6xARtCKZnZug8EMDC8orVokp3MYiU4OqmVUHI3duY/+bX8fimC8M
	bfbeVgYkbL79jh6Y0FLMgqf3bvT+fgRxZz2GfekIZ9oUVO5Mh+ttQFhF3w35JAXMmgE9n+1afWy
	/zt3DwDuazfUupzuArfFpY0VHeqKOd8mwjij2qzATaFAEP21cAQtBNORIcUftKsArrdaDocl5TF
	JEowMc1S+uomWkJ2jlWntP9cnk/y+sZD+sYE5jjQAJLjlTc2ik
X-Google-Smtp-Source: AGHT+IG+pAR/NUgSArZwm6CkaXJKLPjc7vZENm21xQQWm3isoObFg791XjgkGTZRayWJ/C0VUnnDMA==
X-Received: by 2002:a05:6102:c4f:b0:5df:b31d:d5ce with SMTP id ada2fe7eead31-5e1de3b25a1mr377095137.28.1763715559682;
        Fri, 21 Nov 2025 00:59:19 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bddab1bfsm1896083137.13.2025.11.21.00.59.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:59:18 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dfc3c7de2dso1103973137.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 00:59:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXtqFSOvkn44lp3GN1CM5UNUY82LH/9ZQo0fnubAQg2sdMBLK/mj7+v4stDXW662gAIuKFZ7WB0gE=@vger.kernel.org
X-Received: by 2002:a05:6102:3f10:b0:5db:d2b7:9518 with SMTP id
 ada2fe7eead31-5e1de423d78mr478729137.34.1763715558120; Fri, 21 Nov 2025
 00:59:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com> <20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
 <20251119132235.795b633eedbb91f8544262db@hugovil.com> <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 09:59:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
X-Gm-Features: AWmQ_blyptlri4Pqcl2NwaA7Kkvpb6TwU_7MqBj9JCpi6c-uP2G1untsfrdqMis
Message-ID: <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Fri, 21 Nov 2025 at 05:04, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wed, Nov 19, 2025 1:23 PM, Hugo Villeneuve wrote:
> > > +                           params->pl5_fracin = div_u64((u64)
> > > +                                                ((foutvco_rate * params->pl5_refdiv) %
> > > +                                                (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > > +                                                EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> > >
> > >
> > > Also:
> > >   foutvco_rate (max) = 3000000000 (3GHz)
> > >   pl5_refdiv (max) = 2
> > >
> > > so the result of (foutvco_rate * params->pl5_refdiv) could become
> > > 6GHz, which is greater than unsigned long on 32-bit platform and overflow?
> >
> > I confirm that when testing with "COMPILE_TEST" as Geert suggested on a 32-bit platform, the results are not
> >  valid for this combination (but they are valid on 64-bit platforms).
> >
> > I think that the kernel robot could potentially issue a build warning for 32-bit platforms (if they also build with
> > COMPILE_TEST enabled, which I'm not sure about). Maybe Geert could comment on this?
>
> I've got no comment here.
>
> I can't image when someone would ever want to compile this code for a 32-bit system.
>
> So I'll leave it as it is now unless Geert wants me to change it to something else.

Pieces of code are reused all the time. So I think it is better to make
sure it doesn't overflow on 32-bit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
