Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BB413BACA
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713882671; cv=none; b=VUfoFGcIhvHJuCi84F7pm9A0rRB1QVF5DKUW81hsMv6zuRrvGrCtI+mXmka+/AMDt/9+aSbp6Yoy20Hnk+dZganS3LzS4KMQv5OhWaN15enZcJxzIpfBsMrQSxARYlYWHQlCr/EOwFLYaf5v4tvBLafAlyD8xqhBgfUNYqedL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713882671; c=relaxed/simple;
	bh=+YH2zKNvfrQqZ4esdPy7vnvlXDgMvu54ag6LcGuFPeM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DEPaiGRNB+t8qtMbmF5haeJuDJ5nBIx0fx3VvkPqGC4lCm7peJKMzivtIEKzO3+JCB5c9r9P1eRiAnbmMiE7R7V8cyM2CBh7zHCPzCHS9cbNl+jfCp1PkyN7Rnc1rA6hPtW87nt+RB5qVbapyrq29HWcrrWmIrqYy0Xs1kcEhTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YnGPfWC+; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YnGPfWC+"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572250b7704so531860a12.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713882667; x=1714487467; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XN7XhWrqCld2WJI0opNRnIm5kxokt1XlrZPOr6Jx6ao=;
        b=YnGPfWC+2NdbGvd4mVAJkhLCmOljC/PanI2UqKNrEGphf6/XHH3u9OtJlD6zPb0Dbd
         B5Y9R1Sacn/HjpsvjXyGQGp6T55Piei4zm/d9Elnpfdn51kRsbSM8h8cmIN6yE9jSD65
         6JeTgAhUhWf+LXMhGnsNzTZkl2O1/Qxr4+M7lhvJJ3HinU/bPPPa7XfssMRkLB8MCRy7
         jsq9DgeIu4vAIGKnG9FXJZGc45ddk1jFUakrKWDbCJ7Dh/5UheXSYaGEHpe0hGtG0bXD
         ld2r35Sg+rZkRHESWVlOTr3e/qFWtjZ8NVbmWQxjyiomdzwswA9eTYkffFXe3F5V4n4+
         1K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882667; x=1714487467;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN7XhWrqCld2WJI0opNRnIm5kxokt1XlrZPOr6Jx6ao=;
        b=JFdISlwV8pCOgZx4SmkkS7igxmBq9zUGYLSmZaURR+lRiHO+5BV3ZrFaen9FTsdiC7
         jx1AQZtr7lCLOa5112EI/bz/Td6VJ18OzT19JM2gXmzuo0BeX/09sAKQbjCUfqixjsGR
         wo2eVhKudERBAv6T4ILbAttXbqemhC7BS2/n91cWtPgdu+5SnFA+KpG1rSm8AsBfBDiZ
         0xOQMxqte5gL+MENYf5w+pdQgN3WyWxkze7HmEBoT20zRKU+EEd7yeVkIXbY2WSavgnX
         zDiAnUeJC/AeZ1C+ts4d2hJ5+z4FQ3melZPjWaddH1S8jheEzHkB9CRpf4aO8uEiFeBC
         3sIw==
X-Forwarded-Encrypted: i=1; AJvYcCX47nJHCZGUmxDhzqR+DF78LwSk73iX2gt+OERWkg1ICrS1xO0ZegxDMHXnSCs0hTmwR1shb95HHHSz+j3m+E9mOLB0DjfjU0Oe
X-Gm-Message-State: AOJu0YzH0CmeAZ+IelUQ+5Fy1vdtqnZ3qJTe/p31G1jJj3wBJ56CTjJc
	18Bwa4ICxQXjDnHxzNLNb7/wScoe33whLd7206dp6vpAzqF8znG9121RJcyAkc0=
X-Google-Smtp-Source: AGHT+IFkVnrNX1IDHUGi9HUaySI3oc05M9oUsQt/QaI7SlEvCuUbmasv5YX0v5fmV1NffjKybeOPCQ==
X-Received: by 2002:a50:9ec1:0:b0:571:b9ac:ff2e with SMTP id a59-20020a509ec1000000b00571b9acff2emr8291625edf.26.1713882667324;
        Tue, 23 Apr 2024 07:31:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005704957a968sm6708099edb.13.2024.04.23.07.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 07:31:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] HSI0 support for Google Tensor gs101
Date: Tue, 23 Apr 2024 15:31:02 +0100
Message-Id: <20240423-hsi0-gs101-v1-0-2c3ddb50c720@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACbGJ2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEyNj3YziTAPd9GJDA0PdxERzcwtjM8OktMREJaCGgqLUtMwKsGHRsbW
 1APtqc6pcAAAA
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This patch series enable thes HSI0 (high speed interface 0) for gs101. It
feeds the USB block and is a prerequisite to get USB working.

The parts added here have been verified to work OK without the
clk_ignore_unused kernel command line option.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      dt-bindings: clock: google,gs101-clock: add HSI0 clock management unit
      arm64: dts: exynos: gs101: enable cmu-hsi0 clock controller
      clk: samsung: clk-gs101: add cmu_hsi0

 .../bindings/clock/google,gs101-clock.yaml         |  29 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  14 +
 drivers/clk/samsung/clk-gs101.c                    | 468 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           |  54 +++
 4 files changed, 563 insertions(+), 2 deletions(-)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240423-hsi0-gs101-aa778361bfaa

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

