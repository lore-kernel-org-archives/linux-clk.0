Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A4B2E22B4
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052608; cv=none; b=opcZ1qLCBymNZxCAF9sSxmKvQflYx/kUAbTuegbrvOI0SxG4aVtCiXuVDRE3Pp+FhXSP6dC90WS8W1SC244tsBlZiLZctsgo41/EHdqooo12TXGKBu2nNm0KfxDr7rD3fLQDx2kIxr1OJbQ5TNi/iAps6/LyMzQvLSacFnSO4rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052608; c=relaxed/simple;
	bh=knG1/6Zq0XiYPG2BG5s77b/+W0LTFGc5Cok0Z3vP3bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nq9LAigVBxVdWaTMe/9W+I/1LzY2gp9V2JefqWrC6xcDyUJxKRLtJH5uZbwqoSq0VNIeTN/GQer9g20qII/07gYlKtMFyApsS4RzdY1zPwNRB7lS3O2a5kWphwfvHcRktY18/IzOghlJFd90MS6n+zt256U3H3BVE/otw3KyfU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgKvRn6m; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgKvRn6m"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b40f11a1027so1099211366b.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761052605; x=1761657405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0jubacFDSdFcQnHYVbBIaUUxwO2V0rJTSsvBZVmUXc=;
        b=GgKvRn6m/DuPSC3wiV8SG8odvNRTXd+OGVddf7MakmLU9w7e4EggAcTcWO5Y720nWv
         2lKrXzc9KJZvUrc14y2cgkG64FId6FDcuG6VNzVt0xeXSVlknvAQmuaTq2XI/uO7T1Ka
         Dngq3hl96cOPya2vjVzzAB4kufGjl3WrDQvrHQ76MEzQDrrjweP4/g14p0rEOt2eaN9i
         xsx8gzcJUJrlOBcOp5e2QdCSU797GYjcTVsMY9zWKgaKHYmzxKQPXfMgu+Figo7wcJFF
         VEuAplV8yZf+J1yZ5VVwYZ0ez5XlV7fzQ8ojASIJMXqurhTRP9YfwHAhq1VxIuWlspZ4
         j3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761052605; x=1761657405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0jubacFDSdFcQnHYVbBIaUUxwO2V0rJTSsvBZVmUXc=;
        b=hflNo59lKv3pP2lco+iryXETDCk55+Yaz22jpgfi5JKScNwBvzqWINA7PmaYk5xc39
         AVpQhHZ779clsjxdDz4jwlf3GjNQc1mL+8/sabrww0cInzb6+5fxjPdN0Fj6R8czns1L
         pq2QF2Yn2zgTQk570moyfwwsSOdBGKese9m9aBGi7MkBYfLkuooHWjEh588N/LtyNPZl
         pySX9/dXdIhQqM2HlMaUYCfYy5H6YANkYXJHgHXIYi0DGngvKns0wlUUJyxHvImyPIPD
         UUBsKuanXkg2SxmZ0Ijg6yhO8qhqGCg8Kdjed55x/+vF1OFfS/NA+qMvQdRPF9YDsB/2
         sHKw==
X-Forwarded-Encrypted: i=1; AJvYcCVEUuWGAxnOCEKbPdc6Mi3rBtpx8zZbDWRr0PmgW2R0XxxvtIt5rc0wQFR5dh++7T24x670mtvkZEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmLGrJFgAqqaHmMds6fFPkHOf7FDHxZdZWDtRP0FlhtCjft2OE
	bD1BYTX/iPR8PkGauNk1PQqLgFjmyLSUGYVyRfrkR707xtCxrewz8nz5
X-Gm-Gg: ASbGncvcZ2pJVUl5OmgnU2IHjBjvwKWoClz0jMGHbCbwTAs6slOyiFvAXgy7oPMuNPe
	MdP5+6+GRam2svdDqc8XlAomXLmWuhEsi5eQtyOyW4Vp7NQUgA/TrFixk9os+0f//HaDUratbEv
	OehzsLFKhG7KSaavGAjjmcuizpRVdwBYbe5oWHqa8GPlylqvBjHKiOoFbI3EsbU90bUcgi1cJji
	HSHxx6rHmhCCKTTPLQPuXYmbiN+MQ01vE2YSHTE0eiB0ylDDJUhkz4lnyGucIVgDn/lDXrAvF5D
	nZDG/12dZZMR46Er75KTw58WtXxE9awZ+2oPEVV3Wc5W6KVYDCIAYPuJqBHcvgdZnqTKb6ZLhlP
	tLzAC+Cd6uUnQH2h4ePhAQeBjVevu2hvIMPoSKOtSBc31AB2qA4zP054ki+SwltrjFQHnZHIT1f
	TFjqPenDcCbjlSOathvsxQXH/MNDrvo3Wp3aMMTJ0C7o4=
