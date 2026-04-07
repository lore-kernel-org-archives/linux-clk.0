Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC038C2D1
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554306; cv=none; b=fmBeVN/Q/oTeOyObqoucDZF4V/YqzWewT/zmUQfbp49J2cM55AhYxzbkI8cqg18fbs+5HVXdz1J+pDdUMOPhTi7G0KukN/1ROmeBW9Lxo7TfrnAcYPVEpm/WmXy39D/XfV8UEs8qW3w/LeO+NzMmxfbN75aT0F8Ek9nEyDXEbMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554306; c=relaxed/simple;
	bh=rSdTxndfhA3XLQEODC8o412hrkb7dG2LN5ijuH1gUGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2LantC0yGbQvR35sXiDCYq9iXkETHHekvyvtAqNaecCA7MhsrX+9fQIlu8cOOg+XrQdpOIOlE63DfGevAG7zLkMqFPV8z8rG+ZCA4rl0S3+XXhYK1C8y+y+5eRMvVRKJkYitQF9iXTTGVnhaGhC4N3DzzGHr9SRL1ZOzyDpMoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFmStf6X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeCJqYn6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFmStf6X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeCJqYn6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376YmYr494121
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 09:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHzEQ6XM/z3+Muw5eGpH96zPSOY5H6p0mASC+IuWNqw=; b=LFmStf6Xj/w6kh5a
	sT5wy7fhiCd15n1fgtreWReNFUSvJAybcIKoPAgjYEXOtWhrwouAt34lOkhsP0Yl
	d0eqmBqkqMBj6mWEEcim3KdtdW0+olwsuD32t2StYYFxlua3wGMTYUle5D0OmYUQ
	40r2kMSO38eOHFsFAgbUvqox2khUuoqcJRRhYk5TIeX+wmVuIk0ExiP/usmXXF13
	v1TCVBbU1dLzsj9TtbYEV7P3vi7LLkFYE55yfhgvM53gNGDK6o6MshERILbi0Vtc
	lBJt/gSi4wWS/pUMCsTLMC3/FzHOx4X/Y3Ca5kg5CyYUHgelGF8Zbzxb73GPWStj
	vokGuQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t1hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 09:31:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0cf396c45so55781615ad.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554303; x=1776159103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHzEQ6XM/z3+Muw5eGpH96zPSOY5H6p0mASC+IuWNqw=;
        b=HeCJqYn6B2T+F3yPmA3fWon0qqkt3hdvBCdGt4ElXKDnzJIUX9r7IjrMe3INhHug5g
         X8KJLjbev3k2g1zZB/QCmUI+MWfoLP3Knvzg/eAgAIcf4ka78Xcs9pAXoIt0TdrzQbJB
         aXHbq4TSopc+DjKtzD1o7RO+rKVUGJb1etwR8JFza/xfLeFllO1jJGz7uGHieXyKpUf+
         rav1oubiD3RjkcCvrTo9gqIIXqy7TYhfN2X63vosgLZOsbHS7IKzNeRBbRg4HemcaJSd
         qkDJgfZ6Nj+Kx66O7PkYj33kbHXy/7kLXB9XEa/oncBKc8gBJ6wZYkHnlxzErJRtTjie
         LapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554303; x=1776159103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHzEQ6XM/z3+Muw5eGpH96zPSOY5H6p0mASC+IuWNqw=;
        b=dk/McByrlNWn3LIlqEf6EuorfEJjZLRE+YEV4EmLHURmNGDhRB643AHHe8Ez6lYv/v
         RHso0Dq0PyWMoJZtfYHNuhZEpgvyexZD2th0/9JPtU36qoQ+Cmax/isorFAedZ/R9uaW
         11al8nxCbkuwtX8p/HKtWl5f3WvVxx12RAw+9BZVdPxltsLCSm0SmuFyH8OOqPqBkCFi
         suCqeCbSm1r8AZ9nJU/OeWnzfOhfJWUoaG3H//MmcWOV9tPjGrfm6pNXkq8tY94pEsXu
         uczbrmTApwq/nWWcfXrMWWJ3Ih2kzelBZ/1ZC3ZHOdBFeo6OE/3X5r1GoOrHcdJhOjir
         3aRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdtAK6QLV1LC9mCszBdBEwMQpi1Kc+wHuDe459YaQTjKfhJWOKs10/JgMSuf6Ztakp+lBracxJXG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwALP/YhkWV7BaUzsXJFEUMyioqXLzrj21iUtYt3JrIOPQFL+t4
	IScLlBSvet4Xt6lJnnGABEsI17/PJ2eTxcYE4VLI0DWuW8o36eSr9Xqy7xg07xyonLtpwIqnmBp
	HvWFdE7HolHPOmJzb+y6AX25aKOTzsbf5vwHujQGMRKvHLr5EQw9xhaDPgn42C6A=
