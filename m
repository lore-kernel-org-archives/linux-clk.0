Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883847ACE7
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068995; cv=none; b=U6X/yLOj92U6eBINvku6s+7uMge1FjyyYbO9Thkdu1XaPx+3yzLaF2CSSGJUD5X4nMxWKNo1sGdw7XEv7wWtf80+tRPZJ9Tt68WbZNAAlPk7U17XuXJfeIdFj4QOruoSyvZ7JlV1vPDdOFmuiCr7oyYJZumQNr1RhXG0V+g8r5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068995; c=relaxed/simple;
	bh=mvNQB/sYtoFJ7JcI8nDsv1lOU3y1hBybUljYLNNJ+3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8D/f1UXA/xecxjHpELzgd/GBJJT7co2GEXXjFAx/zZKRaNNlRCWVrMIpe9HnYXFRH0YCsfHSPf/6EsoZ5pAevI3mpm7XztzdVA966Q6Rn8JbTCFpA+/iKlhlg9muAIxrWA9RlHLf3SKL4Uhk6f2rD8fHg+Sev1gLAUM6NWC2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so838618e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 09:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068990; x=1787673790;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iw/lbY9kytY8ULR0QLLuK42AbhUxD9iRoxGBf4pN4b0=;
        b=qVvolzzVPcdlH1hRS0FG6qo9uLfjxU0EVXjAvn17uUu37Gh1z5bNDM1PsuHQzbjmdj
         b9204qn0r9jds00cy3dWe2Ai9zyA/Ggyu+LOixA0ptxl1gGydDWaHJWZwRCFp7Ujqdbn
         /Fo1g1ET2gQzE35mZAPYwSfNONSpF5eNAdqlv6w14fpCayMe2wH1utc8g6Q5fxr0iiiI
         hZG4NXJddy1XhSIzk9wh6V5VHxGS7ihLI20ZYceAvAWSJrXYjL/Gc3DbD8EvI9Aotc6e
         q4x2SDrGwG1N/hu0aqAhzDDpSOjLLOpG40a/AmXkzaz3tVFeFyJCdWKHhJt4vcg0vWdK
         RZIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrquOhj0Bi2HAx8rQDARS4pqX6R4cwyjGqC1Qgo8Q9/azoLoMaMKAvrS/FTf7mE2QGAXDzg7ZKhHI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+91W8Tl7xbVw6s67Oo3kVhn+SmBS/yJZvPEAUbuLeFKddUUS
	PK6hFHlx168CVWVRWZcJkvhEqy+tG1R3SLgPSiJ+I6Eb6kLGzMNmuuyQfy9frrpJhzA=
X-Gm-Gg: AR+sD11gOfSWWYGLZDUs53qc4m/YrMXjbgaHOBGR1DIIZdkb9iqwghg5Ikwmn2gMbbD
	/YGOF8xQwVGbTiU5LBG/cVmz9clASe7UHnGc1zTG0lSs3L9t6Kxmy/VYPNYr8J3a6O7bqENX9ff
	BqH8PG/pNHXhAuUAc3gEIrpUxKT8N3MmcU8OoJAY6ltOI5aY+VXaaSb967MlvrfxUxz3npCBcRV
	I+1a97hXdN8WHb1Kqh2LOAfppR+JDWPGC/HS00WnobmGRSOmjyrvW3P0IkfUF2f645Av3NZA7rp
	OI8af+I3nf8wmWaYnZVeUSOkPE0/z2/IF1HWgtZOxqkF8x3sBDtbtY4GkdPCSi6eCthHH+12cD7
	JiFjf3dWzhL8WbNanOkAIEV+ZpK36RbnwJ9JboBNxY9Ud7jIuEeKxbJ8R5tXvbORp1aoBIX1t/e
	CUwQfRjLPl7SPUA2nlSKtOCGm4LpRM1SflnUwKesVPFlyiZ1/y52qhpcJB6GR5uT+0i7Hu3tp6X
	Ir802AT6mIKl+19/oiCW2RzRQ==
X-Received: by 2002:a05:6102:5121:b0:73e:e4ab:1c84 with SMTP id ada2fe7eead31-774d4590e9bmr1415314137.5.1787068989624;
        Tue, 18 Aug 2026 09:03:09 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c5089913sm4029541137.8.2026.08.18.09.03.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 09:03:08 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7737a1f65c0so991370137.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 09:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro8ZkA3oE9Vs6ay5weTrPYSlEda3ie3NJXftD0oHCbEUiJQwM3MoU67o8W2b7OGLNeFppKF4hXOZb0=@vger.kernel.org
X-Received: by 2002:a67:f4d7:0:b0:774:ce64:242f with SMTP id
 ada2fe7eead31-774ce6426a1mr1254990137.20.1787068988285; Tue, 18 Aug 2026
 09:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-mathieu-wdt-clock-theo-v2-0-c048a6394436@bootlin.com> <20260727-mathieu-wdt-clock-theo-v2-1-c048a6394436@bootlin.com>
