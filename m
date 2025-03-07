Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3BC21B9F6
	for <linux-clk@vger.kernel.org>; Fri,  7 Mar 2025 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741357792; cv=none; b=B+rgsZBRS8gn8oXVTd4M4LGKcgYdLm/GYtTBG5ZsYcrKnCew8O0kfag4b8sarrnXnNYrOwzgZJIYiCzgcinO/NRIL7iESPZx1rn3yNmy9x5baXW+hzssjirz123RmT8NNWQU/6MWh9kBgktBbTeGaw4IyR63LYLoIvdEmGAQjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741357792; c=relaxed/simple;
	bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2NOCfa5d92ClBmHu8/UIapkThn2+SEK+p++HbXADV+E36VYQzBJAnV8WfrNaU4laEO/LAh0FxVSmJ6u5XPnXgkSyThqhqShX6/dKKgc06zrYbVP4hDFt1CXKqEutSX6DRX/X+r2/kioYTqiz+kwqhcROYsV5o+ThBfnhbODyig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z17HDPYr; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z17HDPYr"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-60009c5dc26so1035880eaf.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Mar 2025 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741357789; x=1741962589; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=;
        b=Z17HDPYrBl1PNdX/ewmZy6IdED9fcVJZ2LQkj6dpDn9tW2uD2Ow9fF++eoNxZo84Vh
         ZGaC9ww8Wqn3pyxx6TTVirYuSUp2kPjY7V2aWQGSuhh5/k65CGGE4ueojhqEI488Jm6Z
         PlneGRRs8jGrjY8aCmwdeLUSuQZqWATgYzLEFjpqrjhP0xFOf4mfD3CDa6OH22x6n8mB
         z8Id0jYHdeHZ3Y0iIWD17y0+tOyu0xxZ6P1AOuzDbGQ8fMSs7NwBQZc/cMBrbO769u3k
         tygQ0wFkeO/I/nqpMzZXxcrnw8xPaqZImG2litFL9HhkY6MY+KDy2SZf3Mzu4fkIQTM9
         Uwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741357789; x=1741962589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=;
        b=Jyx2EcnY/4wASaebCGdP1BGgv663Zsag0+UX01G+Koe1Pq5heBuV971qY+V8YT/Aqz
         dH2EBtVpbvZzUl5lvxS6zWZ7aMGBz64u8OWdjX7EwHDIrbk+Q/h6ksyl1IvXOCB/ya7K
         R5lledT9giz7LR2/Lt9TfF/ktBQngF+9rvjA3Kr3VplHKSU4ZwgnF3+BV3pGUbTi8qCx
         JwiKD6v62tgm7GGDJxxELY3h2YG0wg022Tln1X3yevsLPGUPmmUvz0bvLjF7iv/ZBI7T
         qfHhAIJUXBqyEikaFixfOd8TUT0HE+3MVidEM8ahyvJVlkIXWJSRdrhmY+DzugXEAcMx
         bVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHLvCPl8i4gVszmuSnVv6ulvviwA8UL7P/pF7L77Yg4Y0eow6Ua6EBwugqJEcMmib4q7NcL/Q5KYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfqo5JeNVFafGQTY+2C83CXdv5wT7dp7yCDYtmJ7EP/4+CtQ3E
	wmHeMBTl4PdFs85mFKVIC5uPVmrlXOBqUX5eGiZ/nSZUWqf7tVhyIHmePZXVY2iBWGGAgfe5mAj
	MnseWa2ecJM5BvIQejvsksN2sTK33s9YSympajw==
X-Gm-Gg: ASbGncvOyJ+9uc0bDJWOni5I7vK+mTeWvBJxJp4b/qUVtuXhGrupRAM72461suAGLMs
	OBjose69Cxhr+CTJUS4OfA/PjEXzDjKVmZW9Yi8HYXZY2ce2o9S+YIsPHm0LwChMqPFaKMDfYFc
	I1CtL4sHXb5zUQni433XV1BY5nol0=
X-Google-Smtp-Source: AGHT+IGGmn8xLMWajxv8ICMHuaMrPUNcMWpzQrq5wZQhGe8IYs0letUmBAshmOVmzeAwyTeMZx2VSjL3a/o/8GUoJQw=
X-Received: by 2002:a05:6820:2709:b0:5fe:9fed:f391 with SMTP id
 006d021491bc7-6004a78b8f1mr1708857eaf.1.1741357789463; Fri, 07 Mar 2025
 06:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
 <20250305-clk-samsung-headers-cleanup-v2-2-ea1ae8e9e2bf@linaro.org>
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-2-ea1ae8e9e2bf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Mar 2025 14:29:38 +0000
X-Gm-Features: AQ5f1JpUppE0sfHDV86NNTwKvteo5ZV6XyAd9bvAyX6uA7UR9Otm7vbstJwPknw
Message-ID: <CADrjBPq3CA97cGopuCFD5BrPH8KnM-rsi7vMC3w285ihNDm40Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: samsung: Drop unused clk.h and of.h headers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 20:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> <clk.h> header is for clock consumers, so drop its include from the
> Samsung clock controller drivers which do not use the consumer API
> (there are few which do, so leave it there).
>
> Drop including of <of.h> and <of_address.h> headers for all drivers
> which do not use anything from generic OF API or of_iomap().
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
