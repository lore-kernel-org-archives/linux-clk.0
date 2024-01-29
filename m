Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662176C6E
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 17:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706549729; cv=none; b=U7Yb3X9pPiKdnsahMOHWViohW625aSj37jcA2BgS2lw0nHyxzHrWdzADE+WJ0j4kdRdXv7K5tml6GZBDwlGQ0aVZJ/M3v6+X+J9+V7LEV45Da4AjZZHHEOFBqFAoGVGVf4Y3ou9DgHLbP6DzuMdksRA2oBkQiFGS99uvCy/ktXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706549729; c=relaxed/simple;
	bh=FTGv+GMMo2t5GM5uIMBn9GRR6iqsAgPnWcYIHG2GhqM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YUOku1a52Hu9LgfWaLJ5FI4cDT0vtlg4hhVpfwBvP//VmVV94eAHgiyzZ6ALJREgp2atwuuMpDdDvCm1ZW5MAGiL2+lRTXLZrQYfio2Fkq+KZZE8l1Zgkh4o5ZhIV7ByxTO5x7mmQiYd+mHnqPirMU5jJn3gOJqSfkUD0NcuC5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fv4ZrSUY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fv4ZrSUY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33ae4eb360aso1749362f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706549725; x=1707154525; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FTGv+GMMo2t5GM5uIMBn9GRR6iqsAgPnWcYIHG2GhqM=;
        b=fv4ZrSUYS/khOIFrsuzWg8PBhPlWlWx9awNOKEoymVtwwa5hO0WD2Fj6KpoatcOSYO
         6AyshUhF8TAdg8uUmX65+Rg7Z0PaPNIdt1uaBNuQvXVB6m+daD7nJPGAwgXMBE1QZG/h
         F1bh/JX2ZgnOEVL6Q0h6jCxOx3gd0Klad5Sp/hlKmw+lxPSspul36ZiMzCQsH+y+Osr0
         ka4Z8kwbVz8cp3krguHuuRIUuNZQJC6dCb+d47xxGiB7EfkBG+21YKGSPcSSV2KoU6VT
         9dS5CG1dr+k5Oe4ufThz/aUVuW/XyKxDMj2uRwDGwvJXbV6mXppGF3z26KP2yDS9N2TA
         z4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706549725; x=1707154525;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTGv+GMMo2t5GM5uIMBn9GRR6iqsAgPnWcYIHG2GhqM=;
        b=UN03EcPbjCuaxqjipQNFJEIMKDE8ptFHDKZHqAXzkzUQQS5QfTm1gJwiA+19//vtKs
         JtwJP49ibV9Qu2V6wXvc3QExqOkHSvjefKjbNn+PmXEcD1NQ2AyV+fTFWUe7/BNJfpYx
         dw8k3M41eHlqQcHE3mundtqwGmMBRHDwBj3tUYqN+YnnI6Z/gVKp638P7sn4y/T7dx2u
         dgsQjkYn4LWiq0bgwM5jQ7FsYFPhnZtO9J4Rs3c5V/1VEO78d7YYRuTbWKd/ly9aSskR
         gf4TbCVM3YNxLCqR5GXwsltxZaUzfXkx0/aDgcGbcTF0f63/NDP8ZzF2lYrPYNpQaI+4
         SQVA==
X-Gm-Message-State: AOJu0YyJxivmcTzq7ZzUCBa1cKvXFtbKMq7wiJJmcqp/Lq4BxXetbBBX
	GCTDOPPrK60ANFc/9R8JVNiwdN9mTK0by0ZC0sXSg9Ze+HsnslXkNlT5QpzyDsw=
X-Google-Smtp-Source: AGHT+IHgaSjXCvYQjhSkhL58cEx05Cv7+5UMQrnse7+ADEQOpBmYTLs4+jTxujxLVRhc5WnOYQ7pnQ==
X-Received: by 2002:adf:fd49:0:b0:33a:f00c:cc9 with SMTP id h9-20020adffd49000000b0033af00c0cc9mr1839524wrs.1.1706549725443;
        Mon, 29 Jan 2024 09:35:25 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ch15-20020a5d5d0f000000b0033905a60689sm8706882wrb.45.2024.01.29.09.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:35:24 -0800 (PST)
Message-ID: <1dfe1bfb506a662d64cb15d1622f9ec84913b107.camel@linaro.org>
Subject: Re: [PATCH 6/9] arm64: dts: exynos: gs101: enable i2c bus 12 on
 gs101-oriole
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org,  willmcvicker@google.com,
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, 
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Date: Mon, 29 Jan 2024 17:35:23 +0000
In-Reply-To: <CADrjBPoTPzWo10VvFX1m83q72xqzR_y83TZ4JSFgK+YtyaRsPA@mail.gmail.com>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
	 <20240127001926.495769-7-andre.draszik@linaro.org>
	 <CADrjBPoTPzWo10VvFX1m83q72xqzR_y83TZ4JSFgK+YtyaRsPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-01-29 at 09:28 +0000, Peter Griffin wrote:
> As Sam said, you could be a bit more verbose on what those USB devices
> are on the bus as they aren't enabled in this series. But apart from

Done.

A.

