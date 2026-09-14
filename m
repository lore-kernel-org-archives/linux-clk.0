Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81DF481241
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390152; cv=none; b=Ioacp0fT4wz5g8JZKaqV+7RD0E+IPQj1Fw+1UsG+bPIbNyFzYxbeZpc/+NzEJXuK4WBi2IjiFEDgR8Y13eqHdBFITjBGFmt/a66987H7QjCySxfS25IlAoye/lEOQWD0fcjNfeRiLouDFBtqm/i3upIEXa4cRoJwQyTKe1PSxls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390152; c=relaxed/simple;
	bh=0KiiHZTi/qlr8qqnehNkibdGn4Of38rmmw2GrafGWVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fajZLrqBEuhzQ50D7DLry0tqD8ilp/2iXCCHVwepsJOCtGa2AbjprMrauWiNdkapqDYKCuPH7JdIpFiqyin7vYwXLX5V/g1GpONLCxzWJfH71OjpSONpthgWA1pTn7uuJeRwzmAeCbp/aH3oiP/e6orlRXG+ga9XsVYe3LdpyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClexxJ7R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Crdpv2aB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClexxJ7R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Crdpv2aB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMwN4032520
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=; b=ClexxJ7RMEObehna
	4apQR9V/N4vMZkqziVoTWoAfPdGiOj1yImKIRuLPOLBguHmFOCoxRReNnvx0m6dc
	KSrlc/z7IdZUa+0mNWPFcZiYlT45KLTiWp0JS/89Bcfi5zVl2nvVZqwjUhAP6aJz
	WfATFiPXMDW/cIdioLla07LwBOOGENPx0+rPvh0qWBaCRHgU2zbYthv9Dhu7oQC/
	fzegqFLOqdxPWnE9zieeZOhjlzJ8Zd9t03pJ2VBS/HCLr0EZhB9zsDdSobxOgNnR
	czLC17P28gahvDk0WEdgh4VKlYHbGgzNl41pyh42e9xcIz4DmJfS1pHf6VUqfxpD
	bt1lVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8kqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so499616685a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390149; x=1789994949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=;
        b=Crdpv2aBPy67XsvQCTzqbnkSBTrPyzVAcEYd9nwqHJhI8w57PXs7hXq1qdtA7FJxVc
         NV0Eqs4eJkMZGsRUIjK1PLl/EhuD0X3qPwT6F6PxxvrChSe8FE00Yfy4HgQoJReeBK7K
         5VIFg8I/bvE9dtWXxOGIHLwYXsAvsBTpr1sEg0Ey1Dmni9eiK/aHhWmRdoLwTHQiNftT
         rhFxI8pKnYKOAsq2yx2Wh0SVMoJsXk9q3ZAtKyM9fX8rQp3h/ftRmfuSDlcgQiU9sxR0
         XLmQDGpGMa7s2v2fDGpePIuRimsNbBTDuShFcJzkYFlrn3t/yMC/rLzJDcqTWcoa/Oak
         hM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390149; x=1789994949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=;
        b=DrRt+Q8HHYCBer8cWLFzMf4+yi2sinJ5aauzvD6vE/kZSyWIODq++FdLbkvcJJGXOo
         PEck5P8tL8/Ek1/+ttBtEAyrVNs1Io8sN5cP66sPYU5xJaLYotHERfk3LsOL5riiswa/
         vVvAUYGrD1BTzwBpz/uqGCK1/nCnUM5bxhzHQbO/ieDKDjVigLh48NnGPGxITBgA1sLk
         9iwLvARNPTXz30SYQRogaJ2A0sVcoEJ53p/ZbNM4YeMgHkKoWS8HeFoDQMNMEt9mu+WZ
         0UrCzHKikYYMUo5V5dF8spe8dYkGdhd7o7fr327pDZJZnMlIYI6UP5daBndJEI3g++D3
         kS0g==
X-Forwarded-Encrypted: i=1; AKwUvByyK/uuwF1+Xzm6sQpC3nAUilrz6eMTA8RWgtmsIc9qZ+YP7phUGiOY3gJcgpiurywILxOg7dYr4T4=@vger.kernel.org
X-Gm-Message-State: AFuF++km3MHKsAkvOH2Fr7wrUNOzSyrnCzUPVf590eHzs+OgiTIgwiVt
	1TN3xwUCeIJKqga07EeN4FcTCQvnLUmtVvBsYWAskjI76iaArBlkzvf4sE+8LiE3KKIRqJ4zuJW
	fd0IgudKmZu2Ndq6pOokuVgccI5uJVQnrn0+kSxGDFOSwEkgtFr4XuZPfmKpAMPI=
