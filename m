Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD822848A7
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533038; cv=none; b=Gh1lOWQj+QK2VfmAzVyy4wfVvXXDlkKtMqUgd11smd43gTHwMq8lNsEdagLUHt3BdbFIbzrd5wsCsSXdXuGgrJSj0VRcm3mN4MbBFHK06mwVXjatVzsCWussvcuoStszxXZuneWF45ITEjTDjcsvyfepGFQDZk4TdJDdHdOWKTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533038; c=relaxed/simple;
	bh=zfR0KFSHLPzL2E+STUVtGkTaWWo0Rd9uMDmN3nMDB/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYDm5IlDuCEiKb9Cpaf6i6YzWKoBtaopKCSQNfovPqk4MKvJwB9Da5HgMU8NpW142h6J+OhDyGKbMKAHtJBvIwPlwJ5h3IhZB6f7LkMmPCnQoJR9TycevpccdpIlEVIuotsUPjOzgL7reg+t07HzTVa9U3UB6BLlm48TsbO2qHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-668d70fabc4so1888340a12.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533036; x=1775137836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZpiSciNjye0KqicJtIKQlGVq5eF91hzz2vGtpczo+k=;
        b=H+K2TUMkaOeKO88ZxtJHh4qIjee4EbRulq0N3lwiIBbaKs5yWVXBeFBRieSFPNxlGb
         GnI1sp8EoUt1F3scK1VhgKI9Md9kTYcaaEYX1QB8VWPlDGzbbJk+bAzvIOtjQRteHqaB
         VPkO7gXzgPsOEq21mQrE0E+0hAbVTVBmpl5ast2QOISvb9P9Q16H8YCzLKjxslwo1kOt
         nK1lM/iWv9+RV0gCN5w6thR2hw929v32w9MTJKSRjOugNtPUhUkJpPwperbCe3UzV0pQ
         bKp4kVP/zy4mOn5HzC/nzV95lwACnbPkts2aJdUUZgZQMN1yHov1wNeRpj+mG2R4gJq9
         7gJA==
X-Forwarded-Encrypted: i=1; AJvYcCUZfaYwDShn8SigQtB/WQmyxFTtbVxxnNlK4XgXgTdJ6pha+othpGScwOo8ojq7dLMReZSVlPNAyQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW8BGTjwC4D2sPCRhD2bZyYnI3edFZYexkXkhI/D1pij9f1ZDO
	Vy/tVLT1CcnYnA301oNsjV9uzlpVRwtimPPgysbHhA3O8BcjIWfgBP5ohrJVY57a3Nk=
X-Gm-Gg: ATEYQzy/X+wVZr3baqIoEt1zpWzuMCjpqVAHyx9KpQoKXG1zPFKtHvXMwLeADkMWGZZ
	r5c9z6ewilXnY54uLA+EfVLZ46+mSErktnRcYEXoYNF86YvETLhOeYLw3r9M0i8HY91rm77UYRV
	WXgCvfjjDyFsyCObXUo3DLD/lAML2rUBsMpxXTxiYlGFOZq6TYGG/ojiLhxEDPmqnQZI8QvqaiZ
	/xYGXe4YsglzU2o8L37CjXD48zV+gVxojCh4srLQrjgHQ0WqTiUmRbH+rP+8aXbz4W3Oht2qMwo
	yeut1DwgwCtVUbLBFa5KOVt7M43KhcHuQzUjNu6dypibcJurk3/qpwqapjWIC5sLnm7LVL1Qv1j
	p1KIwnSYSFmHCMSE1doAnjNgtyJLf4t6uvoy7Ah79r9xpv1VX4PdJ3LXkiAHH13jupr8ufaqAtK
	ciRHDIriRg5jxRMO7beCQu4ao0znoeGR7LuRdJpvUCEwgVhFobcWkvb7jZZvY0
X-Received: by 2002:a17:906:9f8c:b0:b98:ad4:6208 with SMTP id a640c23a62f3a-b9a5426db1emr530815766b.38.1774533035621;
        Thu, 26 Mar 2026 06:50:35 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef450sm123688266b.47.2026.03.26.06.50.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:50:33 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-667de793310so1696638a12.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:50:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbo1U/mynOJaWJGFtDgnrw9oIZ7tP9gS8vv1bgw4LZ0+ec61mGCfrVIk4IGGzLlwFRmuo6a0PuJO0=@vger.kernel.org
X-Received: by 2002:a17:906:da02:b0:b98:2462:959d with SMTP id
 a640c23a62f3a-b9a54238a19mr468792266b.31.1774533033140; Thu, 26 Mar 2026
 06:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:50:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbdNPMxPzf1hHT5vO9CVCPsL=UMtbvEXF9gtQ869ve4Q@mail.gmail.com>
X-Gm-Features: AQROBzDNJoDmUl7Y_VlwUV8V3o47tmUPgQk5SBKE-wsihNwjTg-QGGD52bK1kjo
Message-ID: <CAMuHMdXbdNPMxPzf1hHT5vO9CVCPsL=UMtbvEXF9gtQ869ve4Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
> Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5 clocks
> compared to 1 clock on other SoCs.
>
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clocks, as
> listed in section 4.4.4.1 ("Block Diagram of the Clock System"), module
> clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7->v8:
>  * Fixed the R9A08G046_ADC1_ADCLK macro value 138->139.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by DTS and driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
