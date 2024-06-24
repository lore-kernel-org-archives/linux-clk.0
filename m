Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554B136E3F
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719226553; cv=none; b=Ki5/AOpQlx7ai3fcO+Vs5A4r8WCe5kShtfZb4X5S/W4lxlC02nOEmxTqZXvYu8LBo5VzNiwDYSa8Qq4N4Z5MBsFZAIj5c17rri0mXf4D+UfmOxOAPpmNhwVIASMCIW35kwu4bYymhyzncJgwpKTktN8/pHUVCKEx/gCnwUwQ2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719226553; c=relaxed/simple;
	bh=m93PqmPPYlVm3qNVKHO1OoiEMehyaRVknTRxmok2Igk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pDkRZKJ0hEJh5uhiyPsXjB5nEELOjA+yKWYncncLxd9AiGj9fFzoBi8Ryv51wKbjaxM3MzVJ0XA7/11N48WZojU+l35p+BW/XF9bZPd910Khmth/dyALo20dpTKE0aaB6fOpfTibT79CyHyTxp+ACNSq24PGTvUl6D1DipSZBN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYle4mXz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYle4mXz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso34676315e9.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 03:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719226550; x=1719831350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrY4lNWDw0JNKgEW92bRaQnV7A+B9G4Rjjc9S7WHhug=;
        b=BYle4mXzA7Au1Q2lVSw/2qNZ5jKLb+WtinSNg9pc7uw0j6qgwLnxR9vm2gLWk9u3IZ
         KYui7B5BAs/pIk0qVIagYJdijqtDy4tW4YvZ+pU0avSCnPOIFfSbxFQBXX5ClgWvYvoy
         HPT5E2sXj528jsJI/lN/4f8/tc1w3feU80WXEbY5KCC74VfpKfILuYjOXwnD08T75xLE
         PcXHxwVK4x5rn9xudkiE2b4usnz3zHbrZClMlLjF3bLDvYZG0AmlEN0zokjHTqmvkEF6
         OxXr4dax9LFBGWfCFtkb2FrybmI/Xw9mdH14iA9zhaFY87i0fR/+ZVMPLGsEyuxIs7XM
         pGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719226550; x=1719831350;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrY4lNWDw0JNKgEW92bRaQnV7A+B9G4Rjjc9S7WHhug=;
        b=VrMEo7qfU29iH4pGMWcvpA21i0sxcQnsl07pdOT5xysQd2J9DmRKS/Vt08MDHZ440Y
         Zw2qQrDVCGhtXomyJliHu9vqYOJLhG+njw9ELT33Pf7PyDiaUvBAHDE4VkTQxXi0FEVs
         uMt2IC7BYCKrzi1Tt4u90DdMjVfTSbmUy3dEfAAxaNzBTKYgt87bM+ml55xydF1/cYRC
         A+20NCpVGySUGhJwnX/sbQAqgqnryZLT/M39w9grdedvDJJUffZbAzdnZlCs4ZUdIKja
         iWhJ+UGuY+Zc+wL3bqLXNq9u0LtHDyE8vJw4jmJsTpOqH00cXttesJ7ItUJu1JB9U9vB
         ILtA==
X-Forwarded-Encrypted: i=1; AJvYcCUsnEeqWWLqWqeeXXAqjYqpm2fhK5RS1x830AkW/lcQbSS8hQiVONghRaRGlhhmDtRgVGj1r67DxsubHmikixCXPx+uofU5mFH5
X-Gm-Message-State: AOJu0YySjFJFtRQktDvRdEoQ6JGT+CWNGzfXJDllVhixTVR6UaL7cNSR
	i3kDjTPqtUNamzm3aYealiSXLccvSQLpPkRJ5MLFl8AsG0747Y7Xerxgvk4fkdA=
X-Google-Smtp-Source: AGHT+IHw1NULDpfy7XMXRJ6DWODLoOwVod/uHKQ8uJcE3wFATvr4D6AfzpR6xKNl5BBnD6N+fh2jqw==
X-Received: by 2002:a7b:cc89:0:b0:421:7f4d:525f with SMTP id 5b1f17b1804b1-4248cc35da7mr28663365e9.24.1719226549521;
        Mon, 24 Jun 2024 03:55:49 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b6bsm172479595e9.32.2024.06.24.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 03:55:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: x1e80100: Add soundwire controller
 resets
Date: Mon, 24 Jun 2024 11:55:29 +0100
Message-Id: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKFQeWYC/x2NQQqDMBAAvyJ77kISxNZ+pfSQxN2aQ5N2V2xA/
 Hujx2EYZgMlSaRw7zYQWpOmkhvYSwdx9vlFmKbG4IzrzeB6rJZQf4JCSgsaOw4c+BpuPEJrglf
 CID7H+ai+sbyRi2Cmuhz+I8Spnr/Hc9//Pdx1+38AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=802;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=m93PqmPPYlVm3qNVKHO1OoiEMehyaRVknTRxmok2Igk=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmeVC0Cnfdjgd6Z45SxGBAWvVOkP4/ByB+oynqM
 N+tmwF66b2JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnlQtAAKCRB6of1ZxzRV
 Nz+TCACEtla+qJDMQNeMS6wau+2oS8UC9r8+No4JYzgGKWx7zyR1Cp4PZhZKlaMNw0fHkiqP4vY
 w5BzUOiW7J3cQB9hfWz2uZDiyvN3R2eOhFozBVmNNUjfPtr7YT4S8YAnuV4iMTqAfoXA63t5zAo
 CRGcp3fptScKxrLW4hltFmXwosJYjy3Pv2kxRuSifQ6/ukSb5UKpexcCYEJZ9pOu+8KX0NxDgnv
 7tsA1KmtSPTB9in6qkAuahh/rTXHdCwmZJSsQ2GSYTfzHXOfAWQSBMlnHQBKjgbxHWbZuLTcwOV
 ZQHgw5nQFtuu9Gr6GKW2XYTQPlHgXrzhZmPaxcaYENLQ7UgN
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Soundwire resets are missing in the existing dts, add resets for all the 4
instances of Soundwire controllers (WSA, WSA2, RX, TX).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Srinivas Kandagatla (3):
      dt-bindings: clock: Add x1e80100 LPASS AUDIOCC reset controller
      dt-bindings: clock: Add x1e80100 LPASSCC reset controller
      arm64: dts: qcom: x1e80100: add soundwire controller resets

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      |  2 ++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 23 ++++++++++++++++++++++
 2 files changed, 25 insertions(+)
---
base-commit: 781025f172e19ca5682d7bfc5243e7aa74c4977f
change-id: 20240624-x1e-swr-reset-0196fbf7b8f9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

