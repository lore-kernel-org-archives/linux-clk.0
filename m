Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81712DF136
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339696; cv=none; b=rY6TljOWBUBdSs/5gcKUhBWHewLqreNb2xSUL/aTloto8zSotrBhqHbxpUGIzMwF9BLreM0XtJezwJ3nrcN4r+mACgz0h85E6ik1RHhhFuy5T+EsGIZJVvFYMJXq6i+5Ft2kXZupuevZuHqANZ22XwWpffQUi7zNs1QGJ6EeB2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339696; c=relaxed/simple;
	bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xns4fNJCPVtzpPyRRQPslRmbxaeFKV17ipgj5BR0Z246M5Wj3Tb2dlKoaXvl1UHg+MAdGbyoVtGOuIrfibxhM+uksrc5EXR6de/6Uyc+UFCQPWaj0omJiLpVtMZ5oA5wc6chkhe9m0ZC0ziZxjoKRhVOfJgiuhNQ35GxiDnle6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhtVYoRr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhtVYoRr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4833115090dso38901195e9.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771339693; x=1771944493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=;
        b=QhtVYoRrSRUo+jlulEKDVQJ9OHO1kFS9v4nnegvG731soK1x6E7Lbkiq4fK2EE7CXL
         buSqE7tAWN+Qu4chEZ+sMwn6NSWZ4AoHUSKwU3XHX3jbVUzop12WhoXLOcFaByiLxS7I
         cVHOqm1ETNa61xv546tVZG90Ob+fMjMqsNvj84eCtBt8xNP9TuBhq9z5NlR0YtmN2y8A
         kW3lbcuGpD4L8QV2b6KeQHMSKuoHckvrrEnngYMufh2yivbs9UddrGF9y9nXb5+04RNj
         XCv/eEDVjYdzAkUuoX5YDalkpSdTRohL+ikjG6slwnH5u56zip4Bg1QBUIRdMVEJ41b4
         yG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339693; x=1771944493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=;
        b=Pcw+8Ehq4ruI1Glv+t4/xhWOnWlFakehT0peXN3H/CB9+JPMYV1ymk97vjgrsY8361
         owJdt3d6gxtCoMiiux+gksgAzTRiiSaduZOYPAhuVSSajzXHrpCBpPGhvEETZLhFyIFi
         fExjpThAyr0GDf8Lv3kPA2nDRRLXNr9O6IPcCgGyL0xYmuRO4hZ26tb4c7r7T2zBktJ+
         JlgY8vPHC1okQic+ZNpyAi5JUmmpXc1f4SrOYZ65WA+DqUjh4r4E0Hf8NCiIS0B16F46
         e1ucz9fYg6kGF1+65bFg3XwUpL+i6hLucqhEX9fC++3aTNuKIXENxNU4GsnqSY+pkLFs
         fqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDqa+3IEsSe1GCQ4bO+G5sMGFQRZ/CwW6vhfZS/PV0BgooRN5ST1CRyJJWAvGlx1rmud6vHEgYK4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfFXWPVrg7Yd7xLPXdfekr+9XQCM32aR/Xp6BkGaw1JZUX+x6c
	3Vrj5xu0iOMNVmK9i0OAwgqppebFyro9BCU5IR1YbptzsWQvgna19PJxtP2E8w==
X-Gm-Gg: AZuq6aJsH6mognbyBumdIExDjMF/Oxif2EEr5DAS7z0cJHkMsBaLjUXkmIGxqBOhQp3
	YF502mSKtWD/tb6qilYHx7hTyc2amRCDPupDcii9g4VwmXnmP0MZ6pzs7MRBtgxvG7b2rcFYy8C
	ttJEkz+XBtdsuK7i0eAs+pSbkeyJyZp9Zgs6UV4/b/L+p/b+2NopXqr4Go4xN4iRzxDGz1CNuqA
	YjEpF676UeirZWTyqVP6UQ6lPfsThDF+Iyy2J7NhjPfmfXAkz6KWCGiGvcyLX4uqSAVLntjCutz
	PzKrhJcgNY+7l004xHmzFrqj0mHRSVLqKwAY8dfsYOrxU/A2eiCACATSr6uv6j2mNC/ROZjVZc5
	GwUxYUEKzr1cr1z9UR/6lau045VfT2VIBUYQ7HnBwjLatDSRp1PMlOvmrWZgIs4ngWXfd8zkrCg
	yG3TGhUzxPAbXnj+tmzeidMxTYdbke+jaW+NIshJjVayhDzwQ4KNTbpDmP4QF38+NWkXQVpGr0N
	9vwI0xFtLS1THstSYQ=
X-Received: by 2002:a05:600c:1e1d:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-48373a15f31mr228213415e9.1.1771339693045;
        Tue, 17 Feb 2026 06:48:13 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a4e149sm164687075e9.2.2026.02.17.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:48:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
Date: Tue, 17 Feb 2026 15:48:10 +0100
Message-ID: <6238719.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20260217093004.3239051-1-wens@kernel.org>
References: <20260217093004.3239051-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 17. februar 2026 ob 10:30:03 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> When the PRCM clk driver was added, somehow the r-spi module clock
> was skipped over.
>=20
> Add it so that r-spi can actually work.
>=20
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


