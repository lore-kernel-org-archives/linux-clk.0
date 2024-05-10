Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C625F25779
	for <linux-clk@vger.kernel.org>; Fri, 10 May 2024 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365827; cv=none; b=jV9QiP0Xi0aD6tgFCUVT/Sbsm8UWcIZR/bO1vK1wD0GpoZY3kEZkHs0vvhviy/oLnUjdglEdHi0GdVWK9jLN/XQqMR3WFHRGZpS+gTNWd1U8OmpwvF1EVNz87mICGfG3nTD+mGRMH7JainJfBKhdSF8a9xlnjARwxQRVVnN5LIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365827; c=relaxed/simple;
	bh=wC0jfjirw2za7FXTFvs+sXPDHXPCl1QN0MXNhFZPgH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOmlquS430dpUZHlr4TZXnM/vyH3ecaN6QBatxEjmiCHkF138EUo5LK1rfQ/lYAHdxwaoIaM427Sb/6WTGZahT1fF2wQK3LsK8JZlSY7GY0NfPKbf/MzZ0HjE/iIiXOfR5ao9bZEXHJZapUAfRlZ4T+bRGBfEgmRG6GAR+YSHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPU4XzCw; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPU4XzCw"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-de4665b4969so2373453276.2
        for <linux-clk@vger.kernel.org>; Fri, 10 May 2024 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365824; x=1715970624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wC0jfjirw2za7FXTFvs+sXPDHXPCl1QN0MXNhFZPgH4=;
        b=lPU4XzCwSI8b947LqkKqd92/F+Dzylj5CZtct+sw7/F2CUgPIwWj6zAwD8ig8cfRYj
         xG3pSF4WwMEx+93nQ5HExyzV5riRRjTzvRGti8tUnwU8Qbq4mOhtyySIXirS+xTFZI1o
         DCUVmKjWNYqqg8gXU7Mvgoec+7d5YXUFI3rn5pp8J2EjkdPv6rEfHlcdZJlDtEHSDek0
         SDGn6fMrwjli+1drtCCY+a7VpzP3AdDjMIJgXGuodPVyEWNDvpVEBcAbe9stPHKVlII9
         V07cyfZVCtly2cKv+zy6djjVUygvFY2HLUcbkoK775kvFgDT2eblAt4hiGASBhxLNJ9v
         RNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365824; x=1715970624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC0jfjirw2za7FXTFvs+sXPDHXPCl1QN0MXNhFZPgH4=;
        b=QaS6A52jeOmi7NurOqdgFqdRkmF9CfZtNfsos1vzW4abSGOLHzuYdm1uApqbUhUCCm
         zz3Ss9qqA4vxZ0FqDrxQj+eT//rVK104QGe7pIY4cCSrQ+a+C3o7G1knYReF4fkJ3PU4
         BMlFa5OgVToa/QBbZ4DXtNZ+v21VNB4cSWZ3aC/oxkwRlSTS167DkfSXgpOsSPzpNcXN
         5NDQ9Nhr2+c3a545nO/NK38TI5olq8hQhF4TJ2cjjz6sgKKbG7h2dHPMXsEaZw4CY0PP
         NBgzQfxNzyIdINBe2Y/gh3afAUcQiBCgGFHNgNE8bsvoiIGitRBADMUZn3+Z157i+DBV
         55VA==
X-Forwarded-Encrypted: i=1; AJvYcCVw82s61NrjchOXpz/TeGhRUg3O2R4UV0t8xJwhalGSGRlkiLzrBmKY0aOk58N8q+GQFiKHINhiTWDjB4GJ4mwjm4jOowqiwXx6
X-Gm-Message-State: AOJu0Yzh7n4t5NM3/u8VxBvGlWpHZ6kQQos/O6m9Ko3RTyWIfQ6S3c8J
	kxeuT+OEvtk7OkDcJtUuWu9kjxMVGb+hZ7SYb/i4pqR38cPyPEKTmTzYaMbWYRK5l43WlF0XNms
	j5AF2j45f0SsA95eMDb6Le3q598t1BoRGwgp3Vg==
X-Google-Smtp-Source: AGHT+IEdUtsjRJuFPtE/WysoIoyTtkfgv+irC179eNOa1gAB+4VTMJciFkgGa8Q1Udn3gJX8TJvtg3/kjSc6VXrh038=
X-Received: by 2002:a25:80ce:0:b0:de5:507a:7378 with SMTP id
 3f1490d57ef6-dee4f4c2a98mr3886600276.45.1715365823561; Fri, 10 May 2024
 11:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384@eucas1p1.samsung.com>
 <20240510070653.537089-1-m.szyprowski@samsung.com>
In-Reply-To: <20240510070653.537089-1-m.szyprowski@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 10 May 2024 13:30:11 -0500
Message-ID: <CAPLW+4kYE7mnEUrQM4qRs0Uhr2RcXXVCu0XLvX7-czJUZ_Fd1w@mail.gmail.com>
Subject: Re: [PATCH v3] clk: samsung: exynos-clkout: Remove misleading of_match_table/MODULE_DEVICE_TABLE
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, David Lechner <david@lechnology.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	William McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 2:07=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
> module driver") this driver is instantiated as MFD-cell (matched by
> platform device name) not as a real platform device created by OF code.
> Remove then of_match_table and change related MODULE_DEVICE_TABLE to
> simple MODULE_ALIAS to avoid further confusion.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v3:
> - Use '#define DRV_NAME' based alias. I see no point bloating the driver
> with another platform device IDs array, as I don't expect this driver to
> be used with any other platform device ID. Driver variants are already
> selected based on the parent PMU device compatible.
>
> v2:
> - added MODULE_ALIAS
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

[snip]
