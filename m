Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D066041DE09
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226470; cv=pass; b=ZEJy9qDFOhAxz+y9nliiwBG4IbVmYcckVXCOLZRJZGa+3jSDsGdiaJRVvCuw9Mh3IX0TFxQHmjYEZ3PiXatSQkUHYNvRuSEdj4OVabpnEISn1/sze2i8CA1TUpV3wE6cXHQWDUMpW97WUVDSHggwhoIuGUc5y0+fiAg12oYZK2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226470; c=relaxed/simple;
	bh=aXPojM4SS6RjwPonXF5sYz2ri5h0M5wozHxrhUCcUsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9iS4+euvrfvvuSkGYI/A3ATrW/1ORBMRt1FH/JBvkQvcP6qmN8HrFsuf4OeIbvbOQvPcREFs3D3FpOxw+zCKN9UUqY+rCrhhZzpLLpWCAYCY6cL4wdmT3xmTqPtoIjt0gcukKCdGhzWIuEZjFdZEN7Yo0dbeyV7fBxY3mHqkHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KemYWj7K; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KemYWj7K"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15b1da6b82so237523066b.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 04:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787226465; cv=none;
        d=google.com; s=arc-20260327;
        b=gqeMOt87kNlXZM8dxnVpAAIY9HSQmwmS01I7pYlN4XQif1cJJoqDbSgJUjwT9GZ+mz
         mHVayLcPWaw17bEi85UtciUX0VZZUBOOP45HbbURbn3vAJ/bgt/+DrAiU1rZOXPcWw1g
         N/9EEpv10iEsFWtejyE92xR+9wjDcXeWrgjZaL7EuZecRIB4bNK8IAgKM1rNugrXqdHb
         +cA1quc1z+VcjWba2+2JNTrsWJENlN2sN3JQEJeHahMkEJ9L4f6T1b06SBpOc/6PQHrC
         nO5mm6BykZGvaZ4tKdz2iwUoAjFHgsCIzoLTtNtsV1/UnPSlUeIr/+gUn6kps2+JjlI3
         IL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        fh=CwGCF+31pHjYlcuzSEjkOCVPKw2TglPp8MJZTMLVtlk=;
        b=Tt3Q+oAm2FmIkotxg+fhUp+/Sb5u87GE3CVjlSA1WNOZQJH0KEDxtftB4OgNKJVhEd
         UqPeBxPFwM0VLENak5dksloRw16so9SUiojdH44EzV9bt5g/d9hHt/HePvFG8iRfpBW4
         rMAmYN30Zsf1Fn6Rl+EFWyPfdghKVKHQC5DodFSb2ASIqYFjvEggQ/Ur8RmxpghA5Hdk
         /m6RbyDsZK2YZxMIeTtuciMZ/6GFMZvilaMi/JK7cTpHF4xcdTqgSG+ijRInq6SY4jM0
         eJEBFuPVad2uEZ5HMI4QpuI/T7p0cfAn23SgKPJxwroBCYAJFuNpPcx9VAMs1WdATdyU
         o+xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787226465; x=1787831265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        b=KemYWj7KpONmipbbKFiilT7O9fQwIW6FtjoZLxfIlIgslXNIHByLFcokTd0lN+Gb6d
         gLSyjn8B1huc57L5lPVpXW0DXdQl2vzpHCMI0KGcLQdok2wbs6cNeOsCYIcVVb2CF98Q
         CW0sDE8kQBWGZuR9I0RI5uXu9UuhJ9F3TXnLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226465; x=1787831265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        b=PmKbcW/7RwLPF7/lDSJ4w1bwio9wR4JzHy0eM8oev8mKNWgDqjdeDDFkIZdlemir1j
         IjqbzynbmAENGcY8pn+NVZkLbeJi/cirQBulbxAU74eSw3gE0LUVlWrxhZKEaGYZTM8s
         +zh4cJKiVVR29Kqgk+vBbTDQtG3838IhHTVr9pCUuYOr61QtCG7u16+HtnJjbY2wvdAg
         lgp/kiUyXNfSCHShF1VGGYQuZfxpP8I8YpOHUFqSyofbEOTuEo+oEF4cit1EWg6iN+NM
         XcRSF97/dk0f4HfO03bGNPm7CG8M8cQkxu2qnJsWXA5Mvp8MdqYrlsMK1v81QYi12Q8m
         LRQg==
X-Forwarded-Encrypted: i=1; AHgh+RoiQBbTE6ijCw+v35ROFMSdPIw4xA9NVe9imXAG+SD0iZ+ivX4twHGjko5u9XIOBypweHfQ7wXswu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8u9PsQord8eonHj+dH+Xa9jzrTuppOH564aND0y5CNT1TonQm
	oo95u6Q3KAxHiS4D8bwx/0ObQmV+/HCIAVq43B4EXG3oY46XPLtN4X0cJIENYGr78AWk+TUl3zO
	8gl/zx2v5OIOB+5Z7mNcLyDv2/LnBGH9LGUST08tL
