Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7883E5EEA
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699989; cv=none; b=DnTt3+sW7lE66puGXTb2dyjR7rs17/fRflg4Cb8e9ZH9IpRDU9kbPnFtEQTOe5pj66jQacLOKNqaRBoioa1XbGN7syEBn5IIXIw4eVXtLZ/NvKr62BL04G5ryYqm/hQfrdbkmosQiZGNmRCLgrDdaW1fmcbaGVda1ltCzlbzx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699989; c=relaxed/simple;
	bh=5JgxFy2M+q3CsNTyNd/dWd2e9DAffFt/Edo2iCguHck=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=F5r5GAI0HVZwBdVF2BhwlBuussYnY6497GcFtokX5qrc/ngOkbiobhEm4U78Ui+v+A8DL9UTk67PaEi0s4XBDrAp2KqRcd3X4Ps09Dn6mpswRXmcJdloTThnuaZFG8BrUub0YJTbLZiTbqoGTINo5BWo1w6NU6ZWPr28fxgVeMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h/pZGXIz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AVheytB9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h/pZGXIz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AVheytB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790699986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vSMTaFwVmnb+Rmt42e8RSqF0GusWSrT12M1j+n1IUM=;
	b=h/pZGXIz4644nHO7ClBteT5bLn1OQXlZIVOrOcvuQlfrWkjabUTQlAWr3vpEHCfNfRlE5u
	KqHtOh9d6OLPjRhQT6rdlzg8i8676pUdHmGya6hQkkXqZ1gXAuUEVdlUAjz6HguCIJMHBM
	xroVLdHTTpsZhpC/lge4n9kOOVopzyg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-UfAAi9NnN4Cmv2ON-JwW2w-1; Tue, 29 Sep 2026 12:39:45 -0400
X-MC-Unique: UfAAi9NnN4Cmv2ON-JwW2w-1
X-Mimecast-MFC-AGG-ID: UfAAi9NnN4Cmv2ON-JwW2w_1790699985
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso180573685a.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790699985; x=1791304785; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4vSMTaFwVmnb+Rmt42e8RSqF0GusWSrT12M1j+n1IUM=;
        b=AVheytB9Y7nDS4MxLM5WGi3Hm9SzThRHXd97DPBFViPXPAk2fta/5ZPPUCS+hO0KyD
         pTs/x2EZqTT4BL+wbeHPXYBQFXQztUfq28tAJnrkZknNU0XDsw4PCztToUkeY5iyqx3c
         69mcgUhjUpSPeJWYJykfk3qbVtglUlv3Rhf8AaS2fbw8kTl8NypxHpNbEmjQURoaSl2u
         h/ApASD1C2TGGmS5LwgV06hdRi7vcBn1nsyALq8mBdkMibl2AWbrnvI9LMm908pOLBP4
         ircMefFRyU1WsQw13n37spC6HUoz7zgNx6w+0N5TRq5vhI3i+Jl7iSZ190F0sotMXQ4e
         /2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699985; x=1791304785;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vSMTaFwVmnb+Rmt42e8RSqF0GusWSrT12M1j+n1IUM=;
        b=SgaUtKMT8fOqkM9t8ZagU/sPwXsR1vjjaDtboOgUkUICZj4NCa64uIqHFZNxx2HfrG
         B/69X99T1aSXQNE0N0x7hdH2jC65ZeBqSmwH2CCoteuvnaQqWbK26t2j0AZnPybyN5ns
         kKWbT2Q5JTnUQNYGvLNGdOC7wHpZxTJMQhXfFYpI1eZ/iI41mj+MvSD5m6ZQ6KaOrDvX
         vY8PgDR8RNSxAEdnLqUCpGZOidKybqHR0xDkZ6OIO4wIBc7ZP+rhsxD7PZrYOCSrs+y+
         sBCjeZJ+MV2VkYHVndlS6vODud5IMCeRXnINn7WNXgLsPpWpPrv/5ZEZNhbycosENeGH
         Pg7w==
X-Gm-Message-State: AFuF++lJo8gyCKfLDHbh+BeoWP0kJYLFY4bA9Gmh4cgfenf0kg12uH7+
	hucJhyS62xqX8LP6SvJklgp8WKSNB6UYqkclXAq2CWnExne+7/MQrlgr8WtETzuubqG4HkJd4UE
	vw4cbDEeYFNzB/mK+PspynzfEzwPexTxoz3iaS9oX+VJoKEenG3+/mJKLFynT5Q==
