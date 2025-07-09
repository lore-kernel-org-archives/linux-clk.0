Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF8C28C029
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055800; cv=none; b=jGdrlasTXCy0MIJDZUaO2JdyDIp8OInPiVhr1HGol5JNs4IRKjnxNBoLZVtspblK5vceTjyOjsfjGjgJWefnAoQ3azpeXt2OATbiURh3GzIRjGLN8vU7xA3pDysUCaKoo5Gn7jQrv9h0vtDP+tClloqWzNjTx0O3Fg/mwQCKzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055800; c=relaxed/simple;
	bh=BtljJoJu29he5h3E1fMJpoxReanEYHNeB8iJaVXCAtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLyhyDKZv/7e0ixE3QH0FEB3L+pIglA6bTe2CMpcwl4/tSib6AxwzFB+A2nPc1UNKNzvwsd4Kgvw3A0oBsIfBijEbQ2iINdyW4ptv0Gg3qRv+UJJYN4B6pN2Ck6ZHaPzhyM6bCKPYGds46TWVKeUz7zag4pzWGqx6gtsZlo9NAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3GGNCFy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3GGNCFy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2998547f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055795; x=1752660595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqgIfbUcailCPKp6TXnf2r6fZEj8c+V9PAnko/MkSqA=;
        b=F3GGNCFydH8nAyZAUz62L0GYK+E0E113B9lAmFB3dQreIF6CN/kVmGOqbgYI96f+d5
         HGZmQW4r2Z8hpDmPGtytPziPWHDrollHp66c2Bmgy2XYuvfbVxOxgN7or2Ijp4SyxhLR
         cufeOylEGPXWy6cfpxLCnMg6x5AnJIAT4VGvARCr07P9zVAPWlp7iepvK8bSd95mL2rp
         5Lnzj1ftoufwFxPveubaMqmo4ntsFIcljw27PBSz4D4a3hElAgmgmL4BPSCs1AJZH43G
         ugqCrqLhTaO2zoglNxFt/pwamiocs4vijK4f7Bsx2MgkT4nzxyOjAHisMOvRdb9ekKwF
         j+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055795; x=1752660595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqgIfbUcailCPKp6TXnf2r6fZEj8c+V9PAnko/MkSqA=;
        b=MZRrktAxa6AHGVogk2VZGLaZLvbUnlXDq5Oz9EkOMHuLNcj3BZ1Y0ERbHhVQqWeLDA
         Ir9ocmp5BYEFIRVgLDhZNnYZJLA+87aynA21cb/zd+Fye5SHpL15vhncYnnaf96AXjFQ
         TMXi/Ape76Oycr3WHG1u/nnqwDryQdxUoyYkygCzBeStH3mIWFPRWu5wNZvTdROffROe
         7ramU3fz8gTVMM6LrwLUY//QGys51VUeAR8O6tyQ398YWj0Ljy6QG1ipqWDylXH/Mzal
         lGZ58wOnZ4rmTtrCtNZknNrBZ5wB1zr1k2LChAlondYexUPtADXru6p7Kzdt7oPagPbU
         eQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkjvjVaB5/tllRx6w4KBHsdKAAuiUsk1gJDHAEEXdmXRbWyOuHCfca7hk66ADLHw1ReCy5O4i0UE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuaqn0/zV0ghZ6ZGsCLSdY+f2TwdFNkZhmWWYOt+rnq9uOe0k1
	TdXkJrPSSsZMqZHpuWs/0ddSzd5LaX+UJbUlgFE3WIxuLR05Dwhtg5tDEQrvNjfUpW0=
X-Gm-Gg: ASbGncvcX0owR/t2NoqdXzby3noj6bEcXTaQbSca463bq0bhPIb8PZbCJpVqtquvr0S
	DnH2Tm8F3MiuVyNcpqK3GpXk/lxLdqBqwzALap1nOu03aQr2VdXXMNJR8tYp1A6axKllo2M2lwe
	0ekc2xHAbkgc0u5F8/aJU3N/HQd1q95rB6+JXovzaLYh1CMDxGoYo2dq1zqme2v0S+O8r+oFthm
	6aipTkK10PdVx3uePxBWHyw2LG7GsVsWGwuooRopvft9iD0OPiADFXWFG8nbgvhkqI/TFQYtZIh
	5w2mnfCKbByOKpfh07Uhitj8o+KU8YXfqnX530ZwhoUkuuQNCEcHggByO7BCGEtkOcrSeoqNMQs
	PxZx5xb2cMaHs
X-Google-Smtp-Source: AGHT+IH+kX8gb16vc2IqysKW8WfIZF3xM6sEokJKtIyslzmvhXUij9HEIcvjHcBwVbgQKslIh5YFWA==
X-Received: by 2002:a05:6000:41e5:b0:3a4:dcfb:3118 with SMTP id ffacd0b85a97d-3b5e44e3ccemr1447480f8f.10.1752055794558;
        Wed, 09 Jul 2025 03:09:54 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:54 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:57 +0200
Subject: [PATCH v2 5/6] clk: qcom: gcc-x1e80100: Add missing video resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-5-ad1acf5674b4@linaro.org>
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
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add the missing video resets that are needed for the iris video codec.
Copied from gcc-sm8550.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-x1e80100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 3e44757e25d3245e455918e9474c978c8dacaa5e..301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6674,6 +6674,8 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
 	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
 	[GCC_USB_2_PHY_BCR] = { 0xa3020 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.49.0

