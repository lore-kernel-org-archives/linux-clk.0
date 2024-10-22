Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024EE38DF9
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729589779; cv=none; b=FqsATGHNBhsk2aEz59Hcq3Hu7vC8B+o8WACrIlTSRIsN/ybcdC6Kzrg7xybZOVsm5ltICPXmaRhIYvDh+fvGcJ2Yy3DoIKT9hCCywfwpdLs/0xIsm9HQPphFn2j/o4Dyh4NXabVF+n5SQJbFmvXBgwxNkoJmpdn9PTMJ1kw8lSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729589779; c=relaxed/simple;
	bh=JUOkRks2mm1sbrP2WS4gm3Ys9rxBtJEc0sENLr4gzhI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DIZ8vkWhr1RMrN0Y/WXqmOEeS77i2ZtlFZwCh9CmUBQVKF3w+Cb6XRlc4I8MPpojvcdGOs5Z2z4EmoABJs7XYJU370s3GcFhKxGMcwg+olcjga0YI3bd93EQSJj3KXtGDaTNQYfohMpHK8v+LVbz+enhi1YFw7lX6vyWmLWumFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RI1jebYl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RI1jebYl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so59376795e9.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729589775; x=1730194575; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fsVQUcARuIWhOcGodmkDQEe+tag8Qx5PkTwvtAzDek=;
        b=RI1jebYlmAC0GLK6VhLPfuTn43nTawY+GS1HBE/oE8V8z8OA587kWEqM3MNA3pxrTd
         og788sRvzxXTa6DnwRpi37QsiIJO330f92AcA46e5sLAa8cYXQYvEVfJVWTvrNvYOBaJ
         b/ghQYEhVFCMh8lIUxqxWKJy28QR+1hL2tgnrsynb9u8dfpLxNYTOv5D7dsZ1ZQnUgeG
         Uk4M9t1FAyO4f6IkBqD8pUNjJ+5favqUmKn7tyU5d6h5VyqFlUMpHjLr09IrUGAwIw2X
         NInb1NtQol8CvoPwbo6WbdE95hDfcV8H2CicOJo2+LiChb8x1mtP3S2opfS6LELEZZbU
         Misw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729589775; x=1730194575;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fsVQUcARuIWhOcGodmkDQEe+tag8Qx5PkTwvtAzDek=;
        b=tKBCBFhSTmjZYYSJd7CZ8U4XUBoOGHIxwd2uQ/xcNxQexdSciMrn2Dha+hay05GPXF
         mtdAG83MyfSmWT0PMFWIlzas3O1a9jMZ99VZjXSGxRueRjdvdkvpTwT3AkFw0+MLX5mm
         xnnosBS8wgRuSIGzPGXTPELGZhAHZj4aAHwDUl4hziy29P9ZVlt5lcwNcw8gsrpGaVgX
         7ubVfMHuHowW92iogX07019Wys0LdraHCwOyzDybJpkCbhKrnvvAZReQ1JT+wayCDgTB
         wyFx1dPPtyBGATNrds3GlnpLKO3vFtydlNZRZRbuXfu65BIikDtgZoi/obbIJ6TPB7Un
         7b9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+FKlVkmbi8Yl5PxXWHTUO8A4Yyf9o2z1IsP5/lwBSG7XM+hLE0S1lvQ3rVStGU/DNcfOItkC9FvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyP6VdhtEPy1BGZBJh6FmP0eWGYVgD7u3A2MJ3KDz5OqHtzgyy
	DG7MpThYlJb0H4X0JY5nJqj2u0Me2m27/81bzLr4QUpSGbdyOyez7+1x7GdsdoA4Yx/Ono2dUth
	8G0w=
X-Google-Smtp-Source: AGHT+IFMNwrhj0pJZPkzl5FYhTMDlK96/nSoyfy8b25ehdKKWw+4jVdDPhgV4SZ5tiGqcKSkTMexjA==
X-Received: by 2002:a5d:6b90:0:b0:37d:4e74:687 with SMTP id ffacd0b85a97d-37ebaa7a72dmr8620512f8f.41.1729589775370;
        Tue, 22 Oct 2024 02:36:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ef1c:ae40:1300:20c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b35sm6249649f8f.2.2024.10.22.02.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:36:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Philipp Zabel <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>,
  Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v4 3/5] dt-bindings: clock: axg-audio: document A1
 SoC audio clock controller driver
In-Reply-To: <1jzfmwjxbp.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Tue, 22 Oct 2024 11:34:02 +0200")
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
	<20240913121152.817575-4-jan.dakinevich@salutedevices.com>
	<1jzfmwjxbp.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 22 Oct 2024 11:36:14 +0200
Message-ID: <1jv7xkjx81.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 22 Oct 2024 at 11:34, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Fri 13 Sep 2024 at 15:11, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>
>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  .../clock/amlogic,axg-audio-clkc.yaml         |   3 +
>>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++++++++++++++++
>>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 +++++
>>  3 files changed, 154 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> index fd7982dd4cea..df9eb8ce28dc 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> @@ -18,6 +18,8 @@ description:
>>  properties:
>>    compatible:
>>      enum:
>> +      - amlogic,a1-audio-clkc
>
> This controller is missing aud_top clock input coming from the vad
> controller, AFAICT.
>

You are passing it thourgh pclk so it is fine
