Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD989430CD7
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246558; cv=none; b=c7sf35bI7ajr6GG3ACYIHt7UYjr+2wk2BWUInGVKbMDitNYP+wWB9SolbgZ9kG6My4b9XipcmgEQ9OliznWFqGcddXg8DB3SaD+PGqes0w0fQUi1tbf+Wgo/sibKsLfoyqvdA2AAiof+ib/0A9qPB5N4SJu/DK7ARMxR2S90QNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246558; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCA/uFvX22PvezIO2BO8Nv1OfBcbQLycsaGEJgyog9W31F98rDGaJwTUxmwWhlpv2ZAgVbiVNmP3xTAC9UpNNwp1t3ylbDyw8Sf0Iqec8bggLxK6V4EhKHPP4ftE8F3ronJim1/p6+HIGD2/qodDg4AcjXsH2mYtRi2VOPWHP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqd3TB8C; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqd3TB8C"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4363690a91.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246553; x=1788851353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=iqd3TB8Crm8vVVDn7O3VnZ14MbuYGqLv37HgF+ppCEQxR5MLaf4aFweP50pqN7cA4q
         wlxPbA2/aziFmlJGmtXDeQC5NfJ/K23wa/HJcu5WGU2Jghf/0rJ/kg08nm5FNkU3itOh
         8imFBAS9DTw3AGSH0U8O6MZ6MAc57RUtvSLElkWlizfDm4oNmx51VKyX8gW4K4nrx0px
         V7dq2e32sMZ6RraCQ16mcGsLo2FmFik0D9QVUzLze8+LqZPHGQMzQJiv30vzdoikY/iu
         9IWYq3HGvHM8fYzujcpSCPczQgUYwxXJyAjJ0jKWfMBUegGMirCubQG+oBIzkz+pnDI9
         MLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246553; x=1788851353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=eiEOkdv8b0b3aKRI3vw6o9bpm0/++b5WzSh6Czd2C2VU6IY97GGbt5CJSlG9x0/ZGB
         /e4LteLq4Z7Isg9i7FJ3OHIJ3U7A9NQKEpq6BMLQXD8kc52otAiNy0AsGSw0BlhPwcYV
         UDvse/H7w8fKt7XQjDE8cuevdXISf+X/273uIa8rnt0vIuVAAHySKudqfwWidEgIjuDe
         YIUn+ZAY87kzGBO7qzj4GjBCM88RuU/j1a7kNC7/k1Xz81sCnhFWylK93UAoGkorOeRw
         0ZHv29WEUHA84Et46sJkdDGqS9jQUFlmUuxih8YZ0+2FrsNf/3INbQBhp+yo/GfkuThN
         Pl6g==
X-Forwarded-Encrypted: i=1; AKwUvBzdZr7QRdQEmXmFp+popt7z9EV+Rygb+0T0H0cutU6w8Cud581413P1tOaLMZboFzBcosR1edv5z50=@vger.kernel.org
X-Gm-Message-State: AFuF++m/SnbN9jdt4IirlRruOolOvIoBxZ0GdlE/Xqlnjz2DoADdr1Sg
	1CllPaLcDu9E6ICa01nBsmjLrmAb/1AYnSxcgWnyZPiIWSvPGNSFQuo6
X-Gm-Gg: AYBFou3iZFTKDMVBMl/1lR6Cj7RfJ2H22vy/2GW4E03ed+BXQjI4iHe8ytk1ELmrZnA
	FARLA8ss5kp8UDnxDzF3xTulvZgTAgD+2Q2JjEyTlsmchuZ5cs8OJl8nrwbnb9KixJWp197uuWH
	X3vf+Yuo5SmCh0Rs074m0kdcRA0Nqa1u0rv3aEKo0pEl54cT4jN+/gwqTcO8iL56LsK7jiaM09U
	8DrkUR0a1VbCpokVdP9dB0xDYwCWVCfjEsBRdiZY7L9iMySFu/DEFExmOsKDp0JbGo6+WU9ydDs
	g73y4UqEMWTes+Zy6c2+AucLDdpNb54aaHMqAn8FQnUm2kKRnik00NMq+N2xF2hEcu6mqZ+qcnD
	muYSrdVuDzQC8RhUex6HcMnHdB76kC6RJUYg2t8ve6xBrZTPPqWkyfNs9kl5A76PywJloOqlyrV
	XbdzivssYrkc/sNSKyRdMQbXCyGBQormpIJj412wHgrYXpGnwIa0ldNg1z3RuCVTW4J0xdhSuqN
	I2QyITJ10PT
X-Received: by 2002:a17:90b:2b4b:b0:398:9beb:5c18 with SMTP id 98e67ed59e1d1-3989beb635dmr35063238a91.19.1788246552818;
        Tue, 01 Sep 2026 00:09:12 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:11 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 10/12] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Tue,  1 Sep 2026 07:07:15 +0000
Message-ID: <20260901070717.20513-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

