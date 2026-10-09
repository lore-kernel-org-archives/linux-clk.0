Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267D19CCF5
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 04:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519390; cv=none; b=sIyKZ5n0qsfwYh++NlvyaIuyy+oyzyiWUw24hKt9ZJxzpxkPLLOoTLwxGK1TnpEpe8joyRs3cg09eupmGg4gNg/WrimF9XqqZB40ELPhU9Q2WLbLU3VW/80qLpNnW6QEa2b9CJeknn1rjNghPR1I6/nvOQrf+K+AHuJireskXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519390; c=relaxed/simple;
	bh=GQVlKxGxMPVwtr4Y0DevBtLScZlMT124U1PfUHtcSdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lOWy9EgYDlHtWMmBQE4Y4hM2z4o16v2TkgqxSII0bond9eFTVoYuIlejgpMKaA89Hm9f1SIdcdNJiWLlWo8dEnx3Wy50oa8SErXNWYJqklN06h8iU3Kd9E4yHezy06RKr3FLNW1mIm9q9V7bl0eB7H6RS6oYogMHCI0qPaAWEiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeMs0p/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lnx14Zz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeMs0p/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lnx14Zz4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HUDi1089606
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 04:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aIXAEh55bTztXEvBWB9p1a
	kMVE9s1YNf7x5A3tBH300=; b=IeMs0p/xsVin4lfc+1qzpAi4VGXk1HHHNB8e4w
	YC3M+MRg00gri4KE84NmPClIybW6w4rlvU+qCSRlvo+c1OWoFnwHJqXwDcdROC3u
	ksmPoEB7pyfx8AxjmGt6nSTRoGhE+qPoRcSF+QtrG4u/URS1IA2RIS897R61lCIe
	eIxssFggUSicALqYkWPMuFjCx8X5gQAWFgvkBsK9md5b6PI5SzzJ+0WclUZdfAqk
	8KkBkveYZZjpB9NOFTCG1CB8X5sERHO5chSoPseugd63DJXM1cpS87WOsZpsiSaV
	fzne7RosNnL7Vj7YNNPX79UpEvIYrObGL00EQPBU2LKbsQig==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekva55m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 04:16:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso6332764eec.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 21:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791519379; x=1792124179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aIXAEh55bTztXEvBWB9p1akMVE9s1YNf7x5A3tBH300=;
        b=Lnx14Zz4sz5Jn3tSw5zEASSDhZoPRrw9+EW7a6j1xUoHbNemuj48uiOEkbztd5jomf
         W5FMBuQqoZZ8KkYPYEJM/MAKSfCXTMBW2yDOS2fJfV1f0UAnwMUEgkP8BDbzpd/b1CpW
         zsEJNqPmetgbaF7Nb0zs2Yc/sdU1uB/i0KG7ECqL4DhZq/ILcuXMyEQppZ6oOGel84uB
         iNjKQ7AbzQMfOj+m/Ftg+wpKujIctHQ3lNzStbfPJsWP+S3swDjhb8kfGIxAoGI7alEe
         cb7QWpI+dkxAHKpXydTo5IwoZIIgFIcA/G4y7BwbaJ/YBVCgQWNwP7CCTACj/dE3eTZO
         neNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791519379; x=1792124179;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aIXAEh55bTztXEvBWB9p1akMVE9s1YNf7x5A3tBH300=;
        b=x+Cv3rJznJSmnG3S2QtUywKOJA5vpcrwXxVZt+qwP0igu07bU2Z+wGttyvX1PaiSil
         evoIBs0FH//zZkcWqDiNaw9C5OHJL+5plvOoERmkM+pg2v4zJAanqi+nxwOTCljHKVcS
         QPXwzjwuukCiGXuIQwAlnWz3J/y7By41Fn8nGyvCom8XwG9tym0/saUwbmXtg1jctR/g
         tx6LcD2FPOaCXEfM6f8Y+9SnuOD4NMjFeb0V9oU6XEZwS+1k/Gx3IecCQhgFYPwDDIT2
         YSOB3GxtJCqfgHwy9Ul84haK3LePY2EOmCfejJMZlTU6yeVVS+htWiO8ZFOp2n7YNN9N
         TBNw==
