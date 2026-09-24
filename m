Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CE9485923
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246483; cv=none; b=vDyAvuNXs+rLWut+dmhA7v+o+YpKfsrsLczNFFSJ9YhpuNaL3B4aFYE0LkyvJs1wU4ylMLCQRyfxXBMpORe0GQvh361PcAyt4NbnybeQcHMmfPUz3EYDTTVv+6o+RYgwVCyholjMb+U0FveNoXsMSjhBI8lyR5q5ruQ6PKFPQVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246483; c=relaxed/simple;
	bh=cN+HDeANXO2WMlU60A41XyfjL+9PDn2q1Gybx6k4qRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nU0mszefLljT9ARLV/H4lNsjuG1KrmBhGb/3RjsmaXTn4olihZQAzD7DzKH4I8qh3HfGUcX9u/xZNXGFCkqr/3clDlvrYIc4I4C0pM1u+B2MiJ50WzVYcz0+rTQZIYw1lfqk8pEOPWFicdoMfU+DCvugPPtXWjIOnDHAam/hHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyRfroev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bom5WOHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyRfroev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bom5WOHN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PM1m2919249
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=; b=kyRfroevuffqI4M8
	JU8qnhtyKW2ae6PQ/eD37krOHEoQ1kL1wUeSM6UCDCGjd/iyMfZeov6u9E03oyv7
	UqsesDVg5XHvIPwZdFT2fJwqjckEVSMOJ+YXI8u46vMhdP3JSUmIq9R6wfNzMi/K
	365jWVKhV9x3RIeR75coeJ31pU2jpkUdj/Lq4+7rtzeY4AY8qlu3ng2MRru7XS+n
	hxn+As61DVPlfiS9qehlnnSjrfw0xNcyFJl9Sv6iD+YKb73q3kI4bq9I5ldTDHaS
	Hqjixu0W0sXZqe+jhbUXQhjZul/HTBJGS3vKEi/AYRa88LOwRv5bh3yDl9qUXYCg
	BjQATg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so380448485a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246478; x=1790851278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=;
        b=Bom5WOHNZk5nLpeAhj3E0Q5pc+T4rkMGnEez/r2HA9Xu8WUZp8He0JRAdCFDy83GEU
         W/6KenAIgx8Qaq7ELi2WqneT83q7POpZmP+LX9zywaQ9UwzB7Ox8BAI0M9ZRXdGsP65W
         fdhZwwDQxpbf6G+uyftUXDfeYpawsgFdZG5kA9wp7QInNcgEouK/2TAYeSKKQwNO+gRk
         7wOjHEzHk1YSH0XsGXMOQ1Rai8seWZbkn7uOQSGW+5vHgrf2CxORcUCnciN3MOxF9N40
         Fkp1Lopld+WPLF2zmuDVG9apkn+KbD3VzlYs42zPkIVWWdln+mqp88h2igt9ytKXEfp+
         KdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246478; x=1790851278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=;
        b=yechc9alwSHXVOhnHKPmH4HRVOzKPccG5qGqTb5d/AndTdxOeifQO1M2+zWYxD0+aB
         pY2CJxteJMJ0kBjU8JzTldAtnVEQp2XoonmlUGh9BRF8MCe0+1Q4IHok7o4CREseIOEN
         z+XRFaP6cACoP479f8LcuQbOVVUO9781PkJUy6TQralKFwOexxnKPs+1Z4VAHRUtvBY8
         q1hcXjTzFqDHV8EXZWG30MjZ/lrDfrGarXMOHquNqHoOvvgj/RMXYSBjWh+7Adivf/lA
         Fl9QSV+WBI+QDqjRtVc1qJaTmQ62zuK9imriaY7CmCrqSqi+2AtfN4Eo6nVazdwRUdJO
         p62w==
X-Forwarded-Encrypted: i=1; AKwUvBwj47x0sHeWL3LUPwdv53YNRTKYbqNDh9/lwEJGgxCTed5445MuE1kd40hGYvkW9YJR6vAr6be67+I=@vger.kernel.org
X-Gm-Message-State: AFuF++kbSrbA3oizGhyy95imDps205tYp2/LnE+dzNIt3lwIIDDPm5ko
	EcLEMuweBxIzCKO/pNj1pwt23tzXu36W3WvCwUbwLfwKpRXYRBbDzmh5n5vl719DEKB0/B7HNby
	FvmRvBFA66G3wpoOgh42AzlED/WlhK2ePxuxXvrs89HCbzBLO4RbB5lJSDadeQzs=
