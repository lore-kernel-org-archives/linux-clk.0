Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC02477980
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246468; cv=none; b=boU4XHvxBbKfFgvQDFU3I0N9zyT/3eewN8q9KZDuLM3vSFnf+QoeSbw4Xf2Lde27ZJcN5BJba2G4DfW+L2BUa5XI7d6w1SGc1U1wQKDgqMf5PxNqlslmbBCuio5WJIpNfrFrSnCAjNYZuhkxeXpayRkWXwlx85xkBhne9z7yg6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246468; c=relaxed/simple;
	bh=OdvW2kO+ne2V0AbTspE+dP+nW/7OB67iT9aRxVfr6dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJEal0fXoy90+1YKCMyYtU3FQaxGll6gzaQEucdfBBfqYT/mtJkKTm72arDo33KwgF7e5zY/bqYDJSkPHjWrt7SbZoX7XWW8DJAFaGpIaiAoMzGFFwsP0pyyJrpAy20Y9a/lJpXmVK5ZennP7m0Rm119+320frNsLeVBIxYbG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmyyiZwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8syrnZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmyyiZwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8syrnZK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA6Adm2333155
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A95+MKNcb5gyk8D26qBLLalNkTa5JC36cRtvGtEX0H4=; b=CmyyiZwP2gxwl045
	B1ysrsWyCr30D02lIHs6YidS7jfY9PgWiBBXH6tI+Y9S82H9pvozfvKTM2hbkgI/
	IHkFwnEkuQOU478feIZgb4OFH3drwbaPrItIHz8AHzD39az3zvKkOAKXaVclcQJU
	mAA/a0rTF3vXA4JeAkAO/+vBfgiHgnMohHfCazWk/GfwePhVFbeYY/mB0HqOX4X0
	JAYR1Di186cgC83+2hH+UFX0aGS9tS9O4AuDEQekh+TxxiVDbJwWQ2s3buZ9ZjT9
	A9Fe0oHyyy+xCniRi9XMkbpFVrr4c70tgQ8feAIxK2nDnjtyxYUzDHhqkNMpSrTU
	wZISig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjg3xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a183a0e93so389734885a.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246464; x=1790851264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A95+MKNcb5gyk8D26qBLLalNkTa5JC36cRtvGtEX0H4=;
        b=d8syrnZKny9zzm8JERwin/HdLPUOhH5pFV9V3Ulm3+YlMKn8D50CBhto0DnP18vNe2
         mWWX79RAC7Tn77PD6HhAGueCHDAcTyhOOwkZVBwO39WOR4B8xDmFHRO0fuU4zbGQxhiR
         biEAxx4ge8tAMdGmMc0iMVuBJOYTgj4XRx3lqKbiG6GKgaVkuGu1bdArByqGnBkCuuAZ
         UFhMtidJelHxc0AR29Ip6lWJbJMUOeJ/+eq+oCIVcxTCLUJKOdpDwmE30L8nXGX7EXaE
         4iSCWprzQXmNVq/OVCGwZ3qIP7jJ9B2Knc2ZZMcn/6zbK6ojl6ojyde4mqw8SAGSR81Y
         1S3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246464; x=1790851264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A95+MKNcb5gyk8D26qBLLalNkTa5JC36cRtvGtEX0H4=;
        b=QVD3/bZ3a8S0UPmnz/qntVXydg5tfutWYmX+2709b+hzqHnYO4mCEkw+pnPN2zshYt
         /OnSRv3HtTcCMkOoDqJORV1EJSpuhtVfMGDnAAWcN/PHye9pxYfWRBG9ICLDA5TGZUtu
         woWlQLnonb4mgZyMiRDxdLVL61JqclESbiPf5lJx/XI6rYPIhbHON/73iI6eHV3U4pak
         N9RtZRRCFMpuL55BLi5hzDwFrKNKM98Ox448MOXrxAlGAuLxso1fH3iJL74CC7yXr62Z
         ViPHjaLv9yu3UwUKvPwjNxU6a1FiAVio2sw1Je+Roc8Jj0Q8PCdwfw/KtK6QV8CV+OUO
         34dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVi5r6RHpBMCGOScoUxDhSknzONck+XY81EcyuPILXF9XTpJApqOtqgMg+D8aWOtJ5y5xnulIxxBI=@vger.kernel.org
X-Gm-Message-State: AFuF++lrd0d8vrCtMvvvSj3vN4PZv22UiPS2f9GDbHhmIiaPO10sroEd
	2zR5uwJwJUmc72G26mFpXkQOJ8YL0DTDs2GLnB79+8n88NZdhzh18LyGEGWf8Tdrekxyv3jn9By
	xYZPPI4iISVnZTJC9R1jq98yFj463eTwgYvWyuVZPqwj56mwJOa8d+XFCf3WmxH4=
