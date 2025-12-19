Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD12264AA;
	Fri, 19 Dec 2025 08:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131342; cv=none; b=RtmefSLNO0HRmFM+OAfxXWHQvj7za7ge49PE77tNElWAaPZJ01rcUmPKp/KT+mGyXvbKc5Xp2vECdjTYnubuyX0kbvt8Wy+r1HenwJrxpYyLbqDNN23U1NDxlUZdcKQBp1xEq4+flBxxwLl8+8JrISfXiG0jMocZCySX1jttd/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131342; c=relaxed/simple;
	bh=CHVhsEEszqnU4LoxOGS7wHG+fmEdUXxxtRBiyrbO9Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVU/txh5d2PfqnTZ0ZPBzCC7VQHEr0jsArOK1U/cJNd4GWpR8aqALsH74A22A9jkd93c8L+r8RspUw7eNidR1STZkZDISU1UAAMLzTVCefJPaMS3Yz5gHxM6XGFRPH47DO69pmcRTo5iB4HSMAJbywrA+wwwNrFvqPPrjbB1Oj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.22])
	by APP-01 (Coremail) with SMTP id qwCowACHLmp4BkVpRhwZAQ--.24049S2;
	Fri, 19 Dec 2025 16:02:03 +0800 (CST)
Date: Fri, 19 Dec 2025 16:02:00 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v9 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <aUUGeGnYR+joVR8c@duge-virtual-machine>
References: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
 <20251127-b4-k230-clk-v9-2-3aa09e17faf5@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127-b4-k230-clk-v9-2-3aa09e17faf5@zohomail.com>
X-CM-TRANSID:qwCowACHLmp4BkVpRhwZAQ--.24049S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GrWkXr13XF18XryrJFWUurg_yoW7tr4kpr
	1Yg34rAF4qyw13Ga1avw1UuF95KF48GF1qga4xW34rAF45GF9FgF1SgryIyF43XFy8C3yF
	qFyUt3yY93yjyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2wIDUUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Thu, Nov 27, 2025 at 08:45:13PM +0800, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which covers
> all clocks in K230 SoC.
> 
> The clock tree of the K230 SoC consists of a 24MHZ external crystal
> oscillator, PLLs and an external pulse input for timerX, and their
> derived clocks.
> 
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  drivers/clk/Kconfig    |    6 +
>  drivers/clk/Makefile   |    1 +
>  drivers/clk/clk-k230.c | 2443 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2450 insertions(+)
...
> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8750e9cbac04f30e31d8f2eb395c9b49027ca278
> --- /dev/null
> +++ b/drivers/clk/clk-k230.c
> @@ -0,0 +1,2443 @@
...
> +
> +K230_CLK_GATE_FORMAT(cpu0_src_gate,
> +		     K230_CPU0_SRC_GATE,
> +		     0, 0, 0, 0,
> +		     &pll0_div2.hw);

Core-related clocks of cpu0/cpu1 (src/plic/apb/noc_ddrcp4, etc.)
lack protection flags, which risks accidental disabling.

Recommend to replace the flag bits for all CPU0/CPU1 core clock
nodes with `CLK_IS_CRITICAL`,like this:
`0, 0, 0, 0,` -> `0, 0, CLK_IS_CRITICAL, 0,`

