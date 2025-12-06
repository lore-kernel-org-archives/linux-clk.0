Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81227EFFA
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020007; cv=none; b=cr84hBjVHszid5/z9ykfU3FWVT/hi7ROTmhSrbPXZPEZzSYO6Y6AvgETIEMddEAmLykiEXAegDSKl3x+vRYURPnkMkqj/4KTlEfte7Io8MQmNHkpLfxc6fZ2AhI95EDaS/NEJImZBdJOHA+tUr2dUbG46YIHpOko1ZRqu0dGY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020007; c=relaxed/simple;
	bh=u8F6jXBXD1WPH8zSaLzLXa0fcNqkd5r5AejhICxhNHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvhC+cmcUot9GopuELXYMLFi2MGPqNeNwq7WZJGCteXQKRY3umN5I4zprvtsIjS33TC9eFMYnai3KJv1QcYytbNTLVs57lvraU4Y+VJ3vMOCx59bFQVD/f9WCw+m874GkrYBq2A8ofp0h64GJQttscBrLPIE8wXhPN5BsVRWL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QVDJzuqv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QVDJzuqv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so24593715e9.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 03:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765020002; x=1765624802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yq9rhuNEa0+4uQkglFFSVr44v4sksoXrRImSR0Ne2k0=;
        b=QVDJzuqvaeuYbYvkZbaZCH3czSLSKscRL7/dANK4YQcQU7yXyWv2m2l+/YQa5MUpyD
         j1NTxR/i9MeoGIGAbT08oNWA31SjUMnu9XFx4WLJhN4QkgbNilrhrrgFyEXZwCC4Aobf
         ppX8HFwmDOxO21uIwbQ7QZD8UpM0WIBbZXtege+5SqAq8TkSs8iJ5YjDdIKNGBGzSggf
         bZ6k73k/CjCICVTzqKqZm6Cbrt0TRTkKBVsnnkhAnqi7dFS88DXv+AjHYHUftqEhywK4
         LH7EAprwub+GZKgj9YG8cySPG/LJ0lqyiZKMOPw45CVd0DQoMZi/oHIvqNc/TyPmkMZG
         CeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020002; x=1765624802;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yq9rhuNEa0+4uQkglFFSVr44v4sksoXrRImSR0Ne2k0=;
        b=qBC9wTZt5otH3zsYLY505qJ7XYyM51RLZMmiOkJNMUpegSwlKOlZdUVw4qgq3OcxD4
         jbaLbuizS95j6oIRKLxCwzkfuLgMiLx8INGDmOA2RMXoJK3/6nNuCjV2jUb7h59d7AMt
         EITzYwmTNxG8D1v4+3mKXXxU204TIPE8z18t9q9powWRp+Xm74PRiE9Sr78kS/7RX7x7
         fV/rNSJHPiX3wdIhNSzKNE6zPO++sdTlUz6lXLkdGSOQQCSqWMcXnite5EQL42nk8Jn4
         RJhsfYaicPr+1YammGgSfpM8zsiKLOsWGosaKzyUHBasFJo/rDacKluzSX62cuvi/ylE
         NnWw==
X-Forwarded-Encrypted: i=1; AJvYcCUk/bSY5XFXCKEqCZRzCPfPvP6uQto4dCHk1dHM2paDeyzzEF8r6wU9XYXoPiCItb//5hFX+eCHhzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa67ZoBkJXO1YgrSsgGkKnq9tA3HEinho7+NqKDSQXrfFb3+xn
	/4RWyNr5IbOj2SOyKFW7/8KzqRvkF0xJLi6h+jPtYy84u1sNkRrNUjaW+qGdtJcO70k=
X-Gm-Gg: ASbGncuJxgoDbqH77fo6xlPGBNl/8YLcihoe7o8a+7W3qKc1RaTqJyxPXEpqRA1TC0G
	xoYqwFU0EvQBvAQq3NuLju4hTgbNtGXwEFS8Ni6f36ieHBTRyI/WExOveb3KEr3N2ODivqauQLn
	0kz1dC28Lvf+Ywe1Wfgm4mmMI03P0vy8ukYL1Q3DtsQBGGU6v1nxo2ZgwYqBv4ULW83ZvWaSWhW
	ik1MMr0KYIVx3S3CL5W8cglZvLhqFqqh8sT27vdrkigRRARJpQsxBrWKzm7RlEU8qH6oqf9YLLz
	tQ7/vLE6Q3WwwEmhuYVB90tEk4BJ/uNwm22ijTt9lt/kuKi7cs5cCi8d70xeZAnrieE66/OXrT9
	jIiWBXCEGzgzTbc+EHWkyUN8vwrme/cOfdyFkNT+LFPQgdYqFg86uTowABx+nde9OHWjedM7cs2
	SnSp2Sdx6Ziu6lnuVj5m0=
X-Google-Smtp-Source: AGHT+IFEgphPkYo9atYAEhSGN6ZsRn3wGRyDsC5dsg5UTtGzf5Qa6Sl3JSqY/PLn1LaGeX69E7opig==
X-Received: by 2002:a05:6000:2384:b0:42b:39d0:638d with SMTP id ffacd0b85a97d-42f89f1036emr2447913f8f.28.1765020002426;
        Sat, 06 Dec 2025 03:20:02 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f80sm14173665f8f.41.2025.12.06.03.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:20:01 -0800 (PST)
Message-ID: <b303c634-cb2a-4e92-a833-0e3e70c7d56e@tuxon.dev>
Date: Sat, 6 Dec 2025 13:20:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-unclip-shabby-a7a16e865146@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251121-unclip-shabby-a7a16e865146@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/25 15:44, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> the deprecated configuration that was never supported for this SoC.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
