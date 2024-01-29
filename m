Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A65579D
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706521732; cv=none; b=hxSjeY8l7c6KCiQwsBYZBij20puKjZ7msdDTvFYJtPRsL3W7r4iQELu7ntywVJbzl/CECavFMXLfom0659Ilid/KPDw27zMEWMEfvLK4DMgmQz12nYkmcU9wMW1yM00OR9sQV762DyvqTx3+5vIFGzV2SWfGcKpEGJLNIDu9koc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706521732; c=relaxed/simple;
	bh=BA1tOGEvLJ2F1biwjB2573ANIuiUoV8stL0uXeeVPnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGpquQfYkm+q1l7t9zDwYQd3zgoMDySw9AbUCHuMztCpy56pQ7JYNzqKM5lYcoHXN9i9IH1ilr32MY44S21yk2M7OL3LWnneMNGlodLPXdpLY/6xWv5lnjhXbkVv20FbCdDGn9zuP0U+z46oOFXYPaRrJi4jYio4AgH+DIhlBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JeGa3dgS; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JeGa3dgS"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-783d84ecb13so272676085a.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 01:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706521730; x=1707126530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHEsVlM7f5nwbIgc9gzWyFxBBE04dfKP6ctAVu1W4LQ=;
        b=JeGa3dgSsjcygSr6r7tr9gwnGHHJ8xC36E0lXADUUDAT3b0z2wUc6orpW2w0W7R5JK
         8zVXJhEfUEDcyef6P7Afmg7jGg8OZxspOaKOtd7BFI1TFql/wui+tRnHKDMvAgEQUQ3G
         3/EFX659GThPRQsE6F5ewxqExsC6JOjkzuPSVqTnVrOjETaHaj0qW34JAWHV/JFmv7u4
         vRsZcQBDxlOu+8OKloqntIXF7dureVbgvK9sN8r1gJVXDOzX/LCH3KZ3TUT5KI+fRmsu
         PxRj9KFixCsVGFts4VkluiW2uqHhWWN0FZzTYvvfZ5DCK2K/1aPpBmEhF+xYVzVL1Vr6
         AT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706521730; x=1707126530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHEsVlM7f5nwbIgc9gzWyFxBBE04dfKP6ctAVu1W4LQ=;
        b=weA85bexfVUxn0tI5xHy5LSYvZsan11duFDEQcE+I08RnnQgFaeXXIr75DCQjHzsJv
         gzoXEBsu/jBNdJ+TRJBjMRqmJnqdIqxG9OWQaK8nUQJZV+m4m4qm2I9BtrfzZGkECPUs
         9iuWdS3B3pjqelheUYpPaUgM6dSjWpJ18gMIgUa84TtKhnf+GQAMOQCr3ko4akI/hNgt
         aGmpw+l7YLJxq35qgvMHmMIPuZ9dDXcyRIU2NNuQq/Azh7GMrLOUk+WQAesiGRbUJp0O
         c+zeJZz/DdQaDSEn15QdzArXzybM2KaWwzw3xlC7F3ES4cVOqXmNQ+xMnKRkWipqLrSy
         /cHw==
X-Gm-Message-State: AOJu0Yyc9uaZN1iuPIfFzqohaIETvdt/J+E3f2xbtE/03A0/8mXgXU5G
	deyW/rPm+5yZbGdkGkA3BP1cfaZnzforu6c8sagkCGPqpInlyHj9NxJ7fnLy0PXEDUeKAxCJ02Z
	d685z+A/Yx7KpP4dyZCZlG+UsyoLhNMbCvDGepQ==
X-Google-Smtp-Source: AGHT+IE/FkXm22hoOy7Bm93rW+z/+jgXNC3MtDsNhFcBpfDqK2p05aSH1dhnMpcNvIVeXslT5ipbAnbdvzJvrwoQ90U=
X-Received: by 2002:ad4:5f8a:0:b0:68c:467d:c60d with SMTP id
 jp10-20020ad45f8a000000b0068c467dc60dmr4539234qvb.118.1706521730025; Mon, 29
 Jan 2024 01:48:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org> <20240127003607.501086-3-andre.draszik@linaro.org>
In-Reply-To: <20240127003607.501086-3-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 09:48:38 +0000
Message-ID: <CADrjBPoTewqx2eF9Zw2EHZtjEpPzesAA5cEjVKw-WWgTT8fd_Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: exynos: gs101: fix usi8 default mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:37, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> While commit 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with
> I2C configuration") states that the USI8 CONFIG is 0 at reset, the boot
> loader has configured it by the time Linux runs and it has a different
> value at this stage.
>
> Since we want board DTS files to explicitly select the mode, we should
> set it to none here so as to ensure things don't work by accident and
> to make it clear that board DTS actually need to set the mode based on
> the configuration.
>
> Fixes: 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with I2C con=
figuration")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index aaac04df5e65..bc251e565be6 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -384,6 +384,7 @@ usi8: usi@109700c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_7>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x101c>;
> +                       samsung,mode =3D <USI_V2_NONE>;
>                         status =3D "disabled";
>
>                         hsi2c_8: i2c@10970000 {
> --
> 2.43.0.429.g432eaa2c6b-goog
>
