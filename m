Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7777E23BD1B
	for <linux-clk@vger.kernel.org>; Mon,  4 Aug 2025 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754332175; cv=none; b=a74g08jfnMP+OuH3fFQGjEl/nzw64Kva90IC9JiOtsGtF2nibGiECnNaJd6G8U/C8jBFBDQ1+1ks1bF71tW6jlx2ButzG8Z/k1YKJaS+x3CTy2X2OmIiibuU6YTMVQbDGRp/VGGFi5P/yP/TV7hlXJy9f1j7MSoj3BPghzNz9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754332175; c=relaxed/simple;
	bh=97Wf+005AjX2fyW62YinF32DHzBNO7WW5hMyEiyttls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jNJiDoJ6pZxL9HqZ8MDC+eHDRMQy/xL+WrDLXYCUszb0z830QsQh+JFFQBLg9PZTil6MCwmPJSuYfTX3t7CvliozPaJdKLwK3gpr5LSm4Vbt8zYLAlZXyZ9A3AY+VTdicFawioEC970bs8VY4HFNOgVaSGNaGhV5UowzHwtr26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGNCSbfZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGNCSbfZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574E2gKG024107
	for <linux-clk@vger.kernel.org>; Mon, 4 Aug 2025 18:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4ZRS8X1q6T0ZLRueHzSZjd
	xm433yImBfAQNa/j3W3Cc=; b=GGNCSbfZcMkjB5y7evYdsnaCStsZoEky7Ae1tk
	nmO4sRjd3j3CX9+ZTbvUd/NGLMVEQ71LqdwhFRfraf+aLxjXNgMvar7cYbeaaLrx
	V7LWl6U1gorPCuouMU8Bdb1hsHdylSMhl9T/cnQqCt5jNb4YIizVUbyRFYlIJdfl
	0ak5+iG2IevxTt0opjHINMctSXOP14TXxtWCzeSF7njra/MCjhtqLbqN0YjzC8/j
	SkcPw6LLGXt7ZVIlfNXdQ7/TePW+gT2QMYjz03Z5VkekUD9P9BpOH13NSMj6e92e
	lI+3wwbDk4R2WJNNKdwUQ14F3zTH0SdAwSV5bEemjRbV6zJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m5w5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 18:29:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24011ceafc8so40309925ad.3
        for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 11:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754332171; x=1754936971;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZRS8X1q6T0ZLRueHzSZjdxm433yImBfAQNa/j3W3Cc=;
        b=v9u1EjAMh8ojOpJVdEYK95klnrzLxvYCa1gB+6g8cckq6eA0Z4SjUk45b+BDq6nT/b
         wuia4yQaUr/BuuYZtIV06uHdW42YKxWeQ/nR7gyMzkviuLXIm9LJejCcBXb7+gl0eISz
         HQxVtpYHPoAVZN9VHuBBQcxwLVsTfK369bp7/qsXQ8JkhKVCyNvab5BEGwR1T9OYM8fa
         MMK8geJ3us2fn5FWjFm5fiHk46B4LXWxQ60ERkse8SgGMsW665hFYLCw3Tc3B2ZrNQ32
         9imRi4ivMvxCThbHgmErAfbsdR7kJ5kKv0QiME2l0bCodCDrKC9DzyFu3Yc88HJTZnlc
         GdBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCiuNXuyQm/WiWK2+9AhxrpI44KS9Ai1htZ8fz68v7l4dATOZe0tsNx1zrTIYMWZALOg4maBuh3Ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFwxIVWahNZl038Rhnf9klgNmpMZ4l+eWGFtK3tHk8yQYup/pZ
	jpVmaHJaP6vEDi3HzcmWn7hCwagm6mf9n4Pz9u7mNPbiBGgwa6S+55bahnDPa2MpujuikY2Rch2
	PcicT4KpagdJujBC83PNPG53j7XMIafQbdUqBJkJbTVmK55LeYKrbyF4i1TLQgDw=
