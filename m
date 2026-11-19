Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089588;
	b=2QER1pkjLKWL1p2lQwBPTy35ig/hYFRecw+4qNosv0HPqKv3PcdEAYXzAROvRSzJUUZI
	 NYHqzfrT+dzeu4UfgtfIxzvc6jh8k2UpNxd5fxz7p4qFaNK1TY2AkK0+txJ8rDmFW1RVM
	 ztJV8MZdh+5dpg/F8dBUqvTIrb2zJH6ChGPh62YbDecpzTrDjiYOYeg1FSv4NYBNDSMh6
	 6G6vQfe9VCi2Ob1PXbZT1Ml/A4g9wRAvynLkWDlY9DFEG0Hpjix0PsuF7RU5nVmLnwTCE
	 JGBfjeBcgmrhSdoLBfcKRmqWuAOg68H4UVNmhDYcNKF0DdMQ1jJPi6VAQlUaBKZkCYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089588;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6uZDabLxQxlRNvlzS0DFbXpCPUyPpFV7CJaGTp2FAAM=;
	b=lNGeibRHNYtBHVNgPVlKhcRIf976KLd09NcKnuVRFp4pu8WtDrpcI3T4DWo8Uo/7nqkl
	 RI2EB5sWuxgij9T0+SmYYPIQGa9ZTnZXF3xVP+YLYkzOfws1Fx+CnFz9+9OYX8QjiI0WS
	 PQGQCuZUAxMTdMW2FINm8LxmAkY/QwyMejgk8BDyofx2pvQBIHo1x3ljRycMRhP5rsEM/
	 TJsBz+F9oyut+DAJe6fuYAkKLFZV/bIf2xG+UwhKrv4m+rnhHzxoLXFJBaA3c8FH7LWdA
	 MrutwF+E+JIsvDF7pxSHx6wLL6Rnec8dl15aXzDGCuV5sHod2Suzg63EM9Qsjfr7KYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=SZCcXntU;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=NXt5VNLK;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B24606A320
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 11:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=SZCcXntU;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=NXt5VNLK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795089580; bh=6uZDabLxQxlRNvlzS0DFbXpCPUyPpFV7CJaGTp2FAAM=;
 b=SZCcXntUyRVHCkesee+9HuHaniaQ2Hzv7LH2IG/R6AG2W9sLKLZ6gRatSjiY7fXzUgvtfZuMT
 TJIts3FZl0CqDUXzufdO00eLSUI/6VY+kI9L4syFr+grcyUb3WOxLvcH3tK2d6Okeyn7vaQQ7GN
 5K78OD5M/5U2sfn3goLCGiK8JbM7gwzhZaNmmgixohIRsHr7f66VJwAtbnQ8qWDa5VqlUtcLtEt
 3jBlxxu3xB2bP9CFu+TaJD9gCjpWCLv5Eviigm/X2aqu33IZTf+kpmdDUrTO2I0Qbi8ApB3HdZv
 HBM2Meo7MPBokRd6dndSsQUxakzAKsryjGBs/+X01FXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795089580; bh=6uZDabLxQxlRNvlzS0DFbXpCPUyPpFV7CJaGTp2FAAM=;
 b=NXt5VNLKiarO3Vgzw6M/UhcQOftXNpbgKpv3mq5g6cJK7C3vtdafBCYzdQp2qfTpo9EBRYooN
 EsQU+yrRuPfLE6uClaZgSemMQ0amhzFtgpbYe27m/kCUn4EQytJzclBtRZnwMbQuWJz4Mo4LsLV
 J7zfPE+WAMToksSFAzENLlc=
CFBL-Feedback-ID: 6afee4a18179ba28676bf0a4:5f8657ad80648509a22aabaf6d528548
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afee4a18179ba28676bf0a4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <34dbd46a-29cc-4b86-b9cb-9477dc0a4da8@kwiboo.se>
Date: Thu, 19 Nov 2026 12:59:23 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: rockchip: Add RK3572 CRU
To: Cunhao Lu <1579567540@qq.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117-add-board-ok3572-c-clk-v6-0-cabad6610c5f@qq.com>
 <20261117-add-board-ok3572-c-clk-v6-1-cabad6610c5f@qq.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20261117-add-board-ok3572-c-clk-v6-1-cabad6610c5f@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Cunhao Lu,