X-Gm-Gg: AYBFou2ae1Ati5ilLFRNkmwFCPdlwgmIMgljjhQcArgaDh13AN9gqXunG3JGlD7afmB
	KvFCHHNc+6/6Yzplo4vhW0QCqq9QgHsQacO0D9CKNCsQxRWLeGZHbX+r5O4n30ijHCjjgS66ofb
	cEa1AVcXaTcf72iNXrgS54wL1mzuAKW0vktWqyl5VUY+jGb3p9EvFXFN3FGeDONzVAucX+RhnSk
	0YsfRODW8UqiV+8Nr/U5TTH9336e4px0IgnTLWk0JoUTVXtWHfstNSDeEGcfqbKA9+0YUIRgTwT
	4WZga6fEPTOunBilqtCEq4HhTwONPslCK0AZCc8/UlrK2dmXDEWIp7DP2FzlWj7OjIakh+f3rgy
	jlgWd7jJUrG3Y5kIOWoYgtSie2bt/WVj5J6Bn3kttIAjgFVv9bME=
X-Received: by 2002:a05:620a:44c8:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c8bef3627mr583066285a.16.1790699984880;
        Tue, 29 Sep 2026 09:39:44 -0700 (PDT)
X-Received: by 2002:a05:620a:44c8:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c8bef3627mr583060685a.16.1790699984366;
        Tue, 29 Sep 2026 09:39:44 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f569504sm8213985a.45.2026.09.29.09.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: sp7021: fix infrastructure clocks clobbering PLL
 provider entries
From: Brian Masney <bmasney@redhat.com>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-clk@vger.kernel.org, qinjian@cqplus1.com, mturquette@baylibre.com, 
 sboyd@kernel.org, bmasney@redhat.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260820130224.1584902-1-ag@ffroot.co.za>
References: <20260820130224.1584902-1-ag@ffroot.co.za>
Date: Tue, 29 Sep 2026 12:39:39 -0400
Message-Id: <179069997903.213266.2923932929883625249.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5320; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=5JgxFy2M+q3CsNTyNd/dWd2e9DAffFt/Edo2iCguHck=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2vzz7ycm+N27TyV5lxTtR+xYdvf19yx83WVnnLT7PU
 4K31+5+0FHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE9BYz/JWokypfe96ZZ+8W
 vYDIKH/eUr4V6dccmJxPLZqx0n2bfz0jw+crmUnSj5X/vFC82p76KnJJfubmTXKP5i6em7nTQ3J
 1Jy8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Andrew,

On 2026-08-20 15:02 +0200, Andrew Gaylard wrote:
> The sp_clk_gates[] array previously included 9 infrastructure gate
> clocks (CLK_SYSTEM, CLK_IOCTL, etc.) appended after the 64 DT-visible
> gate clocks. The registration loop used the array index directly as the
> hws[] index, so infrastructure clocks at positions 64-72 overwrote
> hws[PLL_A] through hws[PLL_SYS].
> 
> As a result, DT lookups for <&clkc PLL_E_25> (index 67), PLL_E_2P5
> (66) and PLL_E_112P5 (68) silently resolved to CLK_RBUS, CLK_IOP and
> CLK_SDCTRL0 respectively. The L2SW Ethernet driver believed it was
> holding the PLLE outputs, but was actually double-referencing already-
> critical infrastructure clocks. The real PLLE outputs remained at
> enable_count=0 and were powered down by clk_disable_unused(), causing
> an Ethernet hang on boards with fixed-link MAC-to-MAC connections.
> 
> Fix by splitting infrastructure clocks into a separate sp_clk_infra[]
> array and registering them with a dedicated loop that uses a local hw
> variable rather than an hws[] slot. Since these clocks have no DT
> consumer they do not need to appear in the of_clk provider table.
> 
> With the provider table correct, the L2SW driver's devm_clk_get_enabled()
> calls now hold the actual PLLE outputs, making CLK_IS_CRITICAL on plle
> and its sub-outputs unnecessary. Remove it.
> 
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

This patch does not apply against the tree.

Brian

> ---

