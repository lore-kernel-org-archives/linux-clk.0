Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11BC311C19
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689126; cv=none; b=IqlqcreZ//6wA1BPKucKK0m7GTvEsjTiAZmyC/1izdIekhyKG0gsWvKPsSfhUfjnVPxSAkzYizk88faNlanmIdtgI/8jMlcN6C06glk0YzmER9yOLQuuO5Wj5CK4IXqu49AB8vQFvD65hvIqGJeRDZQH1KDD7TGA+FpaFCzFYww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689126; c=relaxed/simple;
	bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GF7yLX/KX1U0h3txwTkmjps/HQ5w6jW6luvYuJNoBqH3aWUsb0usWkSHiQmEcyzUARzlFxTxLbLOv1MfmiLiRmgB9LNPhAj3MnI6Ccv0Dv5lfWo4/2NCA56hYCe315aNEpN3OjhC/vcaC7qSHNCcW6EcGiMubpNbepZrNlhozXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXURIzoL; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXURIzoL"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-30ccebab736so1625503fac.3
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689124; x=1758293924; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=;
        b=vXURIzoL6WOeHy68epWap3ErmNrC29xtLmfmt/5OszeFvCcBTXd9+e7funIXOiH1WE
         jQUlydwxAqRRUSzjNPsX5gHuXQRClfjIzGBhA1yVFh8Wx4E/I2eHgAZNB8gnsJJlJLrg
         qpBiAAef9FKGxqxnPsIVZKvBhTOvvs8z3RgusIBTBMpSwtYTpf/8kKvzhTrifkGV7O4p
         9AHcCNNXS6KaIAkWvORPqfSTlRn1bEMfa6TjjUBZgHMd6weNK2Z3E1BXVucskAbhRmzp
         vShp0Ug9U0wvKqbVBEcUFK5PfpEtk3+tUyoDXK1MFVj+zJWQSu9R6TfhZ1BRbhdWdqog
         wv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689124; x=1758293924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=;
        b=bnfBrFsv3PWKcBZF6NnJvLJO6rbwB0qFwG8aDE4/PbeU2d33Q6z+s1SIRq9rGkK7Ud
         O8DhbNmJm5OQ1jaHL8otsBerYbKSBQmgqtVgolmir0S6/mYJYdKS/KidcQm/Pj7ODs1x
         UpV9oTVxqoYMYGYHPFSSAQFQc3Qm7q3qkexzgeCz7NhlRcBxf52OXdNO6ARxpaX7eYTp
         RHG3bR9uobAWc78hcRqXnagAiKtioCtVqPMHeJRu2mMHFnS1YxJeaYd/pppB9nMFU22c
         MfbDR0BQSTS32XEXIIaSdAacXItSsiX60nj5JB+v/daFGpLBIaDVvvn79Cf9SnqZuDO3
         0nSw==
X-Forwarded-Encrypted: i=1; AJvYcCWvQqqz1FqwHirCB7Z2NXP9+W7RxW1asbDCQpKDJCYLDDHJR/BeOYoLnkKrODHSwWModsqmhDvyMyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmRC1HyIqLFQznYb7VEZJ6MliCAtQ22O9lmoS+0i3VNd9E+ESe
	SfZbdP6V0b57pjdzxpO/9Ahn8zKV6h1uZgIaRa80jyDq4f41s/E+cCKiQDCbfc/yKcCICy+M3BK
	3fMiOUG+GjSwnYWf7zX4cTHQA/ISpqAWAKAnX9ecxNA==
X-Gm-Gg: ASbGnctChQbvxxuec9fdel0+Dkgq0NdeVoSe5A9WOg8UuwBJpUcqn+XoZeN5Gb1UjfR
	hVqVifGq+0eaXUxl5URdR/bUhBgKjrdOtJ8P5Ulq+9sKdpdgs6Pm3t7QqZhfvtgxFQOMCAlgBye
	oRh8H8uysdX74E/G1B3qpJZnz5ovMqIougkoWDm+wUOICoESjKVUGnij0p1znfBW6yJSOqzZxr/
	WFRd+OLoU4ho2ABuQ==
X-Google-Smtp-Source: AGHT+IHAJ42BGc4DV3+A7HRXSgNpI4Ckz1R2zEcxWqCWvdlWoM2kBfvVDgKpueHQzqgzBraygif8YB0P1rDNI9gE4qo=
X-Received: by 2002:a05:6870:b907:b0:315:3ef4:eecd with SMTP id
 586e51a60fabf-32e553a280fmr1618278fac.17.1757689123738; Fri, 12 Sep 2025
 07:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 15:58:32 +0100
X-Gm-Features: Ac12FXwxoqn3zsYfC0T8IDf20S9zDpzsxcpDfKlZfpZdk1czNZgS3-vJNTlzLBQ
Message-ID: <CADrjBPo8L=P2bHKTFvYOj7i0u6pA7vs32d3y+4Ho+82Z1mRE_Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] exynos-acpm: add DVFS protocol and clock driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	willmcvicker@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 14:13, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Dependencies description:
> All patches should go through the Samsung SoC tree.
> The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
> If the clock subsystem needs to merge the new clock driver, it will
> need an immutable tag with the 2 patches.
> No dependecies for #1, #3, #5.
>
> The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
> are variable and index based. These clocks don't provide an entire range
> of values between the limits but only discrete points within the range.
> The firmware also manages the voltage scaling appropriately with the
> clock scaling. Make the ACPM node a clock provider.
>
> Add support for the ACPM DVFS protocol. It translates clock frequency
> requests to messages that can be interpreted by the ACPM firmware.
> Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.
>
> Thanks,
> ta
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
