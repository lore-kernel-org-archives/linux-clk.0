Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778420;
	b=xBGVC8024FtK7qaru8JooP/lipixxmWufFZ+j9tyuwsuCn/FnAJFL9HV/HAyFWWqURFj
	 9unBmcVy6B1EFhSgMbLqMsMg/do/AfweqKqkDEH3lGaDpwdM6vTiVzvo0wW/UYbG2zfPY
	 ZtGtYewvxu/R70wqH1mRW1Wlc8i8Pw/F2TioSyNz+G1pAtej2yIgNDbuaFPoQqL6DBo8k
	 FabjmcViWzR64c1DGgrImt+gHLe9BMOoqRdkWFTVPXGCF9ySAZBVb9rVKXZKGBV7S2dpQ
	 spyBOhCWsg3abaImKnvweRo6Cb0E8cOsTpoAXYUDVD/3YwB/F57R94FeoePD8w16lHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
	b=X2KVvcNCk3OHYyXV7KHoAp+s7BpHx7PPm7Oml+NWR6bcaupi67HBtmzaDK1rOKRPKlEa
	 oo3yRtKuX9/vGMBl0SnnXtT3+MFE8IRgfrzp8dWT34UzcKPrUcgnbMr2+VFPBlv8A6BZj
	 VAa6dA2GSNLyafr4+Pjx5n/hOfISkO4gmfJ8aOTeUORXvYVYMphahm36QKfLLPJ1MnYWT
	 5xMcw3i/HfJ05gw4D/09SJnBAl3K6+FZTHO6NGRcWm/sp4pSLwBeLdVgBrdd/MN6vQmdf
	 Zc/Yvca11EdilFv03eAfziSF8PeJS0LdiQSWseUuY5GkukwSD4Fxk3UmzBO8Ou2l60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKoYC0Yr;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47D606A338
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF47D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKoYC0Yr
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f33df08eso676182eec.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 23:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778419; x=1794383219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=jKoYC0YrzN9VC1u9oq90fiiO2uDEAFoopwC5u/qAKYEgn3ytKayoWaV656V4el59KV
         RxmBVUsaO4YpnBBMPc7Wq5/z9Bdzd924jqwio3tKwn4y33OTEWoyqSyr5RyF303cgIcF
         H9dulUwkrVq/a0E0x6cbEemNYVggGVPs0EAFkqaY9DjIfhQF+Uj5DjIYcIh83FhYnbX2
         +Du8knaOHX6vQtFGpekj6/kSlwty8VrFjXTPPtmeD7DbunqHfQCNr+BstZO9nDzMmITB
         m0EtAvhzfY5zVt7+QMIFpO0PZWHuZyZkeHjDTa6Y3Dh/vc6Z1rQTUiyUef/M3AgXddaI
         4KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778419; x=1794383219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=u+JMYsbAweGjhfriClTdSW4JbT7ROQlerUtttG0MD8Sxgrt8Mr9iExBz44jTkoytim
         hvqT55505rSvrcYEcfjnbkT+DvccKx6KekpP1ZDW4GpBBKtOKp6WA6Av+l67rOn5VoQN
         F8edQxskXfoEcYqZ1yiaxh7jjJk87+qlm6mtA5Dzpou8Boi0qgDNLPqXySCttjjtMkmv
         8A6Lj/af3jYQuLoOMtWpPZ9ubPDKpVDnGx0RuIdZpXWNAXyCKqxyt2bEr4IED6Y3s9Jy
         zIeRgHoYO3nEaWR2ps2q2saTePpR5FDcuP8jghEJCIvgMzb5QmppkcYKF1FYyC+K3kbO
         xmLg==
X-Forwarded-Encrypted: i=1; AKwUvBy0ab1M1s1pbTijWU1b1q+APepif1ou4hztb1NeCJ1iwdpK+SWExr3CIJt4WuIMxEsPOgsa3KCzpuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vf6Z48jNY/DRTVaYscIZ2Ww4SK7Rd3LmxCU5tMnoV6c6FdnNA
	LPApjzn5GITXRJnIRs+N0/xAL4zNrZwzsMdMvEmZJY4aqmbo5rWdb6eo
X-Gm-Gg: AYBFou2rD3VfP2p1ORfN1l8R/3f5it6MpbpucgQvA36TgBbWIEehfEovOTOxt1Kox3r
	WfXGQYDvf2LIxnBARRF5Usr7qb795oWvwx39vxT1cb7qeE3as80+3G2aIMILjg/iXBWYd+6aMuW
	0qnzm2B1nGL0lR17Ou4KASYO83fDXqWaaxH1NKTS0HPE7V2/m2umNciARWgXCQzRXYk1sWxJoTC
	Fsa46fBomId/HsKo9MHiSlRWLOUo715QtHXtNBAPCPv9SsiikiYQzblBGPJsE5Kmxb3CyIlfgoq
	niekz2fdeVfJSg5SMwc3CeSObqpDnNdTGpwaBPq54t5PZmE3iik4O6fHTAaXRbkwgKCaRKKI82V
	JZIOkxSlJ0G6twaUraObF8zUMYcxsU9PRoZzMW5uw1S+DBdC+GrJZ+U4mau1p5u1pTSvCsplWrV
	U0x41OVo6qYUFvXXKAw8uoF7O9WZF6lDRzRgmW54Lm48E8ZIuGy4bJk3mT8ukUiXpzEjvT3SL17
	7qSjsx0VoxU3dw/Zlk+X+D7zpyCz4biYULEBWi9NFWLYwr+cXoES8U0Wj0YPIRCIjhOBDpfeE2p
	RIqyarwGCe/JlDh0LSGXNimZj5uWqSJDOyYqtkIO5uKw+Tt1Hzpi4D4N/KUC5qxgRWPjOn8ZUMy
	pKC2qqg==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr24748355eec.29.1793778418484;
        Tue, 03 Nov 2026 23:46:58 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:58 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:07 +0000
Subject: [PATCH v12 4/6] dt-bindings: cpufreq: qcom-hw: Document SM7250
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
Message-Id: <20261104-master-v12-4-57fbe9eef978@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=C3ow+chGT1NNdSip5xA3Ydc5tLXGcOB+9coWbmZJeQY=;
 b=WKZd2fnmwMJZhaG92c4eTNHvDKdlRwAx2VMbZDZotKHNrMZIh4MVUi10aoDcVp/SN2N/9Gfpx
 TK983WV69hDAxRUjkumKjpFlxJY8oJfvTjwndQDKjm1+IJssrvs3fZc
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

