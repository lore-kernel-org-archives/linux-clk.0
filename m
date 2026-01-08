Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6834B408
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875938; cv=none; b=cdSoHchLWrk8lJ9fRh0NjrqZaCRgLs8zFGHXDh8sL/DQ5Hrak0BJ79Vx6dqDeEGorCzaWb/j/wd1p+l+rKh6WOCIUfEdxgonIytp2OW0mqAXZ4xATfVAm0HQ3p1Uigt8AzatmMkGPTQirsDfnTYx8gopK3ip5l5pOLs3+GR3ys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875938; c=relaxed/simple;
	bh=55ZFRUPeDA/RxlGqo7HHBvj6ZABYAeyXZVfIb0RNEoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjIdiMvNLcMpZasgDyWCFAf2aA+fBoDUpekr86g+kaHKul5+8Cily/lH6f2uXNHRpbHMeF3NRdY8nroi1MI+vXmO7Vhfihh++z5VgdrN81DIxPKjkZdZvGhzk30AcVjDeBSMuX/X429euNaRXlExfYEZQpvMQKeHN1l26dHsfAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f193.google.com with SMTP id 71dfb90a1353d-5597330a34fso2232563e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 04:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875936; x=1768480736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrfmmP1+i+bzWrmPxdKmIn2tj5LiL1x6bd19VsxQ+o=;
        b=OI4mqMM/GK7xsrh/DtYwUoP3Sf3H8IU7TwR16uAoF7CX4pPoEtQHaDPzMEfY4UCqh6
         MlIOKqKCikcmGATxO5h+10V4L/FPAGVNtQC+KJkG0zeZDSvXgV12qHsIxREdnJii343b
         H+K4jK3gadLvWD6YVkDghuKerJo/lBx2EETzLA4alwOluzjaE6YU6VcdqiPIIugLXdhy
         EGqQqTiCK0vWDqnJuI1j0NdHmH76PDusYpHjbcPH9WuMUKBuDJZP6lroomicSlR4+mXg
         vIK3A0ya2R7S6yUpuR7vXWLjHDIESjgFairpTDA5dh1JlvzptuCCAWH0qOF8X3IWfIdP
         MoLg==
X-Forwarded-Encrypted: i=1; AJvYcCV2x7mYhlVSkVsa2htr+jAmdoNv3Z9gPm5ZLSdBOaUBk7yAmysXONHQ+f5/mVM1w3UR+w+v+CwN9Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMOmbDiU2rgSyswTKmhS6VgnpKrb4Gi3DEcr3zxgchkPqmtGZz
	LKvdanz/GKEMh42G2h+HLPTfpGB8SBtBGTTezm47bs49lASci7jpNwXv51SuzRAmuPU=
X-Gm-Gg: AY/fxX4AjLUGXbBb2suf+OgGFStZ9rM/RZybiGNpGRBg/EPqrty/DnPB2tcTnubWV8T
	mjNrhxmAn09OdWyv9gDMKKTpkgJylcnaDP1DJtI8xn1yF7rVHqi0W/ua2G/v2CTlzmDdmpWaxRE
	Fckpg8/m+Q2jJlunvhFtQwADQOqTKTEE6QSEq/UxFiVMVWBDYWHKpps46XQ01O6bkkAYdFMW7qF
	6n0lEX//m5xCt8YpRlmjdR2IudSzjP2pOKCLb9TlYKmxal/QWSPu+wkf+ZDtBjBnC+/JHWYfY8E
	ukFM2e5d6iUfyIrx3tyhyt2opiMJ11kVL7JySrZPk4a4wXj2Vph8A6chdOCeRvVTjjjN3RpZ5+r
	Icimlp1Sj2lC0TReqCmGXN7Q0VHT81/nx2hKwU7xW83ya2cAWJ4K7StooaqnzAEwNXC/rLxGRgq
	A/RMFTdCm7/sZGEz4OhA873zWDQu427QfOlRvdfCr5YJ+RHS6KX0G+
X-Google-Smtp-Source: AGHT+IGWdsphdhqYqnw/42xaMam94Q4CeeznW1rDqeXETmW+4pHABehujNNdc0CMLAZ15aPu0q7RbA==
X-Received: by 2002:a05:6122:c8f:b0:55b:305b:4e44 with SMTP id 71dfb90a1353d-56348020a4bmr1926598e0c.21.1767875935767;
        Thu, 08 Jan 2026 04:38:55 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634ca16da7sm4214266e0c.17.2026.01.08.04.38.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:38:55 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-559f4801609so1191532e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 04:38:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnBjOCEhDPbTPA2rZqTIZ+uXZiSOCE4O91afqTJCtcl5examq5nX3FXzWDaIvENLYxrqEqRqsKEKQ=@vger.kernel.org
X-Received: by 2002:a05:6122:f86:b0:557:b52a:d553 with SMTP id
 71dfb90a1353d-56347d7d51cmr2141718e0c.7.1767875934600; Thu, 08 Jan 2026
 04:38:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108123433.104464-1-biju.das.jz@bp.renesas.com> <20260108123433.104464-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260108123433.104464-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 13:38:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWsADGoGxeYEUrau+gHia7rbf3YB9sUGvSjX3B889z8Q@mail.gmail.com>
X-Gm-Features: AQt7F2ovlCowXVH2gu1zZ8GCYydnOydvjpickO5FxcppjUlNiy-E5fpX4dadr6M
Message-ID: <CAMuHMdVWsADGoGxeYEUrau+gHia7rbf3YB9sUGvSjX3B889z8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 13:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> If the assert() fails due to timeout error, set the reset register bit
> back to deasserted state. This change is needed especially for handling
> assert error in suspend() callback that expect the device to be in
> operational state in case of failure.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Added the variable "mon" in __rzg2l_cpg_assert() and used in
>    readl_poll_timeout_atomic() instead of reusing "value".
>  * Dropped the assert check in error path and simplified value using xor.
>  * Added Rb tag from Geert.

Thanks, will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
