Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905F8D531
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714604; cv=none; b=i0oSl5g01CI5TbgROyywQacRJEF6ZV21py9GHmsfnXT8v4tLX0+dEZ76X7kIZQudxk1ACOQhtrRyomzfbI9AQ4Pl2bu9e5F0e/3XL+FU9tOjgKjhLcfQIP8qcsv8C4wC02LFncZH8vqidot7lyLWEOU3bGrLaLXbv+DJo36tMXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714604; c=relaxed/simple;
	bh=9tehMRz08WQLUJ/smHN3UjG/IZMKp1SRULcKii4ippo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+ATT9keZWDBEDdcw5CjK/fffwJAzqfSCh7E1DeB/zHo7Iz2CwOjHWMCgUqNoj4EyLue1UYXgUZqKh1iuB6mQQYsXTclns/3/Yt7+H4CO7xZgusADJPlGl2g1WmhWW+fnrploq/0vMVTP+gXgPf3DA+Jy8XO/WnqWE/skWtQ/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso438432241.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 04:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714598; x=1759319398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UvM+/QBcNnuTK2u1snMXMO5HJEe0Z5rWe+7sqxETZ0=;
        b=Gcp96auo83fICx3pcRn/eWm7OyYvhsNzIB6M76jOnmlFoLGWmuuYT3SVVE4KWV/9E1
         f3XiJvIrrPc/sERzTc5vS1Cer6+8ZVykPFoP+7jvRDLN+jtuR0eHZ2kiu8vq6YkG9PAh
         1FwYErr/IMWKoZmb4VluK+T7qH6WV5lxdUiIteZXcXnFk7hYs+zVHwXviAneq6Rp2Sob
         /2K4Pc+aK1+rWS8z5b1ixDnaoYtJi8wW4dXjiRYT1yRuDf68L4D1BTsbVuVOpRGq1fpE
         kCiW5o8hA4kkUmUlFePsxD6AxRWj+vbpki6x8dXrRpwndmkJdWXAs69Z7Kremj/nBvdf
         BQIA==
X-Forwarded-Encrypted: i=1; AJvYcCXFSVHVbcXHaFKgCOiABu3LeVQ/86vEP/w+K3wBQHX96HGvCJcMajuewthXwbdGoo9Y1zoOqqYAu/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMzxm8BqeBYlfZnaorEbdh5GfzqCl9mKGrr/d+p3hMKcaMxDLb
	0AxiCd37SrrFvKoNrfBhYzrdAr+j064BdB3Qom4lSLDPTUKEOc7ug4MTXfRanngG
X-Gm-Gg: ASbGncvEVIBF25wpcGZ8Y2eKwdPGg//vKmr/Y1AA8EFLpspC17V6JGcnTXU925nAgNy
	kWIe/S+XWCp+BEBrKA19jO87DO8UkOUQCCz6WUtw7h8+MjJLWqYr2l3HU4jl8ffsnQpDuZ9dViO
	WxDgy5DQ4iq8Dw1o/tc2okxMrSZX/KthjAaQ6AR8KRyaxVYf7ta+kgr83YGq3YVsyMMkZqebX23
	5qeTNnzYWBRH0by1uIopDFL1nBr7PC7TqAx5D1hxKW7mltCz+zVpGmnz5S37PJ+GLXQVyROiIYR
	s3Z+ma+/ui26VRrObbPVeaI0yUFheUQEmFCLqdluVOE/JA4A/I1SOVWURpKiaNa+ruCBS9c+fud
	5de3In596ozfQYhzhnt46cx+XuNLlvtNrzM3rbBpxq/YHSeNjuz/twnho86Y12AlGa+cAQOg=
X-Google-Smtp-Source: AGHT+IFycYg3zuhvQv84s4sa79vRdlZhfSgHObNSFapG10Q24CngaZv3U8t7cQKjrGHcJcXSRsYK9w==
X-Received: by 2002:a05:6102:1610:b0:533:ff66:698c with SMTP id ada2fe7eead31-5a57e77391fmr2023752137.2.1758714598205;
        Wed, 24 Sep 2025 04:49:58 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-59c0c715bdbsm2876724137.8.2025.09.24.04.49.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 04:49:57 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-890190da557so1048023241.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 04:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0ex7yWukXlkcfNOtTKk+nlRPw984ceY8wjiVw2C7xFTaf2ONYME2bHuPkHFOLs3Qf44XsQYfvi8Q=@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:533:ff66:698c with SMTP id
 ada2fe7eead31-5a57e77391fmr2023739137.2.1758714597528; Wed, 24 Sep 2025
 04:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923160524.1096720-1-cosmin-gabriel.tanislav.xa@renesas.com> <20250923160524.1096720-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20250923160524.1096720-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 13:49:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULfR3PZVdh4=2QQv5N3-J8kH=3--mPS5ckkd44Xf8miA@mail.gmail.com>
X-Gm-Features: AS18NWAd607zcV9Nbln-a-J8dRoED1AjG1taSvoUWP2QDMqIsRBLiGt34BtVpEo
Message-ID: <CAMuHMdULfR3PZVdh4=2QQv5N3-J8kH=3--mPS5ckkd44Xf8miA@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: renesas: r9a09g077: Add ADC modules clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 18:06, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have three 12bit
> ADC peripherals, each with its own peripheral clock.
>
> For conversion, they use the PCLKL clock.
>
> Add their clocks to the list of module clocks.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
