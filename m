Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937FB319862
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763431765; cv=none; b=McfkAYcOT7/Bg68koY4c/Fxyf2EorTPbX0BhS9UWxZ6uKq3/j/kgRkSkHLouKrzMrtVJ1Off7B790PMtI3lWF14DV3PMG8BrlScd/AGf6aSJ1H+3o3KKGNP952WKi3dETy+sC8QJxFJvLNj8DIayKItS1OtZv+A5n5XDnR84ofA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763431765; c=relaxed/simple;
	bh=lJwfqUPfhaERekXMWwmLLn+2z3tsqOj7wNutTW/klo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTDQDuZert1X4fHK2KKQpv6MhtboNJ0/pT3afxEuAcaLsxTkkXnWxqsvaiBk1PQsLbT/HYhybFAIU/+gQ+3CJvx/DnvCGf253Qsdxqyf168XLhWII3tvpZWiUtJZIDHmmCD+wQnmbO7Ova0/p5Mfj0vRIYQ2Zz1yO8vhXc6nGSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EycbbEWC; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EycbbEWC"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-65752954c38so815742eaf.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 18:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763431763; x=1764036563; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gN561BfJ/Tx+gPjerfaIRTJ2ntQQhGVse0P1hKKmkYk=;
        b=EycbbEWC4mk5fzpOrQHFiDrcyToIQqKzDdtQOTwWfLhjyfAAL5eQdmbNoKvn6FfDN1
         3lKvmDso4osUpM00loPyPrKsUy/Pq1iE4ZXEsSyCm01VDKXXwoGSzbcwwwJHFX8t9CXW
         0JiTogvTNlMc+aDRqU5Aaea73V2dYf9daJNd5o5mgaGF7H/uUkqlcKRoj4P0Z1AJs1Ew
         oC/xg09zfMKfT/zKL7oHvtk0sxTUyzfqvd3hyzqVW2S81RBL/Gty8zmelzOQgT5vGuG8
         9H4dSoMw309NbJte5UkZHwWYWDeOY6TzUDyEUIIQymyo627+k9xsL9r37cSJOqgM2EL5
         tg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763431763; x=1764036563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN561BfJ/Tx+gPjerfaIRTJ2ntQQhGVse0P1hKKmkYk=;
        b=mpmTqD31Msl2t8/4yOscrDaw5rYGkytvVAycVQc8Y2XDb6/Xjd2okjwJ26+UWdhkWp
         ivILm7O2YYVDckmliCS1Yiza8KoISASQPng6fYKEAHumlyTXT7IWbcj7Hyj2DuNTFRYc
         ZAWom3XY3pIzJZIfWULuRDh71Ico43fw+Ih3vZLuHx97Pwf6ftmViWFAlZBNnTkN9QrM
         56Uk8uE1LuYSJ3ux/lm+LcZ2K3CgKym4aKoTDYSsLxxGwEHPjsQ7nTLPVgBAMaGaTH90
         m/JRWznF37IQsWCIBsks8KzJH2KtWku52C5LVvO+q66FKo3s3VHceKaZKamsMOl9IDG7
         91Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX1zIm1/IhyqVZUsesegKGGWaVtwrDnhLMdYkR46lr9IfeFzmutG+XIuKoP5ojc0iPuQb91CcHU4LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykSx0dOSj8okp38kjm3o4IRM71ETSytH36B9z29ASLlJGKTbnh
	jJZkFuo98EQvBLZkGzdUMIAuXGuK8ElUmwE67wBKaC8TDUIkc5cVmJqvE6elvyRUj/9+VpUhVBm
	bRGSS1eQaNF+LW/WG5c3bXYJ7IcGRRy8=
X-Gm-Gg: ASbGncvYA+Uyg1GTYWzL3A8pG/TUyI3xnTBEwXxvNyiFqPALM/ifQT0l/NhyW4942+k
	OkF05oAVIV1J7KUCHttENgnmefsTG6fvmdI4Cq3kUviCwohwIrgNIrXDejKrV77SR9dWGb74C//
	Lb8+wWr+sdMkNn2epYWUpHDUv38kVHeoQUJ4am+ylt9DgwilUDaH6ytDxSaHWzo7HsPsqrwd4m7
	C7/IImswFerhTqd9Q0w0hbaWEpUOPX/tXk6DuzGBskucCZ1VXt/UWX0P+xqiqWCMdMPajtdhUpA
	rOnj6GtsAOYOQA==
X-Google-Smtp-Source: AGHT+IEHP6Nma62YOPxMGEyyVsojE6NwyT166LxKuZkXP2CW0RhhB7ZhZwN66oS/GvvfKxDg+rqUIVWwMrnd6Ix3SQE=
X-Received: by 2002:a05:6870:330f:b0:3ec:38a7:a076 with SMTP id
 586e51a60fabf-3ec38a7a935mr2916930fac.28.1763431762329; Mon, 17 Nov 2025
 18:09:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029155615.1167903-1-robh@kernel.org> <20251029155615.1167903-2-robh@kernel.org>
