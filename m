Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818522C326C
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260426; cv=none; b=YNNc3maErlL9CwaZFF2WujWgsxCNJylYMVxdYgz3J9NTYl5nOchAwJBrrSLYYWabFRkHZghYkdVALLD4X7XoYEl72o7Wj6wNvq7UeZPuyF0a6RaCo5c+UERCTaRKEQHYFhVFN1agY9FcMu/eI8E1LHMxD8GnVcJ0qhZ2BRQUW+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260426; c=relaxed/simple;
	bh=4rtfzK78cXnQXXn5kiIBDF25UMoQQqWt2h3HDykkAF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2jzML92jp/J8yWHprFaL5o7UAdE697h6p82iBXWIztYwunB4IfUusjtJv+JRjQA8ZUwSGFXVGKW9PDmjby0OIbGKV13Y/8UacSeS+ZVd+nq1a8fvEIcU0d3/cLFJAhXiapT4uOYcvTAXRroE9sW+0Oad6XP0Qj2Idhdunrhyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso597334241.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 08:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260423; x=1764865223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpFIA721TFdBgfKpmAY4zHoBkrJAMnblEWl8naPJ3qM=;
        b=itZ7f73IT37ytGtYK/AK+Vrp6yUOdMPd3NUDw2o0TmxnuO6Bsvg8pnn/CWg0KXatFo
         0c1lUAcZu9e5pxRvrHZSormFku2aKZGys3M8+JnkEETQXFP6yCJtYFyJfvQl+eyFhRLh
         3rl6mOAs03kkEYByspVoyboqRvaxnIppmW862+5y/v4sUhTPCFCtL6yL3roHhWcFXfaS
         AujUAqkHjq/F3lPkNuVfwRFKYzRe+MHHWfoluxHSQht4oO/AYStAKCpMr6lR9Kdd9q9x
         Et528/XidFAAl3/j2kton4L0bKB1eWzaNTmJl90sD6014dwGEZJoc8h+GyyUdr3LZoWF
         6mCw==
X-Forwarded-Encrypted: i=1; AJvYcCUJbls3S6q52db7YkTH+5ac+7gszUqa9MioNFlBIQSM/iHsdFTaaOO/EnVysyAyEa3o8VYGcDMm6wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXdCwMLpG41wbdtgiFNJZjamrqpQU0HanJ8330pN/4XGQwLRUp
	GQEROwAgZx34jc9kCfljqQajX6EyNhuruJ5XDBQk7A6FhYWPDgKL5l1Xhu5H0gdT
X-Gm-Gg: ASbGncvB0x9lpNoHye9y/rcy2FModIKRezbmzKJuAtt3PTkVUPvHbD7tw489jK++4nw
	4IjlLGkVRwzAFoF6VLowj+Ay/H5PAFmSiEXNsNDDSIDstITSNqPNhVQNCE9ZUaK484B4aWDToDc
	RXLFmnxDltiD/lbFrSBHi8Z1M2zXsA4Aq71LjHhNWRs8mZuZSrDoSEgxqqIz0EBv5EsyYzgKWcn
	Cf8dk3V9wNXPqOtndiU3lnMEHPANpU/+Sc/2swvzPVQaEHsGn9SV9iNGhQKABVr1ZCXsY5ovIfY
	Hvc0WTI+pkshicIalLXiqqwyo6huY+hZ+AQ1BrWLWyCJBcQSIBTHJiCGkPjxPCsIVAU0jc7y6bf
	xiEbp4TY6li/Tk3rDYXqYYyt+HIf39k/RLdbUeh0HZGUDgf5pRfx6zw1zX/bw1rhs6IPTJx37w+
	AiWsPDHFvniFpvPI/VBEqYoF0dUGX6mb2R8dzufnNr0FWY3QV9
X-Google-Smtp-Source: AGHT+IFl7uoyUvcmP/B8ntu40BHbxAOaQURiXaWhXVLCJZwBLiRTXimX5oBnKCMCW7bEjWkkgOv5vw==
X-Received: by 2002:a05:6102:3e25:b0:5dd:b317:aa19 with SMTP id ada2fe7eead31-5e1de0814b5mr8260018137.13.1764260423416;
        Thu, 27 Nov 2025 08:20:23 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd7661ae8sm726757241.12.2025.11.27.08.20.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:20:23 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso597323241.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 08:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxbDu2rdY6p6rkKNZJgxaMuGBbHy8GYfUyzUGUQlH8f6IgCNn+BCt8bvrp1CDfjk4HjSANZD/xyZQ=@vger.kernel.org
X-Received: by 2002:a05:6102:3909:b0:5db:f615:1821 with SMTP id
 ada2fe7eead31-5e1de088006mr8004050137.10.1764260422540; Thu, 27 Nov 2025
 08:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125221420.288809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125221420.288809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:20:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtAxDq9MH0zR1keWnJ1nLaqTUDAVwuN-ngTJw9UbLVLA@mail.gmail.com>
X-Gm-Features: AWmQ_bmc9OUlv9NMena3T4POG5OSA6IiYFHh0B_sZxbPumfQc2XjQuB_ds2kumk
Message-ID: <CAMuHMdXtAxDq9MH0zR1keWnJ1nLaqTUDAVwuN-ngTJw9UbLVLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a09g056: Add entries for the DMACs
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
> Add clock and reset entries for the DMAC IPs.
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
