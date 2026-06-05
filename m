Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9E4D8DBB
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658374; cv=none; b=aS1AwP0IeHdW2YxoVkZ/0Tzgqo66Ar3VV58/z2eGW0v/EJjwHW8RxTSGRXcjG7e4BdBjSbsB5/vjOz78P4X29z45sd2ScYVRCjT+mqeHOnuF2xoDPURixcGhG0L7XkixtpZe77qqE8SqHnXmt/yFNe7UJ75tydiWUo4Cr9Sjb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658374; c=relaxed/simple;
	bh=Qt2kstaKGrB1yY49mZjobtR/4AMzw9aIfR3UkFARmBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEiGDoOLWTZW0bkajW1EhthYhB/6ZvuE2uEzu6EN5SgPXC0SfIlB3VJzPpYahgr9wkOxJFeZ6npqRDH1FIsIyetAzVK09qvZvQEL2/DTSiPmNO/qSfCBYDaepNuAI507cnIwEdtwIFGtG4C3ti/ttIfTOis3jTS5+Oqy6YVIQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=On/QpE1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+mLT8wm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="On/QpE1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+mLT8wm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555q8WZ2427810
	for <linux-clk@vger.kernel.org>; Fri, 5 Jun 2026 11:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=; b=On/QpE1srplp2xgB
	wG+v/aGlx/kEuX7FIrhxrksDYhgE6MCUi0xWqqsPiyXHdOuoZWbdGkmpDNphfTOe
	Ty79pkqLQGcdwbr7yBA4gpCNAzmoimJfn+xkSUem7BUhjUaTKH+zT2nwlyg5S2J8
	1tVTMJIi4lNZA0eqb1yCNfY0ItDncf8UJj0k/qqiv1zJmQnwlnHV9RHBYpjM6vyS
	ro2X7T562Jkjr1PgPZevB92mGzX6ILAHRRJHQtX6hn7K/U4fUF3/RJucYYuw2xOn
	+rhWCXx248wi/xpU0oUY5eqq3+q+8g+/2EFsefZjXbbt32QvIfBJEkiJwkmwcxu+
	caY2Ig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekrphh8h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 11:19:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf335549b8so27089795ad.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 04:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658370; x=1781263170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=T+mLT8wmwI/+L+xLhtSUKAmi7B2jwTuXAvEa5LwWEzNryy4m3vH9/N3NNuoqhLS9gN
         Sd+lkO8vx6er3BXRdTLjtOd4v/U3z40SNLP0tWYAgmGxHuNl8SFADcaYicZKNz2M8jgB
         TNcW5OS1p68QSQa1EPLynR4sV2Goetwv2OX76f2F21C9Az9L8/LphD3kLTvdoUIYKILb
         76DjwtqJOVNvKTRooYF52x2B6amOxkNtR6ZW2ERN66Mkw4Pqp8XZuJR8PyngE/9YQI59
         SLOXJmt0+kUAKPw+KHvteU+un/qcooIEwgybVo8sIN8LS2Q6W7jyBXUonoFllzHvTpFN
         zNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658370; x=1781263170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=LYKccEW7913HuWwf1FN+TJ98fOn7JrPrERZ2jI8sREjDXQ0z70UQ5wYMXWCMHn2QSo
         Xcax73rd+tQXQ6yC2ZMJ0LpM0bRx5k//XuRanBkfFr934Dp+gJE2uGyb7q4vYVrvsqno
         p4+/tf83naMbRjNJs9joPN7jcVU+jyszetFvewhu0/tdTayRYzBhABEDX4P7LRpQa42P
         LnlYGfVhUtwmSW195ubqqwnK3O4F4BAQPHnEnXQkUyRp38l9M7yZ87fRrY2pXeAAVSEt
         oGydAvLKr2uwhdVLGV5GMTSAUT3DNw9iZp7Sui4IYcJFPOmq+zT7xG5feH78uxI+Tk7J
         udiw==