On 11/17/2026 8:06 AM, Cunhao Lu wrote:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> The RK3572 CRU uses the PMU0 GRF for the AUPLL reference mux.
> Describe the controller and define its clock and reset IDs.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> [adapted to mainline rockchip clock and reset handling (xin24m input,
>  don't introduce CLK_NR_CLKS)]
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v6:
> - Improve readability.
> 
> Changes in v3:
> - Close the reset ID gap while preserving each named reset's register
>   mapping.
> - Remove CLK_NR_CLKS from the clock binding.
> - Fix the indentation of the CRU binding example.
> ---
>  .../bindings/clock/rockchip,rk3572-cru.yaml        |  57 ++
>  include/dt-bindings/clock/rockchip,rk3572-cru.h    | 560 ++++++++++++++++
>  include/dt-bindings/reset/rockchip,rk3572-cru.h    | 713 +++++++++++++++++++++
>  3 files changed, 1330 insertions(+)

[snip]

> diff --git a/include/dt-bindings/clock/rockchip,rk3572-cru.h b/include/dt-bindings/clock/rockchip,rk3572-cru.h
> new file mode 100644
> index 000000000000..b917f72165ae
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk3572-cru.h
> @@ -0,0 +1,560 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + * Author: Elaine Zhang <zhangqing@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3572_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RK3572_H

[snip]

> +#define ACLK_CRYPTO_NS				525
> +#define CLK_PKA_CRYPTO_NS			526
> +#define PCLK_DDR_MON				527
> +
> +/* Secure clocks */
> +#define ACLK_CCI				600
> +#define SCLK_DDR				601
> +#define CLK_STIMER0_ROOT			602
> +#define PCLK_SECURE_S				603
> +#define HCLK_SECURE_S				604
> +#define ACLK_SECURE_S				605
> +#define CLK_PKA_CRYPTO_S			606
> +#define PCLK_KLAD				607
> +#define HCLK_CRYPTO_S				608
> +#define HCLK_KLAD				609
> +#define ACLK_CRYPTO_S				610
> +#define PCLK_OTPC_S				611
> +#define CLK_OTPC_S				612
> +#define PCLK_WDT_S				613
> +#define TCLK_WDT_S				614
> +#define HCLK_TRNG_S				615

Are these secure clocks meant to be used as SCMI clock ids? Why a gap from
527 to 600? If I am not mistaken SCMI ids should similar to Linux clock ids
start at 0 and be a consecutive series.

> +
> +#endif
> diff --git a/include/dt-bindings/reset/rockchip,rk3572-cru.h b/include/dt-bindings/reset/rockchip,rk3572-cru.h
> new file mode 100644
> index 000000000000..a88af7665dae
> --- /dev/null
> +++ b/include/dt-bindings/reset/rockchip,rk3572-cru.h
> @@ -0,0 +1,713 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + * Author: Elaine Zhang <zhangqing@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_ROCKCHIP_RK3572_H
> +#define _DT_BINDINGS_RESET_ROCKCHIP_RK3572_H
> +
> +/* CRU-->SOFTRST_CON01 */
> +#define SRST_ARESETN_TOP_BIU                     0
> +#define SRST_PRESETN_TOP_BIU                     1
> +#define SRST_ARESETN_TOP_MID_BIU                 2
> +#define SRST_HRESETN_TOP_BIU                     3

Please drop the unnecessary/redundant RESETN in all constants. The SRST
prefix is already a short for Software Reset.

Please see [1] for the header I prepared for U-Boot mainline RK3572 support,
it should have all these symbols cleaned up, to match naming patterns used
for all currently supported Rockchip SoCs.

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/rk3562/include/dt-bindings/reset/rockchip%2Crk3572-cru.h

Regards,
Jonas

[snip]

> +#endif
