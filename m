Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B7755E7C
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706519921; cv=none; b=sEkq+vskPLBIMmq+cQZbsKDQYVUw3VJOpcw9E9tSklr8bN7M5ctPaHmms5yWxU0f+HzWi/WzPDHAe0QwMUtTa5k6IGuaiY3i99U3+x3xotxdHzVlABIuG0Ymz/uugEkk4WoN1g1t1OstkHds3v6873Ipo+VrFnQ6E+Odik0QN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706519921; c=relaxed/simple;
	bh=sFozMJoAolAGCF8tscjr3ajpcwVLl1NfdfeFIagusCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NoLpEELesBYlhReYBItEqZOGgEiI+Y3FcdhmAorbBs5v8s658qjMb8J72Z7NXoi11atclGTujsT22dUjbWUG6h69L4Kr6fP6hw2OoxS42wYiD4p7O0Eqn4J1DmwLBcM1mBp8ivKvQbEvRfv5Uo5K3RvkFZbCSVI1cxqPfF2BwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+Zw8yen; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+Zw8yen"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68c2f4c3282so21451726d6.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 01:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706519918; x=1707124718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8QUCC8mxaAYBk9a7j4VTD2YmBLyr7XLPrPfEMJfXSE=;
        b=O+Zw8yenzEoPh/vaH6nKmPzzb1zsqsmaYbBFktz6RVnBM709pNz15R6Rgvr27AfR0o
         MwO7/mLx21K8jGrMCKDJyuUSUseeMayD/QLFWdsrc+sYiEy0UxlWS6E7t0S4BsZuBLgM
         HB4AbIL3J5FtCKzhg84o0DXq49wR1NpIQzAEy3/4RwjvXPxHsIEeFC/gcBRsVpN1UZAa
         Po0CsTl3vBnKZxWjSs89KtSYk9WZ9XK6y6CuaqRcWYufniEVgL21lo9vy703ZfCX+kKL
         rpLjP6jUhISNkU87OLmhnLmZPUAaAsAfMhMyGoums+jBARQj3aM3vkv55eXhSsUqDY7B
         nTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706519918; x=1707124718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8QUCC8mxaAYBk9a7j4VTD2YmBLyr7XLPrPfEMJfXSE=;
        b=avf54PPsOWBBLLIuycTNeFnTnW/+LBNw4n9gf13gPZmKs5SyCwbMm3zJLWQ0amyvua
         Iib/aTmiVwdv335jt/V0bOirwoJoBaSi8/hRWAkwqrlzN/g+Nh194XjeMN7o3ctUvzlb
         pTjZGetpTjtyxegO/Ne5pWdkHWOKcID0fk1UN5p3QMHJCr+xNL3a8e4n5fV+7/HaQf27
         G7SbFm7H6rGZyNBR1xqQ17mTrMCmFnFLL03vhTDwPTPNHkM2cN3d4wEDOHTpI97wGSXD
         qaC1YugWWnlx26LvkGxo+v1kFFdwzOdEdmtZf3Z0IyKEryrxVB4pDyHh+PmZnuAIAAXs
         skBg==
X-Gm-Message-State: AOJu0YxFpuFvxz1g/B25pJaGgHs1riPkhbF8+BBjCSLwUFy6JmFxhMIj
	W6VOqxIlbv6wNxmGAqHhFiI30NaJfmGfdQu1RRZZ2NP704r/6xzv2UXxc9rK+qEGUIELeMygisQ
	EqXtGRWE9TK8My50sHHOP0G0CMMiz50B7GPWkFQ==
X-Google-Smtp-Source: AGHT+IHMF9jA2tNnrgpg+GOHbhcFMUcNlosZdvmduCi5ermtTKqbkzvQ64jyco/nTt46T/fJWnSt6/5J7Zh94ctVnIA=
X-Received: by 2002:a05:6214:2a4e:b0:685:cf86:45eb with SMTP id
 jf14-20020a0562142a4e00b00685cf8645ebmr6633834qvb.104.1706519918653; Mon, 29
 Jan 2024 01:18:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-3-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-3-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 09:18:27 +0000
Message-ID: <CADrjBPox_NDkq+-XxX5cuxAhYDubMHnqjnpwj4+76_A=izuhjw@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: clock: google,gs101-clock: add PERIC1
 clock management unit
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

Hi Andr=C3=A9

