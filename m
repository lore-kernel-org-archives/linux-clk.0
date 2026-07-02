Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E881736B067
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017222; cv=none; b=r3OdePSFe5DHrT+LwFEN41IrC0x5x0WLgIffOx8ZVoej0v1YCtQIAE97v2i8s0fINha1BoxBtCCLImRotgyeRBAxkFeUJceFUT+6UXnEVKPo8V2p53ryeS9/Ds68gfaahJWFcecgDrq18eJ02WwOghAww6VghIu27h/S+zg9PSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017222; c=relaxed/simple;
	bh=ySRNjk3Foozy/aJPnV0U6MukIvIZ0rUzBopoQk4qeXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Da8qDOinneApvW3cSDatQUHFi9WyKsjc7Yw7GzPhwLHgpPZQQyP+i/NgHehj9tq+ZvnKudcXkTvMOD2k3O6uUEbCD8OMBuqcSZ9O4cW7Y7mG2ldChXc4CtEWX39oehf6A2vVy/kQhMlzQGKGem90yqiXKfvDy4kk6AjPt4JUdgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgwl1E4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2se9b7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgwl1E4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2se9b7q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3c6D560324
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=; b=dgwl1E4zFmxazu45
	vBFbdKDAr8XzsIEMgkTnuxS/woksgDm3h9hTQ+o86fDTaCrMUl2Ev68Tf241Ze0c
	Ll3s9Ugif/oRFSqnrl4IVurh9Xeh7N7SS9BezzSZsymuBslBF32Nt3LKqQJ5Kkt1
	yuU7u2UZSWnIW8VVgN0H/qjTfJ1Wr4GmDOA6urSzer+njm0BPXB1i1z9ye6lQ+Ka
	cSQfu8ELibDkFsVAKcFfABPm7qijt/sL3JbvPeTkULCRQs1VZi+VdgxbaQdVvz0P
	mfFfIf+papYyYdEvRJfCazgl/o1zS8vnHQV8YWZxD7GadiM5hzdwayWSaJNT7cLi
	Wd7pjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bjbk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:33:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacf17c7e0so1334565ad.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017219; x=1783622019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=;
        b=e2se9b7qkAISe4u+VGlbhJetLbzgbc1cNsXWSJnO71FXNYiNhqQqvP4VAWbN+O5zzR
         9EtL7S+xYoN5iTvvqNNlnnNWcNdyMA2zkR6fB2/sBwTMj9XPeD8bsaLDdp0dNI6M+VRE
         cJtgIXVPqVWGBS5LAPVFqa0o61r/2JGu0NMWec0ghGe/bynExGz8DNe4VUFE1URxqJiQ
         f6ZsNjOzMziGsLqtAPiVl4ET9+3GcHze0R7KTLINEXMberl+Icb6IXE3Z4wJpNrv0a4U
         QfUC+S2SUF3MgumoSS16R50UTZV5Ix/o/DR/kMbI6YX2v9HD1koDs4xM96tBMgXkPt/Y
         /lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017219; x=1783622019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=;
        b=Tx3mEbVZAn8dIk3vX+4obGAt5KO/6ND93wUI3GOC/fHYKEkVdKkBMWFv8fBdUQ/71H
         p1DjgrK9XiNPzQMlnI17ExfXL61olA4EdaZO3TpAm65B4aI1YLzRkMPXhaT3juoviUFn
         RzAnwfZuUFg1NkG4aw7xDzm4TNn5Dc0U/ymCVpg88XP5g7l/MoYv2Q/dan5bcvphwCiB
         6lc1kE7Z40xfndbufsvcPAQPqNc4nj5vazsyriwfutPVKRt/DYa0nFO07/3HoKktoKxU
         75N3wQOnF7rKR0Y9qnztaVfzDKlQUaEgR+rf4m0+0Xd2/GP+Geq4X4fauNQ6jrLqKhll
         htfw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/i7ek4bgwjqBFt0/LNn7STsv2HTQ9dAJi0oha1QvxkVgf2N4Z4g/sBlEmsDJ0TzPoB+YqEFm6f+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQyPiCEn4+0LMUXwQlyu3qDB9yeI3f+Rl/COmtiVYr9pEyOX4
	u69fT+JnBI++moCyco43jVwG6J91mrcmVSiZBiq/GftoOPfTKLxsXfqSUoxBgRZbxYxjPaMgIz6
	vsXHQRRFlM+Y6a4mPU0Wja+zhX4AYU4N5+Dj+rWzwx8x64HxNoR0P6DBvKbHTHk0=
