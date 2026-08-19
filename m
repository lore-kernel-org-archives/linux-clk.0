Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE131714A
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144013; cv=none; b=W7i8PslZc3XZmdgjjGqILg8DMu2P8LYKcBKKLS0lXtuGGZsPWrsRW9mSYx/QYb9yMcv1B9a0GXYY05FVP5abVuhC9WNJlOBGrWXtOGMe5TonvLxgusbpFU/H5T2rtiBRkSh7wOeExofz8kMIeE68QS1B17JkvKEFg0d0ZR+SFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144013; c=relaxed/simple;
	bh=AnZmPOhmmYGs/TR5dgqZvkCLEyNBmzduluQYAsbnWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UsYPPBmTZKb0YSqQflT5T0utBq4ppceYnVcJmcO30w/RnMA9tJ2ZEBENRkyEDncreutxtCg/+e/9m6uaEE9hfN7TWZbJ2xI/f2bhaPCbwRtT9656sQVuMnYlmHJXOaIEoKN8o8jqWypSruvTAlKCACsBEkZa6WXnfpHMYayvEfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVn+rHNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3j7uAoP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVn+rHNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3j7uAoP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClSQI663304
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZatwOHGSbrGYChqrIJTioE9V53nst3dLeKYEa7VY4X0=; b=iVn+rHNBLf+DJOwE
	76R+lM13ayFJU9sLu7D5Iid9guoBluo3YLCEx8omefZYvxVDO7LXke/NEniqGJO9
	XT7P/KmmExFKk9+a3TijXAPXcqrqBzq0ZsnnIKBISNFdOHIc8Vsq77qNm0ky6+YO
	D9kDp011TeqPOg+Hsgz1OpBGA5lG2bkExnieMyseBoinNyxIp1naJm1tkltVwiHO
	KfRSlRtvDQIIQNOt7nDqsaDmOWMxyRSx1iP3KAFLASO0YrVveqi90s+kJ7lnP6KL
	0/f6vx2Jbzm1vJWtpmJ60TL2Zmmdzo8DqTkz1wF8hjEnKVTeRr2zGVaeEECCkINR
	0uXggg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb7se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494527488so173280485a.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144009; x=1787748809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZatwOHGSbrGYChqrIJTioE9V53nst3dLeKYEa7VY4X0=;
        b=V3j7uAoPSW7KoX+wM67ZQeNMgNi1py9s3ymrHOiV+lP8GT95nVFdol3k0tfBmb3cBS
         3lFP5yN/4i3wASzCVnHo0fNl9Kwj8CBad6ck5AaG/GkaFGBC7jZe+qERxgt/3613+ZyT
         JGDM9B6el8pwfx/7RhMd0Qn52Wm5Vb4lrPMqp7v/gm5kWwxdmb2SmUmr+KTfXI+5hiWY
         /ycG6mz3q3FRxUA6CzN5cL70qlr4+tdzs80cPvUnFHNIAZqvBaHUYdFXRBbwlMP2N2u1
         HPJ1aKx7XWw2K1jB6wFul5OHr8yHyIbmRQzY01lGi8+1Cui5pBjhfzSJTzePVV/dNjvX
         4tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144009; x=1787748809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZatwOHGSbrGYChqrIJTioE9V53nst3dLeKYEa7VY4X0=;
        b=mqOYojSNiNiCUQnU2Gh0D4PSURtIzJ2qPfXMyf2OQEE2DxudsP5I9xHBkLqnvHtCS4
         W5qvNwfyg8Y7WRv/hXDZDa2SiE7zwOXhDzR1WPlghg6fEIgWEtaMrSVqpmyjf4By6MND
         F6YEG/h6BV+jafYHkiwUlFCRa8aNl9vIvEdM5m/6iUnh8rrAIWJvDXxJO/g3Qi0oi2ky
         deaJ+Bmduh9sT8+DgsDyQKMRMZvWuNlib7/5hJtxDGQM8rpuXkvE7Wm+cwMQpRjh0xrt
         Ipwu4e6gFsbkeYwyuFDoO2l8GifSolqOJztqobzPtq8Ut4CnlmqyyXXUKkZpMPtT+k7C
         mlow==
X-Forwarded-Encrypted: i=1; AHgh+Roir41fxROAjjZNtMpviE3g0iaeiQt+n92P2xW+FVl6H9RBcCz3GIZrJnUlU5enUdLAHmkmBZ0fyfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVR65/cXzrLhXtw8FIG4A5uReFiA8BDHXZLz8v7Y6ZRlDTQ8An
	E9NPbk04ts1or+6hykdVFTrZ7/5dXW6R1qDQedHS/7yA6pHjRyYObmoR5lS1VbjMQflRJ9190eR
	kMD0wlWN/xDDjF19OlD04kiAljQyDHnXHSeIXrNuMj6xRPuPqLKXmcRLrnaI1MF8=
