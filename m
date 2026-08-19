Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22D31985C
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144009; cv=none; b=Ck+tm2EQ1+Swqea+g2NO+ipBzpNT7p0RvZnQMSBziQ/DV+USKcq8ONcVofoyt2tfNgoX9UaVsGTrcyjgFqzSIm7hCDrKJMrrQrCYWeJoJPqaNAnFzxJ/Qy+1O1C36tqlZhkwIf48JZeEHgKp04BtKilxzXgBjINvbnOO835UcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144009; c=relaxed/simple;
	bh=pxpAVZiQNGg9+F4l3ZammKWyfBzQ6T6mo3lR9dWZLn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBuFsjJTXYHK8JcsqJq+qsD/aSc9mtmFfJPv8w9EmWp9pD0b7s7uVaRtv/w4FYbyO04oc9OEY5v5N/WprT819fzafGB0y2/FyZqQXDnvpL6gZmPdh+KDiiQZQOMXfjudefqCKKfITsHNT11/uDk2JV62kC10Y+++wTW3fc7bkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQmI9PSI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tqmn4Wga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQmI9PSI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tqmn4Wga"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClOC4663161
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB8oxZxfV8vpmBdTwDTa+cvxDs3cVLZHGqnfGQA+Dtk=; b=QQmI9PSI/8Eg5wWL
	U332pD/r8zMti3t8oVnIl8tH0Kqea9uOH/GNu27QityBGdLGNDRmPDpg8JFTccEU
	DG+3jtoxu6anEWj3VE/AZp8Pjn91acn99cFBpVKy1rwoVvsuzh4yBsf5s4wdQiIf
	uVR1BwQ+Mmqao74/Y7e71cNBR89K1fi0Bam3frI5+u/wVIYKniv8TJJGHMRxK/K1
	SyIYB/XoDohO6eMgO9VtY0KvlBZQ1CBBzJZ1tsjlLGoD1dBulENcGwRx3qqzWbAS
	MMUhcrM4EUP9+OCEk2lC7tZQR4F9I/YlYm37E4LJNduTTgymnG+dyPC5YXJtvRvF
	Gy5l+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb7s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so123711585a.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144006; x=1787748806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yB8oxZxfV8vpmBdTwDTa+cvxDs3cVLZHGqnfGQA+Dtk=;
        b=Tqmn4WgaXJS3IB6K6LDdS63vTg3jJh0+68GhDZBCAh0uJK7Sarbr5ncxc/lu1zsRaN
         g09On4FhlxiZDS8SrJSXYey3RPOfUBL8OEZLuWT1vQ1e2EBJUxg8hDhkdL4IqksP3NDA
         ohTb53IO1iawZa0/+imNpeUHSw4Vb8pFxkSTqVFUcY81lmyJg2FNHU4fKODEki18lbJY
         Wx5vKEVcgmbj6b9g+IVaj16kac5/TPvPMo6lmQEhpt6+U2gXBOGU7rzp2GyXE9KSYl8g
         3QyLV/8qC8TmTTV2JB6Fl8OkOSPiie2/E0yMWGnX2NPDSjILDUVxkAq1ckGyMoFLdhUs
         XDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144006; x=1787748806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yB8oxZxfV8vpmBdTwDTa+cvxDs3cVLZHGqnfGQA+Dtk=;
        b=SClnnzHBa0o4pgqI/vfCWzZGMuuNoGE9olF7NVhHlo3+5Q1BURzQZyw7smIGwYsrTO
         tBhBSUsLodlISnPa7onkVM4ASzi6A2u2Aqq3iVY6KoHBh6HQbZ7/L7gT1bppV+wjM1nm
         NmXtLli9uG7k9oqpaM+hMpDA8dn3O/nXAfpVG6hIEW0OU8b40HhH8o7wwzYnENs2pN2O
         wgDwmzNn/pso4fkUNZQLUWpxqN8sD8Yd99Am0bLF+stsmjiV+PgIevAa36+EpPkAC2ey
         X4YnEaa4zIjaV2JBTbG/QJGiAvF3nlBgjLLVge6zj/TTEW6fZZPZulAecBDPjH2TBfPN
         r0rw==
X-Forwarded-Encrypted: i=1; AHgh+Ro97nucgDuRFeKly9KXj/GN7q7p0fUcjs4AYOPzNX0UxPH0rDxrhmOxhLiuYNNgjZ+u0mZwG7gzMSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxw+hUQuG2Y3A5WAJOJOhrZnqAWz+P4++LHOYL+ezF2I/W2Z3N
	XQPTrBzKXAY6LxbFiDACXRAgWxfQBzlTQGBJC5/mLHaESlwEjrUd6QQK7gQs8DU46kKSqtIxM5A
	MPwzDGK3OmeFqo0EXcTDrgp5IMpBSmrSR2DxEwX1E1LFZTUSlYOPBwsbIBd8vLRg=
