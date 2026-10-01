Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393023F4854
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847401; cv=none; b=Tb+LeTgOF8lNj7s1fik69EWJ9BuUve7pFBrPrt0mdaSpbbxobyfBhfd+xtJ+k5+Nt8warF6VQhA+v7hosIvfNO6KHyzoiDh+f3CSoScs4qAfTa+KANU3A3v7hx6B+kfScNhNH5QNrUebdp9n75xetlZnyX9IKgGO/Ot40t5lMPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847401; c=relaxed/simple;
	bh=nDsPrs6hnGx0JcUP1jewvJFplt1q3U/HxABhh4zREmU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WNZncewRSaQlK1rqyREeQwD0Ic+p26IQg3PVeTfoI/gNnY72ZdF5bcgMocypSETOhPv+jpulkSppZY1t9NqGDaWfMdf6u+fDQ9Gf3ps4PPGQFX8yYiWRYcAuYJOpPm2oUaOIF/oNtAdCQpDHVn2+NhsF6S3TgXd9c+rMsNQfClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oHDqxbGL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oHDqxbGL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so28607015e9.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790847395; x=1791452195; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQz75FsX45fFNLdrpdOp/Fyp4l/FKa+g0Qu8HGi4Fv4=;
        b=oHDqxbGLSUaXFAVTykGDD+ISX63gQAxTVihQbowAtrZ81s2hlMxspqY0mwWQa/aHPo
         fRaY+supR8nOFw5tbFHUlglUjIFHb5CNSshs/5vXyV4yO5ZLIvA7RiVUzEAaln7DuEnt
         M06WOBi6CDUyb03rLelAJqWYzLJj6xwXXsd31mKP6q50WH8tGDUs2TBNNkxKxuRAIJNZ
         znowzwmrW4ywmg3v16KDV694kVJ47lawwVRs9SWjtpVLjWMnIwr+tDKeyyd3yP/5nfGA
         nmZHfJt/aNvolMMg/9q9pkAzzPxGLZpvjQ3tDWT/AsZ3I1pJTh7AnIa+LYrlzYrtv5bj
         4Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847395; x=1791452195;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQz75FsX45fFNLdrpdOp/Fyp4l/FKa+g0Qu8HGi4Fv4=;
        b=JE74cVGEZdDl8xZAHphECOxPS6bcXXsSrfDQeBHRI+n8E/zK0MjJrAwFsHLsOWHmh0
         LvSRlsCaaEK1wZEVsiH/ifkqvH23iw+Qqx8noeZPilKxIeoaE5bG8cGvaW6JUXQAnbmE
         hh9MKM5B6ag3nttghJNerhdivUE0RzN1HyOEPFpOVYzgfnJkyzxVohppfA0PUlD3e0rV
         LmVkpF3FrOeL5CLaqZ2SI6ld60RWBvJObKjlHusMjouPk8FIEWwZF9ILGZecvDapuYz8
         L1ugmLNwr30KhwMO1q47gMoXh4RYI+zBSB035EA1dTULX5VeVBUFV7UA15HWR1L3WQGn
         7Tdw==
X-Forwarded-Encrypted: i=1; AKwUvBx79fSuXHFcq/ExfWldDoPLiGb704yjGo26ZNcb33VU8dMRda+r1/cFilZtf+0LAOKHZZHzMxqwKQc=@vger.kernel.org
X-Gm-Message-State: AFuF++ntyc7uvbxrIagoBx2dLsytQO1aEX6lflmbROpQDlfSDC1JYFA3
	T/O6vk5hybq6C8lEV2tcf0Dq8yiH+cAqkjURzgh7qCTFiFqdt8ISOwpDWDsVyg0ZAWk=
X-Gm-Gg: AYBFou0Ol6ghgC2qXfmoV7ckmeqCJFxoXe4GoNalYMIVa2/kvdejN4grOV4rUivm8LS
	CdWwQybxDsCZIA3eW0yqTJpUtLeu8inEy977/zjrIE3oydvDQRWbjs7HkZJZV/0Y9NenFX+yoAq
	hDvxLBTYjoDLFIoFQ7ta3+MbM32J+dtgdeFZF6uPn2y8EuXMTiP1LcjIoorqO+aZgb32HrUo+ok
	VRHpfNzlHWcHzrRvioar8h1REL0hePD+rwi8ZFDbvsw8dZbZnsNKgSCFYNhKDM5pupocrI4XOos
	69BC3DqHnmP3jS71A02Q7PtOHVzEY/VsOBD16yLgJYor6jVMmNrUq9Sg8mdeEBUC5F8VJwansXC
	UK0UTZds9v3DFzkACbXjgcjuKfldWT5fzvc4jRpjgy7w1p3dlrg32avoyqWgktccJglXxTmeoGc
	KvHXY/dv+OcpGwKV59l7+mTJ3+3ttJxAqjaKi9pyXI75a+URam4u0lTS2EoYNlrWGv297892rEg
	TMQe6qk0Bk4QJZVOEqgu+I/1Vql
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b2a8 with SMTP id 5b1f17b1804b1-4a01c0ecb6fmr59256415e9.28.1790847395168;
        Thu, 01 Oct 2026 02:36:35 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f220sm57243775e9.5.2026.10.01.02.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:36:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steam Lin
 <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH v6 08/12] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-8-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
 <20260930-perso-ma35d1-upstream-clk-v6-8-48937ee6c9bb@bootlin.com>
