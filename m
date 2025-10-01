Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC672ED85F
	for <linux-clk@vger.kernel.org>; Wed,  1 Oct 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759325064; cv=none; b=V4PvTrczWH+wzqmnd+6wIq0FRfRmsd/dpNawoAe46/Umy8MeL6uTlZm+RE+pgZbqjMz1zljoKoQvzkvqVODw82Lkz7rLYskSrbPgrc4EMx0NLsUo1P3JoI05gvDQdrajRwbV0XfwpbnNIpSUs0ZGL3ZvcPAAsKHMUbVfzs8W+iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759325064; c=relaxed/simple;
	bh=I05mR9/50DLTEHHaHy45Q5YQgLDEg9VchuCah9dVd2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6GTL4bWpktUIjFuJXObyxpkU6fZyh2adRTZnOR5Z/wNefev4B1czIYF17z5Nd96ySVYnAgAXZfcYqbZ9lipKyhwxnzGlWaM1cflTWEFHDukz+Ugf2y7Co8aakn8pMfpWH9lJDtJ57BXSOiUGTbofZS3Opwa2KYw5jvShoXQmUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-85630d17586so978233885a.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Oct 2025 06:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759325061; x=1759929861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYdalTnEkJlTI6nAxkZ1pZoLmc57oQNk8+NRjQz1+SA=;
        b=YI6YQIa4OBNKziCCxC+dcWV4sybrQpoUxB7/W9JJruQZWddbYSQx/Q0N0z4Gw3i9pX
         rZEU2j3owsd//MXSRCs2acc9ugdzwKNGg8qE1wC+wGFeKr9+5GVxQktHE9iMUr2zBEg9
         xRVm35EKnoB5UYc/e8cQtttBVptDtnFws2RDxbb/Za9vh5Tuh2BOXQyAB/QayFJkwMBJ
         kJhhWlKDjkR8pl5dmaK6S6NOlzRaDQQPvvopJg0gYheAf7tTmEHgDo33NRAQyJFC27bD
         47gxnee3mRdIq/1gbXWQ5ktzjGPc5G0oKkVh1wNZdn53jdpZSa6To+0Gx1uosR30n3sS
         eq2w==
X-Forwarded-Encrypted: i=1; AJvYcCWYFh0UFoGhjVxWSTbA7mjhsUXiCbLgLTkV5ebV5iCfJ7QhKvnUmWyZSzqsyG/A5q/+ay3K9jOUY2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw67SNhbYMZk/pLgM7Jme+KdNCWYmH1Kzoqa0/Gs3dY6QcYeK0
	lpGOvmDiPK+4RSgnMEhyTLQPBFYQ/L9GO2IO6iZzItMzRvGnQvIMiY/GzYeiYJ+E
X-Gm-Gg: ASbGncvWuEdwiEQA7YxkotYudjtt7t/UOhGWgmU0TZVxKujWVf1YPoGcSZLBRw70I46
	XugyBlfj/8uSgEmnBZvl+maKruJBxsXsgSLbEIFERhHtdoLeIg7uFzYVkr/Jh95A5w+9M9krKyR
	9HPuQqmc3vFv6rE21c7iBlMwJo6oIGLlADZk8gN1tSEaV1iKmHq/15XTpGKq95h+/rOkxs2Kj9x
	gX2XtiAl29jPEFxRLMnB9xcy5BF2cpE2HkxpeeCM1Ff8gjzw+R3E5F6AXmWe0qXUuZhfVOaHOWi
	ErnUVaK3cy3Zhqt0Go4B5zNBZX67IfCC03gs9BFALdcLFCz4AA2wU89Zd8zoNvKiWMkhmikTjGV
	oB95YIV352qgzI7jpin/j+z9qJj0fnu/NL0nXgknbK6n+hgD/C0u1YaLd6clfQn8cDVjUtdrOeO
	MP/BkVKfwOlooB
X-Google-Smtp-Source: AGHT+IGLr7dGlG7KfcKm3B9fsRjCApX+9NEIwYEqAyNFTvzYKBkMI4DujecSDkmDrNbsmJCnoD0y5A==
X-Received: by 2002:a05:620a:28d2:b0:835:20be:c61a with SMTP id af79cd13be357-8737116cc42mr476021585a.27.1759325061401;
        Wed, 01 Oct 2025 06:24:21 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c28a8d4d8sm1228794985a.25.2025.10.01.06.24.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:24:21 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-856cbf74c4aso155630085a.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Oct 2025 06:24:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXv/bK+7354Q8BUdMjoT5gaOgE9U93k8QDkO2Q+6IWfYpx+UabPnc3ns+XCXepPY661cX4uyXwDCCM=@vger.kernel.org
X-Received: by 2002:a05:6102:161e:b0:58f:31da:dbd3 with SMTP id
 ada2fe7eead31-5d3fe509ac2mr1393313137.13.1759324645740; Wed, 01 Oct 2025
 06:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com> <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
 <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com> <CA+V-a8tosiUkhaWGoZ9yTBe1Kyy0DLUGreqReH2NOWmVeS5_pw@mail.gmail.com>
In-Reply-To: <CA+V-a8tosiUkhaWGoZ9yTBe1Kyy0DLUGreqReH2NOWmVeS5_pw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 15:17:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFSvSGBearGPU61atsHFu7NoDjpbxNNvyGO21j0-_OOQ@mail.gmail.com>
X-Gm-Features: AS18NWDiZs7Ynz61qNNAVC6cUY3oeLbFhcjv_kGBKaaXq5pMP7Ji5m5RgOlqVh8
Message-ID: <CAMuHMdVFSvSGBearGPU61atsHFu7NoDjpbxNNvyGO21j0-_OOQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 1 Oct 2025 at 14:23, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Thu, Sep 11, 2025 at 3:26=E2=80=AFPM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> > I still don't see why all the code here has to be in a header file.
> > Usually headers contain only a few lines of inline code. Is there a
> > reason why it's not in a .c file?
> >
> Ok, I will move the functions to rzv2h-cpg.c and export the symbols
> and have the declarations in include/linux/clk/renesas.h.
>
> Geert are you OK with the above?

Sure. The DRM driver would already have a hard dependency on the
clock header file anyway.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
