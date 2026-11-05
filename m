Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901049;
	b=ouU28K/q4KrsiH0EiloYeDr3HffoDAkV/eMEZdXVN9u593nVeohUF+tXfiF7r2gs1pKI
	 foD+ZT+nRORG5dU0dcFk9glI8ZITq3lzxS1mQXJVT4NKlrsclI57+Hhy3I5Dr+wX1p+S9
	 C+DlYs7jCJquANZtULwRYb2ASSwOtTuLGK9v2gicCfC+BzBfq9rBxUKk7cl3Zzb4Qi3wA
	 x60PG631+7HxLe2IuZwHvmi4Wen60+sN/g6KFJf7kVguj1c82meTBFA1YktO8w2hhn1fS
	 hVSgMyRo0k0clyp6Tkwjqpf0tRPAqwQpqS5ixpzwizytp6tyKnDi0ArBRtxH7lopEkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=;
	b=zaHy9InVNFXtzT8ag60FYDArD8ioX3RU2wdN/uLwTtKq+ioW393hKJtFKguZr6ebLwVP
	 dJbiy8plZjOIELOPVcT4MRAGXf0M8dgu8gBY2bsHlzJ+NehcswYoMwFQdoISJ/dhanDDL
	 RSYUbGuEGwIlRn9rst5/Bp+Nbyeduz+hLa7+z3WpyWxP6HZ30xiTwUfa1ygigbwg9AXQy
	 QEb91SKMQMxDQuu3doa6AV8vZAeiFOaamHLMbHp5/hnXa9Hv3OGMKy7j1QUutbRj+zN/7
	 iROqV2ISZj6hdYCS2gapE9JVlWzK7rGeoo6YZqAeZJ5UphFscTsX3q/qiAfwKMh034Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SbXYVV0w;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCAB606A339
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 17:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DCAB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SbXYVV0w
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490f38e9688so893831f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793901047; x=1794505847; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=;
        b=SbXYVV0wWXhKcRNyYeiMFQVb3JDJcyA/84RpfKpau5+rZ/g841SsMIWE5tmxg0LCz2
         fCBeQhaHJvPkTTqCnmsfikbj9n2STDofm+Dt8n6Xf9ySy4koCENTt4MaE2387bGPFocm
         Jj7oZ9JwLaWPidOVmHugtqGEptvaDou8bNuunvpHRJFFz2EkMKDdKuGFDRe7HcUgFVpx
         D69eh++uT+gmwx0c6WUCzbQ8j/rspdOSOhQsohbWbPNRPOnw2WeIDGUvpRQYVx561gkF
         ejhfrHsCYf5tKnyR0LNmI1mgubATz3fb7rAOkALUwKa5kef1z5ftKaRyEis4bZvPPQFx
         7nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901047; x=1794505847;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=;
        b=BRE6OGC/hlj+HUAcZq/1XkGKP26lkEDY2/NMa6xe6DNjDX7xeNGEybm/hLPeR20Moq
         CjT5NQ59aX1w6EpCMkxoQjrzfLm190lvJIy5oX9I3aCbAK42Nhe49b9hlqJOgJOeRr4u
         vBZ6hecnLG1UJrytNXQ+epsLqrfLxA6c9V5cga2SIGgu7lo/T5eoSXJszfapNs08f0az
         Catuju/3IFtQYvHQrZIkmbfKFLAifALNEI8bXNRlRC8i26Ph9tcnxjtbDdX8ZeL/OCLy
         SKGEJSbzYwGew/P1mBlPOr0JhN6SCjKw46COEVnoXJONlhdKxWQRhkxIip8AuqH9ktYt
         Xy/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXJW2BrvWOntiE7TCcNQgl8C9Ezec9ikgIYl1toltw8lhlEGZLy3z+tEN6zMmYImqHPXBmfzhQbIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AQQUSIRt63fwtKJ4MDAtmU/JPgy6MWdGS8+w1klKcE2uYIe3Z
	zjmyoygkfb91UwAgx1AjqMcduT5FIX2+SPBNL0Y5JCD6yzfJS18tk0fS6+dWrduxZrs=
