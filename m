Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27096468C07
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052668; cv=none; b=MctHTa3BxzNpJ8/4ToOUcQhTFh5VYRI2d/nP5Hn1MG9SUIhTvikPoL5aADx9stDeKVeg3ng5A4AG/kgl+EqLimCm4k7i3DkQZs3+65HmK+fo/abzJ6OPMJk4t2Yp/FDH/U+97wzqEgYIJx9FfvNh81kAfQHAiZ1k1miy4TfZqFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052668; c=relaxed/simple;
	bh=34Tk8hFf2kmRMBjY2LDB8H6WrFBwxCMdp8HtQJlrF24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pw5pqPB/Ic5adhGvrh/j0SGCICj0tjtVrejx40z0hUJp9jMsZHYc06KDcmvp8nu+IPHbz4TMaEZL8BU1dWOPQ7jqbPzr5kAcGEZJMlxg+m0xwdJYtU+Wyn8vBM2FFW99gFDsLXu3Pg2r9aIdwrd36BKrjV4BkMusYKw8kHi7Y0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BFG6MyN0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BFG6MyN0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4815bce4652so2815977f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787052664; x=1787657464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzUhoMzeL3A3db0AUGhPTEVPs2wp/05yY0aTmKXk1EA=;
        b=BFG6MyN0Muz0meok6YmouVSAlvzC67kX/ZV00aJNBXUKLcK9yD4amtBelxvPxyZKiY
         fITYL+iGPBG5vuRWglVAGUT9miBkALEsA/nEPPOfxWSbWjpaKM12hAQFvROvqrB75o/9
         APLrF579V0PspvENvn6IjUxXKZ1L7/4azd24KGviT6WtjidCUshk48XBfahq2PW6bmIW
         T6og23XktrZoyTPjWT0k354AFmDi6kOMdlO8QJu5Oolm3xdKbku7UdARVEPcpPDbQM0F
         VSb4qbBK7D80AEC7mvgAevm7WLeLFnIh9Raqs6m9ahOD3vqYX50NH9Ab2doZY79lhqrf
         FVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052664; x=1787657464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzUhoMzeL3A3db0AUGhPTEVPs2wp/05yY0aTmKXk1EA=;
        b=sfUeN0PPxFC5OLZS7Ku98Exk2N1/ESWuggLMHHY7JyjS0P0yJ1xHLfe17wnFY5uy0c
         9T2KYJNalfi87c6zTHKXsB27OyRM/pTaulZyi/RbrHvL36bISAUKUmpwMNm8fWibOXgs
         HkisTGmbIdMul9nPKlYRJEB+fVZVGzYYmaIlj1CJdpZ5As++/qV84fxuyP3sRAqcLLfZ
         qYqTgAYVGigvH3vNDl0cLC4VQFhu6kDBgzbzA5rKrQIKyz4suJMGMq6i92Tv6bDkFXOi
         00RLdLfnoBYzRDmL7n9wRjwTAppPN68MxFVuBZVJ3GafwfK5ku7U4U+naQm7vnRHDbJ3
         9W/A==
X-Forwarded-Encrypted: i=1; AHgh+RoPKl/fDcUttfob8sAy9QjRTS1RdhwLulyBHrjh+qFgSt8VCn3D8owtE2sUVCeNfGI6N3ZRiPwdI7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7FRO0iVhydkocxFjIWShx44duP8iqsI5O/MJ99DI8ditqzq8
	ELWe2I6I4Miq5Yex2zzAFDQAdyHy+0IimLlUcVbOcxgkK1N2t39wFSrEm54Twv4bdyo=
X-Gm-Gg: AR+sD10mvsn2b/uTSNL0BH9V6v6XC+SKdN2Te5NTOT+qPpbukTrqrMe+0B2fpMFo96m
	iykWbXs2wPIb00ghPMH8Y90Oxg9PG1cGwtYhCrz+n24ukHifaoEOF0URGiePWDYo62uO10fTiRc
	YTkJ22Ma0fJJfZmI8jx2TVvcLMhrGgTDtn3Rk+lqs+X6gOHdzD0jw7rNr7twyYCKwtngDDpUjK/
	mfOv2sNUADTDRhRW3xCsLF1ZfORUQcH/G2r1mq4Gl0EP92bN1LK1yG4rz7KHkHl4DcFZHolLnNi
	dJARKJ+3AzQymzbOa8GVHgCdddyzbA693n3S05steO01vTmundYnFxyH681NJ/xxlm6d/l+iTHs
	Jbq3PlMZcuSFnA2XRGQdExqozMiIZ9d8of8+c+aAwyhBZdUueu0CZeCiS033mxZRaCQL9gsS21Q
	0KExV1dt3j57dbtRq7ZW8YM3KuX6EOOC3s91NIzW3SD9N2h631Hzfah2xP1a9SvJI6KWOWvPtO6
	xuAzU7++wRCKLLnvFJe95cNKNaaC42LGSqyF0L51bAM
X-Received: by 2002:a05:6000:41eb:b0:47f:91f0:9a8 with SMTP id ffacd0b85a97d-4816079ece5mr60246879f8f.23.1787052663977;
        Tue, 18 Aug 2026 04:31:03 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6400:1700:1386:b860:6632:a42b? ([2a02:2f04:6400:1700:1386:b860:6632:a42b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b77f41sm10674828f8f.27.2026.08.18.04.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:31:03 -0700 (PDT)
Message-ID: <f29963f3-54af-4eca-9122-fe757c00a90c@tuxon.dev>
Date: Tue, 18 Aug 2026 14:30:58 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, bmasney@redhat.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
 <7533fcaa-c676-48f4-924e-bba9195d4871@tuxon.dev>
 <20260817-tricky-monkey-of-admiration-3caebf-mkl@pengutronix.de>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260817-tricky-monkey-of-admiration-3caebf-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Marc,

On 8/17/26 19:59, Marc Kleine-Budde wrote:
> On 10.08.2026 16:00:16, Claudiu Beznea wrote:
>> Gentle ping on this series.
> 
> Who takes the DT changes?

Apologies, I missed to previously mention the merge strategy:
- patch 1 should go though Renesas tree (taken by Geert)
- patches 2-6 should go though the CAN tree
- patches 7-8 should go though Renesas tree (taken by Geert) as Wolfram already
   mentioned

Thank you,
Claudiu

