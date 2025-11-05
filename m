Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28B31960A
	for <linux-clk@vger.kernel.org>; Wed,  5 Nov 2025 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762348709; cv=none; b=ls5p5EXtPaxOigMHgiv5g1EiZAcMQb9DYVev25VPj6v5nXAJUBrhWBahAm41DhTiAR8R4PqX35TQJ1HczvVnnLlKk/DT9kOPoaTU7J3usmleiqwk6bmFHczEjxZxPDKAgFCurXVFS/D9+uyd250GAZO2AgJ361Ci8oyELeLrbW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762348709; c=relaxed/simple;
	bh=wl4aysANLOfX0B50JiWajRXky1BkXyekiwA8JCZUlIY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=n3QK2wdsAd0Iq+pSKl7Y8S0w6KhxRSrd3trdg6jaIbbQ7HH4HeCL/kG4idapPgjgQOp+uQbBD8M8iuOnpsGGeNjGvpVJjatVk3O7cyJKPrwN/8NGqmeWz31aH01NJ1CxbYT9IR4ipf9hRntjV+kuhaV4LY8GUtglLCPKlUgSFW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=aa6b5568; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="aa6b5568"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762348704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anJy0kovOnmwnKwTf1uVV5HwRBu0s+Xw6msJvdrAWkM=;
	b=aa6b5568Qh3/bE4wzKB/hpYPvmdW4nlyMx41tGjnmZuoU64FMmoh4cXl1BRU5DJ6tuo+nI
	3HSYeLTC7A200JHb4jozfS3Q0HgGytOBgeky7yw/BxPCMnlkdGUMCr+Xooh2VOJaWNvruP
	BbBMVUyM3OUs1s+qs+7rdLcCskHKQe7q47xlfLhSUdGa4V0LtZvnYUjzOa+HAbeokkQGPq
	Xe5gFcTNi0N3+crmQfPC192PhyQd03iDeVnEwTxdEwVRH2R2MCNzUfbPSO3XYuzSqXY4+i
	IWJzneP/ljxJaSA6odMvzs1zM5cn/jb+7sYU87vOWDBcBTGBP/ObrAsTfnVg3g==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 14:18:21 +0100
Message-Id: <DE0SH4UBVXBH.77ADEH3224GK@cknow-tech.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michael.riesch@collabora.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add missing clocks for cpu
 cores on rk356x
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>
References: <20251103234926.416137-1-heiko@sntech.de>
 <20251103234926.416137-4-heiko@sntech.de>
In-Reply-To: <20251103234926.416137-4-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT

On Tue Nov 4, 2025 at 12:49 AM CET, Heiko Stuebner wrote:
> All cpu cores are supplied by the same clock, but all except the first
> core are missing that clocks reference - add the missing ones.

I noticed it myself some time ago (but failed to sent a patch), so

Reviewed-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index d0c76401b45e..a1815f8a96e1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -69,6 +69,7 @@ cpu1: cpu@100 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x0 0x100>;
> +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;
>  			#cooling-cells =3D <2>;
>  			enable-method =3D "psci";
>  			i-cache-size =3D <0x8000>;
> @@ -84,6 +85,7 @@ cpu2: cpu@200 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x0 0x200>;
> +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;
>  			#cooling-cells =3D <2>;
>  			enable-method =3D "psci";
>  			i-cache-size =3D <0x8000>;
> @@ -99,6 +101,7 @@ cpu3: cpu@300 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x0 0x300>;
> +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;
>  			#cooling-cells =3D <2>;
>  			enable-method =3D "psci";
>  			i-cache-size =3D <0x8000>;

