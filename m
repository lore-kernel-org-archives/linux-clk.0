Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360316;
	b=IrREn/7zxxpHkOnRJ40ssjnGWEvOoYuTvfv3buLE+6WkslVVK9gbNwmq0c4ejR8/KWta
	 pqj2LFeAHwi/IBBv9Y6pNi617wVg4oSvFx7OStiqhk51qvt9WxL4upBz+DMYZps4TzvyF
	 E6SbugtQg08W3CA0XoJV+YwmrsOA4HJSo7ZlBTtD4GVjVWTsqilPLTHSNSjpdgzZXCuPD
	 s/3rEGNHyMO/MIXx9gKSqbgmaea3aMJTCm9+KcE3rI0rEHRBsatW5WWBgk9Xvo0uf7kr8
	 LJ53eaPkcKxBEW3qSFaZG78UmsjWn4Bc60DjX45w1mtaFApfISlUGAJ29FNXgACoixQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
	b=A6wByuVjZF8/taieXusO6YhdhIFjfIF0ouspx6dSBGn3ariZP7FVoyuWcfHCwyJ4KHQQ
	 KqAjf9ZO8Uv73PEd1HmCW1Ykn63LGdOb7MH0SeoJ+MdvMvyK/p12b2o7i0e5Hdjhd7Vsn
	 kqKOHNfbuc4ACsVtrRTGHodKQpohiga45/NFdso5PdW1uEiGBvDcX09ul/HG5pbiR5ZtX
	 Xh8KO3NqDVq+yBJ2Q5KtWR911N8iHCEv7ctdSNcsw+TEzyjhNonyxSdmgwUB1+4CYtfgc
	 hOawhzayk6yFmS3SXRfrFW5PaiWvJjkAbtIEg23xRMP0lCIviWt+3WeghOo9M4fnOAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dtXtggfE;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83572606A320
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 15:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83572606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dtXtggfE
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso29064175e9.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795360314; x=1795965114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=dtXtggfElS/AHPYflC+EBM6ex68Vz4KSSe/5VUUMaopzAXpDT5crcrLRZxByLTfcXm
         Pfu4oVG1dioy8Qzk2Ph4pceT+Uz3/GMd5oH+7hGGubpk0AIn3iv99XAP3zimU1m/cZ2d
         /GQrGkAPq2deJbVwUAe8LHZttix9sp9PZ9BDFAw7TMEqxkGBFNG/oUbcmCw7W8Nq0Ntu
         6fFZahSCUc3oYOov8DzGTvQzXAADUBNpVj17BaBbmcmCbh8VPHfsvnDOuAc2f8oiN/jd
         olSdDnux5EQFbpLwefOeoqiFs3R9SLkzCQTvLy2sb0RSNdBE+FU6Q9rs9NET3MCa86O1
         L4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360314; x=1795965114;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=13czVxUxF7p2dx6PeHk90o5n5H7vSQOV4wUnnzzJ1qKn/7n2PqkDGXLgCWcQtQuPx0
         4YFCMJfvN0p+8+jM6RHmw/AFHLS9/SUvRiJpsmhiovWE+4yvp/imRlVo3ORdbtI5tB/u
         ja62A1buz6p8621Z2bOMjKbcdFVxXlU2vyPHt74zcvp25BDoCXjunv8rKYezkOo/ezTi
         qkhwPxVRPT/Ktbf+1LoWiF+/lMMhe8/8kiREF/H3LSOAm1Jf31Pa2ivZVfzZMDGmS/0N
         aMpqV3t5XFy/qiIozgNKyGeiwHKhNqGY+7c2SjHRiTx7CX8VMw8j7lxoq22FTo5ifYS7
         JGKQ==
X-Forwarded-Encrypted: i=1; AL+hErF1tXsGPgLvo+iwyt1mzECmgf5pTTJxmItM8HW7VoJRCKmwmRb/kzC3RGyjMranICWW4TgdgX9+kf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84d6jQ2NKoZznQrllY29XrvTMJnMm1BEZvdKFrofltHjuZz1BK
	28ij+EmK42p8h4yFAyNaG1nukbZb5Ag34qM5sPEb2CAQ8day0aHlIBTD3Zpvpep8Yhe8dismlVG
	LZHrAUU+IlA==
X-Gm-Gg: AZFdTZdWMbw0t7jkFCQl7MgcgOyGavDa/4D8TE0WD8DjY5304JEOfmLpTz6W8EnH+73
	+bv5g7kRaaK9SqwCIzIAKBVnpfCMNd77J6z32+K9h17XoV5AsXF5r1OwNqJGoWKo7cVnOhEcjHW
	YQD4Jy6WMsT2shjHyuDzO10ILHokGkfP+6TAocpQ6IkWqPTFBB5FSNWIWgNwFmkg7JuLXgLKmb7
	zB+btp08AhyGs7p3jP+ZOw2HnWAsqBF5ANljeGLrm349XN9Bf/VEI1Rh9w8A6NbWEWS1uJbnaau
	t1T1pHgUyyJKhNYj9OvsU5uvsciVRm9yeTtFb+wZPwgrEE0vNBKi9MzqYnvx0uvwnGLdRiQEosW
	JqR/2r6vttm5D1aPh5xNT0hsm4HKMJ0BeBXdTQAOLGs721HUPfFSbCWs7HseEuAY3koCmVWkokY
	QoQc+twP0RXgQ7+on82w7RPToTwt52wfgU8lqHMbQYZQ8+oTV+MkE/5yodOr4iIZ65NnPlCdFXb
	+Bm6ReDPyOy9fJle5dgB4jmCW2Llw9cIXs6nnpOxs9eL0O8ydGTRbProRrknYwW4OFukjdcgHdB
	3OTh4g7d6y2CKEFB7SJWcsdPzOCsY2wWlzsXShtFktLIF6q5lxasfPcKH0KCNDiCzA2D6A==
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr189053065e9.24.1795360313921;
        Sun, 22 Nov 2026 07:11:53 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm16789049f8f.38.2026.11.22.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:11:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
Subject: Re: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Message-Id: <179536031124.2724645.9771781564056139591.b4-ty@b4>
Date: Sun, 22 Nov 2026 16:11:51 +0100
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
X-Mailer: b4 0.17-dev

Applied to clk/linux.git (clk-amlogic), thanks!

[1/6] clk: meson: pll: Support PLLs without a pre-divider
      https://git.kernel.org/clk/linux/c/0068f78e25a4
[2/6] clk: meson: pll: Support active-low resets
      https://git.kernel.org/clk/linux/c/288015e923df
[3/6] dt-bindings: clock: Add Amlogic S7 PLL clock controller
      https://git.kernel.org/clk/linux/c/7230757fd4d1
[4/6] clk: amlogic: Add S7 PLL clock controller driver
      https://git.kernel.org/clk/linux/c/19206e1b1299
[5/6] dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      https://git.kernel.org/clk/linux/c/ed4da9fe19c7
[6/6] clk: amlogic: Add S7 peripherals clock controller driver
      https://git.kernel.org/clk/linux/c/20c6003759a5

Best regards,
--
Jerome

