Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6B52EC08B
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 08:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923356; cv=none; b=kMLc1VmGuX+5oso58MC7kvscbsV8BhPlQHKzippPXaUdQgW6k+KhD0PQLSk2JDqMOQmNwnNthO6FWkHaMHAyo1NZy+0T+57xN1P5azAgMOe56soqtO3wJe9sobBqX+/OZRhmeiIhkUP1fGzeu0C3g9K6c/p/8vx3jefmpvoOh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923356; c=relaxed/simple;
	bh=oG1UDywpcR9M4x+yKBkhpkuBvFZfw89ujr3kh7eFaOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6idEl+M6AIywvtPrfHC4ZfxbB8Zks17lBWOtni3jS0SWwAYEmvlGEBOy+8hkhSni7vOmfASN8ASIUObdfQ0Ryk6JYxzyw9JwKCPaOEcmrTZkKpoZlh5f1aMmwRCRKicLoCD5iaet+g6m9udeCDXAqm7QuFJlS9lrxmvj2HbOFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnyvOUm6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnyvOUm6"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso4125762e87.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923351; x=1758528151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u7DncElgdWGoBbTvsNYYCuvHQdiQcUMiPwI+0yQv1U=;
        b=bnyvOUm6EwhZ/kZDNcnJXawAGNBNUAXmQAzhhFwLaq5l1ksZg5WjQmcGcoWwfntRSI
         UwQAEqokjD2rX4W3uJ2U/dssBlqL9/ZpJ5LLfkKwVrWdRPHZ5wyEwuamOTPnozIHOM76
         qDA+fgGQ55q8oyAWMWgXx9V4sazgmNbXd/87ZUpCcJK/GZcSGcY/GgWTn+uo6DE+7osW
         j+tF1dQHcklIywFruPOf25H1wTA6khoafVVwXF1ZJkCW2fv+ucWfqSvEb0GF6fXdUtD4
         61nDoRs1Bo2cuhW5+vXUplXeYQstZZYiXRVAqCmKW4CSTcaQAAvUzS5dMbFomBifv9QJ
         //Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923351; x=1758528151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6u7DncElgdWGoBbTvsNYYCuvHQdiQcUMiPwI+0yQv1U=;
        b=HTm29VgY9Oskf76om9knaQU27TmDnmQy8BIBguXRKQtOfrAgyhTrwYFD7c4+MSg+mM
         7le3JV1mokUDLG5IWFf+f15G9OikY4ZRun1/JwiC9ptSbJ+D+zr0OEWAyKS99MaVnewk
         jHUlW1fQACZGJ/xft0KAZKZEhqfhnHlpFh9oZ1X5dnyzELjJTjgcIsJ/xOL5Xba5X+oR
         PvwEV4iXBKgtP5/gLaFoKnK17vmW91WRmRJiDJ/Jfs26zLCvADBVs9ZnMJOm5EHWsxVk
         /s7R9suuGW2GrsZRFD005V7ihReh8ZpVJZnDIf7WC6SqJ/fBscm6n5IfviKpooHeZV7u
         3Iig==
X-Forwarded-Encrypted: i=1; AJvYcCXmS0lWiUyS4PnbAL1mJNjTHtGrkhBl1wAjSHM9Ezoljjdu9/DEPbgNzZYVihOf6PgwPxw4LiwT4wI=@vger.kernel.org
X-Gm-Message-State: AOJu0YytUKleL4ChgVoJzQ2F4zfTIBVggTsAnD933FhZSQ51Z6QdiSly
	75UJKHJsaDqZ0n6+iMXyGzg+Q1ASoSLJm3g/Cdqhj9l51FYrbf5727Xc
