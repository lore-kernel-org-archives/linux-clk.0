Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8D13DB83
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235964; cv=none; b=f8/cfbLMK1P8R3wqp6hI5b6TMc4Diin/F1T183BOSW0cW1U/K3dhnnKGU/w4ppVOYMNzBfReXeZ86sT6jKP1HAhshthTFHrnkeLZa5zL0KY3KvnzXsWe68c4UJobb/Sk1SQdVDPLPaLtqxDL+R1/De5D4mMSQC1IpjDNuDMt904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235964; c=relaxed/simple;
	bh=7KHXkSiw3G2cL0hHR90JF2g8MSUEbE7fJYE8XhmJ2hA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QfKfDC4R89qAoNZUZuXe4MYRvjXiHQ1a1cg1U3q+Uaq5QEEdc27KQgZ3dKpyHO3vAeSDCmOPgmYggemM8duP6foCf8M0FNwkg0HNY0v4BCokl9+x3tBnt7XlZRIGqMmrmhmmK37+eQcyCdxFDFda9q/jSFjj4ORO8PEcp7UrA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7rTFSjB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7rTFSjB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3632a6437d7so2523833f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719235960; x=1719840760; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i63v09sV0tTGN/3CN/lUxe+ocEmeawwsZ2O+wqtiMdY=;
        b=u7rTFSjBRQOdJb/2ttfvtvUdTHxLJGwkxGdBRv2zt2ddEvaV9yV8CuZU5k8W2n+1Xw
         L21P8bETdjwNZwuZc9Q/1E7rVLHzIYBNIgdhAsj4A1ftaq0ScLWqiiCpvGRykBc25u9o
         FNx+OJTY4HQVjfgTob18S07F/WaKvseY3ap+tdZSSLpak2yKRpWTDRmJU3NIDw+ZLaqx
         txTQS9Kar8whOVUTq1hOKt3mJmLgQwU0A9S4BIRMpIKQVoeFUj/T2LzlxA+EkzJ20Dmf
         YiwVKovoXwx5nwcTg/MSmIbDWGK4WxeFQc9dzXHq8afb5NmOkKU1+kaf+QbRARbYetNQ
         cdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719235960; x=1719840760;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i63v09sV0tTGN/3CN/lUxe+ocEmeawwsZ2O+wqtiMdY=;
        b=jb76QLOR3WwDyAoajXaXkru9VfNWejMUxwabZC0ov2A1ZRcM8Hei3lAWr0nWVrWAGH
         FJd4+oHP1lC9jnNHShSOpU+bEoaVl+DAS3ccwC42nbMlJyA3Kmh8K/N73pRuHhIT8QR8
         RMNxpey0z8cVTgFzsCmSlqtLJeqgY7KwWjtt3TRNjdWaEux/SRWPxNSIdWCS/961UZOz
         MMZoGWK02i+zz6wFvxN09CNvkE9ecfVdOgFEix1JdKRNccKEFlaZC28NNgudlQz72ggN
         hx6mGEVkUr2XohV/0RwZcp7tK2CdGdpDry6xwJaRMVGCsm5BlAtbsvSPGIWAn+aNcoYQ
         I3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUlXEfIcziJ8R/mdKXmmzD7YBj/u7acqky69p99gGnAc4HXeR4ecfS+Uondf+UENxaXg4IJFYEBwIWZTy4GMgvhg2PdZ1U5ZEOc
X-Gm-Message-State: AOJu0YxEIAZMAmufAvHqViRoY8hM/TfHk0DVcJJSrqtQ/oCKvRvoGVSb
	Ar1nqXY/O4fDp14ThbbvbCHtL981G+TUcclCt1irYpHkQYLBcjw3+esgYwieJM8=
X-Google-Smtp-Source: AGHT+IE4SN9gQRJbIu0u6FodUMhsPJCIqcZC7gf1k65l9XMDPiGEOXnzYwwzkZQjwtfhzTam4uGILA==
X-Received: by 2002:adf:f990:0:b0:361:e909:60c3 with SMTP id ffacd0b85a97d-366e3267fb9mr4464756f8f.9.1719235960019;
        Mon, 24 Jun 2024 06:32:40 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366f7406f4dsm1888274f8f.114.2024.06.24.06.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:32:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: x1e80100: Add soundwire
 controller resets
Date: Mon, 24 Jun 2024 14:32:35 +0100
Message-Id: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN1eWYC/3WNQQ6CMBBFr0K6dkxbCIgr72FYtHQKk2irU4IYw
 t0t7F2+//PyVpGQCZO4FqtgnClRDBn0qRD9aMKAQC6z0FJXstYVLAohfRgYE04gVVt76xt78a3
 IjjUJwbIJ/bhb7z4+wUeGgMu0/y9GT8vRu3eZR0pT5O+Rn9W+/ivNCiQ4U+rayaYsXXV7UDAcz
 5EH0W3b9gPScq9jywAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=7KHXkSiw3G2cL0hHR90JF2g8MSUEbE7fJYE8XhmJ2hA=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmeXV2FihPkTNyQFaxVnVV8Ez3xGG+fon5oAYL+
 0Nf+l5Y0ZWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnl1dgAKCRB6of1ZxzRV
 N80VCACmXKLC+CFKab5XrBN3rQA9JR1VEZIkPu2OWm9+AXi30FzKhuuSjsxgkXj3tbWhJzvAIgt
 y6ldwqxwuy5YPlnNKdALkICl9wshQz23JtQqaGSTikgrxRjSAwrzYXSWWGA1v+4+MmtibDgOPfj
 CDUSDoL6+3n3JiS7X37tch7wN26SdZSbhhgXH1A2jgQKBwZihRN9PHsaYJ17XbI/64KWKpDMSTU
 wtCLmGSGbItEe4ZVUwg/yqlnkLcq9XZ8i89we3DhRnjP7f/l8Sfc0dLZMxS1/jNpCRxPodsHAHJ
 gRADD17sgjKyFDVCDC8MyJaaNLMDevQ/Hya95I7evNf2CLi1
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Soundwire resets are missing in the existing dts, add resets for all the 4
instances of Soundwire controllers (WSA, WSA2, RX, TX).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes in v2:
- fixed dt bindings.
- Link to v1: https://lore.kernel.org/r/20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org

---
Srinivas Kandagatla (3):
      dt-bindings: clock: Add x1e80100 LPASS AUDIOCC reset controller
      dt-bindings: clock: Add x1e80100 LPASSCC reset controller
      arm64: dts: qcom: x1e80100: add soundwire controller resets

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      | 13 +++++++++---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 23 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)
---
base-commit: 781025f172e19ca5682d7bfc5243e7aa74c4977f
change-id: 20240624-x1e-swr-reset-0196fbf7b8f9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

