Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5A4119F2
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572492; cv=none; b=eumJRt4ZBXhHU6Yi6FocdrxvAhlNAyChA+vcFSt0DH12LDDAKSkxrUIX3xyXy3Dh3+DqjMoHFlRNybeqPEyd3j7R8Og/a6b3kW/lPQFWONMUvJvy/pxtrkg587ZnjwaCq1qAhai5NMFBgZN4BmbJ8vSMp5/dSdCDEZkPouQFUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572492; c=relaxed/simple;
	bh=xPAC92YwBBpmTvwwHasEG7NqIDlEJvMLkMVYQfPlBbU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NMgZv6yGnVUu/v8Wlel82PDGadEXBn6UtMofhXojnbOsxPQSeC2+q9oG87g3Ykv0WKrCjIm5RregokUSY2nlWsS8deoczdWeDuo4Os8CbUxz7cJniFcMPD/kD7E8PIpCmqkjD5g37m6sfnxmFtzVme4NunOICuYMZPXruoMKwlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8BGd+/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7WVR1vK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8BGd+/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7WVR1vK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMcki2648128
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TJqgyJE6BkzCSIQfLRX1lL
	2ZlSShzAHIfpe8L/juL7E=; b=g8BGd+/VaRdgX5DFpBS65/UTmE26RdhFxDwYiU
	sp2FKEU8ON6JcArf3+aFMXjLZdGzIIUUbzSxuFk+3U4XB4nlUldusnVocfRP3R/v
	7b6nDCG4SjccansbpcK/AN60bBEWPz6x558rlgW4MvhnMllrCeiKsIyMMbGy7eIA
	erAE5s+k6dEWCzR9KnSiE51LABdnxtwkZdHWVCrv/uku5lk94simHD40MvHFS39N
	QKsxHOjzvWfBbEagx5vaFNagNU+B027dI7PEoEln9nL88wrIeVrwixM/e0qhMBxM
	nGHCx1rs8ivVYrLkykV3ZlW3fB51LFlxCV2+94WfRyhiCcMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9a6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:54:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso69819941cf.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572487; x=1788177287; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TJqgyJE6BkzCSIQfLRX1lL2ZlSShzAHIfpe8L/juL7E=;
        b=K7WVR1vKZKTTHYl0/VVIIc2TbgprsG6rWo3sErv5izoAO/ilAsmNOIVdZZRIIak0N/
         3dho/wYIT2PIWjJ6vQ4dCEX9CJlV4y04JNs8ISkZdptCCI/s5W9kiei11qUYhgFt3135
         DF4uSkejleOfICHr/wBS5i0m7rmeXxI5rWnlQj3H0RTMteihoIBccOn/TNPnoidk9418
         g3mlrSCdA0LnLPF6nmR1hd3ULIfVP8S0G8zKkq/jL0xRt887PQU6eyVS023khdcjb1ty
         cwx66b3SqS2QxALoD6VOLiL2eKr6dfVytWZ/RXE1/NCBG61biRq1l5Xmpnh5F0MzoMTz
         vAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572487; x=1788177287;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TJqgyJE6BkzCSIQfLRX1lL2ZlSShzAHIfpe8L/juL7E=;
        b=nPB+uKRLas9YpT8EIpGuJOEB3SUxxJZK0THGK3+3TbSE9KHRL9BTHExW52D1wl1+UG
         wPcEJFCpKmCRSRYxXI5Jn2n28Cmgxc65l6iStUrXVzJxMuEdve78QJZ9O2KWJRlDD0Cj
         aVHGhRi4tKphcRM7Hf+GD2Vm4l6BTEIrfSyQ7rlhxeXrW0dncrtdfmir0kBV0zoBv869
         sS5+HTWeO3H6pfhmg3ok9Q8KIPEAN5a/d/phe6NgKEAnJ7YcB26MSlns0mfVAio5DoVF
         PDaFCdnEF7SazBJL5bv1sV3+P+Oumtqcs2hlS5twXdzYZDH4BjwjvVZN4j4LomE0v13s
         kTJg==
