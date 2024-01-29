Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC756477
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706525116; cv=none; b=ccqnOkAEmMQMCRijG/+sEk0HZzoDN9gNj8HhTuK0vo5t7Zp1tsXYxXUdltPeCBxp7MkEVV1vDTC1ttQuEAdmZ3Zw641XUGayV684m9NSPlZGHc5yiAyZEvT/BKhzV2MujGOeWRvEsPJDjyv5Ut65zaKTMNBEeKeZYHnwpFrgOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706525116; c=relaxed/simple;
	bh=Z8mp0RtDl51BFHkxZNr+PFoZ3oiWgxeFj38gUyFpRkI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iZ+hlF6z22Ke6Hx/sTxg1uFg8KxrOb5uR42ffQBNsAH5in2NSc7FtgN7c6KgspTaiLm4YMdx6gqwciKNBTjT+K2dul46EwFz+49pegW2iK1V0PHrUHzVtod4NdHskhM9YKVL8gedLLZAEoRAAXBfPRr8LjSpz2cOsph/H4tlQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFaBQ8RO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFaBQ8RO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e76109cdeso36688395e9.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 02:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706525113; x=1707129913; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z8mp0RtDl51BFHkxZNr+PFoZ3oiWgxeFj38gUyFpRkI=;
        b=nFaBQ8RO7T2Kcea7ugzG1qrFh3i5QQHRzpbdTiqLiertD0wwSiGFRqUFw5E8hslyIp
         TVmjnFRYPJEAuymNs1HA+YnifsWw/fl/zgEHs0qiDCZkVhlnbW8p4SSg6gaEmTXhw4Pg
         FBAdXnV6/22Im0N9n23buznfIE5Nvbmj78vuwREIM4nPgtMaMyYVHVoNHds6CYvBl0UZ
         JdH0kaFnQ8hBCrK0rFoQH7L+Ge14MbGKUNJKLQtcK768y2VGswI0SFNtoVB1ZKWYyZzM
         yrrHMgN29LbjO2YOjsfzVHdsGDe34TpgWCseyWMnQM8eBzF1rYEuSx04q/iz4RKWltUG
         mnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706525113; x=1707129913;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z8mp0RtDl51BFHkxZNr+PFoZ3oiWgxeFj38gUyFpRkI=;
        b=B94/+u0wkfuiFhsf2xnJKJnnccKc4EF9+wSeuylHt7mzLVgBAeGi1Rq8zwGi77fBOG
         x5CTgwQ8hr21AlMYeDJTea6acCl+PaktHBkysOxw54i5tF5qm0FK33YOFx41Bn66U1Fy
         lnrV6ifJj2lsTeLSjZlal62iU+iUaHnLCeq7IjrXQN6Gd8LU9+gVWd5p4sSVq0B4+nUf
         YBtF8X3EpGMx+Yq3b7BirqiNymjJYLtR055TaI/I3iZHPnPLBVGDzsa8QBMu38rHraue
         HT+HjjNPVZ8G6K99bVX3MTR5Ukok4ALJhgNirMND4ZSX4zyb6mklgOz42LD8lJbms8Kq
         OViw==
X-Gm-Message-State: AOJu0YwuBVlSKroubmYmamP5zGWtXNSzXaeaCjEvqU2dsnDuUF6E+HXk
	npyck7wewUGfUwHuGaKPkBlMWoa0zpauOrE5L4pa2ipmXigqNc77O+D47OP6sQ8=
X-Google-Smtp-Source: AGHT+IFihQ01Lv/3xhmJ2QRY4zWM3/6pk8fnT64QKAKwosslS/C3loV+UgYjHKedBDBzrFE/BLHtcA==
X-Received: by 2002:adf:a348:0:b0:33a:e73b:b0d0 with SMTP id d8-20020adfa348000000b0033ae73bb0d0mr2794136wrb.32.1706525112807;
        Mon, 29 Jan 2024 02:45:12 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6b02000000b0033ae7d768b2sm3982537wrw.117.2024.01.29.02.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 02:45:12 -0800 (PST)
Message-ID: <d234060148ab6027bd84c5475851a30329e877a2.camel@linaro.org>
Subject: Re: [PATCH 8/9] arm64: dts: exynos: gs101: sysreg_peric1 needs a
 clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org,  willmcvicker@google.com,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com,  tomasz.figa@gmail.com,
 cw00.choi@samsung.com,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Mon, 29 Jan 2024 10:45:10 +0000
In-Reply-To: <CAPLW+4=PWCegZi8Wd=rhSUUiXNn_J46VGZoxDcRA89MX-2Y9tg@mail.gmail.com>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
	 <20240127001926.495769-9-andre.draszik@linaro.org>
	 <CAPLW+4=PWCegZi8Wd=rhSUUiXNn_J46VGZoxDcRA89MX-2Y9tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sam,

On Fri, 2024-01-26 at 21:00 -0600, Sam Protsenko wrote:
> On Fri, Jan 26, 2024 at 6:19=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
> >=20
> > Without the clock running, we can not access its registers, and now
> > that we have it, we should add it here so that it gets enabled as
> > and when needed.
> >=20
>=20
> That sounds like this patch deserves "Fixes:" tag :) Other than that:

I didn't add it, because at the time &sysreg_peric1 was added, the clock
macro CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK didn't exist and &sysreg_peric1
wasn't in use until this series here anyway.
If this patch here gets backported to some older kernel due to the Fixes: t=
ag,
without the whole peric1 series, it wouldn't build. Therefore I left it out=
.

Should it still be added?

Cheers,
Andre'

