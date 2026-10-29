Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257440;
	b=AYaWWKTwPWazpd5GfGMMayd3HYwK7yLL4mDRWrIAKjEbsW1Hi+Gpofn95pZHdoHpddbF
	 GszZxiWDdz7tsRXYufHokL3AIXyU/jOa465+2zBbsvpJX2z9lwQNiBUo8BwhJvBdsr3Id
	 DTUwj9GpisyqDM4CnV4CreuVQ/L+OHWmDgREeXMxw5Ra2YIYTzbW/Sj90f3H7TjzTY3Ho
	 aqX7AFgyjGWaytRDQSRl2Qdgt5+v/XbrJRa1DpJhBFb6fmSHXO5rYtzH2A3C3FMqfoGto
	 k4nWdBn2WG4XK4ftNSpw/Swm68ndhYDxvghWlI5EiLhaZrqgAPVWW3T0kGLB+BKTrkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
	b=daR9j40Z+dLsSo5UleI1oeAU4Lpx56fmm4vQiIRa4ITmqXNa0thgnTZwjPpFlS5TpFGU
	 gQfopkCKwQtAZrm6ReGDmGCfLTEFyg4uQZ6//ZL7aY27I5GJiFCNmGFjDOaIPvY/EDNq5
	 9lpVBTTenyiUt+5+bDXL+pdyHC6UMXFOpivMnhTJdNd3OOZg7tGrRcJH3olAY3iagxEkE
	 R7uzUGUSoiCzpsFlXXN9NxvPueZvlOFyvNfbDGCO8hknWkXnhM0ovfKUiaWEgEr8QG+sJ
	 /WgBEMqo6I3rEcvqO5ZW6e77LVsaRm9V1NI+EH7Qbc3GBqu4EcsZn4Vdh3+FqgE6d/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwNoZ4Cj;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14C606A323
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 07:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E14C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwNoZ4Cj
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35b2c599f43so3917012eec.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257439; x=1793862239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
        b=RwNoZ4CjRuYkg/jasy/Mjn6HOQL5A9DiWfE94RbDJRoMBIXOa8tue5p1UA1PCBjNZg
         9pTEnZ1J8+Nap8yqIUe2E018rdqcdBP2Z2l6pgc5BghO3yb7IRMemJfa5nC1ZKO7Ags3
         QnSoYq79LIDVDMnxJgW2vBfTNhvDlc07kKp87hfd0su92VhjpCSkqJo1wAaSSF6LCT6e
         7Wo5UFuWTCyP8d082kzIEGc2gIYbeBi+Jy/kvyB5Vojav+W3TvejUZ11XSWmbTEdypki
         YgC/ofrBRKlR0nPcrpLSscwvR5e7KdPY4zccsdGIh9U4+KLaTWfC69e4L7gajvFk5Di+
         Xw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257439; x=1793862239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
        b=szEKcIlTr6pY+HbC5ED0eyNKT8mXgztwdDBTiMQpmodfU50X3OMNhdDSO85IL+CMSq
         Kc2t4kXetNWSaj84Q4FBNPn7cRQW8HaTb051vToUs45iZ7k4rkVaw18/26QtzZRe5cqI
         acyx/PKUe8c0GSheAKzTGDWWiKe/RCN+UdlzKHnYZHgRhOlxgn6utySfHR27EPkNsyet
         dMWAyknCGZuUhBwkbG+n7AAzKFA48iMaUEBpoCtNKeSKyR+BLvYUTWuOkBbJR25gZusA
         rOHlGDdvrIedrRjXD3aojdX7AP5dcEMKFD00RTkaqoNS67gJLy6RhE7Ch2Eno5peJcR4
         ULBA==
X-Forwarded-Encrypted: i=1; AKwUvBzCtduSopDAG+N1bkIL60r8EuXGC7jgnO9viZCVCSlnuf2oUBKuSLJD02bjM1HHDmSIi/D4xX5I9dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqwXVVe7FcNVgulzCOCEm+WioHy0c8Ploy+9kxTIb7BPp87fIL
	JdmdksOTzGBHfFUSoQ8PfmYuL8ArI2nEObxepInnR5NGEyyb29qlI6V85Urjkg==
X-Gm-Gg: AYBFou0ozX6zfIUX5VT5ZkUVWv6J1cSbSdk8KkEZf+y31jiLnXTbJJMAQJGuwWzA0iD
	WVttRf79lQcFuupNHhoZl8a2+GV/dxZ0PjjuCKpLNfiut0u8WWBTWunYSmbyZYmKVSLd1hb8R62
	7CtmYfYMBzWUwbu4oUVcW6rCRwAdTr52q1PZ1G63hPFT+A4BNnkEzQrrqbWiD5lQsSEC9EwakqB
	/loeiPwJJ1ImJXd8PBUGZ1Egc4vAOirSl8TD6nzqN0WUL14jln0w18DO+cGHgtmXg64/xwmmz0e
	qLzjH4qNk09aJ0ScRnDtp+lY7pkBHf3o88RhjVGCtGBKDVWxKARTXbqauWxHDQkBGqvqtyicG4a
	bF3oRyXn+XJZhJKQTThV1iuQsgRX0lrew5kmKyhXxIlRFNTtPG14n6TE5AKiChQORLsQkSWym73
	l/++L/Nq4aBIaCTXFJRw+5y0SJVmuEPwPaulvfKMQjEsxBI9jeHaxujA+hVkcd89EFsQfmR4ays
	B9tl0VfQwmvCxcfiSWmIx4mbnwBDyO5ymJSCcKMteggL6BY0A9cSOUClQb2NSL2idpu0jm6TGcu
	xzTyuD/hYiAyKAR8F8Wr1cLbZKNM/dwneqXF15eDY5z9jPJtMvdiP0cCUB8CIBJ9nYdWQu7VOMB
	VetgzV/IeNZNjB98xACXrWAjF0ME1Fw==
X-Received: by 2002:a05:7300:cb0b:b0:351:4866:255c with SMTP id 5a478bee46e88-36a204a1735mr8418969eec.32.1793257438736;
        Thu, 29 Oct 2026 00:03:58 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:58 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:01 +0000
Subject: [PATCH RESEND v11 4/5] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
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
Message-Id: <20261029-master-v11-4-2c29e382162c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=949;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=x7hZEQOYoMz/dmWpmgNA+PhWEJ3zQC81cV4z3jRraIo=;
 b=ufsKTZU+b0OXPb0mc4gZE8Nc3udFJHAZgWNoVr7Lb6gGfhe/dXr+syALCRixe/7+HHnMIsdz9
 7leJLrSZMDvATc+wj7zQErP26XHUzfF49khI1iWjHMj/aRS0k8/yGm4
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 

-- 
2.43.0

