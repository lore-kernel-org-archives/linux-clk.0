Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE84DBD61
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554575; cv=none; b=Jg2LS/GsUuucndiboM60WgRXgqyuTkwQjw3pR9IRkqdUevDGCY6Rwhgyu4LAVW1oU1GFRraFi9JHF2T9V/1tXIuoMdYZqN5ze3BfWqJqhhC6YqPR1LFHRwVt1ifUAFi/AtSyxD7YwDA3ORfPSAdK39YPDEPtXZoe+66qdZQNlFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554575; c=relaxed/simple;
	bh=f5Cdf+5sSRQr5GkLyAwVmLKPgMj8336Q2vryy4mWj+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VF0vs+cbA1zlcpxbcl+KT3jY7ZoLqwuN7Rb6cmLVtJLtDfac4ky3heJEqAccmT6mQG60wy3mSK+6PB8nuQ8rxtS7QEfrsZ2+t8VWoiXEmndLHGjSka+UXDLBnxH/GMtt4NNnrYqkCW92zqDwE4C/lhs56QtNOCooLI9kWHY1Zf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw9pSlhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3pGayZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw9pSlhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3pGayZu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92g3Q2348139
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	13UuE5xNHYGpc6mLMUjVrBiPgoulPDJ7WfxYCtDapwU=; b=Iw9pSlhgQoYTrkd7
	KHcZl/ViGuM992BIr7DlHnJdftc0QLHRXeim1gBESUE8Hxu+WjaHFTl36VtpH/Vz
	Affk8du1HDM7iOCyFRGe4YpLZKACk2m3RNzkaAc1UcTINNOXPSd46ZsEQk6taHAd
	YtQUGn56YWiRtBkXZ9LU4y0xEoXaEkwph6vRku2z1Iq5tKUkC2uMfTLkbfvMK1fk
	qagwE+GQ96Ww1NHq/FXTZqfyjRfsGQXIqai2MAx7VR9Jt9uLEh1jtFKzZVJNQVPI
	FF6YbqaFhXgE+XCxPRJCCm3G0gMbKM+H4f3OzQ8XOue1hzbfYprLvAOfx8q1QRgD
	AdIvRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso834902385a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554566; x=1790159366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13UuE5xNHYGpc6mLMUjVrBiPgoulPDJ7WfxYCtDapwU=;
        b=V3pGayZuCOU1wLWnmEEWi2Y8izX4xMZ30E1lv98SgCJlni2H9vvxJdeNe+yaZZlT3M
         mwDyBPMF98NjesxeZZyrO5WA5vcZJc82/+I74QbcJXFTKo3DeDfRKCxLTO0qLRNbHpvC
         OT92Yy3I/ZQHTDgJNxu02gqIKLJdciX2JiW8bwq6Go/HIdoiC/Sd0YbQBk2XncSpylaR
         oUaKoe+7r04IqUdZCKTyIFbygXhyA0ltqJzRqYmfkIHM4XxKK707Zfgqe9yXC4dlAfun
         xCwe8dc+9xeTCwkEraiX/HN/3+O9kNM058P2UsqUg4/fJUfCugN8MLr0NEC6gZGn4hDJ
         AejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554566; x=1790159366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13UuE5xNHYGpc6mLMUjVrBiPgoulPDJ7WfxYCtDapwU=;
        b=JY1NtMLlicfZE0wZ1VaVNt2D5YGgbDeD2VqJLJmq/a9GdNFFG/iJHD+4vEhTgkZhhy
         MIYvyFfWxqOTA8L6uo13Lvgs+sBHWDzippcdGkxqXQayYonEndIb1SycmW6Zxn/bW0m7
         a6nhapnI2Vvpoo8UQV06mv7uU9Don6Nq/5AVjtftZ0JmfxrvgobXpNvM3bVw62IbrrVe
         vBkYqpu7CRiO6qH5hQlCx1w9qZWfNU0LLC3hcgXtmLCc696iW27vfcan/02l/1Ym4umq
         6xAEHqebQbb86gqDBvUWwVC9on/ay3+3kEpcBQajstjKBieRC8RuZnhpWQQaVhrkTyO3
         aq2A==
X-Forwarded-Encrypted: i=1; AKwUvBxa6rZAzJ+mcPABODq+NyIj/w0ZqCetqrH99zaPar/5grvQSYI6AYSmB6f0Bo2Cmlv/II/Sjjfvr0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mFNdTAsM+w9AaR9BHbUSN9yhQBFsdutloPsQUsMAV6W6NaJNPT
	Bzns3ystOfcIlScEIpKlc0XzrjyqW2oqzlG7dKUpB+RghPTZwqflrSmdlOd8apTzGerpOThRjum
	GbALgLdmbKoELUyMXOVulBdU++ixU1suJgNgkRiXEZylL0JyalH6W/qM+rPskYco=
