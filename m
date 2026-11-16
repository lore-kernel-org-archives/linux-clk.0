Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807278;
	b=nzUpGXl6sn9D2Dk6xOMJXTTtWbCbyWqwZ+lZ6cAdDQxSzgberswNNvhUO/yQWRzvQiCH
	 R7Bt737oA9LRmeBPvvp65XJCWmQXn7K3tV5bgLpWVkmZIJXvbQ6NePBfj/VFJhOg0o/0t
	 sGBreSrw7UlCu6b04r0xw22xSPLtElB90EFTN49kUHyLvZkCxq+Rm/7ZzQE6PxK6pbuSh
	 sgeoWbErvnOOVtAgv5TEK3cTFbwMwQAVupX/zL1feDnLJ1qGl0qPzW9/4c5Lk+fifTh1/
	 sNz7e70OG+r25lSrcTamjVrTAGvyqSJ/tpc2DQyvq+iyh1L89bGaOMevcaC2AQxWHmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=0iugytr+4pMOyvrTdqvL8cJlt/QPONvtCT6C3jF7UoBpIQUET1UZfPBBJ6lrH6KSJ2vd
	 6sG+xvNhpdE6DkuO9bQ9wcjtxXRSKh8GRHvHWcmXL++JAGBKdpoVh8uGS80LhjGMStUZG
	 EOQiFlgMRyCeSf3kmRpIkYtf2QNPYioJQb9UbpDG+xMxAJhq201CWbdd9pV3evgSIDfQp
	 TdzNeezPi+LLtWA5aUtLaIPeiz3S0zIlLQOqkt4urU4LtoHGOE8Q8OU4oLq0Tw4ewRGHj
	 oIa232zHL0D7g+ypTgr6NqmCXEk/jTkE8b4sOX1s9jpmXDFIfpEVYwIB4QcJrw9NzLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9kf1Z+x;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A32606A32F
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A32606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9kf1Z+x
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18818daa3e7so1370530c88.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 21:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807277; x=1795412077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=A9kf1Z+xZAI+O4NImLVZ1du3+v+O27Jx4WofylUUmF9RFtoG1LQXRwitighsJgZfqi
         bDR74J4ta2cYOj1P2ia7fjprfYCcH0n1C2DO2PrNddBsf7xBT0cgB9dK2w3zZzUoM0Ui
         E/9AaBdwIG6dyB6jPetrfXbxH5tuhm2jMySWBXeq31wwhMcVnWTGXqcUEh3VQ92gZT1E
         uUvQAD7M0or+QQwUMFB5UcDyDCDYh1tUKryBkM+GVGjD8XLlEgkLdp4Z+WqAuRoD8e3J
         uOQL7Rh+OzGltnWJp+mA166rBe2WF+QZiMCx9T8a9xYT3dOiOAcJwskNuwwlQG3WySsX
         e4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807277; x=1795412077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=FxC6yMEn3cdmljY7cKyb17R4SdDF9M8j5lNSFS+SzpPKEOe2H+sfgKwLSErjeUIZlZ
         iEtOikKIHdcjlwFJmkCH9fwQf+uMbEuGIa57Bmb0Syg1v52xuBoq5Nvtbol1UtnwHIa3
         A4Xu1eL64hcr6xBU49xkaQmzkZ0F3u3erGOxaZs0Z6Z/Mu+zPNEjx4H4gAMQkzjDV3B9
         fMISzfochIsflkRDO8PfGEhOJ9k9HklDWCHjwo6wyV8HJuMo8U1e63dLzWpBN6JozCXL
         aYSDmwvd5AgkLs3miBd6PRfbIKePJnGoZI7f39OgTGELT1xYVs8fJQ35tXC1B9bxExmq
         Q+Ug==
X-Forwarded-Encrypted: i=1; AL+hErERNwNX8zA49TjbWqIWtsU1nwZYfdNTeTg5+lOOzeitOQH7IsV9skSSAICLSuRF6QddgirhtlssnoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lz3tPeSLpln7/P6lWHTjlvoShhdvBb2BlQUWE07tQKGY4Ic9q
	fWCB5sIU/hVR5wbkthYu2bdC46HSEPFfAmfGcTRGtXmCC4mYBI5349hg
X-Gm-Gg: AYBFou3A0+h0VBp5voqbjkGpJcajomTaK6f1icmnpyemEzVfZzt6thJ59pxzfuR3+li
	mbLxczVVlRDTNTxkVs0kySiTI9MoAhuCZZ8Roinmdh8gxz7PmsPModHQ4f57nBO7COYsda2ckg4
	olh3muvCil7r91dzr2FzoXTbdTAg0TQlGuTfXiE8SZkQcrtbfipmIL8VwrjBBloufRTLA6qW4N4
	IIT9+q6t/KCn98Xn4XotisOtOt8X5jVVH58m4WrGcGGOGzMcG2eBFLWz9G/TsPz7Mp+Wb2g914q
	mpobZsXJirQtLe3NUjGqfaCqhuK+FhTnL5IIV/LYYskWJbAeauKBEKor8pm7hp4W+RLzcUJBoyR
	4MyF1BrINjLwBMbbsWsHs+nLz7Nq9l5YRJjs9fjFT7LXxnoNvsA6I4dkfBqtuoghV6f7CTWpr+9
	ZG1pEkYNHTubzvS4omQlzTNKWYhF4969hkKY2iggZImETTYR4WXQpuoApvIVetl9nTo0myDJzOZ
	XHeEdbdK5DmVeffQ1Pf3UmZVqLPVWZtobWAjuId/H/RdlIWjVsCz1zY5lu9ZP79hxPWsr7Qeb0X
	jzsjCE5ciziKFSPFthnDdiuMiPdFf3GxSa8FAvTi0bA0xg+xcQifMxMo8TfviK1QTwlm0aUC2g9
	u+8qz
X-Received: by 2002:a05:701a:844c:20b0:19d:233:989d with SMTP id a92af1059eb24-1b5030ad3bdmr8391819c88.14.1794807277352;
        Sun, 15 Nov 2026 21:34:37 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:36 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:48 +0000
Subject: [PATCH v15 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261116-sm7250-v15-4-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
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
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=GfWIYZ4Rdr47qL4uVzwmq3cHBxuZuZfauAK9SuR+lb6tJOGaW7G3JO5uex+TMga7n417jmp6t
 uDxoG1lyLysAGDzg6fS3Jl0jgyrf7wGrThcMpQTEmnFiL14C5GZ0vFS
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