X-Gm-Gg: AR+sD113TmzVtTloq3a/kCrdaPIuRnAKGTEYdn2GYh2gNJIsUKBF3E7HyWD0QmrXO/Y
	rWedJtYdmRFEkkTjfCMqOF6P+bTeVxyvnmYWewejLIYhB3CB/I2d8HPgihhnGyw+/rHbaNQUgQy
	6lcH1o9E5NINiU8x4NOvaZhQGxyMcbuOQLjMw/Q+XwIbBurc7OXJQavihTQgQ3AKYWAE5zRHjNA
	Ic0GiUc8jxdrikiOOf3O/A8+o90Aj9uKk5eaGBdF28rvNwzWVzTnSlPazCEdxDyEua6NfZZWSvs
	bSWYMuBk4I1WUcW2Y2b1ums/LGNBRx4AJePWBoVFsjQ=
X-Received: by 2002:a17:907:84b:b0:c20:1c9d:8d4b with SMTP id
 a640c23a62f3a-c23f929e232mr710101966b.2.1787226465039; Thu, 20 Aug 2026
 04:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810121121.210040-1-vlad@zlab.su> <20260810121121.210040-7-vlad@zlab.su>
In-Reply-To: <20260810121121.210040-7-vlad@zlab.su>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Aug 2026 05:47:33 -0600
X-Gm-Features: AcwNN1Wh5n38wXHkJkuB8H7_benVkiW5QlI5gxabpims6DcR7Y_DZnlEoYHYlzw
Message-ID: <CAFLszTiuH7KcvCKcpE09tTavFEWGNMj+C1Og0T=k5MvEZdB-OQ@mail.gmail.com>
Subject: Re: [PATCH 06/25] ARM: dts: rockchip: Add Ethernet GMAC node for RV1106
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Vladislav,

On Mon, 10 Aug 2026 at 06:15, Vladislav Leonov <vlad@zlab.su> wrote:
>
> Rockchip RV1106 has GMAC 10/100 ethernet controller.
>
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
>
>  arch/arm/boot/dts/rockchip/rv1106.dtsi | 62 ++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> index fa5d0d7f4dcb..71dd3dcc386c 100644
> --- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -19,6 +19,7 @@ / {
>         interrupt-parent = <&gic>;
>
>         aliases {
> +               ethernet0 = &gmac;
>                 gpio0 = &gpio0;
>                 gpio1 = &gpio1;
>                 gpio2 = &gpio2;
> @@ -282,6 +283,67 @@ system_sram: sram@ff6c0000 {
>                         ranges = <0 0xff6c0000 0x40000>;
>                 };
>
> +               gmac: ethernet@ffa80000 {
> +                       compatible = "rockchip,rv1106-gmac", "snps,dwmac-4.20a";
> +                       reg = <0xffa80000 0x10000>;
> +                       interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq", "eth_wake_irq";
> +                       rockchip,grf = <&grf>;
> +                       clocks = <&cru CLK_GMAC0_TX_50M_O>, <&cru CLK_GMAC0_REF_50M>,
> +                               <&cru ACLK_MAC>, <&cru PCLK_MAC>;

Should this have a minItems exception like RK3506 and 3528? As it is
it fails validation for me as it expects 5 clocks.

> +                       clock-names = "stmmaceth", "clk_mac_ref",
> +                                       "aclk_mac", "pclk_mac";
> +                       resets = <&cru SRST_A_MAC>;
> +                       reset-names = "stmmaceth";
> +
> +                       snps,mixed-burst;
> +                       snps,tso;
> +
> +                       snps,axi-config = <&stmmac_axi_setup>;
> +                       snps,mtl-rx-config = <&mtl_rx_setup>;
> +                       snps,mtl-tx-config = <&mtl_tx_setup>;
> +
> +                       phy-mode = "rmii";
> +                       clock_in_out = "input";
> +                       phy-handle = <&rmii_phy>;
> +
> +                       status = "disabled";
> +
> +                       mdio: mdio {
> +                               compatible = "snps,dwmac-mdio";
> +                               #address-cells = <0x1>;
> +                               #size-cells = <0x0>;
> +                               rmii_phy: ethernet-phy@2 {
> +                                       compatible = "ethernet-phy-ieee802.3-c22";
> +                                       reg = <2>;
> +                                       clocks = <&cru CLK_MACPHY>;
> +                                       resets = <&cru SRST_MACPHY>;
> +                                       phy-is-integrated;
> +                               };
> +                       };
> +
> +                       stmmac_axi_setup: stmmac-axi-config {
> +                               snps,wr_osr_lmt = <4>;
> +                               snps,rd_osr_lmt = <8>;
> +                               snps,blen = <0 0 0 0 16 8 4>;
> +                       };
> +
> +                       mtl_rx_setup: rx-queues-config {
> +                               snps,rx-queues-to-use = <1>;
> +                               queue0 {
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       mtl_tx_setup: tx-queues-config {
> +                               snps,tx-queues-to-use = <1>;
> +                               queue0 {
> +                                       status = "okay";
> +                               };
> +                       };
> +               };
> +
>                 emmc: mmc@ffa90000 {
>                         compatible = "rockchip,rv1106-dw-mshc", "rockchip,rk3288-dw-mshc";
>                         reg = <0xffa90000 0x4000>;
> --
> 2.47.3
>

Regards,
Simon
