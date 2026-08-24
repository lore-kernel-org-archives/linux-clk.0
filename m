Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A1743C7B9
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583844; cv=none; b=qmI8dgTJCySsPE5+VKhrKS9W/ZNFPdu2AaznC5GussB4BUvi7UokUcCNybWlqJqNSgiW0D8wdUnZzxA5g8Mk3EKnOI7s4wzwXXSCAH95ewlHQvEZ/jy8D9utGtBY4qAl4Bf51BNH+3vY7+cxI2p6RSNHQGkkLOj4r4JNw4GuZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583844; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFQ7V/C6ATmHTcUYf8kN341ATi3RXflGS8RF3ypY7uRmPyDrOyUImuta5fQapkF4m9Xh9ZUIR7TnDcr7jWpthcxZl/KC6a6oggFiOk9gbCg190fPv6pndWe22S++IENMDAjsA+Ok6Yr5b5dPL4odwKrTsnYxlKECKZX90TUxfM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYUqAMCG; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYUqAMCG"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-44cb057311bso3262349fac.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583839; x=1788188639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=rYUqAMCGDlpuVipgjLf9BSE5JLWUWa7BwQ3aooNiZiy/l8pi1s5wR3z5A5vb2bCMig
         0cb+LQAS9i2ZP9X6mPmSoojy7gUKWElDzyK42+UFPgVcZdMZIKVRrOREjtqmeYF5kESR
         8z9/ILOJ8c0t5pJQO9TOM8BMeCxNVCjAJNZ3eNHr1D8ikfasFEn9D7Yiggk08xYNr4cT
         G4D5T4whUXOXy7kBe9dXKYDju7hodgdC9b1T9KKjjNsZGOsUMaI/mZXEqsaLyBpc1WU/
         Lf/m2wRH6p5GX5OXqhARRQIeOW6HvcWADIEjWquGr2DsZ45ghLGVbobMoxGqGCqivvcW
         n+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583839; x=1788188639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=LPf8HKKadNZkKhEfcjnm1FW/VTkz75T/MVl17QSqTs8ZwV72iDCg52JR9ycokkFO9h
         VA2DWUKYgHh6NhkCdSLoNOM5wrOxpHMfUCjSke7mhTYgFL6lqgnjJmIcFnMKOSEIG4j+
         NNrpWMHjMxyFnYMqQLE0R9S/nQJMMjRRj1LI9ECJnQF4CA+FHmwY5YbS0g3Nm/O56Z+x
         DKR0wBYR27nD8EKopYuQmhIxnn7M/lv6Q2APDMHbPRd0pfiGeAIvzwprDYxSjk2Mo0bP
         TTimVSuNiJ2/UhbDhEpDPiU7Pytj33SYMpRhDUemyr1f5ohp7eEpqlVibmwfa6JGT/E0
         +Zfg==
X-Forwarded-Encrypted: i=1; AHgh+RpMz8zk3McD+IpQkmQpvkYWEBQ9zCxN8ddrb/TUur75wXz504GiSdyxcc2Weh+FjBqL1DyMIErgV74=@vger.kernel.org
X-Gm-Message-State: AFuF++kEZJk9Vw6rvr79i5lCKVfTIQysVSXsepMVdQY8cNGZLWoARLw+
	1/SfaaVqrhe0rbj5XxCoipQFdWS7qBpTOnKVJwmJw2bSfGMBHUr5INIL
X-Gm-Gg: AR+sD11BZDer8fh+zjMT36n4fP9z3QXplAHRJpZwKU496yHaWuYv1FJ93DGTxPsBe4V
	3VgnCvoDDRK2pLWWVA2rjdVNnv1zWAugMD8HXXDBWaqqOuTeV1QylibFH/x0ebL1Uqc6GCR3OV+
	Rx9Y3kHKbaOHJeUaqbtyU/DNjar6tVNZfpUIfIyYW28Zo6gelImUesGgoh+z8dWRZkR545pXY1h
	iuptP595e38d+uGCGrjQcPZCRanCq9u/ZwUQSbKv7s4Rl0Ii8XRHiB6LWXT2IqKAy+Oh1LHuYem
	L+6mECukfWRWNFLOoOPxAr/OsStxglXdThpFgcBDEhg8aSlhbL6whoGUK5u2JLuuC9EQQA8om0a
	2wtDT8gNEWP2oCgRqolq8PbLu9J/tli/JUwmVikdUs75uUunvg+TkZpLpuSumLzZMkiRNbhdcAW
	aB+D/xJTBzZNZRGLYMfxD54W1Q1wIEM12M1OYcmJEv2dMYZzxBjqM9Mh1Wtd4ZgP6KWWMIOEJnE
	sA2fWgRA444
X-Received: by 2002:a05:6820:83c4:20b0:6b1:4b64:13f4 with SMTP id 006d021491bc7-6b159284d3amr19040221eaf.15.1787583839499;
        Mon, 24 Aug 2026 08:03:59 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:58 -0700 (PDT)
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
Subject: [PATCH v6 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Mon, 24 Aug 2026 15:01:52 +0000
Message-ID: <20260824150156.1310-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

