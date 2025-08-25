Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C273002CC
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145975; cv=none; b=fuluaqY0B9NW/+9ZbhzWA2l2SF4028x7zM3qJUSYty2aEy/T7nPeScOSMbf4SRczUWw0FCGiLdptHc0rdbGobVVJ8iWbJDgk5DuPCDR3ARmD+1X2UTpL5C5Vo79IL0TD/KaD5lmALU8E7gEQZkyoPUMtjytocc/4kJsTtEBVX1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145975; c=relaxed/simple;
	bh=Z0kZ7CUuc3z5own5uSJ060FKIchIKAXnRIi1NENCfjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fzy3TPkUS6i1Zkdi6cy5Nk2O3Zgwogh9E8co9UMMWzEtIpfZiZ7dqdN5iAkromK9mJEWZbEajaBGr8SI1bphOcFQ/PjPCHS5AZh0VghDvA1vzZ+ujBGjMRUFd1ccKiIb21zvCDqAuN3UiAL5sPSdeI7SH7Sk038WT3d59Yo64VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjOyVg57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjOyVg57"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG81CD028616
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9N/u7K2gXkeEvZixNyEyu8saL0lvRgYaWEIkCSty2s=; b=DjOyVg57Y5WJcakb
	hjcSoI5aFBFhGvwmLUnVgQy6WyPIo6N/nHcfn7wJl7fCGH572FlaFG3tnF29x8Z6
	phzKNeGbtlC0Y8HZlk92sZuy3LuLAMQDiXHKHy4eUnNtsm/PnaTjIlS+vxk04H0N
	H/gPcQyV7INz/+qC85siDGvzR3NugzgcNTBfeTp/fKHvAGCywwLk+AkaRLKlak5D
	A1/GJmIyQbmwTdt8ncP+d3zjfCLkVPU3rOt8y8CYJ5mBBbB1eBN2CezQ0MT7zeO7
	0rYLAQV3K6M/27Zig+u7/9RyVyGn+350qcL7+stYIZ1z0jYTUAtxsATzwhzicsqf
	Rt0k2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdx020-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-246fbc9a3ecso7379995ad.3
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 11:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756145972; x=1756750772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9N/u7K2gXkeEvZixNyEyu8saL0lvRgYaWEIkCSty2s=;
        b=Fffq9YuJCsgabV2SyAkOj3jEpGbXuZrHm0bflA7rPKr8CaB2LOcEMfwh/8wInglMGN
         u/EusM94YBGb+eeqSfj0h0q32hPo0ia/EV6H2TtqihVGn61hZPH+CDir7vbqFW9fq65C
         D68F4mwQ5MtfWK1afyaNhDImvFKHXpS266iUSEXff1icmkk+x2ug2Sjs0dlIkhfQyXs1
         WMkeNJBoRQKqoVBh32on6blB8QHI1k8TBH75ZRlszsz2hqBxj6/eLHxn+qc0pvhsRHmC
         7cQg27ia05mvQssqF1O2quW9z3elriCUkXyBaEN8Drye6WirIqRnM56oi1Cq9drFZ+IT
         U4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFvR4pkNcou2+ydAEscQEcWI2y69aL/NJo+9z9IR9oHjDNp0E28vwlFyZ+E/2y0uxcT+FkPVaB0yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBZZwWfSAMc+Fa4dj92srQm7ADzquBaTDUsI6+PADqbzxVYXD1
	lEHxQSTiTOa0B5kMjktO2yqephW5YoYoq1i5bVqC8lYUN5BzMyZm7GLrVBxhQFhg2nhUBYMzVUG
	bVpC5Lpn8YZZNAAsvXhX7RJ4YyY/1y4Uc97wkRJxMyQBmjHGgOOMTgv82LoUch6U=
X-Gm-Gg: ASbGncuLHlqG9ntOn2ipoHtCMvOZXb+2wg+t+KuAyRNVWXSohleIVkxvLNJXQgl/Akg
	pkvDjLCPoLkIr2GR232BKQxxjf23X6mnY/aKOFz0dCwmRVTxl0514iNxUaUOyoNfov6VqdhOF2q
	OAo3bydeTlbL6/mZ7e91gJuOp+UiEMOiycllfXejAa8kUPVqnPfZbg/DfAQVJ0QZ/xDErgFc46+
	3/LI2l4DuOyq7QhRwIRartH4H72fzTJLlVUV6KotwKRSXTq/roEiboibHREqBFp39tIB5eSdNoJ
	DGYUHK0ENBrddFxU5XdhWCoNkuW3sYRDXvKHSFQYKUkkbKNG9480zBJUiegfvde4
X-Received: by 2002:a17:902:d48e:b0:246:441f:f144 with SMTP id d9443c01a7336-246441ff51fmr170733475ad.56.1756145971593;
        Mon, 25 Aug 2025 11:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoHCXN0pnoD1hQs4BeT0/dzqTl6jh6CQ/sTZS7KdstHbNbmX2M9g1BYidj1V41oZ6kgYySsA==
X-Received: by 2002:a17:902:d48e:b0:246:441f:f144 with SMTP id d9443c01a7336-246441ff51fmr170733205ad.56.1756145971129;
        Mon, 25 Aug 2025 11:19:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688647acsm74174015ad.87.2025.08.25.11.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:19:30 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:49:08 +0530
Subject: [PATCH v5 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur-clock-controller-v5-v5-1-01b8c8681bcd@oss.qualcomm.com>
References: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
In-Reply-To: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: nACzr7ApuJa8AqweTrphUaMYmk0bO2Kc
X-Proofpoint-ORIG-GUID: nACzr7ApuJa8AqweTrphUaMYmk0bO2Kc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX7RL3hvxt85ZC
 d6MLwYeHrwZOf6shjOjszrL67f/Ml/bRLWGgsH1XWXM2x3p4XcdKmGVj3oIzQoQo+QD1Cu9Ys9H
 WNb/v7ZGeT/jm6pzXQ3PkmGcQjIxRax7vRSfLjkk8U0O8S4jkC48R/qQiBV56wXS3RiT7Xa1ivq
 RywyJz4+7GKNlR0ypJvU/ot+72D/xVLqAk7DshetE6caO5KVNMkqVc4ZGrX5GsDFUv8t6qcwdWO
 L1VUMpBMc4VzDLM3j4IFRI1q2OhmUynKk0BDZrsTWBgjqzbSzTX+lQjelK29wk5K1H1Wc16MCoR
 kmdwIxR/lx6nTbFKHL3DZikMohZuEtiOb5mUuhfjtDPm8AQWZ2ZLbhdUYRmR7SYQUbLz4cZNc72
 kWb43elU
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68aca934 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VCPuoYa76ZImaTyFhsgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Add bindings and update documentation compatible for RPMh clock
controller on Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a4414ba0b287b23e69a913d10befa5d7368ff08b..78fa0572668578c17474e84250fed18b48b93b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk

-- 
2.34.1

