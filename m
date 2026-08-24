Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F24248C0
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572579; cv=none; b=neHx0AC3gYqQrAlmm6fzjuI7g37kP0v5/N4CBEM0cKBSrcwTXrM9lfoURSi/o1ANAmwiimSWAGFqNjmSLhSSC8l8Cu7kMaFZOIC4f6INwceeqf2Y1LQMUevrBbyxmC4ly29hajxZts/D13aEzYhPmNiC1hbvZ6vfNFZ3Byrvv+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572579; c=relaxed/simple;
	bh=rahoujyANmIs+SzbF411GraqoN5ZdYQDB5yRASGUxxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5POBEiY8+YUaIBMu10xHa+bd+plxes5GEakRUK53PPt7B/1jghF2itm9Nkh+0RSomoDemSi4DacjxEuEz02Nh9HffsM53jVPEO9LuAq0fLPhqM14Z3py5J0l4HqD/nLUqTsJfnKLkVC3IkQbjv8R3iuakcOiMlBdz+/UE4fRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkB9eydP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZ06XDof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkB9eydP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZ06XDof"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMZWG2743155
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=; b=XkB9eydPEJzwuYH7
	xZlmMfUUja9OM1jiqH0Y7a/+77M7qW4aaqlU5oeXKa/Q7MyJ8rkHGRRhbfNDCHqz
	xUnelWj+XmVZDrNRpgbrg/k3ABi3LeJzdJwMC/xbgPPR696DquldZAlM7O1FYiYu
	n1AtHihBHnpwCEfT3V6Q0EHMys2SlL5gCxdw82CtFOA+GrPupZh+c1KhGkrunT5S
	cGJ3IPuxTQvkaiJPNm/6n99QApE9rZHmwmb4d9ErdJyYUGutP2KS5zaej0/Pypud
	JqkOvO3We/w/lPlB/7ear8L4CcOUovShOOZDCqB5opecHE3WQX/7fdgD06etnff8
	OeiQuQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0x1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907ca5abf1bso18863926d6.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572576; x=1788177376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=;
        b=IZ06XDofSojFtm+Oc9Wi0Ii0WygKpnR9CViy3IXIHPCy3YprgjsAdsZblz31MY0sLd
         fF6Ef71orfja5v+a53ap+Q0Jx3dOYe8MYAE/qmC3vGixJ6PAs2HZ6qxYZJhK6R90+Jsw
         v30PQq73JpEL4dE4IEql6GDfcO5x9otl3a9klU+lH3o2AEZWVjlwK2XjT3PhKgwQ+szX
         WV80ydk/Xxdqkvj6778664QmZQYmKiAupgvgFH82hu/tnYKp6PTrTXLEbu1e6wr1TaXB
         bZ45sAzfP+0TyQ9yYo7vqsR2m8eqE7dKZsF2hWPP/bK9Efpnd8GAYrXcWREf1brx6/wj
         H40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572576; x=1788177376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=;
        b=eC6dln8/n+Jdp0rlDth2PuJw+bk9LlW3qO7C+Z1h65pZzoI/rWzJ9sHvHMcM2NrX5Q
         ZFFl8lnFaRvbP21TixE0QgQICcYMo5hgookO1iowSZCPNVyOCKn6BYIrN/6ZwQbSIAS/
         tXzCwek0LNxGtsnIRjyb0Ygil60sAa1W7btXgDUXkY3V4XMG2afFwiq+6u//sxbgwZJA
         dpgqzPhfCPBuQTEdTXXWhT8ek2RCTYBIGbx9K1RdeHIHn5XQZGO+L6B2ijBtDkSznuhP
         5+1BDbHYkY4qFJZ77rvHRIM6Zvhy0gdo9wpTxaImrHdmQVWBsicV+gETGd/Zzq1WZWXb
         YTKQ==
X-Forwarded-Encrypted: i=1; AHgh+RquopxAhvOeezGRFh4rWz9fY4MsZ2WIsq84pHRFW/HdSO2Iv3NkFqvKt1dH6OAgwNCnWwUPK/tG4Lg=@vger.kernel.org
X-Gm-Message-State: AFuF++kpI3qIET4eiqEkYYUAZxK5Vw9GYs5gFi0tb4JXDHTZSnxejTVO
	svrRcNT8I7dXfYKl/tscExAJdXKt6chSNwx6pVUNe1bfuTjv6wS2ndRUDKl7ftaALdiuGX2LN6s
	8B3ktdz+J8s4gTDuyeuN8eK68jDTLZFlqmHQq+nZd2BWYpQMX37pjLVLBUmfCfZ0=
