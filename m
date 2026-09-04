Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D63446067
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534062; cv=none; b=fJ/FhRtWBP75dYQtpt750IwBYRvZjuNSz8q3uGBRk94zuIi7uGoTBlnbjc9hBkuZxzRFimO98HH7dY1p0P29sBm8PDrayRINGY3jLoOUL5/ywNjlPaEILVHCfFS6iNTC1BbSIpnZs2adawMJyEnkDgjeIKPvaikdTMgQKZCvjJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534062; c=relaxed/simple;
	bh=dxuiJN3F+W/TTKG8/DBhxTqg4U9X29/XkWqF1QF1YkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfoaWdGp1Cd+y3phEGdIEC7WtG6GcV4sFLFq6qk20wrd0XOPgoEJiD5ruS2WOTmnfYtoFNt78S0Cdy2Y1Zof/YvJBrSmBsaDrhuW58vWLCnY7at41kODX3SD/AJsU/Ji1osSJ7unU7f2EJB3Lfp13KUs8l4u9nbOwIqBKoaNBDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso309480241.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534060; x=1789138860;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bIoiHSllQkJNgmmben61gMxsX8BWtDH0S9evEzpoUUA=;
        b=AMxW5Wwlx3YzXUFcnGQzbCYK7GLHsHSBpRPrp4dBJA16dkCkvOh1mTx3MacB46ItAb
         RxNSDgCKqldhWwo1g9shirM1DckViK0HdehVcZsND7UAMYeJMjagjJaAYjW7SLBjKoGm
         rR3zxZKNAJDbDJqkC4GoTRKIdYI90coIkqpxJzLL53jJUj8v8bKlDGsi3CjCNYCoaKew
         c43L+So9sfaKJWvKisy8ta37ZpFphEgcYFdOIj8oIueTK+/m6tkUUD/J/nY2eX53AZJc
         vXeSMWSqaUa3hbszI/ZIfGYo+hpT4PBY0WXGCvXfkETBTSLrdab/WLC5NP0VFLfoNXT5
         Vcag==
X-Forwarded-Encrypted: i=1; AKwUvBwDXJub5AslDrtJnVaQbwgLTHyk7ffbF+Zjmoly4sBj6tEQA1TjKbWdyRxsvrKG9JIcCd8jThmsMlc=@vger.kernel.org
X-Gm-Message-State: AFuF++nSVImEvJ9gYm/MfIt11vtz4GDk6LiMJreCd8/6o9bvS3njjk+P
	3sgeyCuPlpJEAjK0TC49JY27JMMkw6vLhzLTc5vgzwPhaesFHISwT+Aatv/6OkL9
X-Gm-Gg: AYBFou3iM1p5sCx9k9IUuQ/WJvhZRiQLmQD4vH0kzlLPnubZG2mhZW3RiYBmaYQ8Vwj
	qepS8nzC0XFx7++Pl4b4Mm1pvSUpdisOvjY3e1qJajNuYMeZXRs8tgLxMHIzKeQ2inVyEkOASyv
	xnRMZFYDtcdDbNKbG/zziG6hmQ15UjyY3SSlkR/DlG1CIt2nzqKbqduo06teDrcT8W7jNQa1deB
	9IUDldf2tx10RcQU6czGHgAvRgWGO4rAaWh68I1Qmy7mcuptM03qj4Gijm1oLPs2AR399jDV2oT
	/kuX4Xd48pMxhK6ihKBUnHxbwpsBv44nF5o3apiMpjDlvasqdAfuqEinbiMSSnAFfplpZFcIOT7
	uuVCe8ODs6toj8E/ZD6R0mgGWoT4NVnEdOFBd57MYfPMfWjc5xvvSSB2WnU1ine0Gyj/wYj5mAx
	50ffnqvEjJz14Y/1jAh3LfZ1IPRyb6NtXHXu5jiW3Xc4DAYH6kQQpfaXPg07UgvlwdYxSAYRNxZ
	GcS5e58CB8ItGjL6yBfkEdmMV+06kLkQiUtA2DH
X-Received: by 2002:a05:6102:160e:b0:778:5369:763d with SMTP id ada2fe7eead31-78a4a6df1c0mr1977873137.1.1788534059620;
        Fri, 04 Sep 2026 08:00:59 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478bb21esm1966344137.1.2026.09.04.08.00.59
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:00:59 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso512493e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:00:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwvgK7+Ppg8ReBy3lIFyzuFcqqLWhslI+bBHX0idV02GKmSZzFLQl6pwV5fzI3EQDstwzbqBJUtKQ=@vger.kernel.org
X-Received: by 2002:a05:6122:8f8d:b0:5c3:61c2:9ec6 with SMTP id
 71dfb90a1353d-5c7ed456d8bmr2814332e0c.7.1788534054755; Fri, 04 Sep 2026
 08:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkkKnEsCKTcNMyr-WMvp7o5++Yg3rPR2f4wao=-weRoQ@mail.gmail.com>
X-Gm-Features: AcwNN1XGMcfTKgzVCocL_OQ77Hbdu56w54bgvUPYdeBOHMixmFG2F9qVHqoWoGg
Message-ID: <CAMuHMdWkkKnEsCKTcNMyr-WMvp7o5++Yg3rPR2f4wao=-weRoQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> This patch adds power domain indices for the Renesas RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/power/r8a774a3-sysc.h

renesas,r8a774a3-sysc.h

> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A774A3_SYSC_H__

[...]

> +#endif /* __DT_BINDINGS_POWER_R8A774A3_SYSC_H__ */

__DT_BINDINGS_POWER_RENESAS_R8A774A3_SYSC_H__

With the vendor prefixes added:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
