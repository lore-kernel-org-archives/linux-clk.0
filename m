Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80285364E9E
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301972; cv=none; b=jGVNILJp5T8VsmIDjDPlO5F6+reaDSh2SQeGv/cCOJ9Gdz7DZ8eJymLzW4VWKAA+Eqw89xpF5q4ixYBGxoHgE455YewzZeU9uqdrxiAiSNRHtn2+b26/7KwbdEsezpYBwCQCeheIiVLWyiaN4CQN7JFTuzncldLbnxBp2N3nq1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301972; c=relaxed/simple;
	bh=CHO2mHwrm92wINaWstQ8U09Ky5omfheOG0ViEni1uMQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P6whw+jt/vp+C8iR+n1rkLEF4ez1CXqLS/1hFFrBvLW40PZNcx4QlccHBTO4HNGBuOorhTW4zC4yRa81K70//oEcQkqEWTmQvUMCqlFDWzBwgRftd+Ok0X8WBKQyGChC+qPwSNXsn8PYtFLsWHKMsk9KH8P+VguHXh2KsXkCZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOr8xlz+; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOr8xlz+"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-430fbb6012bso5975237f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 02:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301969; x=1768906769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XhAt7LMsgvpB8v/kjOzoMgfr7UvUpv4cZmXKtrjIrA=;
        b=dOr8xlz+CzUbJf2ya8icUg1eyyZmT7jGBUUCOXgvH5FmQ1Ok70Sowu8USTVjDBM1rE
         2vpnafYjck0eJ+D+RKOf2GsxqS2lBIQfR/zuAMzFUZ+Mf/cEBIL36gh095Uxfj2jP9dd
         3wC1Bf+D+ad8w7KD4uYarG5paTZxV6zshs5fS8gx3nigxwDmg1SnNNW2vB3TVazJq2vJ
         hKR9m6b7gAw57hq6BbLybGvlWVu5kWbTUHs53eeI+iHIeoGxCJoJ++Yw+iZLxVpFakSJ
         ak0v3iCGPlmTsYcn4G28bqkbBB9C+IDlUUg3NjZ5xv0FVTPeXdKz7HcqvXVhPJmMtm9U
         2voA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301969; x=1768906769;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XhAt7LMsgvpB8v/kjOzoMgfr7UvUpv4cZmXKtrjIrA=;
        b=H9Bfd0Swi85B1NPxa715x99sdZ71nRp6KMwaCzkAwDtR2E4lFWNt+SghFKut4es81G
         TeCv3Y4XxoOvEXONx73Ow1YNXaBXrHYcaGiwexa9hP58WYVESaK5VDPxNTmjRf/MSYiT
         qplgxuioSjQ0bNIRF0jaKAHKjNUTaZPaEGt89kK1+baiVJ4r9OJe2B7zW4F8nmO6RUb7
         d776zElXAwbHYuYvrViOpmv4WYuNygNzZ2fvkPWG3KS9FpX+YZ8AcdozJOu6282yu7Rr
         uO3Xk/xsfrtdFwaR1aDh457i4RSeAsaICe54ee0Idi2i6opPLY+S6H+7yoW2rf6SJAvN
         qv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgAsNKZ3MRM2TaQf9Qt9rL+uWzV7fuiOteHFCSN9ge66dedZhhOZWNaIN2DU1595f2f2J6xtBBomI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrEqgGOMJYj92JPV2xWJQrOJPM3rEoOtGNP7aX+TYprQ0HqP0E
	uiyR7T180PX0AYySo5L1KabArnh1UnSFMup7Aukx5hfCNqT5rVYBjqoOC3CFE4WX3og=
X-Gm-Gg: AY/fxX7hJW6gcipmPQp5e9uDNVi435K34ic1ov8JhSF4jbu2HLLgq3XwDJu6o+40w7b
	PRk/BS+cm8vFZ7+hTqFFZmk9dIZFdu29q695dILMQotJ0kLUxTueNZa2+/8wO45dqwu9dQeKbBu
	3F7xSWe9BAk7V/+DPVFiSavb6yEd3uKze6AH3+fslnLWl5oEfeQrdQXp1S1biJGsFyNpCjUL3MI
	1nduADyQjTTG/ltcYAA4JHVvBb6nXHOPBjqQwW2pk9uRb3QGlfLlyeJg0c/Jv+LPawQ1yJ3ZdIX
	UdvEM/HYeBNGpS0Na4mHDVp25Ymwb6sKiAhQybnL+n3Cg+5vc8M46JHFMHNMuFFPnaf/jv0WO5k
	joutfUCyDLkxn06UHUjQRjL/lVt+f6u/FvtugXIyGslNP11VQF90kcoUd+ylShvLse/d6lW6S3X
	iJjYBpeL1SVZPmnlVwdDjDemwbbjxF4vohqB/vLxTD/LY=
