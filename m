Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAFE1F0E34
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774507056; cv=pass; b=cEDqs3IJuEkcBYlXtpkpVnvedS5V3hmjAYZHvbLlJldH33Ih7QVh3/Ruz2k4UHmv04LtWvk1knmb9tho3D4JWn1wcFy2nrX3mm3fOZfmgtcIchPK2sOBWyctRigciTN5O3+BS7NrTWB8HFScCgzuocFxdnuiF6jkXFOFMa0AgSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774507056; c=relaxed/simple;
	bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjLhaOxnPVxL6E3DvBJ+OlNZxQaGcHnA7ACK4Uh9RQEj4zxLHQ3CAVTqwheVVvYhTUDxKJJQMHFGH/EP/+DMFUpJ4LWsViIcDAu7GekDLn8nVMJREbca+XhDo9xAeZOlxiNfHGxftDChIr2cP0rDP9rKcTTaGwZ//Bq3ep9ESyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F2igxbYb; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F2igxbYb"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38ad12fb595so16296881fa.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 23:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507053; cv=none;
        d=google.com; s=arc-20240605;
        b=PeEt9ugWToFno+y4qD8fsiOnPrqFx0dOW2yczLJGPJ2ymnCup2KFVT2ROvYx7RuIM3
         y15P2c0AYmMaj7oVYhL4YsbjsAvlgeUREmz2JHzCnOkFdGNfW9PV7R4fcKp1NXpRJVSB
         lbldD91hEZCyOoqv9XzaXemap2v3Zk8JQi7sRKarl5HyBoqhqu1yaAluAAnxMsHhuzYG
         Mfpb+Iyr4Zi4I/K0BTjr3/k6IaYUzhW+3hs72QUxxX8aAm0vv5YloGWPcCdL7bqwEJrQ
         9Ms2STEoC5YU5VaDu0/+pqqvY2TNowo5Grl4f3DwGOY53cTMnz4LXQ2TcSKpv2UrpW6G
         jRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        fh=gpW2cnEV3fQT0P9rAq9GXHeVMGpiV75PlmJyAPEJdh0=;
        b=hA6+9k9+RqHIUR+yBOGcUDmjSCAembSoJ876j7pdVncZ8ly8G9qzDxycjjkc8fFk7N
         7s6Nrs1MaCobUgHDOl+M8rr3EBrAo+juyNJ2YME9S1PmomhrFVHioXZYLJvIHc+JPMkj
         3bgThvJ4Ozl2txSB8HTwXHhU21u2o5njRQ5kzH9f4FwEYFXtcI3soj+xZqmyhP09ETKj
         EuC60KuYpVJY7ZpzCS8Si5LNu1c06IgWbh2S4/DyyXdgHrBAYwahTwoFRFVqNpvLHUfs
         umm3xls7tTuW/gS6zKMdPGLTb/7Il7w3gHeC2zAnphw5MvdTQ+slIbnpu45cEff+WcKE
         Ajgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507053; x=1775111853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        b=F2igxbYbGDKz8a06VccNgyISvvXT8QviaDfHAVgwb9wkoLdUYByHx0g8LlRt6u7O8O
         YJi4TDkGVsK9W+8AEwJ76xrplplUuzB9+UB61FiPwY6HX4Q37p34lDYEM0d3+6j+thL9
         wdt92EA409ggYQ0jK4KSe9MQlEV2U+4kJtO8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507053; x=1775111853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        b=kXq5/ZyjW0PTBEGnNvSMhrURiouYP7573Quj7Rx74APFfsJfexlku8sQ8nnA8ai4YH
         wJXj/3dzyvhhQfRqbNukpzlwryH78OBQjeTooPbW2MO+ieW7EIHA4ZJFJngFzS7a+XeM
         BiaFBb2VjPU86o6GZ+tL1Z8M21SyFQ2k8jt6YHiLKRoxaP9u8PvIs7FZ0v06P6w8A7C1
         LcblQ3ypCxu5GuB0/v3pGndF0W0nb7qX4JwDFFR5Aly8g8RExhcrQyIx3989OnsjXk5K
         Z74EmsejgfGGvYe3kIvzoHY2JPkhNPnAw0PMlv/DxoyLHd3YgSHSDdGgCm1t+VpETJQT
         Gi6w==
X-Forwarded-Encrypted: i=1; AJvYcCXn3c3gQmBXHdIp9i6I4YXEi/tekV1nC76nibGwlxHUhJpD4Bl/ZIJ1U7nMWn3mwgJvItjYU+okzVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhwbAKaiayhe71LinueyWvt2rTR0jLieh/oRl+NPUfmdqJsOe6
	yzQlK/+2sYcdvNoll11a8GRKTo3z1C0Li9AIeHQdaexZojI5MbvjjsmmnL3gIUwlICkDE3l1mig
	oMLkDzt5D0OTz6VwGZTCilZLvfylQ0Z04V412xzQ7
X-Gm-Gg: ATEYQzzC6PzsxyeP0vrwrBXgHbkmgfwudpZf0R+XMBDE9qHGCH+hA/gPY3xQZWlhg2p
	qQGilGB8v3fqs5YKWP6YYFy4mYCc6KVEhZHUf7qPIaKBv3hnqBPm0A4CN1Jx67ZKpZHEA8iFjDg
	+Pjd1wTZVvchRpT20UEhP3+PDOjxHXg5KSvwDO81idA3tQOC2bYdC69MdFaRw5IYdWG4OoI2RYJ
	tMw4OCHVO5S7VoauyFVNnTuL1gmwBnTiDejesBzNwywb9PivWWqvEfrF/52D5dscRwnISEuC1LX
	6v3qfBbQuel+Oe1wCZbwqx2MxKHAprbNeVPbMQ==
X-Received: by 2002:a05:6512:3f05:b0:5a1:2e7b:d885 with SMTP id
 2adb3069b0e04-5a2a50927f7mr203717e87.25.1774507053537; Wed, 25 Mar 2026
 23:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:37:22 +0800
X-Gm-Features: AQROBzCCmaG_qIJQfQe8KdYGB1bTw6MFFgF3aMq79sEp0x0VqbdbLLlRtaaQZUY
Message-ID: <CAGXv+5H2GdeEVf56apai56Ak3-b75DEK89S7SJgMO9YK5S3y=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: mediatek: add MUX_CLR_SET macro
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 1:09=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> Some MediaTek SoCs (e.g. MT7988) define infra muxes that have neither
> a clock gate nor an update register.
>
> Add a MUX_CLR_SET convenience macro that takes only the mux register
> offsets, bit shift, and width, hardcoding upd_ofs =3D 0 and
> upd_shift =3D -1 so callers cannot accidentally pass bogus sentinel
> values to wrongly-typed fields.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
