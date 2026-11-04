Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778410;
	b=gEA0iU+pZd1JSbHx+X3x93dNHFj78o0NaAVZICn8DCAYmk+tN3Y/U6OR0NqHdgwAHuc8
	 CA2mC3CRFTB0TX3b3JggmNU7EJEC9xTGkMrHficx+UzPwKiqowZhbBMUJhYeRLqHpAzT4
	 GcMEGBCQzlkBVvfyVadUKRavFhCZxTUxTQI2wtjqnoOPAYKNfDhGa8GsSD/jD4wlDYPRl
	 9eLWRxgR/eddbD1z01K94EOqI7TcvKjKwQnxyig1P52MUSUKlvz5dSMUV9FHTZ9YvxM7/
	 Gn00txsJSxjUMR7qtAFZURudVu1YNnVCtTgW3u54Fkmh1oE3BjlyWVxW4zDeWa0ePjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=NaVg+GYXnS1uF9/cmQOp7mnf5JLi+WBBc+U6mQ078nts3w0NupMPdq4bUbAAcmiY3Usp
	 cPvL73l/iZlgjngabQ2upkJtjpj0SNZrVrlZuDWpAeoAQTaXnehuqrnblN7fHlvX6ZQDH
	 qmKpcEX4Bgety3FqACA5HkuhwwNbUq7UOav2tTuqpLEz/zkioiYptgw5MtCeCsPVwFVKZ
	 erev1qHup4lzMpO0lD+6WmX71PNN7T3atZZKKhMhqtdE5YEfa++lqTrh+lPZuCySF/QA+
	 2T29D0zCX7ZJFMRIFKjscJVpZoTYdMxjjZA9vewsAcjupMpsmNYBI+6ql9PPm/XqQfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV3ynZL2;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2BE606A33D
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 07:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2BE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV3ynZL2
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35c76e9614aso489024eec.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 23:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778409; x=1794383209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=sV3ynZL2djp/uSfXZHC9ADdJ2Xf7y9fXRV3nczxd92MjSP4LgMOOaBP1T9LpwyvOfe
         Znql1e8wAVB0kHXK+wF94w0TqsBJFhULKM90WcGi1ELan/WbL1I8lKhy8sYBVJ+/7Tfi
         W5s7n/F0aBc1icuzGa8GlwKmTIHx8dLKxVmxUCK9eOpP+RFggQsiTgp3pl3z56AWI/6R
         JzpB541XSbN7HUQKzg/FJlevLki2JSj3BLb+sKG/cXdpN43Kxcp2W2EJAmG67WJKyq2G
         hjQPVIsExLqUJmZjlpbdp/nF4Vttuwc6RFL3s01X3cJ+IGFXTMrWZZGkYYrflGWLT0Vn
         y7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778409; x=1794383209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=KpLplL0a2GYQ9Ha2CmSJUp9iwBWP2ZhPezccAk5F1oUTFlDaGP8OLp2xxR6qkafut0
         OY7oLhUwCn7uDVzKEIYQOlJeXExB2vSb5ceCfAEot3B7VvzIzDOkFPX1EcC+zXrmw5u7
         B4MbHMzhSLHFWI21f8MrZdGuzkzk+FEq5wS7MguhxsvRWNUZF/HxxPO2UPGsYiznnYGS
         B9OPpkUErt6XR03om/isU4R2pZeaPXASuT97sA9BueeUXqnFDK9ETfujGMZ12Nb1aeqX
         lv5ODNAHLfqincmNTFhLevQ8pmZfnYNRBCAOEzDbxAaCSyc7N+zcYRkIO7F/IT2C2ArP
         qRZw==
X-Forwarded-Encrypted: i=1; AKwUvBwD3Bi611jZI3DccjlPV5VEkUQ83fIKT/AVJodVCd5SkeS0CiT/QaNgv3mykVPHzfyQG2XF96sV6FU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UdA1/4CBM0zNTm8b9/QbvWmUH7/pT7Y/29ma70NS/dHmMhY5z
	BtchjipDo3tAUa15av7X6cKjeljeDN0wzMo/MPjovAbC7fPuOZWr12l4xNIc7Q==
X-Gm-Gg: AYBFou32CfskqeKW8DtVB1HDb/IU1SnNUM6Lsxh5vZLexKJX89h4OC1knlVt2spRUsn
	ISdYZLoy7JKNUHJCiGGqSFA0zYVp+rIn5yOfktcx/EmMK8J7vKHqPrRJ0rmRXLCtsN4haefM8Iw
	fE+iJuI/7eKWQ3e2CySn3/7IlrFIKOAchZsrv1eAsaGdDIb8effCDaUXnaLYnwwyWgvOBMCD0VB
	wKLNzWgXWExlIJ33dD3xW5paXWScQiW3loBrjvwdAJ7nwL91P7jMYqtck6CC0hfy3uobu0zWg/C
	meynFAtRny/vIsKJyLWXOEsf4Rquy00xUM1iMiXd7RyaiY1Vo2hp/99y8+axf4oYFJI2j01mrvg
	Ge/pGP4EXVrzEICF1GfjjmI9koQvQq5UwmRuytKVHMFuwqYlv+o46RBv0wfWQETquNNzXtNuHFi
	ur4WFpoW+pkAsr0j1O+2eo+aByes26CNAH1La51mca3v8L+sZt6yjsSqSsWWiEl2nfCnqb/T1it
	uC24NtKjVv4YHJFrVJrciUWa+J6+vi/T6UDNO0/xh7LKmzmraUsMkolgQhc3yCFLy2UprAMX9HW
	TV7K83hDASZZ+oqwZyrxDzGfVmoSaRFsZMvXxtk6ILAcHa81Xj6hP+a4htmMeVnLOiBVFwNWzHg
	AbB6zkA==
X-Received: by 2002:a05:693c:42d9:b0:369:f18f:3492 with SMTP id 5a478bee46e88-36a423fbc3amr23892888eec.35.1793778409284;
        Tue, 03 Nov 2026 23:46:49 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:48 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:06 +0000
Subject: [PATCH v12 3/6] dt-bindings: firmware: qcom,scm: Document SM7250
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
Message-Id: <20261104-master-v12-3-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=He+lmNaewUvT9cE0bl4y22+ugSs3dJvjKw92KlKpQtRY9AvK5BMkrVzkdj8zXEZl8fG8GPtLL
 uKhSpXXDFh5DROYlAe28kXAKP55HN9uHwz3XLOcdD+pVNlTNmMJWUri
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

