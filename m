Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A041DEE1
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572561; cv=none; b=iFgVKXevx4dYrsmXECv5WojWOGBmUx75NY4LKTZG3iKimXSdhP2QUjK9xWjHWgmnvZ6rbD/GbSESjbQx0aErh5p/kv4QmJVAfldOm3KnKusGAGQXJcD5ocsT7/ne939PZ5t3O3HnKBy+G2B6bdYg6RMERhwmacFRpG9iA6MNs30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572561; c=relaxed/simple;
	bh=bSwOuS5iyvqMiUoi9APsbBdLW4Za4qn6mGoGPuU+9Dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CgZvGHB9AmGkJ099xgU08RuFYKganu98DcKOI9+As6/xpfgiRwG0i5wp6fvxz1khii6ps4wO8veWEvcJtu/1EOJvzE15U73rElwkEbgGt/rv0HyJ5YEZ7FXRVpGHQigJANCfC5CRIY//qz+7txa2qi5QC4IMomK7PoQl/7whEUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbRhBx2W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkbUWoBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dbRhBx2W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkbUWoBT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMgM52864718
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=; b=dbRhBx2WXv2xQDLv
	nC+bJL0weP5xkhYgoNqg8vxrrmxXxCkr3lIUHC89lky6tdROAvqnnUI7BWxG+oPM
	vSoyF26CwbHm2OIXr0ScX2eBrs44rP9VbZyoeZIqs7EqPzBp4rzvgofuon0mQATr
	FeXgiPPfwZ1tX4Z0LPXu913sWwNWDTCrlIDEEHbS/LIMvqhBYJpy9Pu+5q9ZCRJB
	j8iTpK0yOmDDlcFRTKSyl7AsUtSNCGodb+oRWXta9W0Snvn5CUf4olO81aOkQnDd
	xHGzJ8/nGE6HRL0UhCpvNKFdTB+Z5Y8eDNMnS0gFrg1F9+lFWMN+IBIHu07pGdPh
	OwZO4g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90a60102d6eso22952516d6.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572558; x=1788177358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=;
        b=GkbUWoBTA08+HaLYHA5Qm1VnJN8aUD+Lhh+MxAziVb4IqU/fCEaWeo+8rwCi8IzRjM
         3I2/OmTBtyBDxF0sjceGxoQkuNVdYI4NobdjwU96hgNERa3IxxeM5AzuXR8G0Y/4JiGq
         w/dkTaS4hd4NTeF7TSnXWi9m61JYMjN9DxNgw+FRaW3qY7+bAGjBaJ7WloH3/pL9t0uf
         cDozWepQqQLZfqSS8i6bUuU5e6rsffiD76beaF8DQiL8aqWxxbi6Ly9XcTtsVWdksKdk
         Sz1A12dankdXsLyxiqZb2ai1aAVRkfYvF/a8s2cuh34rAJnngllK/Zy5lsZe8G2RTMyH
         xBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572558; x=1788177358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=;
        b=fnuIi4LkoZ2XpHzKW5TqiK3MPXrV1Z+f0eTfU2Hl+Uy2IMKvPXps+wGwTSh8ORnkqr
         Cf6kRubZemwS88eVWPlJztcCvxnZ6kKf4R8SMW/RoesC3vLue8Wh82Qqh46VCZURufpl
         V4VrJfHk+jvVBffBQ4l45/jFPI2uVHpULX/prV5jBaU/PK8X8Voc/0LGeUczrLxfyBxo
         YAOnWnMRjg3yxchgrDB15JnIG52FEwluWoNxS8/hnTUF136iccgkkw6iSYc0T8+Ccm0k
         0Ci43vunCwvkOv/pNeEQo6XkSS7RPucndjPtSchY3VDMB7GKjkqnZeydrTSmxiuFv31e
         SW5A==
X-Forwarded-Encrypted: i=1; AHgh+Rr47YHpbrb8nnq5nf+X1oO+bdOIumQBaslmj0HXKAMUgs9Do+jDkI6NlW+foksmWXMSmzQoSFzjgRU=@vger.kernel.org
X-Gm-Message-State: AFuF++lxci7FouAKjlpq8SyuA3VgpnNEbMqnnmvw+Qe7+O+moOn0hh6F
	tqkdWEvQicKmRWR8gury37ixV/05oZ41MG0wSWfL75PvDj1Yun7wP4pdbma122PZkeHfvBSfLPf
	mRoVOD1lNq/CZcq28DCFObMLBkrjc10hxNiIJa78wvjnbJLTRHzJ3pG2VA7Nqky8=
X-Gm-Gg: AR+sD10MIO834zRGDrd5sO6iAzePw08CMCJQhDeioZRbS9wy+xLqroCS+6u1wzrOzmX
	SixP+7Ipwvo3ubg0XbKsIcejSAvqj58++DrAGvDghu7WUO6Tb4TIgGNSH89jQwu2HIjghj+eBMd
	wrCpPYQyRswFwUmu0dZbjR9GCLqR1JBEg3g2rPjyAj3WqtX6CByg7We9niRuyzS/KmtCxL0c8N+
	UK0QeCKCKGL+YrYW3cS8oS0shVddP7wMlaO3CJLaUVWFm3L9qSR9lhJs8ARRHTiKW99RApHhSYA
	x3+8N+QpUBcwhr1xkWNbxUoo/rzl0h28AKf5+mQQvCyLPMuGoZVKhh5XMsinIZnN4I96O8/rPjz
	zt5UzyZ2w
