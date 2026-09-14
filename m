Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A864948CD43
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390194; cv=none; b=WDf06n5Dh8MPiNgkzuASDZPp2pGXIvtqP/zlHXVgD8pc2AsONHkcZ3KiaMgcPNrdh/0z7Omg4VT3qaIKFYfCYqxdTNxmUnDt+9W2Iij/LnIgcJ+yobuRSQO6AfmL6GdCDDkaUC9aoom9JTvkbSYj3xwhxcJvJEGZfuVoNr+cVUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390194; c=relaxed/simple;
	bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIqr2fEqL138Ci/thHZFzFyQ6dMguTyh9avtvddrv3i9F5dwuttEoidynFUbSCKb6tgOJXl4hql2TrRyWEw6kb9huK19DIMaVC9SLvuVz0+byr/1q9/VJpdFYdI7NIEgSkwyTg3YCqF2+wm8pNRUbIvwvOara+D6BvvGk8idu2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hm+ihp5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqvEcCa3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hm+ihp5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqvEcCa3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1rt901881
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=; b=hm+ihp5YLoj/5hca
	rqwVYi0uLQmYL67nD4AucTYfaONHn7ZG/5PaykQGEblkRAseIdFii8PbvywUFTxH
	stSPqr73QAqsJRXjrR38Kfm6fu3TEp82NVwFtpGVc4GIm7ICNQ4AKqP3TT3N8+kR
	zfcOo0OM8RkUCd3VVwMkTBo9dNQ+oloayZ+R3nKH4mqw+1cJKZIay3zqqToE6sGJ
	Ee3rYHLLOycjq2XtTwyJY6GIlKPbmhCIl+4qX/mSx030SusDsELfejgxa8A/1cpT
	1DG15hpWno745YfIR//pCVB2d0b+5YUgKu1niRwEGyZbRXecniH2VVO0FDP88HGk
	5QWskg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrwe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-785827e6073so638970137.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390191; x=1789994991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=LqvEcCa3pMIcvzrVS52l2sg5Nf0H0btxQ18rZO7swk45gOEux+dCZ2ZNt0o9aE7/CR
         8x4jP6Q2N9rxXxFtMngmV7mIz4bIE8AiJh7aXfUyF70AfR7uHZGhlSCnNrNSqiG25oPd
         U+OmnRYYEWiAAcjAAP+aGWN1KVU3XtNzihPH2BsaimdTd7eJBoHvUHwxMTjGhZCqU4Eq
         ox2Rflkaw1mBagnA0NvqsD7jAqzWQ+EBbPetJ1l6ujWfuyI76BWX9UfXztDG8jsPR7JU
         IVzDyv2H4dEkEF9R9bJ0uv4xCIGmllWOW7ze9D9/AOUd2uw+5X412aAg8cOo19SZQqYG
         SBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390191; x=1789994991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=HLgAIbYEjoSPN4i69rRvSS/PvlZMoI09hjFAcsW93tfLCrmLuE7NYc9vQzx1QS4/US
         hASxW1q7H8GQv/sYIXT891XQMaxG8kzenOVha+Xv9lVIroTnyj/WLV4zUcinofAsaVKF
         zGsK8Xxr//iG/p/xzRfUqBPLsXMENEl9ssjjoa11O/JowRFubbacMuH5nPCvFL5kl7Sa
         erQc4av0FT/VloagQsUGG9+2iOFSBYWa7IXlciubjVCvccxrWzXf2KiU0Nj0s1nQzCpW
         JZXuhzHp3HWwvXvRWK7lbcYus+7Ri4svmL9vH3d3WDk1JuwnTfaKou9okW37/11xrMU0
         wPOg==
X-Forwarded-Encrypted: i=1; AKwUvBwKw5BQG+7Nwmfb0XLtDWF62o+hEw/4FrS+UpSV4g+R1rXyPRdsHVF7jpi9WOzGxgtDuL1IOTYIBok=@vger.kernel.org
X-Gm-Message-State: AFuF++nZloRy4OSt3/Py5g5HwHXSHiOmPGD7Fvw5MtxT3ZaUdoUycQx1
	dz523eCNmoRh3XJyRMbfrKBkZzZ26mjghM2h6KytmYCYB/2vVPGiDKtCG9Ba44HOZKBUWm3qIhf
	Yl56aNT1ggu/WGXyHX5dqDnwLbRpEeALNQXL8XswzA4U3Q+LFWNhRkwweqBcGiOQ=
