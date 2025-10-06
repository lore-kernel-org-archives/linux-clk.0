Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6201E268C55
	for <linux-clk@vger.kernel.org>; Mon,  6 Oct 2025 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759445; cv=none; b=oH15zvfOCyeIP2720hp6K7QC0X/VXN1daBLLOwtV1ay1xrUIveCabIMiPFx4Y+uzbLccSZ1+y8InsyJnG0DKbZIo8N76Xyf8OmVREGag7x3ifae/cTUwy0AWzGz0HQ1gyeEsZjdFzByXTu1pdMRw9cPvWoKD4BzBHSUxmUvV4AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759445; c=relaxed/simple;
	bh=e9JdwUTdbDATOQqBaX7VdBTDAiGaPUCUcxVUN/89Q1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6mj0PNRIWU+iw/kH7nwrdEp7iu+mimWo1ZjKgyem3eW1Ln8UZn5qdd56AvUgugfOe3HPasxBgEMeggyCma/MIdLrBS39ae9z4Igj2Bx9/Eh+NIaGtf5HfgjM3+rqZ4MiaXpug5vYq4iJzvAd7xB/xwPvdWPqjyFxB06pnPURAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7a7d79839b2so3992154a34.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 07:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759759442; x=1760364242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/MOCb5QFzOSGrPS8JyGdOvWdo9CLp8Tmxewx3JYuss=;
        b=JaPMJmgCkDe5I/mAPuoMktCx8Pn7p4FZZuvDoBSwTdvTbJtRuJvsxgM+mKDy8xUWpF
         b6EV2M9IVBEvaRbRid/iPHJ8iiF8T6fV/ScaJcv3tNy0Y9O9em7sbWnC0pkM0kpmBRBD
         +Kc7NwmlToqB9v2wxIclKIhg3Pru5mkjkEab/IMsrMjTvsXfQ0e+uz0oll80gdIu5G9/
         qD+CayMNisGwljnTd6+YDEqphV1R4gKdqGQs1xQz/uE09frkGeYiNz+781RdkyKN0J3A
         Wdp0IoSpE2F1jO1zYUMAHmc8ucxpATF9jW9bGtwORCusBGjpfR28GvG1AGw9O/C09uvg
         i2iw==
X-Gm-Message-State: AOJu0Yxk8CNU1nojIiku1twElFY/3HgZpr2uJGri4J7EUz3cq99DKfhs
	VNurzVOeeINekVPZwCJ9sabZmomv98cFq7f5YDibj3ESL1041oXiQRex7T8I96Sx
X-Gm-Gg: ASbGncvclyyKQDaq3+wAY9ZZX5F0nkeQAHH6zMtkCKJGHG4EhvwHcdEvpx6X3lTk8pS
	5OezsHbG2WVTZ/SCLvNFSqmdCWnrrtQglX5eNxrnk0OBoPERqKSq4uJf2/DlYrJDIy0d4TziuZG
	sMcv9eBCXFJ+ZidwsG39RFJdxfy5E2tZRzP855I8+Su0p010tlfIK9iYtpEE4npCH5VyllFcsqP
	An8kBKrHQWJ0ERgiCxvntwWo8H+ZDkWzxj68Xj8D94cMGzfBDaoWaRRm9cxeNdM27y8zpcfuj7r
	9jK7HR0l++D89sHclEMZYl0Dc5yKpP9YteJz8iYrRvqbKyIB1CcdRyjymdWwYde2r/BzS3MQBfU
	s/sPz0A5e/ZDAoQ+R1M7Q8Do6rN6iSh0B0pO9HmZtEyBpceKcq0tfVBigOz0zwSVPVtRneHaNlY
	N+uBT6OaEN
X-Google-Smtp-Source: AGHT+IGWyNcM5Hdrfk/ynDf0Q9aYgjU1GGu7AoT79CtXaBxOxXT40mZjfCpV6efFqFYbT+BHxRAjfw==
X-Received: by 2002:a05:6830:9c3:b0:741:a36f:7a2f with SMTP id 46e09a7af769-7bf772cafa9mr7611387a34.5.1759759440068;
        Mon, 06 Oct 2025 07:04:00 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7bf439d2aadsm3828997a34.36.2025.10.06.07.03.59
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:03:59 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-35c80c1dc3fso1525863fac.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 07:03:59 -0700 (PDT)
X-Received: by 2002:a05:6808:18a0:b0:43f:42d4:aca5 with SMTP id
 5614622812f47-43fc1887c42mr6998606b6e.37.1759759439194; Mon, 06 Oct 2025
 07:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com> <9864e81d-3b62-4513-9deb-1ce154cdc571@mailbox.org>
In-Reply-To: <9864e81d-3b62-4513-9deb-1ce154cdc571@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 16:03:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEK5MaJNWwpT_7yo0=tk+Pm+99QRD3SStkWsHHDDVJ7A@mail.gmail.com>
X-Gm-Features: AS18NWCb2ZrMUgjZ1IFcPHfLn6Yd4K2uYUz8xkX8k3wTf9cXh7KxXFz-wfQ0Y3s
Message-ID: <CAMuHMdVEK5MaJNWwpT_7yo0=tk+Pm+99QRD3SStkWsHHDDVJ7A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 6 Oct 2025 at 15:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/6/25 3:43 PM, Geert Uytterhoeven wrote:
> >> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> >> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> >> after reset has been asserted by writing a matching reset bit into register
> >> SRCR, it is mandatory to wait 1ms.
>
> [...]
>
> >> +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
> >> +        * On older SoCs, delay after SRCR has been written is 35us
> >> +        * (one cycle of the RCLK clock @ ca. 32 kHz).
> >> +        */
> >> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> >> +               udelay(1000);
> >
> > 1ms is a bit long for busy waiting, so I'd really like to avoid this.
> >
> > While the documentation does state this 1ms, I understand the
> > issue we saw in the field was fixed by
> > https://patch.msgid.link/20250922162113.113223-1-marek.vasut+renesas@mailbox.org
>
> This synchronizes the asynchronized resets, this is a separate topic
> from the 1ms delay.
>
> > so perhaps we can do without this longer delay?
>
> This aligns the driver with hardware operation charts in the V4H RM,
> which mandate the 1ms. If we want to follow the RM accurately, then we
> do need the 1ms delay, otherwise who knows what kind of fringe failures
> we could run into.

All true...

> > FTR, it looks like the reset controller documentation doesn't say
> > anything about the context from which it is safe to make reset calls?
>
> What does this mean ? Please clarify .

Are you allowed to call reset_control_reset() from atomic context,
like the ISP driver does?
For the clock subsystem, this is clearly documented: e.g. clk_enable()
can be called from atomic context, clk_prepare() cannot.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