In-Reply-To: <20260727-mathieu-wdt-clock-theo-v2-1-c048a6394436@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Aug 2026 18:02:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com>
X-Gm-Features: AcwNN1UX3m2v0gqW9gYIz88rQmzaoFEv7wr1R4REphzgiicb1AXNWUurKBdKrW0
Message-ID: <CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: ti: mux: resolve parent clocks by DT index,
 not by name
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Tero Kristo <kristo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Tony Lindgren <tony@atomide.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mathieu,

On Mon, 27 Jul 2026 at 09:44, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
> Resolve parent clocks by their index into the device tree "clocks"
> property rather than matching names as strings. Name-based matching is
> fragile because a clock's "clock-output-names" value in its provider
> node can differ from the name used to reference it in a consumer node,
> and because names must be globally unique across all clock providers.
>
> On AM335x, this caused broken clock trees where some clocks failed to
> enable because their parents could not be found.
>
> Replace of_clk_parent_fill() with a clk_parent_data array that sets
> .index to the array position.
>
> Fixes: ec7aa25fa483 ("ARM: dts: Use clock-output-names for am3")
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Thanks for your patch, which is now commit 667f420c09f1417c ("clk: ti:
mux: resolve parent clocks by DT index, not by name") in clk/clk-next.

This breaks booting BeagleBone Black for me: I don't get any output
on the serial console, even with "earlycon keep_bootcon".  When the
watchdog kicks in (or on kernel panic?), the system reboots.

Reverting this commit fixes the issue.
After reverting, I added debug code to print all parents, and compared
them to the DTB, but didn't see any discrepancies.

Your similar change to drivers/clk/ti/composite.c does not cause any
issues for me.

Do you have a clue?
Thanks!

> --- a/drivers/clk/ti/mux.c
> +++ b/drivers/clk/ti/mux.c
> @@ -119,7 +119,7 @@ const struct clk_ops ti_clk_mux_ops = {
>  };
>
>  static struct clk *_register_mux(struct device_node *node, const char *name,
> -                                const char * const *parent_names,
> +                                const struct clk_parent_data *parent_data,
>                                  u8 num_parents, unsigned long flags,
>                                  struct clk_omap_reg *reg, u8 shift, u32 mask,
>                                  s8 latch, u8 clk_mux_flags, u32 *table)
> @@ -136,7 +136,7 @@ static struct clk *_register_mux(struct device_node *node, const char *name,
>         init.name = name;
>         init.ops = &ti_clk_mux_ops;
>         init.flags = flags;
> -       init.parent_names = parent_names;
> +       init.parent_data = parent_data;
>         init.num_parents = num_parents;
>
>         /* struct clk_mux assignments */
> @@ -167,24 +167,26 @@ static void of_mux_clk_setup(struct device_node *node)
>         struct clk *clk;
>         struct clk_omap_reg reg;
>         unsigned int num_parents;
> -       const char **parent_names;
> +       struct clk_parent_data *parent_data;
>         const char *name;
>         u8 clk_mux_flags = 0;
>         u32 mask = 0;
>         u32 shift = 0;
>         s32 latch = -EINVAL;
>         u32 flags = CLK_SET_RATE_NO_REPARENT;
> +       int i;
>
>         num_parents = of_clk_get_parent_count(node);
>         if (num_parents < 2) {
>                 pr_err("mux-clock %pOFn must have parents\n", node);
>                 return;
>         }
> -       parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
> -       if (!parent_names)
> -               goto cleanup;
> +       parent_data = kcalloc(num_parents, sizeof(*parent_data), GFP_KERNEL);
> +       if (!parent_data)
> +               return;
>
> -       of_clk_parent_fill(node, parent_names, num_parents);
> +       for (i = 0; i < num_parents; i++)
> +               parent_data[i].index = i;
>
>         if (ti_clk_get_reg_addr(node, 0, &reg))
>                 goto cleanup;
> @@ -207,7 +209,7 @@ static void of_mux_clk_setup(struct device_node *node)
>         mask = (1 << fls(mask)) - 1;
>
>         name = ti_dt_clk_name(node);
> -       clk = _register_mux(node, name, parent_names, num_parents,
> +       clk = _register_mux(node, name, parent_data, num_parents,
>                             flags, &reg, shift, mask, latch, clk_mux_flags,
>                             NULL);
>
> @@ -215,7 +217,7 @@ static void of_mux_clk_setup(struct device_node *node)
>                 of_clk_add_provider(node, of_clk_src_simple_get, clk);
>
>  cleanup:
> -       kfree(parent_names);
> +       kfree(parent_data);
>  }
>  CLK_OF_DECLARE(mux_clk, "ti,mux-clock", of_mux_clk_setup);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
