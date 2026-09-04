Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126844F30E3
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534803; cv=none; b=IWg+P8gjy9UnigQMTxx3mc1BiiJHihUDeEg1rW9hK6rA9zs7pYakHmx68ChqqIspwuccdp9scq6tIvjjCv+Uuldjdo0fNyXz4oR3WTUjwmp02HVDhZSOlcSVRGXe9qdH+PAa8yNUlCTxf+pbc8iN4PDYxF8KP2rJaIK/xQnlSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534803; c=relaxed/simple;
	bh=JKMK2CnzL8ftNzdqEBL6ZbY15a40r3hgTJf4pBsjvSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kz5djjPAGtsrQi5NwZPLCEnyIrZCHaYpQV3VV9hm7H7aldybegP8czcK+D0S4FgS6d85I5urGJWAqHwiRTAqZXYO0WdqbOc2nCRLvI3jcQ3iSnRsZ2/E8WFf+fUG9Yt9Lx6U0enamjsQUk+eVnm6v3iLWzD3Uk95DiUD1rpnkOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c67175d176so526075e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534798; x=1789139598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EH26aGan0gGqVYE0IjLU+OD6hNNld1CIjczwNKp7Quo=;
        b=S5TOBp0/D2S8SIjByaUcqbjGA68alZ94bfpB2+YJ/l0tNN24krzPHLTOcwZu3zZ0Ks
         gV9jtC77WSvcU4GrUnNyN+15KDKQEwK/oE/adJuF8+c5KArKwDinNdTBobiWovcI3kbF
         u6frfC9x5dSouGYo1xMnWRPVnUZyitTyI65PO9SGlkcRA+++3IRn1tJ7C5BGr9qrjdi4
         UwjZojKI2lvtbDNUzVn5nvN/ZgMJ/m7qJ27VRiTT1BiI1JetcyVrBWwulmN++pBANaeL
         iZqJLMJozBntuStHfcjJSFoYavLC5s65sVVek2bYQN07IjN5SZwA/GagulLR0yGyZDFl
         5Yvg==
X-Forwarded-Encrypted: i=1; AKwUvBz/nFxgjVeBcN4ra6L8Ebm3509e48AEmS3F/OF8rA0WL5OyJ1LkxXy6VHsX66VjJVKRNQrCifaRjc8=@vger.kernel.org
X-Gm-Message-State: AFuF++ltmQXdTa/9UxrFxsDVL9mJx2z5s5ssENyxlzCVLwsC7PFI/IbI
	AKC3Uvz9NLQXjEOrPYdlCxlF0vuQFLYluskmswbyja5mlL3AiQUzpcEBiGPHwx1z
X-Gm-Gg: AYBFou3KUIFG0nsW1gLkxfXvPPd2gLINIf/NozQCTIKaumAQajlN+10uCcf2DNDvVXg
	EwbckgKIhK1GhZwyQF2G2UVD+5iwb2a7GRJHeeJjc3TGUMd9UaNgWJMQpcD8E/qav5MC2ZFOvIn
	tm2wE7XiSR+7GiLnaSZ9920NZCF2yGQid5zL7SyW+7ppVs+ja9xIa4NsgTswWycp5ETKRXMgj6A
	S/2Je+e2t03aEUFYu0l4+v/fSTm/W2U/p5CLYBu1BDoAA4MzwysS4VS+/PdNUy3yTtXUDrso9QS
	inB2Ph156ryviDFzdIaYJ0F4PYF0SkxZVuHmRgBTRMqVHjM+1i1vEEvotbhOFVyYGOutqZhrzD/
	k8yoMFB33i6JvkjKpCBa1mXudEWaP5ojscme3jbuuVMJCdulRBEN42tGcxLOyD+Q6L7/nCrnLEF
	btw7YH3BlCVafhhpvp8uS+jnPTYUAkNW/3LGioYs47c7CAluvF6P4DCLoMaGOKW76Aa4U81UN8E
	EsEZWFBdz/yUN/mVJLDauYz8h9SFQ==
X-Received: by 2002:a05:6122:794:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c7ed437367mr2590413e0c.8.1788534798179;
        Fri, 04 Sep 2026 08:13:18 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ebf559cbsm2361276e0c.0.2026.09.04.08.13.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:13:17 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c67175d176so526042e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw/2PMP0qRN+roPuDm2pAXd5HixqHSZ6/UKjR/bsBJ8N9cbLAp2WuQgiUCWqEpNgMqaTRRrC/LtkhY=@vger.kernel.org
X-Received: by 2002:a05:6102:2b9c:b0:784:b9ec:913f with SMTP id
 ada2fe7eead31-78a4a6c8e9cmr2072720137.5.1788534796061; Fri, 04 Sep 2026
 08:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-7-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-7-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:13:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOLRH5CWwUBkb6odaX=4t6eDnd4onrkgGfvwgPc37i_w@mail.gmail.com>
X-Gm-Features: AcwNN1VLaUGS5m2MWtdAilN8Kk2snIGRLTUTYNqUMsLJBTkMdKQbkgJo-6rNerQ
Message-ID: <CAMuHMdWOLRH5CWwUBkb6odaX=4t6eDnd4onrkgGfvwgPc37i_w@mail.gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
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
> Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
> Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
> [RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a774a3-cpg-mssr.h

Missing "renesas," vendor prefix.

> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A774A3_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A774A3_CPG_MSSR_H__

Missing "RENESAS_" vendor prefix.

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
