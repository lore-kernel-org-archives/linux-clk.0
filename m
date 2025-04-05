Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91291E5B81
	for <linux-clk@vger.kernel.org>; Sat,  5 Apr 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743861089; cv=none; b=p4kdQLGEDa2emwldz4L4hRq8HZxuM+yufgXVrikQYWPKmRii2U/bYiDezHINn0ImoNhsWrP8ndFzmo/SE3YB9td5d32y8eipuKpfCgQy6OSzlP50LxS8im2oaHYP3QumJXQavhtbG0LdM5G90VeZI9SdPEAHCMOs9y3DLa96gWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743861089; c=relaxed/simple;
	bh=JeyhOisvFTXUdAkk7e1xdxJ99H2lpRMgdiRUA+fOjh0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OHOZVlWnvvuAdYHBCB3jLcuu4NXwlWEUGHyWu+f/yDV/5RZBs1DVKyQcU8GZyjRsfF+jkqaYeYE4+rSN3qnYYHXK0YpfdAGlPpTKIzBYNNIrV6hUUcoTmjfnImfgMiwi/ZTJZNo1t2BVDzn9LQ71X8je9ffvU9x/ngXpD6g6V3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vzEeBrdL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vzEeBrdL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso19381915e9.1
        for <linux-clk@vger.kernel.org>; Sat, 05 Apr 2025 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743861086; x=1744465886; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JeyhOisvFTXUdAkk7e1xdxJ99H2lpRMgdiRUA+fOjh0=;
        b=vzEeBrdLdQoy4GXttK+LKOJe9OmaOsMCveq3Gp1n/idKT9ZlHNBw9/Ypr0VpC9M88Y
         Xx4qjePjuSUAlVC1cj7BZC226Tpg71c+20gzBspJb0lH3nzvRS23hTHxPLnJDOvg43H0
         hxLaEiskqiPqjgozm8dccQ8dfkLPfIwX0lzyYjLiH2ZM01ilDg8w6lvvqzyK71cvBGby
         J7G5LH1I93gBIz4qZB7628EsuLaD9prfRrOMVUZdbT97SB5s7mOU5iJwgArsfF5Jx49L
         igyHPn5Aw2C1nE9/VLk6w2QVdjUrBRHfSiHyGFKLv8KtDuIxAs1MGAijLav9f/EfENrn
         bUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743861086; x=1744465886;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JeyhOisvFTXUdAkk7e1xdxJ99H2lpRMgdiRUA+fOjh0=;
        b=MYvPJsoZitx2DgEzYNGE5PxLKZ5MaNcemTtffJImBW/MY7e2xMlIvqVPH1perpVc56
         GJXXKbAWzIB+eY+UfDTuMe+BXop/YAqr+nXwZOEv0vaw5AeZRAepx9JKMLbvsbrPjJXV
         TdfRzmKwvouLQA1hpRX92FtbNXulmqP0iP6LdUhT8ZpZevoF/gBtDxf2GKXn00eb7zrG
         SDYYGc8mGSKaQrtVCv2tpwcvF+HUoQuWxUt99HknQIQtt59r9t/AHTNPa2XNdEtsk9tJ
         ySpw8NUIrLPxAa1i8yV5svOJG9cJQARvEhQKam7xR2xlZQxSseJ4AmEIcDioAbTvm6gf
         8dMw==
X-Forwarded-Encrypted: i=1; AJvYcCU9lAoo4sdchhcczQczGniliAz87cWNDRtAJGWZBa81z0YJqWQcoweSgpp8iLTD8hMyDdnFOfwj61I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtSqpZWB2B5xFmZ6pds5R6YRbuS/0LNJYmpFI68BDV5BcPiVcr
	SssCMw6vO5LukPpCDkDQo8g6HaJZLwr4STOvMAudaOwjSc8+V60lsOB/GHDGkZI=
X-Gm-Gg: ASbGncuyejvjUB1GpN8mHCCc6qL30OaZnZYRzlWGQMxsvRdKL9wH0a0QI+Bdmrha0WB
	hfPIQlUhI2V/EPaHf2IMtuu4JKUlWkKC6ZjrmdPznjWEAeo2FBUGX4bIwVyUgrsZlFEi6y/+5+x
	JuYj8vVhQ5ETx72JEDyGeovrM82g9EbR9ZY3EK8pSCALZ6B3V/kMOUkIh5HKHNj/P5b9lLAyq3g
	5gm7+n2ZzVpJSdr8WjIOQUtMKf8en4TWEWf0reGNj3xsCSbpYFtFiSotlFzvvPeyVr+IMtmfw83
	k6EkjBdFmAGDkJj7CXOAlWp19jG9Mm3wVI8d4w2cdrVrmg3p
X-Google-Smtp-Source: AGHT+IE02LC/xEXo48knWnsG4VHZcnXuNsYnZ3C2c3XXP9CR527du7gAFHHDdb3MD7dDyrR4ZPrhVA==
X-Received: by 2002:a05:600c:224c:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43ed382b5d7mr37310605e9.2.1743861086018;
        Sat, 05 Apr 2025 06:51:26 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364a0c7sm73335975e9.29.2025.04.05.06.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:51:25 -0700 (PDT)
Message-ID: <75f5948d8a34f20d70050c938bff5422b08e37c8.camel@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 05 Apr 2025 14:51:26 +0100
In-Reply-To: <20250404094354.GG43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250404094354.GG43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-04 at 10:43 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > This series adds initial support for the Samsung S2MPG10 PMIC using the
> > MFD framework. This is a PMIC for mobile applications and is used on
> > the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> Okay, review complete.
>=20
> If I didn't comment on a patch, it means I didn't see any issues with it.
>=20
> However, saying that, it doesn't mean I won't spot something next time.=
=C2=A0 :)

Thanks Lee, I appreciate the time you took to look at these!

Cheers,
Andre'