X-Received: by 2002:a05:6214:4e84:b0:90c:ab32:d9 with SMTP id 6a1803df08f44-90cab3204d4mr60593466d6.9.1787572557994;
        Mon, 24 Aug 2026 04:55:57 -0700 (PDT)
X-Received: by 2002:a05:6214:4e84:b0:90c:ab32:d9 with SMTP id 6a1803df08f44-90cab3204d4mr60593256d6.9.1787572557470;
        Mon, 24 Aug 2026 04:55:57 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:11 +0300
Subject: [PATCH v3 24/47] clk: qcom: gcc-sm8150: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-24-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSwOuS5iyvqMiUoi9APsbBdLW4Za4qn6mGoGPuU+9Dg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDsrCqGvC6JweNqleixt3pT8VbWebcgAYg41
 DGu7vRW2TGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww7AAKCRAbX0TJAJUV
 VmleD/91HoAYsMeDsKwoI9wCA/8QrPWBj6TJtoq1P3VNhLGDQsFH8GfNx70BsHjkJVmPQOFcN3I
 OsY2EecrasX1+4hPiY8KAAQR40kXXH3IkEjt62pOW1WFhs0ZPuuKF4tPtWQfTjLmavOj4rcqH6d
 iVhWH9v6Y8uQAuAZVQcmFRgM5t8v7KK4t56TIWQe4fgPZRGJ/C9kpld0zW+xnxIYLihnILxX8VX
 qFzo4PkpaLgeg0+xjqf+pBpJpKXVRV0zmo1QQgQqP41zWzziEfOkPXCajsAmDwl79NU3Fv8SRX7
 fG5g7Yp+A4SjjTgJ1nkHWE/kVu2q7scp+Eki/8ygB9kG87j6vBUSKf5168LrRl9bOO+hirZMuO/
 810h93ns8oOXF1gYj5EQvsx3BH5w8AzGj7AqjBjewR0LWPlc1+uCkf5ABvRIYoY5fOtRI8sl0Fz
 sSqzwYNel9Gpc7R6jLyHt7RjVfIpmYV8LhWHpsyTT09mqLuRkJEtQHLHy8NeobbMMRs7KH6r6oY
 qSO+pC8kKmTb3/iCj1AE4yW6ZHeWbgm0JHE8NI8O2pF3ptdfF12v9rvsymYtz7pshjCL+T4pHoj
 OY84fX7f8aNqlYzTEPbCrkH/PEWg4iLohp2njTQg50AKXwxkbwol1ET0/Bc/V/uVw97mqPOXZwO
 GyTeBzact+PrpZQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0jnIcFQ0F1JJ
 uOxN+0boyb0wR9P3Kx6uN01Z0JxC5FlKWWplsPM8Ox7QqPd8vcOV1TAc8FZ766dttwtnt077XZV
 boHne4Ans4tItw65JnJ4qBDN8S28oZnnrcyxJbdLWaLY/K+I+6Cq6bX2Z3qxXhVKpYNlu9BlXKr
 Z1buNMACkXwmbFjYorYP1WBAcyRNii23R/+XL3p8xqWDfFzQX0IYZUotNoT83aYMIwxOJs2ywe2
 EIkAz9J4Bxe5KSvV3gZfCTIodWt+nfaiN8UWI+oK6mf5z+6UN9l7mWukIyveJspi/FK4xg4VW2c
 U7fbkfx5lUfUja4t1UdpuzmHkIydHOK6CX8CidPh07sWzjWzwivqttVz0W6/asVgfhL/FjeL0oC
 tNBmTpN9YsLF+J0cwpW2ETJz11asZaPyrFj5BhRQWsJeDGM9WoPIJJT/9VPakXnaiDF6IysvsIs
 8JM2ui+vl8Nz9eMA+AA==
X-Proofpoint-GUID: zAAiEhbfIYMnBFVlL4rQrFdOOMOwMCRF
X-Proofpoint-ORIG-GUID: zAAiEhbfIYMnBFVlL4rQrFdOOMOwMCRF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+xeARxufoLZ1
 9gUBlQ+CnPR1KUIJdkEzwZctFX9ooZm9YhOM4CXGjTFl0OPR8fzj34NPoPgimNlaJsawOt+hqbt
 6gSJVXzw9MRHSA58IpQZGfaedEpWqGo=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c314e cx=c_pps
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
 drivers/clk/qcom/gcc-sm8150.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index a93d1f412a7b..1404996d33c3 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3771,6 +3771,7 @@ static const struct qcom_cc_desc gcc_sm8150_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8150_resets),
 	.gdscs = gcc_sm8150_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8150_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8150_match_table[] = {

-- 
2.54.0

