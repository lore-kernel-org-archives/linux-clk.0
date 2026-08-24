Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D846841D105
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572554; cv=none; b=IuiujYbOOxFDNGTmEqKamCOTT7bz8zJIeQYmxUTw2C/XIf9IBuKEonRjc8ggaLsiNTfvruuJzn9u2Q/4BAC3uU3PmLDkZ1fBkljriQX2oYlxYWXzSTE9RvMD/l1wHtx9S/+xFN6Ao7UoKnSCwT4j9pPygLaJvhOaNy78vc/WDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572554; c=relaxed/simple;
	bh=qhXhEgON+LM47eHvoJewyro6o0/BcD0ZisNe20dtg2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uv28z71oHMJ1EQfxAJN5xssRezkiVEA5EqXszavaUuw0HgRxJyGW0uQ//tRmA3m49YJZ53R7n/L7oRCKVXrIb7kJH1k4VkZqSW5M2w6Z+0mYQZYlVjUpcpuLZuw4gcOjYthtLZYNFN45LaprWsvh2NilkpzRV06bKMH+Lpc99d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWU+7rsp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOwWzG3N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWU+7rsp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOwWzG3N"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMfqI2864672
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UH5fHPdDSh6OGSS+K594hFkncJUiDRu9BWlILDgoXTo=; b=fWU+7rspLlJjRQ11
	9fiOwQ80skfPiy6raMzObsldsudC2uBJrFkDasyqTVo6gTiuWK8hEYklrO0Ymfw5
	lIiT7JCOhKreJc8kzyWm547VonxVSOz1FylcGCUpxHCwVbI9nXe18rV1j7wtR3FX
	b7U+Ts2dE7fr97V5GUuf0zMSLCa1nZ5+KNuLWreJ8pQqnI+rGqXzt4s9dCpMlb0D
	Py4P2j97VbcObYu9hf5Nur+KTTLJJbsDCeyOLq8vpQ1SAnJXm8Qf08VsnghvCuvX
	u18bzSwiCDv+B+JWDzlSfqid/zX/tXOEgae4XL3RQF2KERzt5bYWgNX92GoFSqNr
	XJht+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8cb9f37eso23396836d6.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572550; x=1788177350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH5fHPdDSh6OGSS+K594hFkncJUiDRu9BWlILDgoXTo=;
        b=TOwWzG3NvZtAWqBHs3DtZmH3uJmEeCrJqD09rQIGxam5rz99lygh0bY6jQFWVRbwCt
         CYTKbDHqLKqgRqXAuD7fzQYFDgv8/adib+63LCU4ZHuBtfbbrxZRelLzQRt7hFpcK/08
         skCUd4GiGYgDmuvM6wpSfPuJ2pQnckzOsbqxg7zNciD24THX5+VKsRVW2bbH9lnE2MGZ
         B8GhyPBasWqcnuxrKMpK2lYWEll0jA3izx9eTv/DMvbtaOZPTyeulJn9TB6kNdPGjyhY
         HEF7nZS2v+HlGmNYK534KrDS9HjrBkOFEWGXi5GptlRICIBFqxvJeXIyaA8ejXH+ow6k
         j4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572550; x=1788177350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH5fHPdDSh6OGSS+K594hFkncJUiDRu9BWlILDgoXTo=;
        b=VlFmWBz4Sx19gbz6rqrCoCkryizrdZggqwNEcsCscTlr26sB6DRlVsxJG8OP7dUKtz
         9j5bniPMQysxuTJ51+iC9hqg232koLl5rgzAcgMg1Dx9NFcEzTAed+7x2xUkcneHHaJk
         /QWu8Sihz68axyiXDbA6JUAwKlqhX1URIbn4f0hdkNvThNQpuhZhODA7fjYZbfQtnZ/D
         F+Yclo204kh+NTOHwxGUqlR2Vxmatvl1WndBXVJMEA/7OKvbpHUf2qTqn0t1EC2pUm5L
         PSg/CJ1JIEzomQV0XPPmh0jMB2iUCzBDUCaYoTzAQSFLE9I9DAmiU3ijucPkcj0jknHP
         MoCw==
X-Forwarded-Encrypted: i=1; AHgh+RpJvVQwRkW1vSEnlpUG8NGk7HtXP/cfkWVzi301kUiepoJJ1wDEq51F5H+GNDTqrmKN1SBsTcoBEvE=@vger.kernel.org
X-Gm-Message-State: AFuF++mMRoZCuwafSV1ajnGx/ogWco2djUXtSQYNDYgtZI6FQzPRGtEB
	Uvq6JepusDhwZexbog6LhVJ/HqkDMSdQcpovKPZmMOWqiDXfmEUrs9MUh0y6W5QRbC4o4YyC8/R
	57XjBG98aNt3QU0GpcMBvYNKym4HgWrikvTLwaX2Cg/UNGj5yXBJyE2sIMHY9aE4=
