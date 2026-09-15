Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F053B995E
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474088; cv=none; b=XguAgHJ2Dtrje6XilIYA1kdy+vEFxHNSU7P2PTKDaB8gIts/sIMBsMxHZLdhWrd2j6HPAwezZNcVdpKoU8bcLFgtURA/JgWFcSqAv3sUrRE1znVqhcTGQ0Y8sGPrCbGftPuVXhVI50axDjdzUL1gXDiL8Wt+BCngazSLyna3fcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474088; c=relaxed/simple;
	bh=q41Fzq4Slq5rEpTdIlv6qzewx5wVm5FY7Q13iS5rtK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSv0hWSDDKaBuOBWcDu9pUYrjhutBds7ck0O2b3kLSJ3vvOjJwqHd4fdT8dbw4cKF7qeMuwQyS667A/LBwO/B49ilzHetuR/nLvkTPh8evyLEGqxgxrTGKSho2/YWUFr543/ozUrxnZdx2yzI5losV7YyGjuGbEfnsRsajcmwlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRj5/8Ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjEUzILJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRj5/8Ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjEUzILJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCiv064544
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=; b=YRj5/8Ej6fnslHtl
	S3QC9mBvfF6cjZMIpu3XSaG5URUR+SNXNoNh5pfivx2IX7h1Pwnt2pt6lPEzIJmC
	BbRf4azVLQW7p44W6UI3RP+ltXkd/9jjpt29xv3P4AwrYkQS6vP9BzWPABHlAWH9
	ApIoFaDzsE9qlVbXtH4WLeLclAXzRN4XY6IOZcvpA2AkQ0bduRH0tO6cBn11jdxw
	kzFdgxNQt+dx/2Nh/2OKh5GUQpFE1tg6b97+NhmA6BQnykHx/oKKYoC9aVp1Ucbq
	FWoBbrQea2dbOPM8ydwakvGRi4m3nYV5Ev661xmoxVH5f5Ayq+6WqtiFXIJ3H6yo
	HKW44A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41veyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:08:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso60300125ad.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789474080; x=1790078880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=;
        b=RjEUzILJcuOeLFiJ4ULacZW/87iBg9dmsydDSbU31IECkHD2m3HvbMJVWl+VZ8eANJ
         pZ+xNPXxnuj5aChAu0jFtBKKsA+jAcmZxcfiohKmiIBTR9/DDTYhOXkUCW9eEWIl5JaP
         GHjExmHxAdnXGYK/YA7T8nFBPY7l6tyguGhpdKaMm/QMrCuJTHASdMXVOBwOdcu6rNgd
         Z2FggXUHVTwElqq7x8rRW0gB9deejHtQAY1bHTsjd0MzmK0+VvHFxTtbjDqxaNQy6Fg2
         P4nLEbMuLe4E7nz4NTScRVh2XdgKJugqgb3TA+gqRVa9R52ApQxptp0zN1p3GzLui0/p
         tc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474080; x=1790078880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=;
        b=MahFitfn6CYaPNnDSK3SsZXhhX9Sf17SdwnmoleQUCuvk+SbTGfebuPX1tvhXiQs4t
         TVT0oK10bxbsaFus0kA0M4tMIN7zsIJEIzCDLiuP7dUJsCiH+o6M7sBFbeADvBBtgY6e
         VLm0Jt0cQMOifcsupFZlRkR9nA8iSt8F7Xav2/eAmrydQsgEwabk1Ygxvsitq5sZ6Ito
         fy+dH8Jt6CUd2IaMKmGqGZNXb14cZK5q8K5N6+8HRBATOOhvadTnq5XbyJJfRgOWP3Ln
         w+LAkQLvU4sj4h8h5EiWS7s1elBtx5yOJbPDasmtjcIxv8ALc+mG/L5VaH3/2llJCwWR
         aMbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ3D459Qykq4MT5FNPCzq6HRgEKlS6oobqNY9qgi14pT94/6swOfCtiuY8qapBvZg0YrSicd+CEKA=@vger.kernel.org
