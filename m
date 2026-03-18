Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264163921CE
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832134; cv=none; b=jCCGQTcNqB7Rk2krdzLiRJ70ftLu9pg4y0rqRNhPhfsUCZQLudhvfuiUfCwo7g1v7Pfbw8BnQ+iVZS2jtJuzbl8Jw5scSO/qxJiSPrPuPULmQCzyPNEivh1PYqc0pNPGv7ZgfPRC749xJnybEHLpU2VxhG0hkAz/sKWfQEWcCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832134; c=relaxed/simple;
	bh=7hyg1XXvT5j3mOuyK22QBL9DKoIwlwiMnknBQSnTpeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYYHbSgqx7W0eqiREO8IhCEd9gsbTU2gojuqNKFWDVhJEJx9WteYfToqxJNt9ZwYZ8DykmbzoC4lrQUzDRUxXg+tmub36cT6zB66ckkjeqVv0LeLzZWYmYxTHbPtVhApFzzQZRDct88URBpaAYaEWh/6e/3Au3YXHwljK0uQJ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wad3rk0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkIiEhNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wad3rk0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkIiEhNf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9L1dE402719
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=; b=Wad3rk0SnmL5ZVJn
	dpXTzwHKSYsJaZLn3qZjfjHbPGxp694yAGTcCdvtSOO3L3GvIxMOOEEFEz+G1r7h
	Lelc8SqdvjSsNqWQBIslSm9dY/d+ZhblAbdtP44uPuN7ACVQ7mRF0NinkjzTCvvd
	ygz1PFa8oORAEIhJfVcrwrLJvovkW5wgzJ3m6wLJ/ssLAQ/Ylt0Q86Q3FdKC7U72
	IBv3kguccWtr20mp4lpRXB9SWydDYq3xQpWoRfujahACYWxi7ft57l4Uaf5OtMhi
	kXDvjRMMmmXxIAmNbTp6aZN1yA55ymWev2q1JhM+oZ4DiCgk2N4eqRfVkpQAEVHu
	pxVyMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4duet7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093025ffecso51739811cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832131; x=1774436931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=;
        b=YkIiEhNf1eFw1FlCLqAypNOUeVF6dbFHScInZuirUTKXCEWLVolldY+uGTLZXmPbMm
         A3P2F24nrzrZk9ny6cp+hLY2Hli9S6iDKwCJ/oewpHrhDY+LPon0BJk5SyacXXzJNK5J
         NavAmW72w+BRsvSqsptQhhyBptsF9jli/Z6d5ZQWn1aJrz5HBAKzM7BglcG+s5mq6BQv
         1dfAgytAPR8wlKqzEZd23YuHPEdo2uYJkCs3CYMHGwV7eHyadWow88vf9y6tNvqovesS
         RPw4OOwOGjK6qc5Yl1NQq8Mko30jFq6GA/WwOALqCCbb0523sFa3FxhmaR/lTt1qGC/I
         Pd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832131; x=1774436931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=;
        b=oHLdC4uWx/BtCSZHK6PVPhl3LAoACnjYt7W0Efni7GHN6+r8l2ogzBi0kXf5Of4ZMK
         io+pAdnt+A+ur9AXVNuO1Fz6ud4hTBPEleM8r+oHiSWJ4KhAOaY11VgkSLApKOba6eD+
         dzJQoakDbr+x5CLbn0nHB3ZhPTjRdn8CK4DfOwsIk7bb/dfjSRTVwEVBWAtOD8X899KQ
         w7F+YVwYCz1jjgUxHMxXEU0n9fZOkpErbGCOz9iD6QN2lKmUCBulQJkZff4nGKrKo7F2
         zmO/0rHHngU7tUCgopTx/R95qPYy4CHB68T7VbUHUfv1ZuqyI+DIZW+WjfUb8JGMt2YP
         3KYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU638sHZZBJQpnhAi5XHsquQ3O7z1qyIwf5ZY5SmoBjrYAmCMmkmHp+QBy642QzwMbq+kFqhuBxznE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2u9OCKOzopj2xru6aRaAJ2sm02TrFrb1xczk5buwlQZea9u/
	uiI/B6h+8OAB88GA86G39EISseOfPLwWsoLWM2sttixHM5lHiQtUE7SNwphjluXT7gw0sDZWVQA
	MHbF9THrkLof5bfSzAMIvFixbXtiD1o9FB03jBrfQ4o8482HHBmWqwVxSd5F9ock=
X-Gm-Gg: ATEYQzyd8nkGTJnudeCiYU1apJPbkO4LFzpcRr9MWyAiDFmKIwyOaNUVrX/9T4Fef9U
	awdNC+pQBd2/UnsNBhD+3yDSdA24MUpK8PXsc0DE5gXOhk7qZ+JlZ07EJOpSv/JyEvqgo9H0aZo
	T5WJ7J066hD7y3ahK1icqDZ9N3hNrIc+ltQa5yKvWtcE7yY/MdNEwHpQoGcBJrMCqbH5ZOcYhBm
	hfuGpC/k2fCvrMe9D3ufIiQgLSgTM24tE4S8HZTOZiAiHXAg0MAZS5IzN2wS36K7jRUgUdzBasH
	COjGmNGo0t5HY9vn/RiaJbYjgAPIuBc+KVHnnzOkTDiTt/JSA192xCjq36VTD4mJ1ILfh/YmXmc
	GMfIlRP9RN9bRxJ/WFE3dUcI49qZEFOJ9wF4hbzGRKitn
