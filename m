Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC9282F34
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677964; cv=none; b=hcE4FzRb7D1tob3IAAehfh2vkB642odZpjgGx01pAq6Z3n7H3LyL60tjNLro638uTKdV4PRWh+rTHBai2yEohrY2VpNEdwCveXPbXX5LoYNRWEEVdlDBUgz9FHtJcDfwbq/+8ndBK/YH4XeUw0AW7bUuttekSWlpVizohCNkwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677964; c=relaxed/simple;
	bh=dzT3V0PJ0EtYExpUBsSJdQaC/ZjisOX3JzhU9ZCaz7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmeFTL88pMsHtdMmcZRInDSw6OTN1REkuYBf9m1R1hrPxqt6uZkFoU2o7DWolaM15+VHr9LR2td3jFpuzmD8j63ir/L87aZLDFfH2BeeWDIHE4ZO1k7nlbjNQnuSluQena1iWUUWxjYYiWRyDGRnMaPJy1t6/Mu0px33jjND5gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-631333ee9e4so1839446137.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677962; x=1779282762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7kN1iIudHNJUvL4pmKJBVfs8sJZ9FSxEHa1dgQM7WA=;
        b=WZ0HPgxeT7vOa80VBtpadKx9G4EOCX+uOi3VTGZ26oCmCS1H04fSnKDV7W7KSFORC4
         VACJytgWSHxhsDsdv3flhsDG1rGjNPW33iE6O3pJYNSgbWSWSiRrhm28x1oPkzO2Gby6
         Mi4mEMvnLrl+2HdT6a6D3LEUJNlfXEPlRXt18HoUsPE48C0y6IfpV+lnWAM05NSF/I3C
         mu0jpe93SrEzqElDZjCeiXTPqbFdkBkMqdpGk/QLxKdggnYZcC0bXmVrg9EZntay1nlT
         O6uFg38gkb8xLQdVBRWSJUwp1rUvdraC3Vq/062Gbyowbg5Tk6TthGnP+kBVIR1swcuk
         uN7g==
X-Forwarded-Encrypted: i=1; AFNElJ+52WE7ZEAhzfLSOYnT2zaNQ4kG1KyFFLVbtusH1gXMjHcgHE6JvgwSK8swhEEHMyjGx0d1cwc0aEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywxaxyAZs+bo8ApQHzPmZz/Bk57r98hj5H092XAjKAnK0hrGc4
	Ge1IKxoIJoJoJ28c1vltRUjq351axJS9y4vaCnbObzxM3Ylus35fF19wqqv5Tw8e
X-Gm-Gg: Acq92OG4Zg8b+ii4+LD2rJx3sJPM0CCvOx4+urjU4uUJOhxb8rTl1iWNKyvC8P01jcY
	SsQH2PI2SgthGsTW+DcLjfK289YDr+V41UNCQffsxWdio6UkMZnc7CJpvJf5Td+nhBV7VoOB5PP
	07vrH9H2VRysqvNP2aHDj9MKD3+It+LTu6tQR1x7KhGWdXwKPBneDcE+F1bIx+rf7wLHO9MXDJC
	pdYekNbHPN7Z8Ry57ZNpvYVXFPmgjlGd4dTdBo/tlBDg6RN0N7Up+jGPfPLWFG2llESUAfxMcyJ
	f+c6x3nk44YkrfgZO/bO7BofrfYcU6qTKTs2J188L8R5c9S3kUftwnu9j4dPk3r/v+BCZQa6XDU
	utKAMhW/vhLMipZO6LV+W99CTk+/7LHSp8Q65fBP9XiXnFDyTc8FKxYrVcupCcYeJWQMHnq3prC
	puiouwuKciCsWzVcTXbPBOskeNemtL+ONnemcWmGajlU2OZhJCurPp40ff9GYE
X-Received: by 2002:a05:6102:14aa:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-637a41b3250mr858729137.0.1778677957966;
        Wed, 13 May 2026 06:12:37 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6313ffe8e17sm9594662137.3.2026.05.13.06.12.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:12:37 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-63329e1c77aso1132358137.3
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:12:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88Lf0UnfiutWG2bcBVICoJopWXMOcUdXDiiH7k73hU+ugU0xf6Kz5xyyvHGInUH2mGyA0EUfT3Yes=@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:631:3821:2f12 with SMTP id
 ada2fe7eead31-637a90e2a7cmr951105137.16.1778677952636; Wed, 13 May 2026
 06:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGLtExqCcHiiixw12Yq198HV_s8ZH_cq1gazuw_2hjmA@mail.gmail.com>
X-Gm-Features: AVHnY4LeEF2c4Mc4gMH6K1pQiwZCCHRxKdP-2WPlZmXzSxqkEXKWG-8hJyRfniI
Message-ID: <CAMuHMdWGLtExqCcHiiixw12Yq198HV_s8ZH_cq1gazuw_2hjmA@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on
 R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
