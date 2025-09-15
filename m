Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FD62877DB
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757922389; cv=none; b=Ej+TqaCD+RKe3MoAFSgdIKtzmN70bHYoa+sryes9aJj2CFGuav9oX/NSpid6DAU6FZuOT+hBrEKx3k+cNfDgLIK6T8JdO59zWf1jQSTeaULNPuz7oNbik1T/F6+ABrjtwnWvRNAzzwRuRaFtzOtTEHOMqCyIhNLO6RDf9CpBoX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757922389; c=relaxed/simple;
	bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DZ7tiegfSLum9AZJ1v9NOopO3YrLYPqLW6g34oNUi0VdO/fS0IKVL8RKNX2/FoE/0KhYerIhuSxCzhAJw8cKz6MmZfqIl81Vdvp5w4/9GxpJDWVx+2jmKQtrJM31aHcjFsktlMXZaGY9mch3j0+5Xarf1lTCoUVCNWt5ANudBeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V8n6zf7B; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V8n6zf7B"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ea115556b2so620310f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757922385; x=1758527185; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
        b=V8n6zf7B2GCu6e2opOUBFBhGIpz5wG0nHLqtXHW2OD3gyMT+lEotEp5gupeb4Z5Wfr
         gNojRbFUEzisxILvPenML4ZLC6QiuoSS1wjKzUd2ob85vpmuTmNmqlKhbOjrhnLZRl7I
         9zSYiqXxh0X/r1kKhByZR4eLWGFP5XvWPbHn36MXcrftKeOTeSutuLTRk3Hw8FMOA840
         gfiImqfIzJNeZJe4dGP7dZc6NpnCjRl5KiFoWq6hQSjqU8+n8xCoXPd1iMk9Fo0MCYHh
         U6FqY6h7jPfRFV5sPasorwF6FL8mdB9hLYBeisVBWo6zA+0GJw12GohQKBTipHZSj9JJ
         kBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757922385; x=1758527185;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
        b=kCQv8UrL0H37XUAO82Bo1ykQsfNdlMZtQ5JrSu1sFod6JokSUVsvSzSUetppI1rDq/
         hbqU9+Fb8lISxa/xZ69Drf4OFOp3Yyb/miTqG2xV+P5Zc/vpdf6lnYbzwIIPl1p4Rdvg
         qOn0HNbYwB7qYXQkryPgHFslRi2SSYoCO+sDf9M6U1gYx5q7q0DzRMB8VRsujw3TpgRJ
         8uPvM6/eh2QybtplM14fPVg9owzODHirCrLTMiYzE3XgVtj1jbcJuOw/idjDC+vU12yq
         yYX41fWTTLrWFhFzBfAa+4s1NNMdWPjiSKvg2PWYN13J/VfYDvqGoHGYAxhOqPZYw3m9
         kQAA==
X-Forwarded-Encrypted: i=1; AJvYcCWOdfragk8reqTXz8gO0EoG88+BPymsX/WjwbWww+p1BWIXxYCDxXe5p+VIxTeSx+Z1VCS9WIAzn+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjzGuo78JgZ3mNk2xn6lIEgVXS/Hus1lqJYLeKapnWPpcVV8Y
	v2OxLAy/pW9rHns2VN0pAd8D0Wkn6s/zmA+C0gwVJYdlgNRjKes4TaQpTzXVbsbmMk0=
X-Gm-Gg: ASbGncun3g/V+TMJZndmNasHxLLULm4xgGp4jMknJzIySyTyB1fQqx9pCd3BG6VxbTH
	IzJ4vRF2XB0xB38qI5gC0PwMDvnik3z6Z98OPeVIqeWY6NYQeMebetL4jNFlocepUq9XQtZInDU
	8LSwrdDSHENJ6WhMZ9xoSAhgUSIt3ASKijaO4Mk+UM8jTImuMjFFoNvDTYFK/eLuUvhDjS7RVQx
	Cir+Zwn1hwZ08g+pfBlDkMV0ctY+Tg2GQUQeCdBrcHKWWMoQV5qWEoScP7ocer0QCMIKA5jS17S
	Ka+qAiDFN2Paq7vnQ3haAyxBmz5Y2DSKEWgJEuBchp0DU9f4zxixuQlRETkIu1lT9vEYAmKr+YY
	iHhicnTsQlxBFzauFECq9Gd2KNg==
X-Google-Smtp-Source: AGHT+IHyyuLf6J5x2h8+77IB2PsvJAJV4Tes0P0hl/pG4jVOFAqE/MRdKs5G4GFgkNVlw9YzjUjKhg==
X-Received: by 2002:a05:6000:26cc:b0:3e7:458e:f69 with SMTP id ffacd0b85a97d-3e765a08312mr11049943f8f.56.1757922385224;
        Mon, 15 Sep 2025 00:46:25 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9c2954b10sm5452113f8f.50.2025.09.15.00.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 00:46:24 -0700 (PDT)
Message-ID: <62d7c5221b9598f390102f4db8db483af9f34289.camel@linaro.org>
Subject: Re: [PATCH v1 5/7] clk: s2mps11: add the support for S2MPS16 PMIC
 clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 15 Sep 2025 08:46:22 +0100
In-Reply-To: <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
	 <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-09-14 at 15:42 +0300, Ivaylo Ivanov wrote:
> Add the support for S2MPS16 PMIC clock, which is functionally the same
> as the currently supported ones, with the exception of a different
> register.
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
