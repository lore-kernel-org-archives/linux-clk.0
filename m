Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810875;
	b=Xt08cgHhOsiZWycErDIOfOiMpVC9I35ozPhQDxTWZX0+rC/utpv/3+JWevD8Q51SeA2I
	 Frq5nsxqxEQG29zyChhvn5l1XPay6DOVmDlFq5Ajo72k6vfv81FMGkO5dR1O8SDXZsiAl
	 OIRnR9MEbdTupEhA/hK4xmzZizZCxaBVEOV4Gz1B9709V2K/TEkBxI4H35e+HLCfi4Drp
	 0cDixX7XhTOohoowyeBk4GhyIqmzZqzpvDdP5Gq9cWZY7z5rtkSDjAiv7+32G1c4rnjgF
	 gxwbpF3u98B8loVDmNSL1fQHOS1EVxncM47OaRUIoT8XHQagzxGRVE0r1wbYPUT/I1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
	b=kpEqjbI0xEdj5KEvDBDIqGQb93t6BnmWnxun38erA2uHhFC0fVpDsiMLOgGuZLLI+sLo
	 zhY3kd1zRFYTbuvbbgGlw9Epdg3R4Qtvzd79f/dfJFFBgZhVCrIgZRjmFP/RwXxa2fBIw
	 8Himp5QF+tuxFf7xeqg18AVr9TR5HR22Ll9oG4grLuhtta7hvLTA2g17V5CMpFnbObHN9
	 /jjwBaetvGupXgyzO21M//CiaAgI2iqScvgyxQQCBbVBZnqEgRFZUmsAHdz47xG9H2xlj
	 SWwQpKdH+0PaJvEdLffaj3z2MgE+VxOeeNvhocJBMqlr0ZUBjykxVv4q4pe1N2qML7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONOs4D47;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82859606D827
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82859606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONOs4D47
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1104168c88.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810874; x=1794415674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=ONOs4D47G6dqE/Qb40F45Otu1UBvZCRCmCPEKocfpcbZqCvSNlBXHBerYhItVEIbmg
         Y7ZdBRreRAhQHcdUZammYaeLXW+7wCAsiMF5J0x3HDr8EhjSabCJsMdggUOVB8Haxe+p
         0I/cAqbuJ8N/5vS1lyvYAwDWXbQSP37AmbbAY+zjtnhCIu2M8IRYL2UdBwJlDC1junfb
         145qvg9naBCNpwwSGwnym+e9D5Q6yQltI+mH2d8EaSN/8kKa6arGcWXs9ogEmghvV/7a
         IPH6wseh/tHEGdw4uXSTm+9Qwu4t28Z+HtZ93qbIyJ7jua1SSc0KjmCL7sz4BhncdqjI
         MDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810874; x=1794415674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=EyyCXZavMowZQl2lVug+0EWXU/nDa5zy8q54n6aDOyR5cBSm6wRe6r4LerhInacYHu
         CVVzupqwNg63425O7XZPRdy2kThyokCa4Lcvq3IPEfDykZc24KbFHK8DOj7qrE58JE8B
         m9okKdLmuVT0WH/O3kx2aIjLMuTa36HX27Z/aLa1Rh8RhNnnnZyogZxhVpD9/yBjpY2y
         V1r0HJQ+Z5zTNggHq7dgxj1qDwuzgrvZcldq7Pwd+5lsqzxYwJbiyxbki6VWQYza1D/K
         yVmltckY2qKtsbOeaSnnzrzFGgxUj2VaoeZ0msLFnYUPrHc2mT4mRuCIICwqIjABYM3i
         OqKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3xkdXLV2M+pP9AeHZWvzYQ/YI6L6YUIoQq5tU3CJUEqIfU+JJPLzQNU9z0Eq1MEQMjcVjnHm907M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Ryq5XMPxB+GAIJiHWTZ5q0ZVnHmENEwT78ura6X6u/XUcevM
	31ODubbNo0d2wt3LwyXlmxAJFZWHw4HMqIO+A3s8JBUkk3GIU4l+tQfl
X-Gm-Gg: AYBFou0KRuxlYD89+/ETbefxLFNMVazp8kKGMDS7QPfHpUFcw1m/DoGz0Ayy/l2kr8a
	7EL/hSL+9k0nL/qjhzt2+XxvXzzrcVTiY76JszZazY/kYy5tCYBtfYIS7DRZ+9lIBRz/bl42POJ
	vm/Xexq38X462VPMPGEzuQ1DRaQGPb9is92MLPQxXFeEVqZQa2f2vy7+h6opu54JdN4as/Nr4Dy
	arp5YMW2FucJ08Iiiqdz+GV9lhM4bNIMA2bicPBsWYURH7Uk/IsvORs0Jme5zHMA4o2lPGcuil9
	PvMus7O+BS5Ja+AKO9WDboeal9lxNOknIreIZDwUY8i0BCMr/ij5jQ5h8u105t8qorIMZLHaimR
	3+NFJFHZMMEjajT3E0Ry3CHEHoENY1MfycroVZ3qku0l/JC1UmgvQo97RTJ+n9CSpSnREM1dCdc
	RkJQC6mofaRAX/o6vLvaJIgnWHo8rB1Hq8AGa2odN9eckmkseejTOJRaapSfLMf1jNLT5RxH9bZ
	mGtmlhS3KBTo8lFvCupAXkQn5GDJ42rZtNJV1+/ZNRYnCLVhiPoAtaEBkmm2TEYMPXnSTkZ/fuO
	2b/ude3xgxXDNIAzPgLS8PucL5XConl4kGsCSrAh3Z2ogetLHAuvY7Cvek+cYmmN9TTEr+WtrUU
	MWMV+nUw=
X-Received: by 2002:a05:7022:7e0c:b0:147:a685:9125 with SMTP id a92af1059eb24-1ac574556abmr25831860c88.2.1793810873589;
        Wed, 04 Nov 2026 08:47:53 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:52 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:39 +0000
Subject: [PATCH v13 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
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
Message-Id: <20261104-master-v13-7-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=C3ow+chGT1NNdSip5xA3Ydc5tLXGcOB+9coWbmZJeQY=;
 b=0gSOTjAaT57IzIzDs2ys8gXMuFwlQSYBUyrknvzdEMuCtxzuwu4EGZ2k7kNLvFUEfhKoPMpX7
 w7QqxqnrPSgCDIYxCy4duxqgXgLFgE4j4KOPpGEsEqWdkLXATzLOJPl
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

