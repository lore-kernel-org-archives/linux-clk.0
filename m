Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B952749E7
	for <linux-clk@vger.kernel.org>; Fri,  8 Aug 2025 11:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652420; cv=none; b=IIFdg5P8CRRMk3V6MWH2PMQCGXnbH9jisuPmVt3OYxd2z1IXn3XOvTv5LH9fNGftC5DhdWZy9MZWLfAvsZ1FH3jFU4YwVadNTTkMlS3QQnUS9eCKCVrOzlSsWO1LklOIf1o7+nCmyfTYmL/ztG1CEWonHVO3jM60/7r7ee++G5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652420; c=relaxed/simple;
	bh=PHwIx/DdNtH6flF1xerQiN6Sk7tIPcKXZKHuKQM8yJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5QdgbLwrRxd+XqqhN0/mK3XmRPqF1GQlRGqwH/hqRLLAvD1Cur7zhRf5lI+Rrfs0cz5CLzCY+e6Y7UWghXkhSPF5m/iUsTIJpFNost41zwcB3G1g8kRJWm8VcS3SINLaUiet6OiPg/UOeKKEwQfvTETB23c3T2lBDUEjGseB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fzDoCjIX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fzDoCjIX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b7825e2775so1829005f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Aug 2025 04:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754652417; x=1755257217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQD9ZN86fbnOv3Py6c0GNoRIiGV/UrKy3H7tuotUIpg=;
        b=fzDoCjIXV/4UdeKdFmlmaB8G5G/Uylcj6tY5c+8e35wa4iRkq9rFY322hzLktQ54MO
         j4oj09k+WhbZS9heeaEyGeZDQUcld/H6lPCq23fM55va8rAYIfPfrTogT0rgK3r/cpAt
         gRpUaNCh7AB5V7YLRPpjQJ3c4feS2vX8dAeLHF/Y9NG3GkZOHSowU/VsBtSeCRSgYwqL
         LDPbS7SeMmf87H/OE8gKlBWW7NWqto+/Kl2Wd5Wx+D1MMm/S/jF+9eKikQFleuwQK5Tb
         gVrhy7Ib+9pXkWvnbNTd2yYLy3y3sOnG+JU/wQInTlJ6aF5fUv8EGqKgFph4iQVpm9H2
         7sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652417; x=1755257217;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQD9ZN86fbnOv3Py6c0GNoRIiGV/UrKy3H7tuotUIpg=;
        b=XB/Pzf66JgcqTozU2uDRxX5NSiUNrfN2g2g13i+J4II0gmTD7w+jQ0qrO0qmgOvtda
         TGsNvkjhnnOnVW2phmVSyc9XjYKvQY900PnllCtRHrxYwPvwHyC/RHMzFOnWgsHAOZLG
         YwAcKkVSZ2oRZM+KT3re0R9pJtAufNgzq0WdSJg3goK0x28fV5M/iq+P7Gfy/ZPutSq1
         4KwzCMzXTOUCHKAwEjuDfe4iuLO1wo7GTHCmzWXXWUZN1yKcTIpeRHWxEl+3G+tp6RYO
         neMQywSSBQbPSXHLUU7V2sPuTyPcDh3BeyGj8oip2HnzJRklHfioQNazLWdnYmQM4rTm
         X8Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUN6oFRubW7zbihUZtUKncFVY6l+A8c8s+OE57mO7gLgarKhLQhUzjkgkzgcrbM4CKpxA6rno4aon8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYfXlutBQtSlDewSe1AcySwh2qijuARCe4oNFfBfsBNE0DKto
	WQbBV0wezDkWRcwD7rFWUZYvjMc3RtUx7oKCQXtH99B4UcfVit0wZpuTY2GUXvuRAq0=
