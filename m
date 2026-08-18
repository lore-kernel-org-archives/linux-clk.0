Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D16D39A7EF;
	Tue, 18 Aug 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041451; cv=none; b=mutfJbrpXfgUp+RZkYzn+PH9rTjmfsbNkYs7Gy+kDcaCfaMtaKkVYM9IB3WpXpXyRfDxs8eGDN0SGG9QyD4PVmlVHeMA7BQzh2trny5Fitr+j9cZ3+iUkt2aWP1H4BWlhIPuteEgekcUVkmo8wKxI20dffayamKfwHGjyCvN6E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041451; c=relaxed/simple;
	bh=lqZQxcbwluNGpJ1XgEVpD6pz/r8zeddw3hjBpHIJZTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLUt5oorTJqzN5vaJI10Yq9XNKI+ULFLw8S3KuiubwCulIeuK1+G+iCbCmNlbGa6hli8DILX08vVIl/0nNcZV+XPet6jcOyH1bJIPjhRHWdxq+7o9SooY+cruzZ5nFlePMvtV6e2pnqL1QYnuOktXELKwrizIWTFCD768bx4b2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbalZwD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbalZwD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F991F00A3E;
	Tue, 18 Aug 2026 08:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787041450;
	bh=OfHeIcxWWdTnEuZTttxc/WTa5O0fO8FR/FpFaq3hOQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BbalZwD4G3hI1I1Td5/AGuHj/eA5rR5wa3Z0CQnfIALRpu7I+B9KR5XCiG6FkVV5G
	 gj9zkVkOkDpOBNo2Inb1YOVI9JI+E2buWOxHeAnoYZWMphnkaFAMP96UKFJV/cNBYB
	 UQno/InpDua917Y+BxT52nd+TCcCnrXdfi/LlWMtvFX1boSgh9HXaTggQVei3LuF3m
	 zztVhlr4wcF42qPJyv7iF5i4P/gUZgLpl4a4O1i9Vj0TSpgCj3vhG8lzmTBcGUuQXJ
	 a8yzuDbER7AnB5E1O3Lz8pqTi9Mi/V008KAgFviwTOfDL4s8V4m4IJZatfnQ+7NDpd
	 6+AssL6O5X6Kg==
Message-ID: <55153a0a-1cab-49f4-9a54-951aa9c40be1@kernel.org>
Date: Tue, 18 Aug 2026 10:23:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: clock: altr,agilex72-clkmgr: add
 Agilex72 clock manager binding
To: evon.chiam@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>, Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <39f067c31125b43d9d4ee92cd02828e894de3f45.1786006669.git.evon.chiam@altera.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <39f067c31125b43d9d4ee92cd02828e894de3f45.1786006669.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2026 11:25, evon.chiam@altera.com wrote:
> From: "Chiam, Evon" <evon.chiam@altera.com>
> 
> Add binding and clock ID header for Altera SoCFPGA Agilex72 clock manager.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>



> +
> +examples:
> +  - |
> +    /* External reference clocks supplied to the clock manager */
> +    clocks {
> +      cb_intosc_div2_clk: cb-intosc-div2-clk {
> +        #clock-cells = <0>;
> +        compatible = "fixed-clock";
> +        clock-frequency = <0>;
> +      };
> +
> +      /* cb-intosc divided by 2, then by 5 (total divide-by-10) */
> +      cb_intosc_div10_clk: cb-intosc-div10-clk {
> +        #clock-cells = <0>;
> +        compatible = "fixed-factor-clock";
> +        clocks = <&cb_intosc_div2_clk>;
> +        clock-mult = <1>;
> +        clock-div = <5>;
> +      };
> +
> +      f2s_free_clk: f2s-free-clk {
> +        #clock-cells = <0>;
> +        compatible = "fixed-clock";
> +        clock-frequency = <0>;
> +      };
> +
> +      osc1: osc1 {
> +        #clock-cells = <0>;
> +        compatible = "fixed-clock";
> +        clock-frequency = <0>;
> +      };
> +    };

None of above are relevant. Drop.

> +
> +    clkmgr: clock-controller@915c000 {
> +      compatible = "altr,agilex72-clkmgr";
> +      reg = <0x915c000 0x1000>,
> +            <0x915e000 0x1000>,
> +            <0x915f000 0x1000>,
> +            <0x9160000 0x1000>;
> +      reg-names = "clkmgr", "gppll0", "gppll1", "gppll2";
> +      #clock-cells = <1>;
> +    };


