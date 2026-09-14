Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462F47DD77
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390131; cv=none; b=ngdlEYqCR4Jn/mu3JZXL6qUrZIM0CnyPAAQeKBgt2Ljk+4jgxOXHLdthuZk1NNuA7MA5n4t+pgRIjJe8X4hYlvedOwZylEhXuTXxyxleTjS5TNCxAwbqboPvuidQc2y1+OrObwPIwFuvLqpEnjWHLe4a35qlBZebLHTpNxOjIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390131; c=relaxed/simple;
	bh=lBuQmicCx9kKDfiCB86KRK+iqsUsG3386wxixg0Ytlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtQHUHVwAkUubaJx417S4QX0qav60/QZipAUBe8GwF+Vhx1XaeJEHcVvgPlcuKdpKOGHrNsf5tbVkYx85F/o/UK/OHWKXgIASVRv8qjsJ127tO3JWZYnG7GPpvMhSk6ELFL+m7Dt7lXgS11GB0ep3sRDMVHt2WTzFd+l5Y6b2Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqAIwdcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbYS8k03; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqAIwdcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbYS8k03"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNCES431588
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKi+gG2ggjAEODXLSMXJOgqgEydpvayKgshc1XUf2Kk=; b=HqAIwdcRCIq7NdbX
	O5frMG4Po4RjqrAIrzUgP6Jp6XNf0osb2To3SDD3oCRSgMpoSWG2ejh//dM4jmAt
	hab5Ne1bsTpnnTmPR7Y/zXwfKU1laGqWQ5Y0yzZ61+9Dn9023uei876YxmS49C0u
	Ikg/1pNcfHzn2ohhWTe3ZQqs+8sPPeoX009XreHls7dkjczlB3nlCrXaqOyYzu21
	UiXIHTYNZzP6Yv0Qv2gi+1bRgKMLzs3+6v0xHXK357dmk7YdnPopqAtXNCAqSI2N
	FslxsebHrf37Eumfeab9F1Cn3J9CvkpTu53/vmDkhlBd8Do1gqJgLdlescTBbKNy
	hkdJOQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104417215aso77517466d6.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390128; x=1789994928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKi+gG2ggjAEODXLSMXJOgqgEydpvayKgshc1XUf2Kk=;
        b=PbYS8k03fA3c1p8oWK5jPkJRQyAnWrr8cht7pzSd7n3IOrjEjisCMb/Po7jVNwTm0u
         oHAmKZd1XI6huABNQyll4FbPXS9HwpaxgSHPinaIwrVcwS4Vsd4Dg1w0B40FBeNstcZN
         DZ3DRiJbZoNNyfMNu/Tptx6oerK6fVQFyUvzSYMVevPxl3BP4oNG+U3sBlZGEMr6IKQ+
         zr0puv2HXNwKVEvsbpLNEeN/8mcbSRsi+NGDkcXmpT1iXWcAtcAXngo1V3QRuKjwAF93
         0+w5Q8EpY1XHs9WyjlYE2H77ZBP+DSfnNnRu3UCCFtpyf+gtbyQydS6g8s4yGC0YnJhZ
         05TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390128; x=1789994928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKi+gG2ggjAEODXLSMXJOgqgEydpvayKgshc1XUf2Kk=;
        b=rCHPcAvIV7H04/EfSN7cBrPkWLhl6/m4ZwyD+hcjnZGl61EzydKeKabOWK7OGQzI+a
         om90np4Cg95K5a+lG5qQbV96GrtAUQNLnUevxNGHowxFDiJ2MZJ/2DsMmsP/CLWoNa/s
         +7cCGusEI1s21tKKlGUPoiIUUxMkxiYfCDFGvJe4UhDqan7rE6HigX7OGhan4loYJxMW
         3EDNTO5l/X/FG25l9WnHvicVVTvNd+xJCMmf3MDDYjIeKVYmHYCEfkVOU7dCtNgurJE/
         lxy0UTtjMXM3XPc6sXbT2yJp4hwRedhRGCFWEu5ccDKeV6xgaCJ7yNgA82pgMYP7lNcK
         /QCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaIyab8j22H8CIt0Zwo9vUjT7qq0PTYSABBXGzitGLPvtvetFzkJSSscbh2rd72yKl4B/4w04MBWM=@vger.kernel.org
X-Gm-Message-State: AFuF++lCrl7Wdmtj7bq+M2kU8eNFXSDsczPVoYFlpjO3dosYurNLjaaE
	uWL0NaQDUNpRsIHdGu1XSIlJ0zEHBThmWpDk2dVaSlPG2Ucfp9G2NSSbZNiolSbilHgTz1BicD/
	JzwbzMizgwxBoDabV+UhN8skl28g7MYWjjC7UYGXptmyhjG7sBizrrqaMiIzuT3k=