X-Google-Smtp-Source: AGHT+IGLK2EmnFCqdftdxAKB6j+6Ma2jSdfUwKotGCFRUzw3RKdiF0RM9WMxavQ7l+6jXDABf8pL5A==
X-Received: by 2002:a17:907:3f25:b0:b30:ea06:af06 with SMTP id a640c23a62f3a-b647324404cmr1795728766b.24.1761052604632;
        Tue, 21 Oct 2025 06:16:44 -0700 (PDT)
Received: from [10.25.219.115] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8391523sm1069741966b.18.2025.10.21.06.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:16:44 -0700 (PDT)
Message-ID: <f1bbd303-2798-4476-921a-62b45fdb67ea@gmail.com>
Date: Tue, 21 Oct 2025 06:16:41 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-8-laurentiumihalcea111@gmail.com>
 <aPJZdAQwdoOP3cqN@lizhi-Precision-Tower-5810>
 <64b28a11-337a-42ba-8765-d94b19070d66@gmail.com>
 <aPZMJb9VwylTIiCM@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPZMJb9VwylTIiCM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/20/2025 7:50 AM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 07:29:28AM -0700, Laurentiu Mihalcea wrote:
>> On 10/17/2025 7:57 AM, Frank Li wrote:
>>> On Fri, Oct 17, 2025 at 04:20:24AM -0700, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Support i.MX8ULP's SIM LPAV by adding its reset map definition.
>>>>
>>>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  drivers/reset/reset-imx8mp-audiomix.c | 51 +++++++++++++++++++++++++++
>>>>  1 file changed, 51 insertions(+)
>>>>
>>>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>>>> index c370913107f5..b333d7c1442a 100644
>>>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>>>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>>>> @@ -3,6 +3,7 @@
>>>>   * Copyright 2024 NXP
>>>>   */
>>>>
>>>> +#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
>>>>  #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
>>>>
>>>>  #include <linux/auxiliary_bus.h>
>>>> @@ -17,6 +18,8 @@
>>>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>>>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
>>>>
>>>> +#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
>>>> +
>>>>  struct imx8mp_reset_map {
>>>>  	unsigned int offset;
>>>>  	unsigned int mask;
>>>> @@ -55,6 +58,50 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
>>>>  	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>>>>  };
>>>>
>>>> +static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
>>>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(25),
>>> Register defination still perfer use macro. If not, let me know.
>> I see no value in adding defines for the masks (see patch 4 commit message)
>>
>> in this particular scenario.
>>
>>
>> Is the assignment of the "mask" field for the "struct imx8mp_reset_map" item found
>>
>> at index  IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST not enough to deduce that the
>>
>> constant we're using is the mask for the DSP_DBG_RST bit?
> This bit is NOT software choose bit, which must be align hardware spec.
> Define macro help map name to spec and easy to look for spec by use macro.


yeah, we already have the DT binding macros for that which perfectly match the name

of the corresponding bit in the SYSCTRL0 register. I don't see how adding 6 more macros

with the SAME name as the DT binding macros and the "_MASK" suffix would help you in

this regard?


>
> There are over thousand result to seach bit 25.
>
> eventhough search SYSCTRL0, may have many SYSCTRL0 in RM.
>
> Frank
>>
>>> Frank
>>>> +		.shift = 25,
>>>> +		.active_low = false,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(16),
>>>> +		.shift = 16,
>>>> +		.active_low = false,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(13),
>>>> +		.shift = 13,
>>>> +		.active_low = false,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(5),
>>>> +		.shift = 5,
>>>> +		.active_low = true,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(4),
>>>> +		.shift = 4,
>>>> +		.active_low = true,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(3),
>>>> +		.shift = 3,
>>>> +		.active_low = true,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct imx8mp_reset_info imx8ulp_reset_info = {
>>>> +	.map = imx8ulp_reset_map,
>>>> +	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
>>>> +};
>>>> +
>>>>  struct imx8mp_audiomix_reset {
>>>>  	struct reset_controller_dev rcdev;
>>>>  	void __iomem *base;
>>>> @@ -183,6 +230,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>>>>  		.name = "clk_imx8mp_audiomix.reset",
>>>>  		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>>>>  	},
>>>> +	{
>>>> +		.name = "clk_imx8ulp_sim_lpav.reset",
>>>> +		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
>>>> +	},
>>>>  	{ }
>>>>  };
>>>>  MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>>>> --
>>>> 2.43.0
>>>>
