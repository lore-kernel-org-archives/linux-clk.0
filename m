Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9943427F9C
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660822; cv=none; b=SQI2/RdIMQSxC/ha30Ss4wEmmFFnhWE8snu4gtzngmvVPzBlWZSTEk3+PCI+sUUPPyUy58J2vfeR4cekfmdp9avzVeHqcXi8AH3kkcYCBCnQ9KV7wEgDoRa7rBwfu1mtoBAeByS853sHrEKoq9BwsxZ8VR7U1jil+oCyCj91zxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660822; c=relaxed/simple;
	bh=gxH8SjRD1UIdTzPbcf/H8o8DZ5xZ4KITTBXh+NTJ9ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHb5EVUp6Y9D6YJ0I1xVr6wbcG4wd8yVJ3OYrzcROz9DA6JQpV2QJseVdid5mIxE0wj0HOdp4Nv4q+ikYz05htPI7bTFx8960R+ufgw4dtQMLg6H1o3cBsQdhv5E1ytr/3OAJvWHWFO3KK9eLXbV80gRQLawxD5ZrF3qMaxqVxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-779d18ef706so3149444137.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660820; x=1788265620;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3bNYZKHP963OmdqbLfjn2seFzOgtwyksbPN0UTH7ftQ=;
        b=sgEN99RjuL5+cKgxcP6z8WaTr1tHIivVRTCuT6fOGlghTVZzZH8i9BdoMers8PpClI
         fzVL+MLkijx3M7ltcPQBqQlXJz737Gfn3CRK+YaHta9JTcTBGPVFLvgJXqyktgvtTKyl
         F9Xf8Pchy1RtjL4h+BjztoVN4LZpg0rW+9xNVzKw7W6JviXKiYlMjfoXO3oRMFAYcOrp
         WqMn5jhw7lTRfH8dxS1wobDX8knbvXkcGtnNaokZ79DNek3g9O/NhgWNv98h/SKDHNC5
         Gcbtm5E+vB1zTsHVgoqdAMkE+0JFTyoEkMkqxQ/WagCNb2h/1BYpz/F+DcZ9una1iTlx
         m7EA==
X-Forwarded-Encrypted: i=1; AHgh+RpVA6P6RT1XwAab/oANpJN9Mtv0quivyFonvVLS+vVNx3LH5CKv11yzyd+QqAM4h3asfv36+AHW1D8=@vger.kernel.org
X-Gm-Message-State: AFuF++nLTKB3S6sGWUf1wv7QV/Beferg5CmFgTTEzmszDCEGQhnuVAql
	T58GRmsl33tHs9YlPXX5WG5kHJI0/BOxv2g+PABDM+ZJUcpjc7C6mmPDoVFbKkP1jnQ=
X-Gm-Gg: AR+sD11CMqWXwlC4Uq0pGs1yO2WyQK+gwY0/AEMxLl1J5nieQnaQ9CYGlb4UlfhARRP
	oLecjh36hSzSSeeJdVshQQSAS07K6jOEVp+NfCply9LLut9/XzdU+/2S4cfvUHJ398buulwpA0r
	XE/OAYsJEIJC4x+8fN3ujW+PcU9gGwj6bPIKZu28dYQN0qUnLsg8lx6R9mXZmRucW+U3F99kZtP
	wOhoKO6zdh+atrOilsQljGKXOZIiqxb8GKiCK/LR6PHuxXTqbwfAPBegflWC6N+Hnk5l/0ix8/U
	+B2haGVbjfvBSAw+M+eS8uZrQnOCLNoMdMFVXzMNpqsjTOzB/42zYcuFd/JODPO6pRdv1vRhQso
	lcplql+HRbqD+lqrwJAizBFrIYupCy842/YdWGRfaFoGjIARZ36sUCy76M6RAYC6qJ1wUVlUSVh
	l17gIrl90dUeV+lnbYw6psrPrJx8A3Y9LReiXC6vbzQ3/4ecCyxQCidbnMh2oQVJ9V69V10RNDc
	UVcHfsvwCUSdHMfePPN4fS0X7120gNaJn3x
X-Received: by 2002:a05:6102:2d09:b0:77b:2ce5:76bc with SMTP id ada2fe7eead31-77fe90f731amr2733711137.13.1787660819674;
        Tue, 25 Aug 2026 05:26:59 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cb573382asm490299241.7.2026.08.25.05.26.58
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:26:59 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97c441e66f0so2270837241.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3qmvkeFqSKOsacGb4R+nEg4XMYedsfwh44AzlcCkcJj16oKKFkUTmztVGxRhTJ+jrmgHRAgb1LWQ=@vger.kernel.org
X-Received: by 2002:a05:6102:e14:b0:77d:a23d:ae70 with SMTP id
 ada2fe7eead31-77fe9814c27mr2237403137.14.1787660817048; Tue, 25 Aug 2026
 05:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:26:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtApMoHKg7v2CqNTQy4EF0sEzmSfQimGySgTcYjMwXEQ@mail.gmail.com>
X-Gm-Features: AcwNN1U4dCP-EqOtN5skyICgGBt3GttjfY4cB3WPPEIKKuOj9_pFM74mnwgkrag
Message-ID: <CAMuHMdUtApMoHKg7v2CqNTQy4EF0sEzmSfQimGySgTcYjMwXEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] clk: renesas: r9a09g077: Register SYSC regmap
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Register a syscon regmap for the System Controller (SYSC) integrated into
> the RZ/T2H and RZ/N2H CPG block.
>
> Unlike traditional Renesas CPG/MSSR implementations, the RZ/T2H and RZ/N2H
> CPG block also integrates the SYSC, which provides low-power management,
> clock monitoring, write protection and peripheral configuration registers
> shared by multiple drivers.
>
> Implement the RZ/T2H-specific .post_init() callback to create and register
> a syscon regmap covering the SYSC register space using the CPG device node.
> For backward compatibility, return without registering the regmap when the
> mapped resources correspond to older Device Trees that expose only the
> legacy 64 KiB CPG register window.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped RZT2H_SYSC_BASE macro
> - Added array of base pointers to the r9a09g077_sysc_reg struct to
>   support multiple SYSC regions
> - Merged r9a09g077_writeable_readable_sysc0 and
>   r9a09g077_writeable_readable_sysc1 into a single function
>   that checks the SYSC block and offset to determine if the register is
>   readable/writable.
> - Added RZT2H_CPG_REG_SIZE macro
> - Updated r9a09g077_post_init() to call of_address_to_resource() to check
>   the size of the mapped CPG register regions
> - Dropped changes from cpg_mssr_common_init

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
