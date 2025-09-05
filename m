Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAEB1EDA2B
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 05:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757048771; cv=none; b=K3NjuBfj+NRiHvWR4FQ5bZhnXj/5wRj1aV0iZ18BlSLiS7vfJyzJPxxaCJJ3sV3/Pytk4S5uUFwPIONMPUuoVAj3WKUfdTv+WPABwbvhkCperEHNpu06IXDFXuNZhOVJsKHgOTrYYBEcOiJY19ff17qm5nDZ36vVJHvlEo9JC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757048771; c=relaxed/simple;
	bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8754//yB2Y5KvetSSpyXBY1OMxNOnDieGeBrnqEzMdp11gX9CTNmaMae5WFlFFXWN3PgrpwUBkJfAFO09ienNzA3Ic0kEjnpw+WA3/66ujx6ljgJl+PlBtofbxuvq/Zh5gsjLrphKkLCsR9jKW/bAmnqhW5hQ6y9uNkD6nMkLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LTC40j2N; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LTC40j2N"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-336e44ca0e4so14590941fa.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757048767; x=1757653567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=;
        b=LTC40j2NhJIUbfcfiwhuFTP1F4xtwf13zov2SaNIy71Uj+HZhKA4i1+IL+7NQ4ttpm
         I3l3sTpHRneayPf47ZdQGN936BlRMJUJ8ziIHRvjTYZJr2qZ+u811X8NZP1G8yLD538V
         2H6G9DZLCq0iUkxwAQnnJIJEYree7JYI5Efhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757048767; x=1757653567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=;
        b=J8XqpPvlxV76aqMfKiXj9oYRvtuBtA52QC85vywvh6N9axu5RmRUYaSbBKrGHqGnns
         WKUX6tKP7LYvdJdkdlLymiK+dB+dBnx819ko7JqG+DGa/xy/nUOR1h0kvjjxazAcZLAx
         cjte8cUqeWtAzC7BuI9ylp5t+ykTdGWmfy5I73GSJ/gFwdqMYe+Sp5UIH+OxoR1gcWHk
         oR3e3f6MfruIf34dI0PpyFrLfttSJHCeR2quI1OnyXqt6tyAq0bt6nQpRmYRm3RCdTqW
         RsnLiCG7UkcpjK2KiIfQv5nU1esQxhm2CjYyKbmXNua3k3ZoTFM48jYLTi1zyoMqRnsx
         616Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCBuYgDpSAYGB+otYGDAIb1RNbYRk/caqNQaQRoHjSPuYcCj7mMNgTFPeVPJP+cdsHe1rCNGml6Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2NnRQTWaJCw2Rymw7yhMeRQYM4hBJ4lglnc3yMACVbDC1dy8A
	rqArK4kDQaiK7wAln6KzCE/7/VgtgLQMtPBXY8uz9panyhVW7yEuljNmj3oo0xSIXVsm151dyN/
	+WyS9zupqLPJ459GVrWLztjEL4n30df2mqsHjGA2r
X-Gm-Gg: ASbGnctE3UcKSTixskvT5l9yjQ61ecBgUICsfaOQ0p6WwZ7TFhsUkr1XwM0ATSHxPbe
	Y+ovwLPONkAPKiocd2CXe57EDZnlQPRph/4hfhKdf/R3+N5YXGk0eWjm5sNteMn9xMmkWEmKed4
	Wj00mTwh0ZAgHXLPaBWfWXH409FKSK6XTCBH/JXnd9M2+qUhzZKTkl8PBMpfmZNYZju+UZFonhs
	cW/YamjZHlmueKXaU0Dbwm8c33k75Oshq/dhA==
X-Google-Smtp-Source: AGHT+IHJjUpnhP9a9BCpvVLpzZvdmFRUDDu4oemMG1IXcZXVXfUhtp9wpdL0LzSmbU5jtUN4x+9LhikiWu80XNjJGfk=
X-Received: by 2002:a05:651c:2109:b0:336:d879:140f with SMTP id
 38308e7fff4ca-336d87916c1mr56567881fa.21.1757048766845; Thu, 04 Sep 2025
 22:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-15-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-15-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 13:05:55 +0800
X-Gm-Features: Ac12FXzUw4mCbky5MPiHj8W2ByhD9sAje7rRwu3IY62BkDBlMB6KCGdwR2WWCfw
Message-ID: <CAGXv+5Fj9Hwmk2y_bZhGX0EUEY42tm3t0nTrjtV-sYhD_B-xVg@mail.gmail.com>
Subject: Re: [PATCH v5 14/27] clk: mediatek: Add MT8196 peripheral clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 peripheral clock controller, which provides
> clock gate control for dma/flashif/msdc/pwm/spi/uart.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Not sure why CLK_OPS_PARENT_ENABLE was removed, but it does seem like the
right thing to do, since this block is always on and doesn't require a
clock to be enabled before accessing the registers.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE chan=
ge

Note that I did not go through the bit definitions. I assume the other
Collabora folks did a good job of reviewing those.
