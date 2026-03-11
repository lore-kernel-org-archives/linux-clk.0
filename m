Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5845C3C5DB7
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232963; cv=none; b=RJUo0VK2R4JW8mKxXI6Y+BkMRywClkVNjbHZQvBTwYsqmvnva7ahI2D5iiK5GNl4EW1Jmz0383ow4a5NDdOZGyI+zvn43cDP0wUTuYujJlVK1g8bwCczSS55+nTjTBxGXGyMYRQqtPW9Nur9uj/9EsqumleV2gusWBBNH+t69S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232963; c=relaxed/simple;
	bh=1/5ob7zls6WZxijtsiG+ycBMUAEvlqzQGZtRkP8JY+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6axieNsg7CD/8BySNKJTC0cX21caqx5s62FdVKauAyApkGz4j5eXha6gQ9b5zQyC9Xlc5vPY0TZXrGGbXH7TGeFGwGoQGDcyTQxBubMT9Xao2JoYZNily8Ld8WG3/BymWNYvSivKdqgj/3EMVABw2265gVuWn9Oazy0r+9iGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ldxgRYEX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ldxgRYEX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439cb5af25bso4278378f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773232958; x=1773837758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQMmMYHnM2EpEp1jCYHItH13VkpPNV3kwfjNHyMDIY4=;
        b=ldxgRYEXM5/sS7xZquv7FUjYkFd/K8+Nnx4uQahsDZvgZUo1KpMv5P1b+lJoD42oQ7
         o9mhzTOJel06m0h1AzlPTBV0xY9+NWhH3NUxjD8VCAWpuLstyOu2veJTtmYITdMSaujO
         r/q5jS42QzGd/jMJaoH4OZisP0iLIWD4f+4c3inAfBx+lKjlP7ZR4DTW1afJNwZrKd/2
         5o/fQPh58BRmTtlkBrlBzgn+RdsUTAxby9+IBACZrjWoiPPuGYPFY1DEjZGsSZ8S/bax
         vy3FwNFRh23CRZ5PGrifX2rTBSG59EgWqTNga6GNhk+5YfqI2lJ7PSmEWZTETWzvleuS
         CChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232958; x=1773837758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQMmMYHnM2EpEp1jCYHItH13VkpPNV3kwfjNHyMDIY4=;
        b=kQLhzTsK7mfzmgrSymbz/V5tH34pyGlnZvBGkyS8/ECb7NA2xPLGS7lSP/EfccYlKF
         z6D3ORoiPmkgO00Zg/xL0zhiV/wqpRfBqSVhRdDsGclm+IP6oJjd2BThrZAdWl+bViT2
         2vsuRF08jhKvzF5qFMpw7RxtUyUe7zCT+VyZRsuoba25QTewbAU34MPjJcNLOjEj4blE
         m3n8xMAiEBpYaCU7Od0ttZfsAOhNIXxjHDoGWx9LnCk8zSkBJDrV2T3WVobqg/ToKDjQ
         xAz2TH4HtMkQvye0hxSAeWn1n1LfHHdoygY6PwVY6I9CyoqNOXlKrb2xf4yAKpSMP06g
         z+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVb+eNRuqkc+R8JsYq0IqGCRhkz/AQRL7ZvgUymghx0nDwN7JFqYsTk4fYvJP5X3LzIqvdujrpGAuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPT18ZyDfwno2kwd1NqY9OAW/aDKH2olqKEPTofgLid0q/1cwb
	hC+AFREMuHs9jNq8F3ATZvlbgwYGG7/Qs3/uis55l/YfiABc3lRCNBtFS5KXsPnAC8I=
X-Gm-Gg: ATEYQzz2D6UsTWPLfFZMcJSfsVg658Z8PMS+yo7yjeA0CWpxHal8eskCH0LGVXDQZcX
	LgLy3Hv60Xvzyydu6Jfe963jTE9Ow4/+IoS7adFqTxRUv26JD2IrmTIxOgIPXKhu0xl+OW2b0BR
	oUth7Q3QIvjiuhSMn7yoKvSNmahu/0LIHaS/arjYo3LQSWQ1a125yJhbM+LFWGfy6LamNf+q0u1
	Q+KHdz+vGuVSegaKyWB6Frv3Q1sNdTnlOTt1Rn6JviV8DPmS7ZBOW1Kllyd/H7UzZm1sjWiW8aG
	7cMqrkLLnoNN05eL5aNQToPUaUF0zFT2+miFt/U4OxDuqupvrpg52h2y4nKWuNOQ4j0UYPLtpEB
	8aEhULWoWclFAwKokuzBCOaH4LUWVcxoXeyjRx4CaSMGgstpNEQqAyBVyvw+LsHWrD7y6x5pmYm
	z807KdYb7WAlRe0EiTBgID1AfZkrJC114=
X-Received: by 2002:a05:6000:40c8:b0:439:f605:aff0 with SMTP id ffacd0b85a97d-439f8200ae7mr4745175f8f.18.1773232958573;
        Wed, 11 Mar 2026 05:42:38 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f821a672sm6158840f8f.31.2026.03.11.05.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:42:38 -0700 (PDT)
Message-ID: <d88c8bcc-2694-44cd-9197-a1ab805447ff@tuxon.dev>
Date: Wed, 11 Mar 2026 14:42:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/15] clk: renesas: r9a09g047: Add PCIe clocks and
 reset
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
 <20260306143423.19562-5-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260306143423.19562-5-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/6/26 16:34, John Madieu wrote:
> Add necessary clocks and reset entries for the PCIe controller
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

