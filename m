Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315AF430CD5
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300031; cv=none; b=ZXmcMBB7FFOcJVkNwu57Wz9mG8PTtvNwIkFtzCDOP/fnAQNCqmqoxi4CU2EH8l8sZDD+1Bmshvb1/TOqzRfcJvqQbKX6QZBskKABho6Ku/tUTBgDLyZHCWDNe0nYzzLLBOiF2O23RiQ72THr098oBN2wILz+YWlEzOfl+JtCSps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300031; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CB6YY6tTE7N+PAMaUBGJL3vY39RnKwLzCK4xTcoHO9sE+MjwwQ7qFY2REaZtvogfbHPSqY0XrG3lBdbXBvnTwcsywMSbLSnDAkT+1w0y+FmEXi0LAmCt/12m2DhSfhy0DgaITyssE1+8W1vOMYWvOeiTCgfWclJHG1tPPzf9k3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJoK4GYg; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJoK4GYg"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedf433a99so747607a12.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 01:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300029; x=1787904829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=EJoK4GYgFSAzpEh9YFNwO5Mk5s9sNwBHyWF80DghZE5kc988pKUQnL/P/xAfGxEphb
         Vu6zPWJhXpiSGypkiAQnv/q12VG7AULICtGMcIL76VD9rYJFtG3gdi2zdj3sxmi57AHk
         iQ2ojaO/6l+V/Zd7+h8eIcitIlPnbfRPmWDPX5OtKnY96px1juK9wbcR68npe3/q8woN
         oSWdb/AILgHZFt/pVqH3sgDEvJc2eM0AiJ63N6X4bIuexU9fMdq6+irjcrWmEmWIK8uW
         9Dkt+TwpHjTZePmkTaqR82A/WjVa/4ZfD6CbHw/VEt0KSb4OC50k/uDP9YU6DZrIfDFq
         NCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300029; x=1787904829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=FGeYOCXy34DpfUbctEvMJRGN3mrUr96xKMrYP9TGXRcnXWa71gPawc+Bps3vRDMRms
         svfupHTH72PPk0GrIl/1f8BJc8Ktk1eQO5vflqtOvseaJ8GlJqpL9cwChr6ucgu+kK5W
         YzTVWEHq122Wv0UjLHCuTTKbjVCfjf9SNLthKwfziiDjQLAEvANwgtrv1o41InrilrKb
         lkIv27lmsQz4u1bSZpl3zFcpQYJKub0eehIeXvCSL6EfzjUZNSepp4jAIemi+yblxopm
         Ydv6be3xr7AMPnQfZbAGPqmMMRE3laFVxWBrbMJIL44OOgWHP7Z0jUUdlKDczHm6VZR8
         8pfw==
X-Forwarded-Encrypted: i=1; AHgh+RpC337IzG4STEmcGd9yMn69wH4G7stetPNIpawu6ZHuoo2OmeSNIJAL+XduF2wcCfa2izX7kxOd/EQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ks3V+6wsysxWDk8TJiZ7nHJLlXmPCLzjYI8RiwR/n7CBdt2ddc
	dywM9Q7roJZlzlMXFiG0bGkscQ4pRTGGY7iGuxJdkbMUACkX5lsNvX4I
X-Gm-Gg: AR+sD11cOdYOeEGENWowJniqvPkbv93Px1g18A5mDDDm3LhybJRlrll3EPIBL+Q9eDu
	0OZHa98yAYllNBUni3x6X0atbs7VlwIe4W6gA5fDD20C3WDbOFtuAW+3N2gZF6ajSNz0rZ65Y7X
	swdYUZRBpJYqa6IzBuFVq7zSPpoVe0xszGqe/qVPnIcACUz+dqxDOOZA6nS5UrGQNtigthgytdM
	WP2mrJTVanasB2Q+rpEI9W6q8aqXQh1Z09n+nGTIG7SzOdSHI8GD82Payf3Nxale6mvmf+bX1ZA
	6WHy5m6++wUAwbb1/+AO3hhBQuXS7phoKektYKvKno9F5UMkLsdfku2H4KQoJeQzlA2Iz0dE/ON
	guq5GgqCjlRXSEoFZoQV87xk9GM85Wuz4dj/lY0+6gUAKtZ/UXI6BhX5LZiQtg6fzQby+QvyX0E
	3Z4Y//Qp162VQeAiUhQ9H/123G1ced9ov8tCgikdLdiRnWrrdZv6kf7Wk2lh8CfnALZSnsiIJzQ
	OuxHfpSI6KF
X-Received: by 2002:a17:90b:2d0e:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-395c2f65bfbmr9339432a91.0.1787300029568;
        Fri, 21 Aug 2026 01:13:49 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:49 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v3 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Fri, 21 Aug 2026 08:11:23 +0000
Message-ID: <20260821081125.4522-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

