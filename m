Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6981C4746D8
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390212; cv=none; b=hs7H0r1aAKUOp2hwV34YV9oK2+pLmMkijLsMlskSbugN5pZ7nHAvU9SGbme44/NA3cWC9yPDgJbAATNjV6Up6AMVO2ICbUrro4iRu6qadZuvGj5sWg0TfSPf4aXFbIGWRvVPTDKnZ/4GtecGbw24ewaOizy27b5adxU0Ih0KO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390212; c=relaxed/simple;
	bh=yAGUlki6+T8DTlbLkETXY1t3zk+zRPEGo61GpAO/KKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dX8GA32lk46jPDKrERtYnj33VjGyNc/73QXAh6G7b2uvEwvWf0nrG2+fh0VxdYvdnysQHaX9nSWFa0Y+lmDRvLlgedNmhaqxbEAn2Y8sqaFr10iwSqwfPUhfbRuyz45bvVfVWrnbVpKLkOpSS0IfvIo20G69fZVEQPfIGnzHALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UThDtpCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsI22B7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UThDtpCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsI22B7w"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6Eq3793274
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=; b=UThDtpCPn11DEbHD
	CA3E6xkYVhQVyKk7N2FS14NYkoRUfz+V7HWlx2c5J2+nobIDuJZrWd8+DA0SYOkH
	GhrVgDHpwWBkeyjMmVxTzDPFLGyLWwqEdQtYBltpJ1hVo5gRvgXileVcQdruCZvn
	5A1BtyqR1aoo7JtfCQVAFGmWwaIzIgDI7xy55cygsrZWtv3XD4+FrjEFwWqrHApl
	9OctEYJMumIh48BiZYjj/Wp0j7Q89W7l7Rxl843KenKvhBSQfQX6vDFQg0DSTtpW
	L7/ETj0Lwe8WhSiGNpP+YEpt3H/y4TncTrUVDs9h4xxbsMtPPcntdbWNMAa9FMnS
	A19fXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg161q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so850152585a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390208; x=1789995008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=;
        b=XsI22B7wCsn4wDnYUbGSBG09/5MM2oLDZE2catLJi3xZtpuLECJTy10zZbdmC/WfKR
         erENkZJY+WWbQCNBU3E58MupMm8I8sIZrVBM76yWCxF3cVmdPMH+Xps/gqAJX8dvCsFF
         dh3dSrFSFrqueMe3g7hamgY6HUrSCqpOeU086T31I76SNpZvViQvfj20Nb5XGExsMwa+
         jXDvYfDeIew6kU024ZeBVbmDoRCiCgjnvFC0jxx43BzodyL5vhVBbUZiHPQcVJYyksXW
         TRxRkBa4jBGCfQrjqdnmjVCMrpiuqIg0Rij4WwDMp5sFhs/HusHIJb/HB/8FyTNzstQB
         YiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390208; x=1789995008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=;
        b=MISvhFU82eJ1vNS47+Sp6gT5/iLTKvGunEMc73XUcFiLt4TlHYa4ieHuKPAvDEwiLk
         Vf8yVQbjXDrkcwqu8yiiPbK+zFxb8se8X6TAneJj8nkcEb9hA3T95/0A8tEo2S1pQVc7
         pwlISYgxHz5pXo61b7ABHrRe5VTvE0pvQlfZs17POQHCyd/YwV49xQV1pLlZ0TDtgiJR
         qofn6mHlC6Nr+uDscU6yh8+m9JH6VGS3U2vx6ZvN8XxXCis1cYLgsbAutXuPpjFotNSa
         iFQhDVadTxSNrOuZSUMGVQYKgxeU24csz5kDiieT90OlEOJxSRyjjZEWMYLGCJNfU1Mq
         ZNoA==
X-Forwarded-Encrypted: i=1; AKwUvBxjVGUAtwAepoSsMr9/w0YNXXz0XJYBIjvzw8o4+v66EsUabHsdcUgXvrux1MykquGBbUWzr6Fq+CQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mF3eBIyPsNOeWJy2hSHH5hjCAVxHTzR12mapguekFhBpn/gZob
	du19Wk3xxNoW0o6lGW4ySSvRjeAkVnViowzkEU5s+hAKeExPHc2j/zES/YOm/T1qG3VQUqsefHm
	mmSBphDfZMT67iICjQETU1ehhFGgA7oe+n0FWDJg/Lj0umRm9qNvUwXHaQ/MB4F0=
