Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5472B9AF
	for <linux-clk@vger.kernel.org>; Thu, 25 Jul 2024 08:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721894614; cv=none; b=CxWzOZFaQWNGIsrC4DM0AC2GsQUFxnnKBKTAR/QsACjREfX2RtCSEjI+h3vENA2h3pnzQjFvXQOWLHxYjvk1BLwl4nOCWO57BUf9ZzGtZ/3ymHFj12Aewx+2zU9dDSOiTCJPzSYThbRPZG+qKY91bDtvH0338jRY4wD+ZLE6x9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721894614; c=relaxed/simple;
	bh=J/CGJBbi1jkFnNRlXCaG1UL4a56IsCyG6bmRKRvOgxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kcm0gR1VF1KWfT/21RnWQJ2rP6FhuvT8N+N33lJdhOxFFPj9r2Ogf0Wuq07V2uNf/VrQaftnN0eoo1Ceg4GQpRgrON5rsCkvP/YxQs0C1Q490aTUw73yvIof7oaDIsGijroTfapvIMIKhSHB9MrqNUGbLwhBgB/MzkIhx7TXAN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CSfmkQVz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CSfmkQVz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3685a5e7d3cso363932f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jul 2024 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721894611; x=1722499411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4z2Uc1+f5cX84JLz/1h0gVqAuZCumfNxe++nghYRv/0=;
        b=CSfmkQVz/3GM7nPWEEDlU/oY2frwZHjzkjrrFFntc6ff/5i8aHQWxil2UfdUYZbal2
         1/iKwoAKfmu8hYd43CaLNsIH42DyimNlJDxrqj/uvbSHiL7lz0Fs7AJMBeKZlqpK56qi
         W7KYRyGbbZMtYJFF3WGPd9i0W4u4Tx7doGNMTVhnZx3muhvyw714gGheN6RSOpOZ1asC
         RlPmkOw3jsVetc5W1D8A9Z3H+wEnSEkncOoixEqD6RIFsBOShjCEjyEKVY8R+5FmTmsr
         mx18CgWOpJeGS4G0enE/1De/MY4Z69Q2fPAOP94aW8cNMOwSzoaleFg1PQicbtgTcn2T
         wQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721894611; x=1722499411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4z2Uc1+f5cX84JLz/1h0gVqAuZCumfNxe++nghYRv/0=;
        b=dIIJdpWhxxkTq/pI8SeFOpWp0xfEVW1QztRETc+2ZviojU8iPk+ntQjhngQ4Zv/kPt
         8J631SnwxoS8qR5wVz6JxquAcgvPg+WTw4XsW+6KU/OC5NzRKQUtc/41mvMwBw2i+dZe
         UTvo5S74eNREznOQs6DdQzBXm6y8E26iaQqPqOYJa/JHDEZGpXd1BJg7zDA57nN/uiFK
         K9aNs3p50f49arJGDxCSKjagii8Y+0aA7/LZWQTI9VrB5ek8/E3pa10W+9AFrPeUrRhp
         +rM03E7ObQR7q2wy9v+Bc2jDhGslprUi95dxDDLf3BH3uqisrwAnHjT79hYOtnatC9fP
         aBow==
X-Forwarded-Encrypted: i=1; AJvYcCWFoKnqfxrfkjOCGequUt/kZvlwS93kIDC78px9b1bamv6CUKwc4AIxNi3Tf1NdcqZptFzgDRZA7FnpdbaGRhaR+1REHZ6g8Oze
X-Gm-Message-State: AOJu0Yw+snFnUJYKQpsmalmS0fShOZLn4SGn9Tzy1la1gFwTLX7R70UW
	t9SaiO0TqybsjrBdfXZqqv9VqHG2o4LtKiW8q+eByZpgNYr++4ZLYKB5ImNAJJo=
X-Google-Smtp-Source: AGHT+IEdIMU7gNsMkl9HIcug6VPT3zrOREmSFi2MwfJIgxqpUobBXyo8Rbm7rnDHLGFwE6AXmCrkRQ==
X-Received: by 2002:a5d:534b:0:b0:367:89fd:1e06 with SMTP id ffacd0b85a97d-36b31b08411mr1369965f8f.36.1721894610460;
        Thu, 25 Jul 2024 01:03:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367d9a2fsm1257331f8f.32.2024.07.25.01.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 01:03:30 -0700 (PDT)
Message-ID: <80bbdca4-7f01-48d0-ab91-8847ef8ef1df@tuxon.dev>
Date: Thu, 25 Jul 2024 11:03:27 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alexandre.belloni@bootlin.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
 <20240724145340.GZ501857@google.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240724145340.GZ501857@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Lee,

