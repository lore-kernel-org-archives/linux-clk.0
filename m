Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A47466B0C
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390086; cv=none; b=uwSjVn7ak7zdZp5+o2Bn0Sva71fivOZSPEc6xybofaPwdxAmvazu+YzhBPquC2OefAYcLyYoOCk4zMuFjEwEX6bivi0kOvl8IJsZu6vjM5JCuTqr1vd6V7voc6xaygUj+Aabf038jxMrbQbdevapU+HKVFlGVQSgYXtwRP2sZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390086; c=relaxed/simple;
	bh=uLsEr8EDJzNep8q26/q2XvfljzL5t9C+5nxwdza3c1E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PHais2v7abe0MwB52jed02Gy880KSLXydyOjLQNNPhgUHEqSbKKc653lWEYgjCAE8K8W0BqDU7PEVhZg0DDyKBpyvRyJGZR7DECN12gmpqwYmnuFQahxZTFVDoNEAvJCUI9nvpelvg5pC1xvK5ocAie8WZkQbYibKSzs0x4DhyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/GuS53a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqGnT8i1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/GuS53a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqGnT8i1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFHA406691
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=orjs4bNCCx3kTIyjX9b953
	ojx8d06e/Oru4ovIPKQFA=; b=e/GuS53aKzdP5bYpWsF9MivTKiJMAjYx2rbFuH
	25YV7k8aLO6W6YtrHXq2gHCC0qnkJWsJ6H3rNLhlSX1Rt3FzS1vANqmTZUVldTYL
	cmJF7ZQ/nc02CJIogxsE8m0RnDmtzTpTnqNz/HPFO2f44Fz9qq03Tn2wxk6T/lcI
	B0msQVk/ncOUY/16eXSmXvrgiLobBJ5/eFgiHUBY2k3oaerp7SP71GpriKLJPeiN
	Twtd7WSWa2qiflpQDOPS4GZb5qjqrkxDk7b/NveZeGKpkqx/XocJ4lkBJobFcSBO
	nIP7GdVg1L9RgqrcHhjCmNNakk1rHl+szyPWBt391yw1hbAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr85n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so640557085a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390082; x=1789994882; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=orjs4bNCCx3kTIyjX9b953ojx8d06e/Oru4ovIPKQFA=;
        b=EqGnT8i1cn3qPZ5T1amAU2r5iznDyF4S/P4IqOY8bu8wL7lGYnoskBfyGKfvLdonvU
         ieL2CDSWjAz0eohNsi1Lf3ZFIzt7/2w2L2JQ7scNM3y+x/D1qFA0Ulfa9q0fjY5ES4g7
         g8YQ4RN8a/bIOfWaSCuQ5I1Je+29DS8GwwlmUufO9ibhVGFHl7kymOOQu5ZbxMXQ8mcn
         GDiYBikX0GWpeZnp0OdXChxVIaJWuuthCCxeL1aU0qF8NVmVbSf6A3wKcnzljMdkoalQ
         Pr8L7/Y9f7+7F1p/BuhEoUDde5XItD726/NyGPZoU2Pq3sV9+gw9ufQKF69Ri6lSZDGL
         2G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390082; x=1789994882;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=orjs4bNCCx3kTIyjX9b953ojx8d06e/Oru4ovIPKQFA=;
        b=AN2d3VnbiWNkG3bOBQ4u87o6i+0tWuzopDzuA19ihxgrxePm2asuD4Y3cNZgm/E+D3
         2ZJCtfE2bB7cVzbgAiaZkfw3pU9bWUaXEFEiZz2d6kiTaP1ectNsF2fjef/C1ytWr88m
         p5pWi8XzEo0L7rtmydJI37Q3cEj0zw6WvY9zf8PIQJvnO0aJBGmB/rzbHkRWSI9s8dvN
         smwbxHFE6eZujEap88Akpd0A0LQKHHDaqxfZIIPKCGk5vuwexlTIAcaO93SVbuTs0d/z
         6Tp2zrHwTQ3bEdojz6l87sZ5Fv1yOOw+JrHvbGkD3iwkcMyJVF2MvFJ62T0TjwmFBknF
         7fMg==
X-Forwarded-Encrypted: i=1; AKwUvBzejDv/YJAycNJ6iTbPlxO9vRUwiUTWEYrQpbI64N46CWeJwGywgp+DErCLyOHWb3Muzl6wbhVAuVE=@vger.kernel.org
X-Gm-Message-State: AFuF++nNyNSNyllPznBh9fDX3h8/W7lBwFSDMaPXmq75voHtOU4nde9r
	8aPIxgkefvKnszdBE69yMCkPcBVCyrfWj6pkl87DGfyAXJaqwcOK3p5J7KcVHQobJzE/m6yvFFJ
	K8wr3JThV1Ph0vh4pwSwGnJGkpupDeDYHiPGzp56fn52vU1MCBYCPxXjZ7/+FNJ4=
