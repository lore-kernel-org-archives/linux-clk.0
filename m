Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD34423A8E
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 13:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543831; cv=none; b=lXY/XQxaHj87GHxRuuZajc7+Fq+i2z8/l50Xwusl41oNHJI1oMAc1pIKO88sIrY+/Qc6qi6JMyG6adNcjmutN+sqQ78JBqPO2dCQanXBMnWb355/0tCpWAt7jlX9xIo4vbJzOUxVmSoFOZs9WjVC1CrLEluhist4DfzXACBfd+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543831; c=relaxed/simple;
	bh=n2OmAIMl/gywcCrUj4d8zXzLma6xKUNcSmZ27Kjdqpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhQEGWfNPZj7k/91WspMfXBj7LD+aAwosz1sVk8ME6p67l1iBJSkMM8m27Nw/IPLZmbHNRYxjM0hEEfECv6na7t2RvWmqIfzpciS+Mx+FbJmtNE5QyZuPIjCXXvAWmzeG/J2PMGFmUcroeo8yBZp87N1FRxQuNnh9Zw56o32L6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ff19e74779so3634873137.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543829; x=1773148629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muQepyaITr1dI13pFJp+536u1zM3z0pO9iYDkPNsg4s=;
        b=j4Imb8TWGidYTwOxUHswKC7e65xtK2HSOIVKxIEs+6MR0U/Xtdsq2XKVmcd8tQa3fv
         SadzhsDjaO/T/FuTGP5KMrU15cnrf8Pc/ppuizuaiKu+rMm/xU57/BbSAuLjQUaDsNFe
         MNeNNAIu6LaksLK1hZmeiBjv/g9YkyGsaH8bm0vfyoDSPFzeiwb/w1LLKA/h8bSbqF4X
         4on3o+pvFdl8QHLbDHK/DqDBxTzv38eXwM7aO0ZIozCAOy68G21ZrqIsv7UN+RrwrozD
         +Hng3cFxLY+BqFZ61Vwcdy0oCeWZVvRhegDLkxSSQPNacIkKa+J5MFKzc+3cRjr7AJTP
         FkuA==
X-Forwarded-Encrypted: i=1; AJvYcCUvburxTdmQkQ3vmw/bIX82Sni+pVHrjm/mZYKHwRbIE3xXfjacQcqq3/bd7T6InXonSnFqcsyxqBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRtUSMVXjtNeOCWzoRXZeYW+qUoDVB430ptJ/KtiOEG1adJ01d
	vxELYDGFq9mDkj7hERzWJn+gYhmVjiENIBTvh6D7d/WM1HXPkWaJYx/tAB8y5qoj
X-Gm-Gg: ATEYQzz+f2l9D+B4jrqgf+iNG3dlnFWgv5GCMR3/mZz77AFi5/CplnGmcvKWfPLlC6g
	ayrwXOEQ4A0xWU/MBa/i0bvD6BcmvSlGByUJ903FjnQv8oV1d2KtKn4eEA+IondNHpmhggfMH3s
	BwUcZgGk7e6NyeQacNR9ZwwMAU4MpdUcAOe8WnQjCWBS8Ya9VlrkDBAAPiKuCF13etAaHVph9jv
	NINJm9xIIGEKuGMjxVURdb/94a4W3SMl1RBwCk5ulEZSarVMlPQEGGtgVvcwEuSnEcNbiAksRMT
	271pi69GKT8QK6UjIYF1QYSX28TU/WRrAR3TdSvRS2YNr9uB4P7vHuaclrEn8U7C6ieQpt/HAUt
	Xd2LT7OWHojsLAgjuDkJYBb1539LZSD4nvYlHVfJTim91110jjEi6hF4Lqv6aFxnt6Rxj3xx956
	Gpp4ES8cqjby2+9ooOJuGu56jcWX/aASYql9HJiQxzhJNnDY910nufhowH9Xhs9+0nJx3ZbX0=
X-Received: by 2002:a05:6102:f07:b0:5fd:e97c:e40e with SMTP id ada2fe7eead31-5ff324e793fmr7334761137.22.1772543828678;
        Tue, 03 Mar 2026 05:17:08 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6f7fesm16455457137.13.2026.03.03.05.17.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:17:05 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5fdf3735e14so2726203137.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:17:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQzw6M5oG+Kw+EEKLGLOlaaJiyj5gHkEK2CbiWgZzs9qYe56xMQ3Dc8vNdom98W6BXVB+tq6QL3qc=@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5f5:487c:83d2 with SMTP id
 ada2fe7eead31-5ff325d53c9mr7807558137.38.1772543823941; Tue, 03 Mar 2026
 05:17:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:16:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtrAwAtqNPqwq5qKHo4SKQqFoGSE7qPnFRD4rbKkPfaA@mail.gmail.com>
X-Gm-Features: AaiRm52a94My3QCqI-CCMK4Bc8JSeFzJGy0yOXJPSReec93Wzsgcz5hw25V0nt0
Message-ID: <CAMuHMdXtrAwAtqNPqwq5qKHo4SKQqFoGSE7qPnFRD4rbKkPfaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Rework example
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> When the bindings for the Renesas RZ/V2H(P) SoC were factored
> out IP WDT0 was selected for the example, however the HW user
> manual states that only IP WDT1 can be used by Linux.
>
> This commit is part of a series that removes WDT{0,2,3} support
> from the kernel, therefore the example from the bindings has
> lost its meaning.
>
> Update the example accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