X-Gm-Gg: AR+sD13xZ7VO4ttGk/QOSfYZHw0YiDkUyzkxEsfD2ASBYhL2h9iordasuBkRYdHhL4X
	cMf0mgaSaP6Tom1rRLLWKhhUJNH0f55cHD3MWEyI4WHU2pkbI+S11S5MXuk1K49oI9GILbgsvxy
	KpXn8+bWMj11JF51PCxw6HVGkFfutrrzqjw4T9Qs7tB2/O0POyyevABnms6mQRZiGI3RARWtpXK
	cdP9J3xxuZt17jeArjR4Cg4giXQ1VZ78R17jcxUwLxlghN1ED1391Vigq3uWJgZgEC1jW1dhf0+
	xe4cSBvrX94V6Ceu3+D5Ulfdfi/7wuDSzMsdPPajiyu5yhoar9AaPPkVSOZ3ZY/HY/fe9/p5/6L
	jdi0UxkR5
X-Received: by 2002:ad4:5e8b:0:b0:908:958f:4f2 with SMTP id 6a1803df08f44-90c80ca4ba6mr244282076d6.2.1787572550244;
        Mon, 24 Aug 2026 04:55:50 -0700 (PDT)
X-Received: by 2002:ad4:5e8b:0:b0:908:958f:4f2 with SMTP id 6a1803df08f44-90c80ca4ba6mr244281876d6.2.1787572549684;
        Mon, 24 Aug 2026 04:55:49 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:08 +0300
Subject: [PATCH v3 21/47] clk: qcom: gcc-sdx75: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-21-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qhXhEgON+LM47eHvoJewyro6o0/BcD0ZisNe20dtg2Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDpIYpjUgn5vLtjIoOuS/CAt4MnpMioGmi+a
 yQ5Winyq6OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww6QAKCRAbX0TJAJUV
 Vs87D/9VoTFXKHq4/Dd4t46EsUw199wwgHx/HiAEq+UjeUZ3s4FZcPxQEyOjk4DXlOijSRGkkjw
 aICgTO7y/oRQ4MTgQ/77Ep6eRxtU6nsoQCdIkfshBsIzH29HccsuiJWgPZIQVzkmbO+pylRYKxK
 me3gbl3lSnEl6McwSE2EkTvcsq1Ms1id5n4AX001HSeyp50WB2wOfp1Hh3RbI1qB1EV80zZ5IH0
 X/FnD3l98oNmu2lL+xl2rtuLFxHzXFPHU50CL9yx5TCucsetBYvzvWazr8VICNXiInDYKa2cA3t
 Vgu/ZnYKOq8BOQSF+4lEM04AxgbXTA/nQHXuiCB6md7PuoLI1U6K5YO+S0UXlMPNleTrYuBYNJ8
 gQiHDTNO6fCnN3kTAsgiV8N8yh7MAv4K++n8tNu+JSVa5DFGUP32XEk3NbGwOkgJRkuLBV8wPvw
 HI/Nkw79tu3E8YoECcDBNXTie/DYvyLoVHUpmp09Ul0/TvHfo+xsyxHoibocXB7Qq7H1KfPWSJZ
 B6Pzb5u+ahjirJO3Px+3P4ZptakIaQriMvycCV9of4PSotH7y78Hp6y2zWTP5TaFCVivXrFSooQ
 AKeoubKJILtmExskMgUKqwcPLGMntlE0+UIVS2iwZFgjPevyqCTcHE2s8FhBSFzzLz+bOFqsx2B
 MWOVD4ysAo2VDnw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX9JfUc+debhgQ
 l5XaF6g5ATm7B30NAabviEKtXYnFDCo6UI0W56FC79Od1HDUJIKQBU8vQFzgmHyzNPI3cndPyL8
 Wu0f9GVLuYDUg5hq16JsnJoUaa5F1qX4JfMCe3Apbov5hDIRtc2DeN9ddDbMy7HiAFdaxTpcM4K
 S39B7TEFiQ/1EairRupPMnTuL6fqkMsgmb91vltPIEERxH44OScF9s/OHAO6C5PCZCNPAgOh6+U
 i0LtGmjCcRbGR+byidlUEySp6oUN+R1S2yyvmRCazMl38tJ5NPYQvsRo+UN+JqismYFtNNcEUvN
 Ey6V+cuge7fVauKX1RH/ryDDW9HLY4In9XkqnhCQXNbuH2HsZkAWHMMNTEO2t/9Xg4mwaUpNgJw
 NB6CyO/HOKPm031i5V+VdYBrjc9Za3/AaPyTW5bpwBLga3No1NK3dXSm0ofKJmb3S9H2VzJ/f+J
 PZCDq4ZGwGH8WgP4QZA==
X-Proofpoint-GUID: Q5rz_LS5LwHu7XjnNW-gvgSUh5oiS9NP
X-Proofpoint-ORIG-GUID: Q5rz_LS5LwHu7XjnNW-gvgSUh5oiS9NP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX8aD9dTVUEDBH
 XE1dmuNLNkQRkctQp+sSjjjTuxaXrulRyPJUFGRagBxr+bliev/YoHC6AHJpFRRCnCTAzv5bNdc
 mljHlCKC5zmCuh7j1vsrkQNsn+AFCec=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c3146 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index 6712e76f875c..7a17e300abce 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -2913,6 +2913,7 @@ static const struct qcom_cc_desc gcc_sdx75_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdx75_resets),
 	.gdscs = gcc_sdx75_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdx75_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sdx75_match_table[] = {

-- 
2.54.0

