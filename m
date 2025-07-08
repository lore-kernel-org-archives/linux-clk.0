Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015AC3595C
	for <linux-clk@vger.kernel.org>; Tue,  8 Jul 2025 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969402; cv=none; b=mfEWTs3oyfD5awDsvKehKYg/FEOq7NQphzYPKQ2B2w62rJUluhUMPeQlm7aW9KfWZtcl2n7/NjrfI0xkvbX4H27Qt5qrxcKNf+WK3zoBdfByVthwMnzxFDobw9B/zTvrl6k9Oe72FuCbN71k72JQqCuLMEPLnNnKHECsQpHG/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969402; c=relaxed/simple;
	bh=47O6nAGkTl4F+LjVK4KzSkuF78FXCIFg8NWc0TWYEJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgIX48dZR0J5nLXgLtPgajOMC9PcU0t1GtN7EmXAm3ICacQDD0Yd+bMKcdq/5ln4gGAsq98pCVyVbizDlfPpqSc8gm9R5Gb+bp7d5ADgKz+BhTTo/1T9onrFgFR2QH6bqAUWa8nA1TDRH5S8ENi8yx1hwqyhja22rkYMsZCPGvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FpJd+aRR; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FpJd+aRR"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae3b336e936so773311366b.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751969398; x=1752574198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wW9jD4nttc2FFz4tK+x1u/l3hcsbPGY6bGVXePrYDv4=;
        b=FpJd+aRRb1it8uGgFDuY0XeugoGH9+Xt8YLCtgSGvAG9ttAdIiF6uTEQDfV2vJt7pF
         saS4jmFqJQgGfBAcYzMAuCSTyeJufjPSAKbukbKLwp0qRzoEfRZLDxXSCT67yvKKuZPe
         WyRiz67d4dZPVTXwIZBmqYRMJqhH82gCHwxRHywXE8tZEP3m6Aaq6Qm/ffcZSFJI4HOw
         IN9N5kR/UrRAwUhV+x2QQO2jo4bt4H88JL/nAETv+t59F9B8Wz3jd1W9w21UCZZkUtmO
         nlIj+NTkhLtlvVIup1M1bUoAQcFfQ/9CLcp2NgLe0nPXqUbuA9FLNxm6d+zS/dX7X6gF
         uL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969398; x=1752574198;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wW9jD4nttc2FFz4tK+x1u/l3hcsbPGY6bGVXePrYDv4=;
        b=vz0ELNL5N7idDmBFNipilKnPsxt/s25bTr17R0wnf7lJziHle2HwhAmFeg8FgsZN5r
         QENJU+ISemrCDYCZxmsRrfO2ghIOh06mP837AAOwUuMwDgmFz1on6vxzlYqN5yCgxSiI
         w0FSLJoXHGm2YIhqYGzAn4EDYI5iX89qse7EhcDsrkQJK+fLWvsidjZMLWo1tE9aITvF
         PsMs2VqeyKQ90EJcb+2XU8BXDeUSNvNu7UrQaHHn9JA7Ax0P2DFS7OsKR7FoPMxQrQ0+
         W3H/qz1ciOo02J0pi4s3IQcH+yLO4DLHz7umzK/UpM07weMUqOOplKfO5VlvxkkHCq75
         RVlA==
X-Forwarded-Encrypted: i=1; AJvYcCV/7DS8JmtnNbkJiyx2RgBRkZwDUIyr74n3zNwpy/9jBOcRgz5W4aK8IaBEvkp1oCdgQBCchLwdQsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWDpBdNwDVaXRuwWhUhL/cip3wt+MByDlRf4kcVD6wtZXuqAgK
	Huxktk6McpuOdyIqzRyZBQlF75AyXsG1nZv2fxaepBZlGnGdrWsZCGAbQbrY5rcOJl4=
X-Gm-Gg: ASbGncsumcGAwQOc2VqF2hZ3RBgTGM8xIivjQ6tkWi5untTzZTtenys4iLfkHmAPwIN
	zT2SsXXHOhEvVnZQnDqA+wYk2ug/M7VckNJbmiXdk1Ufp/7dvrEYeSRhoLFRCxFsN7eAuPyiX5j
	ub24/wC3dlr7zlViWYoF0I7ZEzm6PdHWZTpHZ5bqWpws6r+3fyvIokUtX5LG42b07E7J8EWnVrs
	hsR8BOGUyIbL7egqOIHsw0L8R/z5+IspgphbIaqIrhxetVMLe5dXrDSXSGwOsQYIudSfJsYwbU/
	kZI/pZ7rAh2sr/8kgZYhWzxsLZqXrxpkBmDmYSsJXu4S+zUxBEIrQNIaPrbCXXkiNiQ0UA==
X-Google-Smtp-Source: AGHT+IFDhnpFLf+9SokY6ajJmYa0R4eHOoHCTd+GxI/yEq5DE0Ci4xD7oIth8WUim7upiSOwhgaH5Q==
X-Received: by 2002:a17:907:1c26:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-ae3fe5c28d7mr1545563166b.22.1751969397715;
        Tue, 08 Jul 2025 03:09:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d931csm875767566b.10.2025.07.08.03.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:09:57 -0700 (PDT)
Message-ID: <7c8c7a25-c373-452a-9fe8-8b2d92ddd885@tuxon.dev>
Date: Tue, 8 Jul 2025 13:09:55 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "lizhi.hou@amd.com" <lizhi.hou@amd.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 07.07.2025 11:18, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 04 July 2025 17:14
>> Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The first 128MB of memory is reserved on this board for secure area.
>> Update the PCIe dma-ranges property to reflect this.
> 
> I see R-Car PCIe dma-ranges[1] and [2] maps all possible DDR area supported by the SoC?
> Do we need to make board specific as well there?

I'm not familiar with R-Car, but if there are ranges reserved for other
purposes, I think we should reflect it in board specific device trees.

But that would have to be address though a different series as it has
nothing to do with enabling the RZ/G3S PCIe support.

Thank you,
Claudiu

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r8a774e1.dtsi?h=next-20250704#n2487
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/salvator-common.dtsi?h=next-20250704
> 
> Cheers,
> Biju
> 
>>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none, this patch is new
>>
>>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-
>> smarc-som.dtsi
>> index 39845faec894..1b03820a6f02 100644
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> @@ -214,6 +214,11 @@ &sdhi2 {
>>  };
>>  #endif
>>
>> +&pcie {
>> +	/* First 128MB is reserved for secure area. */
>> +	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>; };
>> +
>>  &pinctrl {
>>  #if SW_CONFIG3 == SW_ON
>>  	eth0-phy-irq-hog {
>> --
>> 2.43.0
>>
> 

