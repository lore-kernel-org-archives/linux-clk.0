Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595425;
	b=ms2G5dEM/fM7HiLZPUnOe/oqx+7JHZjEvAchE/4isf44jpFNEbhcR5UZFe4WE1x0G8sz
	 AgALGdqiqFHAA4TNVQ0hdpS0HiX5CM7UnIaRQNPpx8WToYt69DsbGbyXOcWiLefoJKK15
	 5AZQVLUqGUO4CNX2yEvtzfKxg8WeCRYt7ELzDjS/5shl6AlAFvNZdF0O56e9MiRL3z/X1
	 H2XISa6wXarfhXm9E3oSgfjJjxzWM6dJkVM6OwB/ExmYFKavPhcN4OYTgbX8kOHT5Q2oe
	 JjtSe0/ok6IdNw16ERzB9RCza19EloHfeJXTCYX9CKMPPI0+bNeOFrLsDgKunblUupA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595425;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=/k8gZBGYV5jL9h2I+CgnzUBBr1JqDjZgZIQAOTXmWJo=;
	b=NhykGfbkORewi8jYi/Nh9dcVYYmt/Ku4ktAYq1jJ1HazdOxEAlWTLMk9g8G1wYoJzupb
	 hfr5/ZzP/8V/D4lBAPasnmpTZCUVqcNQ18AyMvKvJzH0I3F71xAHOm9l8fOnZ/rffJL+a
	 h2MgRUnxzSqc7zzNaM72pHH4rpJ1xM0EWEjxMXF/lx+GH7NvlTAkX/3mWqjWjeUkZZBSm
	 UpGFL/fTs4KHaH97q5QDw1ombrOv1lGGB4aYlCHF3RJNKrGFs5ycP1SlwZllmURil97VX
	 RzN0AVscX/gzsrgBOjpaC3NaimOvd68R5uY9Xns3yHpwP/uHBgI0USHIMAOE/K1/wOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=NN2mOk1V;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF2606A31A;
	Wed, 21 Oct 2026 15:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDF2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=NN2mOk1V
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBEEFA03EA;
	Wed, 21 Oct 2026 17:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792595420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/k8gZBGYV5jL9h2I+CgnzUBBr1JqDjZgZIQAOTXmWJo=;
	b=NN2mOk1VuNGM3iVEBsRpsikIiFP7ZwuapF22toJZMDQEjmRIdInAtR7fy0OInY3RhjHQ8E
	NTYfZbYx9sjBmiYcmsGU9FiYWgAgnxWym8wgTJ5VmK38a3GHUq66hXpbaBOhulZ97QM2a1
	dYWtj6XhjrSZBLgiwaHgoxXWAcMhGESicv11gxFk8fgXgVAciA6/KiPx1Eg0dK047Vz0rN
	CpvnQUF2j93WqumLu0Qbzrg8Ip5N0S4LgheJocctn+NT5XwI+Fzgaot1yv9Lxq9OpFa5ZC
	ykvRBeIzHNi5+cpcVqN+axLqUbhBf3kv7tDmYyuwAlA025X4BhnwQFyu7YzsOA==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 17:10:19 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
In-Reply-To: <sashiko-outbox-180405@kernel.org>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
 <sashiko-outbox-180405@kernel.org>
Message-ID: <f6c76f30641895e8c415bf815b902e11@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 21.10.2026 16:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential 
> issue(s) to consider:
> - [Medium] ARM: dts: bcm2711: genet_mdio clocks property ignored in 
> unimac_mdio_probe()
> --
> 
> commit abe7b1908b1ca3d642c93b8cea72ce17c73c4c14
> Author: Nicolai Buchwitz <nb@tipi-net.de>
> 
> ARM: dts: bcm2711: give the GENET MDIO controller its clock
> 
> This commit adds the BCM2711_CLOCK_GISB clock phandle to the genet_mdio
> device tree node in bcm2711.dtsi so the mdio-bcm-unimac driver can 
> query
> the 200 MHz clock rate.
> 
>> diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi 
>> b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
>> index 5e3b4bb393967..82b38551d55cf 100644
>> --- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
>> +++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
>> @@ -597,6 +597,7 @@ genet_mdio: mdio@e14 {
>>  				compatible = "brcm,genet-mdio-v5";
>>  				reg = <0xe14 0x8>;
>>  				reg-names = "mdio";
>> +				clocks = <&clocks BCM2711_CLOCK_GISB>;
>>  				#address-cells = <0x1>;
>>  				#size-cells = <0x0>;
>>  			};
> 
> [Severity: Medium]
> Will mdio-bcm-unimac actually read the clocks property added to the
> genet_mdio child node here?
> 
> When bcmgenet_probe() initializes the controller, it requests the 
> parent
> genet node's "enet" clock via devm_clk_get_optional(&priv->pdev->dev,
> "enet"), which evaluates to NULL on BCM2711 because the parent
> ethernet@7d580000 node has no clocks property.
> 
> Then bcmgenet_probe() -> bcmgenet_mii_init() -> bcmgenet_mii_register()
> registers the unimac-mdio platform device with platform_data attached:
> 
> drivers/net/ethernet/broadcom/genet/bcmmii.c:bcmgenet_mii_register() {
> 	...
> 	ppd.clk = priv->clk;
> 	...
> 	if (dn)
> 		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
> 	else
> 		ppd.phy_mask = ~0;
> 
> 	ret = platform_device_add_resources(ppdev, &res, 1);
> 	if (ret)
> 		goto out;
> 
> 	ret = platform_device_add_data(ppdev, &ppd, sizeof(ppd));
> 	...
> }
> 
> When unimac_mdio_probe() runs for that device, pdata is non-NULL, so it
> takes the if (pdata) branch and never calls devm_clk_get_optional() on 
> the
> genet_mdio OF node:
> 
> drivers/net/mdio/mdio-bcm-unimac.c:unimac_mdio_probe() {
> 	...
> 	if (pdata) {
> 		bus->name = pdata->bus_name;
> 		priv->wait_func = pdata->wait_func;
> 		priv->wait_func_data = pdata->wait_func_data;
> 		bus->phy_mask = ~pdata->phy_mask;
> 		priv->clk = pdata->clk;
> 	} else {
> 		bus->name = "unimac MII bus";
> 		priv->wait_func_data = priv;
> 		priv->wait_func = unimac_mdio_poll;
> 		priv->clk = devm_clk_get_optional(&pdev->dev, NULL);
> 	}
> 	...
> }
> 
> As a result, priv->clk remains NULL and clk_get_rate(priv->clk) in
> unimac_mdio_clk_set() still returns 0 (and unimac_mdio_clk_set() also
> returns early unless clock-frequency is set).
> 
> Should unimac_mdio_probe() fall back to devm_clk_get_optional() when
> pdata->clk is NULL, or should the clock be wired up through the parent
> genet node?

Known, see the cover letter. Today the pdata branch never looks at the
mdio node, so the property is unused until James's series [1] adds the
node-first devm_clk_get_optional() there (planned for v2), with the
unimac_mdio_clk_set() change as a follow-up. The DT describes the
hardware either way.

[1] 
https://lore.kernel.org/netdev/20261009143506.2507607-1-jjc@jclark.com/