X-Gm-Gg: ASbGncsFjedWsyvD0fcl0s4YGovgIhrnlefg6KqFSb2WJKyr67ITjsUz5lDZwEMtMoC
	X314NEU3x60Qer94CTvkomYySXOLSYG58Lk2mwy//sI1P4awrCX95dAjbTOyp+6DZO5OV9YKJYt
	XLKYplw0sH9SBpXUIDQyncYpnsd8kQHbaRTNDRAIzPVpFT+s+t3exfp7K+u1CUAb6J6rSZPdBY7
	b73BtoSqUGjOZppa1Cn1J0ZLta9ukRHU3nTX7mm2kNzUtA9wKzho0AY8fm93B85xusrr9uDNvUB
	p0j7ujuQ2v1ni6QmGN6sf3x6nzsL8jL4abP4Rg3CPKgUo+XCCzx6VNzwxSEjIRTLHXsei8kFimj
	pHAYBodf9tgBCR/FWQUn4F0iQ
X-Google-Smtp-Source: AGHT+IEIzb0MelnrDb6tsvBBgjhy3goeGAgHgtIY40U+klN3eLzXkD55yKXFZdzIpxBI7o+EErrCaQ==
X-Received: by 2002:a05:6512:3599:b0:562:d04d:fa05 with SMTP id 2adb3069b0e04-5704fb8634dmr2789250e87.54.1757923351191;
        Mon, 15 Sep 2025 01:02:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 07/11] dt-bindings: memory: Document Tegra114 External Memory Controller
Date: Mon, 15 Sep 2025 11:01:53 +0300
Message-ID: <20250915080157.28195-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915080157.28195-1-clamor95@gmail.com>
References: <20250915080157.28195-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include Tegra114 support into existing Tegra124 EMC schema with the most
notable difference being the amount of EMC timings and a few SoC unique
entries.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../nvidia,tegra124-emc.yaml                  | 431 ++++++++++++------
 1 file changed, 283 insertions(+), 148 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index f5f03bf36413..1aeff06c3efe 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-emc
+    enum:
+      - nvidia,tegra114-emc
+      - nvidia,tegra124-emc
 
   reg:
     maxItems: 1
@@ -29,6 +31,9 @@ properties:
     items:
       - const: emc
 
+  interrupts:
+    maxItems: 1
+
   "#interconnect-cells":
     const: 0
 
@@ -164,153 +169,10 @@ patternProperties:
           nvidia,emc-configuration:
             description:
               EMC timing characterization data. These are the registers (see
-              section "15.6.2 EMC Registers" in the TRM) whose values need to
+              section "20.11.2 EMC Registers" in the Tegra114 TRM or section
+              "15.6.2 EMC Registers" in the Tegra124 TRM) whose values need to
               be specified, according to the board documentation.
             $ref: /schemas/types.yaml#/definitions/uint32-array
