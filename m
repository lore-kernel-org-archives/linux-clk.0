Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFB034CFD7
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486460; cv=none; b=SghCKtHfPo7/YunaYO7VVThJHwB3zWLCKI9KXSid5oRYAtdOhwkTf7mn5jI/mDEOOhGQvNxYTjkd0lHJtCOvS+5kkVz9Ipo33Szq0Vs3IgI+DXymq6PFCrg5xToyA3UsZ9Z1aVmbd/8qD5VPg96+dJTqQgQseHx5tht0BIvkhho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486460; c=relaxed/simple;
	bh=66jVhePVgbDY99R/UaDytJcux4TaSRR0e9iC1VpGw7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYMSD59BwOl4WTBojRgdwyGAOtRrE5+fdXahfbQRRjAoK4gNvvbj08RJcgsPcM1qHoW2IR3OnLSStBslbspglKYRI0GYY+mJB4DAH0AfmLxJmrMJisYs3LQxmbR0HfCPio+ab9kvyNQBipK2FCjbE6pVQmvhSmhmHV+GLy35uVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5de0c1fa660so1468323137.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 02:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486457; x=1767091257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXELbjF6YF4DeXko/6RU1bv5uamffDsE6H3g1pKMitA=;
        b=rxtyCbs/qpwIfeqeDa01AuAe0bxL+6ZdDiT7wzyQSDkGee+hq23qRzL5o2y0sFaWdL
         KM5X0HHG0s+iMTas5EognQsayn9JX4EhSWF0BsK1NXSdVZ6uIfA95J3djFLmyjPeIKHE
         cerOigrogj2B9nWtRIoKnMXctD2nManc9PxdLjeNdsp7GZGrW/EjiWkKNxc0lth2wfmI
         4nXL32mTdiFmRBDP0ARuFq9ZnQLRKto5RBRSHSl6HEAgvlfd+JN9nq1SF41/9U2zD0Ni
         L/ny1tFz+V9ip3I9YDsTxGyCJAznHA7XxS6yHPqK2Cw7VhacQJm0LDjEWmlXg4thIGcZ
         YT3w==
X-Forwarded-Encrypted: i=1; AJvYcCUW+T4Vy96fcW3gr3phVATrbIyQpv948lO5m8teHoTkVbOV7dH5YCXMTeIdWpQ9QWMdNdb4R/TZhlE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdk8BswAOMwF7hgaN10gWi2JKCUliNPfbClP1uzKB2a4drAGln
	eCOfAwTb7w5WDJJ3eID16JcBnFuSY6E4Ad3bhXF6DWwS8mhH0RPSc6G4RmbzB4ww
X-Gm-Gg: AY/fxX6atYa1DF9+crAp59WMa5peSH+J3uFKSH5ckrCAihj7FJFV2+XUj9GmXUBa+/B
	0W6Re+hpgV41PTRV8l9DAuHmWpA+8Rp6elfC5R0JRmtLWgtT8FH86ITrsS8SwWSqVvLjXK6DpTm
	59gVICTJMh9i4zdW0hx1YO9iwkxNU++1fhcwINFFo2WtGkl0wuJPJ4HMAlbJ2WDOB7EMw5vQbB0
	RPjQF5HZR6+d1boDB8W8w3KPxV9JVIo2C73O2T2inuy02F2mHfi/E9XED5Z9pcMuLSGQxJOHPDA
	Rp54mTLp+BNK42tfS4K+T/p8IvcUHRqc+kEdtN7mkP/atGQ9OctjK2wMII0KWMPRtoIFOkEP1I2
	Ww5Ww/NXYFNgPRd7FfC7nNUOZgy52unU6AR/saMA+MCCRMQzNIAQw6OWsA1zDvJnJFxQ0dey47J
	qNY8h+Gb/f43hmM+9EqGJjAXqBSErFwc//B7y8tW9NLheegrFI
X-Google-Smtp-Source: AGHT+IGpci+Qs6SVOn32oAdobbKfU2OF//ttOHKMHuqIxemJIQyo/RMMG9UxiRlDY3FfQuo84oLyoQ==
X-Received: by 2002:a05:6102:e0d:b0:5dd:b32c:66f7 with SMTP id ada2fe7eead31-5eb1a656de4mr3847016137.13.1766486457317;
        Tue, 23 Dec 2025 02:40:57 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aa8c125sm4325717137.6.2025.12.23.02.40.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:40:56 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9437592f8c1so289657241.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 02:40:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWL5MZpIAgT+SXG3UzxHm0O7cYKLNzzSTmF5LR5QS7oqw5wRI6RZ4Df8wYvM8IWqsEGDXRD1uvvWc4=@vger.kernel.org
X-Received: by 2002:a05:6102:2c83:b0:5db:cba0:941 with SMTP id
 ada2fe7eead31-5eb1a833fdamr4565375137.38.1766486456463; Tue, 23 Dec 2025
 02:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209091115.8541-1-ovidiu.panait.rb@renesas.com> <20251209091115.8541-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251209091115.8541-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 11:40:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUqntcjKsJN=-hiVcXfan5Ps6bBjknQ3aYbc8+z7+1eRA@mail.gmail.com>
X-Gm-Features: AQt7F2r-712B74ouLs8f-R2peKEALS9-alhfFATxSjlyRwz2ItMteJAgsFd78_E
Message-ID: <CAMuHMdUqntcjKsJN=-hiVcXfan5Ps6bBjknQ3aYbc8+z7+1eRA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a09g056: Add clock and reset entries
 for TSU
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
> Add module clock and reset entries for the TSU0 and TSU1 blocks on the
> Renesas RZ/V2N (R9A09G056) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
