Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF4B27FD7D
	for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288578; cv=none; b=m4bs6nbPasIABdYbOrtfUpWfDbG2g5iXg/7LygKufSNdu0TGO0lGGAJNhreQE8lw6skvC9BfyzTLAvehLKF3r3H05VZi+/8J4sQ4+kD6w4jMB8oPdachV15F1jHyWTUxxyUBbrtWHsC5RcObqANz74mQTIy3fz+bNzGy5LRKioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288578; c=relaxed/simple;
	bh=EthGt9zGCjg6PpU2DVgy5FLlAZ6di1E5duvnEOFfz38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PANaMOtt3sWAKFEuuBAYQkUe0oyRMVFBODP4O3L4AI0nq2SKq7AiaXbsWjlfY4rFKWkUguWlU5YmxakTPB3tU79Vc9qIhnvhi+IEQp1RvcSyOgqHQZYws1JEiDkUpmrA9OGa35Xk61MYA2sQFNUJ3ZHwXVMVngSlj6a54yhaanw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OugeYL6x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OugeYL6x"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so26545115e9.2
        for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772288575; x=1772893375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPjdZsZGp98bzXhzTSlyBYqfNOAXOQtvUQ//D9HXBng=;
        b=OugeYL6xpxlbEOQeCp3J8kPcVKQms7N4st36mP1m+MCDOaWX7tOiHbFd3dkJb2h/wd
         KbFebw5UgooX97Pa5gOchUtBkieokOC93+Bbq2yyY8fZWcrnImMU1BGTqn6JcXDOPUV+
         DZ0PAagDm//1ilCWsYqK7jwydVNPgjyaFPMnzWJYInYoLvh7LAYeN4RhlutLixOSuNPO
         TumzKefKvj9wS1p2RPJCTlZ8cVS6D7YBU8DH3+HRykd0sVuRgZKOD8XZH9rCTjbnJWC4
         y7rYZamp4+HpwIGHADizPr5XeAPkQIym5c20CqUpnCcX0RUSDZ5qqrlC52Sca3DZ0CxG
         B/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288575; x=1772893375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPjdZsZGp98bzXhzTSlyBYqfNOAXOQtvUQ//D9HXBng=;
        b=epcyD6sU+xdVti14j77vtxVsACdHHYg3ZgLRNPYhp5l7mwpMxMMjxyWDwykrgTaBSs
         APCX+b/u3HjTNqbkUTNFo+Vs4SsZf/9akvf5X7CoHH9RwnvYlN8RdDg8NR0BBk7nOd/6
         xS6qheamElSz7yiIoZoJpDKfO/rj3wQU74Z64uX3sIEQNHTI9B+LogTnSftryTXaZBq/
         pbmKba4jlBwKklt3iiR637kCGbDkjgDrdkWUK7vxlfFdAbWq+P3iR9u5riFPSVc+zS0p
         g1iI7gRC5/xRL969Ge42gtxZQWq3qqHheXJ2fNpgdtWJIblFgDzGunsnmLroVNLqgLSx
         TfLA==
X-Gm-Message-State: AOJu0YyqqeTPUxHfPvJceehve2gQ/M2tQMuHCYZ40nktgZDm6NRwm8RQ
	CKoqssPDMbtE9euICFG3KHggLA2ZvU0+qtK5ggVC/gJzF3+/l+9jVGykO0+5E4ZMO9Q=
X-Gm-Gg: ATEYQzwODsnGRbwA1Cej40cbvjWRnohWx8SrQAv384gDbosMkLwEcOqL+aFhOW48QYl
	EfOYGq1FwzrlV6xFHPgRYJw45jSxACoU5pkNBJY2BdBizfk4Pg2pBLvfCTm6G1Ll8WziI2o+g1T
	7zqZgLX62WqS7jxa/+6L0nU9VcPbld9rAP7+qAOxmZOaI35qrNqOjjyAuF3lEu37QjMTrMClbV6
	cTMaPinmpKVsz59X7JGOwoMN/JX7dT0GIMOgsj80ri0jJk8Q83eOjgXEjy9Q+b9ZyQvIVp1wE0H
	QTQN/dFTh4iAv43mqCeYWCh5YJVP887tzceBB4+HNDgsHghbFuaNvTCw3Hj32V0sRta5PGWz/JX
	oJauh4rgKXbAHZBSET2+1uzITbKjWyEcTUlr7dDU6RpFYckts+Rhps282ZSQmPT6P4fU3AlQWFo
	kVU7Tzl2B635LEVy0VLFM5mdQ7eq+Y1g==
X-Received: by 2002:a05:600c:6990:b0:483:7ce6:1efb with SMTP id 5b1f17b1804b1-483c9bde843mr102315835e9.17.1772288575503;
        Sat, 28 Feb 2026 06:22:55 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bffc17dasm159284865e9.2.2026.02.28.06.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:22:54 -0800 (PST)
Message-ID: <89e2618a-a0e9-42d5-b82f-eded1269bd9e@tuxon.dev>
Date: Sat, 28 Feb 2026 16:22:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: at91: sam9x7: Rename macb0_clk to gmac_clk
To: Mihai Sain <mihai.sain@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com,
 cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ryan.wanner@microchip.com
References: <20260212100147.5007-1-mihai.sain@microchip.com>
 <20260212100147.5007-3-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260212100147.5007-3-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/12/26 12:01, Mihai Sain wrote:
> Update the peripheral clock name for ID 24 from macb0_clk to gmac_clk
> to match the actual GMAC hardware block present on SAM9X7 SoCs.
> This aligns the clock naming with the device tree and avoids confusion
> with legacy MACB controllers.
> 
> Signed-off-by: Mihai Sain<mihai.sain@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

