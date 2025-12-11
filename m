Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D328CF4A
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765441845; cv=none; b=GpkNvAnb29KgJsYB8WoiTC/I+3m9gdigtRRUxAiVpXXLsUISzcg0rFqkWRBKynj57ybzXcPIOe0uH8qTJObKgyplVknxB8Mv8xLhwfRl7P7FvxE6CZathzkFJng/2iCjQ1jWABGox056MjSQci9JTyJb3vT18BYaXb2TAc/uWCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765441845; c=relaxed/simple;
	bh=2mC9PgXNY9QTBORzPH1w/03HrdoLFJe2TAO3uEDLd/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f0GdKPiNF8xaHsE/OdUw70SUNlZP6NzoTa+3tJvuevJwzdVcZLDAkdLrH7WwCXiICv6X/PoAnZrbTp0Gmu8rUmbpRGoYTcHMTtj3bxXnMgnjs9qEZG/6ZZAc+Yi8wilWa2Z+w46/hKEPOAS0XdXyPCcZEPLlDPvtnLnbhORANnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XS/f4Uw/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XS/f4Uw/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42e2b90ad22so209292f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 00:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765441839; x=1766046639; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2X9fr0ZGqhI9r7USka/MTvJqmePaDtXMWQ0HxFh6CQk=;
        b=XS/f4Uw/roe6COT+k+QkbddCQW/CBBJOQcUd1gJrZUXYg3D8Vqmwpi9lyENaKj/8vi
         ss+Xk/wRPCL5hTdm0drTk0x6fWw/T1520IE+x3y4eX/Qk2eYFSMgHBkZnrSw2E1ifUQu
         Qwf3kMEYcbpDzNWQ/jQFehV7pC0jMuPixqvAQGcR5PjwkFHzH7As8zz3raWPu5AiVKGY
         +nELftZVO5SQavx0WXkLiqUiqbxqmd06V9s+y6vTSlINXoJn7bwTOPIMjWUwNUv5FUeg
         ZbVxpyUuzBY9Y4yJtsFQk6kJyNLVvfUSr5ldsSRiEmXprayio9gUGCZnFAxM1llr+FTM
         Q2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765441839; x=1766046639;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2X9fr0ZGqhI9r7USka/MTvJqmePaDtXMWQ0HxFh6CQk=;
        b=ZJH0kTTW1Nv175VkjDNLf/DdSwg30OEUHmyD5eHQu4LHD2d7w1+zE8Xdn1BQE27uDK
         /07cQ8XH/SZh3ycvklcx9rWPTGD+jGJ/CDrjyEe/dWK0zJrJ/zx85T9HixTz8BcMujzc
         A5lYDv6mPbtWUnlUQ6S3HHQkoITHikrqAk7DS5mIb4VWh1d9711Q/3as5eZpFTdzrFJm
         xta2e1R96LWf8LMfelKyD4EvjjVvgjBFYnLR+bjwGm5WEWOOHwSUADEmdunlOSdVH5PC
         eEVbXCDKJ0qN6hk9e090KzWoY//GF9wuKbsShmw/2+7AtmGlXtc28vNrr9uK0SCxxzzM
         Cj7g==
X-Forwarded-Encrypted: i=1; AJvYcCW1Q6lXGx8a3nybAws1cvckHbGInWlytrnlgDmMrCA+9DaEwbDXfeBoaD/OozgI3q7IG2FixMauViE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt31b8hJr2vEtt9ARf97VUzcxMFfFKaAz7RFUSQ5a6d01Vvqdr
	J7WSS7itomvLfxL6eeOQuCU+SNhqQpsZxBDc8UzHMXqlGekQMYvy8/HOpSux3ma7hLw=
X-Gm-Gg: AY/fxX7pptRWksWTsDH+qO22Y6FvvBedg+TjqKyjpmwEFKO4crd49sMnJuIDrxVPm5O
	guDedbvgzZExzemxcuzUJsRmzgwcLslei6gRXU7Bs58HMbmJ5wV1WjKAs0OS3BupZuA1HwGP1PO
	eeV55gWHZQaUCb9DzsTFeAEa1GdxX/+zv6qbwzMgk5Sg5Tl2HTS/vJyV8DqCCz+KNa/yQSXbUJk
	wwZrehMs4GHZUruLKkGXsBYHYwsQaIYvPovyQ721pDq0gkQXc8zvSv0ebZM2zO4ZGjObXi55DDn
	nqbeyW13myGMh0aIVsKdJHEJ7WirZyqKjN3uM888oW7ipN1IEmZvBHjpZPx23/lE623Invdc/SB
	rWwi+v36w9bI3KXRWf4k2jRJD/uyEOaW/X2t6liqk88kWG58rw1sGi7Jkw9tiC9F6VKj8MFBn6o
	+mQY4K/WMQ8Q==
X-Google-Smtp-Source: AGHT+IFLEkEWc2D5InTXf1neme6xk0o1jO4IlcHFBsS7rTvGMj+Mx1Yom9idZgRNrYbNQPqpeuss+A==
X-Received: by 2002:a05:6000:2401:b0:42b:3aee:429e with SMTP id ffacd0b85a97d-42fa3b0dba4mr5792532f8f.56.1765441839135;
        Thu, 11 Dec 2025 00:30:39 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:3d4c:c4e0:9658:8033])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42fa8a66b97sm4371966f8f.7.2025.12.11.00.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:30:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Chuan Liu <chuan.liu@amlogic.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
In-Reply-To: <38ef7ee0-1879-42d5-a7fd-d32b96d01367@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 11 Dec 2025 07:16:25 +0100")
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
	<20251204053635.1234150-3-jian.hu@amlogic.com>
	<20251208-independent-warping-macaw-74a169@quoll>
	<dd90b445-bafb-46d4-8cec-e0877cf425b3@amlogic.com>
	<4f5ec838-f8d6-4c3b-94f2-b2a60cfe64ec@kernel.org>
	<1jy0ncvu23.fsf@starbuckisacylon.baylibre.com>
	<38ef7ee0-1879-42d5-a7fd-d32b96d01367@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Dec 2025 09:30:37 +0100
Message-ID: <1j8qf92zf6.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 11 Dec 2025 at 07:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:


>> 
>> Is there a new requirement to submit the DTS file changes along with the
>> driver changes now ?
>> 
>> This has never been case before, especially since the changes are merged
>> through different trees.
>
> There is no such requirement, but "has never been case before" is
> clearly not accurate, because I raised this question multiple times last
> two-three years.
>
> There is no reasonable way to hold publishing of DTS, therefore if
> someone uses arguments like above with waiting for driver, I usually got
> suspicious.
>
> Also note, that many contributions from various people (not saying that
> this one here is) were bad quality and badly designed but without seeing
> DTS it takes me significantly more time to understand that design. So
> yes, publish your DTS solving all of the questions and making reviewing
> easier. Or don't and receive questions...
>

That's fair. Thanks for clarifying.

>
> Best regards,
> Krzysztof

-- 
Jerome
