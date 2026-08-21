Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87843C7C2
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307434; cv=none; b=N7k8IDN5289UmXxygmkb80yX4P8+ZzlWjLUpjHuo1WV48vr8NXQvLlPUozVDu54fuRYpoykYeHE6XFMZkSx8IcVxh3LJa60QTAd0HCp+GL8uTFxzVwLwmn5xCL3YjtorbOYJz6Oc71tqP5nhGN4qNmNyxmPsvbVHTb3PNwTJ4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307434; c=relaxed/simple;
	bh=TajKrkP7iAilCm/Wf9qOw7yL7OS5AMPI8Bf5cDTLAK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=V281gUD4ll7m5XmUdFPupn66yL1qbDZBbCbXXJh/fwl7EcbvvZR8Y/Uni+kLXnvL08kPI1KzMLPa+EyMluO7wYV/z18tsL6ZOSS76d9W2y+HsS2VYy0Aag02MZIxI2YaBuOq2zhXZwOMVLmgVC0rhRXKduHMdIaECw+i99Yz8Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97c4fa7ba1bso431948241.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 03:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307418; x=1787912218;
        h=content-type:cc:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ9qFWwtyy0CyLFBazZArycje1mFKlJigB1GC39CAP0=;
        b=ggJ7PuLC/mwSS5lnZNt/6vmXnzgdoLW+vvxH+EKkn64Vp1fcRIEpknOulF/B5dYw9T
         b8TZZvaW4r82QkoEyLKoT2iQDQXhsvybX1VCvh9BgaXEW2mg4AB69nIfqQ34/dfzspWv
         8n+ExcVkukjRfgrqUyKYHS7m7KdUIvTWdRLVHkF5FsrStjIfrNgOQVmN7bnCfdq6g7l0
         oDWtTSD3MEspOgg1QyCxa7ZxOH2Ekc5N0MSYF1VQT0kmVrH1PV0EOTLYjeoDT6CuF1eG
         1f7QqWDyEoKWFkETAEe+LbixAc1DGuXOhOwHKQzUQmn+SbwxNefiGbEQKVsPlsSJJOm5
         A7Dw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu8bWR1eV/gV26pyB4FfoAm+zisepMsw5PRzc7iw95amPMnS3QKTLFFid0RM86d0TYZrwcmDqCcm8=@vger.kernel.org
X-Gm-Message-State: AFuF++nlQtQn7/bIXd6b5mvvZDzziG0jD8tpQXz6DoqpS0mSqf6ENDdp
	fSyjtVmqyaIxeaRhnXkPV8KRO/CDBlJUlIxYgB6m59nu7bvTuYowKsTShr2UEYMK
X-Gm-Gg: AR+sD120LLQUPIQMmJc7GjRRsTxnZpLMzfZ61UI1Lgo80hfGz1sDNoIiS6D9dhgxbBM
	42fJT7LK/BM8f/BCrZ9/eASur60baP6aB5KbtguWv1QwOD2XY3CEVk3lt0ylnOYUG7XS4i0WIuq
	kGQs/kDYRQUyuBnyMykboM4d3NKG4oyvZ2EbxWvjVkFzG94IOERz474poxuTjeXxqAiXLcGIl6r
	vuHhCzfmXimgYs/+GOCZUqPCkCFoDiV6yDVsF1CHLvAkqk18bZpKA2ZqOfbfxII2xAOpIg8uWOJ
	VN+nOHQ9zMMqz9fZLYepAjMfgfEb+0d4A6I8Ya94p+igArW/lBl0MbvYHy/7/BszOVOtEgGeWhr
	bZtIfIslPYNn3X3nibQU1ze5/AxKdYIEWbd4TTwCD9Ovze2K0yI40o15MsANBqAEFyKk9oQWr/o
	baHU2FHIyZrHT0Da7fG2tNVQpfRgeAaCTR6hC2effC9CMyoIcG4b/cKdd1qUxa+I/9xz8gqA5b2
	3bSdjjUVawWzcnl5PSFZusKYQ==
