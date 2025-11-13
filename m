Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC6359F95
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 16:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052867; cv=none; b=kDI8mZ1E2hICU4LdyjrdV6Dbi6/FoSlmPSfEpa+MPmBDreb3FpPMit9zkFn400vUHR26N2oz+g8vKKStywnTH/NlnOlKxO21MDSB773yIiAVbDnLcsgzTamvBR/bWOWiF1nj0GsYuG7YCa9JHlK5LAhcegGib6XD+HnrnGzGDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052867; c=relaxed/simple;
	bh=/w7U1lULN0Wt5cy2n+o8BXmaQCUvdOw6lpumB8VVy08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5EB4QZRCu9x6lWzkllhqOCpiDxlQXkKyEhqT3trfSv9j2xxWU/GVuvMe5ynv1oJcKbAd2c+kgHTijRocajgYv02IaSN0vWUAY5O9s36HqE6S1pps0I4MnFP/b8z55jT2JbfSUeYzKRHQYYUzc+GU5Pqhy2fX9+MOReJahreaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55953d7486cso604698e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052864; x=1763657664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiVTOOriFml3/StIKpZ5dwhW9Hno3lDZNqDkWyJuxDU=;
        b=p8fAdIU7Rja7knbEYJhxBbvedVafILlUizH5JHvz1Aqf4hW1tGcR1MMSICNT+HA6ev
         mfzy3WZn23yqN/gjPkNLmU5/ik39MCUB9QjmAMbzUSnGWphl5sFsOa3PBNEY4/fjsrLN
         pfsiGRaIi6iCFGmIZIvlXCNI3/tP5FBQ+cIOolsDY2INgAsNvOlFNMgITJ/GlnoTD4wQ
         XWfZaIBNF1+d5XCF8gdXdtmxV3ledxTDj4wEUY4y88Y6Hu8SKWmrKvmZVtfi9mQro+no
         rzSP8AVzogCYmTzTfCqbo+jKnn2Ni/TWccVYpVRlzqlnsnkzccGZBHf3xJiGH3GQQMA/
         Mwvw==
X-Forwarded-Encrypted: i=1; AJvYcCUBywmpa7NawJX5ELP9fUNdzPqSrSES7u6vC3u+4s6Z20lKlJB8Fygw2rV5HCL0OpHNAhJpWdydxNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP6HqHbpMpg0t0BuNq7dub7gAiOuMMXTf9g0d2Q3c/hmvkoaFd
	sojW8lGcYNV+KLtFsNBIc/r9Jy8Og0B6SOEejlAtscgjQXQL/W681zHt4HXCIB6XNVw=
X-Gm-Gg: ASbGnctS8zneWzECJAtuCKwkq2fr+5AUW/cvRXJP9UXy7VzrmD3BBXUq298K2L9+PBw
	oqSeLohup2GI+syeygTA4N2szFmkchv7G8oqlulJC7AdhkJviJm6oaW7Wts3fT6FMhVa7dJANMw
	JYnTDs7wqCYlJyO+uWO3T6X56Oe1NtuUTQ2g9MSmHEZ8nxIVQAf6QbWIIybq6iI/yYkL28VoDNb
	ATObhZ+utvLhAlnTRHU+rT7heNS39Vu7e+Razuc1Ea/JD2cJlmapLmsuBzmA6Ek4bLJCGKUVEBU
	IOJCMj7BrvNvd7wrsUnnq0icfbzJJjR9qsaPt5RCyNwYUZaAZXjTDi3Tm3Hr/qZJPACLkDpk+I5
	JgqeY5zG1eXulPB1kN7ot4m75xCFCBa1XLIkneMDtfH0Dtzh/oblBn5PGEwBrtGF3m7IXVURbnw
	YKNro+tJ68TkZcYNDAZTRK5yFuXwiv0PACSS0mCw==
X-Google-Smtp-Source: AGHT+IFU0cBXtVEvRf/IV2mtNyupLEtvQtPQYxW6G/jO9y32GCDJ20uxvQAMZTD7v7mIz4xbzR46vQ==
X-Received: by 2002:a05:6122:d06:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-55b1bd05a9emr212305e0c.4.1763052864290;
        Thu, 13 Nov 2025 08:54:24 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f499b5dsm937981e0c.24.2025.11.13.08.54.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:54:23 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dd8a02e808so807083137.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:54:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWt3wHKw8JpBgVJllb0NIZIhjeG/hdGD04N2Gsrrib+BbIpuCjPr+bXmKKsaulj43Y0ndP9QCwigfw=@vger.kernel.org
X-Received: by 2002:a05:6102:4a91:b0:5db:f5d1:5799 with SMTP id
 ada2fe7eead31-5dfc5bcb984mr194258137.33.1763052863591; Thu, 13 Nov 2025
 08:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251101050034.738807-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101050034.738807-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:54:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU6V-wQfiMPSE2k2Yi3dfWCj=Mp-3DYLwqHEWumYhxGSQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkUtT4Rsq0h-4oIRE82Mo78vsdX3V5yvPLmFpsMCot8nqUOZIzab71zY8g
Message-ID: <CAMuHMdU6V-wQfiMPSE2k2Yi3dfWCj=Mp-3DYLwqHEWumYhxGSQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r9a09g057: Add USB3.0 clocks/resets
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 06:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USB3.0 clock and reset entries.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
