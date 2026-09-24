Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD363BCD21
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242512; cv=none; b=NNwBm4NobJIt/DsIzpySovq5wznXI5w2zUPh0WGelR/kmlejx0LvKD9KfqJWCvB/4hs3g26If7YXG3361ZDACLVmjxfvJNh+U70KgNNJhG6now/wS5BeamwjsplvbJSZ9zIJqFYukyamcdq8V7Iapbi8zldjj28iZfwhjFEivyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242512; c=relaxed/simple;
	bh=xlFr47uBNraq9Vfw+jhIc3orvyXDcJ8EdkBjzapnpks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cOpCcRNvMT0YeCOHlZxXWfe9A4kevjIsqVjKgk2O7L+iCp96rVuYogAP0boN2Of9/Oq502lcCgwxAQ0y3b2PcFm0UjeVzqFCRSLOepEZRq7lVhxftcjw6ONqNCV6S43lWF1PaITUtgn3G7fPHBN+gwmayhgm3aY6K7Stj9++W1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QNLXS3Ym; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QNLXS3Ym"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so11026195e9.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790242508; x=1790847308; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntOIbWg0v6Y7sjUG+xdx4uPbi3N8TfY72tgKuI0bUbw=;
        b=QNLXS3YmCK1BfBF7nU6ZAi9jD+ARO67zOm1zraT43p3A2tSNmRmr3MxQYTTusl/9tQ
         W/cVYWYLGOLnJ4vhIS810/TLgmUC7/L2MtcZUoP3DXhdTAF+EjVVu8nvb9+Gl0ejglHh
         v3omTb2w2LbPW/R6nfy3hK3qAorfTVauqThaawmV2MlsY7D+VwumuwnHrrXDvxN8ortq
         mcGaSxf7Pk0ebN/C62TaoQFsRUj/Ml+r7N4c21inQPuFM5TXPyO3b5CZA2IyJLBPvsjr
         25fNcbO9AUjH9uR7pONolWo75YsJEcoh6ftZeGKZUkQRSGLiQMfhw3m3B5DJM/FvypUq
         ZdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242508; x=1790847308;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntOIbWg0v6Y7sjUG+xdx4uPbi3N8TfY72tgKuI0bUbw=;
        b=qCMJ5lVRnGLhT6wG4C4D/IK80w8OISYIfMxX9J2PSoe/6Ev7XTPCIRoi7ZMGF/81Fs
         wHo5HPH10hzmdT7/Le6rvO4WQS/SJAa8JX2Rg7evT/OcgoImcS/yXXvdE0OigSCwIjoe
         fwMkKvFxAsTuuq8mTbfYsLcXEZPK63kFxG9irpeLKOGUNzKGLzjsqvU+nAJ9c1+3uOW+
         Z3eM8nkFCwHn8XLRyLCVrET+nczhLo0cjw5W10xQWBl3EQGBxhwdGFEaLTA0JMCxHNI0
         MHStw3TlPUkD56IgK/u68hORonumUzoAubvdCDatxtOrmA74jIMQbq91ljO7dCaF7d5z
         q31g==
X-Forwarded-Encrypted: i=1; AKwUvBzsvYVBiUBwvi6/AjNRTGCWS+v22mXKz/WOx8u09PraPueU76DDLA8Pac1akEpuG0MTnJqtbQypPCg=@vger.kernel.org
X-Gm-Message-State: AFuF++ltKHN4khGIJbYvTv64nzY0xWoffpUJvNkjd7OPSZZqzO4T51pO
	lnI0zT+vbYvxepKNYwV2tM1My1TyXda6beUoeardIqhNbPJ3w437vMpUK5l3Laz9/bk=
X-Gm-Gg: AYBFou2luklVgJPRzoI0fvB/VzEKjPV8TF2Gsv50NqGndgAWBg666Uz8WV6vDW3VRdC
	1DkZ06r4sj9uo+l4jUDcTQLJGnYgXPrtVFU8XX8eCzfV7y2feFmMyYxHkj4mrlIWYYbg0FPjwjY
	DZfA3Fq8dxfWAnSSmCaxYKQXuzhPmhQmM41S/mpgwL1Q/mxCjPtqh4u+zZi8I/it1OE5TL+zbI3
	St2AMssT+syhY1VhNKhOFQoZ/I4v6kJcB+5LzSpn0CzoauACbEh++RXTlZCP3NQjXwRNahf1xnn
	goGcMfV4PdEi+n9nvYbXZLRcQ2VwF6DHvpaq366wTXbPNmscuWQQYlMdfLArp9XrTX8XbIobmnf
	nbzHcEr9USbwIE3ZoQobTUTi+fzcDX9ynoUgwOVwR/t12EU9JFijoncIGJOAMvGzOqAPwg3ncgX
	UE4Giae9f4s59uBVPna5Z6N9+4w0B3dU2mAQxp21wnqnWtkb8ZIUXuwQGTsBXBBbFQP33T/GHWn
	WHrYTNknwe0FHNwqA==
