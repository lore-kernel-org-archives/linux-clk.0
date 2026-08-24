Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865654137AB
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572525; cv=none; b=FFzPREkfbSFdymLT9z5K0QawurQ0q1GTks8bj4SD6xeSHzV1SaXD6kdZpEPaG9hIHcAbOzRcT/CwCvCO7U/GxihGEOiRmPNyapdX6YapMFtrZ57zPVBR2szLQLGmvt5+W+Hs8qC+Z+qFrJSfzQ4j5iHmkrhWFT7zJRWu0y1u3MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572525; c=relaxed/simple;
	bh=sXwTkxDNsrjYc3YUNdYCEcpknwYEPLb7oSVj9VLIH/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OED82MV+4EGMtxLIP4eggA+0TAywj6wAsBXj8gc52w+xlIpnhSNuXXvo52MHGz4Oy0cn+L6w3L08kpHCywG5aba5kJMSf3AyXbPX4NadJhGEAeAH58aUYlgGBpBNwQAS50+8nFkbPEQfv8JqXK0wQ53eSFymk5TVuQ+tHFVPlyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXjPQD9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN4xDBgL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXjPQD9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN4xDBgL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMV2l2647985
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb9AG8NLGUD0/K09IwQY7+LrrefzUKzqTwmTKJvCiIk=; b=UXjPQD9dN8ncwMIh
	i7vWtp/8Ai1Z2N5DJwkI5kmvUsukgWKTydoXOQTJoUh8GyemvDlQZ+Fq/F/A0cla
	PP5B88QTWvceVsXqOGRfO+mVISdyYZgi93PdMH/ZbX/gH6DYunMu17SNRqEC8ojN
	Jwby2KW09lLzJ5zIAEGmEuR+JM063mArGvlDa3Yk+qNRqbBYlV4zdPfe5vwpPQ0c
	vrLZ3ikU/LB2oFq7kbnLkZwU1ro7YrKC2E4rEmkrqbulDm9q1WZqGqDWU/DBwcvh
	68Ss+y3onAIBG68tJyOflv0jSk/sySlktKJx0Hq35rzBZBrDNigFrWhOkSaa7WK1
	gt3e8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9aas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d9cef8d15so63874951cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572522; x=1788177322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb9AG8NLGUD0/K09IwQY7+LrrefzUKzqTwmTKJvCiIk=;
        b=XN4xDBgLwVySXO+bpLkYvNaLO706G9dYiEipJwOcqROV6IVcrwlRfRam9yq4zO6ZiC
         7CjKy2zehwmcIgV9gxa+GpaD1Ffe5GrFh0uEvKAtuKR8siclLg0NUDNIT6TAnPF8O+lu
         +XsZyPblujfVnDQTbbLRzRH2XUadGRkFS9RMEgocYPch9HOypnXXQIXElqhnUaevrQzQ
         x2wT7yR09IhyXgthc8LHnw3rsJdgQ+QsmfvgxATM6zWsAlIANuNwATBIU5cmt2dJVudt
         VgDFn247+3xbfdyaVpZ+J9VJadG/3peTAfTV1/Se52cIqfHTaJTG4eOelArGg3VdG3tm
         14FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572522; x=1788177322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eb9AG8NLGUD0/K09IwQY7+LrrefzUKzqTwmTKJvCiIk=;
        b=eH+EEIolXD7OsvCJH9z9WF0YavjMPrzxcRvgGb8KZIFTdEbji8Gh0Rqqb0b4NFwIrL
         zfVxoJfI5HXD5Siv0wVAIeIU1Pbv6zXlBscFRPZ+iS4YO3J/snwAarSlT5ycL6ao+MFd
         0Ucfy9pXDxl1ZxcHOhq7oH9pw82Oig5balLnMnmKbQFzxjq1pJOI50nGh7NhuaRyLl47
         1q2s0FEzpv/9Mf56oCm74EsBhQji9hmvkpTbTl9BfHtvc3AqAfrbjixMmqrJaPwlcmGT
         6IA8znQreaQmUYYG7Vlp+X95J7bV84DLxQCGkrHzaKalLeqFeH1F1XdLdaPge+zkMHc8
         UWfA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7i0bAfR3I1Tpa/Azp91XAOIl5Td2+omQSHKsx00c+YJ91X8j3s4oPx5GeWzDe/FzAiumR+swbKQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++k1S9qeqzfRMGn68u/M6dqWpxQsUg3HdnFsYk8BkAJeRwUBCY8F
	+yViVc/DOUiZTLWwx+AQYFWhRYLY8I1TJZrYPyZINCRLWgS570s00vl9bUg+v55ZF7XBbCUzdvQ
	7v7G+QuZ/UMM7H8Medq9l3720SepYAsHm4iynXeIGp4VN01sln30YEPe5lO72Nyo=
