Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6269943B6FE
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226445; cv=pass; b=K+WTb4ozUUXkziFrRKP/+eSWqaQD3eLq5X0+4mmykbjDJZ34B92jzp36OrZxW/apa/qHYeHUuBr9G6RmERK+u5dG0qFfnkBOZvoEZ6NmiIoe1nHBZCCIDQV1F64wq+cKSQ+qOl4o1kvBPN8Gp2zXmPSI/Rl0nng42ro10EfFXY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226445; c=relaxed/simple;
	bh=tYrk9OYg6hzo8toMmW3s71eJpYFDZEFwW4Kkciy6p98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjdhdsO6t+PHvm4QPmXsdC6EpCmFpWjLyBJK/+xL73OxGrg+zpVeAGMi6279SEHUiIFg1JRxhljyOH23/+hgXbluv7/a99IEH8MpmCUEwHy4ElUqy0E6e/jrFg8bi/6NT+4BidyfCcd/123SrNCw7pDszwtMuWbmIDnXHV5kTso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nXw20yO7; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nXw20yO7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c214321dc32so400294966b.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 04:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787226441; cv=none;
        d=google.com; s=arc-20260327;
        b=jq61zFwyrm4VlGboR/Suz8EUdvQOW4qG34K9r4j/t3HcNGhMn31VyiTtTW97OTeqMR
         qN8Io/5vHFkm9TiuT8z0GIbB0miwBxnr0gxuS9AkcEvTla1o3bWSb4RqoDs+ycWJBSkJ
         BywqPEawEHOrpXGDP2dv14z6ZTIznqo3AEzLcZ8cthHTDbfwcWAGDHriLhkA74OhtPEJ
         vq2pK6xOafCdsWEONiXMOLlt/ztiTTap4pXAmjhSB1ojWLtgVBXmv+ccVfavzCiH8Awa
         d729jhoIIxybU1B6tC+J57qELQRlwSvvXo0frN6eOunMrk14/7OQ66J8k2oEua1xVqBR
         zJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        fh=1prIq8/Fz0WsVAvDDkfah13HCPRJS5SxJfUFBdORek0=;
        b=B3r6N0n6J0VhyKuaaWFizLbi7TYqCguI+Hl/XzuQc0PdCIch4uNq3BBxUV10fERFCQ
         Gi5yiedIBvmDJ+LYTfJ4k9ZNWNQROKp3z8hemLAZXf5RYrRj7kl21zjE1Qf3iUKFKoT0
         FzAhmEMx2T4wT+YF3HVqIpbWgT6oY36p/UX1sN1x3WkR/yjek7Sj/ZE+7u53g4JlmnWA
         Uj/TgryWjjoG074OCT/O08gLqIbw7h1KE7nVbnaSxRPKZduk4bmoaOKzrJHTpL/AemNv
         ifA6flyRFc4TaUMXEhxhbnyuLyh2AreCzEoNg5+svG4ymWJpVRz87B61BqHYeXxZugjL
         UqqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787226441; x=1787831241; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        b=nXw20yO7PXq+Py7mUE4yQAVFpypyJAM/xoO5ohK/kDt6VrCqsYHTFBsVVkYDm7ao76
         3ecraqYgDHxXw2jTz9DDSxdj8cTafzpQTsejKA+vomeSR0rW0+qdYPRcPfZsvXvZYJfA
         cYyJsYz5xDpvhZ+9oiR6nXmwdJkmuewDFSJdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226441; x=1787831241;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        b=iTqoI8TPWrgpyzwdtHYTRjox+B/93RIQJ890XjGKMEwesPBjNgbKP9ndqLqCqCtPgI
         X+U11RSyM+tLGHJyeBd1f6cHLxilz3pj3Epgm5n/H+hbeJ0QZkJ9MxLtPBlqrlLf2UaG
         5AcxPDU2AkrZIyrnmRxpPRihz9YSd+C08cg66pd2Pm4bVHf16lhIaNFCsz1hD+tYulU1
         evs+W4ZnGEA4mI/bqQSaY5y1YXnWkbizlD+PPwa6rFvWqBgrCnDQIfFiJYfa9RnaWTXa
         vT6dNeLvcwklcQjyghlT0PnTGbgWBEBFnclDmN2+adG/buoEJJQDyqiSYRYtDcO3UFP1
         8i7Q==
