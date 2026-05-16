Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCCF230BD5;
	Sat, 16 May 2026 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778947603; cv=none; b=CA3Eg/M/grAynw679TS85l0Tj3z9uaFeVliWCtbGYlP5mDu7lIqOSWxAmriLyGnUXQTdNnGCQNtJCM+og+k6JOouSlXwtJek7w0dKtJY6FAV06RvB9TD0OcE4KPOaRyPYdCAe5X820vi8ssoYAH9bfZdfnNuexdkeydTuBZz09M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778947603; c=relaxed/simple;
	bh=pZHMOuP0S0e1L9zSE9J1PrM6wDmhnXWRPByLkISd9gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=txLA8SX2z9WUbw7E3PxpOlCgOu/MwIdYdUcf+PB4e8vGdU6CddWdVbLUn8/H1EhR6jRFF/BVf9wesU7m+QmV3YYYQU1BcwfS1psZUxdQjDSxiCH8SaEtu8n4C64A60WxCtdWhDD1go8NDkzNlWQ3jOwvK4M0nQ0kRlF9HmH7iZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7B2C19425;
	Sat, 16 May 2026 16:06:37 +0000 (UTC)
Message-ID: <2d9dc9dd-f008-4cd3-95a6-4413986f4b51@tuxon.dev>
Date: Sat, 16 May 2026 19:06:35 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] clk: at91: sama7d65: add peripheral clock for I3C
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 tytso@mit.edu, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, durai.manickamkr@microchip.com,
 cristian.birsan@microchip.com, adrian.hunter@intel.com,
 jarkko.nikula@linux.intel.com, npitre@baylibre.com,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-3-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260507084805.481737-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/26 11:48, Manikandan Muralidharan wrote:
> From: Durai Manickam KR<durai.manickamkr@microchip.com>
> 
> Add peripheral clock description for I3C.
> 
> Signed-off-by: Durai Manickam KR<durai.manickamkr@microchip.com>
> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
