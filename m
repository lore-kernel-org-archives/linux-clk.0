Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0E21CFEF
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678124; cv=none; b=WG77j1GbEHgSm6Mhafjr/YxF0eWObkwHNumzHhV4nc/IPWdBwfPgiuTH7wpiHlqTYtf2jbAU5ccvM7EUBEUDTFKnTgnbJnTlXQ3tv5ZwDTZyGnVSse3qZieifWrIdE+rNcESfW53R1mN6khhYyYSovHG7yPc04pQjzIUT4DbesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678124; c=relaxed/simple;
	bh=oV7lWg4lz210rteMJfOa33sA9nixlf2kec/RbjFlF7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INhugRpUeDqKe1M4o/4p4SYBMYVtRRIUjOpYu08ehQC4fcFDgTUqPwKPkraTgIxIKTlYk82elhe+HtUgMeKow4vV5LMGrK3tk4wxFnTwk5lLJv1N7WDoqZd31FvVbUYOsiz2q9KH6HyJb/R4mAcOjD7gC4a/SXBp2ClDaDd+HdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ff05af29b4so2666416137.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678122; x=1779282922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8cNW33wiaXVwXT9Hgyi/JcE/ejaGgsPgY1Fa4o6ZiI=;
        b=HMPT0OsNuGDWAScd8WFGRFaEiGwakRovr7RNIGcPUiO8f51xij5sN9UuLjeT0NkqT6
         35R2ghiErSgqsolhXzKuL8Ixfr//mPh1WG/7havtsN9DSP8s6wk4go9xtRGR+GVPcAPi
         sGvwZ5qcqFePWfDo5Bs+YMNY1UyBOeo1wbrVRhR9TTmj9ocA4NUqsGzdGTa3quDSn7fU
         eufqUOAXjfKSF3spTWN1S1D0oq9KXL62oWS3uiGmL76aPJZf9DlCFTq5zA87uPR68KnM
         8SSULhfKFlvW78KyaVLXpcQsdQ3Dka4ty0ovUflxOwdFak/52K8v0B4y6UsySbEdTGpD
         g5hA==
X-Forwarded-Encrypted: i=1; AFNElJ9gzvu2w5zMhrjaXguNTxcxLksX3xgynoDdqd9InRqNNNQN3bB8OJL8BsUPZJS6y2vPOTivr6nyLb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAoSfw8GgizsZNj0qty5b60I9N64Kq223Aju3A0zTzwQAw3bM
	6mGdwxC7PZeg83tN7jfu4GxoIU/EyRVXEMloZDZeFjmR4y2dfSiqD4wj3NFjKRuu
X-Gm-Gg: Acq92OGkZBNtnIKbx6jZyPtS1WIFbx2RR7fz3Fm4k1CiodEA/5Cn1T/P3PsBA3hKhfF
	Ml2MVY23Xi2+Yvo9UWhOQ2SM5ADbTJC1oGsFcpXoOal16NTQAO7x1ebsvETYfr6yqe8LUMYfHRF
	VIlI9tRYpZRR5DAdovEUQN1YyKIOBjzjvksyDYS///dtiL6aU4icihwZlEHlfi0CkFP6kxvlUIQ
	xOgowBtNoBW9feTbFjvs80JW8fyZtscz3n7nrfMmbHlQ0dUmR1AI+87nGxXzsO1yBTana2QfuUf
	9VrJkeyOJc3ED8nxdKdKdnm/ebzkQJmxuH++QrW3JbqXL5oMbGA6cuYh3CcWkuB7hSGAU5Uj1gd
	oEnsIwsGA5xuN9EcFpPafk7/lTWtRLOavvMFpvO8v/TfCcoNNMNAJ/Ei+NegyAhw8Z6ndZSBFyY
	E2J86iydAYG1IA6BLWy+wV/1+6iw0lotCxnHhkSPcW1yrcfj6fG7PXf14w0g5E5Cw+8oNIltBP7
	0g=
X-Received: by 2002:a05:6102:4b86:b0:631:81d6:e15b with SMTP id ada2fe7eead31-63774763b79mr1252212137.29.1778678121808;
        Wed, 13 May 2026 06:15:21 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6313ffe8e17sm9599116137.3.2026.05.13.06.15.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:15:21 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57524e53749so2070066e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:15:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/21M8ab58vn8+xxtRjnfv+zVnUNbu+nwSdLeBvruHmReI3ik5jVguChqVGSW/by+LLcbKyUxE/5jQ=@vger.kernel.org
X-Received: by 2002:a05:6122:d25:b0:56c:ce0b:fecd with SMTP id
 71dfb90a1353d-575e70a7075mr1239716e0c.12.1778678120886; Wed, 13 May 2026
 06:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:15:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
X-Gm-Features: AVHnY4JTrqWXHc77xf-iSrs-bkBREqw0nQKCK-qidhrABbBSLqD0EGxY-SoFw7w
Message-ID: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

/sys/kernel/debug/clk/clk_summary looks a bit off to me:

    zt                         0       0        0        208000000
    ztr                        0       0        0        277333334

> --- a/drivers/clk/renesas/clk-r8a73a4.c
> +++ b/drivers/clk/renesas/clk-r8a73a4.c
> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
>         { "m1", CPG_FRQCRA,  4 },
>         { "m2", CPG_FRQCRA,  0 },
>         { "zx", CPG_FRQCRB, 12 },
> +       { "ztr", CPG_FRQCRB, 16 },

20?

> +       { "zt", CPG_FRQCRB, 12 },

16? (12 is zx, cfr. above).

I.e. the same shifts as on R-Mobile A1.

>         { "zs", CPG_FRQCRB,  8 },
>         { "hp", CPG_FRQCRB,  4 },
>         { NULL, 0, 0 },

After fixing the shifts, I get:

    zt                         0       0        0        277333334
    ztr                        0       0        0        277333334

which looks much better. If you agree, I can fix this while applying.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
