Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974F3374E4E
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271971; cv=none; b=cFT205VTsgYMY34AHsY84D9FJXTmPPKZsrxL/dswhuz8CEC3L50nzll8pHeyXkI7NEljpOJDecxGRPInS1ALgd1Uo6bIa0ho6310G36hdvKBE69Px+C91vk/auiWWjYFTQ9eZXpmOaShsYpWD3jsnoue5Y2lIoaekfKdnSUaoVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271971; c=relaxed/simple;
	bh=hwRRAH8UAYgLO3zo/Wqo17qjWrWog7hnbtAUy+Wu+u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyY1N07omoYPV0YqVQcDY0wgZYw6Twe71My1Nmc977kBF1Xbnn3woeMl+jlg1LwmKrdKL8RDOYT90gTvku6caWwuKsFWY9/C4uwEpSfCAxQ0WV9o/7vmfJ63ZnY8ffrcC0zYidaFDaY9PDB0nhSb0GZ6voXEz3Fs5+LIx2ml1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C32//Zer; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjeDkX58; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C32//Zer";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjeDkX58"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QK1GCT1202941
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Hc0hzYvnf7Enn+b3y97rEFqe8dZnu/3813t2l1Q7ag=; b=C32//Zermcpsa+jx
	GsUJtf59SDcBxsoUyyTcCKLD79nVwErA3LUsUuqaYb+6zmF2amaSZdba5EtMxMZf
	n6YTA4t3ZP8nazR0BfpuOVoeFo57agowX+gosTdfJxyxfSj4w8jEtUbuBK8dzung
	lf2QsRpVhSxK08dbaSuzo4VIGjgWKJMKQ2lG4ujNmlVUPUlEFoLytIZPrWHGZOR7
	Mei/cvTwNJKzXS8BYGOSl3HHKQMuLYiUVkv/Uu2heDI1PSS/keS1NhShVHN3t6/b
	6RTLHYbIDt1Co63t+nckKycSNSJXVals1qajElQPsjxNaVuTBxovk4pRKAlMCG7u
	bBG3FA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4utq3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fb6cd0879so9075467a91.2
        for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 23:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271969; x=1777876769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Hc0hzYvnf7Enn+b3y97rEFqe8dZnu/3813t2l1Q7ag=;
        b=OjeDkX585M+rwXdZ4w44WNKgatEJD66weXMX+/UXjGr7bdBRj1eKMPVuMHEwUUpAca
         wHMHO5UYBXMuq88/maSHKmyRE/7nkp1V6LKh+JlbOsgHEUA8vCYcC6pP76savw7vsYLx
         2jGwPQonEIN5MmNybaTjkZLUwQGlIbLf2vlliuHZOy5M5Sl+Gwlr9L+8izSOW0mGnE4K
         ic1ZkDpT7JSnYRgKOYfZyf9m0CNy6l9uNmfJekvsqA/yFpAqPBtCFyiLE+YXZ816bp51
         QyyBbHOWGFf2MkRdluBoVqceq3anisa5feH4JzXFCR6wGpbFYlM8YPIksV+67t6UK7Xh
         Gz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271969; x=1777876769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Hc0hzYvnf7Enn+b3y97rEFqe8dZnu/3813t2l1Q7ag=;
        b=EmSd95FzPkj3pRhwsTECAnG1ufG0VuMOVRwH3bd0f5lUAn4b5tfgJmXvmWBCJIQUaO
         NDwUylWPnSsoWY9n32HBdotkOxDKuZdWpkkwq0J+Nb/LJ7Q163fPqAdq6pR3h1dZQPYH
         fhPqjkydRNURbz45x9ZWUb9oRGArAbaQ6kptQvvKBdwe582/rdp3lkfpUEs07TZDb7D8
         Amt0MH5fauE+uaFweWPVav3iW3n7HWSpX5QX1WPKzefF0XqWt5D6qxOwnQPJS/PrmrT3
         F2J+gPyx50CLkIlOJxjHRUkI4BoU5+3d/QopOzrwtuugz/nHZ7CSMTY2dmAX9HbAeAYV
         SJ+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+lO6HlVkRoOVPlnZRk0R29M2r+XQy9cz6gIDMmNnFSG0DNpjHr7XwWTMpYdxunMLsvoirHe4gwwxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFETAky8JHoXI9/q+uHJsNiKWy+AD6EoM9orDe1JFlCt/5JnNf
	p5PuzL2QpQKZ3FoaqYXLJXf3Y3EQyUMsH5YXzyLHTahb7QEWJePeG2HkevZOwaeIBewv06F1EGb
	PiHAANHhEHHxKrGg1ZuOE0pQr5cWSiFYDc1as8bvzjim6OvDWP2rqnpUjPGPVqYo=