X-Gm-Gg: AfdE7cm1HkNv18nFanT9ZaRbbU6xUhiPfXZ7oS6c01RHnGc5XTYFbPfVmGFUwJ3nAWi
	Mx1mCyrau6/GbwSW/zTRbv/8T8J48Fna5hURbxwgQ4OCCrfvmjC+vf9C7NTL+eVBCLi7GR5EFVo
	a9ZT9D2lGbAe8zWX0DzBsSPQu7xwMt7vk/dOSQ9hzwwlhpO3d9y4aC4VrBSqv4k4SVAOC9COmNw
	azKkG/Mzk2kcUcvOAlhejmGzG+OFjamU/6dEqWsKJ2GmJcljCSTIAMaO56+GqyVTktmTNELwUVo
	8+5Eud0bSYcPEKKnIFpIVIlmXUj2q/XFhn6DDMEA+YRbIL7df2DJEe90iqP7D2+9yGe5CePpxjs
	A2/9G22jJLi75Lt604WrBy5Lq8v40OEVHoomiLW7cFg==
X-Received: by 2002:a17:902:cccc:b0:2ca:c861:4757 with SMTP id d9443c01a7336-2cac8614a02mr12939385ad.21.1783017219450;
        Thu, 02 Jul 2026 11:33:39 -0700 (PDT)
X-Received: by 2002:a17:902:cccc:b0:2ca:c861:4757 with SMTP id d9443c01a7336-2cac8614a02mr12939045ad.21.1783017218966;
        Thu, 02 Jul 2026 11:33:38 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:30 +0530
Subject: [PATCH v5 08/19] clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER
 flag for GDSC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: SSdhhaQEbEF5ZLHXQvVRlZzrUQt14XSz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX2jbFmEaiUJNE
 qtCdRL/FNF0QQjZOD8eWNNscQXoNJXFzeRTPP+A4t96hA2JAqacywCCNoX+3sIVlrKpvZMEXAeZ
 6XX/tJvcC7xiifaK4KIDvbH54GC+j4w=
X-Proofpoint-GUID: SSdhhaQEbEF5ZLHXQvVRlZzrUQt14XSz
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46af04 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RcQCSl0kXxLcSeZUyo0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXy9rbRa/VUNz0
 mpjbmqesgGbWJnaUg1Gs1prqhKMCmQeND+SKZr3BozJI3iNIQCKZSvYn2I5S2YtzGTxRgDb488n
 5IKX3/oiC2+QAX+CE7Gyxlu1QQkIgVxDeVssUt3N0mR12WzbeQ6iXdJO7uW1yDxoGic9i/OM9bu
 PA7zrpw0koCZmWTPgPcmRpSgA+WXWE32uEV+mZjK8McNOlUoOFdSra18ZQs27D31xvbe8k8mpOO
 zHCabaQO3tYr3o+vMdaQbqvCoLiaZNJVjRZB67+U7MKMVHoZrnSRV2aEvd/mys102nLAhx9JeBo
 KF50Ap+tKWn6jgGvY37uT8lQ8lyRwAbNIpuNQd189gNnM8n62BRZZ/06q9rdPb3/mgyhKe3TCdi
 mQ5a+tJPlJ1dGbspxRktZaZYXNpjFUbGPXNORcSHMjF0ZGXd3YKyoFTn3OvmqWMlbb2w3s8+uqZ
 4toU0YAZWLzQQ988iMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Set HW_CTRL_TRIGGER flag for the MDSS GDSC to provide dynamic control to
switch the GDSC HW and SW modes at runtime.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6f8c21f05ba4536d45c2a609d152f871cb875bbb..89a6cdd26217381cd44a515766363cf94d0aaeeb 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1