...

> +#define AGILEX72_COMP0_CLK             36
> +#define AGILEX72_CORE2_CLK             37
> +#define AGILEX72_CORE3_CLK             38
> +#define AGILEX72_MPU_CLK               39
> +#define AGILEX72_CCU_CLK               40
> +#define AGILEX72_APU_SYS_FREE_CLK      41
> +#define AGILEX72_HSP_SYS_FREE_CLK      42
> +#define AGILEX72_HSP_MAIN_FREE_CLK     43
> +#define AGILEX72_HSP_MAIN_CLK          44
> +#define AGILEX72_HSP_MP_CLK            45
> +#define AGILEX72_HSP_SP_CLK            46
> +#define AGILEX72_USB2OTG_HCLK          47
> +#define AGILEX72_LSP_SYS_FREE_CLK      48
> +#define AGILEX72_LSP_MAIN_FREE_CLK     49
> +#define AGILEX72_LSP_MAIN_CLK          50
> +#define AGILEX72_LSP_MP_CLK            51
> +#define AGILEX72_LSP_SP_CLK            52
> +#define AGILEX72_SPIM_0_CLK            53
> +#define AGILEX72_SPIM_1_CLK            54
> +#define AGILEX72_SPIS_0_CLK            55
> +#define AGILEX72_SPIS_1_CLK            56
> +#define AGILEX72_DMA_0_CORE_CLK        57
> +#define AGILEX72_DMA_0_HS_CLK          58
> +#define AGILEX72_DMA_1_CORE_CLK        59
> +#define AGILEX72_DMA_1_HS_CLK          60
> +#define AGILEX72_I3C_0_CORE_CLK        61
> +#define AGILEX72_I3C_1_CORE_CLK        62
> +#define AGILEX72_I2C_0_PCLK            63
> +#define AGILEX72_I2C_1_PCLK            64
> +#define AGILEX72_I2C_EMAC0_PCLK        65
> +#define AGILEX72_I2C_EMAC1_PCLK        66
> +#define AGILEX72_I2C_EMAC2_PCLK        67
> +#define AGILEX72_UART_0_PCLK           68
> +#define AGILEX72_UART_1_PCLK           69
> +#define AGILEX72_UART_2_PCLK           70
> +#define AGILEX72_SPTIMER_0_PCLK        71
> +#define AGILEX72_SPTIMER_1_PCLK        72
> +#define AGILEX72_CS_AT_CLK             73
> +#define AGILEX72_CS_PDBG_CLK           74
> +#define AGILEX72_CS_TRACE_CLK          75
> +#define AGILEX72_EMACA_DIV_CLK         76
> +#define AGILEX72_EMACB_DIV_CLK         77
> +#define AGILEX72_EMAC0_CLK             78
> +#define AGILEX72_EMAC1_CLK             79
> +#define AGILEX72_EMAC2_CLK             80
> +#define AGILEX72_EMAC_PTP_CLK          81
> +#define AGILEX72_GPIO_DB_CLK           82
> +#define AGILEX72_USB31_SUSPEND_CLK     83
> +#define AGILEX72_USB31_BUS_CLK_EARLY   84
> +#define AGILEX72_S2F_USER0_CLK         85
> +#define AGILEX72_S2F_USER1_CLK         86
> +#define AGILEX72_XSPI_PCLK             87
> +#define AGILEX72_XSPI_CLK              88
> +#define AGILEX72_XSPI_PHY_CLK          89
> +#define AGILEX72_SDMMC0_SDPHY_REG_CLK  90
> +#define AGILEX72_SDMMC1_SDPHY_REG_CLK  91
> +#define AGILEX72_SDMMC0_SDMCLK         92
> +#define AGILEX72_SDMMC1_SDMCLK         93
> +#define AGILEX72_SDMMC0_PHY_CLK        94
> +#define AGILEX72_SDMMC1_PHY_CLK        95
> +#define AGILEX72_USB31_REF_CLK         96

> +#define AGILEX72_NUM_CLKS              97

No, not a binding. Drop

> +
> +#endif  /* __DT_BINDINGS_ALTR_AGILEX72_CLKMGR_H */


Best regards,
Krzysztof
