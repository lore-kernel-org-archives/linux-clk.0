Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAE4197A8B
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018547; cv=none; b=tlcAoOK8cwitjrCsG19P4bqsTTh88MSmC2aENeaiOV72gLiRe4UExTCAwIKda3l6Xcs7W9wSfKjh7wCXNhjNarn51dGrCKynI20Bxmc2IWV33AUjhjYAKz6qUQEOrRGJFI6sgPMvFO/YLoNr2A+RXp0ptBrqb3XOuiTr77jBK/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018547; c=relaxed/simple;
	bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACHvZ/2cunKuRYXUpoDJeIYQtXOtAHe6CWgFwhBoJxw4Jc1dBSgE9bbCGAa9nPDOG1Atl0ZbrKf8RIb/aQOLRtc+yRDtXQe9KFLZl40e2Uyh0SUsMA+Mg6cHirvSCc51spoZWh5JDsB5TnKyMOz51k9tQRqKJxAVHOmVziCVHdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IQ4xu/k2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQ4xu/k2"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3003e203acaso6644911fa.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737018543; x=1737623343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=;
        b=IQ4xu/k27KRRWT8+BR952Rp6sKVE/VBK5DV2ZXczu1NXcUukvmSRhxYLL+0UXBIJ4c
         3XLFDkgeNmHYnmaZ1Y+a9giINHrU31aBwZYdr2dnFxiFW1/qGxFPCUuOm9gPYsHh4oHG
         0vzH+G0XYL84pZEwCnLOqSj66IjfcnuQlbsgN/qIvOrhWppNR7wGIUs1hexzLPxTpmyt
         3hbCRYP/n4ekMfXpEKGouRTTopOyA6dAL2JuiYN7x087ZTdBG7STUK9luWQEInOjkGUe
         hBgxFng++giL4qYxSLhDii9GH5/I3L8nHqsV4VGu8zTpo4mXnEuh6k3KbDxJ3Mg/WwBz
         L5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018543; x=1737623343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=;
        b=CWJNLl5mngWoC9o3/dDyWmb8waOMjvodYe5ulIoTKea1ktJ9hyEeuC/S7t1VlfJGPX
         OwPLbZgorX47QVZo2ARrb8pdMKECX9aoz/wEuey0GPStU3WB9IiKiXwofQINI8NCnCDO
         jan0EV9tLnK/rtXfXQwENy5pUlGYdw6s7yHM1yEMlvMPYT/hswmdtpuX7UfrRwU+jkyr
         YdKVpXXbum1lnhzZEm/m4et5Nm0GcyHuoF02q4peZwivOLPCmH7qhTLOx969KUJ6i6Sr
         PtpvyhBQePjTu4eOygzyQNKiNJyQ05cwgEaJaexVPtjaLdNFrfcX3TK0Gn8uGj+2k5LW
         sUXA==
X-Forwarded-Encrypted: i=1; AJvYcCVOEAhf+tDJFNippjq5VhWzf5x2ZscRQo6/2dx64zTaUha8+awL0nk5DnwvamkD5Y4JwXYlTrg0QV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMq/bg7zhOmyq+z1Ry6YKszbwOLlQJRL8dx69p5CHbJ1nSiaTJ
	iFUx6bfVdKv/AqWddDtV0OMA/YlZioAR9uYEtz9Iokh8KOXB8VklAH0vP5sFgtPMMT0RdWFmJUV
	+yWPMFgI9G79YpV2ox5ROgin4B58woJEspi2AWA==
X-Gm-Gg: ASbGnctxsgc4ff8JKC+bCPiWUgzKI8GX4Tl7oJKhmxTzqXhmlm0LBMRZ+p6KH5Rjmcg
	MLS1oE5J/1IZVkAFRjIuBwPbbHEXk7wZ0xXiK
X-Google-Smtp-Source: AGHT+IGshDnah7yTVkge7frSzXP6u6YQ9EMlI5n0k71zbBXiVfkDniOTr0RXn5mT0CNZhOwwkIPYxH+G4Ml04S4rkI8=
X-Received: by 2002:a05:651c:221a:b0:302:1e65:f2ab with SMTP id
 38308e7fff4ca-305f45dcb78mr119399301fa.20.1737018543217; Thu, 16 Jan 2025
 01:09:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com> <20250110123923.270626-3-szemzo.andras@gmail.com>
In-Reply-To: <20250110123923.270626-3-szemzo.andras@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jan 2025 10:08:52 +0100
X-Gm-Features: AbW1kvZEtDtDDV1b-JCy06VodlCu92OcKCF4KhRqyAArlBqTeeutEPgAkUkNoec
Message-ID: <CACRpkdZ6yNvtqjYHaWC6ynP4CdkGSdt5AH9ZrZDqYq=wTehu-g@mail.gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: pinctrl: sunxi: add compatible for V853
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 1:39=E2=80=AFPM Andras Szemzo <szemzo.andras@gmail.=
com> wrote:

> Add compatible strings for V853 family pinctrl.
>
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>

Patch applied because stand-alone, clear cut and reviewed.

Yours,
Linus Walleij
