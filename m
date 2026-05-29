Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781F37C902
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088572; cv=none; b=WTwHwOiFYAlc0q4dDAUDarpHradad3j5X8k1pjk6VL/FzKXA96zwcB5IuRNXn27tzUXUH7jpdNXOOPqioktppPBk4nhvv8xbBy7teF2IXis1rPTmRlC4CuI3teA/szIdW5VB094pMiFow4TTqrZgvNKMaGO3P+fr424UdBZ3LEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088572; c=relaxed/simple;
	bh=lVuPikF/wKCQSLI48O9pSb4IgnPDV3UiwJUjwwMF+zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVSLRx+CBI/+xgAFUVCc8B8IZaoveNEBBHboxGF53gDmddLdRHSWUegHReEsSi3GvJM/l8mn34aLMHXghVd0+aFAsfoe20tTu1ejwDB4eTWr0buAUAMSVqwXc/oMKS4SnUtSqDAN6s5vbW4tTBril0gp8RIcwWTPUIK7bzXx0z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M8O8mcXZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M8O8mcXZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 58AB54E42D90;
	Fri, 29 May 2026 21:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B980A601FA;
	Fri, 29 May 2026 21:02:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FB5510888054;
	Fri, 29 May 2026 23:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780088566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Ew7EaXDf+CetOXIPNgp4VIOFryqMnNlS6SuVadEO47g=;
	b=M8O8mcXZxK9rJoNSMB5rnm8quxy6IVgY6oZBPO5DnbxV0hnjayRtTcRDfeNFPhDf9ynznQ
	m2Aa9MVU91cS/LDH7Zy9O42I4Bo2ADUwAVnJOEhtsv60qp8eOC94k0/3Ro0mua8TGsKlLt
	PSNS7usl4x5uRbmJhhPRDeaquKz99AnVAzFUnR4TTUCsAqJMsVSgQ++PFGKAl3mmfauhOx
	ZV3T/OhSmwLjLT/CarI+s3G+tncMJR5C2JVipCC9AKL5FFEMBUT2HTXD/n0RHfE/YWe7x9
	jsOEMduGogQX0X4VViTfxpUSY3dbRor+7juh3P6MznSdyTUX2pn8pvJ96HvXPw==
Date: Fri, 29 May 2026 23:02:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Brian Masney <bmasney@redhat.com>, Kees Cook <kees@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: at91: keep securam node alive while mapping it
Message-ID: <20260529210243877820a5@mail.local>
References: <20260529042051.1626978-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529042051.1626978-1-dbgh9129@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On 29/05/2026 00:20:51-0400, Yuho Choi wrote:
> pmc_register_ops() gets an owned reference to the
> "atmel,sama5d2-securam" node with of_find_compatible_node().  The
> success path dropped that reference before passing the node to
> of_iomap(), leaving of_iomap() to consume a node pointer after the caller
> had released its reference.
> 
> Move of_node_put() after of_iomap() so the node remains referenced for
> the mapping operation.  The unavailable-node error path already releases
> the reference.
> 
> Fixes: 4d21be864092 ("clk: at91: pmc: execute suspend/resume only for backup mode")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/clk/at91/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
> index b618a5e00b00..03a6c31d6aa8 100644
> --- a/drivers/clk/at91/pmc.c
> +++ b/drivers/clk/at91/pmc.c
> @@ -180,9 +180,9 @@ static int __init pmc_register_ops(void)
>  		of_node_put(np);
>  		return -ENODEV;
>  	}
> -	of_node_put(np);
>  
>  	at91_pmc_backup_suspend = of_iomap(np, 0);
> +	of_node_put(np);
>  	if (!at91_pmc_backup_suspend) {
>  		pr_warn("%s(): unable to map securam\n", __func__);
>  		return -ENOMEM;
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