X-Gm-Gg: AYBFou3O1IPIEfSBxWKfKo4QPIAj98ZXQpMTGW+OE4hTotV2O8a+EkJ40CuziUQnnv8
	HhK1ZRhnmYA102vBwTsSa6hTxN69L8AThbVgWxBGguE/bc0HRPh5OnMs5edZ4TMjuB7ACmqs7C/
	5+h6/t4Ji8AOzb8i5HdgnYWR+IuPv36ekmFFNKH5yDj70Ki43Smc8DaRsdzEdInJhteshBYABXr
	JQI3zzPUjqKYO2LFNHRxY4dgWuxOcY4i0LTwlfBC61mI974ENojURf4xwZmHGn0H0lNdCx4a1X5
	NZakUTk2AdWqqzImbY2nL+leGzhelDqSWymPFTNOwwnDiC66UC1BSSFYJrUONjkko9g0WCCu7iQ
	bmKFIVKeO
X-Received: by 2002:a05:620a:44c7:b0:936:e18d:763d with SMTP id af79cd13be357-93a2970994cmr396054285a.8.1789390127917;
        Mon, 14 Sep 2026 05:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:936:e18d:763d with SMTP id af79cd13be357-93a2970994cmr396049285a.8.1789390127389;
        Mon, 14 Sep 2026 05:48:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:16 +0300
Subject: [PATCH v4 17/52] clk: qcom: gcc-qcs615: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-17-9d5a606ada33@oss.qualcomm.com>
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
 bh=lBuQmicCx9kKDfiCB86KRK+iqsUsG3386wxixg0Ytlk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zcjEQn41t+3qll1xyYfMehJeeGGkSjblD3Q
 9qOrDr8aCOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs3AAKCRAbX0TJAJUV
 VgkFD/9TB+JcaDNWggqvjgt/8nFyIp4S0LIg9yfyt/oDiI5AJr9q8KOE8IAcwMHVc8Uzb6egOnB
 jl/WCozPm2iT7eaqWOjN3Q6CH6247evWOo4aSkalzOA87r5DwEc2MYD8bhKuRV902p0yg/BB9Vz
 4GCibZf5l8C/zIy2Q7h/vtOtMaaYehzC3TQssdLxcpuuE6si2DJdAE13jRmKetGC5/37CzMmAww
 bc+TzuOh6vpeUZE/5/9NacLng1t4/T1Xxicc8epVjXYeexofT9afvbu0AGzQSiYuhQF+rqfkukT
 QxxPBds/eLKqdTUbwnGUhE24yTTWqErhYMMNTcyKJNif+WsZyBZc9xb2fhIPDRk3hcqc0NLr179
 unuW5UdKDHHtQ7ruj+zx26s7/39m6j7TOQ+PEw9fLXhgURFG+r4hgOlqJWfFbA76ALp1e5wguAf
 UsBhhE1cVQK3MTcgxWABj4ZgdnHO6KHtGCQqMGEb/kRYSY1YojxsZXii8a8xWkMkOZzyc/nr7K8
 Kd0OKFuPl2pKeT0hrpAl3M6aPNKGV4h+r5vgQgVIFknugB8t7CqXdzmI1ig0p+wZAxndPGgEdrR
 WLZBMkU3Z8KCoyLPdk/3nJVL8HtIss9uspruQUhzWGfho5ADsyWw7HgHwU6GukKw5Iy1XgAQ+M2
 oJXqgyTZ+1bXyiA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed30 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX9hlQ4hfvePzl
 Zva4XDsTVncprLya3A7AydirEmsl/j2DYSI4iofw+civQb2dwOCVf45I65yOmgK1UpytztvWqy5
 kmVmTrfo6faCwX28OnS9WylWYeG8CxDHWJKfIzW+DSCTlUG5Tic6Ut2EyB0FwPE86bPFzvFkU4f
 kX5xsZw0ZTcNDV6Y7dMYEN6ZuKhHbxHoctxFW1wSL29tq7Nu2mvxR/jKvP4xYxXqomM79xQgNPP
 34lwZQbDz6Dj+wfLukkMD8Q0pTcUJpsALxw2xJS8ULc5xBDsWWGvhHN+1MKHLiWdJq/ICWVgwzi
 2jQauKAi9oTMhuiEJ8KUAoxVlDeZz7mhEUJ+/aeh9/sChl/s0wP2QqR2JGDKIb9C8uS0XFnOYVW
 AzUZAnNl3HZi0JD8NOh2huyjK713JI2K+N5qYeZRpVI2HTbFrFYGqwKltJOBRWDdLMSdl6rqQE6
 bUfmvovmcpvHJf5xyOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX3ZEZAi6N/yWG
 0Z89esr9TqGVHqu0kPh1eV+FS0Lcc8SUXm6a/nyv3ucHzaXsE0YFoN/F7VX36jeUBdoAF0x3dvc
 3lpFaef+qGrNSTBJz/xCcPEzqBaYCrM=
X-Proofpoint-ORIG-GUID: EaoDC2TwmMrAYbPElvL3hKMVNFuG6Nm1
X-Proofpoint-GUID: EaoDC2TwmMrAYbPElvL3hKMVNFuG6Nm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..914a49573811 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2968,6 +2968,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcs615_resets),
 	.gdscs = gcc_qcs615_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs615_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qcs615_match_table[] = {

-- 
2.54.0

