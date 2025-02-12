Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28E3212FB3
	for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377970; cv=none; b=owcjbIBPa6gxd9m8ycrTw1tEhC60Hho/Th95FVhqyKXKqVBPbEPIgDfybraNjUCDuwm7T/IxBuPVcOH5KvjNdg0nCWg69XtPNFBhZE8m9QWeYtgTrFuyzhWRURoSP3FspC1/iKgefVw5dCWXQ8pTmUmFZUAD5Fqn68NKwSp4SGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377970; c=relaxed/simple;
	bh=uM+rgeiyIG3H/nI3hJGwzzxr1vwwAYELU/clwSlSP0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5ROplRa4vvtTvFWaGS4XQ/13u3hQLmjHrAfj8FJzlXqDXhMQG+f1Pn+4OcHPkAi6OgGDIIcURVgaN4dKPgEvyp9er+L/LfJxdlyJheuzqpxLPQCHTntO/ktLVUSEmQJ37/6xaEogW67XYV7J54EbhpyOKDcY0s2FwqUHNbhO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TR4QmaMS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TR4QmaMS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7ee6f5535so26556566b.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 08:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739377967; x=1739982767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3+GwMSFhqocbDKQfg41i+abCZPRjFt/R7A5GSXrnUk=;
        b=TR4QmaMSTyI3dInttInKYSlUMSiQa/vAht7WqMRcncedRANOJeNfczhQbmODSlgbKV
         9StRjkTtPrf9EY/xCJOAPEHwmi7To1KHjkuKMnqxKmwdxBqllJKTGYhjWM8Iv+OdW80h
         hY4J1/wRRwVoVgm7gwc9k3QascxowxfyWXB8Fquc4P9rb+n6AOZ/N9sXxC2uUhaJmw27
         YPzHVqygaOwKCkuOp/SLN4epm3hd41pg5MITHfUyNbcvEbskgMqVR6gGyR8LlRrHs1Vb
         PhsSH+/DPGmXpu+PmQolSIBYya+tVwZstmWNLd9ODP32l1Y0f03QfXUIs2VJv5GN/Whz
         2Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739377967; x=1739982767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3+GwMSFhqocbDKQfg41i+abCZPRjFt/R7A5GSXrnUk=;
        b=QRL1M8PGXNk4L21Bd98dvoOdaOlfRe7lgp1h4G1Inw9g/5Cgg+IuaZ3dEetjZeW5Xa
         e6qedVfXdAbrccGSnwMBMMK8w+enQ7Cd4VDBxuK08nJg13/tES8LDpJdzmSRZGAQIP2q
         vPpekrgdNLzctcQaKMs+tj+L45R0q48U9tAH2ukQlqhM2sjKhKfCpYyQJiTsMDvEheGh
         vLwbEPGVBTwy5ISwmdv3z+3DnTh9kOhL2janCm0JdVAD6HDBrR2saMpMTM+eKTk8jQQB
         fL3Yb9r+TkUeEcPYuUQTbfzRCmu3meyN7SP1Oa1mCy/vDu32fKEg1r9eFWXN8lC3yS2G
         ycQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS2rY5XQ8MJDrvJZQNzuW59OjFpx216CEW2hgludxWP/4ETUdqcXkld32UOa/cekYlAM3HRf4eZDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWsFh3ftCxsLCtqDyrOPFSXuwZbuQTQQWg/5xk5jEWjeOJE1o7
	IucHe++5JJoNNmazGbjYFPo6iixuQeOgZ8qo1id4mBcLnII4N0YRrB7gy8FE1Jg=
X-Gm-Gg: ASbGnctlVcGP8MFvL2rMEqWjIIjf+9jvmaKe58kWzSigJHfP8OzBNFlycYv2nGQV7PJ
	wlflHzndCt8S93cirL0XmSjJA9LqxhQMyCQCL9fdhwe2D2tNX0bkroOiB/ZrDES+yyhbh/8PKKs
	rxJU7l9JrxD9LNcNrY9rek85X7Co6/fxiDCubRiVfkdr9cnFDdEnBcM9q2ZKkypYdKRIbTclGTm
	UYomh1SFMtTtbyHpEd6uxIqTX2IjhKHjblmpf/CMOLTS9vmpzJPSNU1mg4uJQWZ7iGZVFD8MUaQ
	TXECRGARrbsZU9BNGig8hbWo9/qA4w==
X-Google-Smtp-Source: AGHT+IF8u/EmJRpY1cgIvJEM+EbW+M73tl7S5R2stGgnFzaxNtA80WlogXUtJNIeXD6qOocbR1VfGg==
X-Received: by 2002:a17:907:9719:b0:aa6:9c29:86d1 with SMTP id a640c23a62f3a-ab7f334003emr129760866b.3.1739377966988;
        Wed, 12 Feb 2025 08:32:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a697c2besm917631366b.151.2025.02.12.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:32:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: qcom: dispcc-sm8750: Allow dumping regmap
Date: Wed, 12 Feb 2025 17:32:43 +0100
Message-ID: <20250212163243.237658-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
results in synchronous external abort, so limit the regmap to the last
readable register which allows dumping the regs for debugging.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index e9bca179998b..2c9714788739 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -1881,7 +1881,7 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x11014,
+	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */
 	.fast_io = true,
 };
 
-- 
2.43.0

