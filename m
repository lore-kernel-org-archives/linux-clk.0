Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C2F38FAD
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742736223; cv=none; b=NKLMybVwf7j4N/JHtA77z1Gr61AM8O2+I7o5gJuqPLUQuerGZO8ayfkyn+8YA38xkfK15HGUOm7Lo97zK0UM0I7xK5Savk2Dg073RTDkAZf5Rier2hEogk88terugeQWJsQtlzWmP2ngWcCLwFU30BcxV39XlkybQ4hu+JVNU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742736223; c=relaxed/simple;
	bh=8m4ki5WTnTOqAS5pWNSqJZYFt1pRtJBBaNdNuRgGqXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1v1HROkbINmiGWnicWfAa1bQRSd7F+UkqR+mH2/BQb/Wz5e9IZaQrwH96uIFDfEsldx4T6XGGv2e6QpwGOqJJbI6fE21NbDPQy4zA2ldCW6LAW1RK+wquXxutXESNfQVj/8CvzLkUiHR7FUWQHcxLPYdzrr2QSnDkTNrbII2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iJdN6KkE; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iJdN6KkE"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso116471339f.2
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742736221; x=1743341021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rjwFsPUVvvPhnWO0yZbKmPZex9tHV8eOTprS6xHwcQ=;
        b=iJdN6KkEoO5d6nCwNnG8fjOVK+pA5vdpz/EQ9eFEbYOpTL1Xv4iMBif+VFjRgoEeBs
         Z+W45wdktyQnCj6zGNtK8Fm0x3D4WGqp6eVMPGu97Q+Lds4yC8rQEj0AxovYJ7HPT+Kb
         vsWAThvd39hRKJK9X+kkjcD7KC0GC1R/LsDzncDmj5qPa5jf4T8ZaLcfR1lEamMewTGF
         i+eogd+0NUM4VCcmfLPOeLqgTceV3dJwGV+r3f1WNqBTccFILEwSa+58S4E4Q9amWAGC
         5WjakV0LIQEVlqHjhgf+5x5Na5ZudN3Iz0vMBVFyNHkbMc87DfYjEVXtdxTkY8tNFupo
         VZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742736221; x=1743341021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rjwFsPUVvvPhnWO0yZbKmPZex9tHV8eOTprS6xHwcQ=;
        b=tSgYxaWO3gwTcwhsOUUkQ24QzxsbJLGAoxz+f/9OHwRuDS2tHcUXCnvSx5ArT0E2V1
         1SQ8u4NmOyNBf2ox1fJWungVlzFZesCGlqthIwE24iaulJ5jPS9Fo8OHDTyEUfrc/9VD
         zYB0byNmXEIlJ31/XR4MwAQ4pJwCnNXwZ3QOrY2n+i6Fw0o8k/EsW0MfIcNbfmc+Hyog
         QCnU8HJL8cGwcea11E1sEIF076FENG7rDUg2EkjjeJtWm1dukYmlXMszCDwAZ1v4aFz6
         bue7MdsAD8CuxVsk4nmE1tulu4QyAhDVe2buhGCXEqI4LZlb8n04okppxc7c1ea+uSOf
         Zz+g==
X-Forwarded-Encrypted: i=1; AJvYcCUfYaKIF2NwlsoJd9Av4N2LVlZVDfQCmPdSCZDNhp7EwlopjPMCdlyjNzdHGZJxtRhGGxsRcdpGmfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnjEA6RdL+OW32NgC20JW10CUGnChAo9YsH+OQr2JW1CMyKu6f
	HqL2YV6A3D3RQbWQy6kjfNgSvv7gAR5WrMyWasShW54sNyq2Vp58y0fYgjQWKjw=
X-Gm-Gg: ASbGncshDaBASNDCn54ETrx2dvnfCauCT8bWpd0OyPM439e+RhVCw1iVoXVMUWjOCPl
	l+4bnJg2ZUlmH3AsTprj84fPpNyK16dnJ3R9lK34WEvFUfE3Z8f3B/gekAncAbjSnJm6NzeR5my
	G4RTkNeWGJdRZy9sjgac73c/jkPx6WQXzbWTEwDlAegT6/sZvu5KIES7MQ5AFJGKCT7WHlDnSYp
	IYQZy0m7iMt2x6vLk3e/uyKXnU9GNvPABgkwioLyivxLsJIFvssZhySz7aM2TMBITFRPpIOqo4f
	WopzutmlNsgcaQZlaHhhV79OLyj4ITDZUbm+Z4Esta62JvP7VBsy34Vc1oCNLKa+l3Wm40e+BCI
	FlgZ4iscQHwtQ5ntVrg==