On Sat, 27 Jan 2024 at 00:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Add dt-schema documentation and clock IDs for the Connectivity
> Peripheral 1 (PERIC1) clock management unit.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Thanks for working on these regexes! That should make enabling more
clock units and other Exynos SoCs a bit easier.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Note for future reference: To ensure consistent naming throughout this
> file, the IDs have been derived from the data sheet using the
> following, with the expectation for all future additions to this file
> to use the same:
>     sed \
>         -e 's|^PLL_LOCKTIME_PLL_\([^_]\+\)|CLK_FOUT_\1_PLL|' \
>         \
>         -e 's|^PLL_CON0_MUX_CLKCMU_\([^_]\+\)_|CLK_MOUT_\1_|' \
>         -e 's|^PLL_CON0_PLL_\(.*\)|CLK_MOUT_PLL_\1|' \
>         -e 's|^CLK_CON_MUX_MUX_CLK_\(.*\)|CLK_MOUT_\1|' \
>         -e '/^PLL_CON[1-4]_[^_]\+_/d' \
>         -e '/^[^_]\+_CMU_[^_]\+_CONTROLLER_OPTION/d' \
>         -e '/^CLKOUT_CON_BLK_[^_]\+_CMU_[^_]\+_CLKOUT0/d' \
>         \
>         -e 's|_IPCLKPORT||' \
>         -e 's|_RSTNSYNC||' \
>         \
>         -e 's|^CLK_CON_DIV_DIV_CLK_\([^_]\+\)_|CLK_DOUT_\1_|' \
>         \
>         -e 's|^CLK_CON_BUF_CLKBUF_\([^_]\+\)_|CLK_GOUT_\1_|' \
>         -e 's|^CLK_CON_GAT_CLK_BLK_\([^_]\+\)_UID_|CLK_GOUT_\1_|' \
>         -e 's|^CLK_GOUT_[^_]\+_[^_]\+_CMU_\([^_]\+\)_PCLK$|CLK_GOUT_\1_PC=
LK|' \
>         -e 's|^CLK_CON_GAT_GOUT_BLK_\([^_]\+\)_UID_|CLK_GOUT_\1_|' \
>         -e 's|^CLK_CON_GAT_CLK_\([^_]\+\)_\(.*\)|CLK_GOUT_\1_CLK_\1_\2|' =
\
>         \
>         -e '/^\(DMYQCH\|PCH\|QCH\|QUEUE\)_/d'
> ---
>  .../bindings/clock/google,gs101-clock.yaml    |  9 ++--
>  include/dt-bindings/clock/google,gs101.h      | 48 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.y=
aml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> index 03698cdecf7a..1d2bcea41c85 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -31,6 +31,7 @@ properties:
>        - google,gs101-cmu-apm
>        - google,gs101-cmu-misc
>        - google,gs101-cmu-peric0
> +      - google,gs101-cmu-peric1
>
>    clocks:
>      minItems: 1
> @@ -93,15 +94,17 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: google,gs101-cmu-peric0
> +            enum:
> +              - google,gs101-cmu-peric0
> +              - google,gs101-cmu-peric1
>
>      then:
>        properties:
>          clocks:
>            items:
>              - description: External reference clock (24.576 MHz)
> -            - description: Connectivity Peripheral 0 bus clock (from CMU=
_TOP)
> -            - description: Connectivity Peripheral 0 IP clock (from CMU_=
TOP)
> +            - description: Connectivity Peripheral 0/1 bus clock (from C=
MU_TOP)
> +            - description: Connectivity Peripheral 0/1 IP clock (from CM=
U_TOP)
>
>          clock-names:
>            items:
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindin=
gs/clock/google,gs101.h
> index 64e6bdc6359c..3dac3577788a 100644
> --- a/include/dt-bindings/clock/google,gs101.h
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -470,4 +470,52 @@
>  #define CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK                78
>  #define CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK             79
>
> +/* CMU_PERIC1 */
> +#define CLK_MOUT_PERIC1_BUS_USER                       1
> +#define CLK_MOUT_PERIC1_I3C_USER                       2
> +#define CLK_MOUT_PERIC1_USI0_USI_USER                  3
> +#define CLK_MOUT_PERIC1_USI10_USI_USER                 4
> +#define CLK_MOUT_PERIC1_USI11_USI_USER                 5
> +#define CLK_MOUT_PERIC1_USI12_USI_USER                 6
> +#define CLK_MOUT_PERIC1_USI13_USI_USER                 7
> +#define CLK_MOUT_PERIC1_USI9_USI_USER                  8
> +#define CLK_DOUT_PERIC1_I3C                            9
> +#define CLK_DOUT_PERIC1_USI0_USI                       10
> +#define CLK_DOUT_PERIC1_USI10_USI                      11
> +#define CLK_DOUT_PERIC1_USI11_USI                      12
> +#define CLK_DOUT_PERIC1_USI12_USI                      13
> +#define CLK_DOUT_PERIC1_USI13_USI                      14
> +#define CLK_DOUT_PERIC1_USI9_USI                       15
> +#define CLK_GOUT_PERIC1_IP                             16
> +#define CLK_GOUT_PERIC1_PCLK                           17
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_I3C_CLK             18
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_OSCCLK_CLK          19
> +#define CLK_GOUT_PERIC1_D_TZPC_PERIC1_PCLK             20
> +#define CLK_GOUT_PERIC1_GPC_PERIC1_PCLK                        21
> +#define CLK_GOUT_PERIC1_GPIO_PERIC1_PCLK               22
> +#define CLK_GOUT_PERIC1_LHM_AXI_P_PERIC1_I_CLK         23
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1            24
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2            25
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3            26
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4            27
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5            28
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6            29
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_8            30
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_1             31
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_15            32
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_2             33
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_3             34
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_4             35
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5             36
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_6             37
> +#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_8             38
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_BUSP_CLK            39
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_USI0_USI_CLK                40
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_USI10_USI_CLK       41
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_USI11_USI_CLK       42
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_USI12_USI_CLK       43
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_USI13_USI_CLK       44
> +#define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK                45
> +#define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK             46
> +
>  #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
> --
> 2.43.0.429.g432eaa2c6b-goog
>
