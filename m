Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4202E888A
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 13:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017758; cv=none; b=Lfbmm2Dwb3VQmC6oyY/PCwhk95V5+kly/VfdU5H9GYN8sFoqE0Im1lDFNpm8X19Ur6ZHLaC/PLPM1lcPzoV8ZC6b3G/oz10SI0hRB27Us5lPXR56jIMUw/uQ0GJxQC3vYXfEm/C4epH5NI1kZYforE/qapvav24vkJiZXbGQoso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017758; c=relaxed/simple;
	bh=yimaDht2VPmckuijnK7RHpnVJdwPGNmnTY4r/gDwrBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQ2q6KWi02oa8w07UvFDkPMIXAcrkDwbDSVCRIp0FtnpRntANcYLNBRRFrGas8t8YVEbGCtCIEEgt8D97eDkxT6QWujylpxAOSQWbZSZnXRqDklbjLEx5Bg3y6Hn7TSjAZ780dnoB2zyUSzAyj/vTP5lnCBGcQyL1YVZoHbTqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54bbc2a8586so292293e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 06:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017755; x=1760622555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rG+VBn74V/FeJGvzOBH4i7MNFu3atTCKtUYOgAi8OVI=;
        b=NRdO7JT1TSMKxRfgE8iA0WU3GXtwh9SRED/VMiG3TFgYvXmWkB8Mwk5NJpiAb9/Rs4
         rhhnCWblqE1dc3qRi7CLKNnyWDmKSr/Or68PoXlyG8+egXLHrGB9xdulrKHlnsaEBfNN
         HN+mowMYyAVn3zfJD4XzSENWRnTX6l/6Zyb0xryD4/A6rrgnQ3eeMtscdUCZXNhEIO/T
         F5MDU9rMgLtTp1bMdzb6K+WkB56Js2h5ZSLfCJzJyBzUJX+8PA884N0skDthWn5WHeU1
         KpIug0ZUshP313NzMR3IBtpSJa0bKcoVoRq0886epyf3PXb0ai/b+N6HJUV2kpMJTEkn
         ak6w==
X-Forwarded-Encrypted: i=1; AJvYcCVERXZQcWesRtxY9CRrtaoDNMj0clzXsCkjVgx8bRVCpbbt3pUbh7wXxNlbjuPHQ/YxgCh88ooMYrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjLB5fGrvKmHMGTV/x55hsrwwy31HS7Ht4ruvLOGJrhh8xFj5R
	cz5P7nkL2xbhCRT2FfVBCOfwssMMlQ1LTau45uHu13QEQe8p+7BhpKLSt/r7Ci+u
X-Gm-Gg: ASbGncueG9BL4p8Xt+4ePu2IBnCiVmMXOcnSSja4T+xaj0ZhiMe0e9DCq3G0IjasuxX
	XyEMnwFqi/2P5f11F8mvzJAOZJotevfvfxzwCMhJytup/aOWY3MGHvTegcNFaEi+KUiU203ZmJ4
	xdtK17T8ZJHtbWRe0lESN6P3rBS5bNWdjekSpdvP0fM9YsZ6MfR54yHAKNLqvKKrDOhdFhwNbs+
	R+XVhp3HzB17h4Pj212wNxGgJzpZeY9qnExidD6hG9sRC2XP+qfJzZwOFEu9NfWOD5wmn8yeln1
	izPkmHGqrWNYXLAro7yg2+APbhpa4OV9OJTAHQdtA32KqToEdU/fMptPlN9IO+DNt9I8Ne7SeGd
	ZKQACnXh7DpDGPVjQAdvr+3OdJNJfsRiO4fKoNdC1lYv5Ep2k2s07a1MGDijyqfNg+cFCkoRjfH
	H1+bl6mj0S
X-Google-Smtp-Source: AGHT+IEcfHKa9+3JDLVuO+wZ/5wJDlWi75SKimiEvaXJNiT8fHPqyIv3LuLqA9Sgeo7j+MJzBHr/zw==
X-Received: by 2002:a05:6122:d8c:b0:54a:dce2:2a9c with SMTP id 71dfb90a1353d-554b8c06364mr3033621e0c.14.1760017754951;
        Thu, 09 Oct 2025 06:49:14 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce202c6sm5346466e0c.5.2025.10.09.06.49.14
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:49:14 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ccccc1f7caso478873137.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 06:49:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0nKpspm43yQEQrNcIDHPhc1va/Z3SWBlp2Vc8HSZewwLihnMYopq9accFB4Wrddw3BE19dG2FgXw=@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:520:a44f:3ddf with SMTP id
 ada2fe7eead31-5d5e224f3f9mr2430732137.10.1760017754092; Thu, 09 Oct 2025
 06:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com> <20251001212709.579080-10-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20251001212709.579080-10-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:49:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0k0k4EQhQ9C_oPUPno7BsgN3tW3ydLrvzD783SgULyw@mail.gmail.com>
X-Gm-Features: AS18NWBiuLuEjgmzyDSlSzZ5zrYLpzbrdlxBs-yvgfRSKSU9hkobcBub0EljavI
Message-ID: <CAMuHMdV0k0k4EQhQ9C_oPUPno7BsgN3tW3ydLrvzD783SgULyw@mail.gmail.com>
Subject: Re: [PATCH 09/18] clk: renesas: r9a09g047: Add clock and reset
 entries for USB2
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 23:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add clock and reset entries for USB2.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

I couldn't verify all details, due to the lack of the Additional Manual,
but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
