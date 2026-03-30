Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E273CBE71
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877625; cv=none; b=n4H95aUJfK21SsU1potOyJXaR0svEXoKewO8DcEAQ6Mq8r9IIqMN7al1FX1683pL4YSRtoAWTtTmaQrcLnmVdKSdT0bXSNLcUxyLxvPyFNChZo7kX6Fot26ptsuLdbCxyUgICXi7b99vVbfyBkEyuPna94aKt24vVsOvP2+0uO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877625; c=relaxed/simple;
	bh=/kxWTA52BAt2g4WnQqRpqhpA4ac3KQhFlNL2rViCQp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIrSUzEPx3mjAxtPVsB58RNdxCeISsrI5mfKqQdXkV8ZBMAEG8xVgwekA8cJax4+ZFyliuMsbYhqZRBbdvHgshzOfqXtza5PWlJtVebORebuhuxZiJK3hegRVYd13PqNtVMrsZfQrrQL4a+iCGQ1qg5v+1mpGDO1ZBjqiP/dKwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953aacb9d78so538549241.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877622; x=1775482422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCelPAg5TqeEG1G1zPAvcyqOUxcgqEhU8AXcqqEt3aI=;
        b=n/Yh6KxQRCcPAIqSRGuju4vfR6uIiDUpLzCOyUK6k/vlUYQ7tPXN7S+4E4gmAIj4Lj
         dsQhzAQgQd4tD7uP0bGkc1YEr/eLP9HzT3PIhlgacouoK/INYMVbvYNqnMpicyxij5ci
         GZ+VlJPM8bDdWQ+nW55qhdHzEKllGcyM6TtsWEaphyzlbu88H4sn2VaURMBeosEQ/kz3
         y4/CZwZtFDRxvbe2k63F572+nERlvY/UgpW8sN8mB8pZaB2U0Kf3vZ5i+ev/gTzRfbIl
         kgLyp6vqxOS+dfAjNjW/PCZDs5TA6KFseVoF+/v/RhZSB2PgHXtsF5MYNu15VTNFLwSq
         2FUg==
X-Forwarded-Encrypted: i=1; AJvYcCU3pL2EpNKsLZ63uLYiOh0/19o+NzYL4osmKPmjk3hhBLRDPaBoVasEghZqj2pKVrzY4zGDAe/zS28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5rjKCa+ZhnEzMQOPQjfumB+t2Fn4tSukj+HpjJ18ml6WwO3c/
	vDNFFWsmtqbHcZ3DDLF8acqD/4RoxgRjZdkwa2rLX7LByfWGos8OhBYjCQcQiJGD
X-Gm-Gg: ATEYQzwK7B1Mp1HWgSCHoqtVmfX6kSmg8kYTsRdO0Mfe8A2aH/V612KtpeK0MrvXWD6
	M3rDRtbIwIwgeyXZAEWUPcE7uOBs2FMHpOP3MPac/SRZzp687QBOU9CHdu4mfdyclTCh6grPlJB
	Ni3PtsUoeNnN5DgAcZP5SwQNJHTnh5Idiyw+n/q5Hz4M1+QTTcRzhNYDjH9c/36znRI15NsVamr
	olEdfwQX7tdH8NRvgdU2Tc/D14Nyxt6cUbQXSP8oJbJ/RcfAtt7BDh+bDuPBvxGTZpTM12GSgnX
	Inth7Wr9IBHievlSXDLE7w6jARCL2utvvNFg+XNE8mOGQPKmabiHeSD5su+2Ok6b71nDxvhXy/K
	ew/xGsr3QVx2ehq2e21YmVVL5RkwtN5DLQQprOiTZ00AmGH26KbTPN/IIjBgtGX4T1/EojD80fO
	R5H5XVLgBBEg03Zvy8UYaYWCF4IqmltQwDlAfMdaeZaPv2gGpAkvBDCFn0oFM9
X-Received: by 2002:a05:6102:304c:b0:604:dfe4:8486 with SMTP id ada2fe7eead31-604f92e88bdmr3909409137.31.1774877622517;
        Mon, 30 Mar 2026 06:33:42 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a1dc2asm8146172137.4.2026.03.30.06.33.42
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:33:42 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ffa0b23a60so1699410137.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:33:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdltpiD0/Y09w1f5Je7S3F1Z3tCFHDbdrl3iaZRclhMQcJfwYMB7DVi210aWSedKOZz65okQS4kOI=@vger.kernel.org
X-Received: by 2002:a05:6102:2b85:b0:605:26eb:cc1a with SMTP id
 ada2fe7eead31-60526ebcfa6mr1670554137.29.1774877621873; Mon, 30 Mar 2026
 06:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 15:33:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX23LQYFFzs9STykFVECb4uv1u3DmEMCh453GBK=4XbYQ@mail.gmail.com>
X-Gm-Features: AQROBzDj9P2QcJJ03rVKxKEo5zx-Wow-J_zNYCm0-1wsBhaAiKvmNzwG6-mGiTE
Message-ID: <CAMuHMdX23LQYFFzs9STykFVECb4uv1u3DmEMCh453GBK=4XbYQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add support for Inside-Secure EIP-150 crypto block
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, 
	"David S. Miller" <davem@davemloft.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pascal EBERHARD <pascal.eberhard@se.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Fri, 27 Mar 2026 at 21:10, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> This is a series adding support for the EIP-150, which is a crypto block
> containing:
> - a public key accelerator
> - a random number generator
> - an interrupt controller

Thanks for your series!

>       irqchip/eip201-aic: Add support for Safexcel EIP-201 AIC
[...]
>       crypto: eip28: Add support for SafeXcel EIP-28 Public Key Accelerator

My OCD tells me to ask for using "SafeXcel" consistently,  ;-)

drivers/crypto/inside-secure/eip28.c: .name = "Safexcel EIP28 PKA",
drivers/irqchip/Kconfig:        tristate "Safexcel EIP201 AIC"
drivers/irqchip/Kconfig:   inside Safexcel EIP150 IPs, gathering
Public Key Accelerator

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
