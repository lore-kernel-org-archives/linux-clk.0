Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574794;
	b=02331J6dps0UhPcIGfyRH3UkMU97Ix0DB+9vrrtqKSP4dOvVMyQ2rZACstfYdUAJnMom
	 5EnoMvJE25Q8obQyDuo+7i4HGOsBoMbEKmECkG6/KuM8PChYRgTCdlNmeZYpemZk+Qeg8
	 dSxGb0tGQNRkelwxchLuc3TBJ5rBXIQqbw0GH9Ag8Wtt0woWAfKDmG9DsPLy9gDFrTzwO
	 SyU340oXBnYyvpJgOtWk1rgNuZEaRIzG9K8k2wrpHoHL7Niou7c6kjOj0CSx8dXHZBX17
	 yH5o+TOSn8Gwh3995OSMJVif2dNIeOzh+ial9YnLMnV6kgaUMGebIoygwQZAoe7DZ3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
	b=UcYjgladBT8s15mMK9k+HZvyiGpTJhVssu64ZEjuXr2oO39VZScf+sBpOLKNfcDgHYMW
	 qzFshj/1O0IC42B4jiKMs4st63uIuozXbQczBcpOZcgieWT5Y5YjPRg/BKWrdZ3KkxyDj
	 iYlmFr3RDMWb4AdTe9iMoD51H3BKT1vwWWjF0AtLAjUqng+zXq+opwUrs6IckG0aq/lSy
	 b0mFb1bZE1y7JK5bg00Qm9g6XCnQ5OJIMTpgwiBT+H8kno5aVa4Mt7vC3eF6OGmAZA8D4
	 8yUpM+EVy+G61eN7RwYGpwLW2IAvI+LBhzJ0WcbAJnuusrBsLRVJZRLAfBffKcrRU3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AkroMdRT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252E4606A32E
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 12:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252E4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AkroMdRT
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so3780352a12.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 04:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574792; cv=none;
        d=google.com; s=arc-20260327;
        b=NZ+eowAkrdrmVNWeQWpehvtGJb2hhpC+TutGbfdke6N2nqLgHqalcT3nFa9X+MVPNI
         PB6VVdgyKkuVyx4wgtkOzVbii1OJ1YhIgotnqXKnxU5XlX45N89ibbzJRcGeyp3dYWGl
         pgv1zpGErpx/vds04+jR8KF3/KjY5GE4efiCrFKpO1/MnQ/IEOnynCFx9Dy4gHEfKqcq
         CY/egpEZmrXZfpP58WNO+je/6wEcrBDQxW+gAVzBzx+wDS8Qne1bAq0gucjaiRPCMi7t
         3KrBOLh8vdKhBHkhzb3Ep/l/A4JNKOb7mVegTRroukMdCa/lK0aQA80MGYbAwNinuSQP
         s62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        fh=Y2a6g4zFUVt1ES9EzANu0BoB/D8E/DEiqg1UYUGQ6aM=;
        b=pvfYOIc34C7ydIZhDDPJ3H9fjLZwAAYJT/R++oHd48dOo0LUo4xybtV0FTO078eeRo
         rUdgyaeKlVBm0Z+iER1adsSTrAdP4/j/1lXG/cBYQVWpxMk37AMAu/d/FdfhkrgRoYKR
         slYpLoixGwRQUyVGHfeIbAf88QgFTCmG/ASgSzwSN84NO2ef8pLir53+xjYe914bb2og
         Np91veW2QR7peKKYFgmYe5Yk3HBJne54LANsvOfob5Vp7S72JdFPqXreIqkrpKrbrXnC
         uTlpvUoKqP+kZ9WV23E6SKhCypMYipuoH4B/JNrVXxAQFVwZIU1l7XhTbO+Xe9cjqGr8
         ihuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574792; x=1795179592; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=AkroMdRTCJEU56zCl5mRMi6rrvafd2Mh879g64RVhOfD34YxgOzOtrBsT8yx4NkQl8
         gSv1yRzVbhdBh7graboeUHyOjVxnWYWXqTxrq5bwqTXLdODgtOJ2GOfvja1i9wZBs4H9
         fcb9zmhVDOC+WUd7SGVWyfxFQP93w/xQqb2FnisylYb2rXsRhjc4CRnja+NBnS2rKhXF
         cLontnuKm89vJ8lgs810EU0/SMd4hbxtRDKKGG1T7m/yNzjT4qqUkxsmm7hHJo35Whfx
         tDrQsm7X93e0qnvrkO6hPhp7RxKzDVtK1uhz9g5bxTs3CjlOANpOM/WN/oFPwtcbJAz3
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574792; x=1795179592;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=Jw2iNzU70dbt7bilxw48SAlsk+w7MoncPBmbQnthy/a/iE3lg+bMPF0o/LS6piHhQy
         BDFG5yA1qfIzHUcoAnpc6hX4EbMD6TgcVbQyOyHTzQHujDFhS4i6zFiUzQlHUr4v6nAZ
         jjlQa1eOUYDhBBgLVHQlsAZtqOKet+vNcavB2HLXjr3ngYCB4OVAU4VMqBxxdN59nEmI
         i7rzAe7cCIGqjLnXupC8RKKz3N4BV+m+qX5IJSa70tpKNe7ZSBUQVZ7VlYkfFUB1WADb
         zwl8K2U0ZGyDNuRMyioh/Q1M3Tve2IbvfvOjBiPjzxOoHYNiAWVD5Y7Anch+QprT3IeE
         4YJQ==
