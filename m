Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64AC1E89A
	for <linux-clk@vger.kernel.org>; Wed,  8 May 2024 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715201194; cv=none; b=hMi0wyKRoaY/JN6S1vc17XrQWDBi4r6xlRQlXn4mlnt1MKTR68kBw95P27O65EjPUFOFBBixT5XOxIUm9aLEXIMv1z247xtViDKgTUmJ79S+NTU4VKZaBszPVal1vZCgQemUVmJzvDW5FknlPAH8l/b8x5ShrZhXxC5hkA9MZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715201194; c=relaxed/simple;
	bh=U+JJXdSyICqOC60nUmI2fkQ5vGZZspCCnV4ePaM9Zjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fR68gJITeWQ3nRWUh8zzcC8CXHk7ixKOmJO6xsdq6UV5VQS2FFQN63nooaNXSDFioHzPLtQbVBSQ622zXJlVYytwe718VpaNAZlzEEW0uf+C1wVaSc86ol5kJG/UufTczljJV+hkxbHPVhP87IZhwQ3Zrufs5ldIAi94pwu8yD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hUSOlYER; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUSOlYER"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de5e74939fdso205954276.0
        for <linux-clk@vger.kernel.org>; Wed, 08 May 2024 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715201191; x=1715805991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHxj1v+rFAJCX5c6BhRi3cdybi17vUj5Ix+LCyAtYMk=;
        b=hUSOlYERSj4zOV3bjqh7WrbnlS83nvH+4OpSiRtqfoi7nrvkqNHU8J8/Ff5JrayowV
         rpUghUsWVAtQ1ea8E6MimmtqNL9jcCy9NO/QY+v6K4/HaYYKz8B7yOK2l3mBSLP2rQWG
         9FxO1BnTnx9JPoQU/Fm9T05kVKzoL8LNPJVILetRKHO1b7e8ty/pEVFfWw9djQGXhbwH
         xgWYg5/KatWqgbNCoDlMebP2wlYTQrJK25dvnAdxqEfZg99nKj9WLwR2el/QvGk6byRY
         hc258YFCsZEDKslhx63Qma39D9+03FKD2PIHFis8zdux5PYjMcclzmylSYS5JmmJaqCW
         jISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715201191; x=1715805991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHxj1v+rFAJCX5c6BhRi3cdybi17vUj5Ix+LCyAtYMk=;
        b=LX7M+pDdBUVuN3doU0OymOAjJMSGresHXiah0zDLhwzMTeC5Wc7RJApIbJaKUhyu7x
         y8eoGmmXiVxx9q/6BjXHocJq+6C5Il8pBRm68V9WBKxv+N5y/zJcGuyPJM6Nyj7NNKKG
         wQX8NlUvh+xHHk1OOFwTQ24n1XrELCJfwVcDSJApVr1OiDJoNPvH/01ncYnx4VN8ecUR
         jOct+4mt0r/HaBfAlFI4+A4S4voP7YhrPJ5HtD+GWhBXbskSVq+rgVKmwyQou9Fpg9cQ
         jTKYiPLyoHJs9dlf/Pj0O+ktyHOSzF5ngAv5acv8LRkxzQ8TNraYkTBPgrUKzM5JUkfF
         x19Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzqJPxRVJiI1KiUVgOl643vnIRcqTy5ovUHAElceTocYiAMne/HFn9E/nHbPx/Qtw5Aw8txN6nW+b69NJHQmuCogtiRuflBVYq
X-Gm-Message-State: AOJu0Yw2dHm8NdEOPiL9nRr2/YUEBJdj6x2WZ8EdtkIUWkWmbA6//mv+
	E72d8D2CByUpGYSqP1LuPF5erb5WSUvlfj9JonRMo1ztGRsZg9q71GzdGskzfX1NQM6jVJYhh0P
	gnvCOLPSO7h1dg6Wtd+TvpdbGRpIkdzUSo3MvwA==
X-Google-Smtp-Source: AGHT+IF+nKOg/oxvvBseKMAcD7PQcQCKUYem6zIWSWwsVSBfv7UhB9pH6t8FEIwl47oXy3DTvLagu0RNYkWsFNtMCYs=
X-Received: by 2002:a5b:981:0:b0:deb:a0a2:aad6 with SMTP id
 3f1490d57ef6-debb9db1fe3mr4178079276.28.1715201190873; Wed, 08 May 2024
 13:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48@eucas1p1.samsung.com>
 <20240507065317.3214186-1-m.szyprowski@samsung.com>
In-Reply-To: <20240507065317.3214186-1-m.szyprowski@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 8 May 2024 15:46:20 -0500
Message-ID: <CAPLW+4nFp4AUpKdcsPTQ4gE3AByJU4WO+M34c3om+8AqTziAeg@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: Don't register clkdev lookup for the fixed
 rate clocks
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 1:53=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
> clkdev entries") revealed that clock lookup is registered for all fixed
> clocks. The mentioned commit added a check if the registered name is not
> too long. This fails for some clocks registered for Exynos542x SoCs famil=
y.
> This lookup is a left-over from early common clock framework days, not
> really needed nowadays, so remove it to avoid further issues.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Here is the fix for the mentioned 4d11c62ca8d7 commit, which fixes
> booting of Exynos542x SoCs:
> https://lore.kernel.org/all/20240507064434.3213933-1-m.szyprowski@samsung=
.com/
>
> This change is independent fix. I've tested it on all Exynos based boards
> I have in my test lab. It would be great if someone could test it on
> s3c64xx and s3c24xx based boards.
> ---

Thanks Marek, it fixes some warnings when booting the E850-96 board
with current kernel-next (next-20240508), like:

    samsung_clk_register_fixed_rate: failed to register clock lookup
for clk_rco_i3c_pmic
    ...

But I guess 'ret' variable should be removed now, I'm seeing this
build warning after applying this patch:

    drivers/clk/samsung/clk.c: In function 'samsung_clk_register_fixed_rate=
':
    drivers/clk/samsung/clk.c:142:20: warning: unused variable 'ret'
[-Wunused-variable]

Also, maybe add corresponding "Fixes" tag?

Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks!

[snip]
