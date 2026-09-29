Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC313C8C62
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705014; cv=none; b=ZQelQ+qgMTF2C0MCeP6kTLf278k6J4/EpsRlD5mWquKeOyE+19wh6HW1QYYrn7gjH7xjzsFZ0UkzyGiHSvYFGM6R6rnUM6YZVXNhhO2JAklM41TTAjS4a5t//1Yb5+oJgWfxNt1L+nRL+xl6IZC0oPfFD/98DHeOt4WcF8cUd94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705014; c=relaxed/simple;
	bh=t0us02vORB4Jz7dlERRWOJMbBxMt7gj0S+kDlcLt7Is=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f2EABmkVQutFG+2i02X7YmewQpBQFeXhxWvRppdbzgzJII5y8Od/eVinCSL5s6Hiis5FNaVeABomwxRDLZkh1H0i17Gr/PeSM0LP8pQCiwQa65zWOerAJgBbXj1khc3GhFIQ9WeQ6FrJlFk9lGQxry7I4KKIRRiuscTe2/mCgzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=P28wBM8/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="P28wBM8/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso7686835e9.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790705010; x=1791309810; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0us02vORB4Jz7dlERRWOJMbBxMt7gj0S+kDlcLt7Is=;
        b=P28wBM8/xUsO3wSg7/3jXmhdIyBEWuXqJBB2rU+IJpsXpHmBgP8Fa01+p8LE0T8zWV
         5Bfv4g2AEx6pAs3WquG19kyWUutG/3uU1bPrloUIcBiTIr/KDF8H8ZZ/figb7g17QqJ5
         zcNAKL/55oxL3zTgQ1G4x8HH1kHBzINZwJkppRvDYfBzDctMF3UwAeook/oRX1TbzBd4
         OwU3IuhcVN7hFWQHsKlvX07IBaKViJKHjshkqt84H187bfk2DIU5q+j7awTviohvl9zj
         OMs5N/4iy2lYPSF9n70oJ5WUigQVrKivlxFIaAGoUZS4UnXCwnED2fC5C9IOGy5Oz3UH
         G/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790705010; x=1791309810;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0us02vORB4Jz7dlERRWOJMbBxMt7gj0S+kDlcLt7Is=;
        b=HBnkDvW9DvmB7m5lQLVSyBJb1G0TQzvlItD02j8itEn6raZmjv2wLJvDXl/Y0the3f
         UPqOgdE2pOUxjWhDDdOhYkjiiJc9B7UdLbWoe+bONl7diWzStQx2gsCziTxx6vpq7H12
         j9mpZj2dGNmfB0ZGBY3XasBmSb8i0GYCLc0PqB9yKyW6Lzz0/kL6lt8raYSv7rXVDk1O
         8fypmabvj9btG9YAzv7NCP7IkSqdqFcrJem42h3eQFN/tSEGdAFd6sSZxFOFX8+Z1Drl
         y/UByWbhbyP54V9pgE2552D1jPlMGEZ3KDj+pq5JENXER4lI/rhxd9DfoydTJ3IKPITT
         8Wvg==
X-Gm-Message-State: AFuF++maeABlkaJ8cV050cNu/RfcH6HKLvyTfv5W05Nqb+vWOaq8aRea
	cENcdprFlxm7kUnfctPc8KnDcx7CUB8LasQihkENDJ9ZKqTvKzUsrq9W5DbQBuIgoVY=
X-Gm-Gg: AYBFou0kR5oa64MDVR8BEFtUtlSVXAZeJVk5KEI7hVIPcVZeYa6zDEVuus+nqEVDFwv
	ucqD2g5NUljhxc6eQwQ8kycP36lLyh0A1JyMjRhs2Wqsi3dG7dtFse60BmmUEhjmH/SBeG5ml5j
	uyPhrIAU+cZP4vjyRA9Kmyt+4ITFwPolyBodiUht6gpRVvHSPo7bX1fIZBTeBRzaroj1p9v031A
	G8tQ0OoRNjXcWQopaHoQB/QvkuQ5TwHHlQddxsnM2HV5fWIa9r6pRftGBVonDKQhhOhbYC9anDT
	UtLvZm+sgNkGgvw1p9jblVYa67wTqvbCUlOTl8HPvP4mFom5If6C2SzMcUxj+8BS4yEteORTrmF
	y9r0msyXnj79B7uG83Ks8My4CMtL5jPuOV12it2St/gayEuc637nlE+ssI9NDM2txEZq1XUoQwp
	CjYzdIjRSHuufJx0hdfduV1DbhVQRvKvfYNRoViKv0RZ3yYFWFYTo0xWOwk1CUWBYEbiFgkQSYN
	8PIacagVGdpcgChRg==
X-Received: by 2002:a05:600c:8b86:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fe6701ed1mr295156035e9.34.1790705009663;
        Tue, 29 Sep 2026 11:03:29 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0148b0590sm5696925e9.2.2026.09.29.11.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:03:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Junhui Liu
 <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v5 1/6] clk: correct clk_div_mask() return value for
 width == 32
In-Reply-To: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
Date: Tue, 29 Sep 2026 20:03:28 +0200
Message-ID: <1j7bk43pfz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 14 mai 2026 at 17:27, Junhui Liu <junhui.liu@pigmoral.tech> wrote:

> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
>
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
>
> Fix this by using the standard GENMASK() macro. This safely resolves the
> undefined behavior on both 32-bit and 64-bit architectures, while also
> benefiting from the built-in compile-time type and bounds checking
> provided by the GENMASK() macro.
>
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
