Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE23016F5
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163799; cv=none; b=WZ1hNnmPzkS69D5g+F2cXwUPCbab8aLF9yHgmYofA+TaXDrVi3n5/NXGUVUYe4DCHx7kV4qhK1EHee1FnEp9dzGuCzuOZcWvwWl/l01gk2ymasH86IY9fGu1FWD4GtWkuSr8c0cWMm7dMvtMePz620wS2Yt3ZiE/jdq1/rTYY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163799; c=relaxed/simple;
	bh=toH4Nu8X0VoWmbcPFRUFtTal982WrI4JYNV+CT82Ubg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTujnNSJltZvnoswCgLjUTnuG0ZH+OOzp3YUm1YOavP4Z0/xHIwLHw89J0VK4HYyq0/0IHXrpwZfXeooCOak5ORTfzbPA1xI0jPL1TlxBytRR7ISiuOnMmJb+586pyAYqcvyKoIR1l+U2b5FXH+16hFPpsBooOO/hDqN/XpEka4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e4d9197so511831e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 04:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163794; x=1790768594;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AQBDufdUkXkchzPiebMikSu5M3FlCOhF16/kg+goO2I=;
        b=UhgNuz+iZceWwmn1/CB5ewBrmqISWO+sk0tjktYUtW0uoTq9YRsSUuOLneqEJqtJj+
         Caf+B4YTdlmZYIOLRNGBQ2rIiOnORHR7g+Rwu2KhZWcxfq2MbhYb+hjgWoXeIz8EOiz3
         vqofJKZTIhjXEERLmiu3R/ccr1l8XSQqhPAlkZnxT3ZTjUj75g+gtM9QyyN8/wrVOioS
         RyFn5eBCuaK/9NMwmHC1SYmLAOYgdyBpRFQpOJyOj9Hw+6J9Q7ScKN4vy0RwbDaOmX7Y
         kn4NncO7wTFsyiUHd76zJFpd8YUo27WHpByFQ2VcgMlNdxG4vPE2wsLYiPetGT9prbWH
         v52g==
X-Forwarded-Encrypted: i=1; AKwUvBxyALG2Wi3PFUqCwqAiLiSdprPoXHgh0VIH61nCLu6NWrFqfmUvh3yj7ur5ddmam3aPy8XNvzcMMTE=@vger.kernel.org
X-Gm-Message-State: AFuF++myen3UnG6aCZcmnS/YKIeQGPJhBJ7a2zYUmZtPz00O7fFilnxn
	rmVUWn4AOAWwOaLpUZy5dNdut8jzG6WjC+UawBCHrCdzAa0xJtn9zGfxNpqe4Pt7e24=
X-Gm-Gg: AYBFou0al2EVCLRwh3dTe0HZNhEiSUzZ+oVb+hGiC9k3JZoHGBonA5QCU4TvrA7KIQK
	Ko/YSqxUqA0j3/YZIpigT00AKRaBrZKmyPkD9alBNK38o+r2BBR91MDJQ4CeNEOe5bE7+D3SsJ0
	Qs9jPS8mAynMLpywpu3xxgiNGBnqa/Xlteh2iiChNRNGVyDvDPUxvBZSGjQJTXlXriXqYEYG6wX
	jcFv3NnaTnKGE8udYDVfOOm0DD8N3vOrqDouTatHAxzSv4+8qzUAdQvgC1tzeFnhamIaZqyDnEm
	vf7yq0o2sVW+Pt3BF0pY37a1Y1KK87h6us7nXS51n6+ynXJ4xUCFa3uRhdjzOSCsI2Hu1Repc0o
	P0uLuHHF/jRivDeVWZTLRJUOFVyyGD+V4NIJVEwRK4sKM2V1UWtsirKY60xahalKcQjcT20jo7h
	2o1J40+iWVVvY4trt3VQWDG/e62tMOagxYtlhWnaTh9CtzJW8aueOyhLnybaJetP4uDwCd+bLcc
	l+LqXX8bEO5X108jazV2nyTa0r1FoFwsspI1A==
X-Received: by 2002:a05:6102:8092:b0:7a5:2792:32d0 with SMTP id ada2fe7eead31-7ac1bd3d08amr2036614137.15.1790163794537;
        Wed, 23 Sep 2026 04:43:14 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf61931c3sm3123075137.11.2026.09.23.04.43.14
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:43:14 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so427532241.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 04:43:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxUWtpjmUStkPROG8s8MWD6P/LhATwGpMfSTkH0Uy/dDgc1+NoOXlOwl1NeO1QoA2FF/L/5b0Qr3xA=@vger.kernel.org
X-Received: by 2002:a05:6102:5813:b0:7a8:2a34:433a with SMTP id
 ada2fe7eead31-7ac1b824983mr2135063137.9.1790163794193; Wed, 23 Sep 2026
 04:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:43:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9V4jd6j-Lcma5Nr-sgqJjBbbdwcnO3s+YFmvUz5qQLg@mail.gmail.com>
X-Gm-Features: AclHuK9nw9pQ2eMsnoclR1kgUt8L_8mX7NzQtyl53d74B8AUYdOVbDcik9Ofq-4
Message-ID: <CAMuHMdW9V4jd6j-Lcma5Nr-sgqJjBbbdwcnO3s+YFmvUz5qQLg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
> Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
> [RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Renamed file to include vendor prefix
> - Added vendor prefix to include macros
> - Added Reviewed-by tag

Thanks, will queue in a branch shared by driver and DT source code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
