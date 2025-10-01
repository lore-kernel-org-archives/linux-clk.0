Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73801F152D
	for <linux-clk@vger.kernel.org>; Wed,  1 Oct 2025 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759305338; cv=none; b=a/pJuGlzj1KraYp9V625Y2+edZUvBZguBih+NePrNxB4WYfgJBGpcVxXbYGQNwsmUgLSRik+s+dgLEzf/p3mP8t8nLz6l5GWz2uPKl0nHc66/zFc1e4UosBlHc5dksHjHZFtOuKAlv4B2SQKTCsJMFrIreAIOcz6CdOSS4apZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759305338; c=relaxed/simple;
	bh=b8AgCRlya9OQ9CBRMXjlO38VhsfoP2czQE9ot4OwTSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdprq7YIt+f9dT8qohNabvWPP6rT0nQofrCJYsshmGI+WwgUt0XFoY1WKGuWo9YhS+BfyNnw2s9mcNjlnFFJO8YK/q85uLd7ffxN4P1wssz6gLEcJ4zK8bQIA/x/rWgu76D5NbN76PzX0uXbKuUaO8juO6jauJY70PqtfcwCPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9231a251c01so1584988241.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Oct 2025 00:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759305335; x=1759910135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvnNDopHOFz1JF/fDICYOtzGd9DeoBLkKWAzTubP1lE=;
        b=IFlf2TikkMm58ZJHVBlggJiUXerwsQZA3MKfFoQRMOAlBiLzVMAq3YNFprda/3gRoi
         7LhRodkZKPHqPRv9+pSFZmQe9bvCz+rQVB6dIeR3jR0UiMxjolYqaUZcn+lBdCSOVoEG
         ElhixspSS1bdF02OsGZuEE7r1FY8LZuh9WMRd4/ZQiVTzysqiVNQ06jYomDZ2vzjbz+f
         Q0M11Rjr0UPUzu5tvC478HpUB32c3tSu2eYXAiN9m3hQYk0iqBVczTe/oxjE9TJIIcil
         F7fLaGV1cvB1fUlIqVsHkRvwZ/kQTkhFklaIL7CVZO6rA9TP3s4L9fgJRfaTP25DZLZ2
         GcsA==
X-Forwarded-Encrypted: i=1; AJvYcCXfph2tjKbG3hI5DEOwecAZkpXyo3SFmIufOdBWfajgEri1976CiAkDWthCBvv6TIbGhoNcB8QTNOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ32u9/STG4l5rEtEVQ4mvQXYsHpRz0gb59aMoZKWNtarNIWiu
	Y0M21HIGjRcUQAxI4A+/v34RW3i7I/yBF/y7izcDweoI6cu8q0f1+b1QgddPhrs8
X-Gm-Gg: ASbGnctAtLj7e3w1+E7YaKU811rErb5dzZM3JGKEB6tVHnz901B8+BZwNxqL6JUbxpu
	ciQg4LwGc1yL+IDUUqJlmX3B7br48JIItW4fjJfEuVfxVq2wbi0DGAPJFuJ0Fz6Dwfi/ZiNt3EY
	mjAN+a6elLD2eV9kpcpmR8noylOBNN8UakvKCiU3mWmwHDz6Lyr1QdcObwmZH4JOwZABFE830Pr
	03tzgaJ0P8P/K5J26cr2q5sl69Z+vcVjkOyKObDUnRZw7LkxPeYZq839krlbrMfDgxprZr00rzn
	LFQiFUzO8L6KLR9TZrdZEN457ee9v1S7Jxe+57sKTrIlUd4N8WbAoojJVpXwRKSrgRHJaJW0XRC
	OfcXCXfF6aQYRuwJBe/O07GjTn9Fmv3LAlUEZyZT6tt02M0t9FkQk23nwPzHCjmcTPF4BUD6EcH
	crMhWJbOT9
X-Google-Smtp-Source: AGHT+IGPEZj+SrYMG944SkoIwkg9kptZndaE/xiwBoSz3j7djhgpPZfE54/+G9dsrfeVxFjjDB8qbg==
X-Received: by 2002:a05:6102:4410:b0:52a:c340:11db with SMTP id ada2fe7eead31-5d3fe6e4c32mr886086137.27.1759305335360;
        Wed, 01 Oct 2025 00:55:35 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d8788fb4sm3459860241.13.2025.10.01.00.55.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:55:34 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso4064902137.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Oct 2025 00:55:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVX0PQaJdbnINaoCHNaSgxxWUTPywAA5e9D2CrD/sJM6u5tFt4fXcQrtDEFCOpiyAPw4N3kehWXzA=@vger.kernel.org
X-Received: by 2002:a05:6102:26cc:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5d3fe737ad4mr874548137.32.1759305333725; Wed, 01 Oct 2025
 00:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 09:55:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjPCO=zVcY-XYWrPMy8sQ0iVM6_H5OETp3Z7sF7-XuYw@mail.gmail.com>
X-Gm-Features: AS18NWC6bgPbihdC7TOCws8KQBD_RqLtxEbixdifNkAXI7livEOC4tq90cZshW8
Message-ID: <CAMuHMdUjPCO=zVcY-XYWrPMy8sQ0iVM6_H5OETp3Z7sF7-XuYw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] ARM: dts: renesas: mtd-rom has no clock and power domain
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 30 Sept 2025 at 12:17, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Addressing this dtb_check...
>
> arch/arm/boot/dts/renesas/r7s72100-genmai.dtb: flash@18000000 (mtd-rom): Unevaluated properties are not allowed ('clocks', 'power-domains' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>
> ... I came to the solution proposed here that the clocks we cannot
> define will be marked as critical. We could also try to add 'clocks' and
> 'power-domains' to MTD physmap but I could understand some objection to
> that. Opinions?

I would rather add clocks and power-domains to the DT bindings, for
two reasons:
  1. It describes the hardware better,
  2. It avoids keeping the clock running on systems where the FLASH
     is not used.

Does mtd-rom go through drivers/mtd/maps/physmap-core.c?
Then the clock domain is handled through Runtime PM since commit
0bc448b49e8a017e ("mtd: maps: physmap: Add minimal Runtime PM support").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
