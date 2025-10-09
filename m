Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAC13D76
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017702; cv=none; b=MzB4XFUfrsCYdKIAnzVF5rnAiQSKm7k+JX5qJ3JZWmY6910Kss4KkWCPCF4wOKFdcIxyJonAmzaIfFWiQUJIthYpRP+j8FEbzqyieRR24hWGGrruW9U9Kv3iMG2lLNv8sceym1+1b7hCe+IM+g/d9kOPvkevymrfYcnB4OumKRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017702; c=relaxed/simple;
	bh=JjQpoyc0JbwG+FEvkuaWThczaXfrHcuUfCyMSt2Iwi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1gnsI4XCHlyt/v43HxIgO0b9ozcu7P5ZVMxkUsTPb5QBCQS5I0TuriJQCFwk820DDPYMAnXGrNqdGTTWBrWJpv0dcpFWPaCRzoFojNGWkGji5eqN+76vpf1hsDxh23YAZW5JxE5c3qnayKmaxzytKvuIsaFWCL0xhtartGVamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9000129f2bcso641783241.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 06:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017699; x=1760622499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8nqM9b1HtBdmvYyNLXKVVMOUuh6yunOxpZ3Ex1Hy4k=;
        b=iIDNBA5CwsAs2mRNNWe43K9ZWPpXefhjDJWkQoTlNijvjL7UUdrAHWa9vDGC/ITzbS
         970f0qykin5Zex9skxPsP1BUBv0PJUjs0L7C3yXijj1mvaFlv5wFuOGuTXitBayZZ979
         qaeE0YLWspN9HqViqzJRT4CXo8YyxJx6bLE9npMi91bby1ov/f5cvYjtaNm9g0c1i9Sv
         qw12jwxXq53yQT7MB7L2PYIyDEjG2j/SYly8810/qZt4n9EnitJYlNW7xHCJ2mC4Id8O
         Yb9Ey+PLBuGNgrEzuppk2oRUnpgsjRPA/flwTV6wTI/m8aRK+tcqLz4cwrq33cdlNPou
         /qNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgC5GC1ZCQDkbkBWi4oVbADXiwsYI33oaIfCZYg3Ud5N5quBJ61MyeNMwcZA+b/DytycwL6WY2mnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws61GHKvilkvI8bvSnZ2Uy+ucPj/HPh+G4TYmzwVbl3IgRhGch
	dbsbv6P1R9Cu/qPVnNnEnz3FK114H8XksABaI94m4N1YLXfZW0ROVaq/dx+S6PfT
X-Gm-Gg: ASbGncsLGkxb6DlixZDu1OGgcuaXQNjyHt3CnOBGFr/NdS5nWawpTjbXRBjfI5wJGvV
	VTLoUaYBPenoqkQuP9/P20J3NQm2vwlQNHfM1bXViZtU9dHxCXAroApZA29J/USPYt9bN3BJKC5
	XIuGO76JpNDaby08PcwTBBmkIT0zGEe2sdN5wMCx1z1p/EAzNgby2+zGngAptufjbsfe5wk23u0
	zv+PpXWuMfHCHPn6ezoVvkcFJaVvYjTYvSxPlPCJav/lsUgygQOIH2vKKMmqxqlMc40THmlnhQv
	zGk7+8ZHSnfzG8T3FHsnCgdYb9ea5qaqEn0hKwrROhLL2CrsFs8oTPvO9WfI104/qVC8u2Nz53+
	v16KBJHx/+GM4ws5m1CqB/Cbas5Ry1NRVWwJRQNr84H7UsUYLIrHouCJ8AKWNzDd+JbTMQ1oIQo
	azo52iktsudk52cOKcnbs=
X-Google-Smtp-Source: AGHT+IEAozq2A3iyDLzvXgHP+eC4ZVzC0Fjo9u1jokV48y3vklaNRv84itHuakTfmOjpuR92ndI4JQ==
X-Received: by 2002:a05:6102:14a2:b0:5d5:dcc4:bf47 with SMTP id ada2fe7eead31-5d5e2202de7mr3700587137.9.1760017699349;
        Thu, 09 Oct 2025 06:48:19 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39d184bsm2343667137.14.2025.10.09.06.48.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:48:17 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ce093debf6so987718137.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 06:48:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu2AeziQAPtwY/QPWQm7p5KC9E4LD290wwRipTgnO5LHd9Zo2CY0rLi27LI0hFHGqy7sp4ykcIhLM=@vger.kernel.org
X-Received: by 2002:a05:6102:418a:b0:520:dbc0:6ac4 with SMTP id
 ada2fe7eead31-5d5e21d04b4mr3948255137.2.1760017697372; Thu, 09 Oct 2025
 06:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com> <20251001212709.579080-9-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20251001212709.579080-9-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:48:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHe7KWiUiLLTYpn2xhq9B-xUoZ6pdnTst0NTMMwuKoow@mail.gmail.com>
X-Gm-Features: AS18NWDDR7-ixkdtwTI6rYs3jroTCBn6LCN-Tix-imcePNZM2CXum5UmVX7CU2c
Message-ID: <CAMuHMdUHe7KWiUiLLTYpn2xhq9B-xUoZ6pdnTst0NTMMwuKoow@mail.gmail.com>
Subject: Re: [PATCH 08/18] dt-bindings: clock: renesas,r9a09g047-cpg: Add USB2
 PHY core clocks
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 23:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add definitions for USB2 PHY core clocks in the R9A09G047 CPG DT
> bindings header file.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk and renesas-dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
