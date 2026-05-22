Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B94402448
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457410; cv=none; b=e08aA6a0vXsrfSzzg22AHSVkhGqpApTnCEZZU9wlVcVxnBx1RKeOTWzWWaqC35s6BJ2grg2m4lt72IRCjdpVYEbrVgiox0j/lv9XPblyT9rebTT/gAytaLlDHrV/Xb7dicjuDK+gW/SFJcH4OebVcQARJkjv9FdZJ40V8J3L+d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457410; c=relaxed/simple;
	bh=HEs2rq79YCoAiEGVJOXZDcuuCnNnzEJW3mYI9DGQ2fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lx3bv/IzEtZwODyYx4xHVb/zDA5mfXrYfAc2fzzkI02IuzGumGUAT9GOxmICP2pZnecfXbPRRdzfNO0iwXbbjTxq//Q1xCZ8EF7BjpmLtFljsz6paAn4vIzSk5QytJKkMZyN4XKh+XOnGkdHhummEc3CZXncKupNblSC0hvQwNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-961780b0ba1so190144241.1
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 06:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457404; x=1780062204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWzbSNX3RGbee5XiT1xV4dZKM9nwjUk9YQDs6iPG2rk=;
        b=gzrTEkDTw8WLgM8B2nlz4Guy+32FkxYCzEBBO/Ld+UVauo77SstZzs5f6sxxZDsG2T
         aBdOgZPa/OhzWrBLc+og4qa+rZO3Ib/95xX75BXeU7UOx5H536ZMLPODZ/vTCjYkjK/P
         8ryUdMPPuLud0BUFSjsNX7F+Qh2BjPO61MWrX2hRl/EBne99YLojE68JV8UrepQLj2a2
         TitR+Hf6TpqxYPVm0yNBJT7w6Di9vTHoePp/giMrqpeFqTVYI2N0hZZn5cLgkowyfvEM
         XL3U3d+TfFkq9vDcffg438KBfH6wt+xOL92QQANvOGtKQ5HKcaR+7s69ASzrnK4F9/VY
         Dn9A==
X-Forwarded-Encrypted: i=1; AFNElJ9dzCV7aDLg3FhVp7xcsH32WyvH/MULalvb8R81K/pIFn55l2SSsPKuVXYWIo7V/HQD3MQBWzMctT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOC/bcPVhf5qX7drBMfEy41lURCTiFdbPo+KYtXX/hpmptjbHn
	+TDGM6fZMuP4Wyr8paSJeMGXg6okueO8N1nBaPF74VQ4qkVCUM0JzP2WuFhz4hVhHiw=
X-Gm-Gg: Acq92OGiOphbHpxuVLaHPnd/cc0uKoauZcZgqzdkYK25xWqFdj40za5MHVPkAxwzEQV
	UxPXrAAzNCF58hrROTMP2NlqrX7BWM5wI71wDvCmOpca++ooOXh9z9v2yuJU9UaGi+JX/M/ogwy
	DmEg0UA/eg+u5vkeGhlMB9tfkbJtRF9MSYhKMVuJVqfSavPwpSRpZbv/GxKaepjlHa+70h562RD
	99ICpaDaNfCcdE0svcc1eumdfItbWsht+GS5YNYBvpnH96CIyF7VjGNUg75QWRexZy2zGAbLwa9
	RDnmj2UHUoqQhITf3mmiI3eKVZnQUUdZcDPLNU33XIsM9QpchuMh4la5BYXuu5ZGQzmGi6JnqG/
	T5PmWnPN6JNa1jtKNqVNLroDdMvC+zzTXTvP6I8ysUeiRfjaAKIATVSsUr1QvMGp1D06+J+wDpY
	F/xV43gMSxMnJp3vPe6Veg/HHH/YgvI795BuVHphCvkSpeTgC8S/qGhd2YX4FEHsNCzfzpoCy49
	XA=
X-Received: by 2002:a05:6102:15ac:b0:631:3b92:9d9f with SMTP id ada2fe7eead31-67c80d68607mr1630834137.23.1779457404418;
        Fri, 22 May 2026 06:43:24 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fc9a0fd00sm1419599137.0.2026.05.22.06.43.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:43:22 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5752b27958fso2577873e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 06:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4l+hG6pb3vFHTUmYVA1H28MB14saW1m/aWqJQbRzEGBR9txbYgQ6z1llZJnYNQAVsJFweACSsaQs=@vger.kernel.org
X-Received: by 2002:a05:6122:ca1:b0:575:3b34:28b6 with SMTP id
 71dfb90a1353d-586624cee61mr1849670e0c.11.1779457402270; Fri, 22 May 2026
 06:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:43:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEbmX0QqVQE7YhnCO325=2djd5S=ynr8DZnspKKK7WoQ@mail.gmail.com>
X-Gm-Features: AVHnY4KCEtGxHGei_0qihwJrEjH83nV_Z2btTPs2i2CQslPWM7eGYi7MBkb4Nkc
Message-ID: <CAMuHMdVEbmX0QqVQE7YhnCO325=2djd5S=ynr8DZnspKKK7WoQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r9a07g0{43,44,54}: remove
 TCIU8 interrupt from MTU3
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The TCIU8 interrupt used to be documented in earlier revisions of the
> user manuals, but has since been removed. The corresponding entry is now
> marked as reserved in the interrupt mapping tables of all supported
> SoCs.
>
>  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
>    Rev.1.40 User Manual
>  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
>    Rev.1.30 User Manual
>  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
>    and RZ/G2LC Rev.1.50 User Manual
>  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
>    Rev.1.50 User Manual
>
> Remove the TCIU8 interrupt. This does not cause any breakage as the
> driver does not make use of the interrupts.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V2:
>  * reword to mention that TCIU8 used to exist

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
