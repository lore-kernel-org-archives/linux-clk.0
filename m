Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8761CD04
	for <linux-clk@vger.kernel.org>; Tue, 16 Jan 2024 17:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705427887; cv=none; b=opxyHO1vvLzm+ZxxQ6Ea5rfvwkknGM37SWq6HMYTKb+E2qHuDB0eeSAL/9ge1Qhbo64f3kenb/31g4RpqKzI6M8O0qdPcXVSyYoKXgw8myPu8cibtcVbGn+LvTDz+mLVZzJy28IhxVnuHU1y3vrqkV381RnBmPSaFAZXV89uWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705427887; c=relaxed/simple;
	bh=94CsEeB+VEaGfjxVcLH+dZSqndBa7lGsbFtuy8/OM0M=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=RixWS0MhDr19VUV184e79rL+8nDK1jbPGB40ho4ugZETZ+6ChIfYy2Zvb+Hmq6xg2dRlij5vcVU8izBuo/FkkcLgWELAvNBl1wHiuGtzs4KvpyYfQuP1jLLBWrv4LzAcH6GPkT5SfxVYoqQBDet3qHVtLmiZ/ZufHynhx+b2LX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MElkXJua; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MElkXJua"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso5223388a12.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jan 2024 09:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705427886; x=1706032686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32EVrbNt/EEZNt4rB/iUu9mmtUkEQtXJa14AmPNNrcM=;
        b=MElkXJuaawNydVw6JcsnRiYanA7raXGXtYwlPriMOTP0xS6fEBdXrldXAYa4/2J7ii
         3IwOdBGrX7PV9ogueSMc5vRjY+SA/MydfNhfmL0+uNKZ9JjFGt9v6kOqydZbRe5gBSxP
         oEHPvBKKZenqfk5UPSLZcfIzc82s61n4tTeyt4R2Y+RPWmlNXjUTqqHUIt1axZ8IhFIF
         NGGxdSQJuHrB7SGAKwvcESgWv/0AXD2a3V8tXdupAWyhlsgt4YHb197q8LK9Z96AKwI6
         e4FUdhDec8VZSMtqZLpdhptPKbWTG1JWvI3UdVaJxV6fy1oI6fd31APQBdIrj7JyKzhp
         /mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705427886; x=1706032686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32EVrbNt/EEZNt4rB/iUu9mmtUkEQtXJa14AmPNNrcM=;
        b=HHB2T4rj7pSg1ZlIzB7Vknfp6zbJotDYj9+sNn59wZ8hLcjVZCO49kfwYbP79xqYFN
         RLR2or4QY/LKLfTp6Q68K60iOu3q19uYIUoiSLJKhKA7t6yWuhBfoVas4kCcKye83BP5
         yKoK3sTbAFh+gqRg+YTVInlkd/fTQjnyvjLg0SE4STdKPOUg6ZlY8PsBYgqHa7VRTp+K
         UrX0TDEDmbOUaX7aJEB8lEJqgu2/0G/1rBsVaO0gnAS8ReqzcVOUkyT2jDsJSpAc3t5Q
         zW3uz2YwAKhD2vMPVnP/kBWLe+QpS1Up2RkyQGxMjCGlEnqmc6DYIunn43cmV3XrYCYK
         nZPw==
X-Gm-Message-State: AOJu0YxNIU3TQ+KYaQ5tm64vko8pyg6fO0C2zMLZQL+txuPrFZ279kZi
	W6liz8cfFfNPvuX3N2qcGeNMZXHzv5cE6+Ry+Vr6j8psycOPtw==
X-Google-Smtp-Source: AGHT+IHGRtGYR+ob5MH2hJ9O7cpvkhc29lKyflj59tl/q0n6uLbpibKZyAHkvaN5aYqJcQ+eGaWe0X2V6OSM6MjTHGU=
X-Received: by 2002:a05:6a20:932f:b0:199:f5ef:5a8e with SMTP id
 r47-20020a056a20932f00b00199f5ef5a8emr2984054pzh.62.1705427885815; Tue, 16
 Jan 2024 09:58:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org> <20240109125814.3691033-9-tudor.ambarus@linaro.org>
In-Reply-To: <20240109125814.3691033-9-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 11:57:54 -0600
Message-ID: <CAPLW+4mUMx9RvFiS0L2U+_Fd_PzcHhmNbyR4cmUrYF3BVgb=Cw@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: exynos: gs101: remove reg-io-width
 from serial
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, 
	alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 7:00=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Remove the reg-io-width property in order to comply with the bindings.
>
> The entire bus (PERIC) on which the GS101 serial resides only allows
> 32-bit register accesses. The reg-io-width dt property is disallowed
> for the "google,gs101-uart" compatible and instead the iotype is
> inferred from the compatible.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Just out of curiosity (I probably missed the relevant discussion
earlier): what is the actual reason for moving 'reg-io-width' to the
driver's code as 'iotype'? I mean, what is the actual problem that's
being solved by this -- is it to make the earlycon functional for
gs101? I'm asking because the bus width looks like a part of HW
description, which usually belongs to dts, from the design point of
view. Anyways, that's not a concern, just trying to understand the
decision.

> v3: collect Peter's R-b tag
> v2: new patch
>
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index d838e3a7af6e..4e5f4c748906 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -366,7 +366,6 @@ usi_uart: usi@10a000c0 {
>                         serial_0: serial@10a00000 {
>                                 compatible =3D "google,gs101-uart";
>                                 reg =3D <0x10a00000 0xc0>;
> -                               reg-io-width =3D <4>;
>                                 interrupts =3D <GIC_SPI 634
>                                               IRQ_TYPE_LEVEL_HIGH 0>;
>                                 clocks =3D <&dummy_clk 0>, <&dummy_clk 0>=
;
> --
> 2.43.0.472.g3155946c3a-goog
>
>
