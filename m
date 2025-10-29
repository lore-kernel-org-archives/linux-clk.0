Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA072F9D88
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761719059; cv=none; b=WdOuGibiJe/sY+NbT0feo6QtCYXh/dnY9J9YL6a0fxRSjJQU/Rh9P9Ua+LQHmW+uyiNOXj/sGJXdTWjXc+IwJO27YzFk1QwvtNDv1aE2O+EZvvCUqH42jNANlF+xTP69zXxWWVelW9jz6CfCh9k+2DrLLd1PROuulPoSrTX8ZpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761719059; c=relaxed/simple;
	bh=BS78qzLC6Pbc2ow6QJKzzu9seEeWMo56OC/LqYiyfNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOENlGXFkmyrAXVtlUFA56IO2TBHfJJknOsiBu/HT3yofFDc1UgXoLL0wVyopmgOadVXVNDZZeBJyFmCVEJH0gg4hMt7OJoW8kJzNIJ96Yri2dq9+ZGN4Fq4SVjPfnVrTJ7d3uMpKtZfzmqjNrvsgEdZPfXw8rkBbw6g5+Q49Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxiiTm6r; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxiiTm6r"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso8513277e87.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 23:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761719056; x=1762323856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/E+ZryNph3yMx+vi8h4RvFoOJ/BdFIb+DDgg5r/sdBI=;
        b=PxiiTm6r6JbM70EsM8ypn0+FtMMn5Z79R/9YpBWR+cdjhNJ9+3rUweHD1mlFX5Sd9s
         lp+Daj9mwvauPzQ92WpQJqbILWq/c+BvFYAs64TWW+AXi19j+0BD3a2e/mjsBSqk12lI
         9z+VJ5E3I82crdKpzvoFaIdWitAPPjI/8E26+n7Xrhec5iuDVQHLXfksfj/QxcsSRWOa
         02lwWT4NhaYkn4Rw7W4bPWePQasO5Hyjrdj1qx5kcyzRxa+KfJSCl51SBRs9JWz6Ri46
         QW6toLKlmGwf90kfcOOPV7fzP+CEuSH/HS6O0Sue8LWRsLkBOph7SDtpGXLec3+GjPQM
         u+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761719056; x=1762323856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/E+ZryNph3yMx+vi8h4RvFoOJ/BdFIb+DDgg5r/sdBI=;
        b=V6CN3cG6uRJBBY1yybxs/lwhF26sk5rvP7Sx1wYfiq4attmae3yBPk/3Emu3QXngfb
         lADPfTXcFVf8367SsxMTc0w9HsmjLDVk+QK5l02mFcqg/ZogHfJTRZWMTi3Ay8hZQQw8
         YDuvur0n+ASyeFSzcYGrtvv13tjPfwUa0Qrrgg42JS+R4WMu0+0LIewhyOdw9IEudJFx
         JfyZyj6iYEG7UvgtWnGsL1R4PV1hYce0CVfr8fyLiAawjl0fFyQywdaC8nqOONbHxaeW
         iEFArXkef5o4QPPgBsZ4fdDmO3LCMnxyD2Ayy6qiMNsWiWPMVZOcXQu37E3EKTRBYQXB
         8fEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXChEOxXLOvgqwHlb8xz0sFziolXy2UhcAJuIG3tuCBkyk8e+EgLdUJWdlLuzrzctTC8uFvWgy6nRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJLeKlxpKQj+D78D1vK694aLCQzmpAXOFTIwCw32fcA2cjLqXO
	ibYnlDD7Ux9SoILjlajsX+N/XsvBbPGPIPqitc8jMD5jlDoHdbMyA1fs