In-Reply-To: <20251029155615.1167903-2-robh@kernel.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 18 Nov 2025 10:08:46 +0800
X-Gm-Features: AWmQ_bk1LM1wb5gUx-1FeehQxn_WLwCW-XpgYwU8-TtfMkvEYqpg5JfOOJIj7qw
Message-ID: <CAAfSe-vS67E0pFgoDhVrpu6wh95P2SUemX+RgKKTSFUFYO+77A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: sprd: sc9860: Simplify clock nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Oct 2025 at 23:56, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The various "syscon" nodes in SC9860 are only referenced by clock
> provider nodes in a 1:1 relationship, and nothing else references the
> "syscon" nodes. There's no apparent reason for this split. The 2 nodes
> can simply be merged into 1 node. The clock driver has supported using
> either "reg" or "sprd,syscon" to access registers from the start, so
> there shouldn't be any compatibility issues.
>
> With this, DT schema warnings for missing a specific compatible with
> "syscon" and non-MMIO devices on "simple-bus" are fixed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  arch/arm64/boot/dts/sprd/sc9860.dtsi | 62 ----------------------------
>  arch/arm64/boot/dts/sprd/whale2.dtsi | 54 ++++++++++++++++--------
>  2 files changed, 36 insertions(+), 80 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> index d2456d633c39..864ef0a17425 100644
> --- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> @@ -184,20 +184,6 @@ gic: interrupt-controller@12001000 {
>                                                 | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
> -               pmu_gate: pmu-gate {
> -                       compatible = "sprd,sc9860-pmu-gate";
> -                       sprd,syscon = <&pmu_regs>; /* 0x402b0000 */
> -                       clocks = <&ext_26m>;
> -                       #clock-cells = <1>;
> -               };
> -
> -               pll: pll {
> -                       compatible = "sprd,sc9860-pll";
> -                       sprd,syscon = <&ana_regs>; /* 0x40400000 */
> -                       clocks = <&pmu_gate 0>;
> -                       #clock-cells = <1>;
> -               };
> -
>                 ap_clk: clock-controller@20000000 {
>                         compatible = "sprd,sc9860-ap-clk";
>                         reg = <0 0x20000000 0 0x400>;
> @@ -214,19 +200,6 @@ aon_prediv: aon-prediv@402d0000 {
>                         #clock-cells = <1>;
>                 };
>
> -               apahb_gate: apahb-gate {
> -                       compatible = "sprd,sc9860-apahb-gate";
> -                       sprd,syscon = <&ap_ahb_regs>; /* 0x20210000 */
> -                       clocks = <&aon_prediv 0>;
> -                       #clock-cells = <1>;
> -               };
> -
> -               aon_gate: aon-gate {
> -                       compatible = "sprd,sc9860-aon-gate";
> -                       sprd,syscon = <&aon_regs>; /* 0x402e0000 */
> -                       clocks = <&aon_prediv 0>;
> -                       #clock-cells = <1>;
> -               };
>
>                 aonsecure_clk: clock-controller@40880000 {
>                         compatible = "sprd,sc9860-aonsecure-clk";
> @@ -235,13 +208,6 @@ aonsecure_clk: clock-controller@40880000 {
>                         #clock-cells = <1>;
>                 };
>
> -               agcp_gate: agcp-gate {
> -                       compatible = "sprd,sc9860-agcp-gate";
> -                       sprd,syscon = <&agcp_regs>; /* 0x415e0000 */
> -                       clocks = <&aon_prediv 0>;
> -                       #clock-cells = <1>;
> -               };
> -
>                 gpu_clk: clock-controller@60200000 {
>                         compatible = "sprd,sc9860-gpu-clk";
>                         reg = <0 0x60200000 0 0x400>;
> @@ -256,13 +222,6 @@ vsp_clk: clock-controller@61000000 {
>                         #clock-cells = <1>;
>                 };
>
> -               vsp_gate: vsp-gate {
> -                       compatible = "sprd,sc9860-vsp-gate";
> -                       sprd,syscon = <&vsp_regs>; /* 0x61100000 */
> -                       clocks = <&vsp_clk 0>;
> -                       #clock-cells = <1>;
> -               };
> -
>                 cam_clk: clock-controller@62000000 {
>                         compatible = "sprd,sc9860-cam-clk";
>                         reg = <0 0x62000000 0 0x4000>;
> @@ -270,13 +229,6 @@ cam_clk: clock-controller@62000000 {
>                         #clock-cells = <1>;
>                 };
>
> -               cam_gate: cam-gate {
> -                       compatible = "sprd,sc9860-cam-gate";
> -                       sprd,syscon = <&cam_regs>; /* 0x62100000 */
> -                       clocks = <&cam_clk 0>;
> -                       #clock-cells = <1>;
> -               };
> -
>                 disp_clk: clock-controller@63000000 {
>                         compatible = "sprd,sc9860-disp-clk";
>                         reg = <0 0x63000000 0 0x400>;
> @@ -284,20 +236,6 @@ disp_clk: clock-controller@63000000 {
>                         #clock-cells = <1>;
>                 };
>
> -               disp_gate: disp-gate {
> -                       compatible = "sprd,sc9860-disp-gate";
> -                       sprd,syscon = <&disp_regs>; /* 0x63100000 */
> -                       clocks = <&disp_clk 0>;
> -                       #clock-cells = <1>;
> -               };
> -
> -               apapb_gate: apapb-gate {
> -                       compatible = "sprd,sc9860-apapb-gate";
> -                       sprd,syscon = <&ap_apb_regs>; /* 0x70b00000 */
> -                       clocks = <&ap_clk 0>;
> -                       #clock-cells = <1>;
> -               };
> -
>                 funnel@10001000 { /* SoC Funnel */
>                         compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x10001000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
> index a551e14ce826..dac2699a79d4 100644
> --- a/arch/arm64/boot/dts/sprd/whale2.dtsi
> +++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
> @@ -18,49 +18,67 @@ soc: soc {
>                 #size-cells = <2>;
>                 ranges;
>
> -               ap_ahb_regs: syscon@20210000 {
> -                       compatible = "syscon";
> +               apahb_gate: clock-controller@20210000 {
>                         reg = <0 0x20210000 0 0x10000>;
> +                       compatible = "sprd,sc9860-apahb-gate";
> +                       clocks = <&aon_prediv 0>;
> +                       #clock-cells = <1>;
>                 };
>
> -               pmu_regs: syscon@402b0000 {
> -                       compatible = "syscon";
> +               pmu_gate: clock-controller@402b0000 {
>                         reg = <0 0x402b0000 0 0x10000>;
> +                               compatible = "sprd,sc9860-pmu-gate";
> +                               clocks = <&ext_26m>;
> +                               #clock-cells = <1>;
>                 };
>
> -               aon_regs: syscon@402e0000 {
> -                       compatible = "syscon";
> +               aon_gate: clock-controller@402e0000 {
>                         reg = <0 0x402e0000 0 0x10000>;
> +                               compatible = "sprd,sc9860-aon-gate";
> +                               clocks = <&aon_prediv 0>;
> +                               #clock-cells = <1>;
>                 };
>
> -               ana_regs: syscon@40400000 {
> -                       compatible = "syscon";
> +               pll: clock-controller@40400000 {
>                         reg = <0 0x40400000 0 0x10000>;
> +                               compatible = "sprd,sc9860-pll";
> +                               clocks = <&pmu_gate 0>;
> +                               #clock-cells = <1>;
>                 };
>
> -               agcp_regs: syscon@415e0000 {
> -                       compatible = "syscon";
> +               agcp_gate: clock-controller@415e0000 {
>                         reg = <0 0x415e0000 0 0x1000000>;
> +                               compatible = "sprd,sc9860-agcp-gate";
> +                               clocks = <&aon_prediv 0>;
> +                               #clock-cells = <1>;
>                 };
>
> -               vsp_regs: syscon@61100000 {
> -                       compatible = "syscon";
> +               vsp_gate: clock-controller@61100000 {
>                         reg = <0 0x61100000 0 0x10000>;
> +                               compatible = "sprd,sc9860-vsp-gate";
> +                               clocks = <&vsp_clk 0>;
> +                               #clock-cells = <1>;
>                 };
>
> -               cam_regs: syscon@62100000 {
> -                       compatible = "syscon";
> +               cam_gate: clock-controller@62100000 {
>                         reg = <0 0x62100000 0 0x10000>;
> +                               compatible = "sprd,sc9860-cam-gate";
> +                               clocks = <&cam_clk 0>;
> +                               #clock-cells = <1>;
>                 };
>
> -               disp_regs: syscon@63100000 {
> -                       compatible = "syscon";
> +               disp_gate: clock-controller@63100000 {
>                         reg = <0 0x63100000 0 0x10000>;
> +                               compatible = "sprd,sc9860-disp-gate";
> +                               clocks = <&disp_clk 0>;
> +                               #clock-cells = <1>;
>                 };
>
> -               ap_apb_regs: syscon@70b00000 {
> -                       compatible = "syscon";
> +               apapb_gate: clock-controller@70b00000 {
>                         reg = <0 0x70b00000 0 0x40000>;
> +                               compatible = "sprd,sc9860-apapb-gate";
> +                               clocks = <&ap_clk 0>;
> +                               #clock-cells = <1>;
>                 };
>
>                 ap-apb@70000000 {
> --
> 2.51.0
>