X-Received: by 2002:a05:622a:18a0:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-50b14869854mr32484711cf.26.1773832131438;
        Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
X-Received: by 2002:a05:622a:18a0:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-50b14869854mr32484201cf.26.1773832130763;
        Wed, 18 Mar 2026 04:08:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:40 +0100
Subject: [PATCH 1/5] clk: qcom: kaanapali: Cleanup redundant header
 includes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-1-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7hyg1XXvT5j3mOuyK22QBL9DKoIwlwiMnknBQSnTpeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe6gR9bvfg1adntW7DiNK52kg38RdUAFpdOQ
 IXra6l1f4aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHugAKCRDBN2bmhouD
 1/6uD/9ZAAGcvO3kTn/UshqbTfg0k/YLc5NItNNgKuTLe+1MFzJrxMI29Vl/+25cC1UD9daLQsG
 bt+zzp6Ue02o+vJ13Bh8etpYPLBWuF3MTXGOl9D9LdYI7kW/3sLuVJ0IZg5WulI9GKBfDKtXmNz
 AAWcfeLObmuasvBK+u0bA1iWGa3e2U6py9KryG3qFGIpjpIo1HpjzkYwUk4LZ8Z5RwN7q1UcBh4
 B/xGEWUahLpFQVqWCPXTchouENIMc2uYixnyvN9++yNr7lPSBlFrIgsGVvncXT7roblpUify15I
 R1vnHJum7RG4vqgKy0KsZlpx6KVaUPcVxpL/tL8C91sMnUaMzKKn0KLgvzaPeZ80Xfp5VgTN5Hz
 7OhsDRu4iYy4GahSTuWbPPSZ12TLrgXhbn+wmpQlBRt8SdrM7+7sFu5g53BZjJyv2FfbjnwG1pj
 7MpmZtu/ly1UrNpY3JTwX7v+OoykNJ0CYYpJ48ca4fYIpQYOR2L78w2nw/sjgxX7iG2Xu7QlqFc
 bWIbLpYabbwxV9Tb6eUkQrMNjt8s61TJ1ikMAGHxiA9bic7F4vqi9D45sawgcO3wEn2RXv2ZXyw
 BjdhkjPzxmoBudkh1PokAEqY2tgGgxKXV15W1EWgacDaTBwR5Dp7yY6YIpvK0yCI192m2WRoZ0K
 pmph9cv0QhJg2lw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX4tdQMO1E5/YY
 uQNONs33d2JXN1LWlfanD+o80s1seUjR2dt9dGTl7X0Q0UXe+k3gCbagITwJq4Ejr85sdsqeG6R
 Xdiw1maWfmW99ZY3SgzQxdsxHkPmyxy4jOFuByrgM/BVbW0fazvUgOuM0TTYyruEVV0zYC0s1iT
 R7pxA2/nrZo5DW59f/vmTmNBEwTwQ89tZsbMWxEXWLJa+WX1JV+fHO9W4VbZjeDrjm2VmH79+o+
 o6wmO2Fv2dm3fBzqUlawNwSUDkNiYk1nyin/+8Ne+pknN5XP0u7MVzGEyva5gg63+ReFxTLER8r
 pXO/uVkVzSXw1h3Q4kmx0WSuNaVEp0LcOwtABfJXfJiZ5RZTnQM2LGnp17i4CoIwYWI5/g0Sek7
 WQbGiirrLx2i3ZQe7Be/URGZ3nhCHPurH7MrGc14IfGilFF9DShT7pG2bADIj+Nqq4ZTCxoHlhf
 iavEhMTPUbbp6IX6PYg==
X-Proofpoint-GUID: R0s_MTVNVPnxf090sfeA77OJOXXkjC83
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba87c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BlA2PGTryg89HV8owXYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: R0s_MTVNVPnxf090sfeA77OJOXXkjC83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094

Remove unused header includes - drivers do not use any OF or runtime PM
API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 --
 drivers/clk/qcom/camcc-kaanapali.c         | 2 --
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 --
 drivers/clk/qcom/gcc-kaanapali.c           | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/tcsrcc-kaanapali.c        | 1 -
 7 files changed, 10 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index 066c1087b0b6..6ad912403b8b 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
index 82967993fcff..c848ca99e9df 100644
--- a/drivers/clk/qcom/camcc-kaanapali.c
+++ b/drivers/clk/qcom/camcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index c1578cd07041..5ec4d2ab6b67 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index b9743284927d..210ec7afbb67 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index 52be48c15c67..d93d06067fbf 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 3ee512f34967..795ce40e028b 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-kaanapali.c b/drivers/clk/qcom/tcsrcc-kaanapali.c
index 4da77367c9e0..db46d639edb8 100644
--- a/drivers/clk/qcom/tcsrcc-kaanapali.c
+++ b/drivers/clk/qcom/tcsrcc-kaanapali.c
@@ -5,7 +5,6 @@
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0

