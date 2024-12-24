Received: from mail-m121150.qiye.163.com (mail-m121150.qiye.163.com [115.236.121.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3290986250;
	Tue, 24 Dec 2024 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.121.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735031512; cv=none; b=RtaVHAgoAX8/BGCKZsmltlN6CA6/agc7TVA/H2OVgsWaMAiPMvGMPSTsu8jyguR8lzgIMnii6ZCPnTJca6VGHTBe9a4oAYsMX0smQh+NdSY7L9dPiuGstG45LwLB27mH+5AsI5kg8efGXMy1f6dRQuZ+WdVeMYnlLEc38j9/+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735031512; c=relaxed/simple;
	bh=63SIagATQ1gYYwEjwMbPv4smVM4SNhW6zJRftR1vPLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ilmtn+ohVQv5L654RzE0q016x3acaIwsbQ24invpkH+oCUkvOcBnGJKlQ7Dmd5vQHaGUFdM4Iy1U0BV9IbMQAkR20Pi6cwvvHmYVEcHxev4wDz+4EWe9q1vwzhutvM0Z41yohD1vwS/3hThw/Wv+u781sP4SICdf5JbQ4U9RZSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=BDoLd2np; arc=none smtp.client-ip=115.236.121.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="BDoLd2np"
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6a83f662;
	Tue, 24 Dec 2024 16:36:12 +0800 (GMT+08:00)
Message-ID: <e75b38b4-605f-4f9e-8c95-204877b9bf84@rock-chips.com>
Date: Tue, 24 Dec 2024 16:36:11 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/38] dt-bindings: clock: add rk3562 cru bindings
To: Conor Dooley <conor@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-2-kever.yang@rock-chips.com>
 <20241222-grandpa-vessel-66e9ca9cde75@spud>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20241222-grandpa-vessel-66e9ca9cde75@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhITlZIGh1JQ0tLGh9CGE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	JVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f7cf356603afkunm6a83f662
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OEk6Txw5HjILCEtDQiJNS0oC
	CDwaCgFVSlVKTEhOS0lCSExIQkhKVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ09ONwY+
DKIM-Signature:a=rsa-sha256;
	b=BDoLd2npj0n6Om1OH5DJXSsVpoK+ms+L4VEFsKWa6Q0BUz0mLywgGE0K0gSQ1wUl+kIAVw6MhuIoiApVIqXDgVQhOx+++sWjEqjmkDWYpFpvd6MKN9JfoWOjlFO0Sd9OelNfkNzAb+tQPJ4C7mAajNDAC8Ru9FqNGdq8lAKktAk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=YBxLONAc2YXY1BIJF//FZvX1aM+Sn/tfGnBkN7/bO1Q=;
	h=date:mime-version:subject:message-id:from;

Hi Conor,

On 2024/12/22 22:51, Conor Dooley wrote:
> On Fri, Dec 20, 2024 at 06:37:47PM +0800, Kever Yang wrote:
>> Document the device tree bindings of the rockchip rk3562 SoC
>> clock and reset unit.
>>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> ---
>>
>>   .../bindings/clock/rockchip,rk3562-cru.yaml   | 62 +++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
>> new file mode 100644
>> index 000000000000..aa8dedf2bfce
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/rockchip,rk3562-cru.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip rk3562 Clock and Reset Control Module
>> +
>> +maintainers:
>> +  - Elaine Zhang <zhangqing@rock-chips.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +description:
>> +  The RK3562 clock controller generates the clock and also implements a reset
>> +  controller for SoC peripherals. For example it provides SCLK_UART2 and
>> +  PCLK_UART2, as well as SRST_P_UART2 and SRST_S_UART2 for the second UART
>> +  module.
>> +
>> +properties:
>> +  compatible:
>> +    const: rockchip,rk3562-cru
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  "#reset-cells":
>> +    const: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xin24m
>> +      - const: xin32k
>> +
>> +  rockchip,grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the syscon managing the "general register files" (GRF),
>> +      if missing pll rates are not changeable, due to the missing pll
>> +      lock status.
> Two questions:
> - Why would it ever be missing? Seems like you should make it required.

This may not need for some of SoC, for the rk3562, we don't need it, I 
will remove it.


Thanks,
- Kever
> - Why is it not possible to look the grf up by compatible rather than
>    phandle?
>
> Cheers,
> Conor.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#clock-cells"
>> +  - "#reset-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clock-controller@ff100000 {
>> +      compatible = "rockchip,rk3562-cru";
>> +      reg = <0xff100000 0x40000>;
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +    };
>> -- 
>> 2.25.1
>>
>>