X-Received: by 2002:a05:600c:4fcc:b0:49f:df99:ff1a with SMTP id 5b1f17b1804b1-49fe66f344dmr32157945e9.17.1790242507705;
        Thu, 24 Sep 2026 02:35:07 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd2bacsm50613795e9.13.2026.09.24.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:35:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH RFC 0/3] clk: meson: Refactor PLL pre-divider as a
 divider clock
In-Reply-To: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
Date: Thu, 24 Sep 2026 11:35:06 +0200
Message-ID: <1j1paj9elx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 23 sept. 2026 at 19:14, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> This series refactors the Meson PLL framework to remove the dedicated
> PLL pre-divider (N) parameter from the PLL implementation and model it
> as a separate divider clock.
>
> Currently, the Meson PLL framework models the PLL pre-divider using a
> dedicated n field in struct meson_clk_pll_data. This makes the
> pre-divider part of the PLL-specific implementation, although the
> Common Clock Framework already provides a generic divider clock.
>
> This series separates the pre-divider from the PLL and makes the PLL
> DCO take the pre-divider clock as its parent. This allows the
> pre-divider to be modeled using the standard CCF divider implementation
> and simplifies the PLL framework.
>
> The series currently covers T7 as an RFC to get feedback on the
> framework design before applying the same approach to other SoCs.
>
> Series:
> clk: meson: pll: Remove the dedicated n parameter
> dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
> clk: meson: t7: Model PLL pre-divider as a divider clock
>
> The other Meson SoCs will be converted separately after the T7 PLL
> framework refactoring has been reviewed and the overall approach is
> agreed upon.
>
> Any feedback on the proposed clock hierarchy and the separation of the
> PLL pre-divider from the PLL itself would be appreciated.

So if I summarize this RFC, you have simply taken the divider out of the
PLL, no futher addaptation. right ?

I'm happy with it on the general principle and fine with the change as
long as you test it on as much platform as you can, clearly flagging
those you have just compiled tested.

A change like this would likely need to land early in the cycle give as
much time as possible for testing.

However there a couple of thing I'm concerned about:

* You've drop the table support: are you sure this is not needed anymore
  ? don't you want to be able to restrict mutlipliers to specific values
  sometimes ? If not, then OK.

* the determine_rate() make no call to round the parent rate: Since the
  parent will be the divier, how do you progate the rate change so N
  moves and the best parent rate is found ? For sure this fractional
  multiplier clock will need CLK_SET_RATE_PARENT to adjust the
  pre-divider.

* Goes with the point above, but I'm not seeing anything that favors
  lower N for lower jitter, Or mention of a minimum input rate (which
  could be a property) ?
  Those are constraints I think I have understood from your explanation
  here [1] but maybe you've got new information to share ?

This is overall going in the right direction but determine_rate() and
constraints need work.

Note: you are more likely to get test feedback if you add g12 (sm1) as an
example. Those are still the most widely used amlogic platforms with
mainline.

[1]: https://lore.kernel.org/linux-clk/c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com/

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
> Jian Hu (3):
>       clk: meson: pll: Remove the dedicated n parameter
>       dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>       clk: meson: t7: Model PLL pre-divider as a divider clock
>
>  drivers/clk/meson/clk-pll.c                     | 178 +++++------------------
>  drivers/clk/meson/clk-pll.h                     |  13 --
>  drivers/clk/meson/t7-pll.c                      | 183 ++++++++++++++++++------
>  include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
>  4 files changed, 181 insertions(+), 199 deletions(-)
> ---
> base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
> change-id: 20260923-meson_refactor_n-e7f25904e536
>
> Best regards,
> -- 
> Jian Hu <jian.hu@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
