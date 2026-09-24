Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0E3480DD2
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246464; cv=none; b=eBufzp68mIzUPlAMkrWj0zAc/uXZCPuoUQROQ0djw9AOsXOo9kLnPkJzE7uiSwGQsOZSY2EmL5Dvv3Q0BpE43ZbQT407OwNoVqutOKG0BjCTp7T7QK48O/XHRlk0BjpHKdlIk7d4T2A8q7rTVyl/GWCNXRfbM5/deIp5AgH/e24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246464; c=relaxed/simple;
	bh=qBlgGkeH8wNKY01fzcMUBiFwz+9D3LxCKgHff59hJF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DU1bAkrznn3i4bH5yajvAq7zyX56fcws8sOvyzHgX3nNhntRUwi0GSkACFcPwESVmEhOMWvJFrxVZFMBCWae9DasGcllv0vIj7CL8j47ozcPeTELLvL+1PN+8GWSUEXgnodfhWJR4L9vHY+qfT7FBE0Tccq2NuaxjEu9JUAhKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFWkCJBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6NKM1AQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFWkCJBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6NKM1AQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PN502919281
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JiPGKX0ujiDce+OGI+2TxDbClsHesMw6sCez9hebei8=; b=CFWkCJBka5H2Y0oz
	xaKvtdkm2lcwaUbEYAb8zaIA6wV9ws+18irXLNi8HDU3HjLDzD+amenrExPdaIHC
	aHaKmysRubWbfVkrkvFKWcd3f7RaO1qTRCp3YcZy5QpUXam7LoitfI7Iu7tqhpCt
	ukf5x3A3EnvnDwgLsL4PpXsZmv9REfbFui8fEKOC/5PRS8btSfcZfeNv9Lk+W4JM
	Yt2J1cOf8Yy8mwIwvGe6rNxrp5Lpo2ZDqr9+FxMVi4c+/yBxi+bJZ/PW391QbHOZ
	VWBVdsPAjVfEV2cwKMH4Nlo3i+j1nI3+iTkytkCFtlT3y1n8c9XJ6WhHY0LVplbF
	K1lrvA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8dd8be81so20321116d6.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246461; x=1790851261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JiPGKX0ujiDce+OGI+2TxDbClsHesMw6sCez9hebei8=;
        b=D6NKM1AQIgstDrwFwPvOwH9kaQRregYvBhnRqPvdMNBz+QiefnVKTRFZ5qysCxA+Ee
         3/3HCi7PvYX7sjM1vvyWgMFoKT/nYXLmyNKsGPoBHq7cxOAPY0Pd/MhM9y/lUTeU2CXh
         HOI0Gh1XYiKWqdTnb8+SRmef0hGWRxlHsRvcXd8knX+zPsmTECZUIqrwIQSH5PPC+ADx
         0Med7Kq7eim7y2jvE/Gsyp2P50QC3es0G4Vs/dhLqNQypU39wjOYWOugX82fZGT5wi4j
         kE+xJjGksFOc8QO34PGV2bHQxHSVUB8IcsRgfcOXwk6vMrZeD7mD9vn+ejy2nQ8YTYnL
         9zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246461; x=1790851261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiPGKX0ujiDce+OGI+2TxDbClsHesMw6sCez9hebei8=;
        b=l9CaZmiiF6A3J0EtSG5cPaZluKJxuAShe9GZcGKwlyEzjT29VxRQhDWMu1QRXJ0FlO
         simzKGLQFQekP6SVToLU24prJzGaPID61xaztUYBw/qZ9ENAN+t4jYZVDEkzMpiTNcLg
         qo6EDMcQSCeTgc/0z7aEwNzs/eLGITXGAYJJkxf3Euu56zolyIBPsVslpBtONqQic0ul
         cOocf2AhjDJkHg/L4hb5Ou2QtLJiVXREjx6jcLQfBIKvI1efwtpXppy7qsA5dNzXZwSj
         ci64W40/aX4dYjkUUfbFW1hgyB/VWcRt0lIzf2TYMQtfWcO9ojJGejobB+p/YiwICKXB
         kMDg==
X-Forwarded-Encrypted: i=1; AKwUvBwliefR2iFuIDbBbyGxko/XwgQHv0k1Dl0f/AC6QTHNMJ9u5EgmEIxLincILPlQz/TRvfrsFcJm2VA=@vger.kernel.org
X-Gm-Message-State: AFuF++kg+pr8hJHCzBkEYhcEtLFdfurB4Rp9MtScbKmpELoYCm8vphxz
	7P557mH7eo88UVs01U/VpTtSKXX1HtfBlHwHVm7+9qXh+t6Ia1bX3vSwIoX3pcO+wfqHfpHbRWB
	GU5wijOVUDLquj4Doynk5jlecNxOnD0Cgs+yqmpKQQOmCrpIRl3Q0GIbd0oX+Q/0=
