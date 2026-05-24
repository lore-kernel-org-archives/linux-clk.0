Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0263264F2
	for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 23:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779663780; cv=none; b=TKve5G4TPeOt2mc92z5LNcEHuCAB32GDQklo2jv5jexjZnFV6ZZjEXUuiJ/w8iigKVq+qOYkou7ZXxGGE3vYZ8n5ZF+qGK7dXy4pS3FjUvcP8PzmKgnhnfAPgbrrPXN0piwphjFHJmlea1L0jBIa3VSoOp40YogOQ2wr1MyGKH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779663780; c=relaxed/simple;
	bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=qEjtPdcfIZCw6fsSpJla2tg1VQWFVl0mCib6svpFDRDUyC8HefTBOmBjMNFI1HnGw7Jwz5eh49KQocKp/sJ28D+tB5BJhBAGn0zXlEpZlaZ/ZFXokprTx20BGdycpEo/Q+hFvg9yHWrHT7542044mb9vkUVnpPi0+AU1P5U/kyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGMyouup; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGMyouup"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so20621515e9.0
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779663777; x=1780268577; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=;
        b=nGMyouupbGf9VIYIdxy12dL+YrMzhJq/YR1IULpHOGMOXgV9rXX0B1Jy3KzYLhP/rB
         xeiD3RCYs3XrrE0JenehVI7p5HwIUt2hln76Fw4RBnaWGcX+SfmFPh4D37iKOowZtKlG
         9CEO6IYLNZz/HS2XjhHe7xYAQfhdoc7+pWwbbe6HjcJZDXCwD1E3HhVNkAcljZP+3ofQ
         8AGp2pZr83W0vVGlT5MmPfEeF11u/oN+BbHK0Ooedqie+fWsB/iaHVo3Dv5SueTOieu/
         PPGBzfhMnfgsdak7CzJVZs6XQeDNbomv6gB2vKKDi1dRbfSiPqH1V2E9cL1ldKYfZCfl
         Q0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779663777; x=1780268577;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=;
        b=OXFgndUop9DkyItpAI4rGYpALQo2GZK/rw6FLtgC5iqZ/RlKoWK/upSOX2om1L4BAo
         u0/d0dyge1ff8/FIpsVw5M58v75Meb0s4UV/EsWE6mT1amQ8Dk+lc7+X50ex2SiOnLJY
         kUtoUDVYpQs+C6cmw4CEiQXTti+QbizHXNJrdydM6O9E4KHH1mhoSrH96zM/DfEKe4Op
         yw1PnGfQnGRWjcauyn0o+1KhwdMFzVI53lZqHVXzfYBR25uf+EvHlvO1bbDK52YdslnX
         2QQVn/DOpbAtP2P/VCwcaVpTuS51HH/jDgOuhG2EFqE44iAkOsrM0i7KQaP8AtMvGq1T
         YI/g==
X-Forwarded-Encrypted: i=1; AFNElJ+2A99NqEJZs0IjYeS4WSS2I2G/rq/QfH59qF2Omte2CJ9WTnyC6IuO6jS5KjLmTcdeGWKYS3QGgSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKxFj+cwEvgllhnXUC1nL+swAGocEdVK6AZ8qMfNPoz2NZn2MT
	Gtr8XAUdgWS9T8wxeHH4WaFydfOZobZVOeeU2y59z58uuYxEwQbigHuRBlGWW/xgy68=
X-Gm-Gg: Acq92OFDqyuSXZQJpJYiCPcXvHIq0Rtb3/uLsVAP0Dr2pNqiEogl1NQYsGTqqMqDMI2
	IAVHqojKJm8+a900DzKuaRddzSOSUMgA+ySuoQ5SC4tDPJZGgb9Q9/LG3gNycpXsW9Nzy/j4zhR
	W6FaiZq1XLfwOV1HThA05mlD7fNMAHtYlmcpoXzY3j+yclc1tQYfTX3fkE0dmXh7EPtwmFwQoi5
	bmjL7x3JpA4UYFkO+zuvw6+hgHPKBgdKXFfMxgLl6toZkFid67De+uj2cUbwEP7Er/MYm4bUTNx
	ZUOzoT34W6cjbNqzrS/iuWHXYZqHopqEEGq61G7sCI7uIl6aqhuTSvQJIMBB8xYZhePZ281Wr46
	VD9bQLknr9liiCSm1vx2jsI1uGbOBmWcP3kHgfbJi3vieEn5p5yrEX0NAbxT4A0pwNhMw9D5gND
	1LZdwnzjaCvRkIXrw69StpqkoeIEkIL0cghdf7LRB5QEn4ZeGETJluKlMFqx/duQmPSpQ8dkwoz
	B99rdZXyKipVA==
X-Received: by 2002:a05:600c:1497:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-490428d1551mr125681675e9.22.1779663777178;
        Sun, 24 May 2026 16:02:57 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ea134sm232108475e9.8.2026.05.24.16.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 16:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 00:02:55 +0100
Message-Id: <DIRA5NR89DKG.3MFIRU9TB3NHD@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Peter Griffin"
 <peter.griffin@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <jyescas@google.com>, <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
X-Mailer: aerc 0.21.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
 <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
 <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
 <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
 <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>
In-Reply-To: <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>

On Thu May 21, 2026 at 3:49 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> On 5/21/26 4:37 PM, Alexey Klimov wrote:
>> Peter, I agree we shouldn't bother about hypothetical SoCs. However,
>
> It's standard kernel philosophy to not add code that __might__ be useful
> later.

No idea what you mean by saying standard kernel philosophy but people
do add code that might be useful later. Some examples are:
-- ftrace subsystem;
-- commit eb2415854f3ba7d95c4f30d259f6f598ab604616
-- commit 78723fe309f189ee4010d5b7a55f6a14644a40c2
(if you so fancy about debug printk)

We can probably find more examples.

> Please consider adding that print when you submit support for
> e850.

Support for e850 was already sent:
https://lore.kernel.org/linux-samsung-soc/20260513-exynos850-acpm-firmware-=
support-v1-0-3858d097e433@linaro.org/


It doesn't matter now. Krzysztof already accepted ACPM TMU with error
conversion variant for gs101 only.
It will be nice to see ACPM that is more generic towards Exynos/Samsung
SoCs rather than gs.

BR,
Alexey.
