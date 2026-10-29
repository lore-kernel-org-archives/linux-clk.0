Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257431;
	b=zqnrvFuZbcfFiRXX0IVGrbfxWf4uE0YHEEROK694/aRc1Mga5nFjWW87yPO1WQyPrul+
	 mY7s0RMvufcqVVajG5cfodt1+j43XbY9aP9AfFeLXqfaSdfsTKq3VgiSNVBjTct0kR1PE
	 F1wEXlPtyMO4fXqUreagaHAUclYfIGNs9OPn6v7+svgQ0mhvDl8a0HG0w2jG8rPFffqn/
	 2QfqCxKNL69l/B+CpJ1864DgbOlS0WskamJ2tgTicYiLueeIhDDv1hZK4oJ49/28wyuMa
	 /GdqmHR+Y0SWtUT8W2lN74A+tm3GdKey5NJPI6J2WSJlIgA/PhxkDazH4PfUNkZeivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=iyOjSwzm1omP9Ofhd/kxjzVZT4pEsngI34ZqHm0vzAQPExjnZaHH+/DCiGavsQWWMjuJ
	 DSHnte/K+RSdPoPsddbiqymq25t10go40VZeHIifyRgc78G2KDp4Ztiss6CYY9fCli1wn
	 cFl1/YoJtUNuZ2b2BloIRKf1pHIThabnnAryXpUB3bEoFC0KOHaXpegI7NuflfCxHEADA
	 UsIN045xzyeToJP9xfmjk8C7rQVv3ETujNtJu/rBGnhIS5UwRM2lmHyykuperdxniK29r
	 C0gIAEZqpNfoK9h19Bl3mkzCzJWdwLGbrxRY4fzsOMJbKFqndkDGNSiBpskaHpLfwXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+pudE1W;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE486606A31A
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 07:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE486606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+pudE1W
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2546685eec.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257430; x=1793862230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=F+pudE1Wz7CqOqPaimvu4Pl/+YNsvoQM/t+U/mEYukGErBeyHWCN272+UtDoWNvHMC
         vAbOVjw5jNDZKqVWvZIigAyIF/4ESJZJg24DbMqgqsPrjUo1VXoyaa84Qnoc6dpgsKow
         JnXYjABw0qcn7QpUtnBpbMfNOIp8jsS/bzIG1KqgA32WsNOOhrTRm0M8ilMrd+WFoIIj
         2Hu6CwA/ZyDT2GE4BajHITQmDKwrg38kvYBXwKRGjaijJByJT/VazKfta/CnxRw+8FlJ
         ut22x4oOCDQDYQeIdnZqr9s59cDhITvsT3mB0kPl54Nkafg1zi2Q1XTY7Hd5k28YU8XO
         lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257430; x=1793862230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=YN6GJm4F4N1Q9mDWUSiLerAEK4nEplKLC1HUJn7uLOANXMbAAdiSy1quuK2/AEFnuz
         UbMSzDouu9si22lRSiC/TYjlkncMilq/WGU5xEO6ebRKZUpwOzB7UX09lfQD5ZRQ4g0V
         cvcXtoKX0YisFa8VZ1OeypAGwoCIWL+Mjma5N2sYqR6iGq86rv95E4yLo4u4AO86qEyd
         KFLkapm2DMNImnldGqtHPy5TiSdA7Kmn/xsBwtHwjxVnqupMHvNkpRkhat8yqjJeKCvy
         LgkYE1gH8CFXVFt+NtV/jzzCgDYt4pCuXtw18B5e+/c+k3yEAfZsrBhfEwyDpD2Dg5x1
         0BbQ==
X-Forwarded-Encrypted: i=1; AKwUvByffZdRNC7RGDPYtG0ZZFVJFGpXKuxLK8aZgSH7qm5UWhBy7k59ShKLIddFhWnwVjSCJEkejw5Elq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3g/qAqyrt1tj0v5iQpW08nSAhJCYW0/9stGA+Tl78+YQkxaB0
	ZaxVNvkCb92ORpDWjhYTyynqOx+nOpj2oZr1xBkMJICPD8ny5fR88V2q
X-Gm-Gg: AYBFou2V6FMi+D63YWt1He66VmtAHbgBH8ajF2fDx9XsFD9By0trGafHr+fN6QPqfrt
	F6GbfWUqRtIJH1fZOc0Q1lD8p+iT5ktJSkU/Vb+497BCD2CgTpHq/3fYd9Q9ldwg/lM639gNTH7
	XC2fFp5DY65IUHSsLurCXccmPBuqnS69kvj7vZgaleqbT01HSrf39S6uCqn5hF0u+Y3wMOjsuVx
	ZROoP9dzj4m3idqrU9DkaMgMRytJk4c6z4or6H8USi7+b3h6/zKgDejpgaebp1hoZXq807vbEoR
	kISeIDIUmamlzucAyELezRlvUW64u1gyhFWylPyHS/2PKaQX50YaXVZlIEed5wfLQdVjWPi93BW
	SqZEanqekgopJq/bjHrFTVkQXXOaxcVvCYRxJz8GU/xtgcskHJ1+7AbkgpJ5LNXvB6d7ZdlCHhM
	6P4slXfKj6bfNW2T3ovQGy/7R99fW6jRiR42lMGj6ngoFzUYSgj5QtsPHv9ragMi6IAhtqQ3wqh
	pJf7oyZQrAPwIhEGQ9feSOl7LYeWvZbbr55CfPy8AIs4JW9oDOjvPnrzmhw5w4K8FKUNk/55W8Z
	RImcZVOBMSg2wqEUBzTTFIpe/92oXeDU5sRjm2B81ldaXQLGjd9TvS1wPorG5QBpFsRd23pabwy
	dGg3IXHuSxXpAA9MPXAp/ZFKAzqH3
X-Received: by 2002:a05:7300:e11a:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-36a200bea2cmr7029875eec.26.1793257429997;
        Thu, 29 Oct 2026 00:03:49 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:49 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:00 +0000
Subject: [PATCH RESEND v11 3/5] dt-bindings: firmware: qcom,scm: Document
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
Message-Id: <20261029-master-v11-3-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
In-Reply-To: <20261029-master-v11-0-2c29e382162c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@mainlining.org>, 
 David Wronek <davidwronek@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=gjdaSkAxoqehvftK1W3o4GIVUIA72A6eMiGKTKK8PKFf4JbbGxuhscbbg/ywU6MqKNl0mpR9g
 xohlD0CPLyOAVuyH5IEDoVDWsgs3nVO3qP+to1jabBDFYp6pcoRN6tB
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

