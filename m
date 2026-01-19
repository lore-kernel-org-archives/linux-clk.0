Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453E23A9BD
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846905; cv=none; b=lhWbGCxDRX7G1qqTs6n9MjWgQ6CBhXaWq+auTb84NrUNNoMjKP6FjNSRVlI0qJDR5nQv6qwx9vKsPZyzmbCd/qGY7ofmR90dxl2H3XY297C4xY88LouAwT0+wx+yEXCRa6DUCndeJL4zFBkc3XM+DFqbUgd1YVDvK8SFOuGSQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846905; c=relaxed/simple;
	bh=Zy5LJZMMrWAeJGybc1mYICZTcGYHy14YxJl9thaBNQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gSB2VNODW8plwzT46QiQDVWukHWhg5S6759K1Xs2R7+n0ct09D77++ZckiEiLF6Th3kKTasQixaHH6vErL49mU8F95hWW5YYgWewUqwUdcGbcG5sIB6awH/hDJ1AedSFu6beUNtSpfXpNAhPcUBXJ+lQdajh4uqleDl9gzH5K2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BbbyfFus; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BbbyfFus"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8765b80a52so741668966b.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768846902; x=1769451702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xlgCNFRd3suuMwlXMh6w6WO6xW2ltmOI8HGseTLB318=;
        b=BbbyfFusEDX2xzmUkp2Qs3d2Llt2D9251ybL1uZsA3uN/K5jpQ9h/3DFqxlbzi9lA0
         zN4ZLTd0c5kwsOkDFNMlKpURLT8TTcgHPEWcrhkrZZqBfuTio5gLlHTWYSpiKBrZ6SQc
         GYmGwypMTHRxwIb8b3BSRWJdt3zrbPZSEU4w25EE9XBVp5WYLkVFp2MG2cqzpPDpGQlj
         n8RhZKFPhccLUjDbbN8qZZBIvhekFzJ8+NHd8hGmeYBaSQKacgVw5PzodPz5dkQQ6oZf
         n3EvKiq6WYd9bqY5np4BRnF0q1Zks1ezhUvfdtwxywo9Oet8tU8RjzovURpi1aeb6ZHp
         yNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768846902; x=1769451702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlgCNFRd3suuMwlXMh6w6WO6xW2ltmOI8HGseTLB318=;
        b=epumhY6M1xA454TExDM/ijNtOukWe0fjjHffIMhZ19CwZSb4e7u+frK/fMG1Gy4kEX
         EtvtTxi0XKj7YfkpPHQ2zIe/gOYYXc9jEjFNOvlbx9EbzW9deE6fcW8WdP+3R6j6dGm7
         xG3KUf9TwLBT5PMuD0n495FC3e7J7pK1dXnCYA9oFXq5qRZt98sA4sUJNpv2dm6LlO/l
         /qUVqBv84qpPWUKXbTS5Y+gsF14akPmWIitXkwVplLs8OrIEDOTkdo2ZOL5yOpmgSOkg
         rf70Beqe/OoVRixCaRYPZKzcXcbo+eamPcS5fLpONHgZeswwv4oOCMA2/arPnbf0Wptt
         CzNw==
X-Forwarded-Encrypted: i=1; AJvYcCXRuaC3TDTatnXGk+uRLI+Ib0OUTAMv039QivBfFCDuJggCJA9zv6Iyc1LZdtY2bEHv/GRf5OIG0nY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyopyS5rX3RqCpGIXSQxp+dDDx4ubElVCBV9mBbGuO1iwYWkYfm
	jDuOeE2tkSJ0eWc24O28eyZFlLH8x29s+gszS/NOoBZ9a6hkRkjdLdMbbUD0LoZJWWc=
X-Gm-Gg: AY/fxX40hXfV4MWs9CELFX52p7qCEDtQ+NLPt7C4bf0owGmZYszBCazQNV+iJFZcoV2
	gNX836IED6HTDvhFYl2xgXe/C0d5hUnFQ5N/m3aGPjHXsQcNAOKjLIpB4AzcCt4kTs3T+tEH12a
	X+X1N/6xTNEd8IUlR54AUzSvPgCT96NYT0Zaabi9epIHv4TQcVF4DRbheS8RwzP2c9fXp3oKiz5
	MC0BjbNSgU1zHKpd8EQSyb/0QUALUn/q7j15ehLJizXBzq7xlVbv4upnDBGCk8JJJedN7613wHG
	qLsyMw0xzgr3X4nIN9UPJzWJOhos/udDVjEtiOd7v/ovZ916MmThaa6UrvVl3kDZvkgG3vR5q6T
	03uu72PRYuJ5v9C+qO5Pan1MIlYldJ8iv2WITRgGbmFBLn9DSI/N5PqWyXIZ8uHFfueRPFpSldG
	AdGtDEr3oOPiRU+bUJXQ==
X-Received: by 2002:a17:906:2083:b0:b87:d09c:181a with SMTP id a640c23a62f3a-b87d09c1a2emr283479366b.46.1768846902169;
        Mon, 19 Jan 2026 10:21:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm1175882966b.69.2026.01.19.10.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 10:21:41 -0800 (PST)
Message-ID: <2649d775-e33d-439b-af52-8bcddb9823c4@tuxon.dev>
Date: Mon, 19 Jan 2026 20:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-12-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-12-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/14/26 17:33, John Madieu wrote:
> Extend the link speed configuration to support Gen3 (8.0 GT/s) in addition
> to Gen2 (5.0 GT/s). This is required for RZ/G3E PCIe host support, which is
> Gen3 capable.
> 
> Instead of relying on DT max-link-speed for configuration, read the hardware
> capabilities from the PCI_EXP_LNKCAP register to determine the maximum
> supported speed. The DT max-link-speed property is now only used as an
> optional limit when explicitly specified, which aligns with PCIe subsystem
> expectations.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

