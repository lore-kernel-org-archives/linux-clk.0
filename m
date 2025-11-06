Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0E285C91
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443603; cv=none; b=VHFbN0PnJvNdXBRcxYh+8RvHkvDgrQdkzMRTSuw3w3I/yPkcZAiOu0cO1Y0NvNMng8cP+/fgDxL0brCbOgXD6aJojls5wRtsoUyKUWSFAjhRuDRI27fKVsw4fQLmi0/a8nt1eazlF+l16i6zK/94TkWipZe4FG1EBVj4Mnf2yN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443603; c=relaxed/simple;
	bh=OvVab99hJjNyRIYEydBN0V5gIv2r0yCOEdtFZCKRP7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFSlAdUH7U3D8bsc7yQo9/wkxt5MfhHHuHhWzP28Rx2OPK94hl8WFmZA9vnXk98j0BoP/UPRRGP7YT6b1ho03JWVP98q7DTHV/45W/5izrne430XHrqIVEU96TVR7S5BbV67hZAMw+tDGv66wLo+ljyPHuURFvNga+9MDy/ZR4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kevjdNmR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kevjdNmR"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee130237a8so788796f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443599; x=1763048399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCImS8vAPGN6LTIAPQAR8IZZ+CU8X+89zO49Z6Ixv/M=;
        b=kevjdNmRx/vPItHpbAA8Fj/gaSq9j+ClmImM0Wu41WWm99Io6fzx1WKICnV2NjGuga
         7IPYAskhRW4/AmYolW7YBPO5Us9+jZsIrLHiG60JwBHYXnsUkPauVfjnTaE7HaGJ2vb9
         YGNWemlzo8c5S8XaxIUhpJdfzy1o0vDVeYDzanJ7FEzuwIBnVjTH+A2WC6Akerw0Ujh9
         XdXdYQ+U6S1KSzGZWRK+gDlIUg3OtdsU6dsVGLp7OZhbTOU7VORIj2VozYwXtAmuFWWY
         NHgSOcI4vnO0JmiT4KN7GSGhmyfgV6CH/JaOMA9Vvl/ijiQ7GjMFxUmDrbMY5N/29B7v
         jW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443599; x=1763048399;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCImS8vAPGN6LTIAPQAR8IZZ+CU8X+89zO49Z6Ixv/M=;
        b=TreS0GXd6MOhHWPaXX/J93OEv4n6JaB7Hjn+y7kUw6Ktus9cyDIc5Qd7JpWmZkkeEO
         W4uPCUIrVUnviAgPQkDPST2e/589jquQS0kX3ve/If2GbQhLJ6tIeuE+1DQRk0ahPWzu
         ViD5kli0q5r8tUgm3ygjLVha8IrqJ9vq6E3ic6mqLaWCRDkLbq6VClHBK+Z0NZ16P/tR
         1JcAstWY24jDXDVDTXTmCaw6/dmuPKtl3BPzHvkex0BbjztO+apvJK4I+K0bJcQkcx64
         oxQuRfP/AXa8jTw9wKzfoj2/67nagl/rdl3vEFr4oK07gaiZhmVzJcgfDQvE9z0PygLO
         HiJg==
X-Gm-Message-State: AOJu0YyKfdmZ7gOfrdei2MaX0mQAQmPk9IP2LFSR+CLrSfQel6sHsI2s
	TGqBqdEqvJCmbKGQfBaQBZ5/0T73WLAKp0tI4YuHl9Iv0jFQFqwaoYFUj+eLVjb9qvg=
X-Gm-Gg: ASbGnctfYqf+rizRpGt6KKr6l3k6sm1igzGrPxwKSrKze2fvi48YSnCWRS5nwQ/qAK6
	oN+maQc/InupHF1LDwKDjSwp0DDfkHoeS8XfjrXImTnM0kLV0X4U/fMc+PRD5MicPrNl3sI5fyO
	WPJKU/bBhGswzLsY3O8WjVP0TIWEMDpXapkGZaNo/lGQrXklxFJel0Eckm1nxUBpKSg+JptAp36
	i5odA/YsN7+HXIOJRsrE1L8af1VxJ/H9UbEx6tHpRcsb+4go22ZZFuACOwu3rulpl9kCTZ27Gav
	Obix3S2j1yoiOpAMLIsA4VLjeiJUETEEvzKEcvrPF2sEY01duUHj/h7s7S4eF/rhDu9tcQVX91+
	jOmKft8OSaRzDVFXXW/5C1XKaG93yrJ2rXlFXZB3rb/bBRl5T6Kfoicqs0pu4Kj9u5JD8D0SiL0
	xOUkv240Cs
X-Google-Smtp-Source: AGHT+IEnd90RJHx7ZuzW87zs5Q4EEB4nWgY3Vtjy9fpk248/BemBXzC7fRUumPfx0M4xpvI1GCS0qw==
X-Received: by 2002:a05:6000:2510:b0:429:d0b8:3850 with SMTP id ffacd0b85a97d-429e330b68dmr6675168f8f.48.1762443599342;
        Thu, 06 Nov 2025 07:39:59 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb4772basm6489913f8f.26.2025.11.06.07.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:39:58 -0800 (PST)
Message-ID: <181cb561-4fdf-49c0-aeb0-85844411a6ad@tuxon.dev>
Date: Thu, 6 Nov 2025 17:39:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/26] soc: renesas: rz-sysc: #undef field_get() before
 local definition
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yury Norov <yury.norov@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller
 <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>,
 Alex Elder <elder@ieee.org>, David Laight <david.laight.linux@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jason Baron
 <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Jianping Shen <Jianping.Shen@de.bosch.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-edac@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1762435376.git.geert+renesas@glider.be>
 <7feec8e9cf823dd365d6e0f21004f943964e52a0.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7feec8e9cf823dd365d6e0f21004f943964e52a0.1762435376.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/25 15:33, Geert Uytterhoeven wrote:
> Prepare for the advent of a globally available common field_get() macro
> by undefining the symbol before defining a local variant.  This prevents
> redefinition warnings from the C preprocessor when introducing the common
> macro later.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

