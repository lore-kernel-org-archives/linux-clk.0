Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577F27FD56
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765795871; cv=none; b=LKwFTu772nKtuWgJgKapmTLERDiSH48fxgKAJFEXm08VcHbN9hrKFbCkqPzT62dZQJ17Ybxhj9vWijXT5YlXelmiuszq4PZ6ujMVlVXpJwEURx3SHMHm1Af3pQCAV5SGxXFfJXsKKWsFwRKCKvp+Uk0Hs3uiFPEpeMjo0wKJKSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765795871; c=relaxed/simple;
	bh=yvmAk8rBkFBQKuxJYkj+f74MCns4mWaW8k5uuvRnc04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W6rzHE77afS1oiXf/gYZab+UQxu36KszjBlYFnM9UzyfIe6ahxfAqpCBaZLL47R5tYUlJPovTP/QNywN4yagbV97iw6FrXnwS8xvrh92zzrk47TvAueEkYUMb1tkBqE9Gbot6YXdBYdGwz1LkYoyb1csMCv0joTP4tS2wMiposg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MtoWYf3D; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MtoWYf3D"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so1616582f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765795866; x=1766400666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiAf1pob1P9A2hs+uuZimsbQclhxUB5vv2ZHT7m9wRk=;
        b=MtoWYf3DaosfDZd0tWLIg3613awh6P82XfBlTh5POSa3V4BM4OFnndHmjC6RKhPwm/
         hYFLjUtFfrd/P6AHZ80XIyE1OswDVjMND0hxzs+FqEywUWXKMKVbHppZuNMBBBCWhYnJ
         UJGD8Ufa03pqb0aPhQ45SJyRR1yazim1/xztfueiMDJdh5HE4/Yxg1dnK97uRnhmRuis
         NH+VO8g95acreBC0mu+fiobehHVAP/Y9aDDx5P2dbDJAcqKb1TJYb0vPR0zko3YF6QAS
         qCEmnUW97zrqK3zsl+wxt3ClUV0gKR9FIpasyd6NwfIPaqqz1k8iSA/4jnYrtcxXkPUf
         Bk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795866; x=1766400666;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OiAf1pob1P9A2hs+uuZimsbQclhxUB5vv2ZHT7m9wRk=;
        b=ZeORudTRJoNbS9N/Yj7eEWbrll2xbOKtvcw3mafzzH7beJHZNJWhqMla2yfwFI/YQC
         SLr2OMtlV72OsH3ktJ+pF6EmIoMSUNB+Ng3eb9Xb/kHTkon3UOkj+BPptxdt4butXTqv
         WnDhlLqVWyMlfFdd9liznNLNDYE5Oj/FDWLxqgy4lVSwYvBMA2NEQ+MnzWUTjkmb9uIo
         ewZkxahRGuYzJf7fPoJi16NwTBtRCmHLIqNeBLfDImW5thFzWuuGMZilWVFYfTTiwfeK
         N9Gwv/x+kDscLrM9WY/aTZdoOwNWckBFijieVD5YOvsdCrHjrni8+lhj6XLtLqR4sUZ+
         yqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeYFBuAlaQaFJt3i1kDTQmzykxGELaiwK/73pePwTObpNx7TSQLXR143l3iOD5EsAIdA5bEHwli+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8L7SG9jtu+eSN3IfjVmYimjeLTNdnvJHyorNOqIWkNgQwGlnP
	OXAJy5/W0rotIm6mThkDnMwNuQgJB5ug+rJTP9ZF0dFWddEG/yXm7TCbGVGgS5vYS8Qv5ivDxqa
	6YcVO
X-Gm-Gg: AY/fxX41LNViDPJ9PgSBWOBqF/8zTbkuRi7ZJ4Pcy5tBG0RZ3PKN2mUewez2dbBOkYq
	Gx2Cw17ETWJb0vmWWSW/A5Xalt5TJWDjV6yrvUfq4SAIatb0CMcOaCqXRoBf2M+k6E7QW+/crv6
	T8HCuNtxiBmqcWV0/nF4eHOte6gfRTxoao4WlKSaUiDL4m//hP5EFHI6qnM87XoI2aTfZ4MIEK3
	EpXJvHbMx8ZAeMvS/uDWWp0yDYUEVykbAhbRFohGZZDFy2kiaD42YtfAHbYpnZpDZZKymh7dlc0
	x/XJ0gPKCcBHKuNd0/tK59ACHdD14G/5Q6zzzywAYSATWjCEkSwFoPlwu9l1rhxrfQToK/w7t7G
	ndtZAgKqt7Udc44IJ3qKym7QrJAPdVVX57qsogDZqyN00dxo4Mal1626mBJgC13Ws5Q9xQOvY82
	QNLCTyUK1kJP6I26yAKBuyNJw2
X-Google-Smtp-Source: AGHT+IEUCXZDYdW1Yaezuo8T8dArAq/O2/s2YiIYeQnjgQdgpxFuf1BEC+kk0V2dJ19iC+eLEyxuDQ==
X-Received: by 2002:a05:6000:26cf:b0:425:82b4:a099 with SMTP id ffacd0b85a97d-42fab1f9f67mr16105347f8f.0.1765795866090;
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3f77:1837:bfee:f255])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-430fb078e56sm7695439f8f.21.2025.12.15.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:51:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20251212022619.3072132-1-jian.hu@amlogic.com>
References: <20251212022619.3072132-1-jian.hu@amlogic.com>
Subject: Re: [PATCH v7 0/5] add support for T7 family clock controller
Message-Id: <176579586493.1510096.5256519771615298068.b4-ty@baylibre.com>
Date: Mon, 15 Dec 2025 11:51:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Applied to clk-meson (clk-meson-next), thanks!

[1/5] dt-bindings: clock: add Amlogic T7 PLL clock controller
      https://github.com/BayLibre/clk-meson/commit/5437753728ac
[2/5] dt-bindings: clock: add Amlogic T7 SCMI clock controller
      https://github.com/BayLibre/clk-meson/commit/f5d473e96fe0
[3/5] dt-bindings: clock: add Amlogic T7 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/b4156204e0f5
[4/5] clk: meson: t7: add support for the T7 SoC PLL clock
      https://github.com/BayLibre/clk-meson/commit/140f074c3127
[5/5] clk: meson: t7: add t7 clock peripherals controller driver
      https://github.com/BayLibre/clk-meson/commit/fab4d651b592

Best regards,
--
Jerome

