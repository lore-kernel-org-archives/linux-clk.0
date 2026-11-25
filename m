Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638811;
	b=Qs8BPsUNdgGf1AgKJAHbcoLiDJOZl/DAY84jcQ6ayE46CZE0abnvRSF1E4SeAiqJV9pX
	 jrpLheDahA/tF7pTDtXm32M+llqOre8teYA+JEnDUj0RZ1KVX5OwGFF4nL+GKSn+Me/Fi
	 dN+T3n2JEwvVk6SVnYGTU6OCl8ACjX2jaZkRuW4GQFxYlu07sYvm7sAT5oaWi0Hz/psRh
	 CCiXIdMP0UluCH7/vcOQ0LYO7xKesl4KcGs+c8U/anmEjGqnum3cFIpWBIMYjjgKf3D/d
	 j5DdytfpUClmubuSfZyu/12/SFuWb+a/rgskKa/zOaha4uDVtuzBwmJWHLl4y8pNXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=p7VQPtUNRM/ow8fyeOLLOBoYjPKsKPj8Yjd/CKESr7s=;
	b=1+U5dFy1ic8ieJRiMDHeEvfBoIcAU547b7vrf0wvpukdfw3EyU8a2Eng55y/iw3fsFU7
	 HU4kZsuyl9djtLVGaOJzYdRfS4eD7gTt0RBbc5F8kO+InBPIm/9SIfFHB02At53YtbWrT
	 x+/Pgo3ImvuFn0wh+xNuHYT6wCBKfdfzoPjwjIjMXyCHTWHC7BDNZbbbaMbbWw7wC7TLG
	 62DT/3bWsgpkHpTbZARvHyd3tYUJaHgVhjdIW+YALlPGrRMq1zph746QmrZnKWI4CUQLA
	 HFvdNYedZRp3DjmlbT7GXVRtXOIYYq1uADTJyEv6pASz1gH7WG/it7bgo9YirjUB72Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=KRE1YBli;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CBF606A326
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CBF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=KRE1YBli
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-86288992de5so4644434a34.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638809; x=1796243609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7VQPtUNRM/ow8fyeOLLOBoYjPKsKPj8Yjd/CKESr7s=;
        b=KRE1YBlikOL5/meEMp27DhiYqWuo428gJSlGz4fP/B0FFv3joA/ilc8mHdFk2DXtI3
         fKM9f+1z9NBeYMHGEk6RO+YPMQpPHkfriXIMolNBGM6UyoKSkw0/g1AnDEJL+wAzIWkE
         WLFc1VEzL6Imut0yK8ULesUcGvHa6Odm9L1joccbAc6RFNd1ZGt461nbZyxTc4KWTH7a
         Lyr4BPTYIH+MLrAx3ABdQbQlHvIRho53gPuN0ShDiBVhNIuZVV4Q0Th0LoQ/wAdGNf3P
         B8yemud+Vs8p5+7xNCjoM6ULtp4afDSzRd6/3qjVr81dhECwVYPDKftCF1VM15mti8VL
         iMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638809; x=1796243609;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7VQPtUNRM/ow8fyeOLLOBoYjPKsKPj8Yjd/CKESr7s=;
        b=L2jGMb9XapNX5xo4opnd6mOgDC+ubReJCD0wqHWW1l3uY2mdi1F959eVYHLFkIVJkb
         6CZAzDcnO4qgfvg4aSfYKmXLXR4tfvEEL5NVqQoUf73dSSDyELFeS/lfah5nJFqdNq6o
         dQ+1Qp2hjQ8AW1YA4eD/Yp5tVQ3hn8vawjP0plMAOVpBoAJXLHxapURiRYZW41jcBIvN
         a5cl02Zr1LLEi/zKVzjFOMf8v8K0O8DO61jmsZo63aH+MStj2OmXNI6OWfj27KXwyznm
         Yfv3bI+N3Dm+nK+L+LrAHmaNY6hs7Tup//BrADtC83eIU9P5zf/ryP86388/GNZc6D9c
         o9DA==
X-Forwarded-Encrypted: i=1; AL+hErEmbz06GH7DjE199saUWk8Sr3ZM0SPujZwuONGYvXuDOlopMcQbyauh7XjGVPHzvLLZ+/grMbq7+Lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XikMXzDMjjI/K5uEWiaQxsN8wVu1h/XPtJRXUFA+ITG8nY8xV
	RkeOVaIiMF/P5Je0fsYwhYiFznN4sLhUMJ8GoafdhPIohhcS1dLc1VSrPfLmrTSscn8=
