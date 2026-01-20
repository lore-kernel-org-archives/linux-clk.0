Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770DF3C1979
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906187; cv=none; b=aNKOE+UKA9fI31IyoXjTfCgTxnlWLP6N6+lzRIVUk0EF6SNdDRryDLiJJbnDEMTq+uk4RXtvjWOt4PsNDYW5o034HyHvH86fe4CTICTwpOBHtDUQ+INKKhvYw25MSsegLUoo73sqwpOpSo2aH00tyHuuadT4pmZZ0YN712IA5dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906187; c=relaxed/simple;
	bh=Jo14SNVvgAvpmCa6sHx3d7iO2VYD3GagcaTjUOnITWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJ3vNGQoHdsEEuUN0vBv+Iyam3dXdN6MUGXTgk8IHX+5go35HPW//LCUjl8/ooXpSrF0IoP2Ak6DWa3Z3xahlnuwFUPtlPqd3BYztBsItbo4IqqUxWLrUp00HvAtrbEVyuE26JWRF4dACSKlq+/RaBHA7dtvgq+NYe/AsQIfsb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5637b96211aso4529416e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 02:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906185; x=1769510985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZ0wVYmrXY0w9NWoQKTsT/lFDBKGzH8gk5CbiyOvxNo=;
        b=hdObK+0M57YTUHu/cU4oHtLAgmr5mQwEnsyXq7EHORqGmhzGxZq34YFZ50C6o/x7U9
         TBWdgcXitFvZd6xWUtyGSCtYNlVcGWkfPtIRWHjNzd4yencFyIPg471oVnjLCsWhj9CK
         cen5srwY1R6fP5UXz5BSFfOKNp8bUf3VRReAUItbL8peClanb4YakStmuYi8nMpX1xHX
         Q/bNYxvaCCuqh3/n2ffD9Y1kcV6855rmUGqcdRrWVtSEjegU0nv9nGyTO1niVWkVfBCd
         Ktk6AMmH1rOGnHCIg8NLH6irhDlg/MEWCOqBKlDz2I0evpJ9wGoqX4aqv7y3u8L8rBPz
         PBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVou7o49w60G4SNcw79q5NNxFTdMvRYMlihY2RY75z4TwvePCcvG8OftTwx7AC+sasUZIzYN0MAmHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dSuVDyH0n8TaCx9UCSyjEIwXqCpG7A1cky6XLHCDYonIWjn3
	DpLhCPU9E5cA8pcKuowoD9VToXqOFzz+ZTNo0zRcTIiHLf5Nq2AEc2bHlW5KhJQJ
X-Gm-Gg: AZuq6aI0AiP3j5N65YGu1XgpGKcOb95phABl0n0HFRFpZWllYAruxA0NdivGZknk11f
	kFf/TvI1DF/rfp4MtdsXjWFRnX1U4e+m4k8Nt2dkt4LbyskOMcjHEPvnkFuOBwrchBViaqUfCc1
	frPeh8gyBzLm8q+PVCwTvk1+MiUMMmJYbq5nBiOdlnHwpWgLT/GiG+IfnTeuVZ3eB4iAfRsaoEA
	vjcZAzoa64nfX+1yXPm79FOhS8Cz2Bk0CCCrchLySe81IukURsrUP+gF25c47By9FVvB0/Nz/6Z
	jgqDs5kgmlFjefjGVsPdMBUFu6tLlgyZgl/ULuhjwk2xEn3H9R5jkCyDfBQTRZVc7mNPYsLE5cT
	hEuzdFT0rAONGtIQYJQ34ffdzLypLYzBM3xLpifdONMfPtH+F7rPzdn3a82X6A4rCdunpWVUlq1
	H3R8VAFsKg7AKLcTf2T2movLucquADBW+/vyfhr8TTjEqDKgaEyr1aqzmibGQ=
X-Received: by 2002:a05:6122:45a6:b0:55b:305b:4e41 with SMTP id 71dfb90a1353d-565e663aea3mr344076e0c.18.1768906185215;
        Tue, 20 Jan 2026 02:49:45 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d04377bfsm4078922241.10.2026.01.20.02.49.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:49:44 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ed0a9cbb3fso3309000137.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 02:49:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZU4oJrv81qnJMlIww4lYcGSd7Q44VsbsmJTQLwat24y3Oigey8jWwQoVq4QOusat03xHagv0kCmI=@vger.kernel.org
X-Received: by 2002:a05:6102:3f56:b0:5f1:4fb8:6b92 with SMTP id
 ada2fe7eead31-5f50a9d3b46mr342934137.22.1768906183803; Tue, 20 Jan 2026
 02:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com> <20260114153337.46765-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260114153337.46765-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 11:49:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
X-Gm-Features: AZwV_QiaybW_I-1gR5s_n3JOLx29V6BZF-xoPK94FskYw67mu-RW2omq6aWspo4
Message-ID: <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
Subject: Re: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off clocks
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 14 Jan 2026 at 16:36, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Some peripherals may be left enabled by the bootloader but should be
> explicitly disabled by the kernel to ensure a known initial state.
> This is particularly important for PCIe which requires proper
> initialization sequencing.
>
> Add new macros DEF_MOD_INIT_OFF() to declare module clocks that should be
> turned off during CPG probe if found in the opposite state.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I am still wondering if there are any possible bad side effects
of disabling the PCIe clocks, e.g. when PCIe is in use (network card,
SATA card, ...)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
