Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827340;
	b=DGGSO8p+BcoyM7gS+WHCKYYGVTtIQZsY/3ms9IRhFFSZ1iFlTgbAUrIJ04SikQYZOCuf
	 renen66GWKi4u15tFjJ9/NUvsSxCzRqH13CoQqkmX8rwGfatTWPZgN1u8FDNqOrJu5uKR
	 N+KTsyZeyVPqo/93txbHEsRUSF1ugd2iYCHthsz5Izq1caNO+dlwuro5EqwJ5IYJTGWLl
	 s+XYPlBrIKMRer6fkai0DTC3DQQmIPL6FEiVueUXeOt6b8b691g/evNFO/3ouuT8xL5FX
	 dhgLz/1OavAIm2wK0i5FY7FKwjuMEr8fEd1VD9hUCDsuHfQ8T/rF6kXReO1S4zuEkAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xCV27pca+nLYEXCVx4Sr4Tceub1iz4rFNRNzljRO58U=;
	b=ucm5VtSQWm1JupcT6TU2tTazGD7OcxGMUX9h5dCDq+ix2HhPM1MnkSUvOK3xpOvhKbP3
	 kCkH5N5w1tqFY1/fc7YhXlZTxj0hMFyN2/8xPwxZ68TkjgBAS7K8NRw3615Gr7Ea9IxTb
	 m0Px/iEWDHNhmXTu2FpAIZaITPLWS6ttr//1MWlT6fld8fIrYUMkRv3Csu6iBUQr58ukF
	 whwBglVVA3qaBYbHvgzzniDCRvl9BeLBkQ07QgXT+iDoHFGZvNPUtrNLk3HuR/GWclFxC
	 rlkNyWeYaXNfkGUIUY4aepTAqHwJafOyb1K6WYBM496l5fIsvLXvmjH5PMOO57YJlxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SzQDqCQG;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A2606AC03
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 21:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765A2606AC03
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SzQDqCQG
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f5a0893610so844814eaf.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 13:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793827334; x=1794432134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCV27pca+nLYEXCVx4Sr4Tceub1iz4rFNRNzljRO58U=;
        b=SzQDqCQGt0ejlw1eRo4ABndt6nog5sseF9ciZHEaxzKKSFDZDpMPp3ZtlNPpu9OnYz
         6Qyz+O036lOsSPOmWVSpA67sHo/Q3ecxIaDRUtOdjCJrZaRJCwy8r76WB1ioPquL37DA
         GRuKW6ZlWlIE9lwO0EKbZEqxaQ58y36OJwiZhvOu411qfDkNR06bNcXaY0hakWeJ1R2r
         QZT02c35GPFXJ69lASU83xa/YyO1erwQcmgOZre3P7AKfcJ31HLdo7YEDPAUdXM4MnDE
         AUfbKuSp8slBWExrEa2pkliXR1XZOJFqKpFT0V9G7G7awH2sOz1LRCLvX8fwGlH0I9K6
         9wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827334; x=1794432134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCV27pca+nLYEXCVx4Sr4Tceub1iz4rFNRNzljRO58U=;
        b=EWc1jtijr1XO6Y3DI7P198OtU9CiV6YvL0mo2hy64dJo6rJYCPJjXh1w5GkipBQPGQ
         s2OHTCMAGFzl0VvrA/q1T/OVkKVdLL6lJcQyNxjhe0qrSt06mpu2alprt7OPsV+2zBGx
         W4hf6SgvH8pXQxyAEPwTxfs0eFhqqv4I6BOmcPwf5Vmh1ka3l5R0I77dAiilbaA4A4M0
         WdW210PAVXt1Jj1nXNRbZA0t+6vxC+aPxm8n/1BercRhuy+VLgy9XDdTTK28OddHm3Dz
         0/lZlffVL3TPYzXZ7hENRKd/F3/YmsT/WqPwqDTycE5lT+ifBnSKeTjr3baEtFD64DlO
         +HNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2WwwnqEtQ5YflaiF4usJ0IXvfEQPQECcbBWVnPKzA3paQ9netl3NbsDKbRzFyaYTKCKGpO3+LIwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W6xPjcRczK+HVuIrws7a/4doUI2ePYgGDwETVExbQN3qmAhDR
	y1eFxUq02ptTo9qTHxeo41cqBMT9MhO1XhVa1aim+oR45bYInmboZ9VpylmveNwv1Kg=