>  drivers/clk/clk-sp7021.c | 42 +++++++++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> index 1d067b0af8a7..50c667cbb3dc 100644
> --- a/drivers/clk/clk-sp7021.c
> +++ b/drivers/clk/clk-sp7021.c
> @@ -124,9 +124,14 @@ static const struct sp_clk_gate_info sp_clk_gates[] = {
>  	{ 0x97 },
>  	{ 0x98 },		/* CLK_ICM: Input Capture Module */
>  	{ 0x99, 0, true },	/* CLK_AXI_GLOBAL: AXI interconnect, no driver consumer */
> -	/* Infrastructure clocks: all default to enabled in hardware but
> -	 * have no driver consumer, so marked critical to prevent gating.
> -	 */
> +};
> +
> +/*
> + * Infrastructure clocks have no DT consumer so are not exposed
> + * through the of_clk provider. They are registered separately and
> + * marked CLK_IS_CRITICAL so clk_disable_unused() never gates them.
> + */
> +static const struct sp_clk_gate_info sp_clk_infra[] = {
>  	{ 0x00, 0, true },	/* CLK_SYSTEM:  SYSTEM CLKEN    mo_clken0 bit 0  */
>  	{ 0x03, 0, true },	/* CLK_IOCTL:   IOCTL CLKEN     mo_clken0 bit 3  */
>  	{ 0x04, 0, true },	/* CLK_IOP:     IOP CLKEN       mo_clken0 bit 4  */
> @@ -644,25 +649,23 @@ static int sp7021_clk_probe(struct platform_device *pdev)
>  	/*
>  	 * PLLE and all its sub-outputs are used by the L2SW Ethernet switch
>  	 * (50MHz RMII, 25MHz MII/100M, 2.5MHz MII/10M, 112.5MHz MAC fabric).
> -	 * The L2SW driver explicitly claims these via clock-names in DTS, but
> -	 * CLK_IS_CRITICAL is kept as a belt-and-suspenders guard in case the
> -	 * driver consumer reference isn't sufficient on all board configurations.
> +	 * The L2SW driver explicitly claims these via clock-names in DTS.
>  	 */
>  	hws[PLL_E] = sp_pll_register(dev, "plle", &pd_ext, PLLE_CTL,
> -				     6, 2, 50000000, 0, 0, CLK_IS_CRITICAL);
> +				     6, 2, 50000000, 0, 0, 0);
>  	if (IS_ERR(hws[PLL_E]))
>  		return PTR_ERR(hws[PLL_E]);
>  	pd_e.hw = hws[PLL_E];
>  	hws[PLL_E_2P5] = sp_pll_register(dev, "plle_2p5", &pd_e, PLLE_CTL,
> -					 13, -1, 2500000, 0, 0, CLK_IS_CRITICAL);
> +					 13, -1, 2500000, 0, 0, 0);
>  	if (IS_ERR(hws[PLL_E_2P5]))
>  		return PTR_ERR(hws[PLL_E_2P5]);
>  	hws[PLL_E_25] = sp_pll_register(dev, "plle_25", &pd_e, PLLE_CTL,
> -					12, -1, 25000000, 0, 0, CLK_IS_CRITICAL);
> +					12, -1, 25000000, 0, 0, 0);
>  	if (IS_ERR(hws[PLL_E_25]))
>  		return PTR_ERR(hws[PLL_E_25]);
>  	hws[PLL_E_112P5] = sp_pll_register(dev, "plle_112p5", &pd_e, PLLE_CTL,
> -					   11, -1, 112500000, 0, 0, CLK_IS_CRITICAL);
> +					   11, -1, 112500000, 0, 0, 0);
>  	if (IS_ERR(hws[PLL_E_112P5]))
>  		return PTR_ERR(hws[PLL_E_112P5]);
>  
> @@ -689,7 +692,7 @@ static int sp7021_clk_probe(struct platform_device *pdev)
>  		return PTR_ERR(hws[PLL_SYS]);
>  	pd_sys.hw = hws[PLL_SYS];
>  
> -	/* gates */
> +	/* gates, directly mapped into hws[] for DT lookup */
>  	for (i = 0; i < ARRAY_SIZE(sp_clk_gates); i++) {
>  		char name[10];
>  		u32 j = sp_clk_gates[i].reg;
> @@ -706,6 +709,23 @@ static int sp7021_clk_probe(struct platform_device *pdev)
>  			return PTR_ERR(hws[i]);
>  	}
>  
> +	/* infrastructure gates, not in hws[] */
> +	for (i = 0; i < ARRAY_SIZE(sp_clk_infra); i++) {
> +		char name[14];
> +		u32 j = sp_clk_infra[i].reg;
> +		struct clk_hw *hw;
> +
> +		sprintf(name, "infra_0x%02x", j);
> +		hw = devm_clk_hw_register_gate_parent_data(dev, name, &pd_sys,
> +							   CLK_IS_CRITICAL,
> +							   clk_base + (j >> 4) * 4,
> +							   j & 0x0f,
> +							   CLK_GATE_HIWORD_MASK,
> +							   NULL);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +	}
> +
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>  }
>  
> -- 
> 2.53.0
> 
> 
> 


