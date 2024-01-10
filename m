Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1C47F7B
	for <linux-clk@vger.kernel.org>; Wed, 10 Jan 2024 12:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Hjz2K9n+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so46364791fa.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jan 2024 04:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1704888799; x=1705493599; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sul2vRO9Fzn0UMSUus+BZBPqeYHWDQxaw3bzygHSyZc=;
        b=Hjz2K9n+E4TEUFPx1YmvKuBiMGZ+YbKgLC8Qp0bogk4tkBLizvHa8CDvKdWSIFTULh
         S8e6zunhLQ7+6u6ILuOWQxjpWC3B1kg5jHea783ALsmdv0q8L9ExMJAykMz2pE8t9hj/
         H+45hF2MsKfC9lW+4Jl+jC1PHH+8SNQTnc3ta9IUoQFri3R4cPk1Wie2NrtumArwbgRl
         siHkWoPu07Zt8ksX4g0l3MPaCmtGKRdISbdyjuCaZfqyxRQm5Zdfx8jQsxoGRM0D05BW
         OqRdlm8R4tRF1wRboXrpHDozc4BpM0IK2cLG1lAOq6YY3gCFaUsX9OdwQfr2nYPxQ0Ax
         S1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704888799; x=1705493599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sul2vRO9Fzn0UMSUus+BZBPqeYHWDQxaw3bzygHSyZc=;
        b=FxRXtpwQ8XXnK/Tev+chdzBuILxBX+HJtIFSUorymO4d5UTg2slf6s9NrF8q7sNMYE
         n9n0o+q7i+RKSaDGsfWz68crksqAV+XObV0zAANWzdIIMhL9fVEZttUSCeohU51AF28/
         aQhi1s+FUFRG2hei1io2v6IV2EWdFTSENIHyuReZYNYyf0h6BupMtEcub8N8Vm8NkbsW
         1LpYGq7ZRa8oy0gt2w7mhzTnurNbkyj8G8euplLLZqbAx79lQ6pu6EJ8rPHGPZOl4K1F
         E2uQGYlPDIeRFI4QIUu9O0QyvyGslhHZtAhe2r91kMYCUnhzIFsuo2V2x5DCCQL9Anzv
         L8Ug==
X-Gm-Message-State: AOJu0YyZpLEKx32f6CNcoOiXIj1knXtSmsn48d3r7VtIQ3AOcx8LANPb
	l/QMJdcgTcIsPmEkbadjoKEe4f6mLRkgwQ==
X-Google-Smtp-Source: AGHT+IF1BKGjGmz8LspFign6ek2eCcSN5Ct8qEn/F4AJ37X/svKfK3A0NBeEYN5c5XQWGzNUoY3rlA==
X-Received: by 2002:a05:6512:3991:b0:50e:b1b7:9301 with SMTP id j17-20020a056512399100b0050eb1b79301mr396237lfu.81.1704888799672;
        Wed, 10 Jan 2024 04:13:19 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id d8-20020a193848000000b0050e7d58e58csm659305lfj.174.2024.01.10.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 04:13:19 -0800 (PST)
Date: Wed, 10 Jan 2024 13:13:18 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 07/15] clk: renesas: rcar-gen4: Add support for FRQCRC1
Message-ID: <20240110121318.GG1625657@ragnatech.se>
References: <cover.1704726960.git.geert+renesas@glider.be>
 <b7ec45c86c2bd17cf3b3de43194c4821b606e483.1704726960.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7ec45c86c2bd17cf3b3de43194c4821b606e483.1704726960.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-08 16:33:46 +0100, Geert Uytterhoeven wrote:
> R-Car V4H and V4M have a second Frequency Control Register C.
> Add support for this by treating bit field offsets beyond 31 as
> referring to the second register.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Tested by enabling CLOCK_ALLOW_WRITE_DEBUGFS and checking the impact of
> CPU core clk rate on CPU core speed on R-Car V4M.
> ---
>  drivers/clk/renesas/rcar-gen4-cpg.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
> index c68d8b987054131b..a2bbdad021ed8e95 100644
> --- a/drivers/clk/renesas/rcar-gen4-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.c
> @@ -179,7 +179,8 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
>   */
>  #define CPG_FRQCRB			0x00000804
>  #define CPG_FRQCRB_KICK			BIT(31)
> -#define CPG_FRQCRC			0x00000808
> +#define CPG_FRQCRC0			0x00000808
> +#define CPG_FRQCRC1			0x000008e0
>  
>  struct cpg_z_clk {
>  	struct clk_hw hw;
> @@ -304,7 +305,12 @@ static struct clk * __init cpg_z_clk_register(const char *name,
>  	init.parent_names = &parent_name;
>  	init.num_parents = 1;
>  
> -	zclk->reg = reg + CPG_FRQCRC;
> +	if (offset < 32) {
> +		zclk->reg = reg + CPG_FRQCRC0;
> +	} else {
> +		zclk->reg = reg + CPG_FRQCRC1;
> +		offset -= 32;
> +	}
>  	zclk->kick_reg = reg + CPG_FRQCRB;
>  	zclk->hw.init = &init;
>  	zclk->mask = GENMASK(offset + 4, offset);
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund
