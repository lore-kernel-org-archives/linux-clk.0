Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF944C659
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153185; cv=none; b=hcCdQmIpQv6mhQ8oKY9Yud7E280OLrKsCto4/NVk1JjkigZXg1Y6ktKlwZISmBfjgboN33Yxax/XLDauON/waKEfDePwbd9vplrmjJjJbiL5vnUJXM4vuC0ZnDjurPVcDYgg4cx1lYEj1MPM858tB7cdC4tjp10+wqpjiyZI7OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153185; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwCc84qoYRRV+rZAE6f0x/pQZSV5V21gR5k9NYKvdCeud07vvnT6nF3IVpgRh9DWkAGLaofX+VRjXE7NtJcbmG+EkfDYq0us5n6hbB0bayLCrqSvKQV7Zgk3tK9o1DAmXb+xgrwRfPJbEMLnvRz8anB4tRzyZmRuhceNHDQPavY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7aY7Iho; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7aY7Iho"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceb096e675so13847635ad.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153183; x=1787757983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=g7aY7IhoWH17JpUNcjcKs+MCuglJkwbEH9u44EEa8pgZOMoo4BOfUV2doB03JjkRp6
         9EN6qG7KwPXTU59YzCNPUsKbsrIrSTe7XzzGZacRucRoLiqn/mjxoUkjNtoeQ4s6vett
         TcLsbpEWNXOifl1aP+jJzKOWF5Hmp8jeHGC1HVrsDiV1cXv0icXkiab4c/387OmSpT3g
         6pU9pKX1UPG/uucOmb23yS9w6G8xfdudzWvVYOE3dgqCTeOFQL8vlP+/l2eURAaJ1jGO
         vt4lIt6zJN54ILW6inO6PJeUI2gN8dB4GLb+orREpFcIVTwBF43G9tq9nNarg03Qv6G4
         sdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153183; x=1787757983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=gRUehZxjVcZZBwvjEpWTzpK/qrlaguUnsZRnovkUaU2EqhTFfBm5JQda9uNIof2v4e
         q4+pgggbSYWnAeiRRDI9+RqPhA2Y4QFqoPaQjV+MXzjRV56f27CuEGG4HTNVE09OrNWr
         lvm0Em9+8QH0dHdjQD87pBHdChkUaKbSWtjsLoncrkhA056NCKOy59Kq5qSnE0aj0wOR
         jvALV3HaFOpg4X9Ib1vZb0aoD3iJ+8JV68LFI0tBixKpUbq2X9fL3FYFDAOwjx53jKq8
         AA23qUYhuD5y9wvwHD3XCYTWDWL46SpEuS9fXY0YQ33RbL/O1NB6B1cEFCmULDmNpGpl
         OElg==
X-Forwarded-Encrypted: i=1; AHgh+RqleCelZfM94CyeUaKITE1/pcm0eHQuO7Nao4Lb7H5S98ygQzwZ1JZLGy31llhi1BSk75+ptjJRxbw=@vger.kernel.org
X-Gm-Message-State: AFuF++m6QdcJ+GXrpLoQ5pi/rerKJtnJrgE0eHIIG8f49GQIsHIhPNAE
	JEPOfXKwzINA2zjwpUBiepB1CCtMl5MCd/M5VPpS8wPtwxI7zDj56YzB
X-Gm-Gg: AR+sD12n2lv1sa3uwqv/bhEEeUKhZLpNKyFyZE+Jxv7TNaJ0KRZwr95oO+i2HeQjoFD
	qHF1fBPOMpiby18hcSz//JJ4Z0LOqGajTAcegdq3jkmK6hyasJkQsrWm1hLP+aAPGzHXpDg7ut1
	h/gt76tkBPtNJoLwUHYTVTHVhVJfXhIQL0PevGrguPgorbJ+FTHQJfX8yeSGYjJNJHsBi+2wQgm
	m/IT211JX5TcUzTSxG83dr+CsZuaMSxDRDnhFA3kw8MeODzjSrv70ZuPvlMsJx5/l+RW3OfSIYQ
	uQGgYkpGZ3XJ+9MkPV9Ejfwl6vG84NYJ5WJc2bY6CJIcj8ekcXkvvIje1L/CrLSmMuBTrdJdXor
	BQqZ7LElSk4nF67n5iu6TdNgUArXCr8I5N3NnzkJ+UKD26ZeqE7g6lM8eKybovtb4/tUBR3PdTs
	NHI3CwXW+gWm/ZB5c3o17y1EzPWHo1XYy47MJEFS1TpUw0EkkQXcwKucOJFRRADzA3dQkP5M4Lt
	CMMw3Vn0QY=
X-Received: by 2002:a17:902:ccc9:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d601665047mr110683615ad.13.1787153183240;
        Wed, 19 Aug 2026 08:26:23 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:26:22 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Wed, 19 Aug 2026 15:25:30 +0000
Message-ID: <20260819152545.3934-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

