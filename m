Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B1D8592E
	for <linux-clk@vger.kernel.org>; Thu,  4 Apr 2024 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233582; cv=none; b=ThkxnjCxNB/asOQTop8m7IubuWcqwHrikJDcdXAE42aLvJwmXTjHDYdH76LbseEKR3dBda3imsWR8LsAT6KjJ9CaxhcyZqtLxuczFocL4ZIHf03MkXFgBDhi7CbCZ/SkiuJ6pMk3pGwImQ7m0CY1Z2vkbBSLrzCs5BgcfsxIeME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233582; c=relaxed/simple;
	bh=2q8gij64Ov8TqGR2w8c78XW7P+5rgnWSMwbThRQDZHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPs/b9RntYPHMT2mzyqKHJ0jY2Mq5WeRxrjd0+UODAkAlEKvgHLbovxG3XAeg4lw5JnhpvG47lcu4c2ANDTDca5Je2lUrMNLFtRDdHvi8bU/mcGREcYfiwcjFx9pdoYzBq7Mq2scsbSpA49g/K29EpjRsOuQ2zAH3u7JyQslyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rj3iFcEm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rj3iFcEm"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516c97ddcd1so745235e87.2
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2024 05:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233577; x=1712838377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d249q8OLaMbSIVMmFzjKWfEr9wukeZUtFSKBwYI0cD4=;
        b=Rj3iFcEmapu965Ht/c98I+poCEk8ez0iCGNzQrDKCKJLJMfshDIC6WO3JyPaGhogLi
         ctzgdcGa18SRItRnha0dktzITk5C36WDwaysfQnk+pRORCMASbwesUQmAUFEQ5IRzC3g
         exkCOGqUlNPl3U3Zll68SNOpdU2l+KpLN5V4xBseMvXnzH/gevD291sYUm19ijObX7Ff
         pf9Qq1ghXkgZl5Rn/6rM7O6gLqWytcD0B+0XoFw3/1fhFDwrkA1ORSBcWmPyrlnPAoCd
         CyOoOtizxxL3s7mB8eriTmYh1xNVluaUts2CPJxVx+pyBdsjPvCT9kaEeWo8pj1CZNTC
         z5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233577; x=1712838377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d249q8OLaMbSIVMmFzjKWfEr9wukeZUtFSKBwYI0cD4=;
        b=ZKQ3fQSeqUh8gwpOKy5RmrGs5HLSepd+JFpp3dUNLw0Xh8cA+pu/1AjfumdFI6BoPR
         UeRLBq061GPqq2ZTKNEwA2M05jSrCWVD6CCqAFl9nHOmyBcY8d2YfbF4YUM24sJDHsG8
         rVrj1XMM85EXkrieRdedCwCkksIuH2G1T4grWuipKe8P35gK1PQVX+aemYKCTc3qL2U4
         lXYAkMVgBrQtQHdxLQmbMtR5LgtMDH98A5J2eohZDoaic/8pl+XPsl3eErdixGYIst/Y
         z+y7a4O34p9wL9EbjGpFIlV9Eu4cy26Sk9up468H7qRkJ6dP/SMUMfOtttKfTyGmrz80
         6pOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr7GTs8tqr1b3uwMDq8J3g/GDdfGw4qOfs5fQP/0ljeCZ3fJP4KEICIufSqlfDYenglhG6lopNgG0Ts+3qfXuOvl0AMq/9dEUE
X-Gm-Message-State: AOJu0YyxjHomye0lcAsxTp5gAOcH3V7EDvZdoMAPDNzdXiQ0fi6scLrR
	cvL1TK4Cl2JIr7HBi8G0A639QUcxz/teAX7J4HLsqWZhpcPhc3L1/TrhTsqyxr8=
X-Google-Smtp-Source: AGHT+IHKUb9uxI3dVCBnRZqZdhwAN2Y0OAl2yQXHesVhm5X+TGFWVXPaqh+/KMFU4TwWx7ODQVorYA==
X-Received: by 2002:a05:6512:3a91:b0:515:8564:28c8 with SMTP id q17-20020a0565123a9100b00515856428c8mr1952674lfu.67.1712233577227;
        Thu, 04 Apr 2024 05:26:17 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 01/17] dt-bindings: clock: google,gs101-clock:  add HSI2 clock management unit
Date: Thu,  4 Apr 2024 13:25:43 +0100
Message-ID: <20240404122559.898930-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt schema documentation and clock IDs for the High Speed Interface
2 (HSI2) clock management unit. This CMU feeds high speed interfaces
such as PCIe and UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml    | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 1d2bcea41c85..a202fd5d1ead 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -32,14 +32,15 @@ properties:
       - google,gs101-cmu-misc
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
+      - google,gs101-cmu-hsi2
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   "#clock-cells":
     const: 1
@@ -112,6 +113,31 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-cmu-hsi2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: High Speed Interface bus clock (from CMU_TOP)
+            - description: High Speed Interface pcie clock (from CMU_TOP)
+            - description: High Speed Interface ufs clock (from CMU_TOP)
+            - description: High Speed Interface mmc clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: pcie
+            - const: ufs_embd
+            - const: mmc_card
+
 additionalProperties: false
 
 examples:
-- 
2.44.0.478.gd926399ef9-goog

