Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD5182B4
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729126687; cv=none; b=a/GsUDE1jSHk+H5nmcuxkXgbYaS0p1ONtOMyjDsEoPLrU7SDlF3P5zp+sOB6FeAeekDEDh5+aGyIw3ma8kb59Q3We3ypdOo4s5CE7tdSmkaDfCcKIf07F78k3AwL6fDM7eD8XUkwvrhSUgG9NSOQf/xIyp15BZk7a9bn6E6noko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729126687; c=relaxed/simple;
	bh=o/hKjkpIXN5X9YEh3aqgzH3lbQ/mZRL25pDg6BvBfrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksPcuHipPoZUUgcf69qE/kBrtVWXZcmnyJoQk89FnybNIyLXomCbZ6Th6XJUWQaLP7AhWuSZb5cqu6Q20kEPMiFaM4ljOkULPUJY3KI0kMwp3w9LVkF1TpSImpY1wTddLbFomBMSO2yrSaEeLKjL7l0PttYH1HGo90y9GZlOOLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wdAMqi4N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdAMqi4N"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431286f50e1so5706095e9.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Oct 2024 17:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729126683; x=1729731483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1maisugeZXRPQVK8E0aCsP5z+6Oqs6IPuJ8CXduzX8=;
        b=wdAMqi4NpIkv3+wQQddefEBlIA+ca6dfI8RW/OIoZ6poMb8K/uIZHYfFnPE6ZcbTee
         L+5gReaS/9nY49ZoGJQrC+bkZr2BEHTPTLzWfmlsoYFZ8wOWdvVBS5hxkRWPyGJ1iuhD
         Ffz3tGKC9R4vLPhq/CmJHtY/RMK1lgC+qd10SCbP3CBPwFvHVc8cEKDF7CVL7Bjs+AmR
         RMsPGAaq3xs4/Eo1daCQGTiqDgd4KSm7C+drjU1Mktje0BWM91aSWJ4hwRphtphNO2MD
         8XRx64SwP8m99wtAOAwE1mqBMjeJvI5C/3NENuTvlOsavx99Sw1T/gZtz+yZv7vNA1ch
         /ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729126683; x=1729731483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1maisugeZXRPQVK8E0aCsP5z+6Oqs6IPuJ8CXduzX8=;
        b=XYbcgSPrtenwJ9UA9IhOxQJEN+7r6S2U2GtgTiIwqEPYp7umAfC7nEh3iZb1g5rp2w
         zkCNEwm19jRmTnq7XaYeILjLm3ncdC0vreM/aEGeuPR37g9S4FhrNlmUFxPc0W0e453y
         UItQJUnGGjGIe/P1Jb0DQDlkiqktK0r7BAo/YH8GINShfWc7hfqJzphJkyEvIDYZjry1
         hR6c2WFY9u8CyxJxOFgZId/TfNWMzYDQ/VjqpUJZWepKh/iYJ16o/qS1JuGRZk12yNeQ
         jgaiXaTGylRgkdgC6WpQdLqQ3zEPX/KqEQNwjfX0doDDJmaSHBEQBsW4sds/vdKyEooG
         tV1w==
X-Forwarded-Encrypted: i=1; AJvYcCV+5qgFBx0nzFfrqRLs48mQ+gR8ZUFtVKJzNbvmYS4oodYF7aHaZ1Z2tV7sQZT/9qzBU9hYS1gQNUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybCRFuQrrr86vRJGWJeN3zcp4H0RSQz3xGNc+CPV5XZXD7DLww
	WC/s1bG4loasRo9esv93yTwsCPrVhy0sI9JA3iksEpYSaBdkf7q2JDuxuJhG/0k=
X-Google-Smtp-Source: AGHT+IHQOZdoVHwdDnPmYo0BPHF99KOUTkgQrhJaQe7J8+H2TN4TWG6rm3GApCnqm8iB7/Op/pBa0Q==
X-Received: by 2002:a05:600c:1c9e:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-431255dae1bmr185559755e9.11.1729126683234;
        Wed, 16 Oct 2024 17:58:03 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa9053csm5657259f8f.59.2024.10.16.17.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 17:58:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Qualcomm sm6115 LPASS clock controller
Date: Thu, 17 Oct 2024 01:57:58 +0100
Message-ID: <20241017005800.1175419-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is one of the required dependencies for audio support on sm6115 and
its derivatives SoCs. This was written by Konrad Dybcio, however his linaro
email is already invalid. Konrad suggested sending it as-is and keeping
him in c/c. Some updates may be still required, for instance the
maintainers line in DT bindings file.

This was tested on QRB4210 (Qualcomm RB2 board). The only changes from my
side were fixing compilation errors and small changes in commit messages.

Konrad Dybcio (2):
  dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
  clk: qcom: Add SM6115 LPASSCC

 .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 53 ++++++++++++
 drivers/clk/qcom/Kconfig                      |  9 ++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-sm6115.c             | 85 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++
 5 files changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-sm6115.c
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h

-- 
2.45.2

