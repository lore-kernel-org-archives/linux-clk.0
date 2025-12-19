Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A02528BA83
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 04:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118877; cv=none; b=fcye7i8ymqbDocPB9SsWG05hbVj3/7n/2cOBa6I4yvA2pnRZLh/4S3CYIbZltbY4rkxvZuNT+5uCu0BHYwEMteOZO86uufF7cVkaz8TTowC48zo0uQkQzrwzn0igmhiI6JNC3GnpsBzWviBv+01OSOgHiTEEZc4giGoMY5mrq1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118877; c=relaxed/simple;
	bh=3AjNYVDLj3dIk9Cc/YWpPnzSycJtLhtYlxld7c9jHH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ext9aMRdvzw58v3NxiZ7vu9sQKbn5QOWT7ypcJXXePK7X7wVSKp/y7RoIxAYKDCFFUuTLTyYigy1kRyoKuZ8cM44CB5iDgwViS/Zo/7sppeHwpTPq++9wZEQU2GudaOFFxRyWhBWqJXtYKyLJ4PfOzAId4A9UurPb9cmQq0UmsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nogCCDAn; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nogCCDAn"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64471fcdef0so1025049d50.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 20:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118874; x=1766723674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWz1P8414J3OUB/pGvKwvDCZTM3BGlGL3AvsIxO+j/o=;
        b=nogCCDAnAm01k1M1qD7w4Xy9uRDdcxKFZpSdJRQi1w3KYo2g//+RmKbYFSD9XMNqzj
         RMS488ipT7KAHPCZEOt7Imb4bCrAbfQkzoSQ8J0imjTcn3JcEEnvyAqct2qcWWAF8M59
         YmKLoG5dnBI+qQfcUxSRsTxJWDXugXbzjZzYSYSwQKMwCRTbibxbLiYoC0rU/tI7iurd
         rlxzPoKI/Tmq4T2ulDSBpJwht4A/rEUpzevFEk9ODGWoilbEjBKLHMmalOWa1LGLrNyZ
         Vm5dPPZLbqfnvEvdMPOMwa8TuE2SCseGHchJKcOmEKP4xK8Zy2KEmO5jUUcx0rQ8uDyA
         0Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118874; x=1766723674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWz1P8414J3OUB/pGvKwvDCZTM3BGlGL3AvsIxO+j/o=;
        b=X0vFenCZcn2tqot9j8Dx5uiD5R2+a5ZUwe25mc6utcu22iYRUcrvlkD4nYH8lBF57g
         Kv9hsmBY9ADAI0ySihNqjBl58Aunn/MM3ROhq2I8wGPmxvE5HaKKZFvAtrlCLCaalL/a
         jYj84/EhjEuWLJpYy2Zvm7RcIDwuWF7ueVpuk9KAP784/LFQ1b9NfabeYC7tdVMHcGld
         Sd8FxoLMU4La60TOS3Q36Fv/luXsmH3k5VzCqPkCGKegYnI/RWSCGzBU+rp42O4Z8VnO
         EsMCxhNgheCvs8m3b1Fix/Uge7Zaw+mKR62TRsLr1CK68e+SZID0hbFjzuwEX7epboDS
         GYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4GvalVoE0oTt7fFiBL+1DrziXMpSCX+AKr8peUpfzN60fdHuCDfvNMVi4OyKulzze9qaC7vSD/gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIWnRsxuu7RkN7rhTMxNyQ7nBtYw+HBcuvWbXtSZbWR+meesjc
	fhpnvP6ZcuV0eNnsDDpHGgGGohKUj8X7Da4cEz4q8WR2e24aygc6wxwY
X-Gm-Gg: AY/fxX4kS9tGdqSqKBuomjIgGmv9bGImKWUlvAhBeIKIUkSJ90G4oyqvAGoJe90BAsO
	DPkdN7V9xDRj0Ds35/4HLzMoA4c7BQgnQZ7nyil9RILuf+CO8ap1yj6YdNgJwlaTz46VH9+u/xy
	dlb2C7fi0y5vBn6heQlT/tbgyh1TVTW211Uv9IFcC8y9l0AjE20vBE2Uyz/hhi/7WyBX0el8qAr
	6vCZtBVjhuTiQzzZbP/LzEb0w6210DjqCdu2QuO+U6Ld+4EZtwUJ2C1/fBbLNn7aqZzDukKDJ8P
	cMHFMNhZodcJlSTY7g7ZmIpyJd3pb7IVFItafdcqqNd70c3IwTGbA/aMmFWWD7MOzCvNCRS9phW
	dK7DyyPVRD/J1clSh+VSZHZQJnBZW1ekVfvQ7B7nKjEhbU1kAqsQEu2Wf29EbfhSxdmlIYvWtns
	J3K4kYoEZrWwkD+2LPDSkQzHuBmLEJxl80Z70fD93RDPSFK9LH/LQEXPOC9B8wVp6mpmlnZhCp2
	dYAk6XHVbt7jPPCFk9m83Q9FVnK
