Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFAD24BBFD
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227774; cv=none; b=G3xU6EIpxNR5maN/bJhfl6KbqaK2zR0Ax4yJonFYruGtbRmUNtbPy+gz7cplqIaQHWdu3PuwBiv6+tTZmJocDzVnTOVVE9wOjBCOyxRteJi1y2RKEDwg5n5B4yjPrrD/BxMo/1lvLqHYEt9CbUw91U2QEfN2SXOBk0mJQvQCYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227774; c=relaxed/simple;
	bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9tdRfMVXjwFmp0A9rmpBHmDsy7cBFJ3ED5BQv4XCFnyTkhsdw2CeMePgXmD+Z6F6DPSsQPjsvuviz2tujS6kChSKiW/KJDl0pEFEKpN66ZUteJkZczGKmZ5bonFVkkU5eMdlMZWGgYdf3vZbKieC/0GjfwojXZ8TLJkbYxdzj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvkZwNu4; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvkZwNu4"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94240659ceaso2113917241.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 06:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227772; x=1768832572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=;
        b=YvkZwNu4cY9uOPmaGckFZv8jb6K4FWVAN54/tfRlOEGGwMIPvX6oNd+1JV0Nnafto8
         3pUN0Dn7e6mkEmXw97xuNY2seLqn5dvimiZK6iUDzyAgWWHzZMGJvhi4l6P/SpfIxkW3
         qjN3ZnYqTs/P0jKgM93xgp6pQ+T2dvKTpMm/XJ6F2H6ZokqhziQJQrMGPrCbH9vlVgVb
         UO6PGvOoKmnm7LZK7Y1Nw6TujSLslmBYclpI7xCtKDktONPSspUk50CWqLpJxg9s7xyN
         +kCgCl22gS4GloB0PuMToi5miEOzaYhI1nw+ptBn2MNILxekscOUV0o+8IdpUaFqaw99
         Mi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227772; x=1768832572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=;
        b=CfDIGMDTio3Cb2iNZc0iKxPfwtCHuoP6HI7oSYiSKvZJaMhG90amxlQ63iNFtGizYi
         seBS203J9/X58lUBr6Y+eNz50zIUbHEsJgG8t47JIbYRDlE8M9oiV3lRN5Rrs4ZHUiNG
         LjxRkxmUyiael9kVuLezTSxWjRBn9XoP+XZyXZcG+unksv3EbRSlAlRpgJm9w5p8uPlQ
         3c6qYBNvqNctcNdIjSfBNfU5rD5mB9MNIsBmYCGniTEmz0LKHnJhn4z/3qrWwKC/W+sU
         xqXZ2YtCgaYxUne/gfXkX6BXX0GMiYxOqty3Ci/XDYX3P6UKdQU4ge8IcHq4i4dKaCGl
         zAHg==
X-Forwarded-Encrypted: i=1; AJvYcCVpgEralr4xEIMVur+hYPpkY7L+U16TIClVvraZ4/QHPlzfM/2J6+5bpwTj1gQNDnB80YHhc2dqHoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh653qu8JSrovU187oOAT9I5foB0qP85N13iIH8XAoo2upQv3R
	xvsy3gpMfSsbz3ItfHdGC/HfDTp9jxmJb9JF6E5eeJLU8GnI7HdrMsClATU7I1wBm9BHAfzIjNl
	vLusLgYA2ayAwRDQHBT0Wp3huGVKF58aeIeH19HAD2g==
X-Gm-Gg: AY/fxX7lWSw2gkXDSb0EgQb40OlzidVbWg5zWkWOce2k5rwyAieYtQs8KzHqy9uUoXG
	1IKNPaZ+xBlPaJ6Eh4bFDK5i6LHNGFO3m2fynZy6s2JU93wyI3yRmB0sTE9J4yy1RFZnK368/Bb
	EEoVf5rTq1d3QOplq+HotoMHVITQwZpJJBi/vXVX0S7blY9WLRzkbId4yYk5l2KfYR+w77Xms3S
	69B5ynQxV7pI6L/Dxkn0k2X1NWemh3mGJFz3Cv8mV6I1IKex5Ze0fLaVtZ/TuWIigeOnTd6ONI3
	RMDBDULsENDgNBJ0Tq5eb3FOxEg1cg==
X-Google-Smtp-Source: AGHT+IFa3uP73sKTwXvKWrh65KpYYLhONepO2yhtiz6R2pvhmfRlUTjI4ifsl0y8t5/reFgRMiV/Pdv5o+0tykFNm7Y=
X-Received: by 2002:a67:e704:0:b0:5ea:62ee:1b5b with SMTP id
 ada2fe7eead31-5ecb1e924a9mr6520896137.10.1768227770485; Mon, 12 Jan 2026
 06:22:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
 <20260109-clk-samsung-autoclk-updates-v1-1-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-1-2394dcf242a9@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:22:36 +0000
X-Gm-Features: AZwV_QhvEXr6GUxPXZ8zhrOsq2grsq3qSCluicx7SScTHv37UQRTS1YD7I721QA
Message-ID: <CADrjBPq5R25QDzqzeJ274DTCpAPfjBFQ=c1szVzYj7rBOC=y7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: samsung: avoid warning message on legacy Exynos
 (auto clock gating)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jan 2026 at 17:27, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> We currently print a warning message that the IO memory size is not
> compatible with automatic clock gating for many Exynos-based boards,
> including legacy ones, even if not requested to enable automatic clock
> gating in the first place.
>
> Change the test in question to avoid that warning.
>
> Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode=
 for CMUs")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@=
samsung.com/
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
