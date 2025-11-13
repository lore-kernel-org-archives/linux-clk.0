Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528FF29BDBC
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044125; cv=none; b=NedSEa51GKNjLQXQhavgJtkvErlMz77DcpNFItIBHLQbdCqM2ZdEmTUZf/jbuImIW0vb43hUl41Co0yeTptasDeP4BdH9X4MNhzKMyQvUis1JvB43OZ9SUmnHjQ40B0fdIjwTBPUBad0nMN66zVz4OVO1gEHFxnTbcH7LKXOwNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044125; c=relaxed/simple;
	bh=A55pVaLB1a5M/183qzOCCCtVLqILltVvYYcujE/3gBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPur8Aa+h1bYncTZ4C/BJbPMaERN1IVTTkWbADILJ9Nh+EJBkzbbaDxWI4bKjFzxqTDzuqbhrzPpMx6KHJWRKXDiBZoHfQVPOcZx4zMT+onzi18DW0X4pgZv6BGJysTs7lNO6UYTTzCnezmIgrA9weSLhvPLmnR8jrVrVgffBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5de23ddba5eso599373137.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 06:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044123; x=1763648923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPVdv+Cr3ZbcMU8t075Et/PpRUdOj7rpDshXN3z13xs=;
        b=SBH0GaqeJCrh5uddCbJYfekdwz5JfRktyXpvikwnVVKXZYRb9/QTceFFG79Blw1vef
         4rd2eBPQQyfkpn0nKiMq8W0xC65MBdAZ62+SyQSjj+raUSiYJglk/DsRVo3LmJBvIAo+
         sFahRg4vXKq58BGtkQyGiugBHiERWN3V5hy8QOk+2DfQQeB2pIcdhF+dkXbx96FMUgd5
         +okrjaFnbGZXdLkZzVCePnLPrDCQX0pXLzzCbJHFF+p//W5sZJ+8IaMFaqbjoiQ6WvVy
         0wHpMqX1+BEW93tIk7915144tXD54zQdPsojYfIk3uLZKECzunxN/uBbBcN1ZEyJfzFY
         rV5g==
X-Forwarded-Encrypted: i=1; AJvYcCVSBCmiB6BZAXw7YNxCkogXlDTf8do/94YDPIVWk4df6BUxbepNJQSj9Fh/G2msiJXXXrpWcpmFo9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Qe8NIz2DIWWAW6AnRbIpeHDIcFPHiTs9YaY7APETOJJPc48W
	S7GVoUxqQWmvkNuik9bR05CsEsiWtwszuBM5K2yFeX9b7KqohoUoUC2z1hRD+28pzfQ=
X-Gm-Gg: ASbGncsFrFMnGxqL/oF3Mow7FRwOTz0cq5UmXNTqgiJyzLSR4IAq0lxDSNYj8PNwyy+
	Uo/SXxcBoPKPYPBc3mpNP4NNYCq+5W0yHPAQXPgfGK7BdmYesys54edjJoAbosr5Bv4Rydkp83S
	P0k7aGMJK3RMejG86MXH+Zi+cOOQvdTPDyh1iE2DPEJ6EhMDeLVX43stKt/Eni+43VztvyzAcpS
	RLrOoit3+gd3gRoH4i4JPnDvVR/Ywa1p1EfVumOdOrTjFE+eDGon7zsYrv9d1kV9LNIh74euxSC
	xvZzZI3fRehPQKt2BnPimUHhQdjMUQl3DWhFWcuP7/f2/Xleg2YEEgdmMRUwZ3h3iwEi4BogjDv
	ZBP8+tNCKkYhBoS5chRbXaXDCD2rNza64OeBE1X/VHp8j5E4mGd52vSP+dU0VINLQokAKG6itoX
	4vvrZ/D8j+CxcHAdRX3ZXHWYojDTvJ+Nh+49rcYg==
X-Google-Smtp-Source: AGHT+IG2WKnfc6MFWNnKSYa7Zx/YRs0Dy9rAmfy50x3czQKKHKOhR4x7IVNiTEXElo+LWO/xHdwmNg==
X-Received: by 2002:a05:6102:4244:b0:5df:bddd:b590 with SMTP id ada2fe7eead31-5dfbdddb885mr667066137.34.1763044122680;
        Thu, 13 Nov 2025 06:28:42 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb7232b03sm634403137.11.2025.11.13.06.28.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:28:41 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso452568241.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 06:28:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzodUJ0uc03pcJpyJ3rYEiZ907n3CVZnvN6tea2OQfl6yKSdOCGHQWt9L3/i/sS51H91rnKTTgKRs=@vger.kernel.org
X-Received: by 2002:a05:6102:4b85:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5dfaf0f34c8mr2015901137.38.1763044121413; Thu, 13 Nov 2025
 06:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020143107.13974-1-ovidiu.panait.rb@renesas.com> <20251020143107.13974-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251020143107.13974-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:28:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUz=f5ArCV-w7dcyEdqhsZJrKyf=KwY18mwOgVdt5TQDw@mail.gmail.com>
X-Gm-Features: AWmQ_bnUzqLPji7mNY2mLpWw72wOSZDLLWSl0uz9lB3HUP0ZZ52peqFQbz3UfMc
Message-ID: <CAMuHMdUz=f5ArCV-w7dcyEdqhsZJrKyf=KwY18mwOgVdt5TQDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r9a09g057: Add TSU nodes
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: john.madieu.xa@bp.renesas.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Oct 2025 at 16:31, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2H SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing:
> - TSU0, which is located near the DRP-AI block
> - TSU1, which is located near the CPU and DRP-AI block
>
> Since TSU1 is physically closer the CPU and the highest temperature
> spot, it is used for CPU throttling through a passive trip and cooling
> map. TSU0 is configured only with a critical trip.
>
> Add TSU nodes along with thermal zones and keep them enabled in the SoC
> DTSI.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