X-Gm-Gg: AYBFou3D9vXNYULBs2ADRvKqLAbfr4pLzr9FB5pNUu73oWJBFRPOPhNqFQjcD+mC9zI
	dXlaRXPdR22nb+V5TJLdPvfXsW/XAmn8qRulgsCHqjmVqSDsQ+IzwMtDPIdh+hmr5l9VaJ9PgeH
	nd02qMp2GwgdocuLtGzknZIniP23waSXp9WoXoelqPM9nJYyMVtnYbqAuzR4xG7PMJyRL/HC2Vn
	e5ncWXdZRySJEko3gxULN6Od+A55L0gP9wXULMIrJ0D0jRRDCozQipk+dkseiU/bH+MFYhh3RpL
	RQGLgNELWCkHKgIAE3dE4o0FgD4afphcNcYpBmv9eXWELCtcTc1W6Gek4JiCtolg+j13Rn9f1nw
	/O6D36zFwjWsRROAxabT+tsdseGMk5f74iF5RnOFQVjuA8q3vZZOPhruwtt2Nj4Z435vltPNHj5
	RTHi1HyUqXI6M6bxMz1WmH63bIvvpxiiWwKsrr4mlRCgPojswE6jDUWZnHiJEG5XROxQsP4DRTy
	dcmW+xLDuYZLymdBEFpsVTnRjC0AIkV4o71a4HXyaptoKJ+yhExpSrv8Um6nfA6P4yHS4viLCeU
	qF55l9wEkqgIVVUejvOPXm8mQOS1DVJiu7zs2BD3bsohO58J
X-Received: by 2002:a05:6000:2f87:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-4927835f4a0mr739128f8f.11.1793901046808;
        Thu, 05 Nov 2026 09:50:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm10843690f8f.37.2026.11.05.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:50:45 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
Date: Thu, 05 Nov 2026 18:50:40 +0100
Message-Id: <179390104085.2573818.16461908615505096359.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hgYik+Icrd5okmeAAVTfYYP6BAFK/E7hkpa3L1tnww0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvDn6+tSd8/d2dfKabnr0/9+ZojuLnxzpVp+oKOPje3
 5/O/X3Czo5SFgYxLgZZMUWWGu5q8XeSWl9mTde5DTOHlQlkCAMXpwBMZPM/hv950Q9jiq+4WW0u
 twi6Je18bN4hBs7Yuf9YynYukVx3RvoyI8NyJb9zV89lp9wubMhs2XQwac7TDN05otvuafDUtZ/
 jeMsPAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> When a divider register reads zero, divider_recalc_rate() currently
> emits a warning (unless CLK_DIVIDER_ALLOW_ZERO is set) and returns
> the parent rate.
> 
> This behaviour assumes a zero divisor acts as a pass-through, which
> does not apply to all hardware. Some dividers, for example PLL
> pre-dividers on Amlogic SoCs, come out of reset with a zero value
> that does not produce a usable clock. Returning the parent rate
> hides this fault behind an incorrect, plausible value.
> 
> CLK_DIVIDER_ALLOW_ZERO only suppresses the warning while still
> reporting the parent rate, so it cannot represent this hardware
> behaviour.
> 
> Add CLK_DIVIDER_INVALID_ZERO for dividers where a zero divisor value
> is invalid. When this flag is set, recalc_rate() returns 0, making
> the faulty state visible to the clock framework rather than hiding it
> as a pass-through.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/clk-divider.c    | 3 +++
>  include/linux/clk-provider.h | 6 ++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index f68216c65d3d..6c1523d22477 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -143,6 +143,9 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
>  
>  	div = _get_div(table, val, flags, width);
>  	if (!div) {
> +		if (flags & CLK_DIVIDER_INVALID_ZERO)
> +			return 0;

While I think CLK_DIVIDER_INVALID_ZERO really makes sense for a writeable divider
only, to gracefully handle a reset value at zero that we would later correct,
we should still handle all paths correctly. This include a RO divider and its
determine rate path. I'll try to send something for this soon.

> +
>  		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
>  			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
>  			clk_hw_get_name(hw));
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index dc8e161f9c2c..fe2dbbba49e3 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -744,6 +744,11 @@ struct clk_div_table {
>   *	big endian.
>   * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>   *	Formula is 2 * (value read from hardware + 1).
> + * CLK_DIVIDER_INVALID_ZERO - a zero value read from the register is not a
> + *	divide by one / bypass but an invalid setting which does not produce
> + *	a usable clock.  recalc_rate() returns 0 so that the broken state is
> + *	reported to the framework instead of the parent rate, without
> + *	triggering the CLK_DIVIDER_ALLOW_ZERO warning.


 CLK_DIVIDER_INVALID_ZERO - a zero divisor is an invalid setting with no
 	usable output. recalc_rate() returns 0 instead of the parent rate.
	Takes precedence over CLK_DIVIDER_ALLOW_ZERO.

-- 
Jerome