-            items:
-              - description: EMC_RC
-              - description: EMC_RFC
-              - description: EMC_RFC_SLR
-              - description: EMC_RAS
-              - description: EMC_RP
-              - description: EMC_R2W
-              - description: EMC_W2R
-              - description: EMC_R2P
-              - description: EMC_W2P
-              - description: EMC_RD_RCD
-              - description: EMC_WR_RCD
-              - description: EMC_RRD
-              - description: EMC_REXT
-              - description: EMC_WEXT
-              - description: EMC_WDV
-              - description: EMC_WDV_MASK
-              - description: EMC_QUSE
-              - description: EMC_QUSE_WIDTH
-              - description: EMC_IBDLY
-              - description: EMC_EINPUT
-              - description: EMC_EINPUT_DURATION
-              - description: EMC_PUTERM_EXTRA
-              - description: EMC_PUTERM_WIDTH
-              - description: EMC_PUTERM_ADJ
-              - description: EMC_CDB_CNTL_1
-              - description: EMC_CDB_CNTL_2
-              - description: EMC_CDB_CNTL_3
-              - description: EMC_QRST
-              - description: EMC_QSAFE
-              - description: EMC_RDV
-              - description: EMC_RDV_MASK
-              - description: EMC_REFRESH
-              - description: EMC_BURST_REFRESH_NUM
-              - description: EMC_PRE_REFRESH_REQ_CNT
-              - description: EMC_PDEX2WR
-              - description: EMC_PDEX2RD
-              - description: EMC_PCHG2PDEN
-              - description: EMC_ACT2PDEN
-              - description: EMC_AR2PDEN
-              - description: EMC_RW2PDEN
-              - description: EMC_TXSR
-              - description: EMC_TXSRDLL
-              - description: EMC_TCKE
-              - description: EMC_TCKESR
-              - description: EMC_TPD
-              - description: EMC_TFAW
-              - description: EMC_TRPAB
-              - description: EMC_TCLKSTABLE
-              - description: EMC_TCLKSTOP
-              - description: EMC_TREFBW
-              - description: EMC_FBIO_CFG6
-              - description: EMC_ODT_WRITE
-              - description: EMC_ODT_READ
-              - description: EMC_FBIO_CFG5
-              - description: EMC_CFG_DIG_DLL
-              - description: EMC_CFG_DIG_DLL_PERIOD
-              - description: EMC_DLL_XFORM_DQS0
-              - description: EMC_DLL_XFORM_DQS1
-              - description: EMC_DLL_XFORM_DQS2
-              - description: EMC_DLL_XFORM_DQS3
-              - description: EMC_DLL_XFORM_DQS4
-              - description: EMC_DLL_XFORM_DQS5
-              - description: EMC_DLL_XFORM_DQS6
-              - description: EMC_DLL_XFORM_DQS7
-              - description: EMC_DLL_XFORM_DQS8
-              - description: EMC_DLL_XFORM_DQS9
-              - description: EMC_DLL_XFORM_DQS10
-              - description: EMC_DLL_XFORM_DQS11
-              - description: EMC_DLL_XFORM_DQS12
-              - description: EMC_DLL_XFORM_DQS13
-              - description: EMC_DLL_XFORM_DQS14
-              - description: EMC_DLL_XFORM_DQS15
-              - description: EMC_DLL_XFORM_QUSE0
-              - description: EMC_DLL_XFORM_QUSE1
-              - description: EMC_DLL_XFORM_QUSE2
-              - description: EMC_DLL_XFORM_QUSE3
-              - description: EMC_DLL_XFORM_QUSE4
-              - description: EMC_DLL_XFORM_QUSE5
-              - description: EMC_DLL_XFORM_QUSE6
-              - description: EMC_DLL_XFORM_QUSE7
-              - description: EMC_DLL_XFORM_ADDR0
-              - description: EMC_DLL_XFORM_ADDR1
-              - description: EMC_DLL_XFORM_ADDR2
-              - description: EMC_DLL_XFORM_ADDR3
-              - description: EMC_DLL_XFORM_ADDR4
-              - description: EMC_DLL_XFORM_ADDR5
-              - description: EMC_DLL_XFORM_QUSE8
-              - description: EMC_DLL_XFORM_QUSE9
-              - description: EMC_DLL_XFORM_QUSE10
-              - description: EMC_DLL_XFORM_QUSE11
-              - description: EMC_DLL_XFORM_QUSE12
-              - description: EMC_DLL_XFORM_QUSE13
-              - description: EMC_DLL_XFORM_QUSE14
-              - description: EMC_DLL_XFORM_QUSE15
-              - description: EMC_DLI_TRIM_TXDQS0
-              - description: EMC_DLI_TRIM_TXDQS1
-              - description: EMC_DLI_TRIM_TXDQS2
-              - description: EMC_DLI_TRIM_TXDQS3
-              - description: EMC_DLI_TRIM_TXDQS4
-              - description: EMC_DLI_TRIM_TXDQS5
-              - description: EMC_DLI_TRIM_TXDQS6
-              - description: EMC_DLI_TRIM_TXDQS7
-              - description: EMC_DLI_TRIM_TXDQS8
-              - description: EMC_DLI_TRIM_TXDQS9
-              - description: EMC_DLI_TRIM_TXDQS10
-              - description: EMC_DLI_TRIM_TXDQS11
-              - description: EMC_DLI_TRIM_TXDQS12
-              - description: EMC_DLI_TRIM_TXDQS13
-              - description: EMC_DLI_TRIM_TXDQS14
-              - description: EMC_DLI_TRIM_TXDQS15
-              - description: EMC_DLL_XFORM_DQ0
-              - description: EMC_DLL_XFORM_DQ1
-              - description: EMC_DLL_XFORM_DQ2
-              - description: EMC_DLL_XFORM_DQ3
-              - description: EMC_DLL_XFORM_DQ4
-              - description: EMC_DLL_XFORM_DQ5
-              - description: EMC_DLL_XFORM_DQ6
-              - description: EMC_DLL_XFORM_DQ7
-              - description: EMC_XM2CMDPADCTRL
-              - description: EMC_XM2CMDPADCTRL4
-              - description: EMC_XM2CMDPADCTRL5
-              - description: EMC_XM2DQPADCTRL2
-              - description: EMC_XM2DQPADCTRL3
-              - description: EMC_XM2CLKPADCTRL
-              - description: EMC_XM2CLKPADCTRL2
-              - description: EMC_XM2COMPPADCTRL
-              - description: EMC_XM2VTTGENPADCTRL
-              - description: EMC_XM2VTTGENPADCTRL2
-              - description: EMC_XM2VTTGENPADCTRL3
-              - description: EMC_XM2DQSPADCTRL3
-              - description: EMC_XM2DQSPADCTRL4
-              - description: EMC_XM2DQSPADCTRL5
-              - description: EMC_XM2DQSPADCTRL6
-              - description: EMC_DSR_VTTGEN_DRV
-              - description: EMC_TXDSRVTTGEN
-              - description: EMC_FBIO_SPARE
-              - description: EMC_ZCAL_WAIT_CNT
-              - description: EMC_MRS_WAIT_CNT2
-              - description: EMC_CTT
-              - description: EMC_CTT_DURATION
-              - description: EMC_CFG_PIPE
-              - description: EMC_DYN_SELF_REF_CONTROL
-              - description: EMC_QPOP
 
         required:
           - clock-frequency
