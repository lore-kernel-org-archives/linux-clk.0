Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFC928BABB
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055799; cv=none; b=VPDedX203CtkrLD64ZfPC/iiEDW6cnHAwW9BfX3DQvXgiJD4gVuP/3riBPKRYjC4ObPm6Jjr++1zFog8nCKLQw+emetZ3zTzioOfExlHRgFgsID2V2VuycBkl5yGkKc/INg2TIj4pol98L4lVO5GHDDJhscRlJInv+n+9oXXXP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055799; c=relaxed/simple;
	bh=LxMkKb5hgW8cAQlNkcmWm9X1PpNrjirxZmIseahJ6W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSTnqwCPQwfCX4AsXfYHaFidvYb7r1ecl2hPgpLTAPbQZDY7AT1aeOWu/sqfmnBXW4noKiF7aHYhUFfiTyvlcAqUQ8/dDzjOlictgAXRH8Uu6582tGLNuTxsDqH+yzWHgl134vPjRD9NVSPYhKFwwl2SH9EYzM6dC8aE1/bJGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLSFuKtk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLSFuKtk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4537deebb01so31628475e9.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055794; x=1752660594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbOIQ7E1kZS/+21cXjdFZh+OYTVjRBSsv4Y2mT/dCkc=;
        b=WLSFuKtkvYKZmcz/iM1CeBnBF9vOR7Rq6MWwTZAqd2CJ9Uk9DWv2zZj6Hj90sOEeHw
         wn4rnSSPDCWMVyLf66v7GQUnwIxdnG6QXHYqhTzAsl7EhEiGKnNB1KL7yCs0jEcbfmE4
         xkEsAXi37B7OAJmBaZjCMI+dQLfQVIf0Qu2yRX/Jhgu9s7+ucZ3VnQEuE3+y5uWdJyW6
         fKgFX6GiX3KBAQtWZzW6fSJmhDNLDpqQwnefYFbBPG9qjmsWPX+OWvD4ggF25TC81cPM
         au4rG597SwGFLsxS/6ARY+yc0i4xnn/0fcPaOMX+3udJqoSa+h0NJrccnMvQdd+C+M6b
         5+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055794; x=1752660594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbOIQ7E1kZS/+21cXjdFZh+OYTVjRBSsv4Y2mT/dCkc=;
        b=sOIJabmzYteMC32kEn2QlG0FjycVWcCpHAdj4hGmCEX7BDYEMwvYtM/Rjem99wIjor
         G7ka56tlziz9XfQ1hUzRIHFTNfXEOdePP0ZzTeW0KzxltCPGa0RxvarPK1UiEHaBmRQT
         nU/3IY4LnggriplPudWCoEyl4oD5YDWZCmTGFdVi9v+P1p+1s3Bz52wHgqUeTjRl6Xhr
         COz+ZipNpYF3/PdEHJ947UDEw/UDI2usII0VTEp5s0etC6i3tLe3BpRhjhctzFzmod3+
         zOfdRDJRgPCNphAkLrimVrpK1ki9r2HCOcVdFw2q/2eulDjYcdWstn0pLYqC2dRzPQxK
         V5tA==
X-Forwarded-Encrypted: i=1; AJvYcCX/Gs5FDW1wnfXuL1ucaSZHbWDHYpySeC9bp4ww9b1ooRnR1oQkeMJpp0F5WfMb5F65+YTtxWcSIqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2I73imuo2ecS/Jeo+SD31h2u9RdwNxgcBJC+kc3+j0FztwWv
	9aPJ1NFZ3AVGNXmAFiC3AUmubLkjw4+5UVr3hbx6tScfhh27jETmcZN1YXv0ZilZAMU=
X-Gm-Gg: ASbGncuFLqk4h5tuETbuDESb/u6evwk8JRv8414KlMcxcaIRXJhgl0Mhrrtbbihv67U
	2JA8FUpvvwppJyPRY3xd/IZSvy1hbE+LzyYMUHDwQb9choue/gFV4x5QlGjHwvbyoGjGOrN+rav
	lo1CqohvdLjtuqTEx8zu3xFWfKCLOK8zxGPw7rkn+/Qju+IFK59UaimeEkxf6hhNYwQWfFskLRc
	TkCr5cmbIgpVJz3CsspOSq6DM/5friWHl3yh48Hi3y4lwdlslw8EfPYlxw5Vqo76xcYfK/bOhUj
	E9y2f3J5t49cas6/KjxRCqobTRX9nsLhPDNWGh91IlrpCR15tgR82nA53vpgCmPsP4NYjDroVk4
	AOw==
X-Google-Smtp-Source: AGHT+IGJCRy2yXBuJPF8rLO5PJrDnfPVSKiuDW0McfOpT3Cn3c63cry4nGGcVEDSDD3axp6iyvUJiQ==
X-Received: by 2002:a05:600c:a305:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-454d532eeecmr13729955e9.2.1752055793564;
        Wed, 09 Jul 2025 03:09:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:53 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:56 +0200
Subject: [PATCH v2 4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 video resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-4-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing video resets that are needed for the iris video codec.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 include/dt-bindings/clock/qcom,x1e80100-gcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
index 24ba9e2a5cf6c31e6e88c682e6bfcc60490d692d..710c340f24a57d799ac04650fbe9d4ea0f294bde 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
@@ -482,4 +482,6 @@
 #define GCC_USB_1_PHY_BCR					85
 #define GCC_USB_2_PHY_BCR					86
 #define GCC_VIDEO_BCR						87
+#define GCC_VIDEO_AXI0_CLK_ARES					88
+#define GCC_VIDEO_AXI1_CLK_ARES					89
 #endif

-- 
2.49.0

