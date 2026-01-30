Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042C42DEA70
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781195; cv=none; b=uQfuGMUJ2hwx/ouFF03iZGW1w0gXH9flsYeOj7x7mXhJUkNg1NgSo+cSZZ4yzpE5TUn7qjHVPvwqbZ2zYNHGhb6YBdct31qXGGBwYJWIDIoO7BezuFHyCQlQfBTiESNg+AFFwIb/60KxUgHTB2+OFlA5XgPDDUQtcGrur4XPBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781195; c=relaxed/simple;
	bh=lwHSW4yFYrq7C7ukeFfwIsI3wJJGF+4yOoFIz+TjZ5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLEECtTJhbZPjZEAuSI2PL9oexPZCXN2D9rPAWvOYbXj/49yv1ylSHdeOFAOZQ/xbYlYQ5aV2GxXH53x74AGC9nD4YkMscD29xX+mlssqu+zBSe+8rHgweWWhZjBlmBP+lsq8KjkPZWtDxXJs1hoHz5xnkfEuSGJZkahBeQL4oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j9p9aum1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j9p9aum1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso16536125e9.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 05:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769781191; x=1770385991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNa01vI1UZD/5USaqCSEKUoS+bCUzsBbRR38Izr8E/4=;
        b=j9p9aum103ASP3lhsVEfnlwSIoGAyxtiSTo6tkByhWegAU0mxqrwxFE3d5vVTHk2vI
         4CoEWn8ekznsO9E2gt85BFVSFAPNjSKf4myuLEdPHVC4oJlv2YBIixcRFwpeH4Gt20E9
         HsazsICOEjJw68HX+GKbQeH2caRhcQyEDy8o8vdGvhKj1Zh3xq+SLg6tO2Tvq+TzbO9Z
         0bPJ4nsoFskMkaP7iWelAxix1SYRGsCtk0QU5Zf1XbEvey3OXZ98FRGCGScn25q1B4mB
         85aH4pU680PVXKpEELD1r7kFUFAvHm/cY8+zb/KkVjlGRMHLB20y0HwBhH9Z1liLsjuP
         ggYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781191; x=1770385991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNa01vI1UZD/5USaqCSEKUoS+bCUzsBbRR38Izr8E/4=;
        b=pDVlYDKfqHFm2dSFjITvJOEL8olKiCkSPa2s/pLf6XJGLTEtJi1lEcD09tTAjFV8IV
         vL+AFjVa38qnNPiBy77ggpxLlvWsAySX19Uzzvz8EmVxJH3EO1spOT3rE77vTNTQ5QC2
         +tyeBxpYJHsh98y4P+hefDMgwEFi/kXzhgNtSiQdlfj2liZKqn9BCvrMAnSBn1IZ+vci
         mqN9+7xw+dabiF9HYvLAZV+pfnB8/W/+uzM69GMgUaCnIkoUs4HhVtpbSmMlhF2F61ZK
         DVCQgS/sthuCqDoB92aAl/wKtug3wdbvY22xZqZ1eaNIhUEPxGGiqBx9stkHVKjabVfL
         VAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcxq4oWkEQNds4nG6Cc0DB2pB3jvqLjcbvYAoTl2VaFil7TPgdrhWSa5c1/ej2uJF0/v2R2jhH7GY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhtHpv8dz12apcJudBeR/Hs6HWamJ4+gdN760AiciTOtl79HI
	btH+x/wfwabe5RsFoovTvZpOk6GaMM/QpEqTW2GxgqhoPH4mbi/lkkTraKbT/cG8zkg=
X-Gm-Gg: AZuq6aIHKZNnJyUgYafNiEocejNJuxUYM4sunwBKfNq/dk/ZoQTZFXrtt4PGKo/ozGq
	Gs1KK1R8VaVOCuLpnMpt4pnt5KH57QuyeCEoJpW+ltTShMTQ/mqn7VBSA/x3xHv70vUjxQTODIN
	MiJLQIu2bSHjW8qHDAt4rkmSGnIHqdqlJkJJ7qYq4LE3xvI4J/4dykujNvdGH5UPFKfC/qzSjdX
	iPpnZILNDq3yHRF15c5TNSCOwZsNWYg4yQ6EK1UqGILQx6KCijCeS6u0u1SPScJiVqPPOSmsibT
	StDyONklsgIvBE2UPVzuqU+Y6d4SlYUcEe5aD+ROPiu0VZMY+4FzwE0F7+AfSzDrAQC32WuwJG6
	/YwY+kDR3ZAcOXZTCwhDSSORCy+QaptZVINGc3YcMMpwKVVt0ZyiMHKQxsEeJO5acD7qd7xQt03
	VJ7AAAEIqoTWK/XdndbQI2HqC7dKr1
X-Received: by 2002:a05:600c:a00d:b0:477:89d5:fdb2 with SMTP id 5b1f17b1804b1-482db465e44mr31524145e9.14.1769781191115;
        Fri, 30 Jan 2026 05:53:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cefdsm22444151f8f.23.2026.01.30.05.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:53:10 -0800 (PST)
Message-ID: <d962357d-13bb-4ea1-8eae-e5efa1b9c965@tuxon.dev>
Date: Fri, 30 Jan 2026 15:53:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix
 naming properties
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 john.madieu@gmail.com, Conor Dooley <conor.dooley@microchip.com>
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-6-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260129214130.16067-6-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/29/26 23:41, John Madieu wrote:
> Fix a typo in interrupt-names: "ser_cor" should be "serr_cor" (System
> Error Correctable).
> 
> Also convert interrupt-names, clock-names, and reset-names properties
> from "description" to "const" to enable proper validation with
> dtbs_check.
> 
> Fixes: e7534e790557 ("dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC")
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Thanks for fixing this!

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