X-Gm-Gg: AR+sD10xWvhMsufH94V9CE3CCwOlsn12A4LGimc8BddzHLNXwcRnymSEMPneTvRGD7y
	Vuyu6xqu/p/aokzpictA9plCPkB765mfQi/zaJvVIgdo735g9fOMSrgMK8lfr4kiAKFU3JrGj5h
	47on7+fBY9n84qIKf3eeeFLH1CJCa9Zz0uY4ipoNoNMr8vKGqKWSPCzfHBiYWR0a9TiYEcADlZq
	+ySXlfFcKvbX9ZBX9uG/lyS8Ovkg2rlTKuSZMX2m5+kr+9GeQlXMSdOGjZBAuL0zOhhdcv7WnVp
	HQnQ9hr09cPJGKpzlkRLAcCKtTpy4Z+EdHaXPlWN32c4SAV9G+5tgwX1GcKx0xxfzsCXRvhQevb
	jevuHZvLw
X-Received: by 2002:a05:6214:248b:b0:8dc:1f0:9f2f with SMTP id 6a1803df08f44-90c80e3f318mr237344336d6.17.1787572575919;
        Mon, 24 Aug 2026 04:56:15 -0700 (PDT)
X-Received: by 2002:a05:6214:248b:b0:8dc:1f0:9f2f with SMTP id 6a1803df08f44-90c80e3f318mr237343416d6.17.1787572575425;
        Mon, 24 Aug 2026 04:56:15 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:18 +0300
Subject: [PATCH v3 31/47] clk: qcom: gcc-x1e80100: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-31-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rahoujyANmIs+SzbF411GraqoN5ZdYQDB5yRASGUxxU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDz9L6ka2cMNeaNZEf2e8kHJySKgO4Pnu617
 M0cdq7l5uuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww8wAKCRAbX0TJAJUV
 ViQwD/9ffYa1Ymf4E0ZTJeWZA2+DVymUYNZw6vCQW63HtxTooWm4Bc8h3O/lJACFPtlggfOp3ih
 qvhrxHmUfAFc5AoHNCX+h+obgkV8Xwo4IpJKiuZct/iI1JOdR9gp03iLsLnc7eaURuNzMbN1iAZ
 x8NDRSpubuukQVBrT5Y96XVqYit08g4l7NjGbUFZDq/a3H4kwC30FJQMRFaNpTbI//oBQqs1fmb
 2H6arxMdvhLS/DyRUUADQccn63VtOu+EBlRKrk/Vpzu89Dumagoxj+bsGKy/RAodKmhDFlEqzqn
 nlFjvMNCZFSmqzcQo7Opa2mClRSbDX2HKnqUODdR73+sgb3ZLv3LL2pBT+07BsApv3Hqk558bwN
 NFqSHR/M+u+PEBHRtMaoMkaihWbrLahdEXnY72zDMqwlruNpbdy6kbP4va5T1FXtsLekTZ6Mn0F
 3mCqRD93WgUFMb/S8dqRbfj5VXbVa7SI10cddjfkN01E8tgim0nnS59dPm70+pvVId8OJtSmKwN
 kuBCbUNshItG/s64HiLh6/RKTdU6QvR9DU/swlit5V1WaN/AKTd7puNxDeh1BAJumBl/NHRiYbf
 NT5VtRk1Xbuz12PdFmcT9k5mxJZvVEoJQu7luLYjEmTpcvJjl8SN+AQKpVH44ROv919ZwMtYAGt
 npiBPNgY6NxAg7Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+1qld94x5QpL
 5mPUl77CfLPkeZ7+hcK77IdRnKQebShSFYkwUBtOACkW9EN9cr1oGRLFeXFElGiQ0qWIPCSq74u
 ffrLx8uDQppAn3E/Ix1cl7fTaALfqHtxe8p8+mo+xUOjFEHoyGwaDhH/vgyG+ORfshic+bO+nVd
 t7kBaA5B7Q6ossHVZCnl9LJMXfkmJHPqlgY0ng9F0d5+peAV+U1OeJMSHZ4MqZ7jyj08BtdOD2D
 NWCEYbuhzAo0qyOiqJZlJq53fmvRmrUv0ExEdfhRjJgCwo4lN320m9H0eJ6iDpgvM75O8/XsBJP
 CiNpq9pW+l71zvxLKeV31HjqOClK5gg4O5OeSgMCT3cdDFJKRg9yLJNXLMFxD/6bIe6wSr9fyNu
 xGqigeZkPjBu/GJf+obn4Zr0Ysk77JTkzhRQwMRbvIXXl3wTo5wiAM24g/qNauyfBniqnHe0NNj
 KZm41q/fRx80svsvdGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX9JahGK6HYchp
 mQ3T5bFEgDMQCQwE9lHaCK3xu18Cyi2k9xaT79z3w3TKcOefc5+E3H4iQaWr3ruVLz029yQdhMu
 yTh1IvP8J8t6sxt5asoetgV51sV5+Bs=
X-Proofpoint-GUID: 6XjviFpy0_IxANZEtC4X1LlHdaYVgIhv
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c3160 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 6XjviFpy0_IxANZEtC4X1LlHdaYVgIhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 8c146d62c077..832633a85f1a 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7449,6 +7449,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
 	.gdscs = gcc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_x1e80100_match_table[] = {

-- 
2.54.0

