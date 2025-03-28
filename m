Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2EC1DE3C2
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169254; cv=none; b=bIX1p73yUh54noHsVTvLUGGhgt1GUQmeQhctKNRMfMcT3+SR9FEUA2JD24nyF9jLBwXQa1Myny/Qjrw5buJa6MLh5I8nuw1amOaPfD4PNrMVIhOTcGJJSppEIPK77pzXA+t769LSnTlf/L3Tx10Sv5r9q5k+fLCa/oHrBRgRves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169254; c=relaxed/simple;
	bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OTVSy0drfdjIcmnM58vPPrnXRLZVTJVDByb7rgoz5hY4OoKmolpfHcaIYgadrYRLLWqXtrC5cGqVoggtpvB8KCMFOjfYXTeRxE9No8mNf3o/XxNiPUKrbwuYELZUb3yUbSkxOVj/pgK5d4ncKXj+AQrmoqp6muL7nC5BwQKKIi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdhxabIo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdhxabIo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so21353555e9.2
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743169251; x=1743774051; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=;
        b=jdhxabIoYHZ1r4hXR9PBvi3oCobElBxj64Q7mh/CLkM+I9utbJ0Wn4mm+BHzoFLvFB
         MjrUC7cbkJXbMJpUQRjR7C5BkQI1bT3LJ3EJirKUUvs5lQZb+bF8wMz0iK5zKLOZ44E5
         5LC/51Vk3FQTQ+DxE27H9JjKG5+EM+egzH3dE7UfaoRY4nXOqe/Y5ZDZ0rX1DOSqjbzv
         rBeb/nGF+SBk/EDQAD1+SyKT3LDxgSe91+E1A7i2PsuFpSA6qnCgxX5OJ0PuvcQSKM1W
         UPrOJj1eW9O52GTtCCJln2w8Pio3yNmLR5mCyDI8bcinN2vwI8STipJTsD16/5sPwZ5/
         NR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169251; x=1743774051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=;
        b=HvP5rr6Q7W3lxrMf7AAIib5Lyv4OdrpHAF9KFkPh/QDcl5UnNw6Vku1ZpdGu1psBg+
         v9ydqW1NT2P7t5uXQB7bH1MHdJtccUwLtMLLkKqlfQwr6fIgokGAN4VYjXYa9fBTvpoc
         /PPMLjm6UlTC2BGlx+8qDoxbRV+uSlNRUWSHgMdPloETG4QxOPDxuGwp9uIih2k969tE
         dMFfuw6raLBRk1GtBLmjcsDgBSvk3YtKz+QopdVgCFfjHx3/VNShJAFWCITZ9x5gyMrw
         TjvAHBkv9nsiFaYL1zd8UdfAtiXD3qSZfV8jVzdtwSW4ZdBQqWmW0RkwnhHm8e0nW3bT
         e9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWWllUVa1c2wyzL3N6V1UT1w8Cg9CtIlXAVb2KGtN++nXh//j1tfFnvi0ycBCRS471NXCBUAoVj6dk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+NCnVCuqDfF3cCfex5YfX2X96Sk9EjbQsZLifBm3zvDhjw8IQ
	E/eokOHGvdkBmPAVkdT/SwxQ5CGucW61VfmaJaNjmI9DevZRQt5h5XTCg9wgHY8=
X-Gm-Gg: ASbGncsllfJFgjGnfnqjSnOlsX8d6y8OItbMSBuZBbGyrdFnLFXh/8DRfvNEXoXwQsI
	DXepLL5mgdjfwfg8lbisrDMwXF8qINJFmKfqkkPMZKMQvljdc9Oo4kcmL92TSmgz1uOEZ8SKg7s
	hEzghJUb/7xwxCSgpVpnZ3iiQ+FtxEaNB28iPyGiX3Aj6OM8+U2WtcNihBYdY8cn+911rTFffEG
	11udFsh4JqQytHuVEo6jTPP94n/62zT+7kYtGz6K9qS3QQ03vK9tcRTBqI4iYr8DKu68fhet5hT
	UczViFcTevaPZ/GvBEHWi5hZn+iBbNLEy3K6oQ+0tVCxG4DR
X-Google-Smtp-Source: AGHT+IHwHjuKaCXwCLJb2L7VuxUBZjvvxP2g/BLNcbOaZ9V7ELDXVBGUe+axHxG86hTFzSZGV12KgQ==
X-Received: by 2002:a05:600c:1ca9:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d85098781mr71142935e9.27.1743169250696;
        Fri, 28 Mar 2025 06:40:50 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm27701695e9.28.2025.03.28.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:40:50 -0700 (PDT)
Message-ID: <10216af0d2a3c85cba2bba1356a50b488947125d.camel@linaro.org>
Subject: Re: [PATCH v2 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Mar 2025 13:40:48 +0000
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-03-28 at 13:28 +0000, Andr=C3=A9 Draszik wrote:
> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> *** dependency note ***
>=20
> To compile, this depends on the Samsung ACPM driver in Linux next with
> the following additional patches:
> https://lore.kernel.org/all/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro=
.org/

There's a v2 of that one:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.o=
rg/

other than that, everything else still stands.

> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.=
org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@lina=
ro.org/
>=20
> *** dependency note end ***

Cheers,
Andre'