X-Gm-Gg: AeBDievYDpFkxj5D0NzE1S8kl3tC/MEkkcDWDG21kONW2npJGFuB16eUBOisEVC8frH
	eagV4uSLLcaie6JhbmJlNGqal5q3w3mD8T+hEnF1Q8w88lxycDLErFnRAmUs/zqeKmXPAzXQY6t
	oYopBZa4xVSD0qTEVYvyNgKyWk2IkByuko8ltvlHvO0EZNjwXxRt1i6lV2lgrQbqqK8IwWUGwki
	SZ+DdByJYToYcyfz5kvUFs0zrnFP1/eqiObncN1tuvLqqcM5THKNkhaZg57UIai6rzDjZEXTvvx
	RVICzX6airUKyWHHJoFVNDPLeDISAFAcsaREd2AfB6hlv92rX0iCVWhJJq94y+pi7MsIq66Ak6C
	bmBXn9dQHM7XfXjhHqHfqs3xDuw491Ffbw1968jhpfonsJZl0niyJxvPs
X-Received: by 2002:a17:90a:dfd0:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36140402361mr42035909a91.10.1777271968395;
        Sun, 26 Apr 2026 23:39:28 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36140402361mr42035867a91.10.1777271967886;
        Sun, 26 Apr 2026 23:39:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:57 +0530
Subject: [PATCH v2 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-gfx-clk-fixes-v2-3-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7IcXtMN99uTap69Y_2O3dPxL2mNpyKv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX5xfsIFvUqako
 cmulIMunBZxeGuOMMEE5mlGj+tH+rvJalkDPWMqUpRRA7jZF9TXsguzCZ9zH+VKxJsV+JCUCHaA
 eGjADuSmpZwbi/9USJmgp+dTyrIGZCt//G2c5fk9E+Bo4T9t8oh12uaQ+jP5Jp311vNo5fVfajW
 SWjbnORzkAi1gkgXIsT+4jmYAnSc/GOkS7+CMzEa8A3O6JTMtDPoSlYaNYi9vBlnzlx0+Ujnap8
 nmd97wXmnd3mzflk+m8M0g91/y1ixLctOzEedWpYL4T6ywfqBNfB81ZXqJ7oagfqI5w+PxMQYEU
 p9QGud0CoiWcF6aTJ+MpY9VqAL7Z0BdCzR/IFHo72VyAdxH1HypVwi8ehIJeq3bHMIoUZ234Kc4
 U3sLQEYoNm9BQ5vT5Ha/vRaLEhb9ZAOfZnbcJRBvPA8z3cwePPdDBW1XWgCOnJ5wPgSfgIaQYEX
 5icxXIoNCdzUok9uCnw==
X-Proofpoint-ORIG-GUID: 7IcXtMN99uTap69Y_2O3dPxL2mNpyKv5
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef04a1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=b5psBqh-k-Y8K5vD8YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068

When the clock controller is probed with 'use_rpm' enabled, the
runtime PM reference is currently released using pm_runtime_put(),
which may return before the runtime suspend has completed. When the
clock controller device is registered through this function, calling
pm_runtime_disable() immediately after pm_runtime_put() prevents
the runtime suspend from completing, leaving the clock controller
active and the HW rails in the ON state.

Use pm_runtime_put_sync() instead to ensure the runtime PM “putV
completes synchronously during probe. This does not have any functional
impact, but it guarantees that the device is fully runtime-suspended
before returning.

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

