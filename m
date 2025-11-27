Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47C2D46B2
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260579; cv=none; b=Q3Qfmkpa3Mw5jNFznrLz0xy6ziC3kIBMuFfHFgjofGhOKIAXqlGC/kOrpb7CANHE3R/O4iZmbU9j+ziYM7mL69sL+VcoFrliOdM9D7AbROstg303sRXa5k/ea4gP7aPwy9Hu0CkXQ/5sr+/eHUDthFXX7ZwZm1rqkg57kv6MWhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260579; c=relaxed/simple;
	bh=agy4wfe5yMOlZ80RTHEPimJTmIwgD5IqH2V4pPzePc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRjGeLeL9U/aY2n2MD99e8CIvXNXpykmW46FcT9TAncUgSswZokPjL0pHejVFlQv5CUwiKTs8KDXlgsKpe1f8sUO+sEH6T18PY91cJq7NhHSQqfrrUSgfDpSVfgQ07HdtJFtpqSilBBOW/K7uuvVdC9USz7N3Nze0Id5hML2QoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dfa9c01c54so637134137.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 08:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260576; x=1764865376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jwd6PiHGiN7G8dmfLRTmVhxm7LG7hgnCi1AaWs5XSQg=;
        b=loUkllikKsCq+UDZdr6assWn3Cc5Klr7eFAm/lAGFxqMrdj4JWxANqN8B3zDSApXzu
         biACMs7HELeQFlnUuZVS6K4MMj7uiQldSnCrUAqB8wk9wkxvpeX9Qsjt2+RxNQwNEshj
         oXHD1Nb0L38n9xqRMVl4yQGJEmSqmJKv/WAyt9s81SGCIMfPVoLhXoKe9v7SmkhVsydv
         aqIIm5b8E9gCoQBZXwn4RUw1VbCvEWEhwC+M+hIV5T//5P8tMhL67yivE5YJiYGC9bEd
         /Ete7JTP91wGqzSfi2ZFjO6htxQzCJIJh1OExVNw+b3ftm1cvQ/nc0wz2i2c2fFnjuWr
         Tx+w==
X-Forwarded-Encrypted: i=1; AJvYcCVmAIec4QtsIXHrR9Ut57AeBReZO9MFkgcc748Ju9lQWga90GfU3iQf7XwhFgd3pwaf29TmHC609qA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3KpAnx30H1fCL38toZU8nh6/Fu9X6ZsHKlPjaoU7p15E2tj3S
	qD1avgxVxbgcZodI2XIGT4w9D0mkXhrvX11wDmMxjpIVGNx6oIGFcMzc1qG3UstT
X-Gm-Gg: ASbGncunJ5tyfz9zdUtNDAFsdVFYDygcL3pswf2nVtTo6szo4VVi/5iqaY2a8GC6s87
	qK+BGWP+bdccIY1EgxCgrl3a7dqGS/H/Fm5CIdkS8tUfHfe2/NxzLrKBgJBKI8dtAIX958SVka4
	O2DO3SU9i36hYKApmiIstV2ufv1rLbBfND9EK/aYNVAZ1wlA8h86SBl6coi440WpzXUN73PyGzq
	Q3KW0nHTbcZKy4xFq8ER1IyDlwtCObVBAy1LG6ryUUM5PQA3ZocSMxZxgIsClzy55WlOfE20sT/
	bsJJxM1wdcYde4ZYYF1DeoYgo7TMu4vbNHuho4vdocSm+Db9UvPPzH908xo+esjv+NvV0FVM6gd
	tukSlAJrjlTaCXNDHg0f7MRLWRQxjPvOPY+a4VZT6Ufj3fD2HvEjfw+zDcpWDBrfuT3DfIv34cA
	pV8eVrMriGF6B/4UZV8rS93vyaamT7BD+c9ymyITxZbaU2PSTb
X-Google-Smtp-Source: AGHT+IFSUBHFs+VTz4Is9mzaqEUHr+qrxQAk4m9yOr1Ku7RwK9GS0mnXOUYbs6vzvD05yCa130zedw==
X-Received: by 2002:a05:6102:946:b0:5db:3585:78c1 with SMTP id ada2fe7eead31-5e2243de24bmr4247238137.31.1764260576440;
        Thu, 27 Nov 2025 08:22:56 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24dd170acsm629972137.12.2025.11.27.08.22.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:22:55 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dfa9c01c54so637126137.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 08:22:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXicqevgimFVWMhtXd+kKWv2c4Kg+xF7C3FB7f7UxIqilf7XoqTWSDF+tv7sRdFfLr7+9dMOLkHyyA=@vger.kernel.org
X-Received: by 2002:a05:6102:149e:b0:5db:e851:9395 with SMTP id
 ada2fe7eead31-5e22420add9mr4138332137.7.1764260575667; Thu, 27 Nov 2025
 08:22:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125221420.288809-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125221420.288809-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:22:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUzGxc_dsah5hi2jmRSr9TJKq9X_rVjiT+Z1gUqurpRtw@mail.gmail.com>
X-Gm-Features: AWmQ_blFxOhLY-anmrJXWsRICbdAjkUcuKXJXEm_S0V29_UGHptWp5vm4FvLiuI
Message-ID: <CAMuHMdUzGxc_dsah5hi2jmRSr9TJKq9X_rVjiT+Z1gUqurpRtw@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a09g056: Add entries for ICU
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
> Add clock and reset entries for the ICU IP block.
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
