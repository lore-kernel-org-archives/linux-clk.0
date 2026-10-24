Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838053;
	b=o1lpjAkbNW+iq8ErkHiJfD/pGQb+tqGDZWXutXpGUxu9suaZTboKdIi0kg3om0Y9rv28
	 iQMEV6MkAd/zApcixQG/qym6LnFWFp2wC/7GvYC182TYwGODD1mUqCpu+z/r3CqffynMJ
	 +XiYgdIfxChX7BM5FkcfGcDVQNlNBvBKQQXFKuVxoQw7vdcndVaUJuHntYMr2nec/FhuB
	 QMG/r1JpXQ+AwuYa492HcNr/xZH/jznou2+aNYczPLKjGar842faE5WNYxLq8ZqjGi1YJ
	 rIXbYd1O9JyZzni/Mp6gZkHK9Rnw2tX51f0/6CHR6k2h/SkKAnw4a/e9P7vyxzOjJJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
	b=AMaFypFobW2E312LiN2ns3QGCh+RcpAgL15XE78lxjJs6XyMTvor8E2VtGoonEMkGQts
	 3hCByOPZq4dMiwj23JDAhKTd1EulvYcWO8qvT9sObR95SbqsYlLPDWLWYXwVxAOmEDSf0
	 7dB+1yf41bVOd0KYaqH0pqyWa0+pvhWXnzgYBVWnnu7udWFXrBUIm0A21XhQdFlUIPOAD
	 TCzbIvVo4GPXKt3fwt4gucfboDm3uKxEaXB1hQa2RkW9dGJVwlTmxJlKibbRKXjG7xeno
	 270fBY5U6xws0ksz50bucLIWp7QleKgNc1723j1SRn+yEdH0zpn3qSxdjSQDi6aVX7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKgowXyL;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7B606A31E
	for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKgowXyL
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b060ec084so1005285f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838051; x=1793442851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
        b=YKgowXyLWBwrg7I++LDP8W180Q8ZiqniVMWkvWW4/5iaBMr2iDr91+cTkh1b3/m4Sv
         Lea1ql+KOC7EtGE/uJDarJSmpxelzCuHTBIVoce3HLGWesCapXCXBPK9wSsP4E9oE/KW
         um9D8prowuOKuB8EHFlLI02pStgKNsLQlt8oLKhxZaLgwHA23puRZtrvnWuj4ryDGqBW
         /K7w/9mWlK8LlfeKJwraHbK5ByzlQAUDD8SUCv0eVS0kEIfuyUEm3uF1LnCMQ7em7eJM
         vYoWLjhE3IDHpIyjKzsBeLYQawgqgrYl48ympnOHRm4P5/xSLaN4WpJWZpdvcR04WiXf
         8VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838051; x=1793442851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
        b=trOexPp1QEmBy3aCji7AMI5UDy6u4WHrapYXl1eSIolBQI+LbiYGbx+o2Dp2MFMl6w
         OBJsVnAsEdnQ1FhobDWez2AorXH0dT2R4ffMOA7PGuakTDIlDYUSB3ki8ld3VVZf49bZ
         0jxqpRqIDKKUm19OoprI1dI+cCwj0mV+lVqzLEfGZAXAlUzMYLpPGfK4MfU3RAZjpuU2
         AR0t6fP5bmvIXwCsTo7vtIXfNsortAeyM/T8h5pf4nfcefWGR7Jix/mq4ZJH3/Mw+S2I
         fY6FJNIP46YTkExk8gctSyZ9FpnVhWc2KP0R6/4lhMCDsGz+CpiKTxhmIgVnmX/Gzdr/
         Dgvw==
X-Forwarded-Encrypted: i=1; AKwUvBxsG7WgYcPXzcH47m57+hDSoiEAiGN1m/Qw/mejU2Ml+Y8dRYL/UmY5FviQ1w0wVLNmzAOCpkKDKyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHGgK3msGfCDWg9GG77zaR6n/FKqWS9vGtO0IqPQ2hGW3fb+vI
	G5UbKD6mTivuIj26mtUlt+4u0tLd6RfXJ+ZRCyRn3dsD2h6dCwwOpC2T
X-Gm-Gg: AYBFou3oWgSp/4M6SHjPEqoJo6r/hsWX2G3SHTDiaNnsFtnSpf8QszRcRsBQrIz2Ngh
	4hdvdHN9lV9t3cJBCfOOvE8Rm/VVcxWhOFDtxuW3O00/wyEKGqjVdR9ZpVSA3Iqk7z+WzOOBY4/
	Da6Iw/aMUQ04Dh9Myrx3JMbchmImJ5CRhAeCrskkuDPVt5qkxvXg//bhbhQ6tkea4pZogxnanIC
	106QHZHLtkL1+T/8qnvmaEY04aZMDOJefptRv4GJwliqQ9tJooNkb99SLUrCpZh9cyMsM/qMHVB
	FjVieKveFaL58m0KqGodftT1SYt5DTr0nU34Z+0Uycq60KKOXyefVhAGq2NuXSx2JofgMQ5TPLQ
	juPtgnG+Y7d4TLMXyZ1KdVz9HW/l5xXLwbIiUAprOkylCIEnYUn3l1yJmEqlUk0ulyC+w0t/tl/
	PP0mYWyswALhs8M66h9B8pRgXIdzRwO91cTjYtN3i5DTFxnAZgdKUrRnI9Vun9q6+7HHRG3c5Z/
	WHQMd+anERlVZ2IOJSV1OH2KI/hvZ/Ap3e3pvSGKVLibYG1IfXBnS7f82PxgUPJ2UKYvCcO2EjT
	G08WkUbKmGGATTBr7f4OqfjPbpUGJgXpH6wT48GhwlM+lKgCkO+PVcLHmPPZXlIh7J/B9rYv1mZ
	3N2WK91M=
X-Received: by 2002:a05:6000:2312:b0:48e:e98:8b64 with SMTP id ffacd0b85a97d-48e3eb8b45bmr2346024f8f.19.1792838051352;
        Sat, 24 Oct 2026 03:34:11 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-024.globalnet.hr. [213.149.37.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm3544825f8f.39.2026.10.24.03.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:34:10 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/2] dt-bindings: clocks: qcom,gcc-ipq8074: allow CMN PLL bias clocks
Date: Sat, 24 Oct 2026 12:33:09 +0200
Message-ID: <20261024103401.761125-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
In order to describe this in DTS, allow passing them as the inputs to GCC.

This has a benefit that it avoids doing a global matching by name.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 00d7df75b3d6..d489c6332e6c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -29,6 +29,8 @@ properties:
       - description: sleep clock
       - description: Gen3 QMP PCIe PHY PIPE clock
       - description: Gen2 QMP PCIe PHY PIPE clock
+      - description: 300 MHz bias clock from CMN PLL
+      - description: 416.5 MHz NSS NoC bias clock from CMN PLL
 
   clock-names:
     items:
@@ -36,6 +38,8 @@ properties:
       - const: sleep_clk
       - const: pcie0_pipe
       - const: pcie1_pipe
+      - const: bias_pll_cc_clk
+      - const: bias_pll_nss_noc_clk
 
 required:
   - compatible
-- 
2.56.0