X-Forwarded-Encrypted: i=1; AL+hErHwHacw7+0ox2VVqJQUC1+FPuSRA5GQBiNsqvI5DcZxCM5Mn5KFx+K+fBf+EkEaZctB+NOB7oq5b3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PwPVDVWW8lwvJA4Oy7BCFKaPaPjwEF1W3fI4UR2pqVlP89n1n
	Pi7tkrJ5woLd0M5OZFgnWyYkPlmIt0Yjzyb86pSjVcCrn9inDFGMNEVUTEHwONLi5OUh6crhmdZ
	rmdPMTYWiGTOWoWHgic6WmsD024e5xceCb7Rr3/UFIA==
X-Gm-Gg: AYBFou0cOn7ERgcrK2r2nQpInhIVWmEaT5aZG1CioxykfmTLxoE7t85oL3orWmzcKN6
	m2Vj4zIl65HYfv2BmROZ2NY8bm2cnihfh5YYwpBZ0oMH/wkzRQ3YeN+FyiNBnfWQHXoeP54wWJ1
	/xOhnzm9d0adSrkqtgoXPsEU/oPjQ4E4EFhdWDPSeABmuXkxkJpJkGwykCT7XtajQqsqC+JMX4r
	q9s63tHYY2VHad8zP094acDGxiUojwlWyhYi2R0nBt/Lon06oezZSv+wszSuj6PXLE94gf7myjB
	7T8XTLKWSGrVGecL2yzy9Zu/y6ZG8onJiVk8f+ARN35JQs/Pgxzr7OftBukRmYMYyuXmq/UD8sB
	5Y9x6hEzi09+TGQdvVgtNR6fBWVY6g2/2jLJHEShMUabBLxhKWbBhnf43ZLt25mnocLJan090it
	rdbwE3cIEhyMNyCHQ=
X-Received: by 2002:a17:907:3f9e:b0:c46:ca2b:84ab with SMTP id
 a640c23a62f3a-c507bca4549mr587358566b.13.1794574792499; Fri, 13 Nov 2026
 04:59:52 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-12-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-12-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:59:40 +0000
X-Gm-Features: AclHuK9cm82mhKCf1OM8U8MOAQmGsMU4pcM69WzWfUaEMzCzm0cQud7ofsYoc9E
Message-ID: <CADrjBPpf_-pnzQRYrpqpzWUewgF_U5EbOA1CJprnH1XzQoDuLg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14 RESEND] arm64: dts: exynos8855: add cmu_top &
 cmu_peric clock DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_top & cmu_peric block.
> This also add sysreg_peric node. sysreg_peric contains
> DRCG and MEMCLK SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 0333b80eba84..2e5dc79d66bc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -10,6 +10,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/samsung,exynos8855.h>
>
>  / {
>         compatible = "samsung,exynos8855";
> @@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_top: clock-controller@13900000 {
> +                       compatible = "samsung,exynos8855-cmu-top";
> +                       reg = <0x13900000 0x10000>;
> +                       #clock-cells = <1>;
> +                       clocks = <&oscclk>;
> +                       clock-names = "oscclk";
> +               };
> +
>                 pinctrl_usi: pinctrl@15030000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15030000 0x1000>;
>                         interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_peric: clock-controller@15400000 {
> +                       compatible = "samsung,exynos8855-cmu-peric";
> +                       reg = <0x15400000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_IP>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "mmc_card",
> +                                     "ip";
> +                       samsung,sysreg = <&sysreg_peric>;
> +               };
> +
> +               sysreg_peric: syscon@15420000 {
> +                       compatible = "samsung,exynos8855-peric-sysreg",
> +                                     "syscon";
> +                       reg = <0x15420000 0x10000>;
> +                       clocks = <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
> +               };
> +
>                 pinctrl_peric: pinctrl@15440000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15440000 0x1000>;
> --
> 2.34.1
>