X-Gm-Gg: AYBFou2oDWe2LVfzxzoYkQQFjqJW9IVg420x0vbZwmywNPigNYr2T/m4DT8QY8ijryW
	5rRq2WhuzwrOMCOWVXr/anMfUrghT25XeqCT7DUaYoVT65Y+gGiwfJ3WdZq8VTSTHn1r53U+iIO
	H72VyA9tvS5xy8Qb/E44CGae/fY1+9ShHM68KMNp2PyEoXjSH1ijhvF6lLbW285GumUSbJbHX6p
	jk/9ug6I0XcVFj/ZpO2QhYsH5gaKuLO5Ag2x6J1aSW2MAqsyB8HodVM8BlPN6GeSQtgCK84eKgl
	IrF1m+pnkSb5iDfIynkUKXg+LT/4aZdaweWxhYLaQKQxfO7DRsEQOCbtLu5d4n+4774DTcHULr+
	nRxfgOc+i
X-Received: by 2002:a05:620a:4002:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93c36403fe8mr214272285a.62.1790246463822;
        Thu, 24 Sep 2026 03:41:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93c36403fe8mr214266985a.62.1790246463268;
        Thu, 24 Sep 2026 03:41:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:35 +0300
Subject: [PATCH v5 19/42] clk: qcom: gcc-sc7280: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-19-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OdvW2kO+ne2V0AbTspE+dP+nW/7OB67iT9aRxVfr6dU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3sTPGtNR0rCxG+BfDjSV2lH0vCQreilbQdC
 01lxOuk/12JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT97AAKCRAbX0TJAJUV
 VsBED/9kH60c5lYnlYeuyGI/7ep3n+JitG8nDqe2dBjyVRxfFApC/6+Fq041Mi54QIfM040cpVO
 lFYhHGmpdo/l473+oYmyfLNU/UU0+ljCD2PK08q+xbi7oz2VTXooEWLAykxkKGfdk0UOunlZxGd
 Jyqc7e+URxe7JPJfciJinLDEoU5WbJ1Er/wdKYJ0ZkCQXj0Oynh1j9htYZohldaP08jErA1v6cx
 wWKm2P/2vW5rrsbRJ3ZN8f28V1PxoOVY2jpG1M4xyrUUlGb4rm9MtwdBc8dHeJWBLkK4iQLaEU7
 Xk7EW09r3xY3+uEuqVwkf7dAWzGci7T0rC1LQL/KhdUwj3QjkMfJcUvW8m2Q1YDG9x5ANpIhr9m
 llFu7DsBOepwoc59oq/yPVmNf1XlC6MloHzd4TV7uzyCPSzKeDmPER8PF4sWaLp6VWbXkPwH78L
 sr9r4S9M9yFgeOrNRQJgzN7wA/RRuK1Qalw8cAZSlX2kv2jBHfx42PcydxXm1rHWPoeNLLbfC0r
 7dYRGLp8rDuE7Uww3GwbFLb0eEiVkKnNk4UWjBQ25rV9hC+3Me1EOkwgjjqevFBEwThOSOCmcyG
 mM9aQRGiNSBWtyUJsCzHKmxvUhPZOo3084IkeKGrFFcuGwyqJOQ0S5wBV6NG3PpdUoPUz/8zy2O
 dUVlkKoElILj+EA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: WB1PNDeqd-4udaE14wobRsE0jHjs50ov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6vj2wo8+wcSu
 0L6R2M7N0xJ6s1nEhFBp3fUU10LaDQd7G1RbFgxaK6Vwnz+izwV85r0roUbeFlw4+F4FCRBJxxf
 4u9NvzIKHeofzMUWJcHr4qKJrrDYpAUQB02ZPXVsT0PN5R/PsW07pISokgsrqzdleRLnOBd4Lqn
 15cNRz2xFJJuxD3dAgxGOZayq526/ahauaG7IhLmUvsV7PaFPz7Wt8rKC0OdZsIwLXMEnSenN47
 4lkLTPYE9+ITBz6WSbpIRFas7B3r8UZ4q9gkeqK0wZgopc8xXtBvBA4+KoKXjw/e9vHhzbhsYu0
 uIaGuMm/xTpgfgvgyeZxfYZ9GN1CikGUQwNlc8RI8MRq+kfT7g7ORUjWoHc3pck4efSua49aJzY
 fJyUnajhURtWO5s587vsAd42sp3rw9KDQKXz/1VUgRXhp4cowV4FeHjJJapE7jQk1fS7byYerZG
 UcI0zg2sQwk+eku/ofg==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab4fe40 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8JcInTB0O7GSQ8pEFMkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: WB1PNDeqd-4udaE14wobRsE0jHjs50ov
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/Xitvyh0H2Oi
 fTF4eMlUygB0gg0nGP8lHbErTNQtOFDyLVguTJ1xwL7E08PE2ps5HW4PYJm3h6DqESutnsDo3op
 q4Ftovbq3/8MKgfgRVpGUQDuuON/b38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index e1fe64463de6..45fcfa7600d0 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
 	.gdscs = gcc_sc7280_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7280_match_table[] = {

-- 
2.54.0

