Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132062D77F5
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 01:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769864; cv=none; b=tuVf7qEGBZzPkbdvk+acL67961o/Waos7v4hu//wdGwlswEmu7yV50ULvpfd1MimL7tliRV72THLMm96zKmnd+s4H66qC2SUcic2/BUfX6uh13hxGWyU21nQ/pw/Fd6VhNv2tnc9izHSiRqUyJcLTZFiq/LQtmlpIDyZHKwtk0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769864; c=relaxed/simple;
	bh=LnhLqCtXLycdS/7QOpLkbEiXHoC7lU00ZBptzqR4BvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chM9EVgKZRPjbUuFLPORI27mC9SE6O8vQUONdlD+WbwysPz/Jud1PMsdGZQv/s7ok7wW2cQZ3kGWiEVgcIqAl0oyyvTibkrLo1Ru8XMAX3JcgD7NmObmNc4LkdwoQT/DmIBqxpD1PCaGMR57TZGPWoQ0J3zOJQHK9r/ctoajlEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwSZyqed; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwSZyqed"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66807ba2f0fso62921d50.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 18:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769862; x=1785374662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2b7MZm7+ICouxJH7SNvKRjGaatdEuN4EiW++/CDI8dM=;
        b=OwSZyqedpApg5deu1lXJmL3sIdM/KzKFEkddCLO+bk2Pb52cxEgemJjs260B3RaqF1
         pd/i9aym27uoSIhKbKcwBeyb8/TO2I5okL3IIbMWeIAO95JtDvUGpHIF9+do3S/kLCTb
         E2kPF8INYAEf5HplO6QWOHtcMeAL3vzEnAqX3ghorc9C9Pwto3+v7ZTCCQJfvmu8LWyU
         hsHniJ0LRSMg3vvyCeleZgxq0X66pgqVTkR0n8JWlrfdiaxNQ4rRuT/vWE7yl0s4aZor
         mfTY2HHuHBv2xOeoa59KOJZCwGksH7DuUySKEGJe/BEXmBr6wELB0KoPPRwYsPysNPv6
         2xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769862; x=1785374662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2b7MZm7+ICouxJH7SNvKRjGaatdEuN4EiW++/CDI8dM=;
        b=fRnh77ezFCcyVxKRifVAqCZI71hMfOW1+4BSMtA0l4kISLsbji7Vyv5A3OYUUEsdq9
         z5KLtn4qZdpw4x0I1tYlBtamdSvjUSHKxkayfSDLDcLDG6bvYnz2ct2PTowRMBKGtuOO
         93Bl2Dffh8FN2B1NNP/NXZLcODu9xOvCWUzckEKYq+AXOCrfiI0Wx5VLK+Wkv19ZpDF5
         I8BPcybGIULhJUG2LB7UpidwNo6bLIQEP4/y7Tez98AVPHUHspCC3sUkrvZFqrIiyZ69
         lK8xSzcmtEgLHKFKjOWuQZbZzMFIVB2NgIowWNPgpv8q3N3Dh0gDS8hTxfXcirO9//Yy
         SqSg==
X-Forwarded-Encrypted: i=1; AHgh+RqyEOnEbxsisewKqe24/8cnFGR+C1+YQxTBv1PSl9XOGWjp67oekXNRSHz9z6ebhjLaBWrGFlODdJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNnqH+OUyWzP9sKnwLXiLdi74uFOwishrjn227Q4VMz/FWmWd
	8aARR0Nstjk2LsfBGBa33VyXQUiRtHs0VxD9Me7ltMWC9KeNX+8fBS9a
X-Gm-Gg: AR+sD13mocOJDXwJ+Y145S5mqBrpL07uKUdCeecCRkdqnCnuod9M1gyDnYisBYr6+i1
	U+G61K5uoQCCvxLLWWAao89JPyt3uPELw9wPxX6IDPxwSGBZyj8vuny0oWVyugEJJXQ98XkaQPB
	2LUlZsGftiuoV2ucP+SQYTrT9KQegkVBT8Mt3NdvVcpHZrGspKir22IX9RUmGXFE/aAilVm/CBA
	ZqEEjpd1WlNFqSQZwGDOBde3aUC7AQc3l5fO4ezRyZWEf+4ZWwdoqxDNQRhlWObzy51/j5PN78w
	FU7rA9KT419l/w7jcL7yT7/LCpkHFd5T9pR31gP3pIl3saRqWc/pdREniZVgdHGpZ4dJCCiwG/f
	xBQAZTC1BKD1rnKcT6/J2v/k4Nkr4PEL8ZYBCl4Xa8RNUAMdacNu4VItAmKGDD5eMND3DA90Ce4
	sgkl56+6JFXDrrw979doT//eKMjQa+
X-Received: by 2002:a05:690e:4381:b0:668:4cbc:9c99 with SMTP id 956f58d0204a3-668a4fa2ae7mr177580d50.86.1784769861965;
        Wed, 22 Jul 2026 18:24:21 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm2319684d50.9.2026.07.22.18.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:20 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add MSM8920
Date: Wed, 22 Jul 2026 18:24:14 -0700
Message-ID: <20260723012415.48288-2-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012415.48288-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

Document the "qcom,rpmcc-msm8920" compatible for the RPM clock
controller found on MSM8920.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: split the binding into its own patch per submitting-patches;
rebased onto qcom/for-next oneOf compatible schema]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index af9fc5b14a81..49c00e219ada 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,rpmcc-msm8909
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8920
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8940
@@ -118,6 +119,7 @@ allOf:
               - qcom,rpmcc-msm8226
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8920
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8940
-- 
2.53.0

