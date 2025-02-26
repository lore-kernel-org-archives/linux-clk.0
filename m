Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC121CA01
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740586021; cv=none; b=d6xgDdv5G5TKC4tPa6JrCgz0FjsngHj2on5Uqn3xj/nHhMghRg4Pr0A++rRhnSZkso214w27JMyJrPEmEJbxqxqXww6R+D6i7MvW7TxUjRv9DqoPLihu6Dq74krQ5Ws6Iwkr8DeqOHPnVuDylfaW99y3q2Yx9uNGjRL5cbDHxrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740586021; c=relaxed/simple;
	bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aa1q18pSVftO9NMdSij/BgfkwU3r+hQUENyicOgC8l1P71mPGMMvONoj0WIbTd+uxqpK7nZ5ZH67M1s++GsapaEEokPkLg0wrRlYI6BerskUT1TOWlZ7EO3VgN50F7GrnsR/jcyWk0lY/DBr0cIyIz4Fm6do/bQK+8sTUVzp7bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXNp55MQ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXNp55MQ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab78e6edb99so988531166b.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 08:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740586018; x=1741190818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=;
        b=LXNp55MQf1c7H0E7ZsXrr/LnS1BlAkHgW8tKieXrWR4HSq4D1/aFL3EkwzfUOyjjPs
         YMhDTjdsuQcQEDZ7Atd8DQYdIItnSFFNvVYfWtDZ06kDTq8IOXwz6VJOVOTlP48kCBgK
         H+bcVGEUWJtvMznOi9JT7wCComI7ib4d6Z0Z7y18UPQo7DBWIKEyKksnSYnVEcYfVg7g
         XlcahmqyWr97Y80xBbAjZDKjUIXyhh41i41k4+SVuXZKPusQExQUFncNRr06RhcsNlLw
         3TNslUOpCncZA7SPrQ2vgcWcdrJODeUnYoeaClbNsb1bdASzEpeFbwyZqbpX1gXA3VXy
         9fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586018; x=1741190818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=;
        b=Tr6kt5uSGF8DWY8UbDooaMLX+6jOG1zwYot4+2184CckEYPjwhvqQ7U+d7CGkrIhHn
         QPNXKGHKPKsPG8/9Ky5bNTCZUTb1JbXMCaAZPPhCVyzyyHNFXmv+xBZIEjZXCPJNSgrV
         jI3lgbz04HjzLSQLOuuhUi5p9CTD6t5Od0i/iYjB2FZFu9h+IOv3ioWJ/wvxKF+Ealdv
         yIus1NZAESKygqR2fMGdxlCoYj5RU1S6IBR/uToRUuHOIBp/ZNTYYTs3o/FxM6q1i5+p
         p5P/AMicvu/lKOGlApkFQ9TxtD12BP5MVc15s3/elqnRBhoUlacPACXEeFLG7gfcP0t9
         jiWw==
X-Forwarded-Encrypted: i=1; AJvYcCVTcJ9DolCwKs031ZowG+dTeA1u+z/G7NK8cj2PlArMPopGadP4GGSmljWz771xctY1Ya7QUfk/+uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqN3RKnKbfAMaRygsdU/cI845Hh1TpSI+WFDpYsX9P6GEuvC/A
	7xJvejALoHrxMwGnpI3MZf824/NwF/G7gAafT9UzjUwnv7zAOP7Fyzg4lNP8
X-Gm-Gg: ASbGncuyIU+ErYeRStP3Z7/NPh4zyJJVt6esCKNhbeLKfVX+YeWx7wVyr/9JNANrFRN
	VlQk485MM2pZ6QvdGYX5JaG+hYi713dLhI5oUN7niK5TcE5pVM1ZB7IMJiyRTd6AQ5jFSWJpd/b
	cpSLQ6EwBzZaigVHbiDcUHbztBhj++xplqdIg2BiVbeGFSAREBPorH5AAQ5m1bqbG3RMOWXU/mx
	sw8H3qhVyvcUGM0mSA3ZYDw+HgLhEJM1HEYqNrZVaRENnB1aC4/aAjsUeISoUKWsbTU4j14GpDG
	aA5629s1Cok36NoaJMXb8jk6W5yrMIsJb+zMjpATvQl1rW15XBekbe4iTjSB35kmghMAJiIWmWY
	G3Q==
X-Google-Smtp-Source: AGHT+IHKSaBNAQxae8uGh3BHw0DdJPoRYYOePYjoHC8k2jlh5nxTseGqTp5afK3YJqsDzF/GYBcwww==
X-Received: by 2002:a17:907:7d8c:b0:ab7:d87f:665a with SMTP id a640c23a62f3a-abeeef36285mr435058266b.46.1740586017406;
        Wed, 26 Feb 2025 08:06:57 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abef7132491sm123062766b.166.2025.02.26.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:06:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Kuba =?UTF-8?B?U3pjem9kcnp5xYRza2k=?= <kuba@szczodrzynski.pl>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 2/2] clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
Date: Wed, 26 Feb 2025 17:06:55 +0100
Message-ID: <8494506.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20250226103734.1252013-3-andre.przywara@arm.com>
References:
 <20250226103734.1252013-1-andre.przywara@arm.com>
 <20250226103734.1252013-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 26. februar 2025 ob 11:37:34 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The D1/R528/T113 SoCs have a hidden divider of 2 in the MMC mod clocks,
> just as other recent SoCs. So far we did not describe that, which led
> to the resulting MMC clock rate to be only half of its intended value.
>=20
> Use a macro that allows to describe a fixed post-divider, to compensate
> for that divisor.
>=20
> This brings the MMC performance on those SoCs to its expected level,
> so about 23 MB/s for SD cards, instead of the 11 MB/s measured so far.
>=20
> Fixes: 35b97bb94111 ("clk: sunxi-ng: Add support for the D1 SoC clocks")
> Reported-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



