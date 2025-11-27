Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE012D5932
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261009; cv=none; b=LMRSeX2oNXFc0oHEqQU0oKIllyTP4457DvhjdDWo8xfdV7Mn5a3PkqIUrhAbAJ4g2fm1sCC2im4CRllINQGgYjcMGGiSeqEOrZuzzckBLKXkA8jaavFu7C0Zml9nio/+AkS5m/5FkN95Rxc8RdgfQUAokefOwbOH0JYL8oJKonk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261009; c=relaxed/simple;
	bh=aspswoNAKOhPVwvu9qhnWpMe8+wEwZQxVwVuoicCgko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aS9Xjt9wChVnmBQbV7/2vvISHNiEnUxLnsGDHaMwNhdELVmc8KNccMDNoey2zTCFMCxAX+HiRQdw389fKBBgaNtiTgJxfqqTWShcoyYNHU0dhgaXxdYEnA/DMXClS3I9p88tr3twL31n4m0Y7KAL3KObTe94DEiLbkSA+qWiasY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5deb0b2f685so1398214137.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 08:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764261007; x=1764865807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gs5FKTH1FZR7cLdsOl+4N50aiArDlXrJC3TGGiC1P6w=;
        b=fIZJSj6anOIfGAEHpauEr1eq2VNh7erf4uRrmwemEx/THXl7TeFM386R9PSPbCkMeC
         OMUyMHtXZGC/J3n2pgz5e3Su3Oofne/O2wzBlwpTFxaM2xn2qNEXmP1TebaYtG/45RgO
         Y0b9FQTTSCW7xAGIHTCkvyKNvGAIECEEa/85jJg+mz15hG0OFfBe6qxcRbPqxE+eyI/c
         qalhwbGZTDNAEs5J8DF7lYIp2679ER0c0LcLbr4cgMPcruCTzxEQjqtse5+IwrMvOjtQ
         LYyQGWUUGx+WG2Q/vcuiouIQRcWb94EOvqDO3oCjR8+Kj6rFGrwD/v0nGJ5O0nrUUIkR
         tDlg==
X-Forwarded-Encrypted: i=1; AJvYcCW5YgDqDsIff2qkX9NTO63M1kIIN9LfQzz80lgPFOrOs/UGrVCmNgdUbM0Ed2Cmn78fAkctIyNvAh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEQJYVK9hsiVtKUYSIqtk4BCdVIkLEvwrdrAqFbB+Fnor/+Y2l
	cJ51uI4zhE8pUjWeGl7hW+p1kmdYDije4qENwDXcHJ8mAu32Dm7x/6iKDUcfDsJk
X-Gm-Gg: ASbGncvvn7FU422PTc6zn9hrW0REmZi2GGOUD4MLJW/F4mQ/zzswggeJdAdfMRf1Pg7
	9pH7OLnK+Z9/JyUqKT2pxfk0MiVj1mFyKW+DyMW+zJ6/MPLcJvY3Uq6RT/P54eiw1NnZqm+wvgW
	MazX7gcOH/bxLDSKRReGitKGqLNT+GFDl6xwmvmOcTK6kiUfutgH6kFPD1V51rWoDlRTE9z1/kC
	Te8nZhirUIpu3tjVF+lH+vGmyCfYzi4/oxBWzPirH3YAQR3DW1iFb4GcFImwOF0oG5nx+wcrJu2
	ajvGz2hSb63h9dLSrwprchVtj85e3NRejG7GA78yuKlGnr9tjOWCXrQKaP5Ob+keHhZZ6eIGTkP
	Rldmn4zLe6p/j1qY86x9SzdHwxUCxgY+OByHLjCC9zk3MJSOHF9QGpmmX3NsQxyPMCN/phpcHbE
	V1WDB2n4ur1B1rwuLkpeGrCvdhbX7/+PjyziZAjvwg23RmjEOP
X-Google-Smtp-Source: AGHT+IGcWmiTLsqXvxT1RY88nnGz9q297ZDNsJcm7Mlps+sJxs+eCGdJbD3RUu6YqYl2rVRYv/b5fw==
X-Received: by 2002:a05:6102:4b84:b0:5db:1e4e:6b04 with SMTP id ada2fe7eead31-5e1dcfac0a0mr10059565137.18.1764261007114;
        Thu, 27 Nov 2025 08:30:07 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d934eb9sm642322137.4.2025.11.27.08.30.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:30:06 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dfaceec8deso708191137.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 08:30:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1c+8dO+q4Vsp6TiIt8/KbriIOmrEqJlZ6KVDFU7Gd+Gqz0miooppUz+Ao62fmyzbxH/afX/k2Kx0=@vger.kernel.org
X-Received: by 2002:a05:6102:5248:b0:5db:f897:59f0 with SMTP id
 ada2fe7eead31-5e1c40d02fcmr10686191137.11.1764261006420; Thu, 27 Nov 2025
 08:30:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125221420.288809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125221420.288809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:29:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPZ3Qgorpj=xY7DFkDkxh0k1QLDARRJjiHN7JjoEJ0kg@mail.gmail.com>
X-Gm-Features: AWmQ_blWIFVuTa9dh4H3jpc-C2eBoGOexQqPhzUAA1Z8L2_lfHqF19MEie2Tcf8
Message-ID: <CAMuHMdUPZ3Qgorpj=xY7DFkDkxh0k1QLDARRJjiHN7JjoEJ0kg@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a09g056: Add entries for the RSPIs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 23:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the RSPI IPs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