X-Forwarded-Encrypted: i=1; AHgh+Roox6/cu1CBIur/Bd4aNu+yKEd96aDR+E5kxtXwl8RwkxSyfV8UA9ikbIbAZmHKcCCkhaQepg8+I5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvOlVs3iH9vWoAAei+WWFSK4BRIHEY7/9XfKL4NRlxY6llVSPD
	KMIHt0fxNJfcrHGPq0m+gNjBAVwHlvM0za0bCuITD3wvUlH2ElkHTsN4Q/KyveU5BvPnYiHDS9e
	dJlbMjyGi2G2ykfJLFaU3MMse/s8etjWKtFpGA31P
X-Gm-Gg: AR+sD12wiLFeb1aAvG9hLmZdA04smspu0t/YrNjYKgVo7NaMbaDxlP3sYMwQmWsftKs
	zUJbvUC0PQN7Pk8Y7yhTCj3jHdBxncvEdKX+6pgMaO1runMmLqnBd2gEZ1xM/0vuChP7o4vRdMj
	epRc1xb3AxI3P9ouZYTP7DQB4uBecADM3PdKU5FUANmsf1pE3a4L3sVNW2PayRg9Ek67ufiqLtP
	hOp0ToNYco6GVs0BLLM2qDbZQKLu47wmtxxLmeukCFEI6qM9Axxg47yRJaYG9Vy9NB9g11E/tMP
	DdLflsxwGIOynYbqj/wWUCLFZoqS9aCJ6Zm6bJMnXe0=
X-Received: by 2002:a17:906:99cd:b0:c21:74ed:4608 with SMTP id
 a640c23a62f3a-c23f9750de3mr814724566b.10.1787226441540; Thu, 20 Aug 2026
 04:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810121121.210040-1-vlad@zlab.su> <20260810121121.210040-24-vlad@zlab.su>
In-Reply-To: <20260810121121.210040-24-vlad@zlab.su>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Aug 2026 05:47:09 -0600
X-Gm-Features: AcwNN1UCnC12nuoA1x1viqpRcNtcnZpIWhvuLlHFbx5J3DwZqfYkTadrWwnjlvQ
Message-ID: <CAFLszTiExzcYKBpe5h2SorR5OJEJgRx9x1bSCdwTtw4mN0Fcfw@mail.gmail.com>
Subject: Re: [PATCH 23/25] ARM: dts: rockchip: add arm,cpu-registers-not-fw-configured
 to RV1106 timer node
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Vladislav,

On Mon, 10 Aug 2026 at 06:16, Vladislav Leonov <vlad@zlab.su> wrote:
>
> The firmware on RV1106 does not initialize CNTVOFF, so the virtual
> counter may have a bogus offset relative to the physical one.
>
> Add the arm,cpu-registers-not-fw-configured property to the arch timer
> node so the kernel does not trust firmware-configured timer registers
> and uses the physical timer instead of the virtual one.
>
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
>
>  arch/arm/boot/dts/rockchip/rv1106.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> index b31cdb1c19d4..12e87d25c72b 100644
> --- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -57,6 +57,7 @@ timer {
>                 clock-frequency = <24000000>;
>                 interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>,
>                              <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +               arm,cpu-registers-not-fw-configured;
>         };
>
>         xin24m: oscillator {
> --
> 2.47.3
>

I know I am using different hardware from you, but in case it is
useful, I just wanted to mention that my boot log says "cp15 timer
running at 24.00MHz (sec-phys)" both with and without this patch, and
userspace time seems unchanged either way. I am using a board powered
by USB and that power is removed on each boot.

I do have a Luckfox Pico Pi now and I will make time soon to add it to
my lab (lab.deinde.dev).

Regards,
Simon