X-Gm-Gg: ASbGnctcBZCd8IdBCS0a4dKrmyxJu+SW3UtRuvaV26nrFnGVQpnpdajXKUqbAbX3rAe
	7JUYKC5NOGeu9pTcDw0H0tx8IHme0+aubwX70ypz/H6WK9cSYIqeXpc5R3N1oGVFnuwRa7N8G5k
	X6oVuZaLsz1pFmeNU6A3QjfvbU4LhmdnDqoVd9rNecr5LEHLHhJLBRBM/mJbwTKd1reruoxpmY5
	OEh2UsTIqGhBGC6dRwawwdR227xqY4wRn3MDs28dYHR8D3k7xxtimArauJQTUc36VOXKZLI5ju8
	W6cj7e5XjtRSAjTzvfNlMZeOL7awLMG/woPExfXw/rjEW3G4JAxGdQanI0NOBWif
X-Received: by 2002:a17:903:1245:b0:234:1163:ff99 with SMTP id d9443c01a7336-2424705444bmr148283375ad.43.1754332170827;
        Mon, 04 Aug 2025 11:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI/N3VZbz9RZmPiG99XcQflvUuxhU8jRiEQZfNcOiAlYNY9sO/cJUZlj+swyKOmrjO6HOihA==
X-Received: by 2002:a17:903:1245:b0:234:1163:ff99 with SMTP id d9443c01a7336-2424705444bmr148283045ad.43.1754332170443;
        Mon, 04 Aug 2025 11:29:30 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaaf1bsm116664345ad.159.2025.08.04.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 11:29:30 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 23:59:21 +0530
Subject: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAD8kGgC/x3MQQqAIBBG4avErBNMSqKrRIjoX82mYgYiCO+et
 PwW772kEIbS1LwkuFn5PCq6tqG0x2OD4VxNzrrBjrY3mlMKkjYXdI+CHM5LDaKH8904rPBU00u
 w8vNv56WUD3ZyUNdmAAAA
X-Change-ID: 20250804-sdcc_rcg2_shared_ops-ea6e26185fe6
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=6890fc0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PH1V8s2_vfPofe0uiFIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qQ42ZhPLumN_VPBPB1JlFGC6Tu_eyWN3
X-Proofpoint-ORIG-GUID: qQ42ZhPLumN_VPBPB1JlFGC6Tu_eyWN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEwNiBTYWx0ZWRfXz0Oi8LL7G4RT
 3/sw7M3FypQPW1NQxwiInL11vZu4s1SRLd2ML/lR4De7ErcS1YhCEgga0mxD/AAUMtUkUAGpClc
 vJNfFWMaJ9knv376pulnJpsfEjSFzi199J7wUgMBP4xZ2ROVyA9+7uVA5PTkzTQAgDtu+ro1TOv
 Kr5Ko21dSzjBmoQ7OHdAzJyg0erlKBAmPNBdjrX91UuzMEQR9uSB9xDf2sxZC/M+6YJCQsCYnzD
 3RBZ3uqnYKC+FAxZg4PZNaXHYp7OS8rEhRZBCKfa58MMfWr/QP+OLpqvN+ehc9XQ8QxUDZQvo7q
 ulA5Ib/wuopkNw+1UubeWQuNJgjlfdpjoJK4W4tGV6xJMgtperi36Vh4UruR39rGY3SMZVvjUpH
 HJ0P+thcQFPkwY43lAB5ejgnn3LQoZdLPD5qKeKb/SrQA1sWm0iBoEhcLxOsL+mJvyEXD8O4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_08,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040106

gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
boot. This happens due to the floor_ops tries to update the rcg
configuration even if the clock is not enabled.
The shared_floor_ops ensures that the new parent configuration is
cached in the parked_cfg in the case where the clock is off.

Ensure to use the ops for the other SDCC clock instances as well.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 9695446bc2a3c81f63f6fc0c98d298270f3494cc..5b3b8dd4f114bdcb8911a9ce612c39a1c6e05b23 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -784,7 +784,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -806,7 +806,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -830,7 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

---
base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
change-id: 20250804-sdcc_rcg2_shared_ops-ea6e26185fe6

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