Date: Thu, 01 Oct 2026 11:36:33 +0200
Message-ID: <1j7bk13gpq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 30 sept. 2026 at 19:24, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> HXT and LXT are crystal oscillator inputs of the clock controller, they
> are described in the DT, so retrieve them, in order, and store them in
> their respective HXT/LXT hw table entries.
>
> Since old DTs reference the HXT fixed-clock without naming it and do not
> describe LXT at all, we assume that HXT must be present, and fallback to
> creating a fixed clock for LXT if it is not described (for backward
> compatibility purposes).
>
> The downstream gate clocks can directly use the hw clocks as parents,
> instead of relying on string matching.
>
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 43 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
> index ceebcbd8c18b..d955d79abdd2 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -4,6 +4,7 @@
>   * Author: Chi-Fang Li <cfli0@nuvoton.com>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> @@ -191,6 +192,15 @@ static struct clk_hw *ma35d1_clk_gate(struct device *dev, const char *name, cons
>  				    reg, shift, 0, &ma35d1_lock);
>  }
>  
> +static struct clk_hw *ma35d1_clk_gate_parent(struct device *dev, const char *name,
> +					     struct clk_hw *parent,
> +					     void __iomem *reg, u8 shift)
> +{
> +	return devm_clk_hw_register_gate_parent_hw(dev, name, parent,
> +						   CLK_SET_RATE_PARENT,
> +						   reg, shift, 0, &ma35d1_lock);
> +}
> +
>  static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *pllmode)
>  {
>  	const char *of_str;
> @@ -215,10 +225,12 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *clk_node = pdev->dev.of_node;
> +	struct clk_bulk_data *clks;
>  	void __iomem *clk_base;
>  	static struct clk_hw **hws;
>  	static struct clk_hw_onecell_data *ma35d1_hw_data;
>  	u32 pllmode[PLL_MAX_NUM];
> +	int num_clks;
>  	int ret;
>  
>  	ma35d1_hw_data = devm_kzalloc(dev,
> @@ -240,12 +252,27 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> -	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
> -					clk_base + REG_CLK_PWRCTL, 0);
> -	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
> -	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
> -					clk_base + REG_CLK_PWRCTL, 1);
> +	num_clks = devm_clk_bulk_get_all(dev, &clks);
> +	if (num_clks < 0)
> +		return num_clks;
> +
> +	if (!num_clks) {
> +		dev_err(dev, "missing crystal input clocks\n");
> +		return -ENODEV;
> +	}
> +
> +	hws[HXT] = __clk_get_hw(clks[0].clk);

Don't open code it. use .fw_name

> +
> +	if (num_clks > 1)
> +		hws[LXT] = __clk_get_hw(clks[1].clk);
> +	else
> +		/* Old DTs do not describe the low-speed crystal */
> +		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);

I'd give it another name so you can clearly see the difference between the
DT one and the manually registered one.

> +

Don't need to open code this either.
provide both .fw_name and .name - CCF will fallback to the name.

When you want to conditionally register the fixed is up to you.

> +	hws[HXT_GATE] = ma35d1_clk_gate_parent(dev, "hxt_gate", hws[HXT],
> +					       clk_base + REG_CLK_PWRCTL, 0);
> +	hws[LXT_GATE] = ma35d1_clk_gate_parent(dev, "lxt_gate", hws[LXT],
> +					       clk_base + REG_CLK_PWRCTL, 1);
>  	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
>  	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
>  					 clk_base + REG_CLK_PWRCTL, 2);
> @@ -632,8 +659,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  	hws[UART16_GATE] = ma35d1_clk_gate(dev, "uart16_gate", "uart16_div",
>  					   clk_base + REG_CLK_APBCLK0, 28);
>  
> -	hws[RTC_GATE] = ma35d1_clk_gate(dev, "rtc_gate", "lxt",
> -					clk_base + REG_CLK_APBCLK0, 29);
> +	hws[RTC_GATE] = ma35d1_clk_gate_parent(dev, "rtc_gate", hws[LXT],
> +					       clk_base + REG_CLK_APBCLK0, 29);
>  	hws[DDR_GATE] = ma35d1_clk_gate(dev, "ddr_gate", "ddrpll",
>  					clk_base + REG_CLK_APBCLK0, 30);
>  
>
> -- 
> 2.55.0
>

-- 
Jerome
