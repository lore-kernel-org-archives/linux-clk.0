Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978215;
	b=Z01DHqoDkXo7CJ6GN5+YL/OgA3Jt+R49Wo+osP6XvmD1N6/LoaLeLD2/PtyxtmOYVc3a
	 t221sPUI+TO0Yor44gT0JAOQGrnIEglP40j1v5RO5fZ3K4it7tgJ9f8zxmHCgDZ1wU+pj
	 3rBVe5kfdHdU3LWWrhDNIsRfN7n1eBvc+vbvAaevU5Ce441RK6X4pvY04+Y0N8XbV/Hua
	 XRsBguRrgJp9/QiWdsCuCsiY4AhskvY4s5R2V+AFmpYZHvAanx2BXCMHQlqYmLK85G3XP
	 1HWIT2GYZvn0ZY24YooXEJZ8tnLBaLvD3JuFS357j+RgWr8Mgh5mP/JGJdU40K9RDkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=Ev7nF7Ht6YOuhhuTliJ6qjUDE2+K2gG8MUVF7x0kRFKblNRGp0HonFnULUwDO2rE4dRX
	 kDBTtjI44qZJabyG4YhqmiSsQg/JgTuLZAwGqN/v9YEaXX/SfFSnQOMOxGyML8u/EuU1N
	 ULWQnRY884lna/rUTT41Otqo4PvWBCbhGM5oFWsOqRYqAj+wCM9s5HDKVFJyuL/1XGLlq
	 nUlPsFqBRE5YHvjBLuHOqPyafZPMaChX+fHvOwv3Bzi50wgFxS4TFmH4jwKzb29ueoWnr
	 bbTIlPqdxeA6HuuLG/0MLDlVI4L47tWz+ns6sdIPXkSwETftxaCFt6++hdFxsYCcryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ2mv+wU;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2D606A333
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 15:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE2D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ2mv+wU
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1216393eec.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978214; x=1794583014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=UJ2mv+wUuXXO8u7SnP18fog6WaoiWwvWKnKvySMt7qV+3dlB2tt7iqeGvpAW1lrpi1
         z26GL514JQI4LJBgGjfHjRWMXWdE+euTdx0gAVgfRRsDDwK4O/3wCVVkVMr2atlDb6Sm
         fFLUzM0NZ1RvVn+om0BPvHoP4E4az7uFs5K9W7DWpegBIKSJZ7wMWJj7cAeQQAyrVeld
         cBfu7mHCX2BfrtH2PNu/Zr+UkPcmxPKP94S3Qp5JGnA83bfvm59addxBC5XCsj24ItmS
         bV6qYppWswv+1CAuZ9YWG7jer6QcEHI3i+6GZCmzAbLANmEVqn2zxFIhiDDaBvwgrXU9
         oi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978214; x=1794583014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=ExYuzR1+YKx28ZZz0lKqk0yrLtZf/LmUCMvXtDDM2GQK+93Pdxnb2PbkpASzJTpKMp
         7kr7HYUkcJzUx2DK2oUl501j0n/HEULVw7gBnvh4Bb2eEN9YnVhjOAvbzO16ke92sbIQ
         Sf7MydLfmQ19aTAjPDh2cq/IAMM6SBl7yvPpHlTqBOWgYoBSMoyNCoMSuFOl7iP4dOvg
         cxFlKCJ7PWrxA5Sah1IVkbf5ObaG5myGRSZA0ofu3CtBnykB0MgHDiyNRc2dk4/mXwUh
         WUKQ3FPPoU0dNZn8juocj3gs+WFHSce9WSq2fYCy/YKqsS9S96V2S6bBufw+v+lG4Mq4
         M6YQ==
X-Forwarded-Encrypted: i=1; AL+hErEwZnK7F6pJHob8npolWtKP4J3awSUvgvTMVHOgqCMX62nMY9bX9wccN2vOwx6EOCdo1cDW1C13YZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Nb3DDQw5T+0oYwkO/DFgQ+b2YmwpAyOyowDoWzJ82Qysuu2V
	bMvoQSCT4QzkZ66pJSU89WtPFy/bqnJXzw7Ezv/1JGd6elcF9jIdZHyc
X-Gm-Gg: AYBFou1e2q65D82JTHKfZDU/5ZCWqlyhFp03tlFaRJmdG6RbdjwJ3auzbdrYw+j5ARS
	uRdVuaGjWygLLJOP4gmov1VTtxwAcb3zynVaFCZv2kxoVU0CLaI0Y7h2jSxWpP6D77jUjuIE6sd
	krCIym6zGQlVUOW3Y7SvNdu70bBsnspQjPLseKPXQA5oOJUsYvwyXwv9r4lvsa6pEmyZGNggS64
	P6+sHuX94ty45mcVD27AonYjk5/AfWzPpg1Q1V1UTzaLipRGdGolKQubbkMSbaArv8HlOlDbFGm
	mxBVT+uEf4t+7y5VuhHuqeMO7qBmZnGL7fq15ouNkuNXFPZjMz7T1lzXAgbxDnGGdCA20YUxwg7
	NROmn1uCq/TCjUZ1FyjVu8JlG2i32PLd1/ApV7c8WxbbrC3QhD+sYgb1at6H6cOy+r2djD2jAhL
	RfP0hon/OvwkHp0c2yx48p/8Zb+mOk6B3hRvowmhO5smxxbr9uA3UrcjIlYUXBEUCDXS6+N+d8O
	6no1reNV0coAIiCUdJEgtiPp4AU7sIKKdV4FbEO+4iJCfk69gJ6+dhbNkH0QkxuSy6+HYkcNOfM
	jwev0r30/1JVOFUb/hOexn2etOWJpfVhVTTYAafGvWfU4vogl9pALXihkrCpGmBukpXauVOFO48
	zqwQdgGI=
X-Received: by 2002:a05:7301:190b:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36f75441608mr3747167eec.8.1793978213641;
        Fri, 06 Nov 2026 07:16:53 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:53 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:41 +0000
Subject: [PATCH v14 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261106-sm7250-v14-6-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=OJ/c3M3Wj0MaC02qVOKVTq5RLwsCER55eDtOI+BRvMbrJSwx6IJqxbkHqxxEctBHahiXCn3E/
 t4J9wrrf/FLD651S4+JcGBDdZwjERY/JULmn2DDTAIq5nBSrcU7QL5V
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

