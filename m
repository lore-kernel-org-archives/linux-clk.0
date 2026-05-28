Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2503C6611
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964915; cv=none; b=ikfKlXwFi+0TNS5GeldjU7hMD/XQGwfGXGMBvEsLodrq3VkJ8bnuQTw8JFyrcRBbKrpe7RWzLWGcKXelbD1i/Nuta5/RKPxeQC2DXKgcIfsYk60anm7S15JQXuJHJNU9HOUwT8uXgs4VbEj67CgM/ELJkD3WuFhr2m6ndMSsmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964915; c=relaxed/simple;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NiWX7dZMjzZt6FxlYtLaGBtYG8e34j8ZyNmoFqv4uYv3m3e0FdQ59Z/MjgqQtqY3ki8KQMjYFeesvrsCWFP6kJQQHOTOSfhFuuGN5qfGgMCXlaKR7ymLezAM87wdY28+eNKO5bVASSKWqMP6N9NP/FOq7mN2fShLs/DGmP2Cx7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMcdwc8m; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMcdwc8m"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903974854dso61250185e9.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779964912; x=1780569712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=HMcdwc8maOZHY59zqrew6I6AEx8MAPycUDCXaAMnRQBU7ni0iSRSxV0He3YhlcLb/l
         GNae1x97frGoFW7TN02zbiyLBbp47m5JFwnCHItM7mXGhFj1iBxxqKL1NL6RyBB4Kp5O
         f+DtYNB/I+3XnXuT7GR4LTdvu6xZM8RCBBKvxL4bjK0JOHnCTLsW/lOSrd+OJoIdEZIA
         GJYJZJNLZ1sluT3f1QHEDI+hCByK+HxFbZQWChLYcrPmY8ow4T0z98P/Mu3gOIb1kUme
         /1JIFcSea9/55H47jwQgxs+WpouxPAgFPSeyF/EDw3NeGy1f7/Dh8RTVnP8Zlzrw4FlU
         q/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964912; x=1780569712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=Jr4bJ2QB0x87SMFjX/rQFZW7u6DyvXMk/ZrSXTV9+f/mQbbk+VCzNuHpQbcBCnr46w
         TgSEsntAmVBk2wXMdUqK86XBXX/IxQ7pXcc7w8A0eFbkmls85quzuSvx7BS3H3cm+vsf
         K84rs1DGynby2WvIfxoanNiFspBvAhUoFYWp0AN33WJv8EYy42UNnWWHXFJHGQRgf2nq
         INwZ57y8qYEUb8PBOe36rL5M7acAWs7h38SNpTIuWxN9fn+9mEtkC+v94sx8mUX00zhs
         wpLMnrukTfOfwRwbhTUUGzUdoWkhFT0sdmOJvkASyuAVLjcoxUIgZap5qDmKhX2QehRf
         cvow==
X-Forwarded-Encrypted: i=1; AFNElJ8tKtGnTgASljmJzn7+602cBHGFTEaIgsuYra5xYbfi43OehWqwefkE7WMkTgC9MZVTrPhaR7d0eRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxF8sycAsGtOzi8o4ONmDAYsCXvXrgPK1uvjjuSf1hCRsYtg+x
	PmOueHmCqMec4pOqnDElW688dBw6x2ip8ZxKUJXxT6d5RV/0ia3iOm+bK/d89kIwb2I=
X-Gm-Gg: Acq92OESYp6yZZ6avNCJMGcn0zQVtUyFMM73pMD5uV0beXSowWv8YC1cKVzPXeTepid
	DhgX6jBiQ5xfihlqimrpmaF6UbOVAlbl0TVUtXhAB7+GD6KBsNPb7O5PwrTIxD96yfFAPBxH7ne
	Stwkj19L38xXBd0W8uindhErZluUpbY36f2JHOwWDYjru+hZr2A/VIjTvKFfrOidBNtgUFzb+Ym
	Hol9zX6zsZ5hZ4gUD1o244uyOG57ib61gz390YvOvLncnvFDkgnhdWNDkw9hunEPtG/UKHBQstE
	+vXs1xE0gz2LFn+RNi9JNuIyJLndQSy8BQI4FcgL0AKGdxj8emrW+e6Xo8pIxwuIDCtte60ErJ9
	hE9lNguHwc00hEaP6XF6jth9KSnNv1eTJSXPdWoWF/OK4xROLkc8G7PwhIgFmZE2ud2dE6tS//2
	i8JCEv+i2ufQXHxxV6Lecz/AsAgYNFEvhLHYn1ch2Ber6Qg5Rkh0tP
X-Received: by 2002:a05:600c:81c5:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-490428e6ab6mr404500895e9.29.1779964911807;
        Thu, 28 May 2026 03:41:51 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235f8c3sm31076365e9.2.2026.05.28.03.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 03:41:51 -0700 (PDT)
Message-ID: <66423f14-b34a-4cfc-9bf6-0bd1da4a8d1a@linaro.org>
Date: Thu, 28 May 2026 13:41:50 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Brian Masney <bmasney@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