X-Gm-Gg: AYBFou0Bv5HDSLNsyYkxEK7rKrlrDSljXKK2cVX3X4y2JGvLmJmrYBPO94uUy0bYCC9
	C9kqvNpqClIiDmtg3R66mcftL+CmUfWP4FfL279Uu8dOWxwrh+7O52G1d7JKnHQH3H+gOqKzCUo
	tF/DlrRwle6wWFEsKWAibkCjinvrnNCGd/Y8JfmuMHswYSACskrBX1y23D8GIPZ+Cg2pDyD3zUs
	XMBSB+mEnFUEUD9bflC13Pd2gHNojhOf1fFO3usUcDe+34xEnqkckLHS7lMnHpYC5Jb5U+5PTPd
	zwXJxqCKn8keS/YkRDhmY3HY/NRSYoJHiouRC9YxCFwZZ2k43HnXUE7VILqlPFUvIdv810knaFx
	GVmpEZP3I
X-Received: by 2002:a05:620a:3197:b0:939:6de9:4cfb with SMTP id af79cd13be357-93c363f1ffbmr217332085a.46.1790246478252;
        Thu, 24 Sep 2026 03:41:18 -0700 (PDT)
X-Received: by 2002:a05:620a:3197:b0:939:6de9:4cfb with SMTP id af79cd13be357-93c363f1ffbmr217296585a.46.1790246473108;
        Thu, 24 Sep 2026 03:41:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:39 +0300
Subject: [PATCH v5 23/42] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-23-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cN+HDeANXO2WMlU60A41XyfjL+9PDn2q1Gybx6k4qRg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3wt1xyqUBo2XBfdgM8ZCn/ydcNwR/CfFReq
 vWUiEPSp+SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98AAKCRAbX0TJAJUV
 VpsxD/wJvaS5lYxddqVjRTQxsuOLEJxo72VVG9JcJ0mYkRyZgG9EtyyWRh27kbmYkXNwlgKGeez
 Wjh4lIkprw4IOUga4RtOAGnaI9s63+pzPPSOF10elrmZPd1ctd8HJr7Rht11AIhJeSPW+vxs1Tl
 cr+kVWayORHubPM67hM4BJStPb+KAjdHbIs/HVzSUsb88U/zYAJDfp8l1iQCDYJQ7zf2p+iZkHA
 j7MhFRopnpZrHdbKBEWO/tNPEOpjrdaFscsWwAdB/ASvChiN5GRntGcPZ92jpQvPlDHwMcD9IQ+
 +jlBngbiDVTz6v30S7xQzo5QZbtnkuiyAiW8VZFMDU4epTZQYwmIsMF4fWsS0uSxMZdSv21sxFU
 2Av2xR78Apz8syXTlQ/3R43zaND796H1g3XRRYZ+ys9qn07RuF2FqjXT4/mrfn+AFbSAIHky2QU
 aWY2NG8drgoaQ5EOPObKb7iVRbilnAkP3eXGPzUcJaczWGpyA3aQkmbyfVW/bfNRMQNnDYGoMCh
 iS5OxYNplOgrmSES+T+JlyWaO0csNvDgLwX9qsMa9vuUI2/mv9Raoi5o5vxex8ZsK2QpWpzOqbN
 XjYZeYCEpgnSpskY63fQT32AL58Ct17zR1jm9kr7zaR1mvyIR6QJuKOFw9bR601RjtrIya3AeFT
 EuiWgnwoXoCyt1Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4p/9vlLK99O8
 VnTz5f4zkynMMxQmGrXB8Lgpbr0oKB4ok6gH7twj9MRms1K5zYmI01LNgR1uZns/9bgFZ8YQmQx
 xPJLxu9V6riVFDBRbenKS9esP6sdf2Y=
X-Proofpoint-ORIG-GUID: lQMLHF4OxESe-1em-g6HnTuXTIT1EjM-
X-Proofpoint-GUID: lQMLHF4OxESe-1em-g6HnTuXTIT1EjM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+CwbJsemhzEW
 2ebIRkWY7zhU1xGgO/d622o2PRog3lbImpQNRhoPQBZ41Wliwp1n1jHD7lHyWPvmKe6ofdXIk41
 VYaLIv9hBOs6jiIYbPXva6Qxw5SFgJxt8gaYh3qJLn94Ar/MJP+tCWMlUmP/i5nnGTirVAf0QbB
 YzKuYAGy5D4gF5dZbi5QVo3dv1YhBa/UB0i/1Uu7NpFtp3OhZhnkrJLJOW26ywjd7kKUoJyG04v
 /oNPuua713xbrLUWJgM6kPacX+BtB78b0mVCRywINcLcXJmekMgcaD/0MmXqoT8/XLAvaof9K78
 MkOKySKUNJ+hpCpP0J3/ReWRd0hYbkH5paQ2/V7MONSbK7VPm7QhzcdUdxbES1nSk2/wqhLuU+5
 FC1SaDOTJIncFNQ7e4UGpMNsTEuC2Uy8uCZK0sYSJbTZONv5rBYUW89MOWWVAezgWAHBlLE1oyi
 VkXCITAfcIoxcVDln6w==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe4f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index d473a95bef92..9f4672277932 100644
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

