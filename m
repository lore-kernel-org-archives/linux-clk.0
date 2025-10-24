Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234D2EF67A
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292401; cv=none; b=liYWUj7s/dFaLyEMf9JOg3bAtoX5yDPQRPkFgmhn+N7Msz3nlGTAFJppFSE3vPaHxADF1QYMunWJ1KmQiokOmkb3dlwOUnATtACgdEYG9GXsyGPx6LfwRxKJ4XHagWWr4uE47F1FmG47Gj24KPNl7U4dM9xoTdWuWVLm4Z7cbRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292401; c=relaxed/simple;
	bh=baS/xmN1afHN7ZIoN6Jk+mJZv/3sAIH9J9qIFzyXYT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKPrLF8AvlStcJ5UfUt3Cd7VqhFuTuDhYhZxsI2BUHKXrX1nNBGcbkSyZiE2Fj5uZjWgi8BoPfjRIHmFDP0gg8JK3ehcJRCOYA5yJz8hOUS7FWd2M6+vGuxP9qvhxIXh7pNHoR/S+zhdaiULENhA3DCKI49cIdCCaEJYxJi8OZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ARlSQO47; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ARlSQO47"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-586883eb9fbso2058876e87.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761292399; x=1761897199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baS/xmN1afHN7ZIoN6Jk+mJZv/3sAIH9J9qIFzyXYT0=;
        b=ARlSQO47Kx2JULorLWy5YGjcpS0MBv8nZs6fN8fmP93zXy9glLictG87WBsE3V9rlA
         ksYqAzidh8y4z+1A85vA3ItbvnFYhNLPCwPupbp0H/WpS3aA5M0KhSMm/uCru3RBehYI
         YR7vepYolPTh1tmg0TS3ygrnxs2ETQ0DktTLcyxaklT36WjhGWoBCCu7O/oWr8RZ6NPJ
         VVxNl7V1huUY9IzaoLeP70uLfXwtbpGRV9TkGIGyL94HW15v/ikVnAY42VfXNr6fXdQ9
         P+sRIvscDPEQI9nHqllg+7QLpercjDanllewfNKB8pjclC4mHtpCYtVWBgTXEG7C/D35
         b4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292399; x=1761897199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baS/xmN1afHN7ZIoN6Jk+mJZv/3sAIH9J9qIFzyXYT0=;
        b=UuabPtBcXxK42No05QsqwH2iuEWIVjan5jGfuV4kK9Hv2H9PzrTP+B53DBn2WeLC+I
         1n85qCPi8Tu3lPd96U0p+YDuECT/RF5ziC9vlaLPOht6MFa+tB1zMQ2QJE6v8CCO2qZA
         3MQ1HAdc86TfUrgQBsjXwhik1GrglvNMRF4nZ3y2b7KgiQn7raEE+N7PjXG006i+Ndjj
         J/4ziC3eoTKPeLKJ3ODuqvCBxn24y9ploVYXWGpybcXVEWME6UeO90izQQMssLLCCs3t
         l1mKo8MKd4rdg81P2PQpQSLQbHIiN/GS9T++ydqgYvWqQ957UjfOnO/TFytd/B2BXg2N
         YxCA==
X-Gm-Message-State: AOJu0YxDb6UHRnMTf0OKtQAjDW7ArDYvv1aGWGFjsm8i7VyemtkLfbQV
	qEAGgFVKT0BG7BAnvr7akUILoyHT67QLixKuYvbht/s6fAeMUAiSqQp7gVLqQ69triqWFKX5cpR
	hx7Gy6f6m/mQm3fANuXTAHQg3KNRk4MbljqLV9JJsBg==
X-Gm-Gg: ASbGncsVivPEX04wOI8ZQ37SjXpDxncBnThnwjGFlhxG3V3Fjygux0YSBVYL6vjNgH/
	srkrzPyfetrzw58vsMVP/u49wz6sBYREx6FNaVMm8nRQPhHErueUhR8VRrE4FC6+5Klv4oSwOnZ
	f2YoKQuCdsLzPvTSyxjo60v++X/9mlVPCa0eROUlGNfvUs4dxu3+5uLPOa8wMrTdo2rNS9d7O/D
	PYtR0KhSLTRdr6gjkZth8Wd/muffROEpOS8Yw2cJHcJveDerMV5piO+Yextvbn9/HB1ESapmFN3
	38CWpdJNgdtNVFc=
X-Google-Smtp-Source: AGHT+IGLGk0fXn3vmGVTBNK6NoSKgzCV6+Rz6vUlmj77EUkh410dDNGZpOHVJgO4AhXqGRzonzBZhJr/uIBSFcoY0zw=
X-Received: by 2002:a05:6512:63cb:b0:591:ec83:3183 with SMTP id
 2adb3069b0e04-591ec833258mr3106674e87.57.1761292398605; Fri, 24 Oct 2025
 00:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-da850-reset-lookup-v2-0-c80f03831f63@linaro.org> <20251022-da850-reset-lookup-v2-1-c80f03831f63@linaro.org>
In-Reply-To: <20251022-da850-reset-lookup-v2-1-c80f03831f63@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:53:06 +0200
X-Gm-Features: AS18NWCoAVoOc4wSbv14WvrOoWzTP2HkTyxVK6IjolfhpkHHqgTJR2dj3PrvuxM
Message-ID: <CAMRc=MeSQnEv3uz=nbz8m4cTKN4oCztidsqYfZE+zrXjzQonWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: davinci: psc: drop unused reset lookup
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We no longer support any non-DT DaVinci boards so there are no more
> users of legacy reset lookup.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Stephen: if you're ok with this going through the reset tree, could
you just leave your Ack here for completeness?

Bartosz
