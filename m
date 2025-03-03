Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C6023A9AB
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042537; cv=none; b=HESzN+SFihDaaGnT2n0FYovSCHvif4PZ1lMEK+2uQtRP/5evwnNK7a2hCTR3CgaQ0iF1lFM7nSHTh/+yYc3xSgilGkDNPvruZzxbOdMUMrheUgGuL5jLNnGth2TLAAa5ojEfa5OpAhuqs8Y1qk+3Gb+OQOI5lD27xYcA7hnL/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042537; c=relaxed/simple;
	bh=cFE6qDwi1fJylD2s+lQiGN8Qez/xInkZpe/71LGwZvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqiONVfNRYvlDliwd7S1+QtHvOKfEvU4OkkZLrbn43NCNe3nhA3GXQVqvmlxV1Or8lze5AiH86oPZxvXRY8OMdpG9NC8PBjG8aq3vnwMVhMAWuL6Xh9LoRK5U5vS2uDfh2WtPA51mgdTgjg+K4h2pXiu7NjZtvqIsah0i9Q7yac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQCu7DmU; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQCu7DmU"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bade9a246so3052471fa.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 14:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741042533; x=1741647333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msppfnamUUGgJpFy91ELuhvjtms4xYNjAzSexKS9iEM=;
        b=SQCu7DmUyoW66aZC0hQmREmKph5ZHXoiCbBagqpaGQ2uDwwoS2RjR2iYEfnuXqKOaa
         D4oiRbo5LKedtT+1VHCeh2u0PKxpFOxJ50IFj7mRfidSsEM1XpS4ABqgRqgNImmyzy8F
         +/Lt2Yq6Z67tK1OtY8bUhtCVBLx0an4dn2lB+uzVcvIjIhkROQXc+KjhIopPRsDA0VSL
         fcBkoBt2Ib+ieCUAk6h4lLFY8Ywhoqy1bK3QYqWCCx4nSHZPDwtS9Xe41Gw/2J229f8w
         6+DuNHCjlrJqt/peFDYm/8Q6O8JJNpsou+ihTjBWJ/N2KX23ekmu3fP+oBX4T3sY2s2l
         NIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042533; x=1741647333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msppfnamUUGgJpFy91ELuhvjtms4xYNjAzSexKS9iEM=;
        b=Gw9jjMpGa6z0c1kKjuEV8Y9RsAOC4LSwCWMwR29HFzhC8phykVmglBdk5XuvvCIlXs
         zg695Qsb3K4rqdR4t68VzE8pGcYnWmUZvI1UV7F9GTSvnoRCtp7dboVnlS2PMzHnGAHr
         mTIKzu+OJa6ZeI1LBFW/6nPai1oxD1uV0xQiVxsFA0fsa08a7MAIeNHDNbzpjl5BEdh2
         8CRUB9MrnKtZmO6BJypmBjiKclS85gXJAGt5Reom3vGPwLKbd4DiOzkTIhmWw2JsyLn8
         J+FnNokn3jBo9rdxgnqDhWLz50ZAe2/wKmfxABzKH0qFTUAcpetJzDH/iJPEh1ED1MZM
         Sjtg==
X-Forwarded-Encrypted: i=1; AJvYcCW59eGmAzPjp09LrSwREX0e74ccDR30W4pKdjLDZhHflR0vSn3x6iMvVup8PwnHoGA4IOAAwJnOYk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmYPV+4Zgj8Q8VzEpnxMxN7x7YDYxPSanukmQ1SSCDI8aS2AT
	2WZOuze31v30wC3QQGAeUD1qvreiWBlRp404oNV0ApSJrgERtJFiiX0LsRgfljY=
X-Gm-Gg: ASbGncvPW45QzRGfsLwxUbq6gzEQNSfqiV3i00jjnvwouwd9motxGUgqZ2I7aOb2E4l
	NDq7iYt5MaPrlktihII5D9AXk1tESeO/lKAz1J8FSGH6IiZMadKVThfc+lBA5etbG/eEwbEPDeR
	nqROleXUzb7shETNmAphUVOuTWoN8X8W5ndrvzXTFbTxXl63z27YNeyJ/yjiXoTQaKQ84AloQSl
	zUehOdxDansVw4wyRm7fetKNno4ZfWzwwlgYxVvDD0PHRgTjAdqQj5BV8gwqiZzF/wIJJuXvJPq
	GpajqpDVDcC0bAX/gT+SB/+yjI81NxBSbUFMxurOvDYROAAHmxnuBm3FbUyVS9MIVVsvpIf61Hh
	PkOQzMJ1uJJyXHRj5ntWA4zc5PWLEs1TYKA==
X-Google-Smtp-Source: AGHT+IFIz9OgAP1Nf0cMNCjQ5eIctZ65Z5mYLBJRd33pRm/cFHeBwdUYbtthRjYfB2mhF2ZBPgxgFA==
X-Received: by 2002:a05:6512:b0a:b0:545:bda:f22 with SMTP id 2adb3069b0e04-54975fc58aamr78263e87.8.1741042533524;
        Mon, 03 Mar 2025 14:55:33 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495f630cb5sm662059e87.212.2025.03.03.14.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:55:32 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8550: camcc: Manage MMCX and MXC
Date: Tue,  4 Mar 2025 00:55:19 +0200
Message-ID: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was discovered that on SM8550 platform Camera Clock controller shall
manage MMCX and MXC power domains, otherwise MMIO access to CCI or CAMSS
breaks the execution, the problem has been discussed with Jagadeesh at
https://lore.kernel.org/all/a5540676-9402-45c4-b647-02fdc2b92233@quicinc.com/

Since 'power-domains' property becomes generalized, Rob asked to remove
its description, which is done in the first patch of the series, see
https://lore.kernel.org/all/20240927224833.GA159707-robh@kernel.org/

Vladimir Zapolskiy (2):
  dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
  arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 ++-
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.43.0

