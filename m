Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8B129A67
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713268623; cv=none; b=YFvwBfwCL/r6zPY/jPUclgDsi9iFx+eOrb7YAr+7x0zfe9XJa1GI9b6m/fTzEss5uHX09J0Oxsda2qHCmcYsTBV1xsuFmMX5oKaBcWVB3GvC/YS9PnIFRX/GoMkuYqibEdYX62rI5E9mwqi5KWNoIyrXcSGkxc6nwidZBZcl5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713268623; c=relaxed/simple;
	bh=vIl3v//FVA36XrKiforyh9hY0/yXzSMuW90U1Lzldf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmERFg5ulpAS7pRjyl7wTNU2Y/lNrlBcHPGWU/ELN8LVes+pgMYVyyx5SAUJKpD1ChPLoHMNxHqRYoGtabNSMawSzr43Gm2CxDU8Vhklk6a/J1+iDJWbUahWCkLeob5fjZg0gRAWmDZtw1vujX/WOO6y42m2j2kNSRsh0+M2v+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gz9WmO7k; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gz9WmO7k"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5aa3af24775so3090355eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 04:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713268621; x=1713873421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ophtYrF9IpPwZurMvgYV2hp9I3BGj1tkL8j63ZRtc2I=;
        b=Gz9WmO7kCZ43n/DskXOZM1KQL8yfYN3ny1ID/TYpE8+fiw1oaCHSJI/u5jUtGTaN+A
         pUSztS3Drg7bwQNxtko2pPWvuAVEAmXKxYzhRARYk/fREmuQIME7yL7naXqeVys1nNWB
         q6VjmT0FJ9wIvALp6VuMNEHSFzxAAU429Phe0bL/JGEdR340goIbcRSSwpOAfAL8Atd9
         2pYqrl1ingtY5Y+PD1WAuQ678pn4DB2IuY5UnnLz4QrLZ2xptPfXG9zJiiGtV2FtR+Jg
         5SWimmHng2PY69aEiEGUHGoDTm7SqeF1UerHiAXTtpAsayo4ZIhXfCQfWk0NEsIPJsAj
         GZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713268621; x=1713873421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ophtYrF9IpPwZurMvgYV2hp9I3BGj1tkL8j63ZRtc2I=;
        b=B+15z8oHmQtePLZEbH95BSzJ2oWWAM29tN+2KZMYrJqn/eYrrBA3IoSQkTECdmrRUy
         NI0Luij/gZ25f4zomI9hXdTz42kRXlSKp4Mn2A4J2uT9FhuatHTCY3bDuC9GKMPqzrmX
         N07MvRjN0UDSdg1++8WWIJyTWmopKVGjWFGLUoepP5swQEJO4PQ0fRGk12mz+Zpohdy8
         zP6jhXQDiTAO4CVq3OKlyeLLs+6qZpxZ1ym1fmfcv+bT9ioB5WuSi7/AX+vgxubH/Gtb
         99InFYeVhc7s8+bSSTEr8cq48nW2kYJTJPKKDyh7XeNOE87EC5dEeu2cNDImnWWGpsJB
         fAUg==
X-Forwarded-Encrypted: i=1; AJvYcCWmdkkL/scroTwG5mYvZy+Jl84QXPWH6PfqhpbgKofSX96QEr86bwocpDGa1d7M82S7020gOgCbwiSXRqzZpHg/TLFykInQhTRD
X-Gm-Message-State: AOJu0YyFtix/bCRxCgngST03PSh87UIO3Tky9mzOMpEoEZbnBg03ySo4
	EbOZctwQnDKiVlbYHFglXJo+vG3Z3bn/nh0ID/uLn0+2WnndAd62XSyck3GItQ3O7/vc88GvUdp
	B/GM38vKZVADdKMf0rrGoeY6JG6GmpMIuGsxicA==
X-Google-Smtp-Source: AGHT+IGdAJXHt7mAsVZuzt9JgE7vdWoLagtGQT3T15A+kBPHpQZl6zuXKVT8ycszrHB5VvpVeZdYSex6pwkAq/Bp7sg=
X-Received: by 2002:a4a:aecb:0:b0:5ac:9efc:3b02 with SMTP id
 v11-20020a4aaecb000000b005ac9efc3b02mr5501112oon.8.1713268621486; Tue, 16 Apr
 2024 04:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-6-peter.griffin@linaro.org> <391a874522a4141b4bc7f0314a9e50d27142123a.camel@linaro.org>
In-Reply-To: <391a874522a4141b4bc7f0314a9e50d27142123a.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 16 Apr 2024 12:56:50 +0100
Message-ID: <CADrjBPqwLt6gzwMpkZvxp5sC-owdDYUN91F0-nV2NvEzek_v9g@mail.gmail.com>
Subject: Re: [PATCH 05/17] arm64: dts: exynos: gs101: enable cmu-hsi2 clock controller
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review.

On Fri, 5 Apr 2024 at 08:38, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> > Enable the cmu_hsi2 clock management unit. It feeds some of
> > the high speed interfaces such as PCIe and UFS.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/=
boot/dts/exynos/google/gs101.dtsi
> > index eddb6b326fde..38ac4fb1397e 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > @@ -1253,6 +1253,18 @@ pinctrl_hsi1: pinctrl@11840000 {
> >                       interrupts =3D <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0=
>;
> >               };
> >
> > +             cmu_hsi2: clock-controller@14400000 {
> > +                     compatible =3D "google,gs101-cmu-hsi2";
> > +                     reg =3D <0x14400000 0x4000>;
> > +                     #clock-cells =3D <1>;
> > +                     clocks =3D <&ext_24_5m>,
> > +                              <&cmu_top CLK_DOUT_CMU_HSI2_BUS>,
> > +                              <&cmu_top CLK_DOUT_CMU_HSI2_PCIE>,
> > +                              <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
> > +                              <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
> > +                     clock-names =3D "oscclk", "bus", "pcie", "ufs_emb=
d", "mmc_card";
> > +             };
>
> This doesn't build because you didn't add the clock ids in the binding pa=
tch.

These clock IDs are for cmu_top, not cmu_hsi2. They were added as part
of the initial gs101/Oriole upstream support series in the following
commit

commit 0a910f1606384a5886a045e36b1fc80a7fa6706b
Author: Peter Griffin <peter.griffin@linaro.org>
Date:   Sat Dec 9 23:30:48 2023 +0000

    dt-bindings: clock: Add Google gs101 clock management unit bindings

    Provide dt-schema documentation for Google gs101 SoC clock controller.
    Currently this adds support for cmu_top, cmu_misc and cmu_apm.

    Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
    Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
    Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
    Link: https://lore.kernel.org/r/20231209233106.147416-3-peter.griffin@l=
inaro.org
    Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

regards,

Peter
