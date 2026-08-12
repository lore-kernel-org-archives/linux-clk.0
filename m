Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6054440F74A
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529325; cv=none; b=d/K+Ie3eHqzcbS0moLJ8YHnpXdJBUsP0SPOxZF2hXu8HHlH/paizx6tg3h8ja00Kqh9WB6FOlzJ0AJhmHDx3v1Foct6lcM2Lmz7Iz55PB3l+llvp2gL7nZS/MrBLSFI7JWXHBphvtOYBFhJHGNa2EnjOKHRU810zhY/oor0bS48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529325; c=relaxed/simple;
	bh=wokLofWxv7vLrWb75WZJGxZonifi+3z274aDMO/O3SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JeK4agPT2aSPdniLytSv8PUWyZK/Ehaqbkpr9OdWMFA+8DYMFXxLbwVtFVKy8w3c20TYLo+5S5WoXAQB27VXQERJfoRefgiLT38VIg1XxLjrafn+neaTdMvLMuuO6iY9puIbHjj0UZrj6Lx7f38BUhX7TxfK9plGfcbbuLp2F8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7eb61bbeb25so664937a34.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 03:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529323; x=1787134123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CR60h/fVXoId0NfC1qox1rIsZX7Vdp8o1eA32koeHU0=;
        b=oiUF/6PnBpso3tIPwBgEKK1Sg3p10v/m78Vl5cUIeNKJza1F3qGxWm90XhZ7OGKswO
         fxmpc7ZNOKiS6yHRmr0Rw7umpergRd5E72sCHOYWd/JqGHY8NNgzt2PWztHkFm2s6c4h
         TWMPyM3gWDhFkGI75m1wXDN6JPo14iuWg9sjtnt9aAwu6oyFnvQF71J2JN++P/lk2zFR
         LUNboXjcoo6cGaSqGINg07Ud9HJP9AhXdRJUh2+wFyTCJ3nUno3IEv8Z+8gueL/W476A
         RT54Tzex9UdDG79V2s9+afR+ykd8l4sRpBlKqqyMYVxJOATiePbn93C1PDWHV4eks96X
         WuUA==
X-Forwarded-Encrypted: i=1; AHgh+RrVQ3ag7y3a06drFTauv1cKwrF6briL+F7SGLAB7uuCpvKdkLnq7pTIJfLKrvG4uwiznOGITUkc2yM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdf2XirvHylpFFagcpWdDyrHGMwIDMPlUdpiLCfhAolva0tPgo
	vtLVgQXd+VX9EECqxGxEyiHRhBtkoPw5BV5xAHMAJAfqm2zKx3YuRStgV8E1hRR+
X-Gm-Gg: AR+sD12EfF+Bxijv6j7KxAFqHrv/ZyY9VEhHZJOGVnvuFralO1L737RkMWMxkOI84JF
	yowXuX7AkBliJp2tN/Sdqng2ErryDbOq2gU4LkJ1bXEgx9byfpAWm7BwVLCpuOttj1H4UYQuI+p
	8hpIter4mb6he4ZY5WxU12O/kYm2WGOfNXUyESRsXa3WC8C2NeokXUiCEStH9LfZXxFri+oB7h3
	1IiGoClgUHeYh+wLcgzhppQc7xLazm/v1vLn+wFePay569Sh9K86sM5uYcrfbxBtfNYiy7JhAsg
	hx+wBzJWDYO+ipN/CaL38irGNb/R12/luentN31PZYrinw0u5tzTgeStu5eQmZPcnXyWbP4kB2i
	zgHQ0Iv3eJdDjuCw3l8RAh/RpE3uMWoqElnsRoyokixfMIFyFXKaZr5UKypGl+Ke8QlK/ekAaiN
	HAuVHoioM+bODqLuNMKga4qqA9TQIq19/fXwX6R2lRY8XZ16IkgsxdinVsbRqBs2NHArTntQOYN
	F6IS4dsywHe7dMHaKVYGEHvGqI=
X-Received: by 2002:a05:6830:314f:b0:7ea:b8c:41a2 with SMTP id 46e09a7af769-7f3b74c1f22mr3427477a34.0.1786529323116;
        Wed, 12 Aug 2026 03:08:43 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b2fd3fe2sm2466266a34.0.2026.08.12.03.08.42
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:08:42 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb61bbeb25so664932a34.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 03:08:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro71Em6Ymb0bZcdUnjAIroCH+YdVZnGXsa6Sb2+1k86ZNWl4U08eOpmrgrw8rC8VXDiCNJ9UUfYqUA=@vger.kernel.org
X-Received: by 2002:a05:6102:3fa3:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-76c8e62eb86mr823119137.7.1786528956520; Wed, 12 Aug 2026
 03:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
In-Reply-To: <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 12:02:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
X-Gm-Features: AUfX_myt-2ep2N9UFFpinQmtMeTX8Y6aB554SNFoItehXn5f25ET5eoahbFPK1U
Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>> +  firmware:
> >>>>>>
> >>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>> generic "syscon" which is disallowed.
> >>>>>>
> >>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>
> >>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>> it is fine, but you can't.
> >>>
> >>> It provides a firmware API, which is not available until the firmware
> >>> provider is initialized.
> >>
> >> I don't know what "a firmware API" is. What does it provide? I know what
> >
> > It can provide lots of things (everything we are no longer allowed to
> > touch directly from Linux ;-)
> >
> >> a clock, GPIO, reset, interrupt, etc. provider is.
> >
> > A clock is an object you can access through the clock API.
> > (s/clock/.../ for the other cases).
> > Firmware is a service (virtual object) you can access through a
> > firmware API.
> >
> > In all cases, the consumer of the object or service needs to know
> > which object or service to use (there can be multiple).
> >
> > In all cases you cannot access the object or service until it is
> > available (initialized and registered), for which we have -EPROBE_DEFER,
> > and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> > firmware".
> >
> > Thanks for your understanding ;-)
>
> I think that's the difference here. Clock is not an object, but a signal
> on a wire or within IC coming from one device (provider) to another
> (consumer). Firmware is not a signal, not a wire, not anything which can
> be provided from one to another.

Oh yes, it is a service provided by the secure world or a different
CPU core to the application core running Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