X-Forwarded-Encrypted: i=1; AFNElJ8gOE3wwpn3ufdkFcTLmdpanN4aPV3plZqFR/b8K9Pp0xR8GRAs4ThojGgR43Com92du2DcZcIC2Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6bluhqb9gXnqc/uEyJ7viiZlmwYFPxPSQkQpspjB1NqWAtev1
	NqjNccJZ6e5sAQj49S/h4rV2G7WyoZQvTGKATzo4emywdKMamyiEEzB80NA6iTSh7YsuxYe3WEm
	GqLjayusZ+tX8d5dONefDTh3n6Coq7lLkKvTTxkeR55iZ8KnAz6wirn05ZDckuto=
X-Gm-Gg: Acq92OFW+kq53aAckuYzsHYE+YemJBTLcLNc0XTNBc0XbbB4k3NB5demn519TThaxHW
	OpiNQjs2AF8U+o8K8sJRsgoMIkLGVO27owgsXSRI2trm6lxApYX7UHYaJy5tTYRqFxcqgCYJzPd
	hRwEZ20y/QFz5C0e8U+meHg5Yl17KQ/8vzUosZi0Mcq39SudVB199jGVA9XEMfAFs4GfP73LVDI
	uzTSQ8OZr7m6Cw3vjEeG7oFitQCDVjkukRv+8B3lDeJIl2ZvMDscMGfJWg0eeVTYnwSUb+3YyNf
	8qpH54JLRlq9hO6czzCHZUaySFEqly078ZKXVmTod0CLrIVpfu+AHwD6wwPqDFxatZ8a/qzCHRu
	W7iRXw95pbOF4jFXWLfJrc3uriPCnovXZanvbPoio/moSrbj9ae4VEQp6G0+aHP4=
X-Received: by 2002:a17:902:f78d:b0:2bf:175a:db61 with SMTP id d9443c01a7336-2c1e7b35b28mr32635825ad.7.1780658370425;
        Fri, 05 Jun 2026 04:19:30 -0700 (PDT)
X-Received: by 2002:a17:902:f78d:b0:2bf:175a:db61 with SMTP id d9443c01a7336-2c1e7b35b28mr32635415ad.7.1780658370002;
        Fri, 05 Jun 2026 04:19:30 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm124551665ad.17.2026.06.05.04.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:19:29 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:49:11 +0530
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-gcc-rpmcc-clks-v4-1-a0a7bfb44455@oss.qualcomm.com>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: igxUVN66yXrXmDTCgfuk1gRPFcZCzK6q
X-Proofpoint-GUID: igxUVN66yXrXmDTCgfuk1gRPFcZCzK6q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMCBTYWx0ZWRfX5t9R/rukoH4T
 I597l8OkRrUm8HfDXmfCmGoiqI2mlxsXAMkyfnFtgK1khuoz2cORAcfxANK4kU7vtjOoQeyrl5S
 EaPy/pukgJBkSqdfMgCxj4r2L3IoxhSB2MuR4jRdR75DVhzcXWIIdjtJ90zH8q0uVWvrgcEgfWX
 hiThKexw7hcNEmhbvo4wWcVaHGiiaGuzQXcd2+ow7mETq8sX04ZcumoeeKtMQDEMU6EP26Odxkt
 MtI9DFuXdnge9udzfJm/ykjieXsNZpXYmU0V1K5H/3F2VhkNsDpr1LjsA++ZdMSudOOUON0Ncxs
 MHAv97wD8Xu4UJf6ZandRA19HdSYST+EGyR+e83p1Xc5mu4mNFKzcJ9WT9VJ1hFJXjnDX1pYzn6
 7xNDwC9uij+ZHnvgy0c1eiqTp+3/jIPKC88/PbMuZ71eVnv6rPkJ2MXwOOkXbKH3xM8+5sapisR
 drwF8xsVZ/yvvCSsPWA==
X-Authority-Analysis: v=2.4 cv=T9a8ifKQ c=1 sm=1 tr=0 ts=6a22b0c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050110

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1

