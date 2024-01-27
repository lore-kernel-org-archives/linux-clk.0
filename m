Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D885125A6
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 03:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706325829; cv=none; b=KC3iXvk9v32ZLGjeiooCMl5Zcyi71JOJHhBMYiDJ3WxNl0BAWmVNclprLY0mXxRXRNTs+M99cznYWDd+wFyRKcCTlg+imiBFNSXUjT4Z6SVNKG7lg2IqcdNZqwhTSYrJu+nIsbm3X4gdH7dT9/99eBFUFnWCUTa6i5WaeoKuDy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706325829; c=relaxed/simple;
	bh=uPulFRc8FjkX4HeBLwmiwMtnoHimEKUHZFaQfppV0ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mA4eQyUQESStDKiFTRqCfox+8JlBluZMM7O1/N1H6B8E6Aus0EjW9/MWuBST8nPMHcdkKwRsA5JpSK27G53EmHLtYaNHaN3tOyHeLHxEXXWPieU72xI6hg2ZzfAB3ph53MMbGc5T6Pk2+V+4krKgHpf6eISaW7QFYI7xMev/1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SxK2qkRr; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SxK2qkRr"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7835aea8012so99518885a.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 19:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706325827; x=1706930627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/onY+T6IN+/+UVoh4DXddCwmbmy59umuPspy0QiOtH8=;
        b=SxK2qkRr8BHVBO1MBAS2TQqdoMOFhet/Mvm075BFwQCDeqhld99fo3ffrZb9UivoVB
         6bTXprAxp1stoUrzgE3cqV8v9q//t/cw33x6I2dYbQzEHhXHM8Vt+MNN5Z04tYyOBq8S
         sT9xUP7a52LKGYEg4DbdqEYURnPOPRXIji7c6MKivM8PawtkTGXiuf9+ZHRuhNR6tr8E
         wQBaI8QeS/Ej0/Jxh8QgOQT5I3TzkT+EJI7ePwmjt8lfX9WuMpCpH43KbwDOpe9mxeGA
         eEg3iz3qALG2Ju07Mt62tfrsDH4TyOk4VdoFU1/jUvRzxjgcBzHcSFTWp6EHq2o7Z5Wy
         XEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706325827; x=1706930627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/onY+T6IN+/+UVoh4DXddCwmbmy59umuPspy0QiOtH8=;
        b=BLUVIxT3wxZdbKwooxkTSwexg5R5uwAxXOBNeV8gJ5CL+6tPfD5vmaRgpqZ8GWuBEQ
         DSmBqvMbX6oQZCZLum9xTez40R386gPLpA3udA01PlrmE3NS4Y4HdgzfISwAq+5nNdad
         rpV/IzWBAlTy3EZnzP5aO10h7k3OxGOoDlZW6bxe5hkd1cDWggdUzFVRK4y390qapNmE
         CklLX23pjDJFVdqynVuYA7xBDP/aSo5RC+p623v4CA8qbAleU0yMc//Ddmyyx4mizkDY
         7RSVMl9K93ptkelU5QWFJywomcYeEjiqgbmdUEEvuEKiFi1wPAzjyo+f6Z29TJyzozKB
         XJMA==
X-Gm-Message-State: AOJu0YxHBWLHZWmapMfP2Yt4PUwbFsQB4UzM8JsHekFaxx0r9geVZpix
	PqP2vJGga8h4v9r4j56STUC7jt7yXS97rdJNvGhs+czcLrcc1CM5P0d8JhSK7SZtQcvCbA44XZN
	M0XCGLJj6lraA46ODKL/24KZjuZSow9DmCiIgXA==
X-Google-Smtp-Source: AGHT+IGs4eeKrfPiYUbAc5idnEzlhQyRFYTpdzzUeOhjl9uXLCCHPSoX4s7nOTCLuhDcHg0ZshcURCjKjtXKlp4NWx0=
X-Received: by 2002:a05:620a:2796:b0:781:407b:9ae0 with SMTP id
 g22-20020a05620a279600b00781407b9ae0mr1023912qkp.48.1706325827049; Fri, 26
 Jan 2024 19:23:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org> <20240127003607.501086-5-andre.draszik@linaro.org>
In-Reply-To: <20240127003607.501086-5-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 21:23:35 -0600
Message-ID: <CAPLW+4nzZtWKf+jRxmfaZn09BRaazy7OtrNcSShWJk0Nc4iw8g@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: exynos: gs101: use correct clocks for usi_uart
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:37=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Wrong pclk clocks have been used in this usi8 instance here. For USI
> and UART, we need the ipclk and pclk, where pclk is the bus clock.
> Without it, nothing can work.

Missing empty line?

> It is unclear what exactly is using USI0_UART_CLK, but it is not
> required for the IP to be operational at this stage, while pclk is.
> This also brings the DT in line with the clock names expected by the
> usi and uart drivers.
>
> Update the DTSI accordingly.
>
> Fixes: d97b6c902a40 ("arm64: dts: exynos: gs101: update USI UART to use p=
eric0 clocks")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index e5b665be2d62..f93e937d2726 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -410,7 +410,7 @@ usi_uart: usi@10a000c0 {
>                         ranges;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> -                       clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC=
0_USI0_UART_CLK>,
> +                       clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TO=
P1_PCLK_0>,
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1=
_IPCLK_0>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1020>;
> @@ -422,7 +422,7 @@ serial_0: serial@10a00000 {
>                                 reg =3D <0x10a00000 0xc0>;
>                                 interrupts =3D <GIC_SPI 634
>                                               IRQ_TYPE_LEVEL_HIGH 0>;
> -                               clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_C=
LK_PERIC0_USI0_UART_CLK>,
> +                               clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_P=
ERIC0_TOP1_PCLK_0>,
>                                          <&cmu_peric0 CLK_GOUT_PERIC0_PER=
IC0_TOP1_IPCLK_0>;
>                                 clock-names =3D "uart", "clk_uart_baud0";
>                                 samsung,uart-fifosize =3D <256>;
> --
> 2.43.0.429.g432eaa2c6b-goog
>
