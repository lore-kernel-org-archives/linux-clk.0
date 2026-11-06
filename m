Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978224;
	b=0TxM+xUn57w4NoSVlfJybSoSGcQmdCPeUgA02RJEc858kJixtnDKvHc5enVtCYrkKCob
	 pbtp/Ugyx2Uhb6Yy6buVOFeyoy0fni1HRviLv+LTTnqLHnKotJkxy/uhGwUXAlrLq8C6h
	 EvK/hK9euGPlbPVdwW8sI8FSTj02rlAu8HvNE9u1MHKIilE69nGKIHd/cfxO81pSK8yWp
	 oQsEfhQM2Ly8fIzjHolwJ2TKMOfEaiEgn5EvDeQYG4sAKLWCtpGxNLYmRSiGIVnUQpTsR
	 xuiIrCnt8LiDctWoQ0X+ZeqMG7MJ6YcNyzAc3XJuABDNgd6yWrEXqNOvpGdG5Jzg+0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=i/bMv8reh2IdAN9cS+SZkQJM1El1nUw8UCtRZ8df3/5dZWXSkFAuvwN9dby3L+Y1vMWr
	 OVEC/It3FJ20kH90KoBtL9KWWccWulxoEB+U2B7+pNZCJcaOfXmf5IkZCfTlvu91Dd/8j
	 9qW7TDsuXxhLYB7F208Kow6u6iFSZLkgDiufOioqfF7Do9KtQZqJ3/UgNm4TqJfMCIy5A
	 n2SvWXUxfJ36k1lyHFFFm3SykEqXYzZWfuaqZ0IvG3HCdFZS7epjbv6pONpKdpbxG/K0K
	 2EfxtoUjm5lp/T0uJDjSzkUe34SX5ofa5NG/PCWAsizq/dalvvrCXreWcQ0Z533KC+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hm57Ipyd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0345606A32C
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 15:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0345606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hm57Ipyd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37000e7234bso1676470eec.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 07:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978223; x=1794583023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=Hm57Ipyd4zR0uJlvm6dhRylUqkiMorh1ZS7/8CIZIjoXX8W4jWlo5vqp5/4jt/ydkk
         QdnaSgyNWo9/sN8XKK+gMrZJWjv7mm0ReLPBCbwPhKKXSRBomJWJX2ybDOwfKE2jsL7H
         0hyiMTRiYUD/u4oVkNMkMQY1VNevjc6LJcpFos3UhIqI4WVQUnOzO8qd0wmw0mMvYCUt
         ctfNM4AbnSRx9Oczt4ISPdBQCx0OMHEduHduejZq/YeIJRkTPIozhgJPnBHJ6j2kOFr5
         6T6mcZs0HwP7b1+duob7/uJn1O+7ANzgsU8uocJiS2aqejFMnIVJITikaUoSF+beZXCt
         4ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978223; x=1794583023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=nCraDruIvD0Zlufha8wajkGboWNz/O3Dr5Q/Qfgl3G56l09Qx1So3o/BT6JvcI2++D
         QrOyrC8X1GPIT1ycCcKh6SO+c6eUUkrT1z954IdFGkW5x9R+01RNK+CjdZtkmERYJwHx
         TC/PaHbOmCgopIEMMj3tCaRoBZdTls/+OA1JDWK+8dAKTUXVnBId4qX56nV48mEWkfyQ
         3p3g3+qjE1zjyb43egdNvSQYnQvENCqcmTf1CgvgkpJTocjnoLp3ou8pc2We1ECCuHxI
         GYdoKd5a6skS4SYFd1QPO4hGFcbLzbg2o4bcR+SKj9wS91aJl6KLkbddzIahNJF1XZew
         2rDw==
X-Forwarded-Encrypted: i=1; AL+hErH2mI2M23A5RoeeymOHwY0OutZg/+kJSbYNJYmI012SubeYPpf6SY/xdjlgXbRf3uw9ea76l8N5FR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cIbWn5DcrwDAI0lB8A1mQPhPLuU6UQXXyrOolraU60oFCxRrL
	PoKsFZeB43KRnrCIdkxFDbfrWkrn2GnJqPlTCcBqMBkdBJZjUXBodsIB
X-Gm-Gg: AYBFou35DpCfINBhCkYAq34vmf+Wtw7ngMLJ0EIK8cgt2CUPSeAMVl5oVtXgbMmio9H
	flsa5jpP5E5AJHov0uM8x9pBLPx5RvuxjpSIGDcL2LG9KactXpdAere67pJ9r5xSMcT3eWi0UK+
	iak5VC5MAqg6St48Saj9k+UkRnjLYW/yl/98aj+Gbf5/L14V/5Uixtu1HFZ0t1hPO4YWuLJmXyT
	S95M1lPcIA8Mnlbm9FHBPUPTW7Zw9ychnZB3SDjARZ22hKA/Yk2dIsBOtePZvfv/HBR3Ia26Qn9
	h0bdO4q+1ZIOASxzXqpy9B2hlUJD12YaWQTnGg44EdMOoW/bRjodIYtEKYIuJJ+wOui8jz/rd3D
	6xLaoQ1wUKPtjCyxQCDRLft4RbYNeSQqysNaBrrwtmbAlepuKybyIns7Azow8vNhBqDmCp1wH0b
	CohlI+T83RjrxjVd/0SGwkgkg/DwCMecXDFNuf2/UtrMSPurUO4aKffFDIy9vXC7X2jvFolfWPa
	NEwAcRSBQlliNHvbGRuVSMQvCMTknxeuc6VwvUPC2R51dk43Kj8ttvHIqpQdS5wxlmyESNvJ+lZ
	b45F720zREdojoRjjEqBM9ZfX2ebPQmIY+lA9uhjYEBBRy8cuh3LsbfUDNMREs1vHeyInRWytX0
	w1rJc3B0=
X-Received: by 2002:a05:7301:d81c:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36f75a2b011mr4038390eec.6.1793978222959;
        Fri, 06 Nov 2026 07:17:02 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:17:02 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:42 +0000
Subject: [PATCH v14 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
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
Message-Id: <20261106-sm7250-v14-7-7d167e993f9c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=pBWXHjOFV8yy/kVfddEOkI1z2Vr9iOnPMtTW0sfnFDwT+AdWHZ8KZUKMMqogu35cKmAlw7fOZ
 Tzds03Lu9S/BDhGPFs7OOqoZ0Ml+RHtklhdEbV5ZxocuZ/BaH/Yzk/7
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