X-Gm-Gg: AYBFou2nVG+oR0j27TzQB5g4Mek01mYP7y8y4A6/HPY2o3DC3V+/4oXxO/dCHq3+6SR
	gHddBsGaawcsPy6VCz4/tbyrtW46GQ+1pOpHcDrNzfUVsQ/jBa4yhNttR9qLySanHaLdMV8a1F9
	LaGNjHHpmN75byfDmv8bwC93XCC2mr2V5nMr5eRma5txhFF8HGO5IE9GqvhnMOTWcnEKE3CCCTD
	vgr/iaX/yPFdUgRac+GEiFFbESm/WOx3zFsnEnHT+HPShMJ1wLE1C/7bqgXmUhqEuY0scxdGfnd
	YrKCRef2O6Sf5ixgLL9nbZDRl+Ty3nzuuma8IN1yslTGtqNHsry+oMkgp0d+q3s3u9/mHkvgKP2
	KXqZYGMYt
X-Received: by 2002:a05:6102:864c:20b0:79b:a93c:145 with SMTP id ada2fe7eead31-79ba93c04a9mr940358137.10.1789390188867;
        Mon, 14 Sep 2026 05:49:48 -0700 (PDT)
X-Received: by 2002:a05:6102:864c:20b0:79b:a93c:145 with SMTP id ada2fe7eead31-79ba93c04a9mr940317137.10.1789390188248;
        Mon, 14 Sep 2026 05:49:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:39 +0300
Subject: [PATCH v4 40/52] arm64: dts: qcom: sar2130p: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-40-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zyj8btO0HBM8VIehJjngivXyJMoOj+61gH+
 X+244+6RvGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8gAKCRAbX0TJAJUV
 Vpl/EAC/bIibMxnZHWWjqFtBD9usJHYqXl3gC/VAhlsvSAZPmyDyqCKYX3hPZii/4w+KyJmFsdX
 m51i07mqsP9L/XY2nt0SOxZ4xDaY9a1neLQN1Tk9nny+XZqfflg9As9Ik7Xd0IGs7boWT5MTbNp
 Lhd0v30JhuhePWfTzPpjh+OmVOSn56iMijhXNme3DnBtxPOx/ujpgt+RCVHIBiVhN2CgzxHGvj8
 wKUHeU7pW4XwP2r83rO/fve3mF72VDEfjMDJVFtHQiHmZNSj+TPDDXv5gccIT29AV15Wuc6Uy/d
 VuJffo/OK6VhLsVPpv/1NMYBHbTv5c/c80pmm1yJa7xznzlD7nklzQch5GpxqrQG/O0GDNyFjVV
 OS+aE7XtMeqE+8mJg97/G3aqV+ns9OQujXfqCxCzNOKMFCC2a2u0w1CQQZ0CgnEkcNmdAF/gyE6
 g1L3rXDnAcU33FlLPPcyZh+tqvj16A28JimgwqW8qCaKIbIK9T4WxgiqVmtg0uLVqUBdt6mC+E+
 tTqwly2Coik1N48wYW4plhaJtnR9Em0ao2CsHqByLteJ6UUT7JJhUmNgn+Jzr1e5F36hM3PFtOr
 WnVAFnx0po4ixdYYEqptMPSswAQgtQ59OAF4lRjb6iGoriX4ji7+kkgzY1ghnL1wSV3WzFQ/GXy
 /bulBhBera07mTA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: INZCs6w8WBCsHXavYo0r3BNh9ABsFvdq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+b+XMnIYAOxW
 NiotBdxW7zo2fZiczfbByh5SPn55rwOPeiiRFSrMp0lnbkgbGg4edA3cmAZ4tlM755H+/o1xRVz
 K/pxg2W8yqA+2uvjLdZbeLzrVCS5sQ4=
X-Proofpoint-GUID: INZCs6w8WBCsHXavYo0r3BNh9ABsFvdq
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7ed6f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2BCtCwsD52Pa
 LJVhUymtpVgCIdN0jLQgIzsBGoOizfYp+9GAZea/I1vAN/S8qI2XnwVQGeNFWMw2jTIFdyA2ow+
 fwIpohWMjSxXwF/FHWve6mgnNOPBkoLcIFUD/7q3tixEc+5gwp1PeKEPuwTbf6wmVrEWQ3YYbrI
 MVO4KCHmlH8ZooKIiF39sZLfm9CxvMDLgl96a7kqAiP4r+eArTA36LOLpnSq3GYwtDzqFUFqtiH
 dffz95Y0ug7B2/t9uUyNpDSKhVJkCRjpvEbJiKhGqfjxwtYXPrp++SMqOlGyme2EWS58h0IhxVn
 DXl21J02Qk14jhg9x8iZcXLneEN2whHcnHt6vFVYxFkKSdYLdtQgPlOSBGK3oxnRJZJf0KHlKmX
 U93GurGkfnrw2OKbxYZBeg80tYMUqtXt9liIIKjL+edf5goNSMKj6v31Pq3pFwykGyQDhjQpUqo
 JTDtDMM2SFHt3mL9Fhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SAR2130P are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 2ecead79806c..ceeb9c47093e 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -474,6 +474,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