X-Gm-Gg: AR+sD12EAKhXak8rIUsBw3j/PtefYK5CVAw8rzW2sPD2TPQtyz/sMX2IYd/83ssaO57
	6of2PYRtqVC7Gm2bGBzS4TZzXqu/6kCsv/JJEMYEfwg4Qv3ucxpx+9FCdNj4L4OhoI6ol5Mf+yk
	yZChB+IsTd0RwKR/IWvHj7s30Y/QTo3RRh3AVie8yO8i1Wqt5SpfSQz5gAuEKqb3zdsBJDq0UZh
	ArwgtcdZ4EMMVIpXA5/0ZSAQ/VI0jzBfbJAESvB8IQBvjTUfAFmh9IotH0C92shHAmwuQeBnL1N
	zw/7HEnHrOYrGEGv008d8hXrL8CmanCOAqkkCkytk4jCl14pLiMJuriZ8bqlYp7ISU2g7jHE2BH
	KtJS5IiMa
X-Received: by 2002:a05:620a:2b97:b0:936:901b:2187 with SMTP id af79cd13be357-9371e63bfefmr444606985a.12.1787144008921;
        Wed, 19 Aug 2026 05:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b97:b0:936:901b:2187 with SMTP id af79cd13be357-9371e63bfefmr444592185a.12.1787144007439;
        Wed, 19 Aug 2026 05:53:27 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:51 +0300
Subject: [PATCH 06/16] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-6-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AnZmPOhmmYGs/TR5dgqZvkCLEyNBmzduluQYAsbnWgM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacH2vk21tn3H9MmFbEvBilj1UVN0DP5/zyD0
 Yc8FDg1d5CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnBwAKCRAbX0TJAJUV
 VvZjD/wMLni9s2FGxhOeMOjICqZ4BhOL3vL4zjoQs2IsfaqnCVVeCMi3mcilAp5TVAIKyCSaTiE
 +2aGqnQzG9Hy0bwC9KHAkhoKPVVfrNC45fdZncE5VLXdYNH93WL6jhwOBckGqEMHoxQlQXXFd5i
 /xnLDLXWThdQ2q7U+73dVmvvoY6f3sulRrnTP7LzriC0/2t4wUH7edx4SbQePbm+4GshSmPTlhr
 sJWx6k6MoEzNepCbf+2x+m1Vv3Rq3cU7l/6DRW8UdvXHv9gQiUGaQlWDspVilMQX8XGNdlhuaZP
 96AJkggs5Nzhb2HRe6gdqFtt0LrC2eQ65ERvvW6AGJbKbmhuS/sebbYxr5ZwgG2QX8bAJbIEJKt
 v1Ij36HS7D5cXoxIaCMPgQ1Nn6outNixDWAS1+JwNO8YS1dy1W1tssjS3xFY2tJ0ppzVW1JeyLO
 AnnEKtaVm0gmXBJ5cBXkalqa439DySm5mfa82HY9SyMTeuqcVLrn43IDW2oBzc/ALHnElijNOdQ
 mhtGa/xTCqa2tF36Ty7n/NTiLIj18MFRtn7TTCl3aUcGCk/RuRUf/IFX3j3qGwo9sOaPp/i7OlC
 MZRZoje+GQxBSh46x4Ry6kyaMPtpVbWZiF01p7SC09GonW5bau1g5J2nhEh0e/JyNQS5T85V4M+
 K4+ISVdp37lArfw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: V8m-oB8I1490RLEig-pccG2HpspdUlKd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX1fPwwhn/i1tV
 UYyVeglazNbXrb486neaBFyU+k1NQcJoWxnLEPOprck5VjgCwIxPcnFIyhxYjdyU4mlisa7anoy
 ergAbFAGdwgc+t6EnPCIjfd0EWHTViY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX09m7qmrqbfKU
 MxiRfYRXPbFl9lpvN9RnU0aLS47otU68eY8CVmzAwKo4S+SJgqR7tdJty9AFHITgel6/veek1P4
 8LDbHc4MoogJbqiLpgrbqCssumwFGPz0wGVtDmuomPzxT7kDQO14flXYP/lilV0ZERi1ydnhcoe
 T/C8KAh/i7YTxKJLBDNlshv4MTNw7jQKdgAcRo21K9zxD6BfCiol0rSwdUwV9tZwRajXVPeh638
 OXk25FeTeyurxxfKrctoGTlFe9CxdlS6bJ+WM1heUmQiqGkMst/CjdGusnZHbFJjb/Ff906svlX
 iG5sHQNJ1sie0yLP63xbLZ7lcAShYoRwsAHSZfck1bU1Dakjq73MSCtc/+Uy8NuCZEViy/0p5n+
 FuOuoBEWpXe4/emGKW+Kms67tA1IypjREKsvj00K907dsxGTjdAjI1r1Uo6//3aFAOoOD9YtUk9
 bxPgby3gARy7rII/tpg==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85a749 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: V8m-oB8I1490RLEig-pccG2HpspdUlKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 6cfe90122268..a4a3ece74f40 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3195,6 +3195,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.resets = gcc_sm8750_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
 };
 

-- 
2.54.0

