Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EAE266584
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672786; cv=none; b=ObNpqBynufCZzzSER+z1ELqNIw27E2cebPVt+jqg2SkttIwTzvtBMkhgyyAWU6hTPbbtBA+OsWIdrj03L/Vi54FFfNFZjjC+ALuNxyPunYpSrH3iIu2dlDOGgVL34ipqBlXvV9y9aJVKykbkIBoAW6DnQath+Ie5hyEn0GGgSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672786; c=relaxed/simple;
	bh=zMmyX4hI98rT4xIF+GHY3RVx8brKYrtm3BxZE7xSi9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bgu7HOLxIF7PGWGLVLrVRhWu5+U4jBSWiVIBKNB3WAXNUHpFTPYpKtfpeawm+0Dd2S5QZlAVw/0xZs5vwnHV2yIRBNKFRgdAC/qETFsecFowOvAbzFWvI+800I6F5/eS/E6i/yMdgAUxM+MjuVs3bw9rGNEQ1aDwEPuz7si7WZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zQPGZnxD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zQPGZnxD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso1087527f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 13:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672783; x=1764277583; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SnSclzJUYUD1UpejWX4wHVJELscJwkV6MRhyXGKL86M=;
        b=zQPGZnxDWDxhkQpTQyDQdfsu8ONYjANifpf8jIVELVbEcHJRk8l33W/HHmSx122I0U
         18WmItFlOLhnVcpD1xXt0ohMEOkQnDxgFsdKBHBNQVGgHb3KC0LGvHKVaAr1RyKYPSsa
         mDXdA3UIjMp8dIUh5a4HaGJ3mdWjzH+TABev6YrZhmS/fM7q51fEhGtcVfJWBnZAMrDv
         nTUycWHYtmDawBSJCz3APqr9A/opFl7t85a8Gfo9BQI3KpJjaq9dEAbpxHRgHJHNzhKd
         0tqCmJQc+jiSI3aqMisKXmfbqit/TsGngvpQm8Vlttebd7/cqMKdn0xTIF0ghGuDy26i
         FoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672783; x=1764277583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnSclzJUYUD1UpejWX4wHVJELscJwkV6MRhyXGKL86M=;
        b=CSw5vI6CA0C04ueU6fTrg6mWIRahKmF6eeILnu8fMoehC/kndanYQ75fxLDjVzOPtl
         uyy+hqLJxkCzTbfJGXhBCm+Po4YLbR7nh1KH5DKoRm7Ip3R7nUvYBk8dbkbLHM5vAXNw
         F7ZcR5nUK8N2jwx+TKbH7GMVgLN9Rp/+SxXYv/vRPvFO/6tb/Zzfw2SvIifZWp4Oy6Wx
         0698SIyD1GzdcWApY6gCs/pkSss9MTNJ1UhZca6MvHzCKZfI2ihWt8JyZ6+BYcdGd/YT
         LKmQjcjQ2INvPmxtLRF3CqOa8X18DnNFBDwxHq4TQrl1rKPWdZweUdc+aa+Bf7Qw75g/
         36fA==
X-Forwarded-Encrypted: i=1; AJvYcCXr8vIz0vuPjBxCAavwuhaYfXKb+awQsbwqvDKoq3A71nPbndIvcNeQLKJLeW1FFjmpP9f+QpjhzUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsWcfhjlnc12qRwlq9gyVvX43NE5ogXEPd43/S1DF2Y5X9gzH
	uUzIcljZceu+l9OnF2YGdhoNBAN/iQSp6qmXuoPggTEN5y11uTBgtk04TBFYMwmaBcQ=
X-Gm-Gg: ASbGncsl1a11FN5jenI2b9RAHtIpYdu/GGAz83dsUAHt7guWQMO/m9iFOwJLP+p/pCr
	yJIzBVDMjpDhYJj6GNNqgFwdnhSUcrMzBfq2A0LAkjsdHJj8mm66gCZs6sLSqDH7HxSKsSsiDS5
	tg1tw8U6pFMfRLyZZbdW4kS+pyidvE3FmGPzI59OVDlMIcjDx3haLU8zrhkn39dRIIcPjxKnebP
	3HvgzdqF+tMO3xIFQ8huBYJAXtrWKnIcknJTdl8u8FDIp4oCYmPBeQyV71nrXbXC4+58OIhl7s9
	7SgvVaDO1SZcM5AzYn209TAE1CDzKVBpPlm5V6o+K+6dLFawmCz5Zc8o2iRpvLIsWiv2QWZ50Cx
	1NQUnbx/VgFX8xCpOsQ9384Ar+8iyFZoCJKhlruLkZ3FoMOR/UVzqDcLkgYOC0w607YysVJ++vj
	I2ZtJ6OdjIK0K/fJxsNWVAnGzKTV9j6aMOziJU4J0=
