Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34D1328AE1
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616080; cv=none; b=R8XfEgX0WRot5aPkeB/gAES9Y+6pbyl0wLAMn2joNb+fJkzrQlgqJwoy+pyycGyou4NugDT2wqxTDxzcJTL6KG1VMeD8W6hQj9OawC+YN5jSuQy77OBsZ8OgjxQxPRR1AvOu0D19XsBfzImF67rgk7e8QPLAR9uskbvvkibG53s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616080; c=relaxed/simple;
	bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRkX5W4blEJewX29vL0sh/anwRzsSc5Keb/nk++E2EX8T461FLo8QoyiJtr8jPrbaMdLXLyZwGlO2KO3qutRSLDvqy2nzWYs8eM2gWrxBJ5dF7ZkNo8fw/aGVZG8+vJPuKNxo3ONK26jNiQc2cvqBLXrkllyqCdHYI7vcHZG4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsYe9ptU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsYe9ptU"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55628eaec6cso685942e87.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616077; x=1752220877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=JsYe9ptUbRq6ygTfZJ8qav+YgV6KfWWlDestKyxznjWfjFfBiF9FWut1LEiCmE4zNs
         bWCMcPoiFmzvQVT5uw8Gl0sLHU5avS7iCPu2qQheKSZFuQi0J3E+Cerssto2XrXAWaDN
         m0guWsEP08rtH53zQxzWaakfuUy5ZwGRAzdgNM5fMlmF0l/WyWGUdqqttagbWVXEb/7U
         TfaAzKbmhmSHZEJS6c2GKTIRfaGQ5pgggLhQtEctSEFSbALnaiWrSZswpNGvD34aDMaQ
         DG2IqwRes2t+rP9nyAT3DEcynYE82IjmRdLXErjKz6hJGAuLV8t9VXBEoIUncbYX3UjX
         Xtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616077; x=1752220877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=WJRonBBw+YqCSKvJSFSPZcHF6XKsbp0hCXQhob2V6Hq6j49LmhlqbeynCl7tH5i2pZ
         pBuhfkO1C24+aRxl3zmO2Jhak0u3UsSFTXLz+xhjPOG7WeOfOHNLyGjRPdz4qSpZzpyB
         kZeuM6Chw48eW0Ar7gDznqnFFSHK4n5HU9w0X1DPIlfmgbwRQcLqEwvsXq0t4jWo0tM4
         x5qhT6HFWya4PDyruqeh3pUAi21BIBpRwFj5q29YmhmhrtnKLOlVlYPeggjuGXv/Fxah
         B3WsoCl/5MEYyDKKeZyb8NFvxlMbgvowtAJBqijczhSbnvG9f54/rTeYSDTnzVj6ioSk
         PBCw==
X-Forwarded-Encrypted: i=1; AJvYcCW/F/gyF85QGdMZyOykzqhfdQVrz58T/WaRvjhbzXMh3u8lKo+oBL1fOBTtO7OevyoWTvtLDetOmy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcRz8j27rfc8xJGtqvFdJ+36T7bxUjRDQ3z/2Mv/74262KJGdT
	BjzU9HsyPc0ONycrVtmdFAAqaodyPr08PulOCCFP5swt113zzUwQ2jTEw62muYq4JgHXIYBzGrB
	EgiS0VIDq7z8QVlmeRlVuDgDrTcEyIFaaRN0L1B1m9w==
X-Gm-Gg: ASbGncuOdGc7L2Z0YQiX/v3VAKo2cA829kF5/mpOF12I35xWZo8fYQLzJkryRcR7mUA
	oNHihKIg4IRStiqqJHo57FUXfayUWavjygMHTUlNzHfwx3j5jSA4BS/BWDGGUwmQnEMrsp/zCqE
	TmLZDaDriUkCexTUxUjJwN/FmcWLp8Hs1qeaggcDNAqFg=
X-Google-Smtp-Source: AGHT+IE/4XahMx0H5K8e3G6kGLPvEJmDNT+z5yGiSFu4fWzVouleMPU8+EMqNIa7ZAvHuQVSQceFfXnXHQe0peqw8UY=
X-Received: by 2002:a05:6512:b26:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-556f1f62c4amr441161e87.37.1751616076829; Fri, 04 Jul 2025
 01:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io> <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:01:04 +0200
X-Gm-Features: Ac12FXztT7uc15QsZMvB3fPDcO72_tN7xc565ddgY25DgxMR-aqghVzmCalro_g
Message-ID: <CACRpkdanKtZBkH90yAOjm2+7+dcNri+j7wV5AFL7NHSXHi+bSQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:13=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:

> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij
