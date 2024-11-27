Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0002A20012B
	for <linux-clk@vger.kernel.org>; Wed, 27 Nov 2024 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732741021; cv=none; b=FSUuYF4oGc47RplsLry8E8ac4S/Uu3Z2kgy3BY7HGRsR3UsaAaL8fbwpnJTALubvA+S212Cw+WE8lZpXUWCujVl4v0Fo8gVIUIXrJiraVx8AA7yeKnT8nlQpTlWGNR91kDZfjEkq/H/LNI7yfGTOIehEpvXxYuxvsLVV5beVorU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732741021; c=relaxed/simple;
	bh=r+RoTo5J6nLOhM3VtnIsWJC19xzClak7aHPvKpdFM7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dJIj9PmJcWJ1aRqjHvh9tUIyqdWeOaueyvExwXQLh9ewQSKj2K0I1YiSK7mh4jEBspGh0D9N3CBJ0e3yyHdRKLSOjJsidBN3EOz+KOFkRmZWDdv/vBz+p9u7GwivGyBdbliRd98w2sowcrB7T/N7SbHDe5EhbCXykkV8kUfLzTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=T54OfFsu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="T54OfFsu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso666055e9.3
        for <linux-clk@vger.kernel.org>; Wed, 27 Nov 2024 12:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732741016; x=1733345816; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7U9hOswjkTlIu0eHpVW8cvTyEAZU1a4KzVLqKR0PK0E=;
        b=T54OfFsu1CXi4yy2IhuWtAmRamzIfF2whrQlEdnWfWgVg7nAMnaF699kCVz+1AQHif
         N+iWBkn6ISr4KolYyDmOKycMeUu6OFIMLqVaQae6vJJ5BTay1NR+N5wUM+iMB8u6C4jQ
         JmlNoO7q9ZjmBpYECCdOBSjztaCKKZAJnCuWZYvyd9Ia8J0Bkl7HhvL5/7hF/9NlXi+Z
         HUpJhv2fEMRMNgm7zl7ewLwjhe6ybaDGMptjEI8U5x7o2VJO2P5e/++NQbuWS3Db/UFi
         MHRzqTPk47//efTvI0h4MCrhLP+i4HOZirWoebYSvzVc+hNBwHTDcRWLFGJlBP/fD2AD
         jNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732741016; x=1733345816;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7U9hOswjkTlIu0eHpVW8cvTyEAZU1a4KzVLqKR0PK0E=;
        b=Pb/+OiqPS4mP0mFouQQ4zJP1rkRp+YdFOCYTDzR36cqYTa/xa+p98mzLCeiVuIzTlR
         trOV+Zskxukn5rtIGbLkUvpxA1WVcaFSKi9yfHDtCZgXZP22GUFkOgdW4ii5SZK9aR+h
         5MJMy/zqFQwQBPTr7DLHkuwznUlcSyw3ocdkWxNOzNvA/1bngabkelELoH2GAl6eVl/X
         suj2IgSQpGylb8FBPu2YLG/SxIF6niSn8cCFd9JlMH55rgemceRj0PBrrOcSuOehTmqJ
         90/vqKVN4QAQc3F8d0k+Z+/8FKv6IfTQtLSxGjno3rXaBp3PnN3cG2ah8dbHOxSSDjV0
         zr9A==
X-Forwarded-Encrypted: i=1; AJvYcCWovfosR2mzqH7Xgkhoq2hFKvxq0Cuo6xvaWKZlUT9/nTM4oEfF9CQeRkJ0UhiaDDE0eJPKRx0wusI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6SprgW4zvHnUhGBWqvwaBvfRGJyW7e+qCUoKjWw4WKAL1Box
	ONDcFg8nHowNMiEvD0M7jWltNSDQaaxoJduY95VOd5TEU7e22ympqPqtJhphGtc=
X-Gm-Gg: ASbGncscf+50LaOKfHON6eH+jfcqmahilmFVUlnvakrLosfW1o+0vh7+coZCiTQ5ECN
	p+13W5E4GPhIrgiskm0xn5ALHV+xFLkhJkMm9GCxjH+cq1kDVQhmdgP6NM2ZpLis7ykKw8eJxOw
	/XU7LOo/U2d2pclnrbfeuIQa775URQK4KoQ4LaY9OQD+LiUgP3ce0uGmtQ4vmOTWPOQ7ofrTbXZ
	Lx4QxCTbKiEQb3pEB0KQ83frGE9H9kwBMpeXeWciFz7zxVgKw==
X-Google-Smtp-Source: AGHT+IF9mEC2PpHHSEE4f/UbbHmSaSloRZU6SDyajUiQ4Pk9pvlFm1bVlT9XTXNm/2ABjv1LiTOqoQ==
X-Received: by 2002:a05:600c:4e8a:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-434a9dc3e80mr49302555e9.10.1732741016193;
        Wed, 27 Nov 2024 12:56:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cc06:8990:4fb8:28e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc91sm493395e9.9.2024.11.27.12.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 12:56:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 27 Nov 2024 20:30:07 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 27 Nov 2024 21:56:54 +0100
Message-ID: <1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 27 Nov 2024 at 20:30, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Wed, Nov 27, 2024, at 19:47, Jerome Brunet wrote:
>> Depending on RESET_MESON_AUX result in axg-audio support being turned
>> off by default for the users of arm64 defconfig, which is kind of a
>> regression for them.
>>
>> RESET_MESON_AUX is not in directly the defconfig, so depending on it turn
>> COMMON_CLK_AXG_AUDIO off. The clock provided by this module are
>> necessary for every axg audio devices. Those are now deferring.
>>
>> Select RESET_MESON_AUX rather than just depending on it.
>> With this, the audio subsystem of the affected platform should probe
>> correctly again
>>
>> Cc: Mark Brown <broonie@kernel.org>
>> Fixes: 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency 
>> on RESET_MESON_AUX")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
>
> febb5d7348ff07c2da0cb5fd41d2ad2607e5bd5d..ea16bfde0df2d7bfebb041161f6b96bbb35003ed 
>> 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
>>  	select COMMON_CLK_MESON_SCLK_DIV
>>  	select COMMON_CLK_MESON_CLKC_UTILS
>>  	select REGMAP_MMIO
>> -	depends on RESET_MESON_AUX
>> +	select RESET_MESON_AUX
>>  	help
>>  	  Support for the audio clock controller on AmLogic A113D devices,
>>  	  aka axg, Say Y if you want audio subsystem to work.
>
> You should generally not 'select' a symbol from another
> subsystem, as this risks introducing dependency loops,
> and missing dependencies.

I do understand that one needs to be careful with that sort of things
but I don't think this is happening here.

>
> It looks like RESET_MESON_AUX is a user-visible symbol,
> so you can simply ask users to turn it on, and add it to
> the defconfig.

That would work yes but It's really something a user should not be
concerned with. I can follow-up with another change to remove the user
visibilty of RESET_MESON_AUX. It is always going to be something
requested by another driver.

>
> I also see some silliness going on in the
> include/soc/amlogic/reset-meson-aux.h, which has a
> non-working 'static inline' definition of the exported
> function. Before my fix, that would have caused the
> problem auf a non-working audio driver.

If by 'silliness' you mean there is symbol definition for when
RESET_MESON_AUX is disabled, indeed I guess that could go away.

Thanks for pointing it out.

>
>       Arnd

-- 
Jerome