On 24.07.2024 17:53, Lee Jones wrote:
> On Tue, 16 Jul 2024, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Renesas VBATTB IP has logic to control the RTC clock, tamper detection
>> and a small 128B memory. Add a MFD driver to do the basic initialization
>> of the VBATTB IP for the inner components to work.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - none; this driver is new
>>
>>  drivers/mfd/Kconfig          |  8 ++++
>>  drivers/mfd/Makefile         |  1 +
>>  drivers/mfd/renesas-vbattb.c | 78 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 87 insertions(+)
>>  create mode 100644 drivers/mfd/renesas-vbattb.c
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index bc8be2e593b6..df93e8b05065 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1383,6 +1383,14 @@ config MFD_SC27XX_PMIC
>>  	  This driver provides common support for accessing the SC27xx PMICs,
>>  	  and it also adds the irq_chip parts for handling the PMIC chip events.
>>  
>> +config MFD_RENESAS_VBATTB
>> +	tristate "Renesas VBATTB driver"
>> +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
>> +	select MFD_CORE
>> +	help
>> +	  Select this option to enable Renesas RZ/G3S VBATTB driver which
>> +	  provides support for the RTC clock, tamper detector and 128B SRAM.
>> +
>>  config RZ_MTU3
>>  	tristate "Renesas RZ/G2L MTU3a core driver"
>>  	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 02b651cd7535..cd2f27492df2 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -186,6 +186,7 @@ pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
>>  obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
>>  obj-$(CONFIG_PCF50633_ADC)	+= pcf50633-adc.o
>>  obj-$(CONFIG_PCF50633_GPIO)	+= pcf50633-gpio.o
>> +obj-$(CONFIG_MFD_RENESAS_VBATTB)	+= renesas-vbattb.o
>>  obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
>>  obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
>>  obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
>> diff --git a/drivers/mfd/renesas-vbattb.c b/drivers/mfd/renesas-vbattb.c
>> new file mode 100644
>> index 000000000000..5d71565b8cbf
>> --- /dev/null
>> +++ b/drivers/mfd/renesas-vbattb.c
>> @@ -0,0 +1,78 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VBATTB driver
>> + *
>> + * Copyright (C) 2024 Renesas Electronics Corp.
>> + */
>> +
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/reset.h>
>> +
>> +static int vbattb_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct reset_control *rstc;
>> +	int ret;
>> +
>> +	rstc = devm_reset_control_array_get_exclusive(dev);
>> +	if (IS_ERR(rstc))
>> +		return PTR_ERR(rstc);
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = reset_control_deassert(rstc);
>> +	if (ret)
>> +		goto rpm_put;
>> +
>> +	platform_set_drvdata(pdev, rstc);
> 
> Where is this consumed?

In vbattb_remove().

> 
>> +	ret = devm_of_platform_populate(dev);
> 
> 
> Which devices will this probe?

In this version it is used by clock logic from VBATTB IP, modeled as
individual device. A schema of the blocks controlled in the VBATTB IP can
be found at [1] (please note that there is also the RTC mentioned there but
because it is on the PD_VBATT always-on power domain (backed by battery);
in fact, it is an individual device mapped at it's own address). Here:
- the 32KHz-clock oscillator, mux (with XC, XBYP inputs), CGC are used in
  the cock driver (introduced in this series)
- tamper detector module with gate controlled by TAMPICR1 being part of
  tamper detection logic (no driver for this ATM)
- backup registers being the SRAM (tried locally with mmio-sram driver
  (drives/misc/sram.c)), subnode described with (for internal development):

vbattb: vbattb@1005c000 {

	// ...

	backup_sram: sram@80 {
		compatible = "mmio-sram";
		reg = <0 0x80 0 0x80>;
		clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
		clock-names = "bclk";
		power-domains = <&cpg>;
		resets = <&cpg R9A08G045_VBAT_BRESETN>;
		no-memory-wc;

		#address-cells = <2>;
		#size-cells = <2>;
		ranges = <0 0 0 0x80 0 0x80>;

		pool@0 {
			reg = <0 0 0 0x80>;
			label = "sram-test";
			export;
		};
	};
};

My initial idea was to have logic blocks of the VBATTB IP grouped as
devices (clock for the moment and for future, at least the small SRAM, if
needed at some point). After the discussion with Stephen on clock driver I
tend to give up this model.

Please let me know if you have any hints on how to go forward.

Thank you for  your review,
Claudiu Beznea

[1] https://i2.paste.pics/RFKJ0.png?rand=Xq8w1RLDvZ

> 
>> +	if (ret)
>> +		goto reset_assert;
>> +
>> +	return 0;
>> +
>> +reset_assert:
>> +	reset_control_assert(rstc);
>> +rpm_put:
>> +	pm_runtime_put(dev);
>> +	return ret;
>> +}
>> +
>> +static void vbattb_remove(struct platform_device *pdev)
>> +{
>> +	struct reset_control *rstc = platform_get_drvdata(pdev);
>> +
>> +	reset_control_assert(rstc);
>> +	pm_runtime_put(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id vbattb_match[] = {
>> +	{ .compatible = "renesas,r9a08g045-vbattb" },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, vbattb_match);
>> +
>> +static struct platform_driver vbattb_driver = {
>> +	.probe = vbattb_probe,
>> +	.remove_new = vbattb_remove,
>> +	.driver = {
>> +		.name = "renesas-vbattb",
>> +		.of_match_table = vbattb_match,
>> +	},
>> +};
>> +module_platform_driver(vbattb_driver);
>> +
>> +MODULE_ALIAS("platform:renesas-vbattb");
>> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
>> +MODULE_DESCRIPTION("Renesas VBATTB driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.39.2
>>
> 
