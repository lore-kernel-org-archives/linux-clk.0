Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312D2127E2A
	for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411814; cv=none; b=LFUkqnrOKr11eqI45CBPua2VxLC0Q44GKXYX0uB4vO6kBthpcQsSOJOh1AGMHmFBs1pyazncZVvsjnyUv39s30R12ezW1F7kxZvczsLQrtVbVCMpwhAVCXvQwoQauM7ltKpzy40dXkOGVkfFBcz40BHGQq1KKH5vbXKFKcduIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411814; c=relaxed/simple;
	bh=iaTQupQAQ4L5aKb0tIWtWWuAWG8nTrTwjkrpuU281t8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pu2CDelyEASMMt9Xag1iohdyq6/6vtck7z4FHMytFUeXSAlgTfFN9HbO7jAm5u9TvzVUJxgB9bSnxRBgzZ2Ai/VqRON8eeyxk4vum6IOSD2XFDwnsbK9QF5/gGVOlOXtH8Re2vmmH6bgYqkr+Pmq4nTOo1CynTvmN074RmXg9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qTJj1P+L; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qTJj1P+L"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a55911bff66so583048566b.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 10:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411810; x=1715016610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SxTwvzJ3b+FUAA/qnTPY+8Sgx2L2qoMam6QtJUfQvI=;
        b=qTJj1P+LfFU2YVTLggxAoCO/QujRc2AaU0/k41C/BtMp8gjdkEBZv5Qa/RsE2ED95W
         RTqjJl/bfy4l5iqmIHOIvMT2SUMboR6X1f2pq3tQfO1YQF9yHoft2VqZmT27fVtI2NkU
         JJPba56nuDCDaJtfaa960P+QztcACX3bA0jXe4EoHymmimH/qsD1gX18TjzDMLH6cTqD
         SnJCL7GbAgv02+vMEAG/fXL9OHnJ9apx+ky1kPP8gHAIcDTz89f0vLG8SJb+kp1baW/u
         kIUVvCnfgab7/0EJFliN081ODKyJmsVT2w3eXAWcGXDf/zK+psS9hGmComoCdVdE3ZWg
         CN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411810; x=1715016610;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SxTwvzJ3b+FUAA/qnTPY+8Sgx2L2qoMam6QtJUfQvI=;
        b=Cous4Fwogn5GWjtei+9wq9l2o+PLvUNUaQdpJqz5OecxJSKWX/MjPtXnUJkY4L5/Ab
         iDgKPbxWROxjnR3Sp1i//Z3w+mqWQscpadE9hgoofEqNiULWwbqOOSEUCXn831sKldzx
         C+NmKqdYpjQgq7Epxcyt8XNLj+xd9idAJzjWGdBnsYEQgzcDhIheOdQvjPhI5FZ7kcNl
         V9/lH3AqD9OVDizJWtQlWqt4fwSZCJgWwlVIWb/KQew3nN8gyTeN8sXAudCoT7SK5egQ
         pq+2cenSYj3F/eRRLfF4dcpBF5qKqO16/P2GKbBB748yJ3hn0/67u1lz/TWOKcASDVDT
         GlGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOvTRM0XFKDtogfO5hfN8JkCG4IpInG2GyO9nUUWNSGCKXH+sonImkV0EIeVFqSp4GY/rf4ettceq1sotSQ+EvImvLYAwrUegp
X-Gm-Message-State: AOJu0YxR1kx0PJ9WKUxHn8/QGCFBnxeZ47yBjyBmAVTQxHADq2Kz6LE8
	Ren4ebgAgorXY8DeJoNnoOMGzYg9sPNPyEOZ6gbZmpvePkT9Non7oFcho6uw1GU=
X-Google-Smtp-Source: AGHT+IEARV0SgB/0lblqA6jxutXr23c9cPn9YAI3EwhEKDJ2gkPwhoLsKwDfAtOAcAvTFz1grDZekA==
X-Received: by 2002:a17:906:2483:b0:a58:a721:8208 with SMTP id e3-20020a170906248300b00a58a7218208mr5388937ejb.73.1714411810655;
        Mon, 29 Apr 2024 10:30:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm2770173eje.127.2024.04.29.10.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:30:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240429-hsi0-gs101-v3-2-f233be0a2455@linaro.org>
References: <20240429-hsi0-gs101-v3-0-f233be0a2455@linaro.org>
 <20240429-hsi0-gs101-v3-2-f233be0a2455@linaro.org>
Subject: Re: (subset) [PATCH v3 2/3] arm64: dts: exynos: gs101: enable
 cmu-hsi2 clock controller
Message-Id: <171441180847.306855.8156583534053780934.b4-ty@linaro.org>
Date: Mon, 29 Apr 2024 19:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 14:02:18 +0100, André Draszik wrote:
> Enable the cmu_hsi2 clock management unit. It feeds some of
> the high speed interfaces such as PCIe and UFS.
> 
> 

Applied, thanks!

[2/3] arm64: dts: exynos: gs101: enable cmu-hsi2 clock controller
      https://git.kernel.org/krzk/linux/c/86124c76683e31033180f1d31e7543863ce6d850

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

