Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A263D093B
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035320; cv=none; b=csLmWXlftQTiblLZd7o//H7M1OQY1xQidLNjXfThd25lqP+bugqrV8/HHTJibSB7y2nJeFhLIDemaEg5KEfDlrer0QGeEV/h2Api8jdmqhNlhAB/zQVo65T3ueP0crDzpbBIKrMXyrHpk6OnQ1Toth29Zrl9Cf+yU4E9C4jzQ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035320; c=relaxed/simple;
	bh=0AkTkz7PavrZfk2ep3iewGI6ARs5eoc7dMRB/pPd/Rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H37xx1D2fZjwxVGVKaZmKpWKCHOwG2io4rX/lqGuUoeaiw/aqHsOMuUoqQIAOJcXSB8ijatn8moBvLB7GQrdgOMX+i8/Dv69zCp95zHdB6DvwUv12lEXLK9K8vQExbs6Q91zMwbQdkTbGEPuhR6UGrs48bU/ph4zpiNz4gQjULY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba9ad0fbc3aso598499766b.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035309; x=1777640109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5vJjGO2tC5oIa+NDmM7lxEsTgUzNznIowWCeDLtGCw=;
        b=jNKpjM6Nd+dMnGu7+lek9vpJu3Od7tpSG6706DMgvYpJocXIqUzQeAPmZK2L8Bqcpp
         InTUGP/OYw1dtlNYRYnOtMyML9zeHjKLWymL222n/o7ejRAb7aMzdkf+x8INWFINi8tH
         pAUFM8F0rxGGCnlADe+WTDtMvFaF+cZqTJjdvIiFuI7udxRSX/gs286gLjnS+fsOwL1p
         L6ZhoOx8Ww73seuoqmomg9U/lHveZmiFPjFUoL1KLp5Sonf0SAAm708WShmWxHxc+Hpr
         HIhkezugIMtwQPripJ9ul6V0r8FI6ITEt0wpkTdwgCuCNbWzYyJb+rj6W/1OlH0U0hqS
         SikQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xSWr6K3LdttWqlI5+ih4SWXF/+tYpp1HP4vwn5cArQVmEvEXRFeRC3GyaCpqnOcmMSEOo2ltroUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjWWoPMakG7OfnvkkzxT4gfBHwHVPxaZiHb7xdXC/eWqlBV+55
	kZZ02uZXmzV66NlPuJUmWrWm8SAVFYpPebk6RMRf15thZtnQWcwD5EqTmkiYEdDYY1Y=
X-Gm-Gg: AeBDiesZDYGeokzsuZ1TBDMdTyRia91b8PWp3gQKCNLOG1ZCEgkckm8ADoYsweuje5K
	lmiBZ8AUn7V0QVnVWchukXJr0LdShZAZYapuK9IEoXKboChKjII1J5jEHrEdeOINafP5xSP+0xV
	Y6QOFhRr5W4wPP/gdXvPplkVYw5xeX0BeGHES58vs3RmM2Op4rFswrpEn1JE1RHcoa3zBozREz2
	AyuZWYmq9QHmdn8DXgBjCFXzPJUUsTVbw7C1odzIVQ60TR3dp60GpDnDYmPxpNCsCtwTmK7V4Ut
	XtBmu6dFll3sRg/m0RHXBlzRwua8pFXQriCb3+SzNpYa6+dqzBRTWsd3RY8tcHg3S/2C6U/4MSZ
	E0qG+9hrsWB/xsCbKqNlDaTKoT8M9QV1v/DgEMTnF5OT9zgCkyNqeC+Ab5A1lFjqUlxcl3xSYyK
	A8AS8vIJgK5o5gkb4tBJIaZXubIFagFfoCWlBRFOX0AJEEPcHOdZdG1GfkWWKqnJRqaTk75PY=
X-Received: by 2002:a17:907:e112:b0:bad:5231:3855 with SMTP id a640c23a62f3a-bad52407eb5mr159542266b.6.1777035308996;
        Fri, 24 Apr 2026 05:55:08 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d67e50sm4491261a12.27.2026.04.24.05.55.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:55:08 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ba7fd666666so651573366b.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:55:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+6ujLy2zKUp41F7eWvyX7h+rjJPbHvBvYGBpz6Q842Q7qNGYvtNJyP/I3If+/d2fjfFQ0ZNW2J2E=@vger.kernel.org
X-Received: by 2002:a17:906:4fc5:b0:b97:aea3:86dc with SMTP id
 a640c23a62f3a-ba419074424mr1701986366b.15.1777035308315; Fri, 24 Apr 2026
 05:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:54:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU67v__Vx9bEXt3J6=KPL1H+BMZze3LciENenMkVghqeA@mail.gmail.com>
X-Gm-Features: AQROBzCGlvM1AaRvUuqM2RvSN4bri7K6oIFhtK558gdagjk0-rYNfxDSOhaRcnQ
Message-ID: <CAMuHMdU67v__Vx9bEXt3J6=KPL1H+BMZze3LciENenMkVghqeA@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: renesas: r9a08g046: Add SCIF{1..5} clocks/reset
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SCIF{1..5} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