> +
> +K230_CLK_RATE_FORMAT(cpu0_src_rate,
> +		     K230_CPU0_SRC_RATE,
> +		     1, 16, 1, 0xF,
> +		     16, 16, 0, 0x0,
> +		     0x0, 31, mul, 0x0,
> +		     false, 0,
> +		     &cpu0_src_gate.clk.hw);
> +
same as above,`false, 0,` ->`false, CLK_IS_CRITICAL,`
> +K230_CLK_RATE_FORMAT(cpu0_axi_rate,
> +		     K230_CPU0_AXI_RATE,
> +		     1, 1, 0, 0,
> +		     1, 8, 6, 0x7,
> +		     0x0, 31, div, 0x0,
> +		     0, 0,
> +		     &cpu0_src_rate.clk.hw);
> +
same as above,`0, 0,` ->`0, CLK_IS_CRITICAL,`
> +K230_CLK_GATE_FORMAT(cpu0_plic_gate,
> +		     K230_CPU0_PLIC_GATE,
> +		     0x0, 9, 0, 0,
> +		     &cpu0_src_rate.clk.hw);
> +
same as above,`0x0, 9, 0, 0,` -> `0x0, 9, CLK_IS_CRITICAL, 0,`
> +K230_CLK_RATE_FORMAT(cpu0_plic_rate,
> +		     K230_CPU0_PLIC_RATE,
> +		     1, 1, 0, 0,
> +		     1, 8, 10, 0x7,
> +		     0x0, 31, div, 0x0,
> +		     false, 0,
> +		     &cpu0_plic_gate.clk.hw);
> +
same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
> +K230_CLK_GATE_FORMAT(cpu0_noc_ddrcp4_gate,
> +		     K230_CPU0_NOC_DDRCP4_GATE,
> +		     0x60, 7, 0, 0,
> +		     &cpu0_src_rate.clk.hw);
> +
same as above,`0x60, 7, 0, 0,` -> `0x60, 7, CLK_IS_CRITICAL, 0,`
> +K230_CLK_GATE_FORMAT(cpu0_apb_gate,
> +		     K230_CPU0_APB_GATE,
> +		     0x0, 13, 0, 0,
> +		     &pll0_div4.hw);
> +
same as above,`0x0, 13, 0, 0,` -> `0x0, 13, CLK_IS_CRITICAL, 0,`
> +K230_CLK_RATE_FORMAT(cpu0_apb_rate,
> +		     K230_CPU0_APB_RATE,
> +		     1, 1, 0, 0,
> +		     1, 8, 15, 0x7,
> +		     0x0, 31, div, 0x0,
> +		     false, 0,
> +		     &cpu0_apb_gate.clk.hw);
> +
same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
> +static const struct clk_parent_data k230_cpu1_src_mux_pdata[] = {
> +	{ .hw = &pll0_div2.hw, },
> +	{ .hw = &pll3.hw, },
> +	{ .hw = &pll0.hw, },
> +};
> +
> +K230_CLK_MUX_FORMAT(cpu1_src_mux,
> +		    K230_CPU1_SRC_MUX,
> +		    0x4, 1, 0x3,
> +		    0, 0,
> +		    k230_cpu1_src_mux_pdata);
> +
same as above,`0, 0,` -> `CLK_IS_CRITICAL, 0,`
> +K230_CLK_GATE_FORMAT(cpu1_src_gate,
> +		     K230_CPU1_SRC_GATE,
> +		     0x4, 0, CLK_IGNORE_UNUSED, 0,
> +		     &cpu1_src_mux.clk.hw);
> +
same as above,`0x4, 0, CLK_IGNORE_UNUSED, 0,` -> `0x4, 0, CLK_IS_CRITICAL, 0,`
> +K230_CLK_RATE_FORMAT(cpu1_src_rate,
> +		     K230_CPU1_SRC_GATE,
> +		     1, 1, 0, 0,
> +		     1, 8, 3, 0x7,
> +		     0x4, 31, div, 0x0,
> +		     false, 0,
> +		     &cpu1_src_gate.clk.hw);
> +
same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
> +K230_CLK_RATE_FORMAT(cpu1_axi_rate,
> +		     K230_CPU1_AXI_RATE,
> +		     1, 1, 0, 0,
> +		     1, 8, 12, 0x7,
> +		     0x4, 31, div, 0x0,
> +		     false, 0,
> +		     &cpu1_src_rate.clk.hw);
> +
same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
> +K230_CLK_GATE_FORMAT(cpu1_plic_gate,
> +		     K230_CPU1_PLIC_GATE,
> +		     0x4, 15, CLK_IGNORE_UNUSED, 0,
> +		     &cpu1_src_rate.clk.hw);
> +
same as above,`0x4, 15, CLK_IGNORE_UNUSED, 0,` -> `0x4, 15, CLK_IS_CRITICAL, 0,`
> +K230_CLK_RATE_FORMAT(cpu1_plic_rate,
> +		     K230_CPU1_PLIC_RATE,
> +		     1, 1, 0, 0,
> +		     1, 8, 16, 0x7,
> +		     0x4, 31, div, 0x0,
> +		     false, 0,
> +		     &cpu1_plic_gate.clk.hw);
> +
same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
> +K230_CLK_GATE_FORMAT(cpu1_apb_gate,
> +		     K230_CPU1_APB_GATE,
> +		     0x4, 19, 0, 0,
> +		     &pll0_div4.hw);
> +
same as above,`0x4, 19, 0, 0,` -> `0x4, 19, CLK_IS_CRITICAL, 0,`
> +K230_CLK_RATE_FORMAT(cpu1_apb_rate,
> +		     K230_CPU1_APB_RATE,
> +		     1, 1, 0, 0,
> +		     1, 8, 15, 0x7,
> +		     0x0, 31, div, 0x0,
> +		     false, 0,
> +		     &cpu1_apb_gate.clk.hw);
> +
same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
> +K230_CLK_GATE_FORMAT_PNAME(pmu_apb_gate,
> +			   K230_PMU_APB_GATE,
...
> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
> +		     K230_HS_HCLK_SRC_GATE,
> +		     0x18, 1, 0, 0,
> +		     &hs_hclk_high_src_rate.clk.hw);
> +

Incorrect register bit setting (bit1) and wrong parent
clock reference (hs_hclk_high_src_rate) for hs_hclk_src_gate,
which does not comply with K230 hardware specifications.
Here is correcting advice:
Register bit correction: `0x18, 1, 0, 0,` -> `0x18, 0, 0, 0,`
Parent clock correction: `&hs_hclk_high_src_rate.clk.hw` ->
`&hs_hclk_high_gate.clk.hw`

> +K230_CLK_RATE_FORMAT(hs_hclk_src_rate,
> +		     K230_HS_HCLK_SRC_RATE,
...
> +K230_CLK_RATE_FORMAT(hs_sd_card_src_rate,
> +		     K230_HS_SD_CARD_SRC_RATE,
> +		     1, 1, 0, 0,
> +		     2, 8, 12, 0x7,
> +		     0x1C, 31, div, 0x0,
> +		     false, 0,
> +		     &pll0_div4.hw);
> +

The parent clock of hs_sd_card_src_rate is incorrectly pointed
to pll0_div4.
Here is correcting advice:
`&pll0_div4.hw` → `&hs_sd_card_src_gate.clk.hw`

> +K230_CLK_GATE_FORMAT(hs_sd0_card_gate,
> +		     K230_HS_SD0_CARD_GATE,
> +		     0x18, 15, 0, 0,
...
> +	},
> +	.probe = k230_clk_probe,
> +};
> +builtin_platform_driver(k230_clk_driver);
> 
> -- 
> 2.34.1
> 