X-Forwarded-Encrypted: i=1; AHgh+RoVW6FiC4VcYpVvLB/KRmhfMZFDAObvcPUYYywbi4vo/HCdpUq4Ifm3VT2qSKU+Uclu9m18QX2lWFM=@vger.kernel.org
X-Gm-Message-State: AFuF++niyOeAGTAcVkdZo4eJN1z1x3ObLE4GrOCoAkl8mQLjmHyHOSmw
	AeqhUw3C1Rv9gvoPXSHj5F/cwViyDXq03s3vOZ/fRLII+DshLkY+mEYsLuUkNiNqw7BTsP7Z3kJ
	eezq9hqHQu+KXDQpjdesrMg/hGfJMElrW7JEH7jmmX966PSq8D3EFNfv5wnnyxvw=
X-Gm-Gg: AR+sD10VfFoK4aINMPgoqXSP95t6t35dfpclAaiEHhl+B4v5rMfT5N97X3e0Z/d5oL9
	ApqWnYkAnIVEkEkK785QWMIJN8Fkta05xDHju9ZicJ04wX9sM/JQ5OruaVi2S0ga8TUwDlSLYU+
	eAEjEB6E+nh+PlD8xbdF+7BibpBcfMLAJtYeJZqXlxcvZaxwoLfUe3STnVv/YUvlMPDqvyA03om
	rRDNuHfG9vzISIdKXAHhGI8vIYv3KwAiWQsiY7b7BA1VUjOd6mEK6DI9GjyP1xY04NVV2R1kI1Q
	3vYio/59CyqI0oyLnP2dh/RDJ1Z6Fk3DoveMjbfzb4kLbFPEUS6wE3leXMbFU5LmvHPTzApt3iM
	uKMAb4CoK
X-Received: by 2002:ac8:7dd5:0:b0:51c:217f:518 with SMTP id d75a77b69052e-52e09bb2ec2mr165211571cf.6.1787572487297;
        Mon, 24 Aug 2026 04:54:47 -0700 (PDT)
X-Received: by 2002:ac8:7dd5:0:b0:51c:217f:518 with SMTP id d75a77b69052e-52e09bb2ec2mr165211061cf.6.1787572486754;
        Mon, 24 Aug 2026 04:54:46 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 00/47] clk: qcom: Tie CX power domains to GCCs
Date: Mon, 24 Aug 2026 14:53:47 +0300
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMswjGoC/32OQQ6CMBBFr0K6dkhpsYAr72Fc0DJCjVJpS4Mh3
 N2CGxfEzSQv+f/9mYlDq9GRUzITi0E7bfoI/JAQ1dV9i6CbyIRRJmiZVTAo8wSvEdQE3kCrFIg
 ChagKwSt5JLH4snjT0ya9XL/sRnlH5VfTmui088a+t9WQrbm/AyEDCmVOKc8zlmPBz8a5dBjrR
 8w+03jIuhPYj4nRXROLJowP15w2pSzkjmlZlg/MQXLeFwEAAA==
X-Change-ID: 20260819-qcom-tie-cx-to-gcc-67e6697639b5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8582;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xPAC92YwBBpmTvwwHasEG7NqIDlEJvMLkMVYQfPlBbU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDVYogCuPZ6/XfUHio18vAtSmq6D0HdUX3G8
 q5eU4V6dY6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww1QAKCRAbX0TJAJUV
 Vka4D/4y8MrkTNnp4xB/kOtGBNuDyJF2hb2IFsqrUPOvv/dhmemfnJnMAJNcKS7xhzsf3C70+Bk
 3L59mf3IIMZ/SeHPza3j/hODuk6HRNps48gAkofh3uIBuDnYcDWbIu5Hpo0g7lxg5hWeJzglIAH
 8HINYGiOfe2SUn2OIE4z/xNTPQO7Ms2ldd6jYTS43DYuXavdl4IALVc6YuyX2yX16RihF5hJA7Y
 CrWr0B+rgVXOghW9sk3+Y9q1Ee5EF+cqK6NA5qm/LaO625zYPazHQvaMsUqheJ88tUOq9LDxvXg
 oWss/VDquC9Mdb0o3JwFKID2X+8Uma4RR7i52HwHyfv67BhVFVqB1FP1iAYsfGOzcW5u96qTrg+
 sgZ6rxD8SSjo694+xhNbKjt9IWUt3Lq/j5Ig2BPUcsmLCQZ+mOfUaGvwlQl0pPm7Wg4F8h9CFO3
 ck/WE0+NndWU53A46S/XZ+3NaQOVkMWGxRRTIFOEy/gypUxQA1+lrovZDNOHcG7k/3+H3yS5TDX
 HRWJmQmyiYc+cheWbvTJePYYBvL9sG3Z4UJp6B1MaVz3f7DWqea2iVORaIQG7da8k6/2n13sddQ
 Qy8XhljXPKVioaI+gUnxJBxsfi56527RRBnvDVlkO1fVlIUxtjlrl7LOXRpiKNzKt53NImyWGmu
 GI90b5YM414b4yA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXwLiBhUVkOfhr
 FHyiLi8yiQO2MiZHn+Zf0JLpi5PYYYLJKGyrGv8k2F98aKTtRIIGDHv4asYLMUd0b9HyArRzHJH
 jo2n2g8MjTbQ/Weo5nQKI8ShcuA6v7M=
