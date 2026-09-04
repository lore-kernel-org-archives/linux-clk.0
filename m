Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF0451071
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534992; cv=none; b=brzOv5t2yfxYy083+pZRyDFdToqUm5CemnoU2GBUwQrW+xmWeMjILrXGmMx+CGK0QBYVmGll69PZA8RIwMPzuBGa8uV3+D49zlfFJrhoacrrE8/wPisSUF47GFs3+EWqE99w1vFRVOtX2ClFPDG8mhg8nNcmYKx1Fnkbjkaf9GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534992; c=relaxed/simple;
	bh=3zmx8Z2M3ZeRzOKqpOgR2P10M5x7/5/EKeh+dHIiZJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMBC14cJCeu3GAKYljemqWaXrSgyNJzmaCXlrweU5kPnxHLMk2Mk8J6qhZOToHu1jvaoj6hCOXgz+Bi1/ulsqaGxqvYbYdQ7kPl4XaM0BWCvJbrornlSmegx9Jw0tZR8e4L/+IjxUHnqL6SiQzAtlusxewGQ6qiCmXxpIZnwd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c66eefc868so1055196e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534989; x=1789139789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtnOZM9WfbSwC1inxRe0geJOr1JfkMHDy+62es74nYc=;
        b=S/SOXPBoAWyHZClpfzZlj4JJJQS6wGbRRGcqryVPN2DAIZQtHkX77s3gMLgHCEFkja
         1QDcODZ9esg0eFezjiYuUfM+pLGX70iMallqKuxscNY8uOtDZ6DPeGgZ+e6rnZAqvhVh
         8qndrw1HZ4ewva2pLomrBE5vv2ysZUwMiISdQfIeRIoXg7SzaLRBv5SGsEr3yVlpRa5I
         lcGgbUnfJGWOq+lVCHSJIntuv/98pBktCuPGFcBLMPDrOSk0XeDFqmAuJ6OydhATdT75
         NADguKRy1yMsD0ex1zWijeej+9iUCQ2YIoEv9pmmBEFL9y6sgLYeMi1wiXAOxG1wly9X
         pd1g==
X-Forwarded-Encrypted: i=1; AKwUvBz3uvBMHwsuVh1gHM9kKzB1eJbP0xwbzENifq4thGt1h9L8dYmbNr19oR7JrTHxKAEqc5M04oTYpZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kocmT0aRLiSCWbDuKopjC+lrOqVBx+H1+d/Eikyk6jg8dz5/22
	q4DIEZNlQ1TWWqaP0yAZ6a+kTewzSZYZ5Og8prRIEkCojNEcN5ES47qZ5m0+BLe2
X-Gm-Gg: AYBFou1r0fZXysbXaqCxgt1IzEsGX0F+hRNcsen35u9/hSMyT/caxvQ9xxXU2jBQttJ
	dUkr0gbjBPg3H4vhoOx2da2s+0a4ub0DeuLEqcbd1XLsNT6aevfUVnreM3kRbOuNd+z7vZJiqs+
	maPNDW3tWdfAfLfPl4oo9qBQQjumy/hf48qH/ZbltbuDaTrI0WAgQH+fFplKWY4M1YnGLCnk3Rb
	O/+1ZaMn9SMrcOla2xKHrCP/7p9wQM1cmMN/pY4KBp2W5NojABOlzwCnsezdK0oI1srC89eg1fJ
	irFj71YJVWRBbfnCIhn477RqNK7e4QVqMOrun+S9VDMOt8VFWdNbxgCOTy+nGemh4ZO/XR872yy
	0gyBcpkzQqFoqK2Rp1XxCclv2OpHySoqQcuCRf9cDx2CqvUKOVrs8BJV/epjmNxRZch0oO08txE
	itxT8CuXcXEqBP/XnHRjMZwOPsbYxuYg4dT3/dbSc2SP6ReKHTBwkvzR3OfQdCpNB5D8Fk4sjG/
	uCY5A27jlIspWYHzaZb7XveCkIlAw==
X-Received: by 2002:a05:6122:da0:b0:5bd:a5e1:c7c7 with SMTP id 71dfb90a1353d-5c7ed485cdemr2966496e0c.1.1788534989445;
        Fri, 04 Sep 2026 08:16:29 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm2296404e0c.10.2026.09.04.08.16.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:16:29 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so1027251e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:16:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAeZXt79EV5Ofq8CHIaTvP6ovzKgmg/o0TwF1UlLvPlrWymFG3e7fQHIj3zJzKc9SH71oWMmf/6s8=@vger.kernel.org
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id
 71dfb90a1353d-5c7ed846723mr3533958e0c.8.1788534988918; Fri, 04 Sep 2026
 08:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-8-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-8-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:16:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6GACqU4VTEk0hUO2A74RDmO3twMhEvkFAp2xiP=PN8g@mail.gmail.com>
X-Gm-Features: AcwNN1XsJHROGLoqiw2JCifUELiKV7YahAKrRzR2A5vM8Z-pkJl7ddzQiPC7x18
Message-ID: <CAMuHMdX6GACqU4VTEk0hUO2A74RDmO3twMhEvkFAp2xiP=PN8g@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: renesas: Add support for RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC,
> including basic core clocks, and SCIF2 (serial console) and INTC-AP
> (GIC) module clocks. The RZ/G2M v3.0 CPG is similar to the RZ/G2M v1.3,
> however it lacks some modules such as the FCPCI.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