X-Gm-Gg: AYBFou3OzIcPD1w0CuFrWi3zxDP4TUB5Rhm36gnyTqv4esTlq/oLDPst8dW2ZMmhMtX
	/MrEK3yDhEKIXCrwcEj/ZlPFdhs+E5jdS6WTuZftORvHDKzV/k6DNQqb/e/K06RdxUBvKATI1JS
	BMVon9oYQNQv6JN6n9txfTIA0rWralH9EUAxV8PIVx+Tbc7VTSuIaeZYxqAPlPLSnUrcj/wGGfD
	sYVqO0yZ+ALNWGfHT7I1vQj3TZ8XWTiWNxQw7AN0AM5Vs+R9DhGrnSkpk9gO8ClaExQlVpXQQrc
	FvA2F9R1uy8uhdYguKv4QH93dswaizhP8weDCEheje8gQqg/87vXad2jKepYLvLiq9ITR+yO5Qv
	wjnA6ZHjB
X-Received: by 2002:a05:620a:6017:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93a18771eacmr657281385a.35.1789390207431;
        Mon, 14 Sep 2026 05:50:07 -0700 (PDT)
X-Received: by 2002:a05:620a:6017:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93a18771eacmr657276385a.35.1789390206863;
        Mon, 14 Sep 2026 05:50:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:46 +0300
Subject: [PATCH v4 47/52] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-47-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yAGUlki6+T8DTlbLkETXY1t3zk+zRPEGo61GpAO/KKM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z54Sqok4JzjaNvDnlN4cbUgr5ZThrbmwOmT
 qCPZPNTRHKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs+QAKCRAbX0TJAJUV
 VpF5EACAzrnZ/QONcpJy6uuYSFpcAiOscLPoo9tKHH9m1Had8EISOl66hB9QbcKT9tHCO1+PsYg
 aAta7U7rILWqGU15xzAlUQ4AwwBBaYV9UktidAl7V1DPmfPAVpmqLYif1OCaBsDV4/KAxwEPpki
 tFPVP6yav92qy0uCkbkxjPJW+b6bFPMVhZ0wNgZK8JrvrWPZkhGeKsrodFymZYKvA6gPEzG9Wo7
 FFRmnKAiwLrt8ejiWTliw5hpG/Yj51DGv4T4qsKZI2umkcLvwa+zam7pTSfE/yQjQiNxjnRMYxH
 rhVc6E8r/5ZblnTgAnAKn3ThQdrl7peHRX8OdbolehvBhukRosOHYdUFARMmWYE5lEFwOgJR0xw
 IwxiAqxLCqTNKu85i19tPUDSrDFznZVIp+XEFpXmdFevXQJSLolwewhP3hsvEPcwFN+ZOgNsBnV
 yGJ/kv0vX/FAT2TKSSnFLtSKQfX/wmj4NHwbsd1EE8yYxqfwrZMMhSKEOrkE3mOXratXs7k6s4r
 CNxnRRPxPMmhOG4gKG+WDU4wtDT6risf2KNsuFDZNRlA4K0PqqTAnWvdPWjnif9I8b8dC7JXfSk
 SrneAK0w4j/2K0R1Ds47rKpP/iWxphzXexlUdk+nTjPwTOsJnNvAh1U3KlWaHKc7FSCLSZ0DdVZ
 UdiqVklmJKhwrYg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed80 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: e7UXinXLPxD3Klfh81nQ66b5ecwzgPxP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXyNju4Y5Ue5b8
 DxKvYv1OO1YFfmTi3ySstlRrR9FWx/FLVYTTCQ/GShL5XRMj7+64rGL22giHTJBzdaZ1Vk7BEzi
 hluYw9CN+uCyjPeAmaeSQAJpbnGHwgg=
X-Proofpoint-GUID: e7UXinXLPxD3Klfh81nQ66b5ecwzgPxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+EDxMsGJfOyz
 NYZC7FD2UAwes/gclPF7c5DNYdVUqDAVwtprv4DX+zEs7wSiziKTc/y3IfqoG4cE7p0toHaT9WL
 RS49NY1GpDhnVkUuuMpWUVe9HAWYwhPA1biLda2ncZe2z0/A/BH/YMnpEF1C7krPFdWT4cl+th+
 iinvziHDkUAjYECDw4fHkxS7J4k/VTHMhjsEN79JKFMC5h3633TrE6uX3Fzz4AtSm0LYD4WUB+5
 bTe1+YBZGvGerW58gNU7jBy3HUj+q6W3eNVYHkZfTg+s4H6qWUtU2uEn+FdORDFv+KfmeiFX4Ef
 FzN5nTVZ9DdlJnQ+Ztzx3qZBsHI6tRRRE80fjJo24/3Ik+ar9/b32Azk1aGiBBTfV6b8uTs3H4z
 TQD2OJxOijQjsndDO/kxnheOzVc6NxToaQHLZ/2VyoWxIxtCUQdVKZcEmCZCaxAGO0y04RaRKSR
 tpI1vyLsMuyAx0OxeHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 100faea925a3..2a7c6621ece2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -698,6 +698,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

