Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF53A4520;
	Sun,  7 Jun 2026 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780834760; cv=none; b=IXIyCY5HYw3vxtsvNSJUbyRt0LQyif08apwGUeuGtedWyppjSiiARX5OtFJMmWlvYroOm1+Itms/FE0OC5zhaxDiWbv/2bZPJ+xTgWq0rLUQi3B4yVDi/+T5veVltUzyRKwEMJGhjaGCmpvsXxlL38BYnQPLgZZyYswJx29Gcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780834760; c=relaxed/simple;
	bh=FMyvV9qZmaMi+ouVDxeNynoWpvKbaqLewgs8F7M/5CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ed2jKU0XCLC6yUFC5FPWANPWWvMrK6uLJEn8VLOk2UsK8OK4WLqmea4LxhQODlnnb+kYiM1fCrvv79JB3pQwQB1bp44HNTEpUFAwI0FkkQxuGpuXBAUKVdmmPuULZzare34IrkD8l7/dOJuZ/Czv6/JUTWwLROahiGGozqO0WnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CFD1F00893;
	Sun,  7 Jun 2026 12:19:14 +0000 (UTC)
Message-ID: <4330e1e6-9513-4674-8795-b4150c3c1aeb@tuxon.dev>
Date: Sun, 7 Jun 2026 15:19:12 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add microchip sama7d65 SoC I3C support
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, tytso@mit.edu, cristian.birsan@microchip.com,
 adrian.hunter@intel.com, npitre@baylibre.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/25/26 12:24, Manikandan Muralidharan wrote:
> Durai Manickam KR (2):
>    ARM: dts: microchip: add I3C controller

Applied to at91-dt, thanks!

> 
> Manikandan Muralidharan (3):
>    ARM: configs: at91: sama7: add sama7d65 i3c-hci

Applied to at91-defconfig, thanks!
