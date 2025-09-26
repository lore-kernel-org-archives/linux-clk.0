Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8A30C10F
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758911857; cv=none; b=m0uE3vryqVMs1SuVbdWTLSHiMYL/bR6liIF8FXoOQBlbXY/Gyc3iNpQBrVkQIhYNjna+IJopv+do8YdMGWJ4BiYCqmhQAkY23IE/raJsPmF6VtADaGMC8yNZVSXqlXByH55B8jLS3RAEbzY5Wk58bL1iazTIkvixqPx0F2BxsnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758911857; c=relaxed/simple;
	bh=JF64E9LziDMomCBPJZwiXLhLGMAjQD1sjgEoH+6r38E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mmh9V6ZEEJ3i6ifcpBlEsX3eAAobILHcrIGGM7VxS4XP3OeMW4kphbHGrnpXTIELWWdBHm4IcpN+VU7e4QqHVHzpk9GHhtf/t6qfIGtbflV8GqdSD7NSHXdgoOKrKRPLzlsBUbTzLOeU1WyCSvq+06Q5D/H9V9QURIrv/1/HnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnXmrsn6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnXmrsn6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-414f48bd785so782633f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 11:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758911854; x=1759516654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4tLH4zZsU/KCMVQpK5rDpwcnO5VG4igW8/S8Fp/Tqk=;
        b=mnXmrsn6NIrGzTc9Fq5YQVZ98jBpmr+MKZvjQiHsFAxdLMnqVP+WQ49yJc2rVDidBD
         EgHkHqGz5+TGORNvHu6QxNrLfWiNCU9xlzVZZMfEazGc10BOCZPLfIFwfLUdBPrT/GOu
         T41Il4Q4Xv2N8uxTYRkv/aT3EnBp8A8I9jgW4mBUMVHu7PKoG7zUmmC6OuIFyd666F+I
         sCym6Eu1k+Hvg5CE4MPFnQVjGrZX3pmN8Icn267UIizwXzCVmgjTkMuEj/S9PGh7t+6j
         EsWwAQgF9ThupbiecQRync3JhoQvHNzHlTZiE18yV5jj1efe3j/TfcAzVVwCk9lNT8E0
         u+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758911854; x=1759516654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4tLH4zZsU/KCMVQpK5rDpwcnO5VG4igW8/S8Fp/Tqk=;
        b=qpwzgN2TeDiHbhmoLO8lUxBOI6uk98U5e4/XDk1tqEnJ2zJCqAoBbby7aGy3NPwXKI
         XAYq/cvuUyabg/3exO30sTQ64bKNrH+7c5lXRWxYdfkSbmGDc/uquPeP/Ostcygqz2LN
         /AMSa8XU0gC9PEGZQ/68t9mU6Au0zOPtbOG1BcolbjO3r2nHVISpt1r6kmgDZQ0Iql0r
         3sAMyCOkr8QgUdWdpUaoMvCClrdz/9eUZ3dy/9ccjWCl+fBPe856PlzaS/wCxHBzSd8S
         lJAA2WdZux+ENS9VYEEjO6qd7083ary4cjqSY5YAiq8EemmCK+LUJaEeEboRP9fMAyRD
         1Slg==
X-Forwarded-Encrypted: i=1; AJvYcCWwqPLHYz7piWhU+MHIUhh1bGGYvmEGK0FAG9559ChfnReJfCeXJtc8cijsFgiTA0tDgLKek0E0BFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYVDCLsObsgjvKfc3hQRmuJk5FtJEaxez+BynbUML8P+MgfgeN
	uZEWshubsO9jnnoMpT3WDC8Po/L4r1j+q1sjK6wVGDQPdGDPAedvfMSv
X-Gm-Gg: ASbGnctYlU5kodxPtNb/uryiHEbZ2LTFKjhiZJ9rSKJviXcr1VlUiTrXg20+Np8zqCB
	kyWf75+nymi2cVeqhK8i2LqsBF/cJ+CC4NzmC21MSnlSfaWWwFj1bCmsuabBvmy9Eg664FyJVxk
	uuKtYsRDuP2rPz70GaQRXF32ObcQGzY2ocPh1nSLLaesPY9JnJr95eRN4LU7mHm9rr8wUCnGfSM
	EL8emKXjBObWOp5q6xzoPUGwo8tpgVruRsHzWwHw22U1kX80HySZ7fvdSZ9chcKT497PgsM3HjY
	OjzQrEeCJJ8VxBKy9EZ5pduIROEf132FWPPpQDN3P2+YJaycMKTDY24Iudiqu/yBy7KlyPtqkkT
	TGntXkfg3Cp5/xbIYhWEOkWl7tAggblqtEsiXHLjY34PglHMiH1KyX/d9CeYcnHXRHktBOlPBn3
	A+5IdNn6s=
X-Google-Smtp-Source: AGHT+IGL3QvqfsVcdYoP6UEPTEo7LkSql6GFvlUpYyPH7Az5c/OcA09RHs++MokV2IPq/7GahQRVUA==
X-Received: by 2002:a5d:5d07:0:b0:3d0:3eae:576d with SMTP id ffacd0b85a97d-40e437370afmr7995364f8f.22.1758911853783;
        Fri, 26 Sep 2025 11:37:33 -0700 (PDT)
Received: from radijator.localnet (93-140-141-58.adsl.net.t-com.hr. [93.140.141.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc8aa0078sm7876881f8f.59.2025.09.26.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 11:37:32 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject:
 Re: [PATCH next] clk: mmp: pxa1908: Fix IS_ERR() vs NULL check in probe()
Date: Fri, 26 Sep 2025 20:37:30 +0200
Message-ID: <12766491.O9o76ZdvQC@radijator>
In-Reply-To: <aNYQiRJDmOO0mEWs@stanley.mountain>
References: <aNYQiRJDmOO0mEWs@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 26 September 2025 06:03:21 Central European Summer Time Dan Carp=
enter wrote:
> The devm_auxiliary_device_create() function returns NULL on error, it
> never returns error pointers.  Change the IS_ERR() check to a NULL check.
>=20
> Fixes: a787ab591c38 ("clk: mmp: pxa1908: Instantiate power driver through=
 auxiliary bus")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Acked-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Regards,
=2D-
Duje