X-Gm-Gg: AR+sD103e14oQzRAgcdW6g+BCrjr3PtEmM5u+f6L8T0glt5gL6UXccW6Mdq56U6PdFA
	CNzMCl3F1dgMxBXeyUQ/Z97A0sgct+CbKAJc0VUsk/aY+av+iAvnapbo18NpbOUWDyg9+QRIC/t
	jrqp0fS7IM/CfsvyhDvtEqZgLtAhC/4Syzv1hRWo+ukdLWIKz1rKRZNuV+tHDu0l9kmehmB3l/J
	/Dj8RKZDJm3uA3zy6S732w2XnNjUiFQH+I6spstOWOIoeZPJUuQxyzpAqTyW6N6U/x+8q8kuvjJ
	QyphUTgWISWfmSPNHxnCP6AmB3q940M6hCJIpyeX6N7+bGnD0iEyoz3qanCnjs/kg268qaqeOKB
	iU91hWn53
X-Received: by 2002:a05:620a:800b:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-9371e2d1713mr447358385a.28.1787144005479;
        Wed, 19 Aug 2026 05:53:25 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-9371e2d1713mr447351685a.28.1787144004914;
        Wed, 19 Aug 2026 05:53:24 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:50 +0300
Subject: [PATCH 05/16] clk: qcom: gcc-sm8650: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-5-840034124e73@oss.qualcomm.com>
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
 bh=pxpAVZiQNGg9+F4l3ZammKWyfBzQ6T6mo3lR9dWZLn4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacCKSwHh6ZZEIRCB5+1S6mvgUkzNQPR45nbm
 HKtL2tA7R2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnAgAKCRAbX0TJAJUV
 VvhWEACtchiXx6Vhd8xL7AB/T3iYzbeBOqwQGToEEPUFVWJXotLfKtXp9wO/nzk3cMD8BQs8ILO
 +2gCcv29T/ot63WVWvEGU7kABi51IQN/28h7tcFAGNLvq8WCa5M5tzvFZBket0NsN0pU7cZuSjP
 1fb4Gl4/uhVc4AFL9NpUlHQ8tDSj5043kPJNaCTtkCtsXc5or2IxkIVqRpdGtPY+4lB6HXnA9pm
 pRRzfHsfIvWnzd44LHPV+X9FMKT+XXoIcBmmp9kKVbrmVtaR8ia0NwqpSYWTyxhf4lqytgI/Grt
 OWjkexCuvNRFM4qup95q8noSJXTf9EG2ciXcvJXWWgKXfcZPX3UEbdd/qfh80V3nZbT8iLHXuFV
 /6PtYVy6miADe8TV9aB3NaLvnzlrlbamWEym546HXJSBklJ1Xa2ovJb/iJkLXmBbH7bvXAucyE4
 t4tMN8v4HxM1IQ6sJZgGkwTb4aXlOXHrTwLDDRkH22HHFa10nQoxMSPlvWO+xVEpOEzaJyg24RA
 /3R76RSMNfuOw0tooAz2YM291L19sjhHFcvueoYid38H7WbYXYb5HSUWpoq0M3W6HD8E2G1n0iT
 budXu2eJkTn5gXxh0JMzpO3RvtSVWYCWAm3gLufcES8g/48CBcdXRqzT5hODVXFGdQF+eioGPfS
 frdRZP3Y4VlGgvA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Yn5uBViYu3vCoq2h2xJ59uyB3XWCxa-7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX+NBnuHjdwRgE
 lQHtAFGFWZFBtO37f8+/V1Msk7iLp4AtlzzclaUjkYuOPd3HZ1GrL4Wgi6aiO5TUUtVsyAXpTI3
 AVNEdUE8ow9PCVZYQBN3tcC56tNuowo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX4Oyg4+xI+YHc
 eqKEvqo8sKS+PUvhSvo6ONEl2z+iuHfUZxua8KkJOajvyZPPe6+0clYnZAIpYFF2c2cE1zBUPCi
 qWscN4nIhnrnMXSkmU5oSC8aXOMMbyot5bOk7IfWP3Jcq3IRZUvG/3nVn1ja1dtGY6vWR70/hVm
 afKFsi4Uvxxjzjsc/DsW+ytTosH8b6PILe6g9dsXL10VoCHcogGVDNCP9YuZduWjnkB6OM9FB6A
 0P7rY2KEceBhe+DN3abJkNEF82p+LIIMRZw+9AooRrzgiNOMkbiLuvyMkplSOhf6g94YWsuM4Kb
 2JOgaIQdlcxHdC5LDTyPwwlCZyYDYJ31RKRF2bHJSvB9myQWVcp5XYJKkA6vSKmvOTUI30jux/z
 TK6kUQtLr6FnAtuzyVDF36qBdU+15v0z00qhYsYQ3bh2/8BRtLV4vvYIB58TDMuKTu/kBTFIMsT
 lGEeV86sUoPAG6hqtEQ==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85a746 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Yn5uBViYu3vCoq2h2xJ59uyB3XWCxa-7
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
 drivers/clk/qcom/gcc-sm8650.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index f7e2d7ec60c9..b5cd4e3917b7 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3784,6 +3784,7 @@ static const struct qcom_cc_desc gcc_sm8650_desc = {
 	.resets = gcc_sm8650_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8650_resets),
 	.gdscs = gcc_sm8650_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8650_gdscs),
 };
 

-- 
2.54.0

