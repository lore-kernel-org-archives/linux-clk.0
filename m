Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3A7CF2B
	for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711625121; cv=none; b=PsV/gLujeDap78pLa0K/0UEcI3FQOr3rThgKGkskLAXIgy7TuLx+ffXEvq/RUI+5GRmtvx2E0i5UunpCjlek9YdcPVO46t7g8SzhMSJitfwtllH9uaChZH/NeNcAfcOytcqNFbxqgHXbP9WgJ4NhLAnwaV5xZC5q+pDGxmi+jp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711625121; c=relaxed/simple;
	bh=ReqiZMaFal2HmdF6yojPFU7SFMvwR9W/4on1lxJ2DGw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LcwtFJKo+574fhiuA6Ez6mTIzae6pgjVCqC0RJdmt7uWG/pAIH+wL7RYAV8aAbKMlxtQjDqvPhzw3/fo+kZCqnajzgtmApZfLdhn8+BJB/jKAC4LF0ZXKjSw4iVpk/+HWIElx7Mgj+PVeEz5K/K7DhPFP1S2gijExRonfxx7tlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gl4v05Tl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gl4v05Tl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33ecb04e018so552654f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711625118; x=1712229918; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ReqiZMaFal2HmdF6yojPFU7SFMvwR9W/4on1lxJ2DGw=;
        b=Gl4v05TlhyNcfw9H1Geb1CYBTPBwT4w/BxsNU1ictJUL/Ff5HUSWQwVg7pPIWwd83B
         P4c5Q1mh3sJThmVFkm0PRAbE+FULQGwNpirD93K+peixut7ycgzAiLMj33wxKiGuv0fx
         N5yebskEyH8ynkSpG4/82N/r5VLqSutuKfUHFbJO1FEoHZ/rCT3tMBZ5xxZJTLwwYD04
         Jb0vAqrKOVyFHgyMQGaJahZ2TZMKlUS06F0FJ7nluUqeCJxiO1zsC2un7ikdMZQqWezZ
         YhBeNrTduWhsYkzkbM0496hPDHG/4IvWIY2Bg1WjhXkkBre11rF7POkuWqMzXFLjaEj5
         x2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711625118; x=1712229918;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReqiZMaFal2HmdF6yojPFU7SFMvwR9W/4on1lxJ2DGw=;
        b=aHHJtCcI7UgC+YEkMAHfK+mo6uTOgT3EDslIYG2xpvtcDWoVfXwbRN7tzCWoulT5UJ
         Eq+HwZOf2kUVtq+hUf5drGHqOEOWRxqgmUp0GD28zYZEPR/HBxeN1c+UEIIAwrNzx5Rw
         bBELIenk9LNHSa7tdD4AdHDmTpLvCtecBRhm90HI/7gvZPxOmMqtMSmwqCvDdeMjhmYY
         CeKRE+nrdTakPDoto24uhy4FolJLXj0lE6ncVZFF6SKvR9EQzjAYwgVZe7qxwMb0vRK3
         BBXHi3GN2ijkQ/i5x93ivhEYGLWmx7+yJciN6dQsgaYTXkcPObFJLMunGuvIuc6EH9aX
         BpLA==
X-Forwarded-Encrypted: i=1; AJvYcCW7CObsEkG0s4FmNp0pAs8WVqViJE366rLHEOjs3EOhVXzv1msaLB86YF5iKOSMZuIwr+nv78THcveudkGgbVIIc4dNyz7RRBSB
X-Gm-Message-State: AOJu0YxEzRKMiaOg6u+QkpIdQnulkwxas+IsVz44hVY2y/WQHiu7mOw8
	ity7Tp7ndSr4KKrihq+UQliKrAgX2nk132jz9z+OwXKOSh92LxIfgtGrY2UIaCE=
X-Google-Smtp-Source: AGHT+IG3rpM6+1a4KBV63oMIbrPS8hANggXGrZwGuY0lneIQs2DVnJVdpWA4J7EbAZOyKm7IfBsIkg==
X-Received: by 2002:adf:ce11:0:b0:33d:5fa6:79bf with SMTP id p17-20020adfce11000000b0033d5fa679bfmr1750674wrn.71.1711625117639;
        Thu, 28 Mar 2024 04:25:17 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id bn22-20020a056000061600b00341e2738eb4sm1512382wrb.95.2024.03.28.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 04:25:17 -0700 (PDT)
Message-ID: <ed636c3e3dbd733b7135f0609e070c7afa8e673f.camel@linaro.org>
Subject: Re: [PATCH v2 2/3] clk: samsung: gs101: propagate PERIC1 USI SPI
 clock rate
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org, 
	krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 semen.protsenko@linaro.org, linux-clk@vger.kernel.org,
 jaewon02.kim@samsung.com
Date: Thu, 28 Mar 2024 11:25:16 +0000
In-Reply-To: <20240326172813.801470-3-tudor.ambarus@linaro.org>
References: <20240326172813.801470-1-tudor.ambarus@linaro.org>
	 <20240326172813.801470-3-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-03-26 at 17:28 +0000, Tudor Ambarus wrote:
> When SPI transfer is being prepared, the spi-s3c64xx driver will call
> clk_set_rate() to change the rate of SPI source clock (IPCLK). But IPCLK
> is a gate (leaf) clock, so it must propagate the rate change up the
> clock tree, so that corresponding MUX/DIV clocks can actually change
> their values. Add CLK_SET_RATE_PARENT flag to corresponding clocks for
> all USI instances in GS101 PERIC1: USI{0, 9, 10, 11, 12, 13}. This change
> involves the following clocks:
>=20
> PERIC1 USI*:
>=20
> =C2=A0=C2=A0=C2=A0 Clock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Div range=C2=A0=C2=A0=
=C2=A0 MUX Selection
> =C2=A0=C2=A0=C2=A0 ------------------------------------------------------=
-------------
> =C2=A0=C2=A0=C2=A0 gout_peric1_peric1_top0_ipclk_*=C2=A0=C2=A0=C2=A0 -=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> =C2=A0=C2=A0=C2=A0 dout_peric1_usi*_usi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /1..16=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -
> =C2=A0=C2=A0=C2=A0 mout_peric1_usi*_usi_user=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {24.5 MHz, 400 MHz}
>=20
> With input clock of 400 MHz this scheme provides the following IPCLK
> rate range, for each USI block:
>=20
> =C2=A0=C2=A0=C2=A0 PERIC1 USI*:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.5 M=
Hz ... 400 MHz
>=20
> Accounting for internal /4 divider in SPI blocks, and because the max
> SPI frequency is limited at 50 MHz, it gives us next SPI SCK rates:
>=20
> =C2=A0=C2=A0=C2=A0 PERIC1 USI_SPI*:=C2=A0=C2=A0 384 KHz ... 49.9 MHz
>=20
> Which shall be fine for the applications of the SPI bus.
>=20
> Note that with this we allow the reparenting of the MUX_USIx clocks to
> OSCCLK. Each instance of the USI IP has its own MUX_USI clock, thus the
> reparenting of a MUX_USI clock corresponds to a single instance of the
> USI IP. The datasheet mentions OSCCLK just in the low-power mode
> context, but the downstream driver reparents too the MUX_USI clocks to
> OSCCLK. Follow the downstream driver and do the same.
>=20
> Fixes: 63b4bd1259d9 ("clk: samsung: gs101: add support for cmu_peric1")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Acked-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

