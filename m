Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB72EC54B
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053331; cv=none; b=kkNF8jR6I1660yYq/fmvRK/ZRR+E7zp+ubWgq/tNF5JcbttXn6yQ6DccCaMQ1/04uWSw2agcAx1ueDblSeeqzagQjbeZ7tKw7KGFuzXP+qZQBhGUwerCztrrnxt0/ymENTJ//XZQ4Gcha5UR1JjBhYVvR5P18WL/t1Mktm3esLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053331; c=relaxed/simple;
	bh=RQwS0fuOoAkZ4Bs1IOOQqMEfIMm1iFcY5Luv08QraSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8+cdSRctreLLoUHL+3/BvScUL3hYP3DM3bGQrWQU6ilkFVxntuVFGlW5KqBE+y8jS3g0U+S9PfkYkc/RSA8SxlZ0ORFOxHqLESw+Nx7JG22uUCEQ1zwSLpp2vJcW490u8US/JMPdr5MMGoEM5gDLFZOEnBkTxG9dXNUtGkYCR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so4744014137.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 06:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053329; x=1761658129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foZkbBKrkpzKqOb0SdfF8T3/ui75q1xL0TwtV3s3sfo=;
        b=wGi7p+vqH/3KU85mjgnaIvYlu4Ypn2A7MhZlnKO4sVtRG7flD5A6YCInhdRelml7hi
         gM9R5bzdbCQmqMs1V4sNV/UINokWgc8E94G93vBqz4QopZhTDV76VGr5flNsjwHf5aDV
         tXkIKDFw709Wt2glNI2EnQw9jBfykR6pWAddgKAlCztURl/pkzd1vNMcE4XqE/afhM3i
         EvO7FliFXGf1yIZN9a5JucNM84Cc/8ZRTOb2CI7gfifnlmKtIj8hZuZDpwUFH2iHZ4CE
         v19xozNntskeZMN0THbhILaGz8qZK78nlHDaayGcvATcABLuonOg+7HlOwl7J0EcUFtU
         epgg==
X-Forwarded-Encrypted: i=1; AJvYcCWo554kiARMMttOFy3nWjIs9j9PrB8pfhxISF3uHeWV3Iy7YMLcUyWCbh6O1/EVx9e8zfeotvgUEy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX2QHcx87bSGLfgTYRFWlLuQyR5e3at/Qz2rcivJ2LiHjjk2Jl
	9MbpLAa6bcKwm5Ymt3Je+VmrWHiqc11rgOeeJoe3wP3AaWB0L4Sr1NDFyiC10NOX
X-Gm-Gg: ASbGncuaRzf6SRG6T3dJiXFX6T6OpN2eJRfeYlZbbBiFsEAWIHVwdsVYphy/IqSSjoY
	iJRWOtDEF1ZePOEOrKb9pWZvfAGVOmrxd4MkTARJOhgijtkwDuTi+XKec+qPZdLmbSvm/pjVJBJ
	gNKV0ohDre6VWiDdqjlXaT3q8yzos9mJzdc1iikdtT+Zo4tVY3spmFkO9tfTrf7cLhHNPe4Utdv
	TJQVqbHG7ztaiaNaKwrzW70hAUjb6Srliy3IZxgT2Jjg7e6eruUHY1ew8sDETFySgyqriTemyyb
	xmwgX0vznkF08sOYAC+LKDAu3Hh4b2LH6138s7jNRJtt1KLloCjDVqdDECcKxnzsJe6K+LnMt4x
	YMMejc7gT8QmBEWw+zl4RoqZgDRkoRoUGd3dq8XcuYg/8rQZwJy+03VeTBMd9WYsd+vJoA9ExiU
	VFz/tEVkHx1SNA/GfS0TG5GWinmk5ZdrZkQqLYgL6sTHshnnE+
X-Google-Smtp-Source: AGHT+IHgrSt8S0wDgTYhz7lXorm99rWMA2c/qFSYFNALzArV4sDSA44+8ySnUEuXtMjwaWHATr03LA==
X-Received: by 2002:a05:6102:30dc:10b0:5d7:e095:9398 with SMTP id ada2fe7eead31-5d7e095983dmr3781179137.30.1761053328722;
        Tue, 21 Oct 2025 06:28:48 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d96be9a783sm3649219137.0.2025.10.21.06.28.48
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:28:48 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d967b67003so3607596137.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 06:28:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOBQNFziHd+tbW9O+3FjlieUbgevPiKinioV/xb9AXzlB2Kl9TTAxiPcPi+tF3LXsKv/M7wqSP0CA=@vger.kernel.org
X-Received: by 2002:a05:6102:3a0a:b0:5be:57a1:3eda with SMTP id
 ada2fe7eead31-5d7dd555917mr6009011137.2.1761053328121; Tue, 21 Oct 2025
 06:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014105348.93705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014105348.93705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:28:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzuRhD-r=gSzm2FDDsAOr+Xu1fWyN7ky-U0NoJWXY=qw@mail.gmail.com>
X-Gm-Features: AS18NWDraC2r8a9GHqVGQXFDsek2PQJQgzVHv7PR4XYgaOZDcSUVJXOIem5AU9A
Message-ID: <CAMuHMdVzuRhD-r=gSzm2FDDsAOr+Xu1fWyN7ky-U0NoJWXY=qw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add read-back and delay handling
 for RZ/T2H MSTP
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Oct 2025 at 12:54, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the RZ/T2H SoC, a specific sequence is required when releasing a
> module from the module stop state (i.e. when clearing the corresponding
> bit in the MSTPCRm register to '0'). After writing to the MSTPCRm
> register, a read-back of the same register must be performed, followed
> by at least seven dummy reads of any register within the IP block that
> is being released.
>
> To avoid mapping device registers for this purpose, a short delay is
> introduced after the read-back to ensure proper hardware stabilization
> before the module becomes accessible.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
