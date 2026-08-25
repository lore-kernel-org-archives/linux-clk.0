Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4B445AE7
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661458; cv=none; b=TfgCgQ4d58Hi2I79+8JrCQjG3A3bpckxukMD6BLecMZEPCeYrtuxmv9pmjupKBi5xDeHZi2XYyjkl6kzwQyBSiQg0aUKuggbDCHRWqkEj0qFJne8RuLZIIxNu5cm28rR2AsRtwTEWT4iHaCQf4tOGnIkh5K2OKWJ3T2yD0k4T2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661458; c=relaxed/simple;
	bh=XVZs/xqSmR+34+BrwmpxC0cd+dGU1Zxb/J9zlN0cTU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdmFi6JKbra+UwqAxML4/KmHiNNMNmledW81fYp+8OYLTA49A3kLvlIniwCcqbbnixTZ8X5kSERWGFfYtFFZWBG3UQSGElr4fM3azhLTYNnidXBeaAekid0QkobSatPIKiyVxe2WMDOJILfWBW3wz/fHn/xM08+g/kSDrrsiOZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-836cb2fa1bcso71271027b3.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661450; x=1788266250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ILP07iJKBmCL4umuQJDRJxi/o8MvR2u5/1eDo+tc9XU=;
        b=qH+5FrrsvJbYsBjlskDsS9qn7ACm4B6klPHiqv9laGkBrmdw2a1Qf4GteNVUdMHCuw
         9TTKjH07zPvRe1HTmC3xp/m/WGVfibVaO3afzi39GeFS9+j2m19fhlNgOyc/NUFiD/KF
         k16foke3mn9hGrMsD8MvDVyeCunhEZPKg2sNG5v9fpzSs77KRGHib0KGT2F2T3Cxe+84
         m1TXHJrLermPIiHzMkhh3KHn6EuZ1sTHM9dubUlNLmjcBUCYUfUHEqaYcb/+Cjk4FwFb
         tRqaOCxNyD7xXzYL0keYTwM13XDtRZw+TcQCeY0Hg4lG41rnjYR2s/Nz0I4DC/JcVA2m
         kgFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrErrMOT1kqYXYk0CLJZOdfIBeqTcNyKnZmhfB8mmRcn1DfyMJCjZd70BAb6VToPgH6f391aixCUPc=@vger.kernel.org
X-Gm-Message-State: AFuF++loql8etLwrhzJxBNViY2OGqwkLuItkonMK6nhqX0AoupDdesQV
	aoGBeD3mbSNm4iLWb3tTx0o2YLoioobZ5HyoPp3GO4ts8cBOeLkedKQ7vpxi/JZ2nfY=
X-Gm-Gg: AR+sD11WpOW9BMEQUOL30f9nXm0q65poBdBXVUckPEByWVSRUYC9ablS8uiZ6sGF43F
	HKCAVA6l0HvXdh7lB4xclqfNFzGGJAT843ti0zkcwi9+f53TMkaEjA4vd1APp9KMSgqNfkUmfxT
	Ckqw7JVsNP4sZFT2akhbal4YcNVkKrAn/Fq9dsny/2Fq6K62/9L1FUVqF0NfJQEc2LbH8bk21gn
	ZleWOCssMlRuCWy8+Cu5FRGX9FvBdWbojzrz1lJANnoDhjI3XxxqwZYL3eIbfqS/sMIsFkgcRt/
	o5DZX5x03Dz0TUtEqwpI86DNTmgaNLzjK1eF56t1EF8Fo4pO69MO3EpKfxemnR9as29nabadkrE
	MW6XzUZsrm+fs4i+ORZV5Yn1HhnCYUjbn8FvW/3iv8Yq7Nn3GVkyeNOyXQUFqCtW9ORD0Plwai0
	XNAe6sI1ynyCnzY8cUpLR5OPNeKOxHbZi2McTgwFEk/kocfqCuq//yNEmUZkivXowCubmj5PAJg
	9et8aR1eVcgBMftE+TDF7/bv81TrZudvWLbB9dQ
X-Received: by 2002:a05:690c:39b:b0:81f:238a:1709 with SMTP id 00721157ae682-84c9c39e156mr82021637b3.34.1787661450146;
        Tue, 25 Aug 2026 05:37:30 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cac010907sm47726197b3.41.2026.08.25.05.37.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:37:29 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8200b55dc47so72951197b3.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:37:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDYHKQczi8Qxjf74EtpniG78WOMkn7eyOgIWum+E8yee0vOTni7hmrB2/UXJMi6wLQr4cHDIsf8qk=@vger.kernel.org
X-Received: by 2002:a05:6102:fa4:b0:778:9033:e337 with SMTP id
 ada2fe7eead31-77bd12c12c9mr7782019137.7.1787661031227; Tue, 25 Aug 2026
 05:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:30:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwbEUjqxWyXFK0WSDh5B_hXj5n5iH4Nk3_EpBVQDbtMA@mail.gmail.com>
X-Gm-Features: AcwNN1VMSQ32o_cnpnsTpSPX7r0kAj3W65LFTE0SdyuxEiBV0BGPSBvqvVU8GfE
Message-ID: <CAMuHMdXwbEUjqxWyXFK0WSDh5B_hXj5n5iH4Nk3_EpBVQDbtMA@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: r9a09g077: Use CPG/MSSR
 syscon for WDTDCR access
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
> The WDTDCR registers for wdt0-wdt5 reside in the second register region of
> the CPG/MSSR block. This multi-function block is now exposed via a unified
> syscon regmap interface.
>
> Replace the direct mapping of the individual WDTDCR registers with the
> new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
> node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