X-Gm-Gg: AYBFou0gTlot03nCpcMJIhw+NYLows7RrQloLlWdo4/4znw8CM3d2OIJbH/NofputwW
	sJLmb4sgS5P9NcMwNGymb55q/7UbVMql/jt8nJHKUSFjZAWr+FOLmyHZWS87zVmW5voe2OFvKz9
	UL7CRxGd3bgZ619vkdLkVx0iukHHLze5NVnfSSGXVLN+DX7ZsLdRUCn1H8MBdP6niw80ll7xAH0
	Seh2VUyCUG0K+/rUKgdZUwUkyqmGGbO1UA6wIZLvGetJ6fEyf0vL/eUV6Gv2dA1T+7llZIwXJw2
	PoR15rWUwCUVysaI8CgjYsaKXGI4F0zQZefQOg0TnjSYNoo55bDIovnWYGFLw8fboWS3pJ4LGzd
	NH3n+zpk=
X-Received: by 2002:a05:620a:2788:b0:930:9585:e08e with SMTP id af79cd13be357-93bb76ba93cmr329223085a.10.1789554566231;
        Wed, 16 Sep 2026 03:29:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:930:9585:e08e with SMTP id af79cd13be357-93bb76ba93cmr329217585a.10.1789554565636;
        Wed, 16 Sep 2026 03:29:25 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:21 +0300
Subject: [PATCH 05/48] clk: qcom: dispcc-sc7280: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-5-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=f5Cdf+5sSRQr5GkLyAwVmLKPgMj8336Q2vryy4mWj+g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9P2gsX20GE7BTjKPh3TzFlqRupdupLo4Dtw
 90Tm+hzc4iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvTwAKCRAbX0TJAJUV
 Vm5wEACPkc3Lu/WtosbVB/YKp78qYxejHQ0r8AGoGiAsZgBS0CNE2hmX5FooJEp2AY0VMNTYt6h
 VfU+zmIBY9LmZGhgTQPZP+emI4xa566LYj04OeHqHG48xLT2LCBvEOQNpMSjoFm1tj14CYVJ6qg
 MkpJJFbEzCwqLs96MjpxxgSyQRFhcnN7czGb4zhemnBCgpY3V3c3eix2WqGTUKlieEKm5QqUcfz
 vsUDcAti67yovxLhbJUY075bckxI7Cnekowc3quDOlXCqPSRTjuPPd0rxoRg4fAK8ixPzvMCihU
 h2zB7PZ67JZ0iohTU2GIcOtI0+fRU8uU6jNTBeq9foXULigl27Ke3w6JTrVC2NQBe1q0Z/oXnwg
 1UyLmi2oK9xmsMJfqvptAerjGHi+NlDSVS7C5fw9dXpVJo/11Df8l9/D32HglcIa/uWmv89ey8r
 2PtVSy/4WI5RVizvPdqPA+xd2bSJV3o9xEVNyWaueR2/FTE8nq+6PO6MY12rWnURAycABWrG7Il
 8LHgyVZxDK/99LA6Qu6meDhJmXV09/unlBEYundsp7uo4tGWhmInf6e7EsDzMnvdnH7UPxkO9h4
 pdclSy+MT0cBbajANQ6tPKPVtue72aLeWdHrFuf42WrcrS+UP7IcvxMloOfXD5Q8zINT7yCzIys
 upYVnDe0DEiJxgA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: yyltQhVdYQbRtcZ7S6k2secYWjrX6o8-
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6f87 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_TElPO2WjJGltpybzhUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX9gXq4HH73MlX
 bXCZy4TCLrWHE4Jbi6bLjmNLVd8Tue1/dgAw1YVkMpUz76nMvBy0OIfZ2qBFaFak6aJPCJ+muoW
 1VIaCwpinQYXUfLIUjy+/jrdQh2UqO/q8YQQPqCBBG8+GA1JPU8u+mddqSQrZOAdVoELKunXWyS
 GlIjOoRxHNd6rp5WffOrd3CeowKIh45urqOLnAxZcox9QSgvaRx4YX0ZiGPgQeBE+2C7uNIHB4E
 dIlxOyOIYQ/wxP3TPsV9yeJfyu//MImhabUCNjXCHY9ouNAoKWRDE1025p8y/cS80mkiQEQ78Qp
 4lAMDFcwFptnkM7q7Kr36Unvnvhuc3InW/KXUOh9T7kvKw4SomnQ0bleRsK5A6fo5rack96glmW
 oyxGdx+AftrY9jU5LNn6YExgVwlvSr/uH6eYoJghLJPEUT06da/5uVSU81g/RJpCxrxS0a06Z5G
 OtnvCoQmeKWQQ1IsBQQ==
X-Proofpoint-ORIG-GUID: yyltQhVdYQbRtcZ7S6k2secYWjrX6o8-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXyWuj5orocGou
 oKi8I9cujb8Mx8KoqLByXZZocD7yfFHjDDiVHME+zQ0QiwOK0JVHOjX/0QrW2ziZKhid2K1Q1Ok
 koLPz385R9h/b3P2IbWHq2W/eYTcyi8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sc7280.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index d11265debaf9..24a65cbb1ecf 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -860,7 +860,17 @@ static const struct regmap_config disp_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sc7280_critical_cbcrs[] = {
+	0x5008, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sc7280_driver_data = {
+	.clk_cbcrs = disp_cc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sc7280_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sc7280_desc = {
+	.driver_data = &disp_cc_sc7280_driver_data,
 	.config = &disp_cc_sc7280_regmap_config,
 	.clks = disp_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sc7280_clocks),
@@ -886,9 +896,6 @@ static int disp_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x5008); /* DISP_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sc7280_desc, regmap);
 }
 

-- 
2.54.0

