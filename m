Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474093;
	b=4PBBkP+A42ndeDaQfM8+Pt9PqToeVKdrrLE6VeK4WKfokYy+nv2k3SNP3gZQC7nYz7bn
	 Eizwl4DgStbkx/HQDbmsn0p3Rv31iIKUPIb8WUHmR1ErEMPRUu2CIU8qGzR+qOnTO7PTc
	 XmSuw/YmI3o8dU5ISkysauLytSqVLoSd7dn7te97jjJLU8tPEXgIp6l/eMv1h19HCe4UB
	 CDax4EoatrMic5oc+e751yvzdNG4LGRsbJxv0ibOswssS7Q/BxkaNcjmwoOfw/a+SLksE
	 mwi/zPvG51PkXY5tgjoNhXqELC+j4f2yIOpdTQ4kBv43AmldSoWR31YrBrLa9pnv6Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474093;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=UU03pdQXvnZhnp48bfMOqGxzcN0ycFpUm4aKAjaRGoU=;
	b=0t2XyAXDOTBRWEJ9vLi4Y3DPYj8Si/icWCiykkpLSAwxH1Q1SfnDq3OJWRpCVXDitU0i
	 +lBM1y3oa/r1zywWzPhzytCJ7TzQICmUguxaBC5TW0SaTub20ycCTbOM/JGoZ+sAc7bg8
	 Mvukg8lsmRF5CZEtgy+dqlTYi5u4wXJRGjg36+WjaYzATrz+qE60O901VXTaKTkAhiXCF
	 zY/bglsf5Mph7UDBYEUlSf6juVk7Q2aCxkXQahq4HrFe4hNW+P1opm4pzfc6RkxN0mXCQ
	 lowGTN9sq9seF2XMehdyJUXD3wBm/5/N4MxJccGnALLmMV/0aFIu2Vq1YI6/dv+B/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+QlnDLN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF173606A327;
	Thu, 12 Nov 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+QlnDLN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F165E1F00A0D;
	Thu, 12 Nov 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474093;
	bh=UU03pdQXvnZhnp48bfMOqGxzcN0ycFpUm4aKAjaRGoU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A+QlnDLN4dqpSwg7GeMb7nW0Xx0z9WIMvCnlPG8lRaZJSW5f56yU7Qer41MbaOXtc
	 sztGXvox+GkmXBvRml4izMX+ncvN5+z36z4179Urvn2nFNl/LPe5Bq6puWEX6mZ8N4
	 +a5JxJinzw1yrxncWvdyYgHG5rg4rFAOrysxFNDOuhlLAgEoNY+D4HwPORfDb4V0BU
	 +jb1Pl4TF+U4atES3OZ/YvEa4G25d5yjJ8uRZi0SJRrSc5sw29Mx1KdM9cWJluyij4
	 L5TArHVaN4gaeINIVp7ROwmBmsJGVFXBv7b6XjWt26tO1rUugEfJtPYHDiWr0kk5NR
	 4oIXjvjoASsFA==
Message-ID: <6a897be9-8732-41c7-890b-ac943fe106e6@kernel.org>
Date: Thu, 12 Nov 2026 10:01:22 +0100
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
Subject: Re: [PATCH 0/4] soc: toshiba: tc9564: config system controller
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
 <675dec20-1cd7-4d37-89b4-23237b760f33@riscstar.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <675dec20-1cd7-4d37-89b4-23237b760f33@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2026 18:42, Alex Elder wrote:
> On 11/5/26 2:26 PM, Krzysztof Kozlowski wrote:
>> On 04/11/2026 01:43, Alex Elder wrote:
>>> This series is comprised of some code that was previously sent
>>> separately.  It now incorporates a new system controller driver
>>> that advertises clock and reset functionality, as well as regmap
>>> access to its address range.  This combination is being treated
>>> as a new series.  (Details of previous versions are below.)
>>>
>>> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
>>> It includes a PCIe switch with three downstream ports.  To one of
>>> these ports an embedded PCIe endpoint is attached, and that implements
>>> two PCI functions.  BAR 4 for both PCI functions provides access to
>>> registers controlling blocks within the SoC.
>>>
>>> The system controller driver adds the clock and reset devices
>>> using the mfd_add_devices() interface.  The clocks and resets
>>> are implemented by drivers included in this series.
>>
>> Toshiba TC9564 bindings and DTS should be posted completely. We spent
>> great amount of time on discussing already and I pointed more than once
>> that big picture is missing.
> 
> https://github.com/riscstar/linux/blob/tc9564-dts/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> 
> Node pcie@3,0 is the third switch port (within the TC9564), which
> has an embedded PCIe endpoint with two functions.  (You can ignore
> pci-ep-bus@0 for now.)
> 
>> You are not describing here parts of a SoC.
>>
>> You are describing one, single device how the host sees it and DT
>> maintainers (and writing bindings) ask for complete picture in such cases.
> 
> I'm glad to provide whatever information you need.  There is more
> than one way to provide the "complete picture" however, and I don't
> want to send something that isn't helpful.
> 
> If you want something different from just the DTS file linked above,
> please say so and I'll put something together.

The DTS was enough and it shows that you described internals of the
device. I keep my claim, that is not correct representation because it
is too detailed and too complicated.

Nothing related to the syscon should be represented in DT, because these
are internal registers handled by the device itself. DT does not
describe internals of the devices, but how the device is being
represented for the host.

And Rob Herring already expressed that, if I understand correctly:
https://lore.kernel.org/lkml/20260605144032.GA3659201-robh@kernel.org/

"And really, a DT node for them should be completely optional (unless
there's some power on ctrl needed)."

"Everything else like SPI, GPIO, UART, etc. should be under the PCIe
switch upstream node in a pci-ep-bus."

You don't get multiple syscons and other internal routing elements.

Best regards,
Krzysztof
