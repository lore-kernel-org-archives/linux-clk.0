Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669165;
	b=C2ijwMm2F4jUt3/vHPaQbfzQM2YANLrJrYBqjhcoK656X+exq78q5enmJToNiTzEQEXr
	 y7aEPwkDpm6wY/51/Si4zU1hmWHNYwgn76UXDJkAaIaRTK8bObZMXaXov6W7xkOBsG2Bv
	 R/lmSmpnf9DvYdqnlyda23U8ThBe1CKvNuVHavrgtujpl0ueAZhH6AbZCUk0abn1CVJx2
	 LYDoOcr5nCp++mw6n8w4ocE3oc7hbyhHavhJ9weWGjdl5K5mjy66OWIm9nl4kQvDTSD3t
	 dDe0IqZ7P6iFAFafKYA1Ia0EWn6eyrXMzSVydlB7Ea3U41shYjJ8y9w0yaca8oEwqkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=smY97t7d2VeCj+0On0M93YY/S1inLsNqG3un6gMJ/o7g9kbYShkOJjoKZjFgAREQ9US7
	 ZGk01amoIWF4RNd4xmrklyuo5Oz4uy5DwaDFkCaCzvOXuTSyKinzmNxwfkTcq44FgrQCQ
	 TZoXAjvckEKffzYEGbwZC4ikiw/OkROtJ4LNvxwYcSIvduMKz9bToSbkY/fHVdSD/+68P
	 XuQj9okZ4skfXAg7RZ/utMN9jYphP3FC40D265B8p8KouNo5uLnBFnQErf7DUdZiOnBwh
	 ubwdmCImIY/kByqghE5JZti192ODUJ4Llw/S8WtdXMb+T8jKsqNuwbTn95g9jt9aVQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0EUPNu5;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CF606A31E
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 04:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8CF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0EUPNu5
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386ab9ab619so8535879eec.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669164; x=1796273964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=g0EUPNu5vCG1KDaEwv7YBLGPLoMP8KZ7WoVFgrp5ESMpyu+wnidD/QLjIVYThZWUke
         Ub1fy5iT1lyS1Qhheq8ppbHt23EmO4mUDGw1PnB/2unVy2R2bty/WC0iuhmSLyp0Vtol
         2YEieXVlMiqDv7YQ9yxEeaT7nJeW6ag0YunW+V496cdBOJMzP0NzKs+3mbwbv+GGBKav
         JUNncL7d7oCSkyDB8BzA7VhpkDJ4+jsHDI1xIbf9en0rpLFzRBJ6a8R+6il36uFagNYs
         I/bhcBDhOPC6Rr9qb5NJeYOwMjbU9ZOQlVVJIJyVDQK6v2RMFlEEdD6L7CfvPq/ECj4W
         5tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669164; x=1796273964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=nDYr8LeV491/I/5DJ20ir0jjRwIzqt4JojgZvCgf89KjfSzvULkFcklgXwkm2VpTvZ
         +fM37rcsTL2Y/VjY7jmpLtItijCSO66zmRk0V3qZHRHO0prY+dz0HTy9MbWyH89z7fsh
         po6QTvDd7ASqnLQP/ALd04HOIx7KF5Cqkq3wTeiupKIbkNbpFOEoz9mRk0Rd37g3byg0
         i6muXQZSU0UAS+ZK2QMNo88KXzDVQ7xUPhEnI+7yZ0l9tq3+sBAysFZeThZAojj04EJ5
         FTQ4vjSMmtM/3h/MaYKn1gy7GE/XolHlLbrpCaccsUMGvhlpWpVUq6dJs8v5deMI2rIr
         qQ1g==
X-Forwarded-Encrypted: i=1; AL+hErFJEKQRB+nR8O3VBovvWf/ygIgyejzFLQOGBrm0jzuc/dYHsb3e6AZIJwVc7ojQXnipPwTiF9hiwjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hbsXPLNAP7fMLwaXdKLYJ9Nqbp3kxcjvR1RAAMIK0iSam1h6r
	KTceau6oaIRtweHVDs4OH/xtrRDVmm6oO7Z1+bvTnUNCMHPH45ODUnYt
X-Gm-Gg: AZFdTZdOukly+1vYeEXpKCtSLMV1jn1BfYc3kCdIx2L7gKhx/tkNpRqsY6uAzgcRtCD
	HxRmecq8RgosWYQ2VVaNNi1iBReahSFFIOCH1+Ak5DGj5UuSmMqTBmzw9z7cArNdxfbAgexjPCm
	e6Xlyjho7EE2q2MBIv0ogK47f62bxmFIOBgEKFvoYBbj0E2/iTBEX3JaF+lb4VsARLz53OKPLC1
	rllEVEbh3NUAjJjOrwPGOsyMxN00+jehbcKYd98yCJ0BuEPOHyAuxST8aIKwAy+mX5rdeW6YCYT
	MZCzBE1j9u9vhkMjfMRuJdvJWI0QADVMF1l+QWmtkGqEzHs3g2i5jUbf535oPyxbKGfmDsnPAx6
	ScPJ6oI86Ujp+uP0++z0wQjRBANBjDFwVmmpDnojuZ/bO5N39EzuDHhpBnJfukkkeuWPG01EUr5
	dj/dCdM0dH8aT6wuUJQSKRgwm4Cq6T1seY8vTi5XzZrBlH13jx44QKptCwuKmy6WT682WQ1MuTr
	WqicSmDOCzt5bPM8ayl1UDQAfeuDx3+PcFv0K6HFkSMChOEcjs0ZqhEvZceXnNbAipqZzRiYdMj
	ilmbZiVA/O8kC/kJoxqXBITkqpjWsFU3335VKy4jCRoAmZJCf/2VEZD+Ob2Pin9xqW2YoZL5ix8
	o9kQ+tZN8nrb/aSP8Shk6ib0GYFVX
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr24177940eec.32.1795669164035;
        Wed, 25 Nov 2026 20:59:24 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:23 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:11 +0000
Subject: [PATCH RESEND v15 6/8] dt-bindings: firmware: qcom,scm: Document
 SM7250 SCM
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-sm7250-v15-6-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=r2mgp8vyKY7YS6WEV6WlbjzksgxAH2OHXCWlysqnGLfAg4qb8dWAEbzAtXsFTcCD/KseGgpZX
 PcFCJVXO5ABAnOZzv5+RU8kim3m9XyqAWQLCECJmV50I6nzgtR+FIy6
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