X-Gm-Gg: AYBFou1QWWarmxLhLGWG7PxOlwD1Og0aSuemj0iz1IzZbdQMlPBKB/6g54q9T3p9w1l
	rq4P7ZoKdBcY04Bzfi8/8rE53z1Qo7YhjaPzjXJxbQug4uLkTpn6OEqEJAuiaXQTg3szS/j7j0a
	YDBS3vRhTNkwQAIup67nWHeStiUzwWUHrTsaamoY/wX5NRryUvB6luy7JCJpS3HXkT5BChrw6nw
	zTZmKB8vV3TGFe/QP0SucTjmHYFAmZm1O7K4inDqT4Th3ibKR6ij9XaRnUYzLvakN63tY4u1PW3
	GVClYMZsr++bsLgawG06Utk6f3SvnRj0mjL3rcOBWvmEfZV5WZYjZ9Iuh2FlbfWxdlAFRx+B8N7
	sBGxJ/Wcj
X-Received: by 2002:a05:620a:8394:b0:93a:1773:a16 with SMTP id af79cd13be357-93a18147155mr628434485a.0.1789390082292;
        Mon, 14 Sep 2026 05:48:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8394:b0:93a:1773:a16 with SMTP id af79cd13be357-93a18147155mr628429685a.0.1789390081704;
        Mon, 14 Sep 2026 05:48:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 00/52] clk: qcom: Tie CX power domains to GCCs
Date: Mon, 14 Sep 2026 15:46:59 +0300
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMTsp2oC/33OQQ6CMBAF0KuYrh3STksLrryHcVHKqDVqlQLBE
 O5u0Y0LdNPkJ3/e78giNZ4i26xG1lDvow+3FNR6xdzJ3o4Evk6ZIUfNC1HCw4UrtJ7ADdAGODo
 H2pDWpdGyrHKWDu8NHfzwRnf7T45ddSbXztLcOPnYhub5Xu3F3Ps70AvgUCjOpRKoyMhtiDF7d
 PaSutcsPWze6fFLQr4oYZIofdhKXheVqX5I8ltSi5JM0kEgz22JusAlaZqmF6w6oQlhAQAA
X-Change-ID: 20260819-qcom-tie-cx-to-gcc-67e6697639b5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9466;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLsEr8EDJzNep8q26/q2XvfljzL5t9C+5nxwdza3c1E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zLSSrRhhlSkcXiCk0RCchmj1A5Dmh1RnM7d
 MCrB8jpQv+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfsywAKCRAbX0TJAJUV
 Vt1wEAClYr3nGIg7OGBX6+wxZBsQvZ/2JHU0f0St5CoHlzhKKVLVTvd7yUWsBeusBnsFAkggzt8
 7CYBVMAbt3XGIpTxEFmQcvAnUxnmPZECHT6radX4Ptl59BsbREoab4cthXckHoeADD6Bf/mdLwL
 qJ2VpOgu8D4gZseFTSpaxU2cLU0KJL6JE2L50sybFM1MHdZuMlkVUTzSqWRL/xuVAuHOTkiiNIG
 OmRzqqEJigQThtirVECwA/0kqcJSH1zS0duXp1EkJM9JVeGWpap47tCWUeHlnZDmNQTzCNUyzQU
 ZxTnQcwphBqHwNw6dOmdtULnBqThCZE5GCObohwB8SwW6NJpt2/W3mViKuvhU5/krvXUfgvMuL0
 G8I7bVY0gFirYMNa7QkG4pksvDSHwtKsIiFL/pI8QWIX9b/yY5g89QRb2UMrpgCpuaGe1dV8WX8
 Dg9889k5leIg/NXwhJwQPaHoPFMQusFHk4ntXLcx9To/r67yBiKMGLKujCwgZtyOmx/zBataZMl
 vRQMK7nqMBWN0YZ8EoBf2HZBIdeHTEFEs+MT32y30VIy0gTJht4GmiybC+YmK1E5o++YgUntdND
 BSxJgwZ40SwFF5gCcTPkrAz4MIHuXkzNB65L951G5az3xD9QMhQRq7V7hqZxpdccRaS0Sp0If7C
 um+V9bdGKbWYbrQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Duic0ltYR4781oXs202sFEvcPIlm5-ZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX3EX6bLNgvrH9
 E6bvIgPzxLerysAcFMNv+b8JWxpJj9x0JbkD1MLFT/nnElwMakmTHnmK9vGoHAnNuVfaPbZgfTh
 FIFDGHp+qiOWR5NjrIhatTIUNOPqB1u6JUVd02QH+4CxNYIJsQfx3ZnqOYPATPaokLrpYc2AY9E
 1GocboCkHrLrnEI/S6MpJB/ZTmVNDPFSSgjLbQkHtm61XVO59lShifbWonf9VSiTbeCAH6RKgGB
 dJ0oQcit10TJaXsUcI/8YO7Qk/uJNzYf/d3h9I0Fo4mMkniYSicE09KJTyOwef4LDvACBCQoUhT
 5Tvq2fbdIgjoUDpUctdqAbOg9vPp1hxxEnT75Nuv84CHkTQ9fqOm4NlAYiyFrUuKVgRNVnno/wn
 u5RP+zlh1iDhvgGj6lFQ97esth2/wxuuSd9ZgeHUYNlCc3KwOuZC3gxN3AwRMmAbwo50zc5k9vk
 2Ort9vUN+zQCqZE53lg==
