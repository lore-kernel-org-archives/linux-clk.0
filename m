Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8291485515
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390172; cv=none; b=qF7GBHfWhnfzOdMTOtA7ebiDbXJ3VVmjxS3fNljJQFP+BnNUEQsBHDtnvq09UHK8VifYgKEwMd2FnM64UvxhJDtiD6Ky6Or8ai6eXo/jfjsUhcVxL/HY/2kgcmXAjSFoI6EwOBiP7o5iz6OhkjRZthDfAGbB46xUGSy79KCNHnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390172; c=relaxed/simple;
	bh=RKTcHR/Qtw0lFOQ3ChK2zcv6mZQFx+uSPSNHFSpPRWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAhFPzrCRLvY/IchmesGipqDmeKEFwzDMf7R2IYk/Il3RgpHENiyq/+aKgvBdydplmjDDgDzhyOA1QkBThqZ/0JG9bU74zYGijct2fZyETwC1qsMsGpAf7uORCE2MAl/bda/oKsU1M580zkHiIcn8q0LajzrSU57MHWM5iKAOSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVcg7cK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IG8+T/6e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVcg7cK5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IG8+T/6e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmB4d3793437
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7kBfS3bzIpFi8ACAc/5+K+/BJvfkbhYCC7kKNkjlTI=; b=eVcg7cK5r7KTGckP
	Ui5R2X8T2Q/bX1NKUc5gPk7MJCZq9ACdTz93soqqk3ZljEY/1nKBa1lIQ+E+DhSH
	tJyxkbtBTvSUVTEf+n3o75BWMfGrRXqsBskYh8D8IyP1kIgp8ObfDxcuh8qhLp4D
	FD9thFrIftfDcrLvTakABuO4Ln8eh0rPzhpVmFe/fcGLq1fKQNi9uzqGaM5Kejas
	QTGL4cQOFCfCXungmqpMhetgoivQsy8d6Y+01g9gG3sB+lZCmvrggF52OAofsfbV
	mtzpW2zKl9T68/Op02Nd5qHcegFvdfsWk5UrcU24+h6j1ymTwwyP7ugohGABwhz+
	de+TVw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg15ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-912054a1c29so37415596d6.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390168; x=1789994968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7kBfS3bzIpFi8ACAc/5+K+/BJvfkbhYCC7kKNkjlTI=;
        b=IG8+T/6e6hoyAgExTHH3y3oEvEkK1oA0jRpri1yxD5u8z+eeOE0ZAVa4nPCyGxQVjU
         9C5Bc1hOI6FRzGWh3pkPXptkdFmeoUnBGZtFT8hQL5fFGV7awBLTnu3UJ0M9qCbBs4IF
         7sLkP7NK3RLlS79GE3a2/SnBR75io6MsQmDpCYtlxOvp/72tUEX34qgML0271RWFgHD6
         UXweb8T452gZmAfSgnnLrq3XacDqRNS0bR1z3tV8y5vv/L6DHSiVLo/q7ucJQeCUJ+TN
         ZlG/qhSDau2dPpr6ljEc9vpILAvMK4byWYZ4snElNPgwys73Ghk3kcKk7gjZxaNFbsjZ
         o+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390168; x=1789994968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7kBfS3bzIpFi8ACAc/5+K+/BJvfkbhYCC7kKNkjlTI=;
        b=f4rb43YTbPRgqNzPxSge7w38fI7rYN8hPBWK7f/Pf4XphdEtYvhAL3Rc2O4Fuk8ylg
         U/ImAcyIvr61djVwchfynoee8VqzoyFsdMmTmN8Y46kgxraxwOWZ5u2syOVUTN9eUfHV
         wgx5XkoGO3wJT8h8/sqjAyNV283vJPq28emPvU7j8Voe/KIj7NFEz+GAQDiYAOZmJiSM
         5OWTqFce3SfN6yBzawD6My8D8OYPYL7tHFPbNqjuH5XNRBe5aUMZ+qKakmmCw/QLwl2a
         eV1EghdNc3E3SDimeifTpCHbnaKKOa1ah3qQMw5hgkEvHCqHIhJvtF5iCU3Dunx0fVAs
         ixcA==
X-Forwarded-Encrypted: i=1; AKwUvBzmG+9I3G8L5H/2HWzZPlZ/CtjYajUYyeC5AWeluRWrLf60C5HlUis4ITGMrcnQc+vFYwLEjfYmXx4=@vger.kernel.org
X-Gm-Message-State: AFuF++mIswcdDHkG9vt4hR26C3TQQ3A3c3D1B8zljp0aN1FvD8lLfXP1
	JpdL3MD7p7f7k0ItWPHuyqwPdqpUuU06inVNbZIzGOXUtiFd7WLx4wnVjrUzj+SBouu9cZwyAuS
	LTUKHgfMYCZENWCOcnoJJssTGveqmVwQtsHIx6bFcGwkqAERhi4xA5fi1OSSIJt4=
