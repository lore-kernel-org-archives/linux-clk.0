Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88022339B2D
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875138; cv=none; b=HonqOAQYGw3Y28Dyg1u0H21ANB/j6YP975HpjGsB/GOzPfg5WhMDrEWrx+7qOdyzcG9PW//sp6/7unrQdtoBY2kFu8ViVGEk6oWaZfnuBlL+ysKlwRwKKuBoztK7uJ9POfrd8CfFI3HBQJkqtHMd3SuHTR9fhLRxQ8w64CEXROA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875138; c=relaxed/simple;
	bh=K9aN7OjuKemtuSTajY0LoUlFdOIQZsAHYT3xi+Lw8SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvexODhncf9Y1+Klatldw4djKz6Nt5Yp0QK5Bvv2rL8CHVL0EfrsC3NIy1fK8Mr1+ywNGo+OJnc3Yp4yuzO6t2q4F56yUHFIg3plMIRlpiQU2mrm06D782xhd2oPVyr1mlywdEXdIdtx/JbfbroxWvWSGZ7Ry2ZLJRiX/breQ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jAyWIZvV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jAyWIZvV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2355362f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769875135; x=1770479935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVER5vPZC6mrgsjqcbK85uhUXRqOLGCzOU5rUyInYAc=;
        b=jAyWIZvVzZOL7FBF1Z2dsEP7T97EjKtDKtxreN9rC7hcjhrUkcrw6bN33SnHUCW8Gk
         A0+LaSaix/+/GD3q2d31Vl8aNa89pOuOTAFXEHxHMx0IBI+Uc6gyrt9GivmTs4/OeIj8
         VZU9vxW/BMWaLT8cvko+NTOISfITbvC9ohtjXsf7TgQBwq+kdhuKutBGwDs0JwkuqREA
         yC2aNgxP2FFeVdDsvIHh2qck4yNmVG0tPHibmLHrKBX++EOcpQ9ERj93DuOxtxAly8eB
         7KXVO46y9jOmfoTlhlr5QAFY6iCECHnC9w9fbKcGpnvBjlxZ3sgNxnAiQlNjcLjB8mAL
         ZeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875135; x=1770479935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVER5vPZC6mrgsjqcbK85uhUXRqOLGCzOU5rUyInYAc=;
        b=ZJuL7yxaLF+IaF5GO1CQ8my9cXd+Lb1z6nY1T1ExcRd9SP/UroDFMnwCr1Dbs2I0H6
         UbGjFiAvNIo9zFcHfC0LUAXPQLtoW4IZ3lvzGBrzStAyQGUrJ5Auf/0iUK/eIKJsc0JL
         UOJ5KR657Mv4tJT/IKsppW4xwlNKr3UtByIW/eX2cibyL9rvuKZnQFVaPj/DgUMKSslK
         hjsES48XAPO2f81Jw7wSj2aFJMLWeGq2hh8BVJOvotnEHNqNvJJGv3KzintYfAA9pTDG
         q8Ugd1dMKSYJlM1jl+5Bwwii4psUqn+SiFNqDIo4cGW6rgFwY6P6qyVHXBBzYxRMb5D4
         vZqw==
X-Forwarded-Encrypted: i=1; AJvYcCXlS2rRnsoc9JTSyEUMk3gwtgHtmIVtKOeRNjMn2xlv50qOIQmlbq0OnFBGMWAfX359A27pvFBY9oE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPY8Lj9PbnN7h/tzHoMTJvLe8hbdETSCvulQ/HgzZc+epZ7dR
	DRuVvbVEweLBwvO8e9pL1Cw9Jcq2SvCnn8iXRjv2IuVMjNeXGV0XWw6sHGD+7h1jRfer75BX7UU
	w+g2J
X-Gm-Gg: AZuq6aKCwxzu3/+qLs/F554LCr2PeNte/0v6Ww/5TeIFCpTHqQcAAYBfidLX6RqM+Cq
	Ii5I+sBk4j5h/jZGgJ1/bq8EtNATDCWJSzw1oNVTZQy7AYM4V1W9FVO+o2ZBdDUKjVA3mUM2XZH
	2NXV7YbNy/mvo+IjfDsf04d6NuP6VmJ3iRXxl2hNkVDTLFAVrIG2/m/kLZVbn6fdcaFTuvNrYbF
	PZ7qOJ4dnIrsPQyZsx5tnF7XUB1DjGStOSVliKgAJgvPFLTV2FTKWtO8Mt0c58m4+2c9+OYk/hO
	AgZm6U8cmeUB7WfUx9pMACRlmJh+7fui+0W2JYTj8HjbcjV95rx3DeuLS2xkXFLAte5FE5fACQq
	x9RKMpO7LYMfOWwrQGV9XI9Ojo+X3dMwLircL6toIqnEmBexqTXy4vkpRuVdB9Ov26glN5aaEfE
	hsnWzEbeX3YNrgqiG4VQ==
X-Received: by 2002:a05:6000:24c1:b0:435:8ad8:b7a with SMTP id ffacd0b85a97d-435f3aaf763mr9878839f8f.46.1769875134874;
        Sat, 31 Jan 2026 07:58:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322f40sm29757534f8f.34.2026.01.31.07.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:58:54 -0800 (PST)
Message-ID: <a34bbde5-1dc8-4cad-8deb-f2e7855eb4f8@tuxon.dev>
Date: Sat, 31 Jan 2026 17:58:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/19] nvmem: microchip-otpc: Avoid reading a
 write-only register
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 stable@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-4-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-4-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 17:44, Alexander Dahl wrote:
> The OTPC Control Register (OTPC_CR) has just write-only members.
> Reading from that register leads to a warning in OTPC Write Protection
> Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
> type READ_WO (A write-only register has been read (warning).)
> 
> Just create the register write content from scratch is sufficient here.
> 
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
> Cc:stable@vger.kernel.org
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
