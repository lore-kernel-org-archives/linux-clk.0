Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCCA1898FB
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 00:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469234; cv=none; b=K0UXkydz0W9l4cTUflfyjMQ5dVDgj2E4ZRVa7gbkYyQieC7PCP7U15ky8GAfYHYeq3hLCPMfKjevt9zuabk+SSNAkp+zpqbArumNVaYyzQQJTy8uuZo2T2e7eOTw2oLAD/Rr4F07/pJ1RyJjfJncp6VQKOGpDZNvytcXDlE04KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469234; c=relaxed/simple;
	bh=Fey+/W+7XCC5DReENEFX73Y8A6XquPC4dmr4ORGlTRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIQX9jyGoO3Vc/0LbI+zvT0JhsVi2u7Pe4qqg9AMiwXSLTTiiBnxUfduAk9cpCBMUUjP5hBD7+QsOLnjgfO+SX67fg3ptf1jT9dOs8pO6w0nVBQfVbbuqzP80Q4FmTtCIIXBY5idpZ83W7R1TPkLqCy5Ds1S9afTfyNN4PM3ZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1EPHvZ/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1EPHvZ/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46ed4f66256so76399f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469231; x=1784074031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zd+inJitFkSMF/haZOvtCKkE6zMXknRWkzEpnLBObRI=;
        b=D1EPHvZ/NT/AMVFYpcNh+7Je57VtpKVVQ/8q5qOR2McxQuClL1ddOXB3LT6DuziCil
         o5To30SJO6kn1O7xnaP5I0IkyUtzPtiVIG0G97+gz89QwL23b+y9h1lXihtz1Fa0R6zo
         2F7wIWoYTyeqHOpPna7dChH00vIA6pa4xQ2lRNXI6fgp/6yz647I4AgckGOfm6BsbRMv
         55pegILgzWTpkLMNtcYhOJIit/NfI07a4UaTs71bwvXl5tFLR3b9CN+fgUA3EUpj9Wfv
         9UlFQ9tdlf/5/qL4IFHzKUcYn7C8agvUDOZY3RdciWOdbjOO0+etkoICXcCimCGqOQGD
         JUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469231; x=1784074031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zd+inJitFkSMF/haZOvtCKkE6zMXknRWkzEpnLBObRI=;
        b=K8QsHZP2nHKZzKf2irdqnU6oxFY/jPWIQNsiqt5JxxRRWYtXA0e6JseNd4nn8kQQX3
         3i6raVB10YmoqgtpDx8kNY0o0BcqBPzvgRf2dSL/81jrmaI50/kwfv+zvXpJ/p1W/pXq
         bOPWMhYA/7HURKHc3wxAIhp7nSstgCpapwZYfV8RFE5LYmlGzqQqLLCEGRtu0hwKw+Tu
         5e+/mvaJDnmK26qunI5o5fAx4M2YN5Y0Co3vh6zcWGI+6LNz3pte8SyBDuVm6a6joBad
         uh02qK2XhqvFUUTJRCMkTgATGGcHKA/0z6I91I85Fw8KLVFlRbNGa+kA7h8TN7qNAIXk
         OYNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2KMo0grhzAAUTW+c4KZSa0+4XekeFCe46z/W5PlWxsppwu5OhwyaIezu/mpdtV9qmFVz7hVbfgiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6TOXqTM5gmR8uVq6zfu1ryQT2bHk7laAKA5QtZmcbfVH6NBlI
	iXdlvgiNOGezCaomI/9PApY7wjgxO0PyGb4Z4xG7hb9dQBCwodYCbfoqUUlwp0njnEs=
X-Gm-Gg: AfdE7ckIJanQFOXULTfdOfSGP1OlY+x4LVOQIzuzGOGZWfaZt/ySjccx3CPKIQGFWxt
	WxrC0DVxmawLv8e4qK3SbVt0MaC7+StNIas64PpvjzUY1TYfVaHY6dDg4ityiOympELxkCZ6XcO
	nGLBDGy0hlcC4iH0XCRPyhe3IiM+9y8xZeSIFw0lVQgCvJ6Zy6jJhOxxtPAxXF+97xvpLA2AcZS
	Ecu6+dpUMK0G2P3rhB19hV6YKM3euQX9YV5u1xKiafMK28A8A5QC826JOeEUsKJ5Z6JNyr8ssv/
	H12Yvo0fVQfhHR5ExBLbiTiCjESjQpg7I0l0iwywqGNxwpHf2BEC7agDILPNFAgBUDvg6/nkNTj
	8wGRtJ0NjANaI0z86kDXmV0fEF9tSoSLecSFf+vUIHiidk7X1Xmo7dPB0BwdEvfTHE9OO6tPQDH
	Be+JuYT5MQS30crvObFIXZrd0=
X-Received: by 2002:a5d:4a0f:0:b0:473:b32:ff28 with SMTP id ffacd0b85a97d-47de6644b7dmr6101950f8f.34.1783469230847;
        Tue, 07 Jul 2026 17:07:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:57 +0100
Subject: [PATCH v12 3/6] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-3-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Fey+/W+7XCC5DReENEFX73Y8A6XquPC4dmr4ORGlTRM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSnIwO7RDbt7xUzJzUmsuvZjlPXVORNHmcV/
 zBgF1OqeC6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpwAKCRAicTuzoY3I
 OrzMD/4xiHaBTiPb4JG2qSnj5fgWTIEt3ZtLDoRh/CetULjYEQPLBH5hsjsfk0e6btpOXPrQxp3
 lnKGaVXA+2mq8K4G0uRkw8vv65xIN+qqvYbdMiwYsgTdH8ummxk8W4tvRuCYlW8MPhTNaXpHpIf
 Kk528bQGZr8aGYGlIn8cFXAALnoKlBwBB5NvgsgTlL3xn8CCBzW26hrjQE+a3yciLmx/B7XC/RX
 7NdLCcibOfTP0tnhMD7WYFTZsdVbK6vsrxTI86U7pIkf4YM23VIs57WNxflt9wKBZJeELByfKia
 7GpVNmHaoYG9UlNtf2dFS2mWbxEDgtG2uWX9HnDMQrsFaFn6hXkbx/FZ8qCzJWLwR1GadAOIgJC
 Vy3EjC3uqOz9p0aqRyMd63fTspTR72mo3ok5HjNercfM9UabdbvWeznuY6O3ot4EgVNpi60FzLd
 +4N1cBTSxEDQw4LC4lF1XFWmkjpNs7OlrNg/mVVZTtDnZ1xUHnrnTyLf43rP3lB/JFxSjyqe4Ub
 b0yrfEQBF2e5nntp5pEGHj9ffr27htrWuYqTHrb+7ADbxz8YccYlSWbaz8OBeYarxJFb1wz2duF
 MevatqeiXXLujqmn07kLIv9ATDKUf1zH7TqNwjNwCfUCv/vXD8B5TVImtiXHeTOEk+3DkFjhAlx
 BOUyKECCmiofnUg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Use devm_of_platform_populate() to populate subs in the tree.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..95e655a8b6aa0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.54.0

