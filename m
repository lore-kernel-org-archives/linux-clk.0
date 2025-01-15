Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DE81E990D
	for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940139; cv=none; b=SAk2XReKj1iEsUH2zx23p9Fz3F2zlC/UfWUw1c7XGtWppQaDTmO7J2IVLyrfjhFRrzBLx9PtMiEXJkUmRkIL6mh8ZJIncTaWw0tx/KXdXhMnOnEtUughJWahCvZTdMUhfPkgI0rlNcX8irOi0mZXcn9So9riU2BF3AUQVnLFtWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940139; c=relaxed/simple;
	bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lptLyllqSWxqHVW2fiF0a6nB/ze0iNOdOpV1jpP/Dv7WjdjwsVU4Sl3PioZaZuHbXZA1JQgwXyY1yBPNMyacHj7199nnWPyDq6kfpTeB3VJbd4K1gNfVc6iYMUTisRmbt7Gqe8VN1fSW0UEsSHHwkOolj1683/tuuzqJd3G+OZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZxeOeTG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZxeOeTG"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3003e203acaso49784821fa.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 03:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736940135; x=1737544935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
        b=tZxeOeTGo8LaRDudEsK7wQpZCrOFmTlYkh29lljUl9Da5grv7+ucWy3eRbSqykKIhI
         QpkZSI0RxXRqnN3A4WsULlCD0IvqqXNeAtKUwrxViwg/nA/aj3c+6pddYGzmz9FHFANy
         KkPEY/aSbQCqoT+cxkgsYQntc0Z6d85xGy6eHtwpmVOaEI4/zoGqBLb0DZGFGM54tE+F
         4nUDwe8aKi3Va97vnlFpXhF7xQBwKGznbjYiqqbcpBiT9iTScppuGyNvnbwr+oHdXfkQ
         lxDYD1U5dKfUKQwIIig5g9RCVimxXMpDx74rCf7YGg/aPyJNEVXk1B7io8mPibSm7SHe
         e3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940135; x=1737544935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
        b=BR4mZWydf32Re7qjwTVNO3eqPoYiUy1KJiMtK8nzs9s0eofR3m373Kv7TQDa24cGpl
         38wLL595UrmENTXAvCi/JJ/55EJOtyFdyZ9ZdZkcghv5e/4y4iirWEaVEGNVW0wQKrYz
         0qXMk+Fgubxdh7GKEIG3Nil90moJFYkABNyk2AXxAgGhwDD2/P6kFUeLaTIh1nIQNWIl
         GZBa8U0CqhjvfQNMC0cEtUZTmR/GhytyzvHpsCq1AOIlu9zE+IdhStf8R2FkwCUn9Awy
         CoEI2bKr5qBMQMEvITTSyAVqk2Zpvb1nJRrvxR8qL7BVoXgIZvsZDqfy+Fq1RkZ/x+eO
         xROw==
X-Forwarded-Encrypted: i=1; AJvYcCVFbm0iIA+KpjlzQUwRM8GpHVMnotsEn7sJvf4aLrCS1w8GZd+sR9P9glPKsdwCSiSCCTFUG9Sa/oM=@vger.kernel.org
X-Gm-Message-State: AOJu0YylxfzHugIJEdJZ6ywqxUtTftXU5vrsjM/ReeDTmNAn2yIU8m5w
	FGpSb4dM4njhhnYdgIOv8dnP7/VHhuuA4srG4WLnhK1tyB86ksA5YiVqi+GJRCEMdGkMcfmy8xo
	JtwFQm2L7nojNiXKxJr3Mw3aPjiC4xDAibyNI+A==
X-Gm-Gg: ASbGncu9mjUf4pO43ltBCjncudhWSenXy6d9XYVf//sv+4NjVgnlFc1QQBaYjieSgDP
	rQ9JN7Ntd2Fe/TP4Na5nlHPn+f22tMoiGX1evMw==
X-Google-Smtp-Source: AGHT+IFi9OUFsDG/HwAOWZDy5wxB1IFMes6uWrSDrSs8fqZfUq6g94ydbqgtsgXawPRPPFqiHwnnVYJjpekX/j3mPrc=
X-Received: by 2002:a05:651c:2124:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-305f45cccbfmr89843831fa.17.1736940135230; Wed, 15 Jan 2025
 03:22:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-10-abad35b3579c@linumiz.com> <20250114160045.2baacdaa@donnerap.manchester.arm.com>
In-Reply-To: <20250114160045.2baacdaa@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:22:03 +0100
X-Gm-Features: AbW1kvZR9tBuaRtZ7bNclb8qOifwSWdiMNHG0XPYW6GVaemjAImZEkZB8O3eBOg
Message-ID: <CACRpkdbZYFaTHoOAy7DYpaV77Tf31H4bF179OrperU6UGys2ew@mail.gmail.com>
Subject: Re: [PATCH RESEND 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
To: Andre Przywara <andre.przywara@arm.com>
Cc: Parthiban Nallathambi <parthiban@linumiz.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 5:00=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> Linus, in contrast to what I originally thought, this patch *is* fine, so
> feel free to keep it in your tree.
> Sorry for the noise!

Phew thanks Andre, I would have pulled it out otherwise so it's no
big deal, I'm just happy about active maintainers!

Yours,
Linus Walleij