X-Proofpoint-GUID: Duic0ltYR4781oXs202sFEvcPIlm5-ZW
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed03 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=IpJZQVW2AAAA:8 a=kPtngmjWIyd-nL7Q3W8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX6wAAEQUzduZt
 zKdjFHEBHul4va747LiXJegUG1OMVXMUkdRruIhpwkOyOJACHrFKrOIdxuMCgSDrXzayLBo6pWv
 yj9ww3StdGUd3yEcfo0cV+lkAzVcNHk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Tie the CX power domain to GCC clock controllers for SDM670,
SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, SM6350,
SM4450, QDU1000, QCS8300, SDX75, SAR2130P, SC7180, SC7280, SA8775P,
X1E80100, Eliza, Kaanapali, and QCS615.

Also enable the runtime PM in each of the GCC provider drivers.

On SDM845, the DT already describes the CX as power domain for GCC,
only the driver needs runtime PM enabling.

Update the GCC bindings to document and require the CX power-domain
dependency for the affected compatibles.

Only Kaanapali and Eliza require Fixes tags, as runtime PM support was not
available when the other platforms were upstreamed.

---
Changes in v4:
- Rebased on next-20260911.
- Add missing CX power-domain bindings for QCS8300, QDU1000, SDX75, SM4450, and SM6350.
- Address Krzysztof's binding review by documenting the CX power-domain item.
- Explain why the new required property is needed to prevent CX undervolting.
- Include the direct RPMh power-domain header in binding examples.
- Link to v3: https://patch.msgid.link/20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com

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
Abel Vesa (52):
      dt-bindings: clock: qcom: gcc-sdm845: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8250: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain
      dt-bindings: clock: qcom: qcs615-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8750-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm4450-gcc: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm6350: Add CX power domain
      dt-bindings: clock: qcom: qcs8300-gcc: Add CX power domain
      dt-bindings: clock: qcom: qdu1000-gcc: Add CX power domain
      dt-bindings: clock: qcom: sdx75-gcc: Add CX power domain
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

 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml  | 9 ++++++++-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml   | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml  | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                       | 2 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi                        | 1 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                           | 1 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                           | 2 ++
 drivers/clk/qcom/gcc-eliza.c                                  | 1 +
 drivers/clk/qcom/gcc-kaanapali.c                              | 1 +
 drivers/clk/qcom/gcc-qcs615.c                                 | 1 +
 drivers/clk/qcom/gcc-qcs8300.c                                | 1 +
 drivers/clk/qcom/gcc-qdu1000.c                                | 1 +
 drivers/clk/qcom/gcc-sa8775p.c                                | 1 +
 drivers/clk/qcom/gcc-sar2130p.c                               | 1 +
 drivers/clk/qcom/gcc-sc7180.c                                 | 1 +
 drivers/clk/qcom/gcc-sc7280.c                                 | 1 +
 drivers/clk/qcom/gcc-sdm845.c                                 | 2 ++
 drivers/clk/qcom/gcc-sdx75.c                                  | 1 +
 drivers/clk/qcom/gcc-sm4450.c                                 | 1 +
 drivers/clk/qcom/gcc-sm6350.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8150.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8250.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8350.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8450.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8550.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8650.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8750.c                                 | 1 +
 drivers/clk/qcom/gcc-x1e80100.c                               | 1 +
 51 files changed, 141 insertions(+), 1 deletion(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260819-qcom-tie-cx-to-gcc-67e6697639b5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