X-Proofpoint-GUID: Tt2r5p3_0R2uOhe5-579yLSqm-LWxlnd
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c3108 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=IpJZQVW2AAAA:8 a=hKNR-1ll3ESsXwP17scA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/RulUV/2bo+r
 Uj7QHHpAxDlaUWnWChCZKqgsGxizgX6tYcvEdmUNxiiJQ2wTy+6/KjJJQTmQN5I6Ezap0a9F3vN
 uZgo0ZiVN8l4Hsg+2BpwNAFQtXgxj3qWezLvGBr2UHlaqr1RyUXcnO6Zo0eq5Co5G4rJDtZcRDF
 BUsYSRsP/Alhw9Ve6LMmyUzXkwKiI797Gdj69GuSD/w+jfutElh8xitjfwsKx29L8vHB2xUshCm
 mJLI0JJohLQoWoDebk27F9rjDzoKN/a1PKxzrQuvGDhnZx51PVdrAdF7s/OOYQyKJosronuv6Ln
 S8O5xEKDJlm/JRNx0tu8xA0IURmCrGemqPagoAFI8YBK9zXCOTIyvdlNtZRbqSd5m2LzeHjwYPO
 zyVBAoq5ftzRbbpix1cU6h1q2PplooljD1kji5arvuqEOieHn5CeMRI6ynVIIltS2nB4rSeUHtl
 1YzuFtMyBTR+dp/6cfg==
X-Proofpoint-ORIG-GUID: Tt2r5p3_0R2uOhe5-579yLSqm-LWxlnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Tie the CX power domain to GCC clock controllers for SDM670, SDM845,
SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, SM6350,
SM4450, QDU1000, QCS8300, SDX75, SAR2130P, SC7180, SC7280, SA8775P,
X1E80100, Eliza, Kaanapali, and QCS615.

Also enable the runtime PM in each of the GCC provider drivers.

Update the GCC bindings to document and require the CX power-domain
dependency for the affected compatibles.

Only Kaanapali and Eliza require Fixes tags, as runtime PM support was not
available when the other platforms were upstreamed.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
- Rebased on next-20260821.
- Pick up Dmitry's and Konrad's R-b tags.
- Add binding updates that document and require the CX power domain.
- Add SDM670, SDM845, SM8150, SM6350, SM4450, QDU1000, QCS8300,
  SDX75, SAR2130P, SC7180, SC7280, SA8775P, X1E80100, and Eliza to the
  list.
- Link to v2: https://patch.msgid.link/20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com

Changes in v2:
- Clarify the runtime PM rationale in the GCC driver commit messages.
- Picked up Konrad's R-b tag for the dts patches.
- Link to v1: https://patch.msgid.link/20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>

