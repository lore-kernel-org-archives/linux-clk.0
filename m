Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7671B2ED872
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970576; cv=none; b=tPH8erox+LTtEdX1fZApMMqbeiK99DhKMEMpnZ60YWsEEmP94VxSPQ2NAvGQ6mpX43Kuoz0jEr7DrIpZkOu5Jov+VoLD1SJpr0x5WxbTlc107lkfgVqvW68hXhTxDhcvH1hvkG5BT9+IOsmov//vuV3VJI9oIvTgaGsGoicsrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970576; c=relaxed/simple;
	bh=X7IGd3KK52vsYXMhrM/sak5eUWBh9m0RLIV6Uoj15+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSilDAnJAQFtCBxenYLImpuYXi+iiW48GOwXLJKNnY4R3AQcY1ELxjKA78zpB0m0vs4mvkh2zSX0HOrvf+IPUrXWBHPxgdJRNQzwVMmhpzvi62i39y+zNoRDNLZVT4A56awAkeobYjruWLwj8/jtc8IQ95GgS0KY3uEvERny/uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgIhKfy4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgIhKfy4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3e9d633b78so110866366b.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760970573; x=1761575373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JR/OKSNOnF+l4tQRJr2FhhTssgUWExohKzJa6PLCZs=;
        b=KgIhKfy42b75V72wMvAz0SmIKxr0YxpNl+4X8ImLHv4zPHDmNKZlbfzV820EqrZbBf
         PJhinJslT8SSrauCRc6ic4A0ENA8sSujNRqThnY1UM5RDqB2zRwAs8Z3EwXyb6WInIor
         eAT+2+V/B7TaJ29iZP07re6jnS99bD2ziSPqKkE590WjrqujP7yMsaz6+YYQqwHQ5Z1l
         mpJr8EhS2TRZNAWXVAi6eWenqcN15yQQJfY6W8NmGjOxlcrV+HyFGvJ5KHytBKhlLD24
         PS1GiWRgh19f0oTSoBS7L7qJpgMWkowYEdXsV0IOLlOwtV6D+pjXm8MBHvBImzlAUHLc
         wRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970573; x=1761575373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JR/OKSNOnF+l4tQRJr2FhhTssgUWExohKzJa6PLCZs=;
        b=q5KBclJ/weoxeVLhp+jocoixU8OSqU2fjqdXjGGEg5xbED+A9D/iyjXz5TSus9Lhzd
         XlDqLj47EcYu2qOPhCoQZ87cKvCw/P2QTF7WNHa6GMSwbnm1uA/jwo5wNTjTJXHWlNQF
         Qz55VEBACVBNsYFciMN6rLRaPEHPba47kib76gtVlGcMa/2N/DmA2teQOD6DuoJrmmJ9
         D3NaeA/UT9wQMr7kfzJZQXj51zBOrpSAvU7lp0IltRbhgqOqFQR7dP6R2YiMnjF01fVv
         zTyHbYHCZUK9gh1oePIQ19EYoPP5iugbYDG7jpAhy4xvfkDoEZ5dHG/hfLYlJ0Lww/fx
         ajbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKgfNZanY7oQNsgKb7QFDOKny0mywnqTXa8DPXNY3BEkQQ4QOxDi9XWKEOVJf4WWNyn/Z8qHicYzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB1Ni2oJU3ol5jb5JsUUjy27mpyWJZTtLjopbtcm0VO5FODvDV
	seNStv3DD0msB86ad6xmyii94oNvwlAlRcf9IgrtuvgpE6CnVz+jeUHm
X-Gm-Gg: ASbGncsU3Lrmgjyp6pZKP7Sq3KtztBru0LC7e3QizfPrImDpYUKK4UI9InQS8Fvi44E
	a9lRiNsL7jVW+8KJAyUNjpMTIlmRPaYGEso/n5OOq4eI8Dy7RueX3B2vgADVpnri2uyLuNUN5Qr
	/0a/P2y7g6rE6eu3X54QaiYIjV76genS3kHgaFiE53gZKn9eIgUE4XOyWl3wR9zyBNh+uGGh+6J
	q0iKzgxJiFCSVXG8vHRY2fLQwj1kRfp95PQEy8z864QhULRS3ANIkrdob44w41DYtlJobgn02kW
	1HbN7b6yoEtumz6z8OtBpGrLCg/iQabkC4UdzLpEJkzbjDNrKeDxieq18udMw0FdSptyAR3VfjA
	h6AtQSBqdZD3y9bf0KmMqKqEjDqzC82FDY4Ccu0szCzdWTR6UdH7S204/PzT1NJuXT1So15yGgr
	/7a6h0WwFqveLWHyeoRPQMD5/sSv2qZwkg
X-Google-Smtp-Source: AGHT+IG/fdWt7ok35oOxO1wrbFMUAezRTf+f2uzPz94aKfhnEmWUajzGD6PhgGurEGjl/Gai/41dbw==
X-Received: by 2002:a17:906:7315:b0:b3c:9bee:eb95 with SMTP id a640c23a62f3a-b645c9cd378mr1808744466b.3.1760970572663;
        Mon, 20 Oct 2025 07:29:32 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8391523sm803404466b.18.2025.10.20.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:29:32 -0700 (PDT)
Message-ID: <64b28a11-337a-42ba-8765-d94b19070d66@gmail.com>
Date: Mon, 20 Oct 2025 07:29:28 -0700
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
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJZdAQwdoOP3cqN@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/17/2025 7:57 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:24AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Support i.MX8ULP's SIM LPAV by adding its reset map definition.
>>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 51 +++++++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index c370913107f5..b333d7c1442a 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -3,6 +3,7 @@
>>   * Copyright 2024 NXP
>>   */
>>
>> +#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
>>  #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
>>
>>  #include <linux/auxiliary_bus.h>
>> @@ -17,6 +18,8 @@
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
>>
>> +#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
>> +
>>  struct imx8mp_reset_map {
>>  	unsigned int offset;
>>  	unsigned int mask;
>> @@ -55,6 +58,50 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
>>  	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>>  };
>>
>> +static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(25),
> Register defination still perfer use macro. If not, let me know.

I see no value in adding defines for the masks (see patch 4 commit message)

in this particular scenario.


Is the assignment of the "mask" field for the "struct imx8mp_reset_map" item found

at index  IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST not enough to deduce that the

constant we're using is the mask for the DSP_DBG_RST bit?


>
> Frank
>> +		.shift = 25,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(16),
>> +		.shift = 16,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(13),
>> +		.shift = 13,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(5),
>> +		.shift = 5,
>> +		.active_low = true,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(4),
>> +		.shift = 4,
>> +		.active_low = true,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(3),
>> +		.shift = 3,
>> +		.active_low = true,
>> +	},
>> +};
>> +
>> +static const struct imx8mp_reset_info imx8ulp_reset_info = {
>> +	.map = imx8ulp_reset_map,
>> +	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
>> +};
>> +
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>>  	void __iomem *base;
>> @@ -183,6 +230,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>>  		.name = "clk_imx8mp_audiomix.reset",
>>  		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>>  	},
>> +	{
>> +		.name = "clk_imx8ulp_sim_lpav.reset",
>> +		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
>> +	},
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>> --
>> 2.43.0
>>
