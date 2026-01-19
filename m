Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2E33B6DA;
	Mon, 19 Jan 2026 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810778; cv=none; b=rVm+ANzVORyz83qpUYv/tYgBrZq4prBiYEMK30o59wG5tLwat6Tlgc1QLm012cXlTPj60U+ZzlmLeB6Epqjhp2XDlMAsrZywogtNH/tAKd7DKckJ0Wp1BJE85pvYp9Hj1ZDRpwsWVyBFN0bXRYDoxAb3MgMEgSBikdPpjG8rhvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810778; c=relaxed/simple;
	bh=R2Wcc8C9LWOgLjWMaAGJjd43X533gJpk314O5CpWOtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWj5vWy7iQBgeEfWbJXjV9gIs5hj4sMBLSSQHPFfNl6OBlJLvKdwpaw/S6iERoJTxxMGGLgbvw1554pKsoC4u8+5tktKcmbM8Ihl1HMqJE3a0rvi4zpYdT6qkOunwegIpIcyUeWRLXfCVRlmoXLRivuleQmYFZQgqTIZLCwZq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.206.18])
	by APP-05 (Coremail) with SMTP id zQCowADXZwv46G1p2zmUBQ--.61720S2;
	Mon, 19 Jan 2026 16:19:07 +0800 (CST)
Date: Mon, 19 Jan 2026 16:18:59 +0800
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
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <aW3o8xVziqb9iRBN@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
X-CM-TRANSID:zQCowADXZwv46G1p2zmUBQ--.61720S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFy7Kr43Ww1fXr45KFW7Jwb_yoW8XFyxpr
	1IvFyfWFZ5JrnakF4DZ3W8Ar1kJFs0y3ZxJr1IyrW8Gw17Xryvva4agr1xta1UJw18Ca1U
	XF4DJw1rta4qk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8fpnPUUUUU==
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

> +
> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
> +		     K230_HS_HCLK_SRC_GATE,
> +		     0x18, 0, 0, 0,
> +		     &hs_hclk_high_src_rate.clk.hw);

Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,
but after my board test, I find that when hs_hclk_high_gate is turned
off, the mmc/sd and other high-speed subsystems can not work. So maybe
you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.

When I used clk_ignore_unused, I saw the log as follows, while the enable
and prepare count of hs_hclk_high_gate is zero. Here is the log:
       pll0_div4                     5  5  0  400000000   0   0     50000      Y  deviceless   no_connection_id
          hs_hclk_high_src_rate      1  1  0  400000000   0   0     50000      Y     deviceless   no_connection_id
             hs_hclk_high_gate       0  0  0  400000000   0   0     50000      Y        deviceless   no_connection_id
             hs_hclk_src_gate        1  1  0  400000000   0   0     50000      Y        deviceless   no_connection_id
                hs_hclk_src_rate     4  4  0  200000000   0   0     50000      Y           deviceless   no_connection_id
                   hs_sd0_ahb_gate   1  1  0  200000000   0   0     50000      Y              91580000.mmc   ahb
                                                                                            deviceless   no_connection_id
                   hs_sd1_ahb_gate   1  1  0  200000000   0   0     50000      Y              91581000.mmc   ahb
                                                                                            deviceless   no_connection_id
                   hs_ssi1_ahb_gate  0  0  0  200000000   0   0     50000      Y              deviceless   no_connection_id
                   hs_ssi2_ahb_gate  0  0  0  200000000   0   0     50000      Y              deviceless   no_connection_id
                   hs_usb0_ahb_gate  1  1  0  200000000   0   0     50000      Y              91500000.usb   otg
                                                                                            deviceless   no_connection_id
                   hs_usb1_ahb_gate  1  1  0  200000000   0   0     50000      Y              91540000.usb   otg

Regards,
Jiayu Du
> +
> +K230_CLK_RATE_FORMAT(hs_hclk_src_rate,
> +		     K230_HS_HCLK_SRC_RATE,

