Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E3217705
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018500; cv=none; b=E58PM8UzMJu/A5RPvfF3Cc+qDiBLMEoRo25lQDcsnwPgcVWu4FGgR98K+47sUtzOEnSenDMir/fDlinqm51SVqbgfB+p28X9OHCKh6+jQkShOEOKY+xx7+7P6AW/x1s+AylmYWJH0kZ/AtgIP7vgncBqVef0vv51DIqOCY8yS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018500; c=relaxed/simple;
	bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P0R6O3LOSfHX1YW6ycMjaRZLsIWOdzN6xYOf3acE8lndo7+xIpr2N7l8MftKI4U0JcQhyzZIZd+Ds9hmskco0vdbYxLbV9r5ez9tdVx+KAg3OVb/3C8zMZ3D5h367fF/JGYz7Qff1bQnpq0v6DjxwiP5tgpKjpQ5QEdKhigJ6c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTZvzowo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTZvzowo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so3453762f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744018497; x=1744623297; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=uTZvzowoocuBhurdncvrklh8cm6VOJJcEIQSRLbT+JGtoypeC6dMvlfj0mc8wZU7I5
         GyrRjkKf2AE/n8NApqIRK5yf5sUDv6SkkdUQk5Y1v3JAdo4/vUs0MpVkdQOaBEbrCvno
         9xwcYUmjMDtS3xRbrMK3s6cOK03cLKKW5aK+EpFFk/Ds5xsPLUCQc98cH9poXIQMrzz5
         BZFhHInzrACnCEhR68cMq5z8Jf8kDYV333FTnQUjigevbuBS3JARVdAfD2WSx+2AF+89
         Vid59EjqbCNvhYtEByIRuyLU9p/dim9hoQjOWRXYIjifXG19IKdXNvRHa4+t4k7QRloZ
         Apdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018497; x=1744623297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=RalQtNzSsMt4WHUOQVdeF0E9dp5bHi1gHhijZXoq05Zf88erUxxD4eG+6AeZ8zUdDz
         tCPKfOcVmHVY6VUrsCP8ag8X0rATJ4O7+Tcl/jK9SGUHJ+wniOK2oL1dmp3Y3X2iUx4Z
         hgPPqHpzGKLECJcwlXAxn2k7TD97jCXFJC61WbHy4NvYbGPDx9vAhXnvuT0x+3Hs9Gz6
         n3WOGOiSr0mo+HClPSkcEdO8/0Xk14pcweAFePSUhRhOxeQS2VrQ2eVfiO1kmN/JZ4Ej
         N6pmk/pZdmgx3xvvOYYzTiDZHKDkevrLi/qKAvfdOGgzl1YfC0SYicRqE/ucgOaPX/f/
         gAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmVBGDla0CFIIbxdYuFkc74ZNDCTwTA/BjZGgE9eIbzxJgH7sh2V4V6+YQPAOv0oLmzcDnYlLH/IY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmlmrg0vUWaOHlJiCDlAWCGYGPj7LnfKvrzwBQy7VR2p8UTegu
	GH9xdlENiwq+kIlFWzDW1qcI/mrb/yVR8eoHqw+v6b2BsZeU432wU5IUC9i08yo=
X-Gm-Gg: ASbGnct1FbHGt07cTMwOPHe/pot0hpezpJzO+GS+Fhj6+2VhGcExOD9+5gYZc896Oal
	iIUpJTUMFhF4IORe1WdqALSUazFzKYhHgsBS4CRFM7HOgFnPvZL+/ihzpcqGS2F/tsGgdPGuZHF
	NJN/lcmPZ3RuNLa5VdLyqddoAqa2rsS6r9SY6Tw3qN+jz1HUhZgBi1EGdnoQGr916hgXtc28Jed
	43HzmqNjIkJ1cWp64hZK0yruozspEi9mkHL8fpU93LoYXxFB1ve/zEPH6p+cGs91OaFiivpZb4X
	6T+vopTK2Bgg2DlN5I6TaC4jp3NUQ9s91tmtRjA4UnXVyQSp
X-Google-Smtp-Source: AGHT+IEK2ylsj8A3zv5KP41r85GTG06Mj0FN2K9Pnsar54qT+bII0+ur9gb54xnBI0cqR8Dv4CuOpw==
X-Received: by 2002:a05:6000:4282:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39cba93ca51mr9835262f8f.29.1744018497031;
        Mon, 07 Apr 2025 02:34:57 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eda4662a0sm85615765e9.36.2025.04.07.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:34:56 -0700 (PDT)
Message-ID: <305582d4a9c0fc8f34f997a697081409dd2df273.camel@linaro.org>
Subject: Re: [PATCH v3 27/32] rtc: s5m: add support for S2MPG10 RTC
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
	linux-rtc@vger.kernel.org
Date: Mon, 07 Apr 2025 10:34:51 +0100
In-Reply-To: <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-27-b542b3505e68@linaro.org>
	 <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-04-06 at 20:33 +0200, Krzysztof Kozlowski wrote:
> You just sorted the MFD headers in other patch, but here you break the
> sorting.
>=20
> For me patches resorting the addresses (as a separate patch) is churn,
> but sure. If you do this however, it means you really believe that it is
> worth to sort them, so you must keep that standard for all your further
> patches in that series.

Definitely. Not sure how that happened :-(

>=20
> Rest is fine, so with this fixed:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof!

Cheers,
Andre'