X-Google-Smtp-Source: AGHT+IF7Fd96mUgZBjBUyzdPCTDqsovLEsSmo2AzCv+iLTRjoA03l+8HJEkqodCvbMpbBAiH42tMqg==
X-Received: by 2002:a05:6602:3a0f:b0:85b:5869:b66 with SMTP id ca18e2360f4ac-85e2ca18965mr965437839f.1.1742736220910;
        Sun, 23 Mar 2025 06:23:40 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm125798039f.11.2025.03.23.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 06:23:40 -0700 (PDT)
Message-ID: <ee9fb4b7-7829-4eec-815c-1e269d6abc38@riscstar.com>
Date: Sun, 23 Mar 2025 08:23:39 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 4/7] clk: spacemit: define existing syscon resets
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-5-elder@riscstar.com> <20250322162909-GYA15267@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322162909-GYA15267@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/25 11:29 AM, Yixun Lan wrote:
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Define reset controls associated with the MPMU, APBC, and APMU
>> SpacemiT K1 CCUs.  These already have clocks associated with them.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 132 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 6d879411c6c05..be8abd27753cb 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
> ..
>> +static const struct ccu_reset_data apmu_reset_data[] = {
>> +	[RST_CCIC_4X]	= RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_CCIC1_PHY] = RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
>> +	[RST_SDH_AXI]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_SDH0]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_SDH1]	= RST_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_SDH2]	= RST_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_USBP1_AXI] = RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
>> +	[RST_USB_AXI]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
> ..
>> +	[RST_USB3_0]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0,
>> +				      BIT(9)|BIT(10)|BIT(11)),
> 100 column if possible, also add one space between "BIT(9) | BIT(10) .."
> continuous bits can just use GENMASK for short?

You'll notice that every place that has multiple bits in the mask
also have a line break.  I kind of liked that as a way to highlight
that fact (i.e., it goes beyond my preference for 80 columns).

I will definitely add spaces, that was a mistake not to.

I will not define this with GENMASK().  In this case each bit
represents a single reset, and so each one is significant on
its own.  It is *not* a mask of contiguous bits, it's a set
of bits that happen to have consecutive positions.

					-Alex

> but may result slightly unreadable, anyway, either way is fine by me
> 
>> +	[RST_QSPI]	= RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_QSPI_BUS] = RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_DMA]	= RST_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_AES]	= RST_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
>> +	[RST_VPU]	= RST_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_GPU]	= RST_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_EMMC]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_EMMC_X]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_AUDIO]	= RST_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
>> +				   BIT(0) | BIT(2) | BIT(3)),
>> +	[RST_HDMI]	= RST_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
>> +	[RST_PCIE0]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
>> +				   BIT(3) | BIT(4) | BIT(5)),
>> +	[RST_PCIE1]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
>> +				   BIT(3) | BIT(4) | BIT(5)),
>> +	[RST_PCIE2]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
>> +				   BIT(3) | BIT(4) | BIT(5)),
>> +	[RST_EMAC0]	= RST_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_EMAC1]	= RST_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_JPG]	= RST_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_CCIC2PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(2)),
>> +	[RST_CCIC3PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(29)),
>> +	[RST_CSI]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_ISP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_ISP_CPP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
>> +	[RST_ISP_BUS]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
>> +	[RST_ISP_CI]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
>> +	[RST_DPU_MCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
>> +	[RST_DPU_ESC]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
>> +	[RST_DPU_HCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
>> +	[RST_DPU_SPIBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL,	0, BIT(4)),
>> +	[RST_DPU_SPI_HBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
>> +	[RST_V2D]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
>> +	[RST_MIPI]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
>> +	[RST_MC]	= RST_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data apmu_reset_controller_data = {
>> +	.count		= ARRAY_SIZE(apmu_reset_data),
>> +	.data		= apmu_reset_data,
>> +};
>> +
>>   static const struct k1_ccu_data k1_ccu_apmu_data = {
>>   	.clk		= k1_ccu_apmu_clks,
>> +	.rst_data	= &apmu_reset_controller_data,
>>   };
>>   
>>   static struct ccu_reset_controller *
>> -- 
>> 2.43.0
>>
> 