X-Received: by 2002:a05:6102:5cc5:b0:76a:fc18:29c8 with SMTP id ada2fe7eead31-77a63a3d22emr2197148137.8.1787307418525;
        Fri, 21 Aug 2026 03:16:58 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e76040fsm8354731241.3.2026.08.21.03.16.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:16:57 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74ab99038afso600460137.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 03:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpUgl+cwUiiAXf6Hw2/r/spzb906tQeyF3r1Tm8nsEmxLXCHCH8Jq6PI6yHLyYSC9oyCGiQmEtUhRY=@vger.kernel.org
X-Received: by 2002:a05:6102:512b:b0:778:5bbb:b2d2 with SMTP id
 ada2fe7eead31-77a64358362mt4198077137.11.1787307416387; Fri, 21 Aug 2026
 03:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787165329.git.geert+renesas@glider.be>
In-Reply-To: <cover.1787165329.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Aug 2026 12:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaxV9K8=yQ3KU-V2dV-eFqFqMR9WDyt2RVKADLS51Dcg@mail.gmail.com>
X-Gm-Features: AcwNN1XMP476J77X05DStUZ6YHTKoquM1cTbXZSuVIS6ygsja8ReRo486qzyWdY
Message-ID: <CAMuHMdXaxV9K8=yQ3KU-V2dV-eFqFqMR9WDyt2RVKADLS51Dcg@mail.gmail.com>
Subject: Re: [PATCH treewide 0/5] clk: Make sure clk_init_data is fully
 initialized (part 1)
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Nuno Sa <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Sunny Luo <sunny.luo@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 21:05, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The clk_init_data structure contains three mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  When commit
> fc0c209c147f35ed ("clk: Allow parents to be specified without string
> names") added the last two methods, this was done in a
> backwards-compatible way, using a priority-based scheme:
>   - .name, .ops, .num_parents, and .flags must always be initialized,
>   - if .num_parents is non-zero, .parent_names must be initialized,
>       - if .parent_names is NULL, .parent_data must be initialized,
>           - if .parent_data is NULL, .parent_hws must be initialized
>             and valid.
>
> However, not initializing all members may cause subtle issues, which are
> only exposed when CONFIG_INIT_STACK_ALL_PATTERN or
> CONFIG_INIT_STACK_NONE is enabled.
>
> Hence this series makes sure all members are fully initialized, to fix
> such bugs, and to avoid future breakage when converting drivers to a
> different method for specifying the parents.
>
> This (small) series is part 1, and fixes all cases that I identified to
> be real bugs:
>   - The first patch fixes a crash I saw on BeagleBone Black,
>   - The other patches are only compile-tested.
> All patches in this series can be applied independently.
>
> Part 2 will be much larger (touching 185 files), and will fix the
> remaining cases that are currently harmless.

FTR, I split part two in 13 subparts, per subsystem:
  - "[PATCH 0/2] ARM/soc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239869.git.geert+renesas@glider.be>
  - "[PATCH 0/3] ASoC: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239902.git.geert+renesas@glider.be>
  - "[PATCH 00/45] clk: Make sure clk_init_data is fully initialized (part two)"
    https://lore.kernel.org/cover.1787239813.git.geert+renesas@glider.be>
  - "[PATCH 0/2] drm: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239944.git.geert+renesas@glider.be>
  - "[PATCH] i2c: bcm2835: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
  - "[PATCH 0/2] iio: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240005.git.geert+renesas@glider.be>
  - "[PATCH 0/3] media: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240035.git.geert+renesas@glider.be>
  - "[PATCH] MIPS: Alchemy: clock: Make sure clk_init_data is fully"
    https://lore.kernel.org/3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
  - "[PATCH 0/2] mmc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240090.git.geert+renesas@glider.be>
  - "[PATCH net-next 0/3] net: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240118.git.geert+renesas@glider.be>
  - "[PATCH] peci: controller: aspeed: Make sure clk_init_data is fully"
    https://lore.kernel.org/48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
  - "[PATCH 0/2] phy: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240165.git.geert+renesas@glider.be>
  - "[PATCH 0/5] rtc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787241693.git.geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
