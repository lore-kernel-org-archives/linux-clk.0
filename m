Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D618253F05
	for <linux-clk@vger.kernel.org>; Tue,  8 Apr 2025 19:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141057; cv=none; b=mga9tPqu9JufJUyvqIdrJepqKYK98erTY7XpUAQ2ic7S9G32WNPGlE0x8rnbZ/PcdenlbExDQt08JmsKYTtRgQcD7wn4I4EUZpRj65RKe5lkgStAo72vwI/LWYtk4zPBgV1uFlMaJIi7vLNAhtBII5Wut+autgccHk6hL9oBvw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141057; c=relaxed/simple;
	bh=NTJ5KjJ/ZBgfEJpw4A0/HInj2/oRXkh+bzZ1SdLcYc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbyjptlWG3BxhhqSW3W7ip4eD6yHVVjF9tF4ZfJhWbjZUrBpxrFYlpWtIh4mzNA8fd8r6Ne9+ZTDHCEby4m4ceRbLPTrj9ZBceT/fIcQu3fbWXk2MKWYLuMLfXouXFIFGoEca5w9RJsi49qe7FWLwrxbAmKcD23DWGWvHXul8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=K2rdQed6; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="K2rdQed6"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso57540475ab.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Apr 2025 12:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141054; x=1744745854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ob4oUqAxpn+J+G+4QGZ2IAdpzs1pkYoXWSPEpJ9MtRw=;
        b=K2rdQed6xFOwRoOmlDJZKe3Cnr2U4I5bpFt9nIRuzfJGpnT9VUO4G3h7SzGGCY86jl
         wx/lp7sgA1Vhb3x5Ep5cteGCwHkj+Uhy/bQh3YI4RF6haR1HZVcjlru9Ba+dNC0W1J8Z
         NFptXBFKNK89Y1GcGCae7SOA2wxp6JMHCAO+NAuKLKjvmYINO9D7Vqbu6UzFT6Ps7rre
         z22/98o1D9EaTut76wEpOB81eXHYSJ4TKqffSJz4M0CS/AQ5go4UscYHMQ2SdmZ8E7I8
         g8jgQZnFUNexd8hbReFhwhNKYgYajTUCfmRbMS/jUimvd5bnOCxC7cD0YLeizFZqEfVA
         /a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141054; x=1744745854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob4oUqAxpn+J+G+4QGZ2IAdpzs1pkYoXWSPEpJ9MtRw=;
        b=oZu+kiRzBVqTiIs6kGYauk2kLjCs/xOMk4jUM2NS95O3hQUFrnLJUwWP/xXq/1LgW4
         k3g7s6KWNtLuHNUofMl+fJDTLGFEdyOm7QA8dVhwaiPtrFvS8Ov2Ih+uD9Xd8JEC+92Q
         Bt24g+5p0+ge8984Yc6TXHuLEGJKtDH84gGnTROBG3U1gRvK2VcIGVw/S7xrosAyYJyj
         w3tbSfFOeRW5sQqPGfMn7Q2mNy1bTGrByaZigMt+4kBpKgZGGFY+qbg+FTkTdr796BSe
         uhR1ErfmKqf69juAcj0zA94OrEGyLPfABKOu5C0j1nrjP9AgK4jpXN98Umu8dbKwsyPU
         6GCw==
X-Forwarded-Encrypted: i=1; AJvYcCWyqsM1oZikvurz1pLE6hg8afILG0nIMzemat/3VQYZWtSKeD6M4UJaOGFrPaRZB9JEwEqrMD7tHx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3AB6fVMVdWdPGqi6UlGgpBnYyVQ4knzxi2RdjQOJwYU9+i5U
	NBe5/v/XLgTSv6zcSLJf0RMwlAl1QbAax5yeYfcf9qplEawr1zJH243XlnULMBg=
X-Gm-Gg: ASbGncuiiITGxCJueY6TiVP6OInjLbBCjZTmWFP5q96JDohh/A6glf59UQKLv0CmWS7
	NHU2P9Egf1aweqOeDqAMu2Q8BqWY3t01jRGCmMWoFjN9wpqIbgZngCeHB2xXuDKslJ6Dpi6BjsP
	vz3vam0RsrM+qZ5fBiihbdP3nUdeg+ztBtaPGtdWZYsftdXEq73skFl4Krss1i6caAidgfU+yKh
	P5KPPm0JXbj620wmaFjv8wOzUjJWVUjJni/lB3dm6YlbH3YGkxazMZ7n0JZ4dTggyyYh5GxW6rY
	nZEiof+ptb3jFrML7GL8Wc60qo4IcCt1iK+HIqgkOPB+T9EK5/1bBrXKH6nFJfmDkge4luP2BX0
	LJqghKEnqjgRKjNdfj54=
X-Google-Smtp-Source: AGHT+IE7j1OBiF96wzmsrWHFXnRl197F3CnscJiSLVvRNPdCYjy+kg0LczV2LeKhYQRulMXH9GWIZw==
X-Received: by 2002:a05:6e02:144b:b0:3d4:3ef4:d4d9 with SMTP id e9e14a558f8ab-3d77c2b260bmr1879095ab.14.1744141054359;
        Tue, 08 Apr 2025 12:37:34 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703c0665esm5904485ab.50.2025.04.08.12.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:34 -0700 (PDT)
Message-ID: <c7bb5f17-1d64-449b-ba33-4de63efa4286@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:32 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT
 K1
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-6-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-6-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

Other than the suggestion that you rename the "spacemit,mpmu"
property (mentioned in patch 3), this looks good to me.

Whether you change that or not:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..584f0dbc60f5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -3,6 +3,8 @@
>    * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>    */
>   
> +#include <dt-bindings/clock/spacemit,k1-syscon.h>
> +
>   /dts-v1/;
>   / {
>   	#address-cells = <2>;
> @@ -306,6 +308,36 @@ cluster1_l2_cache: l2-cache1 {
>   		};
>   	};
>   
> +	clocks {
> +		vctcxo_1m: clock-1m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <1000000>;
> +			clock-output-names = "vctcxo_1m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_24m: clock-24m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "vctcxo_24m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_3m: clock-3m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <3000000>;
> +			clock-output-names = "vctcxo_3m";
> +			#clock-cells = <0>;
> +		};
> +
> +		osc_32k: clock-32k {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			clock-output-names = "osc_32k";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		interrupt-parent = <&plic>;
> @@ -314,6 +346,17 @@ soc {
>   		dma-noncoherent;
>   		ranges;
>   
> +		syscon_apbc: system-control@d4015000 {
> +			compatible = "spacemit,k1-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>   		uart0: serial@d4017000 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
>   			reg = <0x0 0xd401e000 0x0 0x400>;
>   		};
>   
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k1-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: system-control@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-control@d4282800 {
> +			compatible = "spacemit,k1-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>   		plic: interrupt-controller@e0000000 {
>   			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>   			reg = <0x0 0xe0000000 0x0 0x4000000>;