X-Gm-Gg: ASbGnctSFLwYNK55B/BYIfStfFKAvUcf5cy4F9zL/7GAVErIFa/0/UQA39sxERBd3pL
	f9z/2UbYBLcDzBmD/DpfEhF6I4+4G40HQZsMJuCSiG5hbe0EDLahl7FjqpUAIT9E/f5t5dX893T
	/Lrs6hXd9gkej0RLi52l2nVzb13Mb4vy7iE8ZGCWKFMjpqgc+2hna+N6bhIMDrP9eSCwEUCIxeh
	bdgojk+xE32VYMpcZzTCjH0fKWkiFyVOzT9VDef4JxeSMj0nDR+jkp+JEqIRjZT5vY483pDVhbT
	u+qnOGTwpQSn9PvDNmsEMax6pHh3U0sEn3GZ3fZFuQmHo0D96Umaf5xiSVn8ywlUCiNrXwDzteE
	4E+ACN6xsn4qNYnnvGRIuOzsvMPFIGXWF+4tNg1sJV1iy/kR7Bo6EhkNs2BUD9A9h/Ui5VChntS
	obF266NBnOzWhDjUINIPisyBnCGFx8Pl98NZupeR/sEJopVJknQOmWrcBaAQ==
X-Google-Smtp-Source: AGHT+IG8NXe1EdGhVyolwk15yW6Efwh7ekc//1eGyM0sEnTM8+C2jzj6xxj8v4NnHT31PN5hE1LQpQ==
X-Received: by 2002:a05:6512:104c:b0:591:c6c0:9af2 with SMTP id 2adb3069b0e04-59412a0cb9fmr596126e87.54.1761719055744;
        Tue, 28 Oct 2025 23:24:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f60ca4sm3577871e87.62.2025.10.28.23.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 23:24:15 -0700 (PDT)
Message-ID: <3d58eb1e-7889-48c3-980b-bd2a98368a3e@gmail.com>
Date: Wed, 29 Oct 2025 08:24:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] dt-bindings: Add trickle-charge upper limit
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <b13b733e7e0fba05652f49f727412fed9e0ceb02.1761564043.git.mazziesaccount@gmail.com>
 <20251029-adamant-mamba-of-patience-cddb65@kuoka>
 <b30eed8e-c8f8-4077-9e6a-0217c5827981@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b30eed8e-c8f8-4077-9e6a-0217c5827981@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2025 08:17, Krzysztof Kozlowski wrote:
> On 29/10/2025 07:03, Krzysztof Kozlowski wrote:
>> On Mon, Oct 27, 2025 at 01:45:05PM +0200, Matti Vaittinen wrote:
>>> Some of the chargers for lithium-ion batteries use a trickle-charging as
>>> a first charging phase for very empty batteries, to "wake-up" the battery.
>>
>> In the few cases I was dealing with charging circuits, trickle charging
>> was used in context of top-off charging, so when battery is 100%. It's
>> also documented at Wiki like that:
>> https://en.wikipedia.org/wiki/Trickle_charging
>>
>>> Trickle-charging is a low current, constant current phase. After the
>>> voltage of the very empty battery has reached an upper limit for
>>> trickle charging, the pre-charge phase is started with a higher current.
>>>
>>> Allow defining the upper limit for trickle charging voltage, after which
>>> the charging should be changed to the pre-charging.
>>
>> pre-charging is the trickle charging, no? Or you want to say that
>> trickle-charging is pre-pre-charging? But then what is pre-charging in
>> this binding?
> 
> 
> Now I see that you added initial trickle-charging in commit
> e3420b49949c79d6182dd8128fa7a3958da01b07. I looked at TI chargers for
> LiIon/LiPo batteries and few popular models use the same meaning/cycles
> as you here. Probably in LiIon/LiPo you cannot or should not use trickle
> for top-off charging (CV phase).
> 
> For NiMh these TI chargers use term "Trickle Maintenance Charge" (e.g.
> bq24400), so in separate or this patch please also clarify the
> description of properties that this is trickle-charging for LiIon/LiPo
> batteries, so the pre-pre charging.

Right. I'll try improving the description. Thanks!

> 
> Best regards,
> Krzysztof