X-Google-Smtp-Source: AGHT+IHCr7elXViwZypO3vz2gMF/QMkjwbp8BwuhgflwUBLArbYypsOsxTUGiDrcTKcrsd4O9fOqQA==
X-Received: by 2002:a05:6000:25c2:b0:42b:3ccc:91ec with SMTP id ffacd0b85a97d-42cb99f66b9mr4773737f8f.22.1763672782827;
        Thu, 20 Nov 2025 13:06:22 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:22 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/4] gs101: Add support for Display Process Unit (DPU)
 clocks
Date: Thu, 20 Nov 2025 21:06:10 +0000
Message-Id: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKCH2kC/0XMywrCMBCF4VcJszYwCaaNeRXpIk2mGtS25lKE0
 nc3tIjL/8D5VkgUAyUwbIVIS0hhGmuIEwN3t+ONePC1QaJUQkjkfi7cPSf3SLzttVQelcbWQj3
 MkYbw2bFrd3Skd6lmPsY/adgOImpuS55eNgf3Y+X5YvsGh0Y6MouCbtu+qQhbh6cAAAA=
X-Change-ID: 20251120-dpu-clocks-7b825d05807a
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=zMmyX4hI98rT4xIF+GHY3RVx8brKYrtm3BxZE7xSi9Q=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LJSo5MK/FUkk0o+R9pPfE6qXx/ssGLCKTbJ
 odvNLZFlHKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CyQAKCRDO6LjWAjRy
 um7ND/0QmnOKBDjDsGJEHzq8JoLBEeeRK+2iHo4jSPsh+LX6XSG/y5frQ2LXNKkiX0wYn4lkuPZ
 7oCSxcRzsW0IDoorM07gZICU/rdPiqQ9I/E+Fwny2Nx4YsG0X3UrdHXhVmz6xQn+eSeb4f2oM9S
 Ev1yhUq2lJxsqGjvgXUDJ8q/5kjUOqsOzw+oNbUHCkXsWff3jBr2b0Y4yxA4C2desQuBs+ss352
 PzLes/1adCC8rKf92yV9XPZAy8sYpQDcbsQya9DL8S5qiqRAexOESoHOw5neKT6bGunmSfCi5/D
 bc/N3+VDG99bGQwlUxcj7t7/KJQWx4ezgVWKdfCjPc6jpQZl7t/nA8FahEnmNVaFvvMFHJceZxH
 0dLlYKVXHLFXWtB28NRzgWLWRko5182DPk7GrHlq9pJpL1XHRa/EPzd5OMJEbnkuY/bO2kRjtej
 WeOqcXAglj41e+YEhI72ap3qfAPRP1NUmMjBpivMbG08w6SxMWP2uwvZMw0lYcBvt8A/ZX23t8D
 Xm3ygoQMxEpBzyEPP8yFwXKopT9/8Lmglb0rqZZgGkJEiQ1FlG9vOyWFg3u7QZbQf7UIzDrJMrp
 tsRfthtirfylRyQHmPQXvUWxubwTXoCEczsNvuVim2htorwsdoMvt0rvn+wquxSdQeaORGU0HLV
 tYWkXgAZ+qp0nKw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series adds support for the Display Process Unit Clock Management Unit
(CMU_DPU) found on gs101. I've based this on top of the automatic clock
series to avoid conflicts [1].

As all the patches will go via Krzysztof tree it has been sent as one
series.

regards,

Peter.

[Link] https://lore.kernel.org/lkml/20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org/ [1]

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (4):
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      dt-bindings: samsung: exynos-sysreg: add gs101 dpu compatible
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes
      clk: samsung: gs101: add support for Display Process Unit (DPU) clocks

 .../bindings/clock/google,gs101-clock.yaml         |  19 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  17 ++
 drivers/clk/samsung/clk-gs101.c                    | 283 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           |  36 +++
 5 files changed, 357 insertions(+)
---
base-commit: 7850d78b1aaae4eef59e519993bd8a8552b7c79d
change-id: 20251120-dpu-clocks-7b825d05807a
prerequisite-change-id: 20251008-automatic-clocks-249ab60f62ce:v5
prerequisite-patch-id: 6fec555c9a6442c6f0c53b27d096c90dc9f6e32a
prerequisite-patch-id: f01cfd5b3de005b646c158bb7277f417ca6b27d9
prerequisite-patch-id: 08f5690839af740c7975caff424288043474926d
prerequisite-patch-id: fee79bd7b5b1df942a0aedafd4d057faa354b057

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

