Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E265AC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  7 Feb 2022 12:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236024AbiBGM5W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Feb 2022 07:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390515AbiBGLy4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Feb 2022 06:54:56 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416CEC03FEC0
        for <linux-clk@vger.kernel.org>; Mon,  7 Feb 2022 03:51:27 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2177eodE028141;
        Mon, 7 Feb 2022 12:49:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=X625PkH7tVgQ0OpW/ae9JenbtwbtxQ43M08JhwRUZPw=;
 b=bWNj7wpBXzS40BmCgYlyAFExlxr0E9pYrk9toT7r18RBU21prIlAak0U560Si5VV8hW6
 eK+6NlKq+klZuyv8mnydpbRqu+RLYcENhTMT0yw6UPf7op7jbYsiNfTPYRH3So5DM72J
 d/eUG/X37rA6b6jGyBnL/1tqz1hceXuWNiUjr9YRoc21uznV/hZJrWWaxZn7dsO+TPSt
 97CXxwLi0CuZBGg1c3yRDtGBa7jBGIBE6XvOPIxWNSnyOguvsiEpMFr/7bU5Uu3IgsQK
 fsdYNoKaDZC0O9UBjpSgfutvf8QMI7b3TcXkQPbQQOsN2zcsFfw1HXtCYwlIUVjYXGpL ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e2fg5m0p5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Feb 2022 12:49:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13E3C10002A;
        Mon,  7 Feb 2022 12:49:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D32E2194C8;
        Mon,  7 Feb 2022 12:49:09 +0100 (CET)
Received: from [10.48.0.252] (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 7 Feb
 2022 12:49:08 +0100
Message-ID: <477a14e5-2bff-b23f-d361-f7f3289190af@foss.st.com>
Date:   Mon, 7 Feb 2022 12:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on
 DHCOM
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC:     <jneuhauser@dh-electronics.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20220118202958.1840431-1-marex@denx.de>
 <20220118202958.1840431-5-marex@denx.de>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220118202958.1840431-5-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_04,2022-02-07_01,2021-12-02_01
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/18/22 21:29, Marek Vasut wrote:
> The DHCOM SoM has two options for supplying ETHRX clock to the DWMAC
> block and PHY. Either (1) ETHCK_K generates 50 MHz clock on ETH_CLK
> pad for the PHY and the same 50 MHz clock are fed back to ETHRX via
> internal eth_clk_fb clock connection OR (2) ETH_CLK is not used at
> all, MCO2 generates 50 MHz clock on MCO2 output pad for the PHY and
> the same MCO2 clock are fed back into ETHRX via ETH_RX_CLK input pad
> using external pad-to-pad connection.
> 
> Option (1) has two downsides. ETHCK_K is supplied directly from either
> PLL3_Q or PLL4_P, hence the PLL output is limited to exactly 50 MHz and
> since the same PLL output is also used to supply SDMMC blocks, the
> performance of SD and eMMC access is affected. The second downside is
> that using this option, the EMI of the SoM is higher.
> 
> Option (2) solves both of those problems, so implement it here. In this
> case, the PLL4_P is no longer limited and can be operated faster, at
> 100 MHz, which improves SDMMC performance (read performance is improved
> from ~41 MiB/s to ~57 MiB/s with dd if=/dev/mmcblk1 of=/dev/null bs=64M
> count=1). The EMI interference also decreases.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 22 ++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 8c41f819f7769..b091d9901e976 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -116,15 +116,29 @@ &dts {
>   	status = "okay";
>   };
>   
> +&rcc {
> +	/* Connect MCO2 output to ETH_RX_CLK input via pad-pad connection */
> +	clocks = <&rcc CK_MCO2>;
> +	clock-names = "ETH_RX_CLK/ETH_REF_CLK";
> +
> +	/*
> +	 * Set PLL4P output to 100 MHz to supply SDMMC with faster clock,
> +	 * set MCO2 output to 50 MHz to supply ETHRX clock with PLL4P/2,
> +	 * so that MCO2 behaves as a divider for the ETHRX clock here.
> +	 */
> +	assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
> +	assigned-clock-parents = <&rcc PLL4_P>;
> +	assigned-clock-rates = <50000000>, <100000000>;
> +};
> +
>   &ethernet0 {
>   	status = "okay";
> -	pinctrl-0 = <&ethernet0_rmii_pins_a>;
> -	pinctrl-1 = <&ethernet0_rmii_sleep_pins_a>;
> +	pinctrl-0 = <&ethernet0_rmii_pins_b &mco2_pins_a>;
> +	pinctrl-1 = <&ethernet0_rmii_sleep_pins_b &mco2_sleep_pins_a>;
>   	pinctrl-names = "default", "sleep";
>   	phy-mode = "rmii";
>   	max-speed = <100>;
>   	phy-handle = <&phy0>;
> -	st,eth-ref-clk-sel;
>   
>   	mdio0 {
>   		#address-cells = <1>;
> @@ -136,7 +150,7 @@ phy0: ethernet-phy@1 {
>   			/* LAN8710Ai */
>   			compatible = "ethernet-phy-id0007.c0f0",
>   				     "ethernet-phy-ieee802.3-c22";
> -			clocks = <&rcc ETHCK_K>;
> +			clocks = <&rcc CK_MCO2>;
>   			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
>   			reset-assert-us = <500>;
>   			reset-deassert-us = <500>;

Applied on stm32-next using ethernet0_rmii_pins_c instead of 
ethernet0_rmii_pins_b (same for sleep pins.

Cheers
Alex
