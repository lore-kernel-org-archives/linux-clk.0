Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5FE332ED0
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983175; cv=none; b=VgviNs8V0dU9EjD6ho7WDhMiExYyoJWt1cCq9FW68U/4SYsyKlNz95ro+35Yh7cZtIBbM5dQ9CfFsCAF3SQCaCUmXkknreYwrwokZM7k3z65waPMA86IbZ4uhk5+5Cj2pRKWtKAEp9rrp0LJHoGhXvXLSLfdpHjBy63D6ZtxBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983175; c=relaxed/simple;
	bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkC3b3BuG+s+JdbSIkdW/suiE/+J4hM48jrtVnqK0zxm3mBN9vh4/1/RQk0b1iG4lxISrHzJR3aVZcq0gG9tfTT5xFlLuJyWW0tXxt8mUPhmpKvE/RWhjDSuRqDv4ujMEPngFor7HCLLzzQgNyUILJgiVTf+1+pdgyt5tn8sL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDAJU26Z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDAJU26Z"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42701aa714aso2862926f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983172; x=1761587972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
        b=TDAJU26Z1JCMKfmUGDyMgFDWfG/BKzVyeythVxkCiY1UImv2QpnNdy+eFtyd9iPHvV
         mAY9DNLERY5mNX/qTEjZT7JT9A3DEKVoJYEgpStEjf7nz4GPewjBhLLvbQZPxTrL3a2e
         WA4RCHzI4/bPWZyQxVm+PD5BM4VYrFOAz5xMKi3B+NIYMeY9tIF3gU7tTlaDb9HfY2ht
         Heqmi5HMQmlquHu+lpFmtBZfGTIggDmjpxl42gTzV4y50+jVxaQB91o1SAjcKZ/inJlz
         UHMxVqZlqZb5UnGZZp7alNSrnMTaDxuqSXH4kt8Mqcq9DKt4pyoD8wsgr3NQi44cduiR
         mE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983172; x=1761587972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
        b=idvNObOwBO+groOU7dMvZ+Gi5UG/Sj3oWc5ettgPP9o/vLV07R46ubqirnpxNlKwt/
         jJjAGznFFcrO03vCFfXuuqktUc7AVfyQ6N5oH14ay94VEt5mB8CxUfVNs0OhNvZOvL/g
         OKxCYfsskrJkYsFSHq5+frdVjmOwpJJTRTd4x8wWxbheWLhiG88o8+nS+9Cr2WLdqHm0
         hOK831UyjlnB5sT7aPtlvh8lFANw1RpdHff9PCQ8eCJk9Khz9x6DkSPhhvpxOxgdgTmr
         YRhvcooRxCxp2cP9/vw78F02kQqA5m3cQK4ylRkOX8E8+LcFmri1eE4sD8D/vqA0jkDW
         DFqA==
X-Forwarded-Encrypted: i=1; AJvYcCVW7b7voLeRF7jGxbXDGGopUXDJnzGzEYnbr47a3mBd3E7MMDpiEPNh1jniSgF05k05W+SxRxZL2XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YypBSupS5addkPX73nxixuV04f4WRn/0A16WlTiKQw+RKQSfdhN
	wZlbu1xXPxgN0p5ojby778H86Oexi9CgkfJ7JqvzimkfXS7glfHcwCKv
X-Gm-Gg: ASbGncvYEObUrF8MvKLh4TCdNFXqZ+SVPOM/immgvAXMm32nimMEOUGkOpNjgoDRLg1
	+z/hE3jYNQpMbdtp2N0hq73KgHZxAl8zqDYAG8ygFo9hDOSKm/iutLVdUUQXY2XcPbHIqpPy+0T
	hI36a6QDt2uty+nhpRAoWpvWFEgx59TKCI1cjywE07Ph4zSeSYUQl5uzECBWSTcyjZV+dA9o5D0
	w+O+Vq66svK4A7bd0AdbxykI3WjN8WTCiGoFNQf81FlbILORka+SDeFdLn1r+DWYXET8Ii62jgP
	zM3I3Y9Q5883CcSwmMuJaLikErtGfVuwa4HzjohPUYvrvAulabzmmHD/B6fV9gIiwyKHDp6KL6e
	YsOfFKJ4ABKAqfKJqXt35uWfyDJm/1TiS4Uk9yL2hgAbJIJq7pp/thx3U75y/u/DsDKo2yc/MKE
	lJFI9NqehEwfrA9olcQgoswXvjbxDQ05cl1q5kw5BeXS+elQWXzTtsVbxoj8aedzjVYhk=
X-Google-Smtp-Source: AGHT+IHtpDIuvy4/yF6LdQ4qVWSEOm8AetCbAHS/ajv9TB9bfuiRLOt0expo+wltP4XyjrMHK3544A==
X-Received: by 2002:a5d:64e4:0:b0:413:473f:5515 with SMTP id ffacd0b85a97d-42704da2b6bmr9352936f8f.48.1760983171751;
        Mon, 20 Oct 2025 10:59:31 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm16822163f8f.28.2025.10.20.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:59:31 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 09/11] arm64: dts: allwinner: a523: Add device nodes for I2S
 controllers
Date: Mon, 20 Oct 2025 19:59:30 +0200
Message-ID: <3906069.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20251020171059.2786070-10-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-10-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:55 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The A523 family of SoCs have four I2S controllers capable of both
> playback and capture. The user manual also implies that I2S2 also
> outputs to the eDP interface controller.
>=20
> Add device nodes for all of them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


