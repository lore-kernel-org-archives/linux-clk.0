Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE170818
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 06:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676243; cv=none; b=LiPclJOUVy/d3enHBeNMNk1z7OJQ4X418b3xdoBf89dy5KbHKoL4GfdQlGrbPsgXCAgJyHYg8Be/JFO9izbPEOR5NLnskqswpVeAHy0p6vZGwUsANVAni5zO4P2tpPZgievKNNe4OoAzJSyn15hln3nH8gS9TqFDpMexntjsJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676243; c=relaxed/simple;
	bh=IVxmxRsUjPDNci3aW8KFHK8c5c/lUIdBZzb/adO2oZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQ2QP08BPKQZC0ktS/m2/V9cJk+GgbUj806p1vqp8PhbQcTsN98JPuIczCKyh6h9oJh4y7inMlF6MoEHBsctjfhW/i8onQ9VRgdv8muuyO3wcGz73C5lAuwzujINedZQH7fGgWKwq64ghiC+2OBytXyOPv5OpyZuX4sgXpRL9WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOWWs-0002z3-6O; Fri, 20 Dec 2024 07:30:30 +0100
Message-ID: <22faf38d-3e64-40b8-9896-dcccefcc181a@pengutronix.de>
Date: Fri, 20 Dec 2024 07:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: imx8mp: inform CCF of maximum frequency of
 clocks
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
 Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-6-cfaffa087da6@pengutronix.de>
 <20241220061805.GC8295@localhost.localdomain>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241220061805.GC8295@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi Peng,

On 20.12.24 07:18, Peng Fan wrote:
> On Thu, Dec 19, 2024 at 08:27:37AM +0100, Ahmad Fatoum wrote:
>> The IMX8MPCEC datasheet lists maximum frequencies allowed for different
>> modules. Some of these limits are universal, but some depend on
>> whether the SoC is operating in nominal or in overdrive mode.
>>
>> The imx8mp.dtsi currently assumes overdrive mode and configures some
>> clocks in accordance with this. Boards wishing to make use of nominal
>> mode will need to override some of the clock rates manually.
>>
>> As operating the clocks outside of their allowed range can lead to
>> difficult to debug issues, it makes sense to register the maximum rates
>> allowed in the driver, so the CCF can take them into account.
>>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

>> +	imx8mp_clocks_apply_constraints(imx8mp_clock_common_constraints);
>> +
>> +	if (of_property_read_bool(np, "fsl,nominal-mode"))
>> +		imx8mp_clocks_apply_constraints(imx8mp_clock_nominal_constraints);
>> +	else if (of_property_read_bool(np, "fsl,overdrive-mode"))
>> +		imx8mp_clocks_apply_constraints(imx8mp_clock_overdrive_constraints);
> 
> As I replied, a boot parameter should be better? the mode is a soc level mode,
> not just clock controller.

I think it's counterproductive for a sanity check to be enforced via kernel
command-line.

The Skov board shouldn't run with overdrive frequencies and I prefer to encode
that in the same device tree, where I define the permissible VDD_SOC range
and configure the initial clock rates.

The mode is selected by the VDD_SOC voltage, but affects AFAICS only the clock
tree. IMO, the clock controller module is thus a natural place for the property.

Cheers,
Ahmad

> 
> Thanks,
> Peng
> 
>> +
>> 	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
>> 	if (err < 0) {
>> 		dev_err(dev, "failed to register hws for i.MX8MP\n");
>>
>> -- 
>> 2.39.5
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