X-Gm-Gg: AYBFou02zpgwzYToJwhTJn1LeHbg7q4D1BhDbgq72XMI75U1i68Y8P+6IbzP+1aM3iv
	85JaX0t+fYUrdP3bq/IVKSH3bvZ4YM3WwgplhA4pkmDROL+velrCekjjwCatVEux33e9FVowCjV
	na4hZ3vwTIrEelDX2tB7cZXtm+Tlfmkjnep8g+dQ+3Z8RNCBGfn7jUPjXTLKkrww9hZ7k92utj+
	b76eR3+Eti3qTTICsIvy4Pad0PTak0r8F1xSDPhV1w+EjElrpk7XJocKAERhdYiS7i4tINyn1KB
	NAfA5E5gew3ldAuupC7jjTX4YJWKtU6RRWR45xpvq/wx1tjcThKCSyeIoxXLggSkWgRTgNGN0so
	ctSOE5xBbibqKLKU3/H/nf0ntauZxrVqzsPaZ5vdWU+wMwBqih+r6wFjZrPL5uIljJZ6iqhu0wE
	ztwpofAQR/JrOFuctjDMxz/MGmc3QBsUw7SZTnis1GJt/oyjTUTH1jMr2ROZMGZP4S59ekjFuau
	odYXVFuSiab3WDIVSca5bWS9GTdd5kkTol6K6gQqAjujsw3EoN/3k8fHocaF24ictkcEbv1orKq
	aNIineQE/5xyxqpZbMSZQi+5IN9Kh05dCKzsPz4YZK5jHLvHmA==
X-Received: by 2002:a05:6820:740c:b0:716:bbec:d300 with SMTP id 006d021491bc7-716bbecebcamr2303942eaf.47.1793827333868;
        Wed, 04 Nov 2026 13:22:13 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61d382sm2928188fac.13.2026.11.04.13.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:22:13 -0800 (PST)
Message-ID: <297312cc-8397-4a4f-b8cd-c28c574f8b03@riscstar.com>
Date: Wed, 4 Nov 2026 15:22:12 -0600
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
Subject: Re: [PATCH 2/4] soc: toshiba: tc9564: add a new syscon driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-3-elder@riscstar.com>
 <sashiko-outbox-196324@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-196324@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 6:50 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] soc: toshiba: SOC_TOSHIBA_TC9564_SYSCON depends on hidden MFD_CORE

I explain more below, but I do not plan to act on the above issue.

> - [Low] soc: toshiba: MFD driver calling devm_mfd_add_devices() outside drivers/mfd/

And I don't plan to act on this one either.

> - [Low] soc: toshiba: Kconfig help and commit message mismatch tc9564-syscon.c

I will do a minor rewording to address this one.

> --
> 
> commit 0d303444d1af16f91e36247fd63b0cb020f8be95
> Author: Alex Elder <elder@riscstar.com>
> 
> soc: toshiba: tc9564: add a new syscon driver
> 
> This commit introduces a platform driver for the Toshiba TC9564 config
> system controller, registering MFD child devices for the chip's clock
> and reset controllers.
> 
>> diff --git a/drivers/soc/toshiba/Kconfig b/drivers/soc/toshiba/Kconfig
>> new file mode 100644
>> index 0000000000000..91adcbe71905c
>> --- /dev/null
>> +++ b/drivers/soc/toshiba/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config SOC_TOSHIBA_TC9564_SYSCON
>> +	tristate "Toshiba TC9564 config system controller support"
>> +	depends on TC9564_PCI
>> +	depends on MFD_CORE
>> +	default TC9564_PCI
> 
> [Severity: Medium]
> Should SOC_TOSHIBA_TC9564_SYSCON use "select MFD_CORE" instead of
> "depends on MFD_CORE"?

I would have used "select", however that leads to a recursive Kconfig
dependency:

error: recursive dependency detected!
	symbol SOC_TOSHIBA_TC9564_SYSCON depends on TC9564_PCI
	symbol TC9564_PCI depends on PCI_DYNAMIC_OF_NODES
	symbol PCI_DYNAMIC_OF_NODES depends on OF_IRQ
	symbol OF_IRQ depends on IRQ_DOMAIN
	symbol IRQ_DOMAIN is selected by MFD_CORE
	symbol MFD_CORE is selected by SOC_TOSHIBA_TC9564_SYSCON

Using "depends on" does not exhibit that circular dependency.

So unless someone suggests a better way to fix this, I will keep
this as-is.

> In drivers/mfd/Kconfig, MFD_CORE is a promptless helper symbol with
> "default n":
> 
>      config MFD_CORE
>          tristate
>          select IRQ_DOMAIN
>          default n
> 
> When a kernel configuration enables CONFIG_TC9564_PCI without any
> unrelated MFD driver that selects MFD_CORE, the dependency on MFD_CORE
> remains unmet and SOC_TOSHIBA_TC9564_SYSCON cannot be enabled.
> Similarly, if TC9564_PCI is built-in (y) and only modular drivers select
> MFD_CORE, SOC_TOSHIBA_TC9564_SYSCON is restricted to modular (m).
> 
>> +	help
>> +	  This enables support for the config system controller for the
>> +	  TC9564 SoC.  It implements an MMIO regmap to manage access to
>> +	  two pages of I/O memory, and serves as a clock and reset
>> +	  controller for IP blocks within the chip.
> 
> [Severity: Low]
> Does this help text (and the commit message) accurately describe what
> drivers/soc/toshiba/tc9564-syscon.c implements?

Generally, I think it does.  It talks about clock and reset,
which are presented as provided by the system controller, even
though the actual drivers for that functionality is implemented
separately (and activated with entries in an MFD cell table).
The regmap gets created automatically.

> In tc9564_config_syscon_probe(), the driver only calls
> devm_mfd_add_devices() to register the toshiba-tc9564-clock and
> toshiba-tc9564-reset MFD cells; it does not set up an MMIO regmap (nor
> does SOC_TOSHIBA_TC9564_SYSCON select MFD_SYSCON) or implement the clock
> and reset controller providers itself. Could the help text and commit
> description be updated to reflect that this driver instantiates the
> clock and reset child devices?

It could.  I'll plan to add a sentence to this effect when I
post version 2 of the series.

> [ ... ]
> 
>> diff --git a/drivers/soc/toshiba/tc9564-syscon.c b/drivers/soc/toshiba/tc9564-syscon.c
>> new file mode 100644
>> index 0000000000000..0d0e2422b82d0
>> --- /dev/null
>> +++ b/drivers/soc/toshiba/tc9564-syscon.c
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/device-id/of.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +static const struct mfd_cell tc9564_config_syscon_cells[] = {
>> +	MFD_CELL_NAME("toshiba-tc9564-clock"),
>> +	MFD_CELL_NAME("toshiba-tc9564-reset"),
>> +};
>> +
>> +static int tc9564_config_syscon_probe(struct platform_device *pdev)
>> +{
>> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				    tc9564_config_syscon_cells,
>> +				    ARRAY_SIZE(tc9564_config_syscon_cells),
>> +				    NULL, 0, NULL);
>> +}
> 
> [Severity: Low]
> Since tc9564_config_syscon_probe() in drivers/soc/toshiba/tc9564-syscon.c
> is purely an MFD driver calling devm_mfd_add_devices() to register child
> devices, should this driver be placed under drivers/mfd/ rather than
> drivers/soc/toshiba/ (with an "mfd: tc9564: ..." commit subject prefix)
> to follow MFD subsystem placement conventions?
It could be, and that's where I had it originally.  I moved it
under drivers/soc/toshiba based on a comment from Conor Dooley.
Under drivers/soc I find 7 C files that call devm_mfd_add_devices()
(although it is true that almost half of the C files under drivers/mfd
call that function).

This driver has the same basic--trivial--structure as five other
drivers under drivers/soc/*/*.c, so I plan to keep the code where
it is.

					-Alex
