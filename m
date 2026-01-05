Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508726E71F;
	Mon,  5 Jan 2026 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599723; cv=none; b=XrPGUDOaxn5ZoABmTluEf1KvJZrOV9KILm5Epe593VkkkGX0MIO8/YZrgPQO+rq2IMQQjr9MIFZrutL7VDa+CzSV7LF87lzefyjM0JLU3AUgsw+F6MyIuUGM/AHPsRU9b0WoLLCbSE/mBmD7O58mGJGHdnPkRvQfmNrhir4A7ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599723; c=relaxed/simple;
	bh=RAW2z4Xaf0a4+UOcI2UFO7OmnlW3bXI9jmIgv5Kf2uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEvq51hqh8zFTpi/CzudCRNFxlkOHSUUWwGGUPn0V8oaOp/cN2AsGN+ZTCM+1TIxGj141oFZ5ywwOgNgLoVBn6PTKKXTjOubL/Fp5atMCcfgzKLnFHUXa5MClf3tOSdzsUiIGfERyn+tRk8s9tv7ju5lravLIp0ze97YFCQFx0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4A6AD340F29;
	Mon, 05 Jan 2026 07:55:21 +0000 (UTC)
Date: Mon, 5 Jan 2026 15:55:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: spacemit: k3: add clock support
Message-ID: <20260105075510-GYA2078702@gentoo.org>
References: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
 <20260103-k3-clk-v4-1-4cccba2360f0@gentoo.org>
 <20260105-copper-warthog-of-mathematics-883f7c@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-copper-warthog-of-mathematics-883f7c@quoll>

Hi Krzysztof,

On 08:48 Mon 05 Jan     , Krzysztof Kozlowski wrote:
> On Sat, Jan 03, 2026 at 03:44:16PM +0800, Yixun Lan wrote:
> > Add compatible strings for clock drivers to support Spacemit K3 SoC,
> > also includes all the defined clock IDs.
> > 
> > The SpacemiT K3 SoC clock IP is scattered over several different blocks,
> > which are APBC, APBS, APMU, DCIU, MPMU, all of them are capable of
> > generating clock and reset signals. APMU and MPMU have additional Power
> > Domain management functionality.
> > 
> > Following is a brief list that shows devices managed in each block:
> > 
> > APBC: UART, GPIO, PWM, SPI, TIMER, I2S, IR, DR, TSEN, IPC, CAN
> > APBS: various PPL clocks control
> > APMU: CCI, CPU, CSI, ISP, LCD, USB, QSPI, DMA, VPU, GPU, DSI, PCIe, EMAC..
> > DCID: SRAM, DMA, TCM
> > MPMU: various PLL1 derived clocks, UART, WATCHDOG, I2S
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
..
> > @@ -28,7 +30,7 @@ properties:
> >    "#clock-cells":
> >      const: 1
> >      description:
> > -      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> > +      See corresponding file under <dt-bindings/clock/> for valid indices.
> 
> List two paths, better. Generic path to clock directory is obvious and
> not helping.
> 
ok, will do

> > @@ -39,7 +43,7 @@ properties:
> >    "#clock-cells":
> >      const: 1
> >      description:
> > -      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> > +      See corresponding file under <dt-bindings/clock/> for valid indices.
> 
> Same problem here.
> 
ditto

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
thanks, I will wait few days for incoming reviews, then update

> Best regards,
> Krzysztof
> 

-- 
Yixun Lan (dlan)
