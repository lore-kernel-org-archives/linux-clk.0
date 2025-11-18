Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCBA2D7DF4
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763507202; cv=none; b=umw9LUCQj+q8wvWoF0GrNU213mAAhfQhfvxgBCVyMz2g1dFNQSFJt9GkVNGa/wx3dxini1LrulNHeOjuIT+JTOfQDYFfImetChi4nq0bSFWYdA41qr4HK/J5KkZQQxESksf64GlSA4HV0bOFz/vk312HO6iBrYg+pgKUwx2HZ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763507202; c=relaxed/simple;
	bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUvfPrbCEQxaJumWnDgldcsn24TPDhiNO4mq48O9NQ+nPg8/nWJL0bdC7ZqsC3oUH8N++0nYugINLkNy09WMgWaEGoUg6rvRrWQMhvbOziP4pljdPN9mQvGPumIVNaSfrK4Lrxt/dciwgEtKPx3Lyj+J+XQmqcUqHuOyRwuz6BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UfvYck1u; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UfvYck1u"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-591c9934e0cso8231077e87.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 15:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763507197; x=1764111997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
        b=UfvYck1uNz8mqIo13JFGwzFX9VIkjKIEo9RmRV4QPX5MnAX+9ywoIUDmVoPkCRVIiG
         3fxyN53ckBdXcvwPWw89T7UAoRuOIys+10yKO3sA++4R44slzYgRUir+QbRn2769mnk4
         UnUwnfec1xgR4Xn6p22g6kaT7AUAac4rXo6Lmu/xf/BLJjfEXH5eFSFC9uHxVF9+UTu/
         HGU5ktezAOQtZ36HJxwuWEjhQul4Gcn10kzddMrXMmazzT9msgcv/l0C71FGD5mXbrDK
         x9lKdHGi+prGGXgWm8LMMM/Td90mu1ZLW+L7bVuf4z9Kl5kYjL1Q39LHBi+TKA/57TK+
         TdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763507197; x=1764111997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
        b=Q2oxdU0+4k3NWvnfsb+IEvJ0Crj2ySItQIU8p+3rEEKgtZ9QAzac6f0hPA+OsUbYJC
         yTqieplv8Xb85s7nle6BggjhnI9gxYPPhUv7NR6GU5pl/oXtfuSxCIJ6FXJZr00Os5Ra
         dYlisQzGAp4L9S+JBpA1oc1qbozZnTEv3xeuiOWk3zABfieyE5Qb2ha+8MZkAzOdZMeM
         GDie/ZoX3H4VHAbkdEhkmwZsq3Ew4rU9INUqUa8YHHzNm0Ha4ZYGRa572ilfPmk5eGPt
         EkSnRkG7Vu6eWzNNrDEk0ZTOrUgudspTjM3Ulkpj/6U2o0QYaXGaN0HQ5Yfmz3DxvTHL
         H0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOvEmyayvyGGWkOOzvmh/9hSGmUvsjMbiHYyaU5uXaqpOHH2SaYxM7P9bre5h/tBY1u4Pyd2rFONk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPy8uKe6fvAyRU7bKQcIdJlxjvnLa9iGlCZWlVjmMFoikm/GnX
	iUupbX1DiDUe+S0Y1o2BK25JKIrXWPKWRafKaiYEqsIssjbDefyvShWAVTxWt0SSk6S4qYMtzIF
	frB8beUwN6vM0e94BeHnmHuqS2i9mLtmCaWVYzs7r8Q==
X-Gm-Gg: ASbGncvplgahfHFOIxkLeNTcIjBGpI/jI0yKIi/2/ZteHbn1tM8YLAah7zSjdg5l4pg
	6dTZ+1g5+cLI3q1Oe4Ae8LeXXga2lC5NPlsLmf8J5L2KMZf02ql1my4K8QHRxJmqvrln0gLuzMd
	O0uCyzyduHcAtTze0utH46h6ywMPtRymBh+DxLLdE7HHbiG9LDiu24luzfeaIEBJbb8cT2g0u8S
	qy3If47ROAs7hrEaF90nTj+n50uCHlLbLk1vQptjzfX57OiXP3YYQpNbc7fARaMI8RLfKW7xYnd
	5T8ikw==
X-Google-Smtp-Source: AGHT+IHgvWgHNR1n7HikNfbECM3QMJGErQNkGV7PI3jzhreQtbR/8j6SX6DzkJAmHt+W6Slk62x/gQ3zMskh1FFfiGU=
X-Received: by 2002:ac2:4c4b:0:b0:592:fe0f:d9e with SMTP id
 2adb3069b0e04-5958419866amr5810310e87.7.1763507196990; Tue, 18 Nov 2025
 15:06:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763022807.git.mazziesaccount@gmail.com> <ec2cb44d9d00f5edaed2fbe17fd9ddbed914ff37.1763022807.git.mazziesaccount@gmail.com>
In-Reply-To: <ec2cb44d9d00f5edaed2fbe17fd9ddbed914ff37.1763022807.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:06:25 +0100
X-Gm-Features: AWmQ_bnx0kL6TQjG1WBAuJJp0XRB0JYUZxqe_CZgABTVpH_anNv9ed5mp--DLwo
Message-ID: <CACRpkdaa_DuXbLYqOV3aOSGywz1wSPc3-7SN8FtwTdVza6-omg@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 9:52=E2=80=AFAM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The ROHM BD72720 is a power management IC integrating regulators, GPIOs,
> charger, LEDs, RTC and a clock gate.
>
> Add dt-binding doc for ROHM BD72720.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

This is looking good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
