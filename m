Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EF421253
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576817; cv=none; b=lY4I0VyfEq2NMuNb6AYCRkxqNnLdEgIw8sz53LvSo+TYtqWghXcMA1FAt/I1+PBlvyaWLdxH/9leqiEK85y+KGNL2WU5myh2XLg9LZZifGUHp+4ULDaJmqHyGWEvGQX2sk4zKsRv7vIFLMB/Qecy7TdFxbx3ACkLOGYgLlxxGW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576817; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/lKh3kDyuTvaxuOhbQTXU0TIHxKD6znFjpxpKJieYrkhVl6m3JEEu60/HANdPMSxIWBZjlqGYRJwjB6eG8Z3pNio0ZxsVVyKts6DIAY0TyFTmt2gB9dTbGlmxwPragi4h/alfYJkqT4I7wRHMHct6V4J/v+eq4r0mZDH28tYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FR4ldn4+; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FR4ldn4+"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso2054779a12.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576815; x=1788181615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=FR4ldn4+0piraMrYiGpAT5yAvUsgGTNMIaDUDHRkGNjLabNaCiuNYz+yhgFO+uZ7KD
         ljgQklwBfFcEK9uisZYjF80BfeHVWFKfXJoXSt6Ef6aBfse63Dr+Q6gTeSG1lsiq8E1e
         A9FpuflxRcLf7WghoNBUAPW7OHg3kBuNn9/aFfdK16tJ7fSk0mLlCa0neGIue8pTbTMU
         RMr70B8unMIaTnTJSItezUK6+a6Z5pCivH/SSckiq7MTNphl9eMhDdRbxpX+8ebZfWTa
         BXPhobbTkcMwI59YLzliwRJ/mF6u/+197G/jYZN04v6fIDqX13LinD2N7HtSLEy/sYGj
         WEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576815; x=1788181615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=lXTPJI2q8Y3fKIJB5GTrUPLS1BGuMINJMIg2Iab8fUEP99G1Oelsk77saalxSbFMM9
         gR9rHrLqCVCbYLLX9g7eWB1cFnpbJ0NLItyhi0YD2NPqAZXKy1rFKbW8/Kh62VvVWAU+
         za5+yGwaVPXX88KqErj0XLZxl2H5td4yquaeIcO+ZAfxLDvNNUi70TRTAvRE+XeV7YRB
         cvY3HQ8xMAFZ4ZpAtr4AJk+JvbKiiebmghvm84YcQ9qefSNZAMPH6/ZYRtypuPq5fIoS
         8SqRRWkmGwij8N1T1ajO4f93k2ilnK9b9nn1KFBn6pW2nk+3LQJ7PdCVIHQfTnrOLtXx
         dBxw==
X-Forwarded-Encrypted: i=1; AHgh+Rqk3A06pY/tZK4/o8h2yqM7GIZ5PzC/3gALY9Ttom4URGEcYz6bn96LmhFKkHsKna25b9ydLtQYhUA=@vger.kernel.org
X-Gm-Message-State: AFuF++nAz0K0+3AwzGcWqhDH7Z3EqZa/TnfdHiht1P0d+mwPreMxZGT2
	5Ry1y6aH/j5Zq5K5wCU4cYiTn2yvBHBB1aJGNoDeiNm2WZyc2xakUogR
X-Gm-Gg: AR+sD13ePV3b/1QypDaIw1jY4Nn7cRNp98z8U/eKCk8TWsd3Y01OMHkESjMdYM1nlsp
	0NiVG/ARVfHnSkS0TzqiviafquMvbae7FiWgE2tK65spwlIeYAIg3jyenIvnz/f+SVt9S5+5EVV
	FQ27TV4CXaI/QxbbQhW1oIQesue5vE7zdEoi4oruTsUE2EHYQT0j/6nkxL3AKAjchn2PfsNHpZw
	TWPXbzfehLR1rKx2j6PAmfxynxkwNpRgV3bWo6USP4OJA5P6iD/Ub+A6GVojwlbzraITGPznvXD
	5uR+xsy3EnJTQheudfvFq9aljHwodvWlpljcA6nNFzUq2M3/T5LvSmwRAaBIpMcdi8dXZo809aU
	8wq/nI8rGY8tZeHazt6vCOc9cxAm+QYPH7AMPTC7x/cjKbHXRmewc5VbW3DO21SvYVTkbnh0dvS
	T1NDKMGgiRkD4v49rdZJTG2pzMaeONUdevPS9tKb3t3uEEUXivgvxUNp668svvyYbvLiA51m7A4
	kJB6wCJWxhTeXJovaxO/fhD
X-Received: by 2002:a17:90b:33c2:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395c3597c56mr43924218a91.5.1787576815440;
        Mon, 24 Aug 2026 06:06:55 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:55 -0700 (PDT)
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
	taniya.das@oss.qualcomm.com,
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
Subject: [PATCH v5 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Mon, 24 Aug 2026 13:04:35 +0000
Message-ID: <20260824130437.2771-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
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

