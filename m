Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7971C862F
	for <linux-clk@vger.kernel.org>; Thu, 18 Sep 2025 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758207956; cv=none; b=aSEHa+LU3ONY1acBGBANBBLE+1af+UoZGBz4PspEQ2t8SExrkq0cjLAqqM8n0FrmM+OsPARG329VGuKltVQMEtYuYdaPsu5QfFuYBtTqhQWASAGbYOHebNzrdIZB0ZkyZHW53u4QpOzI7W7+0dGSVWbDC9NFM4QnHmWn3Mg9y4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758207956; c=relaxed/simple;
	bh=tn9oW2weBTiuh+fe4Hz258WQPC+0fvyj5weHPIU7zcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFrphvybLvh/OsX+E8NwZLLu2ex2jo9nzw86/Q66kNOi67VL4rINUYoScVNO20WiJbX6JYyIDsPE4eTpHLBZT/rbXoXWr9FxwnPGKzWn3OyEY5ZeJz0S5GiiCpQBNTgUDHzix70ExCLbAZw3qNE528XNY8Gl5b5xum3XdvyLC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ornbj1t4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ornbj1t4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso818084f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Sep 2025 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758207953; x=1758812753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ewj8l+hIr3uNhs1w28ZaX8/owmCfl59xjD467sLeY0Q=;
        b=Ornbj1t452Rs3QROXq+pFG0qgUDwd/okxtJdOE5t9ECTgac9Dr3Q2ajU93R13k0iL2
         FznCm0Q0NtftDXyZrYkHA2bMQl28UvZDZPStr6HwTHZY/ppzAfvWa1nMhqSr/6V2r/2X
         7wXqvcyBplCPiz6mC/0UO1DTBHtjPV8H27UIalC0hyFlP2LAxavyEg+jxW62dVL/FEhk
         e0bENPhcTPj6iP6JxGmAl1NoYbXGiJMrDHzRc3osAVuMcxR38CBDW0j+596o46+zrur7
         t8UdzyBstIjZLWWEnxvgtzGBPAgccJ/MGjXQPUhpN+sk6IOga7Mvq1s0hVgEHAIlTkWs
         P0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758207953; x=1758812753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ewj8l+hIr3uNhs1w28ZaX8/owmCfl59xjD467sLeY0Q=;
        b=g4F5ZbwLYFRxuXgp9o11swEiMrEYi12uxoPtrazAuYkncSVhpqBMXz0LIHAFkXK/ij
         6wTYVKOMagJW9P3gJ6Ost0TnsvRAiDehjhgZ15xAtdxmuPzmRjGzZ9zmXiZlTL3DnTi5
         Us/JqT7YpyvfTwT59TurqC8z/ZpUi8qMVM/Bg3kjGdao0uAIfHBZTJY1EFZ+/Bsyxo+b
         69wD5YslDHbWoKkiFw6WWmLrO82ucOyjhFS3T45JHPXD+LlHynZJ9FdXt3DKKiBCSOQG
         QvaRhMehBmgg0rSarapuMqDm1sQEmzhHysufou54xjS33eGez5T4Coo0scuZ/+4qSYUT
         OLgw==
X-Forwarded-Encrypted: i=1; AJvYcCWJRgS4TIcjmyMblKRmdeckm/TvvwXYEzrfa5LgVbyi1WhAX9v+lR8uGeBSElXZBRyVqwE8XpzKDFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1373DsiDue5zT/9yuhLfGFI+WcqizTHVD36guFtCHJI+RZtyO
	DFFHMY/EiXkyvUUWaRy7E7+cLnvR0CIA0ITF70IT/V1Z3+Smqctee6Pc4JP8rq4WzQbs/gTml5d
	8T2/tp4w40zlqE5Y6tnv03V01qSmUNOI=
X-Gm-Gg: ASbGnctF/lLZyPrcDv/F2iwPhIZY2wIbM5oLxnoNa5qNbamRhv5e9gRZDs7BjqOkG2b
	Fw37jDI9SyzwCcHgAc5q77muwsCx45KBKvSWamnfNcOZTlrkD6YqPRZQo8ZlDGtAJID8Sw01f7Y
	t11I72lAQfu+aYL95Yu+nNiYjwpODBjLK2bXkenRsvCi+R+Dd4id+lhm+11U34ZVJKbxMjQTb+P
	0H+8DTHY08jSDD/pLXcs11RZ4c=
X-Google-Smtp-Source: AGHT+IFIpnAfWYBWC8/4He5hc0khqVIj9hQPJlI0L/TtRX7Oz0fi+5FvZGrToUW2nAYqq8wXZUyNg0HA+lD87ghtD6U=
X-Received: by 2002:a5d:5f42:0:b0:3ec:4fe:860 with SMTP id ffacd0b85a97d-3ecdfa2b563mr6291885f8f.46.1758207952491;
 Thu, 18 Sep 2025 08:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com> <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
In-Reply-To: <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Sep 2025 16:05:25 +0100
X-Gm-Features: AS18NWCC5xVX8IjDI7XHBdGHA0Pjuo6KvfUX2GcAPVjF4qUsRR9KD7_P8G6nqx8
Message-ID: <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Thu, Sep 18, 2025 at 2:42=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
>
> On 9/18/25 1:11 PM, Lad, Prabhakar wrote:
>
> Hello Prabhakar,
>
> >> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/rene=
sas/renesas-cpg-mssr.c
> >> index 65dfaceea71f..7b52e8235984 100644
> >> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> >> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> >> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controller_=
dev *rcdev,
> >>
> >>          /* Reset module */
> >>          writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> >> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> > Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> > to read the reset register `7` times and confirm [0] (as mentioned in
> > the HW manual). So after reading do we want to confirm the bit is
> > set/clear?
> This is interesting, I wonder if the readback is something more common
> to this reset controller.
>
> Why 7 times ? Is this documented in one of the HW manuals ? Are those
> public and can you share a link to them , with the specific chapter or
> page I should read about this 7 times read requirement ?
>
Yes this is documented in the HW manual [0] section 6.5.1 Notes on
Module Reset Control Register Operation:

1. To secure processing after release from a module reset, dummy read
the same register at least seven times except RTC
and LCDC after writing to initiate release from the module reset, and
only then proceed with the subsequent processing.
For RTC, dummy read the same register at least 300 times and for LCDC,
at least 100 times.

2. When module is reset once and released again, make sure that the
target bit of module reset control register is set to 1 by
reading the register before releasing from a module reset. Then
release from a module reset


[0] https://www.renesas.com/en/document/mah/rzt2h-and-rzn2h-groups-users-ma=
nual-hardware?r=3D25567515

Cheers,
Prabhakar