X-Gm-Gg: ASbGncuVkOwfDjSQKg9rQlBfq3OO4L5CO7EphWxENTMG51qKpoqaff8IS7lXqrZq9eR
	cnmN3Cr05047U6GWmyi0M8Y9FSgRWOli2NAraqU1LujG7K9sj/8noO7x3DJQuKGEw+k+E0TzVTo
	euZzg2LxIUQP6uCVerfF8v/qrZ8NSXMIQnkV0q9BVXTaHsAphSf/K3Nz/zBwhvtOWGA3Y5xNhaR
	FJz6wSbKvPV17L7FwS46yR1McRDl/s/ocNMwdXN4U1p4jrVUFncAIz3My3aOlRF36CdNgxo/Ejd
	oMSiErgiO2tJPy9IINO5DRcDW05tirTmgP3rfAxDC0aNKwetNIV4do3qpQ74EyjlDYxx179hzdx
	N9QSYvUQsw2ksVrlTKzoPZS8YbeKyodw=
X-Google-Smtp-Source: AGHT+IGrw6qJfbOAqNVKVNHju607OPKnyRwv/T0hcF1UsbBaa/pvlDY7WeC0PqYLDYFHFXx38VFdTg==
X-Received: by 2002:a05:6000:26c9:b0:3b7:89c2:464b with SMTP id ffacd0b85a97d-3b900b4496bmr2232459f8f.5.1754652416806;
        Fri, 08 Aug 2025 04:26:56 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm31150895f8f.70.2025.08.08.04.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:26:56 -0700 (PDT)
Message-ID: <0addc570-a3c6-4d7e-9cbd-06eedd2447bb@tuxon.dev>
Date: Fri, 8 Aug 2025 14:26:54 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250709132449.GA2193594@bhelgaas>
 <2e0d815a-774a-4e31-92f1-71e0772294c7@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <2e0d815a-774a-4e31-92f1-71e0772294c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, all,

Apologies for the late reply.


On 09.07.2025 16:43, Krzysztof Kozlowski wrote:
> On 09/07/2025 15:24, Bjorn Helgaas wrote:
>> On Wed, Jul 09, 2025 at 08:47:05AM +0200, Krzysztof Kozlowski wrote:
>>> On 08/07/2025 18:34, Bjorn Helgaas wrote:
>>>> On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>>>>> Base Specification 4.0. It is designed for root complex applications and
>>>>> features a single-lane (x1) implementation. Add documentation for it.
>>>>
>>>>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>>>>
>>>> The "r9a08g045s33" in the filename seems oddly specific.  Does it
>>>> leave room for descendants of the current chip that will inevitably be
>>>> added in the future?  Most bindings are named with a fairly generic
>>>> family name, e.g., "fsl,layerscape", "hisilicon,kirin", "intel,
>>>> keembay", "samsung,exynos", etc.
>>>>
>>>
>>> Bindings should be named by compatible, not in a generic way, so name is
>>> correct. It can always grow with new compatibles even if name matches
>>> old one, it's not a problem.
>>
>> Ok, thanks!
>>
>> I guess that means I'm casting shade on the "r9a08g045s33" compatible.
>> I suppose it means something to somebody.
> 
> Well, I hope it matches the name of the SoC, from which the compatible
> should come :)

The r9a08g45s33 is the part number of a device from the RZ/G3S group. This
particular device from RZ/G3S group supports PCIe.

In the RZ/G3S group there are more SoC variants (each with its own part
number). Not all support PCIe. To differentiate b/w PCIe and non-PCIe
variants it has been chosen to use the full part number here.

The available RZ/G3S part numbers are listed in Table 1.1 Product Lineup at [1]

(The following steps should be followed to access the manual:
1/ Click the "User Manual" button
2/ Click "Confirm"; this will start downloading an archive
3/ Open the downloaded archive
4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
5/ Open the file r01uh1014ej*-rzg3s.pdf)

We use a similar compatible scheme in other drivers.

Geert, I may be wrong. Please correct me otherwise, as I don't have the
full picture of this.

Maybe, the other variant would be to use "renesas,rzg3s-pcie", or maybe a
more generic one "renesas,rz-pcie" (though I think this last one is too
generic).

Geert, please let us know if you have some suggestions here with regards to
the compatible. The IP on RZ/G3S is compatible also with the one in RZ/V2H,
RZ/G3E.

Thank you,
Claudiu

[1]
https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12

> 
> Best regards,
> Krzysztof

