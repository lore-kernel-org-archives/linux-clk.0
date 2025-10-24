Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5B63064A6
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761301015; cv=none; b=BT2xUXXJBiuuqrMXhzG3ySqmfBOVb14FWx/Awk+s5d6fjrGLeYQB41RQWI0y25liz7j5bv9IVPwjZUe1g2xo/YQsZZcp3QY7LtJA8vpZ8Oja8x0fTpsNZwX6WosQoK105V3zdDIJDQ9kBVpdb5U6oAjTkjDNSx/JFkPhCkKNHso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761301015; c=relaxed/simple;
	bh=AqiWd9FcEXBjGqvYmjKezWFbcC8LX/8ccSI0CzYf7rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6D/nyaHxmDNIx4TzEzurONdaMwTF7CrPKcwrPZBNvvCsHHrYdqdtaL81xYy2Zmib0o/I7jUipok45S0EvaKvcnIXtJHnbRimK/zNJVx9YlW5chu6wcJwDQ6pp4Xg2ZbizM6AyYx5B8aBtMSA9F+J/hdaCuW22M5fLKYhnm9tuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d5f8e95d5eso1184570137.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761301012; x=1761905812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSTLk7b49rZYTSOotXXLR+fnDfbehF6NQgF/VSyM9XA=;
        b=Qj4wzrTxm4jI3pAN8VY1RqY2hoyNN6xR1DfCEOPJdkrrPzGoU6L/ls1ZaY0324RwyE
         jRUAjOjeW+J4lMK9JFl3IarJ9Bef3MiluuqJrJZsMwOde/+RsKbk7g523v+5EE24IWdC
         WGaswRz9ubA6lbbfI3Jl4OEbsIz1NoNa4gSAUUiHGxRiZtuklNWMZtQloMhLZpub99IA
         mRwApIVj9+NEhorBqHPIQnK4uIsB/gpWI919LVSqz5mgeFYYUJMZg35iSwXCty7wUomS
         fxORHTeKIZvz0R8Lm/M0wp5i9a+DC4IaeCqfFl/LaSzyTkBkRDqXyXs3S0HaWva6iXmH
         Q9nw==
X-Forwarded-Encrypted: i=1; AJvYcCWb8vwknscrOwSmgNarrOQeRK37nXSUGI46/hk9LqsGoIPDhroaysHJLPhcNd/R8yXFwMsxER0qD3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTW/2cs9MtXsIsNs8O3CS/u7LIL7BaZqqkmNJYiVbX5ZJhVbs
	0OleWUS3TwYaSiZ8jHu8KUyFmzwKfu5Rp1eSqLnCiHWBasEsAP+jvgttpuPkzpHI
X-Gm-Gg: ASbGncuFNChovQ+rIAp0u1FeUwwat4POQhVGmsBUL/4cGXo5cq59G6LJnQE4nNT6Fzg
	bbYMr2kTcpJLYCe1mkG4EPwr2X+nFKIaTkQ8kmRwoz/23xl59WNaBTutednwIUhROfGfsyMmX0p
	TlKA5A4k1ChIKgsBXG6zEOD5ogxHZ03pyeUJrIdKB8tKXOo+fgV8gv0QTalDQn+n3B19i6nFALJ
	SEHGQQt+A95iuAA11rGuaU/MQYWxvK7OlPQhwi0PQ+pzjEU6aBg4hKNxd8YYXCPaa+ZTkV2pPga
	7XYZ0SsLDOHPYKusM3wglhzxJkY8Yh2b0iyO+XqM+JtuFd7R7XdyWGIBwLxpVdujstDFG0o011q
	UYNIoOKmtb/ScDMNYx0oxmNbGODt6lkh+rVMvkOqNRWviTCnyWsR61Nxifsu8SBAHodQe4XoSyi
	ljMjKuPciv7GrBPDcHeGIqKkQ3vstnv+PDZXOzAw==
X-Google-Smtp-Source: AGHT+IHRUMQJg+JqC23G6ORQGfX65+I6W5Rxz6szSwVibJu1z74z/XC14RiBoDF9tvB8W+uUEb5IMg==
X-Received: by 2002:a05:6102:b12:b0:5db:2123:bfd3 with SMTP id ada2fe7eead31-5db2123c12bmr2996487137.2.1761301012344;
        Fri, 24 Oct 2025 03:16:52 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c77c69bsm1907058137.2.2025.10.24.03.16.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:16:51 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89019079fbeso716465241.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYTJp6QcOYjqNUcj2bfqIwapAzamLYsU4+JUys0Jhl7ulkMVdtSnure79GWCIpsYqh/quCnHG7yr8=@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:4f7:d553:3cfa with SMTP id
 ada2fe7eead31-5d7dd53dda7mr7539658137.12.1761301010775; Fri, 24 Oct 2025
 03:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023081925.2412325-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251023081925.2412325-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251023081925.2412325-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:16:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9jkZ16rw90qY-y1JwReVuh9GcoU9590Qj+fnAOBKcEA@mail.gmail.com>
X-Gm-Features: AS18NWAl-mnooV2yE2ZHT2YePMkrfHPFCcWPI_7IIu3f_WOQ-qTqZQdZwGQjyhs
Message-ID: <CAMuHMdU9jkZ16rw90qY-y1JwReVuh9GcoU9590Qj+fnAOBKcEA@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: renesas: r9a09g077: add TSU module clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 10:20, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a TSU
> peripheral with controlled by a module clock.
>
> The TSU module clock is enabled in register MSTPCRG (0x30c), at bit 7,
> resulting in a (0x30c - 0x300) / 4 * 100 + 7 = 307 index.
>
> Add it to the list of module clocks.
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
