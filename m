Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098E1F3FED;
	Mon, 15 Dec 2025 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801937; cv=none; b=cfdW/qmU2JKZVpo39Ote/2tNZrE8Q8LSBH9YqUZilUV4YZkSt/aj9X+e/+eTg+X0RN0gPr9cLzk6lrkhR1P9CoMUjfZV4iXtv0R8VaeH7nLOMmn/sv56hCnMazzQm2omuuJTrlSWmVoCqVE4VuqUxzVRM5j14ibgJ0ECYdhXUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801937; c=relaxed/simple;
	bh=dLfaFFRxrhBtwiyM43aiY2kA722KKifVplr8YCkaH3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V0VdOmtp0qshz67hMLK79Ab8lmF/CIdAPMSCCfkwS0tRqQvwhT1b6GWCGvm4MGmeKvUafCJuweALDPK2/hARihpbPGkYPHyv6n4ZEhSEtuQ8xRkegX773UoATMeFY0ioIVhQQff7wPk+O9o/OXLtm5z/DPK4xHNDgVZYFnW6ZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=m9lv6oDh; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="m9lv6oDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1765801935; x=1797337935;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dLfaFFRxrhBtwiyM43aiY2kA722KKifVplr8YCkaH3U=;
  b=m9lv6oDhxmZ5a+1vkPK2MtNbK2BSehEsOGTPNnNEshnnn9UZemj+sT3M
   1IoTf/eF3bExq4FNU3S6ngJkQBMK7yUvfmCd4kAOuoXeeC6M7+dP8SiYx
   sdwg0An9E2UqEJrimP4RBB60ZoGSMtnIM6HwdoIULCy9WmWap7SPC9aJ3
   P6ZT82aI2lyQGxcA0r7Ea9h51jaUtZ8KwqfFUiBYMpCtkj+D5K0A0oeZK
   RTVwnt3lrbrxTuLM+vCUXZ9uhfLNaAV9XXZJexPQ+ubAkp55x4lnhzEdR
   RRs3NUqz+k7td41EyrGDKM+OM9xZo4V2O+PUAvaIzGCmK79hhWq5Hisp4
   g==;
X-CSE-ConnectionGUID: i/OwzfYTQjaeepaMU2SEOw==
X-CSE-MsgGUID: TgUegrZ6QwiHS6PGOv+wZw==
X-IronPort-AV: E=Sophos;i="6.21,150,1763449200"; 
   d="scan'208";a="49867330"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:32:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 15 Dec 2025 05:32:07 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Dec 2025 05:32:04 -0700
Message-ID: <173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com>
Date: Mon, 15 Dec 2025 13:32:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, Conor Dooley <conor@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<gregkh@linuxfoundation.org>, <claudiu.beznea@tuxon.dev>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <richardcochran@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <daniel.machon@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <luka.perkov@sartura.hr>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
 <20251203-splendor-cubbyhole-eda2d6982b46@spud>
 <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Robert,

On 15/12/2025 at 12:36, Robert Marko wrote:
> On Wed, Dec 3, 2025 at 8:21 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
>>> Add support for Microchip LAN969x switch SoC, including the EV23X71A
>>> EVB board.
>>>
>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>>> ---
>>>   arch/arm64/boot/dts/microchip/Makefile        |   2 +
>>>   .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++
>>
>>>   arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
>>
>> The majority of devices in this file are missing soc-specific
>> compatibles.
> 
> Hi,
> I missed this before.
> 
> The majority of the devices are simply reused from the AT91 series, so
> I thought it was not required to
> update all of the bindings to add the LAN9691 compatible.
> 
> If that is required, I will do so in v2.
Well, history told us it was better (in addition to be required by DT 
best practices). Indeed, even if the same IP block is used, sometimes 
integration subtleties pay game with us and a dedicated compatible 
string saves us.

Regards,
   Nicolas
