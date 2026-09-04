Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A93CF210
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510249; cv=none; b=JrT8PSNxtC+YeVRm9E4uYNLOgpXDo34HCFFlp5gOngLYpwy1J6Cwbru3bqkT2lQwO4MiO3+tWGbCgpdSDSLb7CXHfdKGnloBfrgT9dJ4kwAyORvqmNHvJbooC1a6vuq0q2YG9J1yA1xIj2K0sOlXqGesEPu/5TnRwyCQSyF8ZDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510249; c=relaxed/simple;
	bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rbge8wujvjfunGaZMkJBLrX8wtY+eTZA7MBX8uWsA6EBhvbf8R5KsdP4cHQucOIYQt3Lh106sdMhEJnT7Xre98nOq6n6rN/FisHWiv0xg/rbAIop/ZSC4mnZg/Urgxs6ieBQwxo8rSaqr7ZQff+sgzbjbdJCHv7+/XHjmfwFCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RZT2XFGa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RZT2XFGa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso5614955e9.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788510246; x=1789115046; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
        b=RZT2XFGabeGVMYnYuvbApCELKeWCwlHJ7lJ6KrQziN9fgyhdIvkR2XBo8FB+9O/j9K
         txor+j0jFmjyAs51yleBFwGr3x1C53w2WPWPpZUK5tphVzsn6ty8xAz54bkohQgLzxgr
         gzQzpiVnhNF6Ckntq5i2mdVGVxuUPUHg7iO+CCstjqAO6U+xeoJwsrov1RlpSVDc4JId
         cYDPl+BppRR12QBd6HVdiAPWBVguDj+/7xRZZ+UawR9CudjeTm1NCxPj0jAVjDNvPcM1
         1pcg0JE+xooZ1PI1wjH/8cbUB/XMO/yyqsnllSQvJhvwEjMOHlLldTLUw4D0vofurr6N
         aQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510246; x=1789115046;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
        b=GknOZgEuJQMM2FxKtK2YdYavBAPuiEDSKLVfp8K/IjbsxPr2GSKOdnHS/vKbLRBA/R
         8aq7K6E3DGZOUefTS3ovXfNNFThCHi14RGULL4WxZEo5Q7OIZZJBZUJ55lDGgZ+iz4ZF
         3RDkkCwnrtH+KEwHPY37NtZE7isqHeYojbPtk0fZZAMeuZNetdK+jRnU5Sws7z2fk1S3
         MFDMAh+FlQ2oq6zAm/vhGhZY0331xilP5zf81YnEZKk/tKSuyByNrj5m7R3LACRqsME6
         bbqGBM1PDUpaymBUTc4Q/9N6B9BliVNbkbKBYGdRX6PNDoER3vmT9xWBPciDfP21+21f
         BGyg==
X-Forwarded-Encrypted: i=1; AKwUvBzLr95aq9ngxNrm2ct3H+BdVy6xO5PtFjWEcLcNsb5JrIRYzqfXbS8RMvgPq+6e9xGbvLLuGxpVeQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lYZDGJt5EoQ3Sd5aXYs0CR2jUO29HjvY3Uh5rkAJl/oQGp7vf0
	iDWUDEvU6iTp1YXwZ7pTs+/vbmK5QBaW5BSlR1bJORKUn4XGwAhKq8nQyrJ7uYjFkEk=
X-Gm-Gg: AYBFou2OcErUAGAoukTyZ30vftdceK0WBOnwN3yP+QRix9nMCGgKVHooIfjZN1AC3Ky
	0QluE2oDaGy3nKwQ4aiENfA/A3LUFwTxL+Xr7aVwWhZHcKZCsIc6Sbx4jC6pTeqK3R0+YH+Ngsa
	Empiwkw1D+742kOIsnqO5W76SQGCxOsihVV6Khq20hThgW0C51OnOZoOWkGZs0uhLGULCf+LbRk
	V0sKs1ZB1idLFlepXfgymjnhGwWyr9CFaMOCFpS/xGIg9o1JCD9fvXUVee3OTbx5RwOObaw3jeR
	5D9FQe6856nsiEaYWa+Ox3qddS0eRKPB/xc8Ok1gCj5w0g+Pf2rc3gO31gOlvc5de40CTs69VtD
	zb4ysHA55OwFdJKEFQM88bzT/ap8NpsL/l+BpvBsDHWs+Jm2pi7ZAxVAwur8lx3Fs8l8quWEo25
	rddXVktP7oziwUrOcpzNOkifWBOK+3k+uRYlWVK+lDXiaVCoOQ5Y8jxhbQLIjkZEuHHlBxjrDxI
	QRNqL2T6eB+slA7Hw==
X-Received: by 2002:a05:600c:a44:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49cf821e7a5mr40764145e9.8.1788510246002;
        Fri, 04 Sep 2026 01:24:06 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm4632933f8f.35.2026.09.04.01.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:24:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Matti Vaittinen <matti.vaittinen@linux.dev>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen
 <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Michael Walle <mwalle@kernel.org>,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 08/10] clk: bd718x7: Support ROHM BD73800
In-Reply-To: <2a74fea679420d147ab1029943ff071628dc8c5a.1788346553.git.mazziesaccount@gmail.com>
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <2a74fea679420d147ab1029943ff071628dc8c5a.1788346553.git.mazziesaccount@gmail.com>
Date: Fri, 04 Sep 2026 10:24:03 +0200
Message-ID: <1jik4ll90c.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 02 sept. 2026 at 14:05, Matti Vaittinen <matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The ROHM BD73800 PMIC has a 32.768 kHz clock gate. Add support for
> controlling this clock.
>
> NOTE: The CLKOUT pin can be muxed by an OTP option. On some OTP
> configurations the CLKOUT is not outputting the clk signal.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
