Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB56F06F
	for <linux-clk@vger.kernel.org>; Sun, 28 Apr 2024 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714320713; cv=none; b=bGgNXlmRk9dmSUer3eWJVaUCR4xyHpssag+DIHD1IrIa0n9eR8id7FPsJE/GaSytOZ2uaiaaY/+i5+KtdUhUGsfFu2XKmdifAhwRXQs6UBeZRWzjlvlDe9PNCAkTIrZz0J3B0rcOyyTMUfiFE69y5yOHOnoSHDaWSufRPdGnjy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714320713; c=relaxed/simple;
	bh=EU4iG4WuGytpyd5HyDGvsnuRGv3BPHTkxwHMDBIpDWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPMjrBcR9PObOXALas4dLVneVnzdMO8/dt8bG8LdD7FJ7xykYQJr+MfEbMQuC5k2aM9Isl+A4+ffZ5nOJzr+G5aBsi4TsVjrGWgpf3psHrLq55kcOCqKk/CPZ8CwCSCEd91xwjNzyYH+r22skVAHL6HEJAfUxSYrZ2Cu//VT80M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rv05Ycek; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rv05Ycek"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a56d7d457a1so430740766b.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Apr 2024 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714320709; x=1714925509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Xf4FNSHAHOETwMyiCUOZ7LYnEsnl/s6mjRO381GJqw=;
        b=Rv05YcekDhnBXUyuNMdsuxSU0v94ckhnl0z7fhhVyuhlWqF5VYTqgRJzpmgBLmytji
         Js2RJCe0Bh0cJcUfEsdSdeAMz6GiZsXeUyjPTVKV5zIRoZxhqPY2jNxUl+O1tNylDW9L
         yeltgvQR4F0Ck0gmHzZKIAA6CGhYr6FTaP6nwLo8QCq3TJ7MAWvWVlnp3OoY8EGx6YW/
         Cnt5QOrhXEW3vf1vaJtwqw1SBlHUjXZ+vPl/TdSOfEFyGnwER9d5W8vfvVXryr78nuC0
         L8I2DuftZ+WeX63hczpnjmsZzE+Iu4gJxStPRgxMYHwTqEVl8h7CpGLXPtPYdu/BJqRt
         OKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714320709; x=1714925509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Xf4FNSHAHOETwMyiCUOZ7LYnEsnl/s6mjRO381GJqw=;
        b=fw5+mxsre1VKUD3tKSnlOeTffcLwrqXZ+H7ci+gQehcVkDobvwKq8/DVGU6zbvni9D
         1wxAYSXDxFM0GXz21VfiJKx2bPuZIOPR7ICsHScX73V3JlrpShXf/Qmp6uGqJ4e1qQRo
         hjEo/oHHBRm/HgHqCTvq49X21PDGiZ2x8Uw/GKU08XNJxQ2Er6ZIbJaTu9d/b0LlrmhT
         /29hE7Rw+6KNg596KtMf2fQGS8Hnmd/3xgV67a2oYxDo9XHmNvhyADce/PcJKK9rWZTz
         7OtWI5IR2PMCiBJaTxw7x2ytMyecbJkdye6auh/q5fPhHVJbkbPg/d8nUNK9HaKxNs+6
         EV3A==
X-Forwarded-Encrypted: i=1; AJvYcCW+bzaw+I9cpWhJNIAvlx8YSJMORAQnMmV7AV2pqQyFjajGOtP/qUkg0VksKOYP0nRhM16tMXDXucaeOX0ZnnmSQEnjw5hKXfX/
X-Gm-Message-State: AOJu0Yy1toPtG89Tx5xOrEk92oR1mRmJIiBDANxv4U/iJdAyMO5Zy3Yw
	B4DC+Yoc+aOkQDXCuxJKgmhm6W2ZuxlZYwgXqO2Th44QQeGbcAD2B99V2QxNTT8=
X-Google-Smtp-Source: AGHT+IFyGdmph8IG/7W72vEINCrzDlRkfZ8R9PRIV8GEZ9+E69vClxTdGYF3V//j122hfSWqJb9yRA==
X-Received: by 2002:a17:907:7f03:b0:a55:b887:e08a with SMTP id qf3-20020a1709077f0300b00a55b887e08amr6398932ejc.50.1714320709278;
        Sun, 28 Apr 2024 09:11:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id fi29-20020a170906da1d00b00a58f1eff266sm1325570ejb.189.2024.04.28.09.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 09:11:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 2/5] arm64: dts: exynos: gs101: enable cmu-hsi0 clock controller
Date: Sun, 28 Apr 2024 18:11:42 +0200
Message-ID: <171432067234.26421.4847290187146474808.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426-hsi0-gs101-v2-2-2157da8b63e3@linaro.org>
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org> <20240426-hsi0-gs101-v2-2-2157da8b63e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Apr 2024 11:03:05 +0100, André Draszik wrote:
> Enable the cmu-hsi0 clock controller. It feeds USB.
> 
> 

Applied, thanks!

[2/5] arm64: dts: exynos: gs101: enable cmu-hsi0 clock controller
      https://git.kernel.org/krzk/linux/c/ea88ccc17f156e9fe937812091d80fb501aeec4b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
