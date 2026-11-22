Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361255;
	b=MbrL42j8TLGc01ftcopegKfGeJy8PXhfmlb4mQA2kc+KfdvQh2ufrWLKAkpAOpK6+Kv2
	 fmtHuZqH4SCqhuQAU8J++f3E0suUWdPwgESmlY4X9OCfYWlNQeUp7HFX/UOLiygV/MZST
	 ThRvpVXRCLZZpZd+7NrKTwXdraB7oIYSvVp79GzmQH2MZqSmC5pHih6b8UD4jNgdGDKMj
	 scz5Fo3gHnUDkBNmYbI/iDNhIGAsNQp9zOsoE1QAPGADKWLWY292RKYOweUQW73nIgRlB
	 se2NogKHpF0XwHyxQFMVVf7Cq721f7l8gQmZCvYzXVH87Z3qPjRYyE1SU/NjhBapXVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
	b=JOpkNT8W9+bQMITJMQ025ZTnCsxBKWI1y/Mh0o4gzxamg/szNX12tBNHVlheYBNJ5ytC
	 YldWVgwiSjuqhP3lE3AxR5559yfeCqSTsP6LSPt6PQhamEcKkCXmxoajUcuoMQ4Muavjp
	 vDF67GX4yNhJWy8IED/xBS5ERiIGuBbumEBCdA5QHN6KRCyUEivglcY63VdmFpTe0iXur
	 CE/33j+6DlhB+lH+K0fiZdSivGnmdSBvoXJnv3BaAKxVxPKWElzGZ/tpgWBLwimJKRo8r
	 nUDq6LTGVWTOv3kK8eRN0ksqr4V/9l8rkwH8OL45261Km7ckPtDk6dIBcSVfBNweJlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PnH7L7Dn;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9196606A330
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 15:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9196606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PnH7L7Dn
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso13166135e9.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795361253; x=1795966053; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
        b=PnH7L7DnBZ4AlNcEALOd6IOWa4irex/1Lm5oBthjpFyAhqmWwFFq8gIKqMkc4sqGoW
         HZlmoeW9uEUJziypoQHvEs+htAfo14e0038YSI0qZcFUEN1YmHPo2vXvrwkwK0/ZRiIg
         s60LnC3AzzZ2/EP3O7uMQZKYXOqKoHOBdcFDf5P4FZLhoE48mW8jrd0wcmXWBuzFmd5c
         wGeJPggdzFaVNQgOgumC6ZRyP49nAyG1BTwikpiQ9hxPbH5n4Oo/ZF+Z884wMqNdlqpV
         PUHG3ggKOybXoTSLMdvYgc/2CvGFHEAbBmDXfMlmMX02d1R551xSH7XAfBWi2jC+8ZLL
         A6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361253; x=1795966053;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
        b=FmtZxmNX2TuGwGSXY5nYpP4LkXNKiL1FU+cyunvLAJvSSRgDCaabjXDzekdTFJaSKD
         0jcslKPCByMhIwq77hDoG32gR5DRh3D+h/QoHrTBSgnwG7fnzN7xmLLRdyNsWYeiXk+K
         iAYkXXF5XnQMRERmBWl4kID0smfNxbGpg2sU3nx/b4/4iEMl1fKHSjLWLscfy1U/+APk
         vWjmErmVyBDPRAj5/tDATDSV2XdxfhL5EeEDS5Nk0Vx6YqXBZGayQWxzeLXwPh5Csg04
         Va3lxosfzzUZsVa6h9zZpl+fB8Mu3bm2t0hcGRxEj0ghmjXGcpJq7AUY7pvZqzhJidZX
         8OVA==
X-Forwarded-Encrypted: i=1; AL+hErGWmp4YUU1TfRtsBvy9Be3QPQCMRSD5Y/U2qQUqWzlBVPYrmMWATUOdcLiRUzkIzIlF1Olb4+7K6x4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nHDOEsQTRHSg9fZ1ks1BlP1ymybKzQNFDZtKMhoOxTjSze4vc
	ml6Fxa+lMP6Pxo51bEHUzAGv2srJJXjU/+Slq/hrTFIFwtpi6QQ4ZRmjLO9Rob/4QKg=
X-Gm-Gg: AZFdTZdAyKu5odehQxXS3KXGgLJuxkwQ0RI6Al1oDTyj0b3SjhZ08tQytQgjFbhUB9E
	RmW1Cn7HwLMLyjzUu+qlZhNZrnTYnqVrL/PUVqEQmqeTMyyC47TJOyd4ED36fnb4bmgz4IG2Fh9
	qFwrheBJSKfpwhdzCdViBS8a18UjENW+/XJIPi4gS4Hh6liGfat+gzD8e7A6OkY4m7UoHReESyB
	uYNHnePFvfVTxZtA4ITrLpP9Ltn3+7NcbI91to0PW0sAVFxj2FcgD9sBQ8eRAlXIOdffdpbsRNJ
	Xc3DioOwPhnXAcKCW09+QByHvTKCexbhTKwnCKrkK4/AxG2QxmSaJrQ0hvoPod8F6hIU02A8Bwa
	wAkakHUO5c0SdySyM4hn6FO4sZv/Hdvx0nhly6Irw7w8Yt0/4/kSDZu6ELGN5ulfFsumMfYlkyc
	zsDSHky/anKf5D0Tukv13zJSn7T27Mc9Hf9lP8VrlzC1lBUsa5FPfsxsx6rYwPVrqWDJtrYB9w+
	Guneqzm5xfWLaZofY+RLNewn1w0OC/JMR27obcAUtJ20iiQWEAcMUZ57T/UhwblFMlk/2ySX8jY
	wd78JMiHaI30AB1ZTRGhGvnt78mnPOyJU6+lPKK+lwd/B8tSBA==
X-Received: by 2002:a05:600c:3555:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb8881da76mr187712165e9.34.1795361253164;
        Sun, 22 Nov 2026 07:27:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm324114005e9.14.2026.11.22.07.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:27:32 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 0/5] Add support for S4 audio
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
Date: Sun, 22 Nov 2026 16:27:28 +0100
Message-Id: <179536124894.2728475.16240917993133855473.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=SakUBu+Tj3UYj69tUpTC/fsgrcNkMteoX+Lt2iuPgXc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMnE/+NymUzd4hva7CSmxX3dxLJ27tYynZy6qYorFaU
 uexikFzRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbCdIThv9fc1off4xQusP20
 lhVaw60es6lqQ/uRSbU8X05aMdusWMXwP980O55/ScYJq4WsZ3SZNh+93vxsmyBL/v8zj3qqwxS
 YuAE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
> 
> 1 Device Tree Bindings Updates 
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
> 
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock 
> 
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.

A clock immutable branch is going to be necessary to handle the dependencies
in this series. Please re-submit with clock changes only and a proper cover letter
so I can merge apply this and provide the IB. Thanks

-- 
Jerome

