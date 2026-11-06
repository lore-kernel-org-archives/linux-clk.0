Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980598;
	b=kUP5KZdhmXgykWe06rgFBPgApc6Hgs5fLs1rQIZmn7x8fctz14k5MImdL+kvU2JBEEDv
	 CpiktQY7Qvi0nB9MLbR2KcFQx6YWjDUESGUzy9tJ6ycS8F2D65LoXgUhqVsWC4+mYL3+K
	 mEdVdfSrQ1V+HuU/mqrxo0GWuP+r79GcvO7dvhl0q4+G1DoP9ym22g4kDgxME8BGfsx7b
	 Z54CqH70lkN42621SwKnuVfyQ2QdCvZVvIORMnpSm67BAY2Yp/VpMiAnz5wWWLQQ0KDtI
	 H+EbbUZVeZZYIfN7Jvv7xSrm6fcYUWOi11Jj097xHYP9OMVAZwRO+haTFF/aND+Ef2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980598;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t5zqAwf3Pyqk61M6Dmmqsm/P1aF5mCdna6EVJOjnLI8=;
	b=DEjRgYyQFFg1jj/+b2Cx4L5dERfkQfazzZSaxypmbozOokYmeUQEzgeO4gR+ofR5pjVy
	 ujzoJJqRInw4tXekLunfJjTIRlZvmRXu3lHLO3R5DMP02MltxYkFTcpICVk8sTDFR+vU/
	 w/sVCzz+cPV9vgYL6rde+0H1aHUMH9UYDOsaFbi1LRz0xtWU2Dr5uO+bYj3+ZG4WiXBFl
	 ANYwh5eI+0mABn6iw7OYJ6h6sXP0vaFf8a+2phprzSFyxbHd+Fw4dVAaXQXNCc6KK/Kvp
	 M9v1AY7ST7fGBnkwh+wpD2ZH/sh7jI12cs/3cI07Q4LZwD4PQbJqIaxuLQTn7PgBDNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ku5UVAXc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B63606A329;
	Fri,  6 Nov 2026 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ku5UVAXc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D82F1F0089F;
	Fri,  6 Nov 2026 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793980597;
	bh=t5zqAwf3Pyqk61M6Dmmqsm/P1aF5mCdna6EVJOjnLI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ku5UVAXc4Smf/Xa6szH9be/Nl1pcQqXbdm0cJ/qPDcXK4fI1ipiid9PD39TaZ0FJc
	 6A1DmsiqgWcZ1qIKjJKfT1+H8kmlmprvVENJG3PHJiRpnKFwoMeAkVnGs6gs0uCeqv
	 T45YgYp6qoeWsaf3d2Xinh5xcNq+FFF+1EEl1Z3b1tY/tP/gDp1vn7rAeEPy5HxlU3
	 4azcN2Krm30nZNkVD3Rd4zxnaBO1R0U3dr3GitWz09nN+bZm8O7XbdfoNBTSJWDj1p
	 GIpCdx24J8C1lSoMJx+4zwTJUxNZwxQeHJKWCRkgyWCwZ8wqdMqjJLrNUTn4DIf5Mt
	 57Sb29KxFQEsA==
Message-ID: <sashiko-outbox-201746@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] clk: stm32mp25: add clock for D3 peripherals
 allocation for Cortex-CM0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-ups_mp25_clk_update-v3-5-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
 <20261106-ups_mp25_clk_update-v3-5-4a32f68119ed@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:56:37 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: stm32mp25: mismatch between commit log and MSI_KER_ON
  parent assignment
--

commit aad9d612e6cd2adba430e970b7e94c3f5b129bc6
Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

clk: stm32mp25: add clock for D3 peripherals allocation for Cortex-CM0

This commit adds autonomous mode (GATE_<IP>AM) and CPU3 allocation
(GATE_<IP>C3) clock gates for D3 peripherals on STM32MP25, along with new
RCC input clock indices and the C3 reset.

> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-st=
m32mp25.c
> index fa025a9f3f378..e3a2e5ea775c8 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
[ ... ]
> @@ -518,6 +564,77 @@ static struct clk_stm32_gate ck_ker_adf1 =3D {
>  	.hw.init =3D CLK_HW_INIT_INDEX("ck_ker_adf1", FLEXGEN_42, &clk_stm32_ga=
te_ops, 0),
>  };
> =20
> +static struct clk_stm32_gate ck_ker_adf1_am =3D {
> +	.gate_id =3D GATE_ADF1AM,
> +	.hw.init =3D CLK_HW_INIT_HW("ck_ker_adf1_am", &ck_ker_adf1.hw, &clk_stm=
32_gate_ops, 0),
> +};
> +
> +/* C3 */
> +static struct clk_stm32_gate ck_cpu3 =3D {
> +	.gate_id =3D GATE_C3,
> +	.hw.init =3D CLK_HW_INIT_INDEX("ck_cpu3", ICN_LS_MCU, &clk_stm32_gate_o=
ps, 0),
> +};
> +
> +static struct clk_stm32_gate ck_cpu3_am =3D {
> +	.gate_id =3D GATE_C3AM,
> +	.hw.init =3D CLK_HW_INIT_HW("ck_cpu3_am", &ck_cpu3.hw, &clk_stm32_gate_=
ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_c3_adf1 =3D {
> +	.gate_id =3D GATE_ADF1C3,
> +	.hw.init =3D CLK_HW_INIT_INDEX("ck_c3_adf1", MSI_KER_ON, &clk_stm32_gat=
e_ops, 0),
> +};

[Severity: Low]
Does the MSI_KER_ON parenting here match the commit message?

The commit message states that all the autonomous clocks (GATE_<IP>AM) have
the MSI KER clock as their parent so that MSIKERON is set for Stop modes.
In the code, however, the autonomous clocks (such as ck_ker_adf1_am and the
other ck_ker_*_am / ck_cpu3_am clocks) are parented to their respective
peripheral kernel clocks, while the CPU3 allocation clocks (ck_c3_*) are
the ones parented to MSI_KER_ON.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ups_mp25_c=
lk_update-v3-0-4a32f68119ed@foss.st.com?part=3D5