X-Gm-Message-State: AFuF++nObq3+Fa6saWI4yM4THxKkdfRNb2rC+0Py2tA75xv9Ah09s7BI
	W9mZmYp96A7Mmnnz8LcYWWkRQ4MuoFB0IGZpBwQ1whgrR8Dyi+OeuaeVkpCp9EEeylOipznlpyf
	4Y2zs5O8OFb1YHYjYKDkuP9VAkbjE0hFUCStW51Z20NK6z/LpwPEcpq5jcQdPZtg=
X-Gm-Gg: AYBFou3EIFtt2l20iTkOxdl0OESBNKbZCSm4eudze9lDLwnpfG6EQTMTcjfnfeYkn6p
	MS/p1DCew0nEbpJj+JNHj1hnzgaQLN1HxJzm6lUvrUem9mBqfQhLr90JOEhfp4kqHKmm9KCKO1F
	Sv+m7L0luxqXu30A2p1e0Dp/iNAbsAWC7LtE320DnYgziPIUS6p/Dzf66N+8Rual5csGSRcuj1Z
	ryDIm7sCO70PZCMC1ehq66VgXO48YSyROwpqzMWVFoNvSfgFmCn25xkVkRNvIh+q6jUnqNX8zzW
	W1BQzVcv9gxFuW5HlYILdOC0zMCbRzZtZL1qPiEL98uAfXx9M5ppLyVQpzzX1iwNRdJ0XTJcVBs
	cluzLh5khMU2sXXdYtsFQNCtgZjMkqAM=
X-Received: by 2002:a17:90b:2803:b0:39d:f253:5fc4 with SMTP id 98e67ed59e1d1-39df253b354mr12198292a91.17.1789474080437;
        Tue, 15 Sep 2026 05:08:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:f253:5fc4 with SMTP id 98e67ed59e1d1-39df253b354mr12198210a91.17.1789474079962;
        Tue, 15 Sep 2026 05:07:59 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdcb618bsm4905004a91.5.2026.09.15.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:07:59 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:37:31 +0530
Subject: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX3zDiv70R4iGU
 OhmyFQ63xLaNXKyb7VK9XDsK4VwZzNvgzXjswDcsXJepaD3DC/A3nF8eDqDcbGotySk/NtwbDs7
 CjWUz2ixSO4MiOW7+56r7r+dIPI1JAFVN0FQZpizZuLDRi6fsIGtmXs/6QOwHytQbeYPxY9B5FI
 LOR8RhC2XU6zMbS+qY7rVmMPMtwSWW6YRy1g6nH5WrtV4485MV+mvxtkx2yHIUOef+V5mpKMpOM
 Ae36XfrbLa49YqObpRoFFOebYCUd8D8HYxRFdGiqL0D97raf3C2CVWrMzfdhppqIMSV4Lf6G5ys
 lisi9wx/6dGKJ9Hz8JaVBrKl8C+1fB9wKrTkkcnRQPHTcd3Io1LAw6aXNenCuKCgbFmQ4226qmN
 f6Fw94H75XCJRofi/hvZ3QxXNNlSi+aiBg1VUqOVqzYzkc0oGJ89BX8H14YSWKu0Ej0pg7/TZ1w
 RD6QAbw0CBt1GpftbQw==
X-Proofpoint-GUID: 5XH8S_gsLZnwxCvtULQvmzdJrtx8hMpd
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa93526 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XYjrdpVuIsIQvarJBHYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 5XH8S_gsLZnwxCvtULQvmzdJrtx8hMpd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX63PxvTqtPXc5
 hMZA+X6q2t4EKiclTACMQ2aVbWjNxjr5m/Fg4+Xc3eAgpQ07glMG761xgoOIhDcVstrzGlF9FqQ
 rUDZCH92AOzZCh0LE9YAChvJkVAV+lg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150175

Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
platform.

Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index ec8700b6186d8d6dd1911b7a33f086805770284a..3db81c709729b547f288eb10d4aa5dcf63d9e951 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -393,6 +393,7 @@ DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk7, _a1_e0, "C7A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
@@ -902,6 +903,10 @@ static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
 	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a1_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1