X-Gm-Gg: AR+sD11i/xzCZH2ok6Woz0HUouvzjlyPoQcrq1X1L/E4au0OR+h6FKfXdy8M19MS0eL
	EnBfFnZbjR0E0sVIADusBeYRu+yuklGRxNUpdYyVBRN/I2UP6jA8E/dRQB3HtzYrcFvRstbdjHu
	yrVtM5XCBJb74ab/M4Yp4fGamzg5dnAPlCs4PhbyEW2TNZo2FjO9wMxYqMGXe/4LjNDUm9n7sU2
	tjJkzcwAeffTomU+7XD0+tspl70rvNyUX7tj0Ilnm8xf/bbntrul922i2NOxn8Rs4Yxrv6RiJfv
	mdF4e+2Y3CmIwoFcwqKgGz/an5sHQUNwarSNg4Ag3SUXl+YiAIB2HrjnCqhGWKBIXYw/auy/U0E
	vT1t6TKYH
X-Received: by 2002:a05:622a:48c:b0:52d:6de2:906c with SMTP id d75a77b69052e-52e09bd76b6mr171413901cf.14.1787572521721;
        Mon, 24 Aug 2026 04:55:21 -0700 (PDT)
X-Received: by 2002:a05:622a:48c:b0:52d:6de2:906c with SMTP id d75a77b69052e-52e09bd76b6mr171413451cf.14.1787572521237;
        Mon, 24 Aug 2026 04:55:21 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:59 +0300
Subject: [PATCH v3 12/47] clk: qcom: gcc-qcs615: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-12-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sXwTkxDNsrjYc3YUNdYCEcpknwYEPLb7oSVj9VLIH/s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDhJhYCWO5CziHTTFNnVIGcJZ5qqsW2uXo2P
 KxD03z2unWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww4QAKCRAbX0TJAJUV
 VriED/9OYMQXxyf190SflJI+C3U4t9f3CvfOndlMetaQo0KhFG4WEf0exBpa7UMba7mQnM4M2FW
 VV0fQj1mBb/OWxQVKRG2kQIR1sxqFP0oW2ARXEVCvB9IyR5+bF9T5fHC0QksGdZrb+MGDCi/jvq
 wvcJTKnVIYgacO1AzW7a1eDRmhli06cuQwQO3yz4sQq6IHX7+iAm7Xu8tObTk7r+FDgJdua7yAE
 y4/aXz19T2Jat3i6x4M/qOjkZiDzuDopnh6o/SVnvFEfuA2mllgI8/XHHdxfXSdlLFtmToIy174
 Zmu/J0euKMh0GTuotmWBOrTHWI9rphJFb+kjHbsO4tl5vBVHAulyDWW3iyCLXqfX3uml5ANVwTf
 HYKL/ykIo+1FWlOdZfoJolSxLTB8n9pgSz4A+q71zRd3SNmC/8jQccDgwXpw7tdwKyMuol82Vx8
 EFzbKe9m6JZRGRJTzmm+rfYUg5C3LsVQ8h4jsh2mpOuU2BLVVayh/U+s/vVp/MOipV++4hOYwGH
 taDtUNktqevs3x9AXzcpOPlp+fovYcDh6mg0BrEDp0DYl3o63DuWXPFNbZGYMMHNsWriBwvupc5
 huzNMESA1SbQBKF+9oZoqhvxLdD02tN6tXk3MtJyg55GIHhu+/mmbMYwTnfvDHhGzDc/PQjSPpT
 DcLWri/nhWsBvhw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX6tfwUPCTdxJA
 LOvMxKo562E1e8xkEe39V2BBXmwwV//dRyKjQbUfFovWIfWvLT8yqmjht3ttAnapw1jp2YPqNlD
 mI8qM8lmz+hG3UHbFMI3UtPnJtZpRuo=
X-Proofpoint-GUID: rojjjyArAKeFSp5IzUyegl4rU2Cz2vwM
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c312a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXwQt1GgCYKc/D
 uO239h6uhZu6iSVcTC6CYVAqdSwDqJW2vH39/uuK0nuI4Vl7aWNNuX+OvnYSt6Ka2slm9b0uWCJ
 lpObzaSCYUQrBm3nIbcMAlvqhwewmQ56BU4sBaJTmnEuA19bCvjeinJ9erVCCOutU9bLlekYLiq
 jmUumQwarfxJyjmel5BOUhBicU5ev2hog6nU3VK3Y1wkAITxL8yrpsqGo2Ex3yUmNogEaLbN+Oe
 jhuSqbLlR+8+aDu2A/ayxqA470PD3I4XQ8vh1PygSjkD12BbigSdaGtXIypGTKZ5GiCCZjQX06x
 YFOrCf3qemwkGv93qZmMzzanqHFovLggcaAYzoRtlgVhxULq0J1XmoPjgdEHX58uccuZ4zlHfSe
 15Y7J8nuk0YoXwzZ4u+By1cF2tcufK4blUEejXaBHCW1xYJ7/ex75D/ZARjG8lvsIvavFPF8Yhz
 7O5MU9mwsfEV2KzyPiw==
X-Proofpoint-ORIG-GUID: rojjjyArAKeFSp5IzUyegl4rU2Cz2vwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..601c81c84450 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2967,6 +2967,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc = {
 	.resets = gcc_qcs615_resets,
 	.num_resets = ARRAY_SIZE(gcc_qcs615_resets),
 	.gdscs = gcc_qcs615_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs615_gdscs),
 };
 

-- 
2.54.0

