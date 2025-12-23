Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391D302157
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486491; cv=none; b=CJ/ILVCyDQQBzEtMw+MmQLFW1St10ZlUXYVgR3i2cCcOkz0GDIz1gU5kBjMVKcIJ7+5LyM0YHVvC7ijABM5qBNDSkXB5KXJLzKD3/NlV6reyISAJN0w+b3QvTETdIbIGtWnlAkPUFvZeYvNvKokEOp/PQaoya5ZB4W8VCI6TOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486491; c=relaxed/simple;
	bh=xl1vXOaleR0j5ZD3l3FjtDUkU+B3UA3o3alRtYcoeVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XX/yrreJ+Dqpf8lBIllKmMUMwqmqzzrFq4LZqLPouCGBxrMxqJbcml4YXPX/Ulju+GhrEUywkGD06Wy7q6TxCp4lCvDJQBh2XpF4ZXV+vCOV5nnGaZB84fMymyWzFhnH7+YHsPUJLGozPbS+3CgNROi2d0PJQ2WpK0EAII2o6RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5e55bd6f5bbso3298169137.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 02:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486489; x=1767091289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq7HSic6ryPtqfCpQmmpcvZwrfLwAAt26kNsndZzLGc=;
        b=pihj5/U9bbmX13AMj+HH38OV6OPR1sY5yUayrG7o1C5OCWHIWGwzL8R0yfa3xTZf+j
         LTuq2kB7ndNLHwcFsipVRzM6e7pCEqZeWwGk+0UOjEu63SKsMaPWy1/CCRgWIfNw9ejM
         cZtTLBOeJ/+uN7RMY1begS60EphzlUy641v+8LSPFLf1AaBkRQuTCuUJS8E1JCpJeWov
         AdKWoW+OxgswrZqpF2xPTB2IZVtAWfyB9BsPWrGnCAlKxbaPu85yM8jAwULJaKWhBoZa
         qTL2Sx9MKAG+HXWcC5qtiietsBg9LssVor5whmcqVY61xTN21jzR705XKUe+1i4fqILy
         /twA==
X-Forwarded-Encrypted: i=1; AJvYcCU/URM4p1uF6aqclza/3uGN4B0mgXij0w8yVC1rK0B5/DBs+6Qv3Q2norWK+Bk+3C23WEScIOkMz38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BaNzE5wDKTzFIQxjBH5OfLF69pjCTJm1yFCSBuIH8FtWBPPh
	oq8Mj00xiaktwOsyXV3mu5q+7YCs6lv9Osh0kqmDr2OgxDmAQWPllc7BDQ4RFu3B
X-Gm-Gg: AY/fxX5/D/zrr1t819QZtmOrdqvm6nN2z9HNouGgFwXwFJrPmUjAQNxq82EJRYPTJeQ
	HKT6nj2yj9CWkXKOkO4PWcQvyK+WezI9PJTIGCtHTYz/n3mLTx25NX76F2CQUJmMjTlBIIflrzB
	VbSJBlTo0CqocXaOnXOYeTAEuRasgMgTLNXGA/EXpDKv5zvS7kX0xpjRcdiG2TvXO6zXJcbnTCB
	KCpk5DzjiHTtg2lcbG036lI1xzwdfoabiIOtThp1Xw4iKYKLa2jEsLjYoAvOi75Rz0yKWYri7xW
	Lfe+5JSpxtatHJC7Z7CcBlPVvcW6RqpbszqQTJor9YlE54RMK4b/T5n6CdY9kqCqqjJLttWlvBB
	j1huxt86sw7PuZ2mhyTisOVOANYNcqWoyqTmUVKW5SgUE9BW4D8DJmDgCBHqK2RKuftlnbPfqai
	jaHZr6opR5i6ubwuvGo2PrtkTHWvVc3E12FvvLeCen/l9SxBS/6Q76
X-Google-Smtp-Source: AGHT+IFUrFBGVlYETqcWnpTW6FoT7jonSen5mt8VsxHri9jO0gbi4umj24vEg765e155JchZLHaa9g==
X-Received: by 2002:a05:6102:2d0c:b0:5dd:b61a:a9c5 with SMTP id ada2fe7eead31-5eb1a41029bmr4848450137.0.1766486488980;
        Tue, 23 Dec 2025 02:41:28 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac90a6asm4202392137.13.2025.12.23.02.41.28
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:41:28 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b24eedd37so3391273e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 02:41:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWHHT5C12ueKzHlLnoBvBAfRWOZQeP2Z3majgaR0qRJJcmadJR6wpOGV129qcR4deeaUVCfxDVppE=@vger.kernel.org
X-Received: by 2002:a05:6122:3c84:b0:54a:992c:815e with SMTP id
 71dfb90a1353d-5615bd1b39cmr4360914e0c.8.1766486488573; Tue, 23 Dec 2025
 02:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209091115.8541-1-ovidiu.panait.rb@renesas.com> <20251209091115.8541-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251209091115.8541-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 11:41:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLkOnxSNBoAJ_Q7hQj=Eb1u3x-Wo1JiHU8uz_tCJcy5g@mail.gmail.com>
X-Gm-Features: AQt7F2orNy1GBmSkRttc0kHF_Evq8f58iyWH7SaoZ_piWZcfCDJUCF-OXqEH57Q
Message-ID: <CAMuHMdXLkOnxSNBoAJ_Q7hQj=Eb1u3x-Wo1JiHU8uz_tCJcy5g@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g056: Add TSU nodes
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: john.madieu.xa@bp.renesas.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Dec 2025 at 10:11, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2N SoC includes a Thermal Sensor Unit (TSU) block designed
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
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
