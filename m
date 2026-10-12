Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51842F708
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800538; cv=none; b=suDXI01AykedZLP7nLX9GgUwfV9nndjJVSWo0SlcQmV14A6XjuXJmbgS1+535AoAliTRCrxRSxune9QGHAlnjSEGRMA7kM+N6ShM7GRHqWmyOp/XQyY7bLq0HEG5j4TeBy4CoRgFCwv8MkN0ppPADU3IynNLSZKm6MVl3MZm2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800538; c=relaxed/simple;
	bh=pnNxWb9NIET8zGXgnh0fPk0259Mg14jdBHHSwczKVxY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hk8f+4PgsqMdhqZcrLDtqFlxizErL2qwL8aZo/KqnePcJzBjnU3WZyzzPhe8F7LRLhbIClH5ksjxSH5PyxLAEM1st5yDKuSf6XTIwotEEY1xHutTX85vaDsOyUmhKE4/Neri6QxKA7/D/G/stPgKdEyrTW2w6+6KONjQH2yAXIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=J/FPZyct; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="J/FPZyct"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso959686f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800523; x=1792405323; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wSG3oCF74JWXW1bTfxbde+arlZoaBNLQIBfAv04jt2A=;
        b=J/FPZyctTu0NeTuogB0104t6yOPUgzuEFCAl1/bASlFkk8J+srIz30/4gYlAbpiMOg
         9VNZBedU/CYN4Y5FNpbqIz4EPGWBh+ItlC40l6tXsFgPsi3mIluEdh4irOf53MHOMXaK
         d1H8mWQy4MJP41HUwY/Y7MpBzkF77YYRYOvZUxLvtHrg/yFOa24PKmT9XOoms4TEbyv/
         Wu2BjL3M8RaxR7GCOwESqLmiKyOXu2fhxGAIBohXbkidnjuSZX5uOlCC68nMcjNpQRHa
         u91DwSTNQNszbBzLpQBHF47FsVK4Hv6ulzDzXHYKbTQJaH5qoLrDmU4RDKzamDmgfiCQ
         elnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800523; x=1792405323;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSG3oCF74JWXW1bTfxbde+arlZoaBNLQIBfAv04jt2A=;
        b=XHFm64vu/1uAbTSCwxVrSYHeZFNtjhWzzAVT7FQ+OC+toYPqirvn3E6Uebxwf/4oTV
         DX1ZHwfFp4I2FJdjXrOtC8GBepcq4tMTy3K18Rz/h214YwJ13D0z7Q1x3Qsh8VuIdNcz
         7xNCY8dMvYRZIkITCxDFtQ2XZXcaqfKDYii6HxNrlzYnxckafFsaLKPu5iIKYhNYQ6pJ
         CeYk+ln1eidjOYPSPbTEMeP9Q6E8VTx61sTu3O0jgmOlEFJL61DqmaAqOHnj2LK0xF5V
         ++1ojDvll+aXi5drKap3uCPqMWQMqg1a4a+NjvXZUY1xWRgjokC9lD2LhVA60zdhmAQG
         xA1g==
X-Forwarded-Encrypted: i=1; AKwUvBwWAPqNyZXyOEaBWzPiFgSa5Fahd7GCBz5n+km3w/m6+jgEC1SD6Rhe65ibgvxapxM6H/gPtSYyJ2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCqYzmtsX2W8Jffs5/9v2Z0qhmaSTZhpnvC2a3atvYLJLRRZ60
	tq8eGMIxoE+08sX3Wlqz6YCWvxCGOKM4XMZMZ/jLXA6bv2MuwidOrFH091DNHztaK+oNDjxlSby
	wgO+KOmA=
X-Gm-Gg: AYBFou2V5rGrlLFmsBSwJD/XrVP5goww6OGdQRFn9g5fOvbaIuErmC94BIyBmQ4Xl0i
	jWe6UkS33IudlcJ9IbdzrcflxHePexYgYDjjvknEEwvL+VaGVs7pYASn7bhFVzJUu3ql45plL0s
	NrDv8q3ccfhS2sxCl2ir6ez+CBHlgadh7bGEDh9birASiJpts4qr9lck/tI+UEBYI8EbzobVE6s
	tzy/WdjA2eFdtoCC/VV/IHjw2AWFf6SpzYItwea4+4oDn3+k76ae9hld4jXdhVKUV5lg2BYjbbi
	ZTU9wh5LrHtBlRc7Oi7KmCW+ESg3UBVXVceCg1Wju46mYcc7EAVzKUYmfMMkKPcVdaFpLmPWJw4
	w5tDYcxhbDswkXwITxFHPDgmKByKCO98MyDn0BgWwwkUjj/q9pdSB+HUXpVJaHMiIfuy/Xzwna4
	aUiX3SavwJu+yMq2QG8jovAvD8PAlQ/RDtCB5QMpOYK6oCs+kCTgopqjMNSb+aixkEc2ZzgPniD
	KRcCMyhid/Z8pINkQs=
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr166723875e9.24.1791800522611;
        Mon, 12 Oct 2026 03:22:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm287466995e9.12.2026.10.12.03.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for
 inverted divider clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-9-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-9-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.154947682767663962.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pnNxWb9NIET8zGXgnh0fPk0259Mg14jdBHHSwczKVxY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuzfrGv/WEVPdLV5tHi+YeOfQ+VnD2SnVaRfezHz5
 Y/GG1IVHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIlsMM/7PO393IYNV8xrem
 Xe/NxPVv8vr9OZQETj54s20bm9+6VS4M/4uY/t2dl8IocOm5ht2cHEdHrvlqeetVPLXDXq3RWh5
 fzgMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Some StarFive clocks only advertise the divider and invert capabilities
> (via JH71X0_CLK_INVERT, without ENABLE). Add the JH71X0_IDIV() macro
> to declare such clocks, and jh71x0_clk_idiv_ops, which combines the
> divider rate operations with get_phase/set_phase.
>

Please rephrase, I don't understand what you mean

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 13 ++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h |  8 ++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index c5ee82db3c92..224fcc3d08db 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -303,6 +303,15 @@ static const struct clk_ops jh71x0_clk_inv_ops = {
>  	.debug_init = jh71x0_clk_debug_init,
>  };
>  
> +static const struct clk_ops jh71x0_clk_idiv_ops = {
> +	.get_phase = jh71x0_clk_get_phase,
> +	.set_phase = jh71x0_clk_set_phase,
> +	.recalc_rate = jh71x0_clk_recalc_rate,
> +	.determine_rate = jh71x0_clk_determine_rate,
> +	.set_rate = jh71x0_clk_set_rate,
> +	.debug_init = jh71x0_clk_debug_init,

Instead of trying to cover all the combination that could exist, can you just chain 2 elements ?
a div then an inv ?

> +};
> +
>  const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  {
>  	if (max & JH71X0_CLK_DIV_MASK) {
> @@ -313,7 +322,9 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  		}
>  		if (max & JH71X0_CLK_ENABLE)
>  			return &jh71x0_clk_gdiv_ops;
> -		if (max == JH71X0_CLK_FRAC_MAX)
> +		else if (max & JH71X0_CLK_INVERT)
> +			return &jh71x0_clk_idiv_ops;
> +		else if (max == JH71X0_CLK_FRAC_MAX)
>  			return &jh71x0_clk_fdiv_ops;

Given the branches return, if was enough and you did not need to modify the existing path.

-- 
Jerome

