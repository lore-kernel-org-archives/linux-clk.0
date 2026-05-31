Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D0D38E8AC;
	Sun, 31 May 2026 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780239063; cv=none; b=bCJ1wLvsbcDQKr61Jls33u79Orh5XRjrlrgVKAryBtWZGQaFoQ8ca3fG9zRPdBg5SoFfs7R3peXqjSLx1rudmTt/4NqmRC2mQj4HQ9l8Xou89HR4el78Lj4roMOUvW4P9JSKhUKWz8F6wHi8kdO4au3FCgxySF7Ryk3zKDAb0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780239063; c=relaxed/simple;
	bh=vNAp0zDqLDwyAUgQ4fJ6vtzwOk0KZfcnUXS7ttTFzoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfpZTjHgLq+2EcaiCWakOEZZX0OZnhaHPsH7lOzF5S2uU4zMslo8nGxv6EgKqQXO2oXGwJG8DRZgaI/UtiFbqTB32WuMFwz653KWJxYtiuapOlLAkDRsCjW2elbY+tGbHnJ5CAnGSKxthOfDDEol8JZpU75JNCzZB/aAfYp7xVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4A11F00893;
	Sun, 31 May 2026 14:50:56 +0000 (UTC)
Message-ID: <35c2ea3d-e257-43d9-8d02-4a111259fd5f@tuxon.dev>
Date: Sun, 31 May 2026 17:50:54 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] clk: at91: sama7d65: add peripheral clock for I3C
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, tytso@mit.edu, cristian.birsan@microchip.com,
 adrian.hunter@intel.com, npitre@baylibre.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Durai Manickam KR <durai.manickamkr@microchip.com>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
 <20260525092405.1514213-3-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260525092405.1514213-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/25/26 12:24, Manikandan Muralidharan wrote:
> From: Durai Manickam KR<durai.manickamkr@microchip.com>
> 
> Add peripheral clock description for I3C.
> 
> Signed-off-by: Durai Manickam KR<durai.manickamkr@microchip.com>
> Reviewed-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>

Applied to clk-microchip, thanks!
