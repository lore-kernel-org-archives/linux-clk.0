Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2572B3271F9
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761894860; cv=none; b=HnKiwdZAGBULCI5IUWePkPSUOOXl3dmmeDpZqDwaz4SQzMJt9PKzaTH6tJsZzQZKEfZNKkwkRQT1Ivh5OHMrU5m69dE3O820nyymgUCdNKL2BD5m7HmqAfKKU30rA9ZTcHt4m5qKRO/+8m6//fvJNLKovVAiSnbbSl/Qt79lNRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761894860; c=relaxed/simple;
	bh=8+WhJyitrbTeGgxZoKEsA3Xi9RoN5HyOhUdLoDNVsaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZygULlQeDb4O5wUI8NXbJybUvR/EtqPkd4G9H8mwP9+BnZJFeK0/dexZTzMK8O4hHkaJjuwLGWbE7cN54PP5orHTcKJseokQw6+YHKhI6ma5489Z3V6INe6/6+ZGMMZGJiR6J/FaKmgDQ4OPSHEu1nxBtF2/g8Cav5mJ3SDoIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lVV3yd2J; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lVV3yd2J"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429bcddad32so540103f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 00:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761894855; x=1762499655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F01LUjN81T2gEebzFvJeRYUSPOsICmfNBzp6TVdzeN0=;
        b=lVV3yd2JyyAbEBkevywl1AinDE47ZC4SaYnmFPu577PBVp7aktF9rXCtMEjm3PphFz
         G4mIjC4PyJRmwB8VP20Btq2pE9FylDJQ32kng+SWijQltfPu0gF3Dk0sve5+nnPFuMFj
         TkTf5ARVcDUkV9eup3RCSkvikx9xuAvlrWvlT+U+DrgxM1otiYsMEEX0VXLjhlOy/c10
         eiYRrnQU3AQH/VHOq88jGD4FCDGeWdWOmmD+iIHC4w8XbfIV5QmDA04HUMVLn7gFvody
         VOmeDZ8z9uqz52KmS38WpFvActV0cU4PDXeAegYzV7UBuqkgwT2yn7joe/l1RrTJIVhq
         PUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761894855; x=1762499655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F01LUjN81T2gEebzFvJeRYUSPOsICmfNBzp6TVdzeN0=;
        b=gOtzH2lCNS+hp/oSxNkrAFBF9vCE43qPixEK9G0gP7HQMY/tLVmrRE2kb0TLOFLw/h
         oZlhezQBHkk3PTFUJe2BCXUusVNfwWMyMcQvIBS6PP2XClN0cBQiBBWxweIEu3HKlmzC
         Y0qsOFD/sdGdjI4Ou8Cj4alfp+899v7BIMQl8i37GlUnuvaHHjpnzd3sAsPY4yeJCUoL
         LTdIS2xPE6i5iWjwQdAxvRiJTdiG+rxAtTmQ4Ef6BdlDcMj5+OJWNsBogGgkpDrnmE9r
         CR3sGx9IsYM6l/Po5wL24WJUcYR4x0I6cZFznqSllDNOY9HiL46/iEtEwMf9D8MoKTBp
         itAg==
X-Forwarded-Encrypted: i=1; AJvYcCWMDqctI1lqZ1P3BKTAkVlxsbXbM4xZE2E/nY2Ulvp3CCI7YNc9fwx0IP3RStkPH9zMrSHM134sMXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfFJRZDk3qK6O3rK3V0RicqMNG2VMnpQdoUyvh7CA+IiLnilH
	XSPEHeat/r0Ydlu28hhqXa1dXO8tGFpiBQsXIRsGEoYfFrxRPFrVQWzuAy4qV7IYhmE=
X-Gm-Gg: ASbGncugb2dg6EdLWM55zen3qdOQti5Nuat5m3LRUDNdv1sd9uqFPI2KqVv72xDk9/S
	lXPm4pZYr6z6eesJM2FTHosISor/Qc8RJYW0G97A/xQSno6nusWaqCL+ba8pldveSYmnVateEcL
	gXA1uL1ChMiUN4sYfZJrBziQ8qR+DYI655dEMt1i1+bIqPx1P573ZxIc2tlyTHMSeUUEr/r+ZAv
	bKoFK+qk+8PlLvxdc+lf3Utj40sn16U+1spovyJZwzl2UaNYkGgEEw1QPaG9Y5rlungxGBpA/YK
	Y38Nb0XA3pUkGG3kkO9IR8LGPQNBox1o6CexDLlCjNcCjR3np2OqOn5btW0yMP5h+xFzHzpRFsg
	AMS4Qkq5AZ0lRnguoV38KCBKskBMEhY4PxDsdB1/b/tbhLp1yLKDcxlWMjGjQW23JEMCRYW38b+
	kk7QWConU=
X-Google-Smtp-Source: AGHT+IGFXoXIYQM0033JrSO0/egQMm5kDokRkBfCt8uk6iJ6QGivvStg+2qhnCmO5P2IzbdiAPo8og==
X-Received: by 2002:a05:6000:2288:b0:427:5cf:a284 with SMTP id ffacd0b85a97d-429bd6c2d51mr1752732f8f.60.1761894855232;
        Fri, 31 Oct 2025 00:14:15 -0700 (PDT)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c114c944sm1868250f8f.20.2025.10.31.00.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:14:14 -0700 (PDT)
Message-ID: <62133fe3-cce8-4405-82b9-8ded092c7eea@tuxon.dev>
Date: Fri, 31 Oct 2025 09:14:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] clk: microchip: mpfs: use regmap for clocks
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
 <20251029-surfboard-refocus-ca9b135ab123@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251029-surfboard-refocus-ca9b135ab123@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/29/25 18:11, Conor Dooley wrote:
> From: Conor Dooley<conor.dooley@microchip.com>
> 
> Convert the PolarFire SoC clock driver to use regmaps instead of iomem
> addresses as a preparatory work for supporting the new binding for this
> device that will only provide the second of the two register regions, and
> will require the use of syscon regmap to access the "cfg" and "periph"
> clocks currently supported by the driver.
> 
> This is effectively a revert of commit 4da2404bb003 ("clk: microchip:
> mpfs: convert cfg_clk to clk_divider") and commit d815569783e6 ("clk:
> microchip: mpfs: convert periph_clk to clk_gate") as it resurrects the
> ops structures removed in those commits, with the readl()s and
> writel()s replaced by regmap_read()s and regmap_writes()s.
> 
> Signed-off-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