X-Gm-Gg: AYBFou2ayR0tyySVFgGRJ6TEtBz86Qu4a6SrazUjD6yUXCEy/d2ZIOwmBgJgOYCrJI3
	I6lfeY5qbWhQhuz/HW9D6LfS535kfv4jZW1fqghGnYWmTVLH2lg2r3PG1h/FDjCAo8I3X/wJntx
	EyX+ogxqMuyQz2yFBRfdffBnRYWC1SN9DyQ9oQjfZV66vxIqt27tU8wIGrc6NBAGnpUlSCNIcKI
	jNItF5PICUGBvtvtGgo94N8+Nsp7jpIlUbQWdq1GBFnHFXRE0aAdM72EqRcvEzMjJiSKYrJftJs
	6rzCN1bodtA1Scf6o4VqjuY+ookddqLggMpCeL2Gr3m5mDeB45b9r/UeIXSDHwQpVsW6zzOdt79
	8Xcu/7zbh
X-Received: by 2002:a05:620a:1983:b0:939:fc18:4233 with SMTP id af79cd13be357-93a2989422amr305044185a.20.1789390167939;
        Mon, 14 Sep 2026 05:49:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:fc18:4233 with SMTP id af79cd13be357-93a2989422amr305037185a.20.1789390167264;
        Mon, 14 Sep 2026 05:49:27 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:31 +0300
Subject: [PATCH v4 32/52] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-32-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKTcHR/Qtw0lFOQ3ChK2zcv6mZQFx+uSPSNHFSpPRWY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zqCt1KWeXIIIY3Xor3BT7a7kZFYoObLrC+J
 oNaSv1G6bOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6gAKCRAbX0TJAJUV
 Vh7QD/0ZndEc7VZe4h+QoU4l2KhhdYoqN3+zdbpvwZkpZlzrCpPvWuIvrtkJVphKuB33wyRWxEM
 9Ob8OJgyubBQr8OypIE+qJY1LebPFbt+lBWRwhlSDsczQ+YFDt7w9AmbKxCY1Ju5V8NQHF2SGBd
 xPeSPJpti4ANqtloW3hzKpCBCect/4WrMP+bmATm0kd8v7IlCZjnjm92jrOFH+eZC42YJwg0u92
 9zttVvNlGK+njhU9sAJ8zIGWOwPKKdfUKPwi1/ZLMBtysB71REpBAf1Q0RwPmHSjWMK6TkEqLNP
 A1UcN82ZMEsIZPxglVJGLh/O1wGLgoimEQRcXjM5+Zk90md8hrGdOoNMtNn16AAYIuCnFQFUqK/
 pja2o3zgmdcLIDQCFyDcG23GVRd0F/+Jjh1MSyKGMJ5vf2qXj0Pt+75x7QovnxGMPIi4KtihJ6/
 YZJJjNl7OLjjGohnIpgGWqEEaAeZcnhhO8RGoZ4S+8+DS5HePgEm29wcdQcBKiYBsRL9geId0J8
 X9RFJZkNpThFXu8d/GPcY3ueLitJ8J5Vqwl3tskz5hTdfRIo8iNrdvdD+4B6nkcsTC5zZOT2yiA
 wTaBHv9BDEBXUV1zdTq0umGpVUNgNouCZpaBBKU62pjY+5FIsBVxvTGpcyn5he38wlUpb412cZw
 JIbegl8r/AIeGJQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed59 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: YZOytirbL79UOpiilQehNqWbH4FSahTO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXyR7twpdMl0i5
 +IKkbpAXSH65Bfwc++2/NaUqWpx8t3A2pj2ilIkFpAWLqBpyyYz8A7DENnvPMtoDP8tf0z8iwvE
 kK7OdS1QHdDZiLHVltnGLC4cBuZ7/Ic=
X-Proofpoint-GUID: YZOytirbL79UOpiilQehNqWbH4FSahTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX38GD2w7waIs2
 VhU8hQe/dKKY26pupvMzz3cBwNtZnjC8wjx+HXYAyAVQ4n1W5i/QbYmXQXiJNnltLgVNXvwH9gi
 DdWJWF2Ib3JIKlOv/ArkbBbFm8gIdXuVhEiSiiVtaceHP4jA9vOWiLtegscC6OxiA3INBmLbRrw
 Vkjg8+/mhG9Hra/+rBvRoldxyPpqMg8m8g2P3BDc+CDSY8mAAUNH/SKOKsdQkOtBe/PPfFizt1c
 AqfAqMJKAXQsF/IZniS9Yx+FwlFkyZtWzZt1V+/R33rlDyag+3UMafLSahvbHRlMAHkQpvBkriQ
 EEhpPLKuMfk1hiMgJb/du+vJ9L8NTaxpZIWJEt4wa6fDgvrAMfSrIrdZ2u1GALOcUZFJiXV/cVo
 E46Y8BCKUhMb2JH5tR70zHHhel0vWN5B5YE2vaMI3g326LxMOVm7FRmm8UufOEZmTRL28T8Azrk
 aH8cZxJ/YTmFlyUk11g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..00ce241c9adb 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3400,6 +3400,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8450_match_table[] = {

-- 
2.54.0