X-Gm-Gg: AYBFou0vSa80YhELpwkmT2aH6ETGGUDLcevGgAEgC+i8mN8uqDlAd1CGpakVUvtmrdM
	W1HRUJ9W5NqjuG5BQq3NqvuDGv4kxw1ERQqNlqPGvPD4BAhX2fBLonhN+dBaQfmu6EQyn92qFk3
	Mel0fYCCCV5o85G3gLD5Rm3y1TrEctcxg+sQpB7RCo+TRD3z8NnrcF0zdsTNpa2gZrdENvynXGq
	L611yBgAi73S9QD8y4bat6Q3V/fMBUlrULhMOQTxc6vbstSizgvsxSfukZbm2VOfyL+R3EvecFT
	O7PuM901zx/q5RW7JDL3Y/YLd2jr4KDa3GXt6N7j0ZB7TpxxX6eMvvG1ReGQf4tMiPJhNTyE78a
	jau4Zg7Ny
X-Received: by 2002:a05:620a:4111:b0:936:af9f:4c30 with SMTP id af79cd13be357-93a29996c2amr336846485a.25.1789390149168;
        Mon, 14 Sep 2026 05:49:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4111:b0:936:af9f:4c30 with SMTP id af79cd13be357-93a29996c2amr336840185a.25.1789390148598;
        Mon, 14 Sep 2026 05:49:08 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:24 +0300
Subject: [PATCH v4 25/52] clk: qcom: gcc-sdm845: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-25-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0KiiHZTi/qlr8qqnehNkibdGn4Of38rmmw2GrafGWVY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zjtQproKSTFdsa5ICvAPgZUrcCb1sxJKC1x
 G8D06fMFzCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs4wAKCRAbX0TJAJUV
 VqfvD/9uu8WONs3lZTiPPtq1taaj76EWB8UIRJ6MAwR/rz8ZV6QCQbvC7Z8Efh5luhSmewATN/F
 EHb6U/UlKOFGR7EpHsUND21zaKhFT4Acz1c27UQ1RYv/Ynji7Fzl+S9kJ2XDOet1I69f9/IWfa3
 4Bajm1XVx1HsjqJfMa/EHW7ZqJ21k1fjCb6VA+J2bOm7iPtmEgjS0vuNsf6obaSAupXq3qbPIEl
 IKBGf1MXHprPi1aYyfNtbfIP14qGTL2ZPWLVbnPgRN8zWakedmfOcwY9fH+S77fbw74p/1hgG6+
 EISRzI/l2Vx2R573AtLst0Dkoo+GvcSY+5QvYdSlVXMg9OIieIDHlaHs0PyDr0o8tmRlDU3lR2P
 LshqqIXv3hh6ZVX625vjTzO3crupPwcGkJM7CB89Igcaw7ocKlqv0z97hyzZ0GbF7nCKWirH6zE
 f7YZQqLK7WCUxQEm7mK6EWimeecCkLjcKTMxJZabW551LL5reR885XI8L3XQT8Mujm6seg6sK/m
 dSVltYi8NQWh4NCnRZISE7tSal96jQzHuLRvNM0r4hORYcqK0uRSm8efZg72qrMkarLDgs7K5E0
 pYFM6k8ZdQUm/SuJzpifR4PRyyz/1l/7dd41NPd+xf/Xrh5R+LtzdRa7YvFSy3UajiDwpCOxohI
 zo5qpaw9gDdyTcA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXz6LHsSHFDi1F
 TUkVh3EqqOyCcEW9h2jqw703wDaJRqSZMsSa2GsBAcxTnlJ9WWJYlcZfycQaDKeAb22PSghIhyn
 vu8tRp9ATPZGXqGPaAbjL9hh5Up0EF9FV+5pGbnA/CTCogm0iNuFBG2VsDL4AEUr297f0LDKBoF
 aqwuKAIm4iu/SocB5r+DauEIe8wd1Xd7zwBlsJDPsbqyo298ZuSC6s/qjqgPUDeZDZnVLWNteet
 wg6VzQCu/EOGPmJnu0y4m9N7Iwhy/wR1eEY5R8FB3Ugr2iaIFDeVr2gQcoWX+uCFMnxdcP02dR8
 n8bHPdgHnsAlxKg6e1m+jmWSvDR+xh1Utk3OEKg7GsWTGGoQxSeD8OwQdT7Lr5sKNyBpH5kSE4h
 DBvoUc44HB/UeVX3AzQHu3nTrxFZbG/dzpw/OoDonVfpPminVrGdiojYF0/eJz0YfVMsoVu1x8w
 oSwgSAszYjzrkz9HdFQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed46 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: RhRmWWZiroKNN7xXzQcAqYXPEvO3HUul
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6FFXlHMcStSc
 ZPyJnl2/ewAqETaWFAbvajp731fuhhDY32tSoX4P5gnAdlTgKmMh8zXbV+5RYcIa2qa9DLOl2Hp
 3ave/aP7Mldfe3f1AzFOBNW9pV9f5Ro=
X-Proofpoint-GUID: RhRmWWZiroKNN7xXzQcAqYXPEvO3HUul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 57d54b45fa52..cde863dcf185 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3959,6 +3959,7 @@ static const struct qcom_cc_desc gcc_sdm845_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdm845_resets),
 	.gdscs = gcc_sdm845_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdm845_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sdm845_match_table[] = {

-- 
2.54.0

