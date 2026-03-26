Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360C3A3E66
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549457; cv=none; b=uJbFbcV/SeesxzoYHMpEONu/pPo+N2CHG/YrBd27/AcgmwZHxWlu2EylPvUd6vq/2pg1yiEISSkvwjBlsuiofM0mdCSQjkiswoLGBIQ4SA3Y0uDntskqpKAC8yswtmelB5r50T1e6+oVnTIJ6Pdq2GTMWDCo3hyPqDAT45MLG+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549457; c=relaxed/simple;
	bh=tO0kKqMcHiRW4jgj+xRAYt7gnMl3D/ehWiA/z8rWMQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFK/pkrr6f/9JZ40NSllkaL7BqYkcJ2aiSUb52R/jle7yXEDg5DRM+OUm9FNyUqLHNMBSBfh9gLExa20e7KWR3zKx+4dN3H9ZylP4k/68G/YjfCsY+C5apy9wYJ5BVXEUAgDhNyDvfLuKi3uz2V5+Y6LvQmNuVZv6we+OKt2MrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-951a4e8d1efso235363241.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 11:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549454; x=1775154254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj75loc1E52Z/CUJZse9tw6FoxbOVmuknNYD8Ky8Q+c=;
        b=kuOsW0f0oJUxhP1nRt6RvJwrQeLM1SRGa8V3j3qjL3+LevbLgccIhQuMu2x75MdyJ6
         5GcL8Y1V4bXmxj8nKVynCfsQrlOhRi2TFr1ZME9VFNJUMEyKSiZTQ6C+lUor+NFOTzfk
         d9ZKWWSS67AB+7CnAing2v0w6B6UMKbJeK3YGKkHVjqAfYqCu0/wYt405ABF5vNd8+sH
         LxRJRzpBFvP6a1XSZmy8WtO45BpfKrHYkVq2uWB2QXXnqzT+cWjF4Gk3vvr50i7gRx5U
         HDBCzUQRGy7qMFTw1Zen78/bNV76lNh06CA/UojnyJUIGBPMRS/l8sg+u84Qg4J1rEjZ
         8cbg==
X-Forwarded-Encrypted: i=1; AJvYcCUe0j1GKU5/IDXE3ECN8z6bZVtpsefLEut2HHfsJWZta33Q32jGnnk6HBF8CKbJLR48oRJnAxEj3Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2FLpLBjAdcSSPupUoOMVRWMcginTHD47FWUJV9XDN/3dNIIXh
	N+H5yBx4NOe5GAHxcMbCmSr4u22XDIHD8p9fgxB1IerJVZmae4NXzc6pXNYV6hHyxCw=
X-Gm-Gg: ATEYQzzif5BD1IJF/RsZPUGA/1hAfRnI2vpJRdoEeccje7jmwxXb9bQwIrOZc+FF9Oq
	2mL5mE+IRTFRbYxMq4K6XxL4/PllUCyt5k+bcqu+V2nBDMpaXPmsPok6isUIQOqu0YbU/r+JthZ
	U6DFx2Cgq+XU5Ig71XFVs0HSYBZKW3nLk9xUUucbCiYbhNjZazJIfWLAwFtGCSEJ9055452jrVY
	dUIUc6dlfRGamYkYA4UVC81RTM15Vbzb1CmgYECWxOWSsaWr6D7yQU8YpJIPEgYqb/n5qBFBLTB
	tla7KcozpXCdj8zdt6OMCy9UPiOX22b8gpNgf9k8/W/+5NsIdS4bnwkC5gdlyHU9SJYCoT69Amp
	cIFq1dm4UThqP6xy2ipKpEjjmo8pFp2Ok0R3oV5WjMMiS2Uq5tRyID0CVxx8IfNsTCRspmYNFQ+
	AMV9k6p8WGj3gFCJ+vuqIW+KxGezTZCgaZfv6UUHNv6C30ZtAQ7Yvmmv7EUYEW56CY
X-Received: by 2002:a05:6102:800d:b0:604:e063:4fad with SMTP id ada2fe7eead31-604e06354d7mr1343768137.12.1774549453698;
        Thu, 26 Mar 2026 11:24:13 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1a149asm4542934241.7.2026.03.26.11.24.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:24:13 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a9076813bso740538e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 11:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV90xRDBeMtE9Ex6VbbqdkiAhCwZ0qpCsK9Q5PuXtGZtBfmUC7i2Q2XRPjJVdUJw1LV6k7f9sXR3Jk=@vger.kernel.org
X-Received: by 2002:a05:6122:6594:b0:56c:d757:a045 with SMTP id
 71dfb90a1353d-56d220616ddmr4278555e0c.9.1774549452747; Thu, 26 Mar 2026
 11:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 19:24:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjLuAWrADbKY9QqD4MY54G5P_jaU4=4aHTeiZXaoR67w@mail.gmail.com>
X-Gm-Features: AQROBzC_p1Kljv4QwMsHpFr_0owHvWZf4w8nt4uS54T258NW1gw6G16asR7xggw
Message-ID: <CAMuHMdVjLuAWrADbKY9QqD4MY54G5P_jaU4=4aHTeiZXaoR67w@mail.gmail.com>
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

Hi Biju,

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

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g046-cpg.h

Missing "renesas," prefix.

> @@ -0,0 +1,342 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__

Missing RENESAS_ infix.

Will fix accordingly while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
