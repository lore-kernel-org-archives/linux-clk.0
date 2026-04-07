Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169051FF7C7;
	Tue,  7 Apr 2026 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775547450; cv=none; b=iDHcSGTiu26B2mudofOLMRIpS7eVIQRYgT7AilQWQvPSuWbdU9Gg+puzqcM2rYLFPtrYhqO3XIL+Wx6tjQOwo0+qVMjQqls8vUyELkJIVRQF8Yg3lX58UElfpEP5NTjg+L4EFdD5naHquElWbz2dHvjbrQCpMF+ZJf6NKPTImOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775547450; c=relaxed/simple;
	bh=BFFsI3LeN7f2LzSaom7luMGiKHZgnhrFdc4/ppxffj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUhjCWncWmu6vkpCyGCpwnLWnufq8CivlPC1AikQB1/6fQJ8X4WXs829p9fP36s6VIYM2wBO4cj1eKuHWEcmInbCsQxI2YcLZlvL5pqszVhzxoFphs4ApGZr1QgZ4gSAKWpWNt0VV5nSDC8IecvYNQYy7SZPpZTTbbKSP91TfYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdS4v3Kx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdS4v3Kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BECC116C6;
	Tue,  7 Apr 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775547449;
	bh=BFFsI3LeN7f2LzSaom7luMGiKHZgnhrFdc4/ppxffj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fdS4v3Kx90ZiW1zfPnNzjMVvSi2ExUDPHP4ccdjpazBkUmlr3Luso1vA0xZDeqGGL
	 VwIj2PC+2MPQeJs2aaxAcrk12QcFE+Fh/i0hNE6MrQHrIyobd0vbcU6batS1/dccI/
	 UrULAUUVd61OZr9svWmE4R3lYxcnF32EUUnaXRiYlxuOV+aqe2YZEtScKWD4kcnZ8F
	 aJZscF0dJqH8mSyipLMrWNKkTFN1VsQUleM1Prk1ZeAoyKZ2AEpYV/TR9hOZ46Mkv6
	 7+ENnniFLo7LifiM52eEv2Hl4f97OgkFoQjmEomNX1hP385tKdtTEfiSY5Zs4/7pvI
	 i48vzIc5INIPw==
Message-ID: <db8e3d41-bd17-424c-8b04-7b51a0726420@kernel.org>
Date: Tue, 7 Apr 2026 09:37:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/13] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-2-changhuang.liang@starfivetech.com>
 <20260405-nocturnal-mighty-pegasus-eff399@quoll>
 <ZQ4PR01MB1202F9AC0B854D3341EB2CAFF25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ZQ4PR01MB1202F9AC0B854D3341EB2CAFF25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2026 09:34, Changhuang Liang wrote:
> Hi, Krzysztof
> 
> Thanks for the review.
> 
>> On Thu, Apr 02, 2026 at 10:49:33PM -0700, Changhuang Liang wrote:
>>> Add documentation to describe StarFive JHB100 SoC System Controller
>>> Registers.
>>>
>>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>>> ---
>>>  .../soc/starfive/starfive,jhb100-syscon.yaml  | 140
>> ++++++++++++++++++
>>>  MAINTAINERS                                   |   5 +
>>>  2 files changed, 145 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.
>>> yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-sysco
>>> n.yaml
>>> b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-sysco
>>> n.yaml
>>> new file mode 100644
>>> index 000000000000..c0e1f6f68fa2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-s
>>> +++ yscon.yaml
>>> @@ -0,0 +1,140 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id:
>>> +http://devicetree.org/schemas/soc/starfive/starfive,jhb100-syscon.yam
>>> +l#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: StarFive JHB100 SoC system controller
>>> +
>>> +maintainers:
>>> +  - Kevin Xie <kevin.xie@starfivetech.com>
>>> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
>>> +
>>> +description:
>>> +  The StarFive JHB100 SoC system controller provides register
>>> +information such
>>> +  as offset, mask and shift to configure related modules such as PLL and
>> PCIe.
>>
>> How a MMIO based device can provide a MMIO information? What exactly
>> does it provide? Register where the value is the offset of other register?
> 
> For example:
> in per1 syscon:
> offset 0x4 is the register configuration for implementing eMMC extended functions, 
> and offsets 0x40–0x4c are used for PLL7 register configuration.
> 
> In sys0 syscon:
> offsets 0x0–0x2c are used for register configuration of PLL2 to PLL5, 
> and offset 0x38 is used for register configuration to provide the product ID.

That's not what the text said. You wrote the device, in MMIO registers,
provides information: offset, mask and shift.


Best regards,
Krzysztof