---
Abel Vesa (47):
      dt-bindings: clock: qcom: gcc-sdm845: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8250: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain
      dt-bindings: clock: qcom: qcs615-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8750-gcc: Add CX power domain
      clk: qcom: gcc-eliza: Tie the CX power domain to controller
      clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
      clk: qcom: gcc-qcs615: Tie the CX power domain to controller
      clk: qcom: gcc-qcs8300: Tie the CX power domain to controller
      clk: qcom: gcc-qdu1000: Tie the CX power domain to controller
      clk: qcom: gcc-sa8775p: Tie the CX power domain to controller
      clk: qcom: gcc-sar2130p: Tie the CX power domain to controller
      clk: qcom: gcc-sc7180: Tie the CX power domain to controller
      clk: qcom: gcc-sc7280: Tie the CX power domain to controller
      clk: qcom: gcc-sdm670: Tie the CX power domain to controller
      clk: qcom: gcc-sdm845: Tie the CX power domain to controller
      clk: qcom: gcc-sdx75: Tie the CX power domain to controller
      clk: qcom: gcc-sm4450: Tie the CX power domain to controller
      clk: qcom: gcc-sm6350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8150: Tie the CX power domain to controller
      clk: qcom: gcc-sm8250: Tie the CX power domain to controller
      clk: qcom: gcc-sm8350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8550: Tie the CX power domain to controller
      clk: qcom: gcc-sm8650: Tie the CX power domain to controller
      clk: qcom: gcc-sm8750: Tie the CX power domain to controller
      clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
      arm64: dts: qcom: kaanapali: Add GCC CX power domain
      arm64: dts: qcom: monaco: Add GCC CX power domain
      arm64: dts: qcom: qdu1000: Add GCC CX power domain
      arm64: dts: qcom: sar2130p: Add GCC CX power domain
      arm64: dts: qcom: sdm670: Add GCC CX power domain
      arm64: dts: qcom: sdx75: Add GCC CX power domain
      arm64: dts: qcom: sm4450: Add GCC CX power domain
      arm64: dts: qcom: sm6350: Add GCC CX power domain
      arm64: dts: qcom: sm8150: Add GCC CX power domain
      arm64: dts: qcom: sm8250: Add GCC CX power domain
      arm64: dts: qcom: sm8350: Add GCC CX power domain
      arm64: dts: qcom: sm8450: Add GCC CX power domain
      arm64: dts: qcom: sm8550: Add GCC CX power domain
      arm64: dts: qcom: sm8650: Add GCC CX power domain
      arm64: dts: qcom: sm8750: Add GCC CX power domain
      arm64: dts: qcom: talos: Add GCC CX power domain

 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 8 ++++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml | 8 ++++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 8 ++++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 8 ++++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 8 ++++++++
 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml | 8 ++++++++
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 8 ++++++++
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 8 ++++++++
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 8 ++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                      | 2 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                        | 1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi                       | 1 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi                         | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                          | 2 ++
 drivers/clk/qcom/gcc-eliza.c                                 | 1 +
 drivers/clk/qcom/gcc-kaanapali.c                             | 1 +
 drivers/clk/qcom/gcc-qcs615.c                                | 1 +
 drivers/clk/qcom/gcc-qcs8300.c                               | 1 +
 drivers/clk/qcom/gcc-qdu1000.c                               | 1 +
 drivers/clk/qcom/gcc-sa8775p.c                               | 1 +
 drivers/clk/qcom/gcc-sar2130p.c                              | 1 +
 drivers/clk/qcom/gcc-sc7180.c                                | 1 +
 drivers/clk/qcom/gcc-sc7280.c                                | 1 +
 drivers/clk/qcom/gcc-sdm845.c                                | 2 ++
 drivers/clk/qcom/gcc-sdx75.c                                 | 1 +
 drivers/clk/qcom/gcc-sm4450.c                                | 1 +
 drivers/clk/qcom/gcc-sm6350.c                                | 1 +
 drivers/clk/qcom/gcc-sm8150.c                                | 1 +
 drivers/clk/qcom/gcc-sm8250.c                                | 1 +
 drivers/clk/qcom/gcc-sm8350.c                                | 1 +
 drivers/clk/qcom/gcc-sm8450.c                                | 1 +
 drivers/clk/qcom/gcc-sm8550.c                                | 1 +
 drivers/clk/qcom/gcc-sm8650.c                                | 1 +
 drivers/clk/qcom/gcc-sm8750.c                                | 1 +
 drivers/clk/qcom/gcc-x1e80100.c                              | 1 +
 46 files changed, 114 insertions(+)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260819-qcom-tie-cx-to-gcc-67e6697639b5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

