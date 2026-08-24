Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153C03E5EF0
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554425; cv=none; b=F2K7mHVuWTTi+XoPtJK1Z5D7Zk4yS3HfrSsd0kOVt2K4kjWYJJ3ZgpTwga3ii8UMFfXYGdxNE0T4UgCvM2W5zWmckXV1L1vUKRwAp6B/ZH43CI+W8JHWeKRCG0/EWqUCq5eWtthBs5XkIVszE+g9nYIeMoaLkA3NpLRsk1a8vb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554425; c=relaxed/simple;
	bh=yPqxZEN17TSsE8y7K+fPGHdga83+K6GnBWtDAPOSCk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1L5DILJGedqPlZOj10mQDEQIjGMkxdztJq/GJ88SUsjgEYMp2AILVzdsNE8CPnRKrSYDVWk3G6+6NdeU0gl1r56BxLeON4xH0Ptj2QXR/FPDF3x/pZzdCcLYPX180dOV5i9YC+/lCY6+YKWr7lBEE5v9mwVv9oARjBCHh45uEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hy4A2c3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtSMCa91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hy4A2c3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtSMCa91"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RPr9866958
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DkIxjYN30xA97QN4X9jUUUIIBPxDeXPrblaonVHpOY=; b=hy4A2c3crGOGvlxi
	IQAGK9dJN22WT69YcQl1bb9zuCqunIfdTs1AEuTwDdSDOFv+RwRLKiUE/g8qrMcF
	mJEm1tN22UvsiloRljjYYgZMD8ozB7Be2/oSUWx+KXZBwf8JBQEYkuGnGiETHXuT
	VF+vyBIu40+ka64TtjNHVpTo6eyt3M/GBNJdQKgCVLoYZEb/YP487FxVoRtyb1T5
	tnXbkmORahw95/bBM7Fu5mK/XcK52mI6h4FQg16p6fTPrCo8Elwmr/rydtYwkLiQ
	xhvbiI9muKjUeIv8knkoFPbUD7+aEwW+KXf++C6S4UpBsE8WJmIicFoQtr+v+yXl
	NAhA4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwq73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:53:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so3377831a91.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787554422; x=1788159222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DkIxjYN30xA97QN4X9jUUUIIBPxDeXPrblaonVHpOY=;
        b=HtSMCa91OFBcOdl99vSU5VjZjugCDW8BKlm31t2lzWUTlD4x7foz9bFtvaixIRvOJV
         58ZAbwk1eRMRg7+yc9JZneu4kbc45yQRr0tWQm2ULiWV5E6KM0zRuGPyPJbGfSsl6oez
         2zoTGwZpgoFb/aArYYIsYH3syDFgGyUuHW5Y4UphmqcVjqRsE7K+HDiW2Yk/p5MPQi/z
         R8QY4bMnrBoUgz5dpHdZT6q6+eg55eWUCnAEl87CEBLHh+vwvvjHoiWuJ65jXQexLRT1
         csWbP4kM6bEyVl03Sj7ztuq2HYhLTQUTGkfr6ZDYJ+GLoNBLYQdIT9Vkfc9tpxvYDkG3
         kB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554422; x=1788159222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DkIxjYN30xA97QN4X9jUUUIIBPxDeXPrblaonVHpOY=;
        b=gn+v87ejbl/0MnqDfzrgZZL+HUioVFOmePs/3TZf4gOUgWagXpqjcf56LkyYGg5aWc
         huwTV/CaZ+43yg2c0WAVRl2piFJs2TGnlveamjZtcOJrqmWVccmtc4byViE4ZSBSZ0We
         ysx4NBuUbV+rjOj4+Gr+tbUGzrxZyUr9l4cIROssXSHzfKjfRJNMiJ091dBkSnJGjOe5
         B0TGGBG4Ba29rsrG598v4AY4t2dv+RxlmIYhAxKc+q/cFrU0hPBiCo3IzISmhVVP0Fes
         SdiHlIrHgXw5fuyKVdslQ84P1ZTeKtE1bMDU+rCVALs8/j9SEgY1B8rVxUB5EjI7Es46
         cdNw==