X-Gm-Gg: AYBFou36Id/4pu50Izwr/5wfNchRxY764UTCJZ0RFFUY3nJsBQe0WnSFVzuNlfosGuG
	FB1gAhIGBAZpRIR1tVLRdNDQWJwyDzuN2gpg/vCL/M57jQ9Jgpa3XeqInisUj4MaQwOyCPW8hWX
	LBk6ouStmg30PVD1D2vDf41uP/dVrLk0gLQS2E19a26UBUwM8Gy4wX9XIP2pJDciJG4T/ZftAnS
	rOFIm3nRMosTlU5/3q4wI9TUH6llzdvcq93ha6a5/eA13Z/keir/nPqTbLFefcpCTWKAbTTtCdl
	hPun+mb1bIq9me8VaZJNPG7Fc2zLq2vj627tAJQm4wLm3eOLKw8jwcQpyR70ALkvjhkhb4nuAdT
	7gtbA+6hp
X-Received: by 2002:a05:620a:4890:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c362a8a57mr213917385a.23.1790246460891;
        Thu, 24 Sep 2026 03:41:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c362a8a57mr213912785a.23.1790246460222;
        Thu, 24 Sep 2026 03:41:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:34 +0300
Subject: [PATCH v5 18/42] clk: qcom: gcc-sar2130p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-18-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qBlgGkeH8wNKY01fzcMUBiFwz+9D3LxCKgHff59hJF0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3rjV6bJDJZq01HVWro8gHjpi+fMzFtRkh5k
 KNp4Fb4I5eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96wAKCRAbX0TJAJUV
 VvkuEACHu3+B5rNY45vtpgnqMEE0l6+rTBgq28+9R4voELE0qGQpzQ9QTnYeXSyH8sTmaTGg8RM
 s4pGyj7vSdu3/r0FUlebSNeUeAZI9X1XurlKKe1eA1rUPKDLHYOhU+0zsNQUkS5TCAzpYX6PYfA
 wp0rTqpI9GHfhV8Tp92ALkrmLhh2d+EDujpuIfIWBDPfm/as5QZOdHVTXxyWKUNdnwvPtaGpde8
 aZyAHRNSedCTnV8Zrcr8hV0EDoJP+4uN13mFmelI0P2kFrqCh+43ZcVAWbqgBPA13aCmLg4wvSO
 F7q+xQ4oardQcLw7aSH/vZHTHr5tBBJOqzACY5v7thdMCH6kKmJA9NNblvT+TwMGcyJohmjYc00
 i1YrLuZ45EbAbab1EZty0ltw/HdbeP4Tb+eAEDR19Dko9f+2satB676S0yOfY0L1vqmIrqS+fqq
 sk94xV4VeCugrWHbNn33owomN18gkt8k4H5+58NxpkZMdsSkKML1mhTZAsRiMnoqyrdAX8R0qGH
 EmxrX6rsJGbkUbTju1ufq8gPefmeHlh3114iQ7CvHBFbSHr6Shfw2hzW+yO5vBgWNosOOuueFN+
 3PtpILtUDvIyrN0TNKF25Vra7wiN6F9YLwSmpMiPfBgIA9koiJzGBYD05xYCHF4Rce/vMfYThzD
 b2zRePUuTBP7Z9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1G0t3y1sgCbU
 nB56+T2fCvFMrRorAkaksNq5NFvA27OBoeFp+TcaG4Y+AhIbYOBfH1FTQlnRfNmTnzBczziC93L
 V4P9VvJdKT4KvGqFAp9GvUiHaNqgQAo=
X-Proofpoint-ORIG-GUID: rjheRKvWQesAlSZ1jdlO-ATLTUx4qDaY
X-Proofpoint-GUID: rjheRKvWQesAlSZ1jdlO-ATLTUx4qDaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX84EY38lmLDvy
 47qTOBDrtmylv1RAK9Iwv4HxEYr2h4t29FluBdBVX9iVi2dCTrsCHOXSlm79HqSgADW90guKhml
 CzVnpAv0yxJzg3kC/nMdRPHV896RtpkeWkTbglx3O9LlwVPAnoZrFGAieFYJOGXNWcxazgmZ0V+
 MNxigUUO3zx8WQC5VM9gopbTfU3/VXPwER60RYcVKoW+lDh9kM7S1o7vZEEXQV8KRH4bB31y4Gw
 62bzcUgEKB2xAB0+fpvltTChR2tG9sRzCd4nvCD/xWaIvihJSMyzKg/dUM5Z9UlBodoALyVSUSs
 uKXP+keXCAF1+HEDk7wEpD1u6SsvY5JbobndbdtH/TyH4Qjrrc0FWfR89GEZI1EU0E1Um2kpijl
 XpFN7uQpWR8KlvgHQZRGGsebTB9ygIYgAnrxY1JM5/n3V7eXZaeOiFgeYd+9tQ45IWdmzmQfqWB
 Ns47sj/DJNtxMW/pCnw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe3e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sar2130p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar2130p.c
index 7456001cf25e..7a3478a9ffd2 100644
--- a/drivers/clk/qcom/gcc-sar2130p.c
+++ b/drivers/clk/qcom/gcc-sar2130p.c
@@ -2308,6 +2308,7 @@ static const struct qcom_cc_desc gcc_sar2130p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sar2130p_resets),
 	.gdscs = gcc_sar2130p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sar2130p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sar2130p_match_table[] = {

-- 
2.54.0