@@ -318,9 +180,7 @@ patternProperties:
           - nvidia,emc-auto-cal-config2
           - nvidia,emc-auto-cal-config3
           - nvidia,emc-auto-cal-interval
-          - nvidia,emc-bgbias-ctl0
           - nvidia,emc-cfg
-          - nvidia,emc-cfg-2
           - nvidia,emc-ctt-term-ctrl
           - nvidia,emc-mode-1
           - nvidia,emc-mode-2
@@ -344,6 +204,281 @@ required:
   - "#interconnect-cells"
   - operating-points-v2
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-emc
+    then:
+      patternProperties:
+        "^emc-timings-[0-9]+$":
+          patternProperties:
+            "^timing-[0-9]+$":
+              properties:
+                nvidia,emc-configuration:
+                  items:
+                    - description: EMC_RC
+                    - description: EMC_RFC
+                    - description: EMC_RAS
+                    - description: EMC_RP
+                    - description: EMC_R2W
+                    - description: EMC_W2R
+                    - description: EMC_R2P
+                    - description: EMC_W2P
+                    - description: EMC_RD_RCD
+                    - description: EMC_WR_RCD
+                    - description: EMC_RRD
+                    - description: EMC_REXT
+                    - description: EMC_WEXT
+                    - description: EMC_WDV
+                    - description: EMC_WDV_MASK
+                    - description: EMC_QUSE
+                    - description: EMC_IBDLY
+                    - description: EMC_EINPUT
+                    - description: EMC_EINPUT_DURATION
+                    - description: EMC_PUTERM_EXTRA
+                    - description: EMC_CDB_CNTL_1
+                    - description: EMC_CDB_CNTL_2
+                    - description: EMC_QRST
+                    - description: EMC_QSAFE
+                    - description: EMC_RDV
+                    - description: EMC_RDV_MASK
+                    - description: EMC_REFRESH
+                    - description: EMC_BURST_REFRESH_NUM
+                    - description: EMC_PRE_REFRESH_REQ_CNT
+                    - description: EMC_PDEX2WR
+                    - description: EMC_PDEX2RD
+                    - description: EMC_PCHG2PDEN
+                    - description: EMC_ACT2PDEN
+                    - description: EMC_AR2PDEN
+                    - description: EMC_RW2PDEN
+                    - description: EMC_TXSR
+                    - description: EMC_TXSRDLL
+                    - description: EMC_TCKE
+                    - description: EMC_TCKESR
+                    - description: EMC_TPD
+                    - description: EMC_TFAW
+                    - description: EMC_TRPAB
+                    - description: EMC_TCLKSTABLE
+                    - description: EMC_TCLKSTOP
+                    - description: EMC_TREFBW
+                    - description: EMC_QUSE_EXTRA
+                    - description: EMC_FBIO_CFG6
+                    - description: EMC_ODT_WRITE
+                    - description: EMC_ODT_READ
+                    - description: EMC_FBIO_CFG5
+                    - description: EMC_CFG_DIG_DLL
+                    - description: EMC_CFG_DIG_DLL_PERIOD
+                    - description: EMC_DLL_XFORM_DQS0
+                    - description: EMC_DLL_XFORM_DQS1
+                    - description: EMC_DLL_XFORM_DQS2
+                    - description: EMC_DLL_XFORM_DQS3
+                    - description: EMC_DLL_XFORM_DQS4
+                    - description: EMC_DLL_XFORM_DQS5
+                    - description: EMC_DLL_XFORM_DQS6
+                    - description: EMC_DLL_XFORM_DQS7
+                    - description: EMC_DLL_XFORM_QUSE0
+                    - description: EMC_DLL_XFORM_QUSE1
+                    - description: EMC_DLL_XFORM_QUSE2
+                    - description: EMC_DLL_XFORM_QUSE3
+                    - description: EMC_DLL_XFORM_QUSE4
+                    - description: EMC_DLL_XFORM_QUSE5
+                    - description: EMC_DLL_XFORM_QUSE6
+                    - description: EMC_DLL_XFORM_QUSE7
+                    - description: EMC_DLI_TRIM_TXDQS0
+                    - description: EMC_DLI_TRIM_TXDQS1
+                    - description: EMC_DLI_TRIM_TXDQS2
+                    - description: EMC_DLI_TRIM_TXDQS3
+                    - description: EMC_DLI_TRIM_TXDQS4
+                    - description: EMC_DLI_TRIM_TXDQS5
+                    - description: EMC_DLI_TRIM_TXDQS6
+                    - description: EMC_DLI_TRIM_TXDQS7
+                    - description: EMC_DLL_XFORM_DQ0
+                    - description: EMC_DLL_XFORM_DQ1
+                    - description: EMC_DLL_XFORM_DQ2
+                    - description: EMC_DLL_XFORM_DQ3
+                    - description: EMC_XM2CMDPADCTRL
+                    - description: EMC_XM2CMDPADCTRL4
+                    - description: EMC_XM2DQPADCTRL2
+                    - description: EMC_XM2CLKPADCTRL
+                    - description: EMC_XM2COMPPADCTRL
+                    - description: EMC_XM2VTTGENPADCTRL
+                    - description: EMC_XM2VTTGENPADCTRL2
+                    - description: EMC_XM2DQSPADCTRL3
+                    - description: EMC_XM2DQSPADCTRL4
+                    - description: EMC_DSR_VTTGEN_DRV
+                    - description: EMC_TXDSRVTTGEN
+                    - description: EMC_FBIO_SPARE
+                    - description: EMC_ZCAL_WAIT_CNT
+                    - description: EMC_MRS_WAIT_CNT2
+                    - description: EMC_CTT
+                    - description: EMC_CTT_DURATION
+                    - description: EMC_DYN_SELF_REF_CONTROL
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra124-emc
+    then:
+      patternProperties:
+        "^emc-timings-[0-9]+$":
+          patternProperties:
+            "^timing-[0-9]+$":
+              properties:
+                nvidia,emc-configuration:
+                  items:
+                    - description: EMC_RC
+                    - description: EMC_RFC
+                    - description: EMC_RFC_SLR
+                    - description: EMC_RAS
+                    - description: EMC_RP
+                    - description: EMC_R2W
+                    - description: EMC_W2R
+                    - description: EMC_R2P
+                    - description: EMC_W2P
+                    - description: EMC_RD_RCD
+                    - description: EMC_WR_RCD
+                    - description: EMC_RRD
+                    - description: EMC_REXT
+                    - description: EMC_WEXT
+                    - description: EMC_WDV
+                    - description: EMC_WDV_MASK
+                    - description: EMC_QUSE
+                    - description: EMC_QUSE_WIDTH
+                    - description: EMC_IBDLY
+                    - description: EMC_EINPUT
+                    - description: EMC_EINPUT_DURATION
+                    - description: EMC_PUTERM_EXTRA
+                    - description: EMC_PUTERM_WIDTH
+                    - description: EMC_PUTERM_ADJ
+                    - description: EMC_CDB_CNTL_1
+                    - description: EMC_CDB_CNTL_2
+                    - description: EMC_CDB_CNTL_3
+                    - description: EMC_QRST
+                    - description: EMC_QSAFE
+                    - description: EMC_RDV
+                    - description: EMC_RDV_MASK
+                    - description: EMC_REFRESH
+                    - description: EMC_BURST_REFRESH_NUM
+                    - description: EMC_PRE_REFRESH_REQ_CNT
+                    - description: EMC_PDEX2WR
+                    - description: EMC_PDEX2RD
+                    - description: EMC_PCHG2PDEN
+                    - description: EMC_ACT2PDEN
+                    - description: EMC_AR2PDEN
+                    - description: EMC_RW2PDEN
+                    - description: EMC_TXSR
+                    - description: EMC_TXSRDLL
+                    - description: EMC_TCKE
+                    - description: EMC_TCKESR
+                    - description: EMC_TPD
+                    - description: EMC_TFAW
+                    - description: EMC_TRPAB
+                    - description: EMC_TCLKSTABLE
+                    - description: EMC_TCLKSTOP
+                    - description: EMC_TREFBW
+                    - description: EMC_FBIO_CFG6
+                    - description: EMC_ODT_WRITE
+                    - description: EMC_ODT_READ
+                    - description: EMC_FBIO_CFG5
+                    - description: EMC_CFG_DIG_DLL
+                    - description: EMC_CFG_DIG_DLL_PERIOD
+                    - description: EMC_DLL_XFORM_DQS0
+                    - description: EMC_DLL_XFORM_DQS1
+                    - description: EMC_DLL_XFORM_DQS2
+                    - description: EMC_DLL_XFORM_DQS3
+                    - description: EMC_DLL_XFORM_DQS4
+                    - description: EMC_DLL_XFORM_DQS5
+                    - description: EMC_DLL_XFORM_DQS6
+                    - description: EMC_DLL_XFORM_DQS7
+                    - description: EMC_DLL_XFORM_DQS8
+                    - description: EMC_DLL_XFORM_DQS9
+                    - description: EMC_DLL_XFORM_DQS10
+                    - description: EMC_DLL_XFORM_DQS11
+                    - description: EMC_DLL_XFORM_DQS12
+                    - description: EMC_DLL_XFORM_DQS13
+                    - description: EMC_DLL_XFORM_DQS14
+                    - description: EMC_DLL_XFORM_DQS15
+                    - description: EMC_DLL_XFORM_QUSE0
+                    - description: EMC_DLL_XFORM_QUSE1
+                    - description: EMC_DLL_XFORM_QUSE2
+                    - description: EMC_DLL_XFORM_QUSE3
+                    - description: EMC_DLL_XFORM_QUSE4
+                    - description: EMC_DLL_XFORM_QUSE5
+                    - description: EMC_DLL_XFORM_QUSE6
+                    - description: EMC_DLL_XFORM_QUSE7
+                    - description: EMC_DLL_XFORM_ADDR0
+                    - description: EMC_DLL_XFORM_ADDR1
+                    - description: EMC_DLL_XFORM_ADDR2
+                    - description: EMC_DLL_XFORM_ADDR3
+                    - description: EMC_DLL_XFORM_ADDR4
+                    - description: EMC_DLL_XFORM_ADDR5
+                    - description: EMC_DLL_XFORM_QUSE8
+                    - description: EMC_DLL_XFORM_QUSE9
+                    - description: EMC_DLL_XFORM_QUSE10
+                    - description: EMC_DLL_XFORM_QUSE11
+                    - description: EMC_DLL_XFORM_QUSE12
+                    - description: EMC_DLL_XFORM_QUSE13
+                    - description: EMC_DLL_XFORM_QUSE14
+                    - description: EMC_DLL_XFORM_QUSE15
+                    - description: EMC_DLI_TRIM_TXDQS0
+                    - description: EMC_DLI_TRIM_TXDQS1
+                    - description: EMC_DLI_TRIM_TXDQS2
+                    - description: EMC_DLI_TRIM_TXDQS3
+                    - description: EMC_DLI_TRIM_TXDQS4
+                    - description: EMC_DLI_TRIM_TXDQS5
+                    - description: EMC_DLI_TRIM_TXDQS6
+                    - description: EMC_DLI_TRIM_TXDQS7
+                    - description: EMC_DLI_TRIM_TXDQS8
+                    - description: EMC_DLI_TRIM_TXDQS9
+                    - description: EMC_DLI_TRIM_TXDQS10
+                    - description: EMC_DLI_TRIM_TXDQS11
+                    - description: EMC_DLI_TRIM_TXDQS12
+                    - description: EMC_DLI_TRIM_TXDQS13
+                    - description: EMC_DLI_TRIM_TXDQS14
+                    - description: EMC_DLI_TRIM_TXDQS15
+                    - description: EMC_DLL_XFORM_DQ0
+                    - description: EMC_DLL_XFORM_DQ1
+                    - description: EMC_DLL_XFORM_DQ2
+                    - description: EMC_DLL_XFORM_DQ3
+                    - description: EMC_DLL_XFORM_DQ4
+                    - description: EMC_DLL_XFORM_DQ5
+                    - description: EMC_DLL_XFORM_DQ6
+                    - description: EMC_DLL_XFORM_DQ7
+                    - description: EMC_XM2CMDPADCTRL
+                    - description: EMC_XM2CMDPADCTRL4
+                    - description: EMC_XM2CMDPADCTRL5
+                    - description: EMC_XM2DQPADCTRL2
+                    - description: EMC_XM2DQPADCTRL3
+                    - description: EMC_XM2CLKPADCTRL
+                    - description: EMC_XM2CLKPADCTRL2
+                    - description: EMC_XM2COMPPADCTRL
+                    - description: EMC_XM2VTTGENPADCTRL
+                    - description: EMC_XM2VTTGENPADCTRL2
+                    - description: EMC_XM2VTTGENPADCTRL3
+                    - description: EMC_XM2DQSPADCTRL3
+                    - description: EMC_XM2DQSPADCTRL4
+                    - description: EMC_XM2DQSPADCTRL5
+                    - description: EMC_XM2DQSPADCTRL6
+                    - description: EMC_DSR_VTTGEN_DRV
+                    - description: EMC_TXDSRVTTGEN
+                    - description: EMC_FBIO_SPARE
+                    - description: EMC_ZCAL_WAIT_CNT
+                    - description: EMC_MRS_WAIT_CNT2
+                    - description: EMC_CTT
+                    - description: EMC_CTT_DURATION
+                    - description: EMC_CFG_PIPE
+                    - description: EMC_DYN_SELF_REF_CONTROL
+                    - description: EMC_QPOP
+
+              required:
+                - nvidia,emc-bgbias-ctl0
+                - nvidia,emc-cfg-2
+
 additionalProperties: false
 
 examples:
-- 
2.48.1