X-Google-Smtp-Source: AGHT+IHPP8E397ddDu3o9zgJP63v4IoEWOOqp/lbdVOOIhYtrhd91pvL0rOORIqkiDNS3f3ry5RnIA==
X-Received: by 2002:a05:6000:4387:b0:42c:b8fd:21b3 with SMTP id ffacd0b85a97d-432c37a756bmr27436701f8f.57.1768301968536;
        Tue, 13 Jan 2026 02:59:28 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:28 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/5] gs101: Add support for Display Process Unit (DPU)
 clocks
Date: Tue, 13 Jan 2026 10:58:57 +0000
Message-Id: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHElZmkC/22N0Q6CIBhGX6VxHe0HI7Gr3qN1AfKrLCcGymrOd
 w9trbl1eb7tnG8iAb3FQM67iXiMNljXJcj2O1I2qquRWpOYcOCCMQ7U9CMtW1feA8215MKAkJA
 rkoTeY2Wfa+x6+7DHx5iaw29sbBicf62HkS3r33ZkFChjAiSIIyotL63tlHcH52uydCL/uidI8
 sblydUGoICsMqiLjTvP8xsvu6O39gAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=CHO2mHwrm92wINaWstQ8U09Ky5omfheOG0ViEni1uMQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiV2dj/A4la90pq8Wq3OcJqogArhyATRztD94
 Xi05WVnQ66JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYldgAKCRDO6LjWAjRy
 uvzVD/9eazRIIipWQcMIGhXHhDnbX12Xk7FphJC2LDJIasxsO2zJmF0JEiZItCVxRH6Q/vsPn6i
 2Tmv0aIg3rjiBz25ONamSVsBVWKnuQf3hbfwe+jxyL0LhS/quJG7mcbG44PvJUKv+c9RO7tGab0
 +fWWOfaw+o7u+tqLzdWPQmB7VibTRBZ1n4aEpFVXZ0TeN2N+XSfR2ZgMeCG6+fj7pViDFYqB9bC
 /LVv8zcm70ISlqZ/AmCj7w6NImCeRcW2D7nUs+5nvbGY/W2BzxDOJOegyskmJDwHzDJv7ytvfet
 pPGsbeVJQiU/cDaI66ioPUmJ/tsbX3ZsFijLW1XYrBquvoXwdRPor6uDXjNAqWT9eohCC8SC5yU
 BjH3VIN69FzboxL2IGduOZRPbRQ4MMp/SqL/T4Y5REhOUDV6ze9Qe9BnqfBU4aCXK0C+4eynj0i
 5mRCtY3KROIXtHW0Wby24JBMJmxP403ZAwgnwNWh+IYAzMYoi1dpW19f0JeJACnvTGaxvJVRqrX
 7KeHLa6wPbeFVl/U+udLk/DPDXD9xZhNbarn19Fki9nqH+KMalllC4T6YfNJnuy8xB1kQ1UfeoQ
 3bKfl7uAStXfVi4G9cGxbAB5YVI/eJfAkdT8t/6rmILA/re2QvqNq69wvw92KVCwxkDwu9PVbNC
 9egFCemFXC4tR0w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series adds support for the Display Process Unit (DPU) Clock
Management Unit (CMU) aka CMU_DPU found on gs101. These will be used for
the IOMMU and display enablement.

As all the patches will go via Krzysztof tree it has been sent as one
series.

regards,

Peter.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
- alphanumeric for cmu_top children in .c & .h files (André)
- collect up tags
- Link to v2: https://lore.kernel.org/r/20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org

Changes in v2:
- Fix alphanumeric ordering (Krzysztof)
- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
- Fix dout_dpu_busp parent (Peter)
- Rebased onto next-20260109
- Link to v1: https://lore.kernel.org/r/20251120-dpu-clocks-v1-0-11508054eab8@linaro.org

---
Peter Griffin (5):
      dt-bindings: clock: google,gs101-clock: fix alphanumeric ordering
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      dt-bindings: samsung: exynos-sysreg: add gs101 dpu compatible
      clk: samsung: gs101: add support for Display Process Unit (DPU) clocks
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes

 .../bindings/clock/google,gs101-clock.yaml         |  21 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  17 ++
 drivers/clk/samsung/clk-gs101.c                    | 283 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           |  36 +++
 5 files changed, 358 insertions(+), 1 deletion(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251120-dpu-clocks-7b825d05807a

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

