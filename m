Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E0EEB5;
	Sun, 22 Dec 2024 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734883235; cv=none; b=Mnv7SNJN70gAaEclY0hw7zr6S11gDiZX1tdMtvDhxFBx3JYbjEvWVq6Rax4i1apvStnTR+8JyHy+8+PfKJZnLXv9LOq+FloJ34gbomzeUUfeqCuI4sAntOM+qL3BhtgTiAu8hq2QP4HhIRQSfzmZbf8/9XaM+LHeciNYa1QXxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734883235; c=relaxed/simple;
	bh=tTmWLXGwI1dknFyTAeIT9QGQ6j0HSKC6Uh7DxvN+3FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gwuZBGrosRI6O1g7nu3jyIGtmsvAXgRNDjFKCL/DmJnF4Q5eNHPpay/uv8Cnh2ettxPbjIi5KnV7XmvSIYekZwCONhy1mX20ItqFwMmAHCWUw6pTdd7KAIWep9cmnOkOCBxnLTQtGAOzIg8Vssm0ip5/nayVRc6ITdJQRjIk7DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zw6KplPa; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zw6KplPa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GwHxa6K0Xmr4kXkoHJgF0/XGZ/3xq4Pp7hZ+N6dK2Kc=; b=zw6KplPaQy6AVQ6h8YdovxAUDo
	Yb/wX7ax81Zu7BBflhSKlZIXp2mCUp+DOUOK56QGvboqMOyQAlBGMh+uybcf7oPaHT6D1onQkr1SI
	xkg9wG9NCAXS0wiyEwpOWL7btnQEjeKXPAY4MGSpIVwNAd29sXfRa4zEs79uAozy4S7pO61ldW2lQ
	xPiS01/3FFP7OK8hLwo0d9DdFFcFz24mIISe/RF4JFEv3+HZxSxMPvZmbfhWUpMnZVFbGKw7gLMXp
	r2XX4+v0Oo7m0PrmzEDLg9+yW/XMd1tbyHqITsXLGV4E7xtfgHkYqzPouruQQNfTBj3f9wC+oBUEE
	jCXrnnNA==;
Received: from i53875adc.versanet.de ([83.135.90.220] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tPONP-0007b1-4u; Sun, 22 Dec 2024 17:00:19 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/38] clk: rockchip: add dt-binding header for rk3562
Date: Sun, 22 Dec 2024 17:00:17 +0100
Message-ID: <3297012.AJdgDx1Vlc@diego>
In-Reply-To: <20241220103825.3509421-3-kever.yang@rock-chips.com>
References:
 <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-3-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Kever,

Am Freitag, 20. Dezember 2024, 11:37:48 CET schrieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add the dt-bindings header for the rk3562, that gets shared between
> the clock controller and the clock references in the dts.
> Add softreset ID for rk3562.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>


> +#define CLK_NR_CLKS			(CLK_PKA_CRYPTO_S + 1)

As Conor already noted, this should not be part of the binding.
Instead please use the more modern interfaces we have for determining
the max-clk-nr - see rk3576 for example [0]


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/rockchip/clk-rk3576.c#n1730

> +
> +/* soft-reset indices */
> +
> +/********Name=SOFTRST_CON01,Offset=0x404********/
> +#define SRST_A_TOP_BIU			16
[...]
> +/* (0x10200 - 0x400) / 4 * 16 = 260096 */
> +/********Name=PMU0SOFTRST_CON00,Offset=0x10200********/
> +#define SRST_P_PMU0_CRU			260096
> +#define SRST_P_PMU0_PMU			260097
> +#define SRST_PMU0_PMU			260098
[...]
> +/********Name=PMU0SOFTRST_CON02,Offset=0x10208********/
> +#define SRST_P_PMU0_I2C0		260136
> +#define SRST_PMU0_I2C0			260137
> +
> +/* (0x18200 - 0x400) / 4 * 16 = 391168 */
> +/********Name=PMU1SOFTRST_CON00,Offset=0x18200********/
> +#define SRST_P_PMU1_CRU			391168
[...]
> +#define SRST_PMU1_WDTNS			391204
> +#define SRST_PMU1_MAILBOX		391208
> +
> +/* (0x20200 - 0x400) / 4 * 16 = 522240 */
> +/********Name=DDRSOFTRST_CON00,Offset=0x20200********/
> +#define SRST_MSCH_BRG_BIU		522244
> +#define SRST_P_MSCH_BIU			522245

Similarly the binding-IDs for the softresets should not contain those
huge jumps, instead please use the newer system of mapping IDs
to the registers, see rk3576 or rk3588 as example [1] .

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/rockchip/rst-rk3576.c
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/rockchip/rst-rk3588.c


Heiko


