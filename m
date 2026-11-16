Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807308;
	b=RbPF6L5Nk12HzTxBrGOXF2R9GDwfHgLvxLlxs1BOx0HIW3HDwNakD1+F8opY6UWxbpx6
	 4LbtiQLQajkiTaKpO0x4r4wHTgJ7sqYysnEksDL4NQfiX0Mr3DLuben3QV/jwoQEkEhpU
	 WFxj+Q7maag4WQ9I7Shu6nBZZdOTN90gGa0wwv4AMA5KRf2V1fF1oQWNWWWkfhAlQG5Ba
	 7IWdqDbXdJVHELUli2FsvDJx8aST6aTs0hx6r03ar0l8ImblripNrQuKKMjtpyRvj6f3j
	 TIKPVYjpZ/tjkvY85Z0GXUH+wximpAIzITU+fnUqJdkfXvi/EK/uqrltJ4QEl5CusMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=PQdX5AMWXWdvWSJjuHSVgFHzuEgaZKgmGHmbPb+sKUlIdtURALo1U0oIEXuq9A3d5TPK
	 jhFHBLUHPWXP4SB+luT+BXnthrFON+BTAhVo+dtQfFs0zE3Xs+sHSDB7J+kUKif1gES8v
	 7GmeygrldSYygbaC+tFXQbX5kbBQLvBsrJk5t0UdEOvAo6NU0fuQaGiH2bTv793IzIQ3F
	 mLN0v6bFSsk50ZDJM7caLZMp+wrRyAokb8VXMp/PNyIJQa4ByQk0VBg+hVkym48MHUkH0
	 raoGausN0ho9wP4XO5bgxApryZq9SiNNM1hRX1p7JKx515+PVlOxVAXlhREFc0HejlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtmcJfzq;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98FC606A32F
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D98FC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtmcJfzq
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3331296c88.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 21:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807307; x=1795412107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=gtmcJfzqFlYh9d0VyRYPkwL85gT8VgY6z67ijGu0jwBTfoh7XzAVMXNXtbceVD7vBK
         f/LFyzuhqMPw4pUswhDVWBTqw5YAktZY95axELCGP4ZJfLye3mbWg5PqX14PvIfPXvFD
         jifUYkREMx9ZUNpGakCHIaadFE3zXgmzrZ7cbIY8OJpF2ivHHcKk9xQ0YV24MUePsMW3
         T/PAG/AnY0bCp/qwlfZoGiCYv0exUXKlbnNLJpEhnGniPB+aIcHv9/sVgWo/4jL26N2Q
         sr4YXYbzvWguag/oMlcsj1W3t89G3muDcdGN9bywCRTIqdRkp7RJUsRbNEOtlHmxO7l2
         3mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807307; x=1795412107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=CGnY+txs1Zw9O+q5qUZybM+Z3oXF4Wzd+kZpgaWSRgQiFr8JcMP5gtZWZ0uzNkGF2q
         nGqOjoc3JMuz539+tVEJTmx0oxHnQme2eJesx25Ni6iQ7brPyLWeap48F9miZOuRFtCX
         kBPLMI9XmFj3Zxcp5Zg9TaYeFAIylWQkyS9IS3nWMc78JIAm+f5yTGLP79fVeeWXhQoB
         IIhlIO6xm8yIMguvNxRVdeQ0hPE9+b2pDo+Aad1j3EhFD7voLZZgrK7Ruc042H6xvuSl
         anY//7rvPDGhccm6/xoS6fLGBsYe1aLVw/bEedswa4u7KQyj0hjs6JdjvZ6n4xZ9g/kr
         n7qQ==
X-Forwarded-Encrypted: i=1; AL+hErErct0s/F5lSr2hh1zQPcLhIPyD+FEqzU/jFUDppAV4pRZoYahHn1zx3MFig9MHfBrcRKKjMHU9uZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WqmjmpDWc+wby6++MQsYjXXzebMRxoGxSLqcszAvZfgHgKWvU
	oZ6YlunBVIWCVcIAhetOChb9q8Jzgj8917XiBVcdInh7il0RNPHSApbl
X-Gm-Gg: AYBFou3QdZuaG62IQ4X7VdHxPScRt+SqRJr+PeqPO2mF3BR4+ozbN9IxHDM2UO/6tv+
	za38/rqe8saUMn5Wzyegh/0rLmMsgXX/E1k7Jq/0C4BQEbi7hJT+dOpgpDzhBmzHNe1UFfaLkSi
	tQqaWWQf/BOGbpc7xHQA1CB+AgrIgexaCDSqlAe5eNsmln7XD7x6PriWtbmiAtdfkCA5mXTqPty
	oIItZOPRVQ8QSrX2YB/HYGz+tLLMAlObT1lEPqpdcdhopbqVCkj20/41lBu+ws5HFAv0HmyysZF
	e3a0lzjSj5BaNL0FnaKycuZPPbz6yDjmPUQy9E0s7nzOSz61nDqJSNTuJz9MX2bd9AzezMTyIla
	rsnjghTZ9TjxBuTDEPb94mV472DdS9JEXXuIKch8SfGrxBlqoAgkOgFyNRmOLPe2t06GNkTnBEU
	hN5CUhMVo04KKtSk3bUZ0O0t5SdZ3HJsO03kDEvEYWiFHxKqKmsV5vNhzTh9SSGIjzFUiJGvAQr
	8SXF2Mq78NYTb+bGC5KhhN264VMtbL/IHoMPErsRu4WXZnAzu5t3QwziVOJueO0wjKGxV2M1fmL
	UjmG3TxKkA0JjcbiWXHpE3+0uUwIIjsfbpCIE+u/oZgQq32IZem39DtE88HcAUMcwiFg1TNAUJQ
	TkjkJ
X-Received: by 2002:a05:701a:cccc:20b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b532d780bbmr1029121c88.30.1794807306985;
        Sun, 15 Nov 2026 21:35:06 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:35:06 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:51 +0000
Subject: [PATCH v15 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261116-sm7250-v15-7-6acbb232fef8@gmail.com>
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
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=hoggoWb5jYIyIe6oCAJ+uw0gr7l4FQRLq2gxxhWWrRSTin9c8YLMUPS0qAHLKvjnJhZnO3guj
 zwZPzqxzYjzAoNywaOEbGWxmFGqS3ST3v5/P7mGL67kEI0MsM+mhyK6
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