X-Gm-Gg: AeBDievYfK4lBuKyu4QjDpqA+EoKxx9X7svPoL+3/DIA60ITepDZEg+mgJnZqiSqr+S
	UGR605iiW2NMZaMRTujzlCdQM/JDpFcP3J7Cz9kCFyoQwiKThOiSvzCmzK+OowZneQq2sLsQYX/
	JG78V1vCcUpGQeBFZQYCbtK9YAAlIWlAsAKt2Nz3yULLiSaK0WoWXuG29TAfVCtFMY8J4qJRNZ6
	HBZCJy9SzU7VgpLvgsqwuEnWbjwGTkphMWpg8M+Nf2PjWwAARPpLuEcss0hsSuY/vq5PKaPGwQM
	LkQxN9e6zqg+XKegSzulWiRHFigku8zMNkmunv0cdnMv0/k7gJmXJEaXRCm4KDo9H1S3OngOycm
	QXKbfRHKJU0Q26TDJU3Gw1feko7tISaynLD+BWQbOw/rSng==
X-Received: by 2002:a17:902:f78f:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2b281821ca2mr174235295ad.18.1775554303479;
        Tue, 07 Apr 2026 02:31:43 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2b281821ca2mr174234775ad.18.1775554303001;
        Tue, 07 Apr 2026 02:31:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:53 +0530
Subject: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend completes
 on probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: K0tRn-2Yf5qyBIRr3EOLuSJY4Lcq173h
X-Proofpoint-ORIG-GUID: K0tRn-2Yf5qyBIRr3EOLuSJY4Lcq173h
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4cf00 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=b5psBqh-k-Y8K5vD8YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX3QVFK/2afoPR
 oez4g8T79141CR+IujKZmCHjZzzG2opx7Hrh5zpvwBlYJesWy51wz0jRLqi7p/UanVzs7Mmfs8J
 zJrOspRTya9sXeQ4BqFL7lDuT1QSX0f52CyPA3GyjXajNGHmq7qTr/nH2EimTzfdismbaF/GB73
 8k7cjXCQd6ylj69Gl5QwNcyn5jBlaOPEKDqnzblgV52wy8api+wlIeOmhtZtLhuPyWg92pB3t2C
 ygpx+tzMDUadFvkQTVJWdpM4qaTCgkMg+7mLK67JUocywdYpoXNUXgIq2W7XXk+y7gB+DTDVqGb
 PucsAAm9QfY4QDq3oBobMPj3cmwk9qAxKhS0vM6hyBxMwuPD5aOmoPLZO/rneYYa/DaV1Qh4q/1
 eS7rI4kMksz9/xNYIsGhfjbEzfQoM9+gQBI8kJxtDFZZsVzxOX456davARJlzWE2oM1darJdbHQ
 k/wNCwiM00aO5gT5X/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087

When the clock controller is probed with 'use_rpm' enabled, the
runtime PM reference is currently released using pm_runtime_put(),
which may return before the runtime suspend has completed. This
can leave the power domain transition in progress while the probe
path continues or returns.

Use pm_runtime_put_sync() instead to ensure the runtime PM “put”
completes synchronously during probe, guaranteeing the device is
fully runtime‑suspended before returning.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..2c09abaf1d2a15b7fbbbfeb67c03075381185a00 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -428,7 +428,7 @@ int qcom_cc_really_probe(struct device *dev,
 
 put_rpm:
 	if (desc->use_rpm)
-		pm_runtime_put(dev);
+		pm_runtime_put_sync(dev);
 
 	return ret;
 }

-- 
2.34.1