X-Forwarded-Encrypted: i=1; AKwUvBygocirsV5z5v9OtA+ivqSzu5ceDiZUhkPe+KSj2Gw0512YAB5n6lUSUjtoZnt5ix6ldKXIy+D/Phw=@vger.kernel.org
X-Gm-Message-State: AFuF++l4sRkMLZDYolTgbJHXlekywWzfnRPTbj2hlRevF+ZJleVTHu1X
	KTPGa/N3DeM9ghcwHVoM21h6eWyU1Bl3pyVZthNoILe+QxLX5D18wAJdN2Pb1HbBp+rHGrPorVZ
	jXjW7Uyqmi3UhOcKv7TTp65X3OvykC48MTJDd3O4mVq9LDXXtYOISkwcqkU1vgps=
X-Gm-Gg: AYBFou0wIoA3o+1H3E9EXmgR51VfjvgtQYHNrR5PVbcqAmCFnGy9mFMtBMsKIIQwzjV
	YBOO1J6p8nUgLYIR088P7apUpTxgn7mdvcUAz7N6l12mC1WdpR5zTZ1/jO3kQHaAzZKxsTpj/n7
	mQAtk6AeLoWcKs1aDeA6wG2y14O0YK+ToWSEGEC24btfO8Z2dXcmgeGIsJBzqBee35nA6n9s8S1
	tFPimUdJu+/x/YHdCEeNJ1Cp/iCD1/gznlWxFZl/VLAYOxTpM2XcpsmI1i+1k2apIQTtEgXEKNV
	DBNalYd4SWKkpLyXRwNMJOT6w8/vJ2u3iYk9EBRkHxo0IggPdstL384aNZoydR+sfM+jb43zPfQ
	P+lbCh9u5gSL47v+hid+ics2Ty2UD9/o=
X-Received: by 2002:a05:701b:424f:20b0:149:f2b3:efcb with SMTP id a92af1059eb24-16a12070956mr1211037c88.14.1791519378908;
        Thu, 08 Oct 2026 21:16:18 -0700 (PDT)
X-Received: by 2002:a05:701b:424f:20b0:149:f2b3:efcb with SMTP id a92af1059eb24-16a12070956mr1211007c88.14.1791519378352;
        Thu, 08 Oct 2026 21:16:18 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm2528238c88.4.2026.10.08.21.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:16:17 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 09:45:59 +0530
Subject: [PATCH] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH5qyGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNL3bz8ohTd4pTkZN3knGxdwyQj4zST1CQTQ3NzJaCegqLUtMwKsHn
 RsbW1AEmVdYhfAAAA
X-Change-ID: 20261009-nord-sdcc-clk-1b23f4eb4177
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: uXub9vYNbCCsgM1MFR_jIhFcwuPCK6q7
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac86a94 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=o3hcfxW_DcXKSnDgckwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX3lY5eid0Cgl/
 UCJSJprK2IZLlkUIQMAHxmtnNCubskLn+6R123YpW6gd/gBMTtDEXi41217D/Bpxo6VKQK68iv2
 LCmAxPF7SteWz0DppU9h7ZxiLVZd0kC7LdC+kop6UwPZBkXld5T7pmthliSu3N4nfUiRm68F7nt
 bi3PR+awM+MOdXRQBIjU9Jwt9lIEY3FDEz1P58KXexyNsU9bkXnymIzZn8INeNRJIxzCVaKpQCA
 1Xc3MgXPNCsZVvO2qnAO+WDKJ65JPunq4Jf55sWTDlVoK8AUhN5sYeh3sil1d3S9O8RDSQ0sXkp
 EklNXUCsaOz/JatCJ2TtZUBVkZQwut8VdUlWQoqjrJ/sq2hMFOSPl3W3DUmIbj3QrnrqIEBZPuo
 QVfax220Z8cLTZw0KwDJPeYttEeEw54Lkrjb7ULGuxN6SxBxUQVUDmzCb9sY00E5oVBZ5p/QbG1
 pzoe2TdQrMni1dkMyDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX7qFduoIPzjhO
 n85q4GzRV9SkyDUOqxnQ2IiOsWJSkcICu0mlcpUuviZsATcMaHvAAIHXj8eLiq8lJHyVaH8M4UQ
 h0OJ2ZxYrvKJWt2plyVihbgjJzhoMbM=
X-Proofpoint-GUID: uXub9vYNbCCsgM1MFR_jIhFcwuPCK6q7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090016

Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
the additional clock rates required on the Nord platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 68ce4d6278baa5888b277fb34a135d7e5beb789a..a72fce70de45ced4635e7091140e63b5148decfc 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
 };
 
 static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 30, 0, 0),
+	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 24, 0, 0),
 	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
 	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
 	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),

---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-nord-sdcc-clk-1b23f4eb4177

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

