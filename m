Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7723E4C7F
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454385; cv=none; b=mRxS6WbAI48vmXbkGG+IWrax+BHNzyVgr5wt+nMst22jgYstJhqxQt7NSee+WUyiO3rD6wTqvnRBIAWE7vTm26BMye/d2aYjZE2SpP2jEc6lPEb0oHbMrQzzjRJlTpGBNvkuEfSZnPTOeP6d9qzJwPE9bsRtRZ6077F+SUU1GWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454385; c=relaxed/simple;
	bh=4RYRYnx/N+uB3nG/PmCpdDFzhigjOZcdXVf1qTaHjTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sq2fHMw7t2QZx25Hc7tiK3sZzLGEdFmI0xkdTzdVGNqp3Zt2j0J7Xp0bQYI12s7UzveWMtyIJ2yn7ObBbgvZ12dKVnjlzofb6srzWdTDiaRQyKr9Hia4I65bB6s0tUtBe1OA2f53+xFjL7oZdKXC+TjPBcyeaq2AEqL765xjFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-950cd03fb5eso1832061241.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 08:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454383; x=1775059183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTYn6c2oWhs1HU9mLDTjqKGDTTeJkf0Hf24+Mstq7Ik=;
        b=iP+HYMOpw2og9Z0o7V9K1HJgRyQgRmXX12PKv1hlxgi8MX7KO6rA2C8BsIhSAft78q
         WP5nlgvboE0DzOWzIF/fhha1pNa6sxh/uDwdEddWO3ghq9pzEir2cx370T6Qc5I1Hvhn
         eqOD+Jqu+M9sG6DRkWPJF6czNtF9nj7N8VR/jeTL77wkxKXTPpBL7WGun+BkbjSGTjWT
         HIc/VKB1CykbSJdy73XrRqowU2zAbapln0oNBMuzBHpiTm77j7bc9dwXXbgmHspLo+8t
         cLFbb68i5Rx1lmIN7MBnOUZwfnoxSa5vV6X3035nktgFbyXutSQP6FhCbPt0sny6xERA
         dwRA==
X-Forwarded-Encrypted: i=1; AJvYcCUbkoT8BRZFlDeAgMpdD5OcNoPGGobKqTBh9mfmrcNKr5VldwswgDM99PTlQK40ZxjQg2mqSSxfokI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYeZzMV8XFA5s+07kgvG/6m1S9PMa54+F2k2J2eeuWZVYGhkp
	HQTcKmSjjjVtebBeSpMs42/4lz4x16EJSdgYmtBwAB+tT5/rUv9Onaa2WqiWq7zg180=
X-Gm-Gg: ATEYQzwZUB0mYTXvIslk9j2q8kms+tjc8GbG0rTR/768z48ECISDpVyfyFIxCLe39oG
	gcsqyhEM7YMOEX8a8hP/Cel2k69J5+JoRFL2HfAJU0c8h4DJWPDgBTfnNSwlQbvkpliWHlHnhGP
	yiTCBIiLEwT/FLAJLgWo2dK5gIANqdVfDcLQEaFeAIT96Js1EdFJNxga9rU4szQndNqfYel1qTF
	XHfzjzg2Zwd2FYDp3uQsRaVzD8zj+s8cWbQVg6/XCPbfFo9KV9jquUFj8vKRUePmahkwf+JOwKr
	POmUwCz7+/LrfV+Jy/mz+wdS3PzpzfHOHUSXFIFG4O15rU4uw8lpg/u2plsOkAS34CDK7A1kfM5
	RPT774e3O41FxT3gIlOb4NI8pcqF+W0qiePhXu2J91FEg9sFhMypdP92LM8sJIQXGKT2G6TCjgE
	LiA0/cSOfr2L+wEIiQMbACkeCS63r3HlToyltrFry3ShRM4gffZ0PUzTrP3oXq
X-Received: by 2002:a05:6102:3f51:b0:603:2432:9fe4 with SMTP id ada2fe7eead31-603873188dfmr1921503137.27.1774454383435;
        Wed, 25 Mar 2026 08:59:43 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1066fasm423096241.1.2026.03.25.08.59.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:59:42 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-60327793ec9so608385137.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 08:59:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXthS23pH9XTxDXLT3lgciLG9iGgnrSJoa29YMZVNCDqkZiekzSLoSniNIcKJSTjwS3NYADKicnwBE=@vger.kernel.org
X-Received: by 2002:a05:6102:83cb:b0:5ff:be25:8936 with SMTP id
 ada2fe7eead31-6037901966dmr1857866137.5.1774454381452; Wed, 25 Mar 2026
 08:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 16:59:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXwtniV=_gywHfDCBQ_+660aV4+K2SXbfM3c9guNrbng@mail.gmail.com>
X-Gm-Features: AQROBzASFVBtfoGlkigJX5s9euj0nyf-Dtn2deDVkxMdGhdHzx7S7UnqewbVbV0
Message-ID: <CAMuHMdXXwtniV=_gywHfDCBQ_+660aV4+K2SXbfM3c9guNrbng@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: renesas: r9a09g047: Add PCIe node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ/G3E SoC family features an x2 PCIe IP. Add the PCIe node.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