X-Gm-Gg: AZFdTZd6VJLRdqBToPOegeihx4CKCoZf4ZW74HN7oWgakl2G7/4s94C2avfy/X8e4PU
	2WMgmOFoxv46BdqAgQoIyFFdnazLf5QdRcM+tBN36qk8QMPILPl4WQL4uxrVKT265rOOseTqMcP
	cl9FxNNQSQtIvOt4MyTG9LKDqH+VuA/zeXH+LYDDRuJUJO8R12IOb4UCxV2Y3jOeBhIxlOHOIgp
	v+jJtNj1NBW4xcTrKFFmvVes3HtAK842eU56NcvUVRflGi/+FofRiYp6UmVWBhyIDfDpbhy6dol
	40mba+9N4cL4yJVgZThQhwvvRxY7iA4unTpboXDzLu71dY4InjA/31rMhUKHZFXAXie9SZOx3T+
	eTHkyiwUj745alNNh2hgQO21UphUlL1ylCgy69m2d1LJlJBp9SMgKsobMkWAhXRPT/mz1c8SGiH
	FJiOVtUJG7/xi7olt4FaMAF07NnELclCL06J6vAm8ozqkihMnCr6/oCQAX/aYeO+sXY8S9vRWPf
	iPN5ydiWZfpQyu+KosSb5HVSmIV4ep0odRo9xrX70+kul7Kc9onUXgAOTbG2FF2YruQaCpzweiy
	07aenV4Ae8zQ0C3q1MjO98vZcWccCanb
X-Received: by 2002:a05:6830:4107:b0:862:a205:e1cb with SMTP id 46e09a7af769-8630920a762mr17392310a34.17.1795638809214;
        Wed, 25 Nov 2026 12:33:29 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f784fsm13861425a34.16.2026.11.25.12.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:33:28 -0800 (PST)
Message-ID: <f255b01e-ae16-407b-8cab-1af030059e7a@riscstar.com>
Date: Wed, 25 Nov 2026 14:33:27 -0600
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
Subject: Re: [PATCH v3 0/3] clk: tc9564: introduce a clock and reset driver
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
 abelvesa@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 2:21 PM, Alex Elder wrote:
> This series introduces a devicetree binding and single driver to support
> the clock and reset components present within the Toshiba TC9564 chip.
> 
> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
> It includes a PCIe switch with three downstream ports.  To one of
> these ports an embedded PCIe endpoint is attached, and that implements
> two PCI functions.  BAR 4 for both PCI functions provides access to
> registers controlling blocks within the SoC, including the clock and
> reset controllers supported by this series.
> 
> The first version of this series included a system controller, which
> has since been removed.  This version addresses all review feedback
> received on version 2.
> 
> 					-Alex

As I provided last time, a copy of a working DTS file that uses this
binding and driver is available here:

   https://github.com/riscstar/linux/tree/tc9564-dts

Isolated in this commit:
  
https://github.com/riscstar/linux/commit/e1f8e40b04137798ffd410fc675d9eccfb1c13f9

					-Alex

> 
> Version 2 is available here:
>    https://lore.kernel.org/all/20261120183212.1264522-1-elder@riscstar.com/
> 
> Between version 2 and version 3:
>    - Added Lorenzo's Reviewed-by on the devicetree binding patch
>    - The devicetree binding now uses @kernel.org e-mail addresses
>      for Daniel and me
>    - Cleaned up the patch header text in patch 2
>    - The Kconfig option now depends on RESET_CONTROLLER
>    - The Kconfig option can now be enabled if COMPILE_TEST is enabled
>    - The generic gate clock controller code is now used rather than
>      implementing a custom one
>    - Only the gate clock IDs are now published in "toshiba,tc9564.h";
>      the PLL and internal fixed clocks are implemented and accessed
>      only within "clk-tc9564.c"
>    - The PLL is initialialized, followed by all fixed rate clocks,
>      followed by the gate clocks, to ensure each clock's parent is
>      initialized before the clock is
>    - Updating the reset registers (read/modify/write) is now protected
>      by a spinlock
>    - There are no more "unnecessary newlines" in the initialization
>      arrays for clocks and resets
>    - An update to the DTS file is now included as the last patch in
>      this series
> 
> The version prior to v2 of this code was included in this series:
>    https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/
> 
> Between that series (v1) and this one (v2):
>    - There is no more syscon, so its devicetree binding and driver have
>      been dropped
>    - The clock and reset components now have a single devicetree binding
>    - We no longer use a syscon-generated regmap for accessing the common
>      range of memory used by multiple drivers; specific sub-ranges are
>      instead mapped
>    - The clock and reset drivers have been combined into a single driver
>      located under drivers/clk
>    - The config option for the driver includes COMPILE_TEST, as requested
>      (last month) by Jerome Brunet
>    - The help text for the config option is simplified, first suggested
>      by Philipp Zabel
>    - The driver now names clocks using dev_name() rather than trying to
>      hand-code a unique name into a fixed-size name array (also suggested
>      by Jerome)
>    - Certain functions now always return 0, which simplifies callers
>      so they can simply return what the called function returns
>    - As suggested by sashiko, a counted-by field in a flex array is now
>      assigned explicitly
> 
> Alex Elder (3):
>    dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
>    clk: toshiba: introduce a TC9564 clock/reset driver
>    arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
> 
>   .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
>   MAINTAINERS                                   |   9 +
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  15 +
>   drivers/clk/Kconfig                           |   9 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-tc9564.c                      | 456 ++++++++++++++++++
>   include/dt-bindings/clock/toshiba,tc9564.h    |  40 ++
>   7 files changed, 603 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>   create mode 100644 drivers/clk/clk-tc9564.c
>   create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
> 
> 
> base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7

