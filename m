Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BCA30E84F
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617002; cv=none; b=dqBZr5sC/ohsatf/8hGDtCGnfpLoGQnJQp4PWtUHHJeVT0uBLyXKvPncr+kwbgNmbjLWIbsI8ue5FP33moMC8Nq4FnNWj6ipoyWBJ6bRZoWZTh4UutyVSgD65kG7Xj4oHR+S0RbU+e8RAY/TgCtEeM2eWfGhAV3f/9jGKhIIFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617002; c=relaxed/simple;
	bh=dGsMdWNNo7Kr4TZt6J0SFs0hAUGLXiGKCsH0gVxSZ0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkB6IzY8lpB4gkaFnUukgl9W+2xCAjWj8gIxvbzlu+PPGuajYyWawUs3cLUNQYBZzs2v8sDdTq4AcR+MJy8l58IS2D1Q7rVA9GQliWShF1TmDnIghJLdc0sqAr2KWCBTta7yjMg2t+/4O9M9TCo1yB3J2CmNEE/Oii2WI24GknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDxrdXgx; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDxrdXgx"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553d52cb80dso641774e87.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616999; x=1752221799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGsMdWNNo7Kr4TZt6J0SFs0hAUGLXiGKCsH0gVxSZ0s=;
        b=fDxrdXgxOfdi7SSlHV4Eiy5iK/bF4aqPxcx8rCWDKZMQgW7aev2sPzpBbJsSq8k9jw
         6AwupaY6Wh8yoDzUJyZeQ6m5dC5r73pA/HYy9CDTys/JyXHlfSRi+qvnG/a1bthkicJy
         /9fcfkMh2fdOzZmbllNzhQih2VX/I7Ej1CbhV/Yjmd/HQi6KwUcmOLZvd3JD8gRjR6WS
         PUuuD9dGuO0/eGCgugUC19e8589IHkCKx9sn6GPn53VnXOmjz0TVZStSEQotT8FjQHUv
         8HdMi30Qdc3Ydg+aFP9YYw8/oBSXUDHriR+M66MVOmfCYd/724mjzm6njFq9gvpnPWqZ
         it3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616999; x=1752221799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGsMdWNNo7Kr4TZt6J0SFs0hAUGLXiGKCsH0gVxSZ0s=;
        b=p9aAyXCaFfv71xnGFzHAcHEVbbVsw1xtVUWcmThHggoKlyygL277GsOVR6nlE1Xsks
         CXCX/FhWm5IKlj5At5BR0MzK294Bjq/YlY76ROpidQlBhBOAlAJA4ZfrNYNwOtIJynJA
         /1eW+MmiVe5v77ScNO5l6DwipzO4dCwm8qo+zKDF4bQ7QoSttb4wj9jelMraGLOhuyb9
         SyOjpANyUxvH6g2MixS9yBNkCPasPLwtYSiopoCgJXaIFKnvCPddS6tYBdW3x6Khq+fo
         fk7fKLIT2/8VR5AJUNBx6AtPfDXV+FY0lnQAyW5gLMVAfK9UN87H1oa29SQSBvoJFWDa
         UNkw==
X-Forwarded-Encrypted: i=1; AJvYcCX2QrYekbusJTqmCkaR523u9TgAhI8O/isDDJw7T9T4Kfgj6xGrmRov65vECjfC3QNZSe43JkbjfXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww84HVAZCDWHXvNyaVJ1E2DRi6IYy+p87oM1SVSVzvMHBDVcpJ
	tTQmB3l1HT7Hrl888dSUiFJtxpaYggPX95Sok9d316MBurVxAhLrp6Nk8ozagSpYUC8T9RMbTRo
	NNzgVP5t/o9tiE1TeAUckRXvh5oInYD5qnfRQc3Ma9g==
X-Gm-Gg: ASbGncuyODUcLJEqb0UPKQPH1xxlA1TRz2GYbiC15M26+tr6oV3+xWn9Vzz2BOQf9g5
	5LLRuMDkFyo7YV/T5Ye3pmMCBeNWUKShGZ6Rj50wfGPmG+0M3z1AO/n0gPBYkPxlHal9VCuLKuR
	InIo2DZE6nUJlcOSoqMBbr97U9HtmAV6I/a/26pXzmhvc=
X-Google-Smtp-Source: AGHT+IEUHpxlHJAaJyUnD91z1Awdc7+mfmlcOB7ydvJEbIgyvKJk/YjEvZBui91QkwXNtGOS6lwTRVoL9chNvbUBeNA=
X-Received: by 2002:a05:6512:32d6:b0:553:cf72:45d3 with SMTP id
 2adb3069b0e04-5565840173fmr528205e87.3.1751616998945; Fri, 04 Jul 2025
 01:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com> <20250702051345.1460497-7-apatel@ventanamicro.com>
In-Reply-To: <20250702051345.1460497-7-apatel@ventanamicro.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:16:27 +0200
X-Gm-Features: Ac12FXzg4WuZhSIauiG8DCqEO1Wj-Rdq7FM-OMSweMcuUZLpJE_RoU4DDONVAww
Message-ID: <CACRpkdZc9EpUkd-Q3T__4U0XeqTQnxnmW2K=O0BBobgXiQna9Q@mail.gmail.com>
Subject: Re: [PATCH v7 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:14=E2=80=AFAM Anup Patel <apatel@ventanamicro.com>=
 wrote:

> Add common memcpy APIs for copying u32 array to/from __le32 array.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

That looks useful.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
