Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCC2BE047
	for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761633561; cv=none; b=epy6V/ZQ1C911B4WG9AR82YBfbKfK6AybjlmYjg9Yv/WiUTTZkiJMjCfGtGdfWQZ4HTdrObD994j4/mfUou7jtoWiEYH0Uaxh4WlkKCaN7YJ0bQ9PudOaU0jaR17LF0L3w5915ikxpRN/Wl587OSe1yfQwFamANPpGrwwGYhSNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761633561; c=relaxed/simple;
	bh=oe8UGTsyZQU+Sb6o4knYJm/Nl+RnNUK56OH6fcAsM64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZtzggoN01ig6bOjYWEeOZ+haYE0yCadJOnXf7vSeqR1q4MRQTCyjxPX0lum+1VddnaOsyWCEKKnjdG4VKU6buhLKnLvmBanNkiGfaHGQ+DorHHook/eqEnsfkbebfqR7qB8ZfCH/i6vh0eW5rm77RLCqw5Jexauh7iy2a3kPs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+D/2g1Y; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+D/2g1Y"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37775ed97daso65483041fa.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 23:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761633558; x=1762238358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2NHp9DtfBxd6wakLEvsBSL0E8nIoGL8qMdT+jYFy9w=;
        b=T+D/2g1YRWTe3hvcE6dzlW/v7H7zmsCuzU4PeToa71WdgD5U/gfl6VOqTMxwotTjow
         sCXyzAruCgyhUpxXWKp1rtFdo83yEFxedHO305txU/NYFxqfBqkCgc4aISU1QtjjKzf/
         H/ANG1sxpXpAtYR3rCJtXW8V1xMAvtI1BF3sNgW97zA4wHqIsOeuScWQkGFcEGG4U9Xa
         E7jEWWZyDAqQmxpxfh+t/8Ufp0nVLgE9RXnVuhiUvGKtK0Rn8kOxo++RufEezI+tDRBy
         RE/Rs0OA18VTS/KlBxm6gF8W92mwUpzogHFLtbaL/aFvAIyXx1asxi0vuBAOe+q3Zid0
         vG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761633558; x=1762238358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2NHp9DtfBxd6wakLEvsBSL0E8nIoGL8qMdT+jYFy9w=;
        b=b9xlGXP0PFJEsiNQBJyr0m/6r7EPCMoSM49t1cEtgbDwTet3N3sCTt/SJIoI5Slp8X
         NP0r3PmXhpBlh7oFC9XGXra+0ujhtJ9xteb7UVESkQiOGsgvheX/tb6P+upXNPe9jvMR
         fKfCAhs804Qk7zH7wjZ4+qz5hkP8SsC/0eHYgHWm6tjxXyEm9jdOaZG+/6X12ZhkXdE2
         zr9pdjIz2kPpUq7D8t1HTgduMJA42gl8Ipawo/NAYiaXruDZ4o/sLT/7x3TaDyIb9cpG
         EUTUE3SM5FmRSOyDEDasch0eiEI3+rZ9xgW9A5JqJu6L3aufgRCk1Sq04s47R3NncPm5
         mzHw==
X-Forwarded-Encrypted: i=1; AJvYcCXWt0IJa0zVxvA8Xgfpi1GAZCuaoBeZ68mHBQ1xY7KcKy5on8BUKEM89oRWnN9MP9Mqe9rriTruGcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmfdj3SDCd9xkV2ibzLQUz0ZPu3s3cgc9gQvLzYW775upQ2k0I
	gsyI2vekcLeNvfuQXqcEsSOCohGkZHOmNyYeHskfQ/819UqYdJFKOa7M
X-Gm-Gg: ASbGncvENI8Gll/ser1cvypuW5wqYaU88jsXdekjaNyBrxlVn9zWZi0/W9pMiQR7Yyb
	fvkSHTHLgIlZxXVEB3ljr2ATXGstkXCxfShCrvJ9chc7+rFvO+JlrTThGVbv0nFJKML8JYjBysP
	pwIEp6+7u+SPVmelysSMaV5SNyqjBWPyZuLGbGj9uIbAcvWUNgsBiCSqp4SYAn6PXnBMcibd7BX
	9cj/haosYeZqevMJ7UMULPTaofPLY3+5J1n7zZc4zX6J3HuVuA0RtWUYF1nPp/AtqAwI54vEVMZ
	xBqROCY1mZZVfUxS7i9L51WfCvjymNlV7HpE4u0xjOa+Qq4yPOl564mN2BLwhUZXgZx4+wV23Gm
	2lXRbVd7qzXHAHDS38Me8HD51jeF0a9M2Q0awIlwA/llTKfGogE9BIWoVoWK9UK05n7n3qxqqnI
	kCS07J2nsNcZONo7WVMsj5PLeB3zGjnliq6W3R16c/AMkT7AVxynrVgeNGEg==
X-Google-Smtp-Source: AGHT+IHynrA8gmQbmSsLhwg1ZIot0gtNKrvR9BYrLAUuDbg/4/iyYf4/D5eEEzFU8nZaoyRtB4Zbkg==
X-Received: by 2002:a05:651c:2228:b0:376:3933:1d89 with SMTP id 38308e7fff4ca-37907cbd1ecmr6519691fa.24.1761633557353;
        Mon, 27 Oct 2025 23:39:17 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee092282sm26491101fa.5.2025.10.27.23.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 23:39:16 -0700 (PDT)
Message-ID: <3cd3996a-a9da-494c-b92f-a03a73d403e5@gmail.com>
Date: Tue, 28 Oct 2025 08:39:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] Support ROHM BD72720 PMIC
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2025 13:44, Matti Vaittinen wrote:
> The ROHM BD72720 is a new power management IC for portable, battery
> powered devices. It integrates 10 BUCKs and 11 LDOs, RTC, charger, LEDs,
> GPIOs and a clock gate. To me the BD72720 seems like a successor to the
> BD71828 and BD71815 PMICs.
> 
> This series depends on the series: "[PATCH v5 0/3] power: supply: add
> charger for BD71828":
> https://lore.kernel.org/all/20250918-bd71828-charger-v5-0-851164839c28@kemnade.info/
> sent by Andreas. The power-supplly and MAINTAINERs patches (2/3 and 3/3)
> from that serties aren't merged yet.
> 
> Revision history:
>    RFCv1 => v2:
>    - Drop RFC status
>    - Use stacked regmaps to hide secondary map from the sub-drivers
>    - Quite a few styling fixes and improvements as suggested by
>      reviewers. More accurate changelog in individual patches.
>    - Link to v1:
>      https://lore.kernel.org/all/cover.1759824376.git.mazziesaccount@gmail.com/

As Alexandre pointed out, the 07/15 (MFD) patch was missing from the 
series. For some reason, google's SMTP severs refused from sending it 
with the recipient list used for all other patches, with just: "Status: 
5.7.1". After several retries I had to give-up yesterday.

Today I managed to get it through, after I dropped every direct CC 
address, leaving only the lists. No idea what is happening :(

Anyways, it's in the lore for the interested:
https://lore.kernel.org/all/4c964cef46a396209052aa4194d08fc03f989647.1761564043.git.mazziesaccount@gmail.com/

I will in any case re-spin the series with suggested changes - so 
hopefully I can get the v3 sent correctly to all the recipients :/

Yours,
	-- Matti
