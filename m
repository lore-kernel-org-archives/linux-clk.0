Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8966026F
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520503; cv=none; b=pM+O/VfgIQMHRGT6p2Z6DhuAEh+fxFfg3Wh1coTrGhyU32czzeLyiee50nH4aaVpK38D39KLjW+nNgRaDiicis0KZhQ026yE00sOGjtsXVTTW7Vj7yykqHySn52wOT5Gv5j5tclp7DdfuxUbrSLWd80itjkgl7sYM1A2Nu6Cuo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520503; c=relaxed/simple;
	bh=fqIQss9YrlmVdaiZwyyrl0wDsFJ+mHTn4IZB8IBL3MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXKaRKC7cuM4LCEb5H+c7rBFgEJnvY6jAHx97C0FiA6gyYRjqA1wnFJGgL+lm73j97fPVYotkxl3RnUhmIVz7tMRaqZr/yBTEovbtaTxwb29KIqZEcLeRnk3EKWDOdCxR8poFau9xrgXHEtiUnn+RUJnoqGt9B6KpkqGabmhnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UAqxeE3C; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UAqxeE3C"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-783da26489aso212130385a.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 01:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706520500; x=1707125300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4q8db41yY87l7MxKvbYpo3+xjJtcNE9e9gSZAUqcvLs=;
        b=UAqxeE3C1ZxyM2d2BcPUz99YFgY/WnpE58yTZkT2naebUlL7SubL8kkSiabXMf0TCL
         2jBd2kmLxdmLs5nJVLW6okr+qCnMXLfqLaUmuLkjD0WIJc7PvvPQi2LItnGUqM2Cid4M
         JEmOAq9lMYPdVa1C48P3/ZLqm9EKNuQJr5bQlNJR7JZhNAfRb6aeALC0SaFap2AFPCKx
         6YL50Fk2DykjfGJ/2iy1EJM63y8s7H9G384FOvboiqe5DFOCChe6g8rEcsbGYrMDPQCy
         EJqH7aHMuAPxIhsehOi9HyZBwkPd+aUcOZ64yknNFWtt3lvM6HTPbqOSUcaBTDbSnfBR
         VIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706520500; x=1707125300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4q8db41yY87l7MxKvbYpo3+xjJtcNE9e9gSZAUqcvLs=;
        b=HAessMmtrrbhiXt9um46OL3nBnYEe2QdnxBr92vdZShONGNNGXKBEDaLn2DTUGv48E
         FQ0ib/4O+xhPXDrYoxRW1XJd86h41uHZez0X99+AFgCDObKyjuX6KpzAJvXfNuPRAix+
         1vo/6yBalzmhxI7y7rg6u5G3gnNII3EbKbYlm0bDS8aA7bwobF7AJZ77sZkUq83WSq4D
         YFjDQF2Xdwzk8lGKiL9rx0cy4vlGAo65QPVSQEpLxZEuspSYEglC8qAbFb5tXIkJ10Xb
         jUbwoQctcK0CsNluKBQG9fzUVA1zTh7L94WoKSL5WG+Zn7zkfvdwEbKg0SvTPYPACApv
         CRSg==
X-Gm-Message-State: AOJu0YzythH7RMi4RS2XOkhPFbx8qPEKPpDVbkat0zv5gjjsqi0WX3Rz
	h8RbeYmiEVYtXTK8lu0BiNTYXf69DO20u/sghZRieJN2bgwA0oS+AVnYzj+3vhhn05sCqdgqZwy
	HZoABQCXTNtEcx1v7eUqhUuBjxrZj6guMqwu/dw==
X-Google-Smtp-Source: AGHT+IGYFxZ7DGE0AfRt4ew5dYvWGTQXLN6eczBCd27vBSvEmlBwqJjbpYwEvVAfNowUSbRibLTBmiPYXnGcFr6dY2E=
X-Received: by 2002:a05:6214:2a87:b0:68c:5337:b717 with SMTP id
 jr7-20020a0562142a8700b0068c5337b717mr677358qvb.18.1706520500069; Mon, 29 Jan
 2024 01:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-7-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-7-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 09:28:07 +0000
Message-ID: <CADrjBPoTPzWo10VvFX1m83q72xqzR_y83TZ4JSFgK+YtyaRsPA@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> This bus has various USB-related devices attached to it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

As Sam said, you could be a bit more verbose on what those USB devices
are on the bus as they aren't enabled in this series. But apart from
that

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index cb4d17339b6b..c8f6b955cd4e 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -72,6 +72,10 @@ eeprom: eeprom@50 {
>         };
>  };
>
> +&hsi2c_12 {
> +       status =3D "okay";
> +};
> +
>  &pinctrl_far_alive {
>         key_voldown: key-voldown-pins {
>                 samsung,pins =3D "gpa7-3";
> @@ -113,6 +117,11 @@ &usi8 {
>         status =3D "okay";
>  };
>
> +&usi12 {
> +       samsung,mode =3D <USI_V2_I2C>;
> +       status =3D "okay";
> +};
> +
>  &watchdog_cl0 {
>         timeout-sec =3D <30>;
>         status =3D "okay";
> --
> 2.43.0.429.g432eaa2c6b-goog
>
