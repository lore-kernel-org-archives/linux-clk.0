Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0414EC6F
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715075024; cv=none; b=G2NFqyQucyh65ccgTvVkpeU9WEpZDg1HnYDWMPGKH+/M80N86wHdDKt1u9qrrQWJehYfQMNUbs/8W+nXnujzZ/kLmiGhErDLlGGC1RaGtvttbFJXKAsGUwTl1kImFA7sU8LZS9YM0T69OyMB3oPSjBULAh+e6ry5vDyE24F0Xuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715075024; c=relaxed/simple;
	bh=TIxu5CXQag5vSF552a9NObD/7GpXLUkpUNqx8KK1M5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9PqIOKBd65Wh+B5J9K21ozs4RtvtTQNR2grR2v4RzcYjfWR4GC3eowLtcLFlyDC91E4B7C+YfUDbvS/G5ckgsZ0FTcF1qNN4zayrklMvVLvmEvXiurmv7sUEvCApe3fDlxQbJiFZPLbiIFa20lfiqhxhhGqrkO3rXqp9zTEOg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbJ6et/U; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbJ6et/U"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b2089a8154so941800eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 07 May 2024 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715075021; x=1715679821; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WAXawuu5D8QQ2TYYAPKkUCb+rSNneu0ioxRT40xBXrI=;
        b=fbJ6et/U+wc6TnrYH7HV/d2oc2jKp9K1xcbdpOypt0bcip/CRScFoVuuX98CInMHkO
         uitpafeR9ZD0a/+b2jzpe6l/TchfI8hMGwEFib8s/K2NrFUwSsahE303GgB/Spe8gAIO
         /Q87IgDf4Wjtt9ubfcFAXszSvzr6tmY2EW6lvBPopEIOcUDRbnddx8J46+UdkzbxvUql
         DEGmxTIHL65yzLj6/44xW9ukc7lLnu/t+dzAemfTrXufxOa2IsAA3FNDRGTJlZQDF4yJ
         Xn+7dyWjgOIspa7E5FOEKyTq+e2M4XqlitrTJ35q7QjqnoQ8xqjB+WKcbpPZfgabozKH
         tEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715075021; x=1715679821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAXawuu5D8QQ2TYYAPKkUCb+rSNneu0ioxRT40xBXrI=;
        b=adZMBLSmkmsV5W5wQ7y1gAe134Yc3VADXRVY+SR4MZFH3X5CS535Nh2Kf54iK+zDx6
         WRBmrp8p7ZIy3L5DLWKgZCcfBYbXJ1uO1n/1M7KtvPlytI0Tzs5+LAwd5KD/jFX6lntC
         Joytt7uV2qIBnx5kuppE12TQR3t9IlmECzV6MaxzQdqLvwFP9hmyuaxoSUmjAKsS1Oae
         rhz9RbtuK0su0mNVBM356ziGpCPjeHLBzwfz8P2kuOpbQoy+QJ+mxbc0fcO92W4ERtI+
         BjxCOYhjcwM7EVJ9Jw1fO2Yp8IQOxkCdp4DCzjQ9u+bu+5+t/QSDsO0IyFYA34oR5Bnw
         C7gw==
X-Forwarded-Encrypted: i=1; AJvYcCW2JKb1As0JYbpmQ2i4LoKLjX2fnp9uvtXgu08wlhBipGKazS4FG4U6hd+G92ATXQcPolS+YDRYaiGoo4isgKIMUXQZvQSpsC0E
X-Gm-Message-State: AOJu0YxehVv+MfYtfQ2soBEjktaIMwr6GKHg3JtPHy6yNd0Qha27wZDr
	zKMCpPxiofUVnrSQNXEtsQ44+Jht3lnfQZkzwKkw06IgPoTO0ltfUHEZBlboUn5HMYDOCWzroy5
	f1DTteF5s8zxes2KvyE/Bft5IJ8pDVVLZPjq6Ug==
X-Google-Smtp-Source: AGHT+IEP48wfgx6CdP8hMqXLTcM/sINVEeKxbBEY+Ym2IiGsz9vT7W4IRWdx50FNfNNMTo400zHDOCxwnh6BJm9rM78=
X-Received: by 2002:a4a:5ac1:0:b0:5b1:b8a4:bce4 with SMTP id
 v184-20020a4a5ac1000000b005b1b8a4bce4mr11914180ooa.8.1715075021361; Tue, 07
 May 2024 02:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 May 2024 10:43:30 +0100
Message-ID: <CADrjBPqp2ZaB0_J-rAZ2+A7BMHjW3o+rYSqMFgpdcbLausqL3g@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: gs101: drop unused HSI2 clock parent data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 7 May 2024 at 06:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Drop static const arrays with HSI2 clocks parent data which are not
> referenced by any clock.  This might cause -Werror=unused-const-variable
> warnings.
>
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Closes: https://lore.kernel.org/all/8bf65df598680f0785c3d6db70acfb9a.sboyd@kernel.org/
> Fixes: 093c290084a4 ("clk: samsung: gs101: add support for cmu_hsi2")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Thanks for the fix! These are actually the cmu_top parents and
shouldn't be defined here. They already have their own definitions in
the cmu_top section.

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

Peter
