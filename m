Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408D22B594
	for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771756891; cv=none; b=cdVGh7idXrXi1xx9d1HLcn4gUry46skcRqgitr90JsqyCY0WdJMuD4vYu0qWXcEEQJE19SnCZ7OJbe4m+moM27ttGkyDzEZs3vyOJ+fP6e+sCygllrcOmNV4QAufWgAo55caJWm5+jUQHgxTtJEnx7udnk2/EJLFLLAswpt2kdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771756891; c=relaxed/simple;
	bh=FiNNBmyLQdXBFATIDB0b8nfQtkqDYNQ9fPbTqEZkvYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9ArcozE/kEbE9azM8M6QDGyMYhnc0cwtOKu+GBftTI26aK/yylpeW3fgIG2RzlwPNQRw2921rgHz/McEfgPDgHlyrsHCoPUbFYJvYL8wO+ykNkDLa017XCh0rbehyEbFP41u37ZAqQ/q4TQabCzA1O/G2KrXDpQesFktElZx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INTO7122; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INTO7122"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483abed83b6so5330615e9.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771756889; x=1772361689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=;
        b=INTO7122p++mLbYa/2x98TGl1Q3dMkNRu7wBEownErQzzFONbO4WufoQeMSuKJOn9y
         /kS38GI1kl/irzqn6v4wGwgxWGey6O9V/DEBQrRfjF50ZVmWlHRWSHcizhkP+yyXfRyW
         hVTUCU6AF9u480zyJtlq/8P3BB3jeexsegjL2WeZI4pkM/Z36OaJzQ9HN3mmQ7GNJgug
         /Ls/IDBCnsEzjuEawuSwbjQaQ+M4dzvcL22jn67bP6QuZs2stbHfB7PxIUvv/9tAuWh3
         I2h2HmvavsVEAXL6Eyw6WS9/f7dpzQR+KrSnfgitjJ0UUV1D0NsH+cGeygTZFGsbcuUm
         mAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771756889; x=1772361689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=;
        b=Cu4E8cJJtqebl7yPWD5sOoC7/7x4FhrixK/fTHaQqijZnfNgPeDsey0Hp1IcM8S81H
         WUvCt+jn+R0RTznTwly8BtzAxrNV5Tn2gOHaL9SfZmAgLaDzof8zPMXNvLJCACA2QRWJ
         I1BJBg0BBSG0P3t77p+227qs29kzia0TznfeSdNhnBlBaLgyJkiXPGGG/c31rqxbdBQ7
         YlPzb96OJVOcMvDhz6UQQILOCzP7sAJpoqPL4iJ31GcbXwoO0hwMpuO2B7O4m5TRhGWR
         2zWwJmLsGt572IOKfgZaFedh1aloiY6Lczxg8qvFg3rM1qlpK4IITuuR0oQyKXyNMM0h
         SjTw==
X-Gm-Message-State: AOJu0YyXgw2pT5G0LBeJ0LJGr1EBEnw2eyJpPQJpZCuWL5Zr1nuBK1ok
	pH5WtZblILjkoLyTpGLf84R8Apn7dfq+Slv19x/zG4a6qIkHNFyoo0IG
X-Gm-Gg: AZuq6aKJ2CFKGsAZUay3VDQeUEjrZMPMa/oIhLjsRp5DLV0xdI2sUef6FzcO28JAeFn
	2RxrX16DJVOkMnTs+DbS4P9QOn5kUA/8vvfQOxYbMj3kIt/3kQCibpoUojaTR/4TzcmNsXcIiFH
	uEB6cuJ+HjDeCmXwWpz4BSRbGSOrBL0cXoRsnIJ/+HwLyistxaFF+vYbYRyxa3V+59BS2Q9sbZ6
	b4N3MP0NyNqrp1k41TnB5Gpx00DayzC9CV4+oyrI6ngCpxojsjSwIyiJoRH4ULtolOwvoAnVsVf
	29QmdcJ4mG78zqM77Ql/2dbwSqSThlS2SQ1/krmdhsWlImHw/GDuYju2InyG8UtPdfW+DTBTmX3
	q2RwOdk4DRMqzw1UV3/dMSNV9ScdmQ9WwYTRvAhgQKRS7+oUPNTnkBH6HY+zSoUtUYu3kF/2wdt
	Udz/mRqFjlUQO+F4pNO9npsuGxM/LuIJXMAmDBmVVCD314AJ0mcj89rdVKS4eXSNdphS5KZW4tM
	7+GaM2K
X-Received: by 2002:a05:600c:a00d:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-483a95e2535mr81859115e9.20.1771756888545;
        Sun, 22 Feb 2026 02:41:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3deb73bsm59542655e9.3.2026.02.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 02:41:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH 0/7] rtc: sun6i: Add support for Allwinner A733 SoC
Date: Sun, 22 Feb 2026 11:41:26 +0100
Message-ID: <5061953.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne sreda, 21. januar 2026 ob 11:59:06 Srednjeevropski standardni =C4=8Das =
je Junhui Liu napisal(a):
> Add support for the Allwinner A733 RTC and its internal Clock Control
> Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
> SoC-specific RTC CCU driver to handle the hardware's evolved clock
> structure.
>=20
> To facilitate this addition and improve driver modularity, transition
> the binding between the RTC and its internal CCU from direct
> cross-subsystem function calls to the auxiliary bus. Also extract shared
> IOSC and 32kHz clock logic into a standalone ccu_rtc module for reuse
> across newer SoC generations.
>=20
> The A733 implementation supports hardware detection of three external
> crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
> the driver via read-only mux operations. Implement logic to derive a
> normalized 32kHz reference from these DCXO sources using fixed
> pre-dividers. Additionally, provide several new DCXO gate clocks for
> peripherals, including SerDes, HDMI, and UFS.

This work looks nice, but I have some questions/comments:
=2D you're missing RTC SPI clock, which is needed for RTC, at least accordi=
ng
  to vendor 5.15 DT. Could it be that this bit set by vendor U-Boot so you
  missed it during testing? Manual says that it's disabled by default.
=2D Vendor DT has strange RTC CCU phandles for UFS and HDMI. In first case
  uses RTC wakeup and in second DCXO, which doesn't make any sense. Did you
  do any experimentation with these clocks? It wouldn't be the first time
  that either code or manual contained some kind of error.

Btw, switch last two patches. With current order during bisection you would
get a complaint that A733 RTC CCU driver is not present.

Best regards,
Jernej