X-Forwarded-Encrypted: i=1; AHgh+RqUr9P4TFXeolCgPXLRC4U0nSc+PH2ttKhYFw3H/TUeQCDVQmTIpm6S2OzdKc2bQlQNCC2HkLf3o5I=@vger.kernel.org
X-Gm-Message-State: AFuF++kjuIbBZYlZWFPjIzaIGSu6uEhZCOoq0mgRaMBP1Ao404bxVr7m
	cl/3lA3kfdHkF0MB9mVw/vfOVJSbbuAEEXawGoMNX5/QH1B+8GxepzAZtKg9TprXlI4ngoGLWSr
	9mJrTRcJ8K6xaXzLTtsnK0icu9y8NqDUxO1OBU8TD8ZdIyPaL2z3JFEZbn9rUTxA=
X-Gm-Gg: AR+sD12/d3KuQgbymDAi6mlpEgsNQELTCqXcEjtBHNAESznQePIXnOXVKvrxwYfJX2H
	4DhhEDyP28h3kZzTDYHge4VPqnP9hPVigQEwHr4tQaX2BV22kBMhSLDLHKBZ0APFhPrie4Ld3In
	p+rcFcblogxClatbIDls1dP5GXXDuzTIVUdZVOQRplMue0c+aJLVZW/GVLG4nvDhaurx99gSfvD
	DNXdTt2V1+POX/Hls+hqXx/hrZ1ykG8OmW6U1letF93c8Q4ch5pfcKuDZi+awfPPUjUzpQ6KK+N
	cSKXDPM36pyZ5kQ5mtQYnHwh0IHp5ewNYk7scylNtOdmDX0XdYB6K8AojSbWyaxZUJcudlp/Vjp
	icwFkz09GZDj9+B7uvPvxkMWQ
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-395c4528324mr22880238a91.0.1787554421903;
        Sun, 23 Aug 2026 23:53:41 -0700 (PDT)
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-395c4528324mr22880215a91.0.1787554421506;
        Sun, 23 Aug 2026 23:53:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b240e7sm8768031a91.13.2026.08.23.23.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:53:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:23:29 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for
 Nord
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-nords_emac_apb_clk-v1-1-290767386bf5@oss.qualcomm.com>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
In-Reply-To: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: lU_NH9W0htBZFEbNTt01L1bC_gUHQiWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX07eJXZaAjQtJ
 T462UEm8RTeQt5M6BEsWPhcoIwp3WLRi16n5rIaZ4q400OXlvWt3/zpIo96MJhlDZqF4zvIhdmI
 tXX7I9+cS0YO4k0wHuilsyUCGYR8OstLlg9JEpzVrla787FzZSz+oI3rlaYhag6jabAjxEajvSo
 v/pgiksHvbIKm5sp+5n5ZzKZI3Mzxl/RsKPhmTO2Nv4lB1pduefxNwRgiDZPzLBXMp7WlF7VpJ+
 NfZ36do77356W7WeJ3S6HjifBeDkdNbfclr2/xw2zlT+P3Ol7SywO6FRlWM4Hjn4HSDswJEvaEZ
 b7vBSyEspd/K9ioKWxtkJg5hd5piWEJr+29pANPmywKVC1eeh3MdNFJUqK6qcU1xY0agS/ixMNI
 i5DKTbK3lW93hTigkOSzpfHr2EuJLyBWlWQHgEk8vBVlqfFNe8PSm//xfkz5vxQLKLYFN5tcy4j
 ordLz9kDi37ieHD82pw==
X-Proofpoint-GUID: lU_NH9W0htBZFEbNTt01L1bC_gUHQiWF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX7qHYqh9tPH4e
 jK1OE6RynYkLAfFoHUUpQCB09P0wMtKuoYO5JDj/cAznIMAgdHw/lS2osfDtfLWSZzzP3F8o9OX
 Ym8rhWCfUyWMa0bub/PrIT9LZ9MAAtA=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8bea76 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0SKnWDcDATWbK4hpfooA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240059

Add the EMAC0 and EMAC1 CNOC APB clock IDs to the SE_GCC clock
controller bindings for the Qualcomm Nord SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index f0f7422af692d05417d126c1011a22faf3bdc611..de4539b999850294926854a45db2997043c74f2c 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -84,6 +84,8 @@
 #define SE_GCC_QUPV3_WRAP1_S6_CLK				74
 #define SE_GCC_QUPV3_WRAP1_S6_CLK_SRC				75
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
+#define SE_GCC_EMAC0_CNOC_APB_CLK				77
+#define SE_GCC_EMAC1_CNOC_APB_CLK				78
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0

-- 
2.34.1