X-Google-Smtp-Source: AGHT+IHPi6DErBNZ73Fj/39MbWvseTGAB/JcDUsa+hKnG2WsFU+qhmiJiN1U92vxyYiU1pyiYMgGnQ==
X-Received: by 2002:a05:690c:d1b:b0:788:161c:7117 with SMTP id 00721157ae682-78fb3f05395mr30659917b3.8.1766118874295;
        Thu, 18 Dec 2025 20:34:34 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:33 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] dt-bindings: clock: gcc-ipq9574: add wcss remoteproc clocks
Date: Thu, 18 Dec 2025 22:34:11 -0600
Message-ID: <20251219043425.888585-3-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit da040d560319 ("dt-bindings: clock: qcom: gcc-ipq9574: remove q6
bring up clock macros") removed these clocks on the idea that Q6
firmware is responsible for clock bringup. That statement seems
incorrect, as these clocks need to be enabled before the Q6 is booted.
Otherwise, the host CPU core that starts the Q6 hangs.

Perhaps the statement meant that the TrustZone firmware will start the
clocks. This only happens in PAS mode. Under native OS loading, the
host needs these clocks, so add them back.

Besides the clocks that were erroneously removed, also add defines for
GCC_WCSS_AHB_S_CLK, GCC_WCSS_AXI_M_CLK, and GCC_Q6_AXIM2_CLK, as all
these clocks are required to operate the remoteproc.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 include/dt-bindings/clock/qcom,ipq9574-gcc.h | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,ipq9574-gcc.h b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
index 0e7c319897f3a..8c74f50a27909 100644
--- a/include/dt-bindings/clock/qcom,ipq9574-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
@@ -132,8 +132,16 @@
 #define GCC_NSSNOC_SNOC_1_CLK				123
 #define GCC_QDSS_ETR_USB_CLK				124
 #define WCSS_AHB_CLK_SRC				125
+#define GCC_Q6_AHB_CLK					126
+#define GCC_Q6_AHB_S_CLK				127
+#define GCC_WCSS_ECAHB_CLK				128
+#define GCC_WCSS_ACMT_CLK				129
+#define GCC_SYS_NOC_WCSS_AHB_CLK			130
 #define WCSS_AXI_M_CLK_SRC				131
+#define GCC_ANOC_WCSS_AXI_M_CLK				132
 #define QDSS_AT_CLK_SRC					133
+#define GCC_Q6SS_ATBM_CLK				134
+#define GCC_WCSS_DBG_IFC_ATB_CLK			135
 #define GCC_NSSNOC_ATB_CLK				136
 #define GCC_QDSS_AT_CLK					137
 #define GCC_SYS_NOC_AT_CLK				138
@@ -146,18 +154,27 @@
 #define QDSS_TRACECLKIN_CLK_SRC				145
 #define GCC_QDSS_TRACECLKIN_CLK				146
 #define QDSS_TSCTR_CLK_SRC				147
+#define GCC_Q6_TSCTR_1TO2_CLK				148
+#define GCC_WCSS_DBG_IFC_NTS_CLK			149
 #define GCC_QDSS_TSCTR_DIV2_CLK				150
 #define GCC_QDSS_TS_CLK					151
 #define GCC_QDSS_TSCTR_DIV4_CLK				152
 #define GCC_NSS_TS_CLK					153
 #define GCC_QDSS_TSCTR_DIV8_CLK				154
 #define GCC_QDSS_TSCTR_DIV16_CLK			155
+#define GCC_Q6SS_PCLKDBG_CLK				156
+#define GCC_Q6SS_TRIG_CLK				157
+#define GCC_WCSS_DBG_IFC_APB_CLK			158
+#define GCC_WCSS_DBG_IFC_DAPBUS_CLK			159
 #define GCC_QDSS_DAP_CLK				160
 #define GCC_QDSS_APB2JTAG_CLK				161
 #define GCC_QDSS_TSCTR_DIV3_CLK				162
 #define QPIC_IO_MACRO_CLK_SRC				163
 #define GCC_QPIC_IO_MACRO_CLK                           164
 #define Q6_AXI_CLK_SRC					165
+#define GCC_Q6_AXIM_CLK					166
+#define GCC_WCSS_Q6_TBU_CLK				167
+#define GCC_MEM_NOC_Q6_AXI_CLK				168
 #define Q6_AXIM2_CLK_SRC				169
 #define NSSNOC_MEMNOC_BFDCD_CLK_SRC			170
 #define GCC_NSSNOC_MEMNOC_CLK				171
@@ -182,6 +199,7 @@
 #define GCC_UNIPHY2_SYS_CLK				190
 #define GCC_CMN_12GPLL_SYS_CLK				191
 #define GCC_NSSNOC_XO_DCD_CLK				192
+#define GCC_Q6SS_BOOT_CLK				193
 #define UNIPHY_SYS_CLK_SRC				194
 #define NSS_TS_CLK_SRC					195
 #define GCC_ANOC_PCIE0_1LANE_M_CLK			196
@@ -203,4 +221,8 @@
 #define GCC_PCIE2_PIPE_CLK				212
 #define GCC_PCIE3_PIPE_CLK				213
 #define GPLL0_OUT_AUX					214
+#define GCC_WCSS_AHB_S_CLK				215
+#define GCC_WCSS_AXI_M_CLK				216
+#define GCC_Q6_AXIM2_CLK				217
+
 #endif
-- 
2.45.1

