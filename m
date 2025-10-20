Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275F8146D45
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987891; cv=none; b=XH2nWYCermwk0GazmCBs/3fdHa703KBMpDaxztbtAFDd3/8zhS+Di9Qf2KBlPJ559neZvcKQyy0Jiq0BdsUO62/QpROQpNa0/bXMn/q0vKrnk9v1viUhBdv059y5g6VzrH+7y2OciBnv5ITi1VvzUmmhF/dGC4/JH2VdQSMxfzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987891; c=relaxed/simple;
	bh=B2GwWQHb2WNCqgXU+VsEpJ51dyfQjF+xpMUj0xTobyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoc2GCZkTwmsqjcsMLhPweGvLdLyXAAtoKAnOPXbqt+DPQ50JZZGsjitxWmAOvbfL9qGSYuvV3vh6tUVZidIc8ZDl8qNLT+B0o3tpik35Fn3XjgGIgIs3YGK89jE/pkVfkkviftICYqQtSwG6yFYf8xVGDkii2q2kE1f4BwcrME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iB564wGI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iB564wGI"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so2463643f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987887; x=1761592687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0tsx4KSP77ESIlhthvIKVZRSnX72ewIM/q8+bWb71E=;
        b=iB564wGIPE/WtHO8W6lGQdxqfEpDskJ2S9chg50uyVzySvufkfOldJvvFuwmuWQEnm
         gAGJPMIvM82mwdAPTaH4471CpNK9PaffUsjaceyxnGOVygfKCufQlY5wnLM9kJwwdc2t
         IIBjln+kDrqE0MniMQAyrqTNLEif7vSVN0sjMYpCOZfWjYV3djviGkC+k7zCDN8Ie8SR
         ZIUsmQqRdzuSxy8zWLkAmAwUSuyYzYKCF0hSVY8BbvIJ/Bb67TgIDqR/uBWZwm5Uosxo
         m/gp+DCd+2SWvsrLn7yCs1CdBQHUJ4r9ykSYi+qoY10VnvHW/9iaIw6o3uE9IueTXLyD
         lfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987887; x=1761592687;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0tsx4KSP77ESIlhthvIKVZRSnX72ewIM/q8+bWb71E=;
        b=Of6ds5YOEfdIF1eGTLNBqREZMKcPDc2UQthif5L149EyQhTiauRQhqzW8ACP0093tg
         MvEuLG+0w3G5S/cBh6vZN+8Wto4rcbGujdjsW7NqPHio1QaBRGUjmDf0e0qFO7wM0bdW
         d0D13RqgGG4SToTCmuOfrRLH4gdbONeG3vGq+FJcfo+lU5K32ZTbxSvuabB0psd8HKFf
         TLUgEqpqMrq+qZ0HAvkTylwYHn/RCh1raJT74Euld4QxUUM8k1Twl2zm1GgNYMA1r0fO
         NjkiNcXpH3fWnaQR0WFbmUerCHsjEqG9kQxwG+fd2kSpFJ5N31bxI80oUmpdY3KLupzT
         P2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWrhCYXhUjbg8DWqnPx+R6xCFCzp4PfmTDYjKMdYP0DA3Abksu3mQyil5sxuB/RN/Gd5PWJ5LYKqGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmqniPtU6i4nQsattX/IS1EmnUiR2ELPBX4w7OTLqJdHYI0oZ0
	FM2Z1RSX1LbimepEzkFn9jwFCFKFWBrzeNKB7Cx4i3O16JKz29TiWW9W+StRcBywbLM=
X-Gm-Gg: ASbGncvYwJfZwIeUTpmp0S7GA6WrnWaYbBMhxYYflRaoxfn6KPzhzIsNj5rcVL8Rdpc
	0iPTFkeubFmw8I3+UMx6/LHNrlUDyY9SWiAQlyJWg8cVmAFIQN5qmho3lbML1K2wYM5oY8f/+9S
	O7aMe58uVIsYi29maEUt+docG9gSjar/WyiW8ogLltkV0krPuNcXBlNWmW9gMkbyD+46Y/BdFke
	Owii9ZeHetcPYwKx1UitPggph4IA8OrFqczigj+yEbkM4r/uqLkRj+HShCH6EMFC/SJeWF9fQ2w
	XLPw6uR75UdoaAgN39HR4HDAjw61kgk/KTDShWv6Mcy3OR79a3s2zi+aMwiYqvnHtuHyivCZBm1
	dEGTK6bIu6EtnAa2LHF1x/HvKfObxIFCWOz0Qq4auxdw+ZsFvbZ+oXmyfoLIxA0lTUF5Y1LKZ2r
	hNCI1uWL7mEf1vSPcqVrI=
X-Google-Smtp-Source: AGHT+IFcgqnPdm4nc9BDRoT2IcMx9OPGQN7Qu5Edx1CiNPuj1x/M7ZsidNWYx587c0BBZFL+lcxA7A==
X-Received: by 2002:a05:6000:702:b0:427:51d:1177 with SMTP id ffacd0b85a97d-427051d1222mr8232140f8f.8.1760987887446;
        Mon, 20 Oct 2025 12:18:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm16913232f8f.32.2025.10.20.12.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:18:06 -0700 (PDT)
Message-ID: <e9358bd4-c972-4fb0-a11b-fd562e885ac8@tuxon.dev>
Date: Mon, 20 Oct 2025 22:18:05 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/32] clk: at91: clk-audio-pll: add support for
 parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <bb2fe895daeeb0815452213a437bf2c9e3f6ebcf.1752176711.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <bb2fe895daeeb0815452213a437bf2c9e3f6ebcf.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in audio pll clock drivers.

s/parent_hw/parent_data. Same for the patch title

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-audio-pll were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
