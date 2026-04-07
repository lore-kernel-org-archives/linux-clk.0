Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B3E3921DC;
	Tue,  7 Apr 2026 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545606; cv=none; b=sqraIiG3/gfvKJz1jln6Y+/y8RqeU6/rIkza2EfZJ576rKmdAfrPlyqMdM7CWzkwW2rdyFTP8T3AFv2Vlp5RLkKkp3Mmgrs5VBFRkeLtZMAxUezFCYGBUboBUE/pp4q6wzYlISC5MA/+zC/uGaxJzbpMgsR3PDOUId/JgAhW1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545606; c=relaxed/simple;
	bh=w84JgY13B5psbJ/bCQLltCiZeluJ62uUoybI2BsB+oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4sXSR+POcdi80MzRDxPEwn6trYx5nxLUiuD3ZF7mJHFAkJ01/FuejUQU79OQk14n4jQdoKItLJW4WQNhdZ5Whb0ZNurftDuAzWr7/d4bTR+C3T0CHQl7E8QAl6RqSjDi1hSeyWT//PY2M53H5+MS3k4XrjBGFMZhLCnu5LzA6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bpc5j5BU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bpc5j5BU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48734C116C6;
	Tue,  7 Apr 2026 07:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545606;
	bh=w84JgY13B5psbJ/bCQLltCiZeluJ62uUoybI2BsB+oo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bpc5j5BU4G90M8I9KBBLn+o39rPFY6aozmJuYi+wsuFTWG/ELsK1i6vDqHivyIr46
	 N9wLkfpu/lJ47LKHQzH408q1EPINq+GUwEggrTAMuJTDb6gEGdOitPs/7sJEjpfoX0
	 VfLVXDdk1bsKBai4awpx8m4I6DCsqN+aclgpJcTOgEx+sC6NRWzDdTetCO9e/H6klT
	 7lfL7fbUlemkLT+KWdbrNw0mZ6AKWm6c6oC90vSK/1SWCd2IRexchkPu6n8oIqBYzw
	 5D8mc8nogt66lYinMeFK9CG/Uz/hWoPk8rYMRifSLjSOe6wzoOpJy0ZNg3EgD5PBrg
	 t3B0yLs1WDhtg==
Message-ID: <cca821a7-de9f-4377-9c0a-3f4170230d22@kernel.org>
Date: Tue, 7 Apr 2026 09:06:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/13] dt-bindings: hwinfo: Add starfive,jhb100-socinfo
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
 <20260403054945.467700-12-changhuang.liang@starfivetech.com>
 <20260405-strong-watchful-marmot-fdfad6@quoll>
 <ZQ4PR01MB12021DE82F5D893BBA15A659F25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ZQ4PR01MB12021DE82F5D893BBA15A659F25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/04/2026 08:49, Changhuang Liang wrote:
> Hi, Krzysztof
> 
> Thanks for the review.
> 
>> On Thu, Apr 02, 2026 at 10:49:43PM -0700, Changhuang Liang wrote:
>>> Add starfive,jhb100-socinfo for StarFive JHB100 SoC.
>>>
>>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>>> ---
>>>  .../hwinfo/starfive,jhb100-socinfo.yaml       | 36
>> +++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yam
>>> l
>>> b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yam
>>> l
>>> new file mode 100644
>>> index 000000000000..cc6b7d5a4c91
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo
>>> +++ .yaml
>>> @@ -0,0 +1,36 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id:
>>> +http://devicetree.org/schemas/hwinfo/starfive,jhb100-socinfo.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: StarFive JHB100 SoC platform chipid module
>>> +
>>> +maintainers:
>>> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
>>> +
>>> +description:
>>> +  StarFive JHB100 SoC platform chipid module is represented by
>>> +JHB100_PRODUCT_ID
>>> +  register which contains information about revision. This register
>>> +is located
>>> +  under the syscon.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: starfive,jhb100-socinfo
>>
>> No, not a separate device.
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    chipid@38 {
>>> +        compatible = "starfive,jhb100-socinfo";
>>> +        reg = <0x38 0x4>;
>>
>> One register is not a device. NAK.
> 
> I noticed that other platforms have similar practices:
> https://elixir.bootlin.com/linux/v7.0-rc7/source/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi#L205

Sure, how is that DTS and platform?

Why did you chosen exactly this one, known of poor quality and multiple
warnings, but did not choose something which is reviewed in detail and
passes all expectations?

> or could you provide me with alternative suggestions? Thank you very much.

Fold into the parent. See also writing bindings or DTS101 talk.

Best regards,
Krzysztof
