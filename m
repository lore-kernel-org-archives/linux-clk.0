Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C9C3B3883
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948516; cv=none; b=kC9UWtXUPmp2SNJNGL8yI5+w2dX7icNtRwGzOm2RwgKn2HkBhrmBeBnw/tGDL6gbm4bxkEqsP4z+XrVKeTjVCbi8KiyaVIdCe8pAczJwml5MFFSat6za2AdZ15/TRGVo28T+cRQYkfWWpeBSHyPpC4tLrErURIDf0yee9M5kmcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948516; c=relaxed/simple;
	bh=RhK2YzNaAdFsBNuwzgXhz8JaZgpPP3+1u11J8QvAJkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rcAT5c7Q6CAylTWYG2qIXJXWUwlEQDKyxM3Uy0ZKtBR3ZlUxFyVKR7wTHZ84q0yEhbcQC+wTWSQIsseQgRaP+q8X9HoftjBwX3fm/I3IFKIg7JbzF8OCm2T/ugxjT4bRUQhDvxgk0FeZHOpsPCDQNrUXnMS3iB4GphDFYDEraeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ys/PvQzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIScMB7N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ys/PvQzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIScMB7N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVTVM303092
	for <linux-clk@vger.kernel.org>; Wed, 5 Aug 2026 16:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s0x/y82/ZYCWr8KscfSkCm
	6MtpItQIqFoVaXXVZMU2c=; b=Ys/PvQzrQbbUfPL6Pmb2NmRqBiEYU5N+tNsAxG
	lHFyhHKTX6XNcByJiyMqbMKqyACvwZbJGGyAReT1NshdQPQEJjZ0zm0j/29tGksS
	up/5CH9JOc0uC0rRvQOlEofkCSyrRZl30mC+rxifMGV4Z2tLVg+i8jFDPcNjCsmz
	YtiW0kHAJLGbQXLjNnP2Jj8XsSC7fxZdcNY77WZd0rfs4c+PrybTxX0Wp2C8LUc7
	jMs439VS34ImuNqOBYUqEZQodImYM9l3tII/pp61DAtY+TyTyVlj+W2OdBLXrtha
	TNVuTkogXF4OQW4xjU1Pv4LoqjAZ7QZCyiXhcUuJ2pX9NuuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3um0kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 16:48:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa55c9430so12487215ad.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785948513; x=1786553313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s0x/y82/ZYCWr8KscfSkCm6MtpItQIqFoVaXXVZMU2c=;
        b=DIScMB7NRXB/loxZc90VEa/AjX6HkZiNyPp/qvToxW6IPTV84/4VP3pFiDUgEh/a7X
         Ju3whD7RtYDqUHS+rWi0R7NKYG6n/Prrkvj6dQIV0RWA4i6He2Yk4d+Qi55MNDBwVJHH
         isg1MKYI3SEmo2YFN4TAEvqMO38W1SDGnxO1h+OzyswbOT9/KO783nLs2XgTWC6hk28t
         /MaNkDrds66hkL06HFjA43OoRsA/g2lAyu1bXzQQpJylCDWHCnbmXxFlpGH0pGk4Z02y
         SBvDZArcqjwqyUfJFnZf7K2C7AsWnAqN2XM2rio7zUZ9DLMqgFADszddf2fh7nlaXcEJ
         3Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948513; x=1786553313;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s0x/y82/ZYCWr8KscfSkCm6MtpItQIqFoVaXXVZMU2c=;
        b=PtR+1VJRfZ/aoikMO8nkz2fK0hl6cPo/tgv++N7g4dDy2dhiWKQRadJzNX1beI5tf2
         Q42D3oA1uLDXDujBNRRPP86pLa+RgLe/NoUrK3BAY1QGjVAwmhQ42bSgrmbh0BSZt0l2
         K5Oa3YVFA6/JLW41qKWv241a8ScrvGS35WmObksYYKJzw07cQtwFBr9Yl2w3FqkD39Bx
         e9Fa2fCsdfa+8FM0+cU9Td1JdNt3EeHUXFseRcRge5JT+O+Jj7HN9+jpsf25Z9lSb1Gj
         nzRGVILniGSX5xAw3LbuLZGhpk9MO3lmqjY8+728raWPx0/U82Z9v5M1UzmqgUTdhbTA
         a6MA==
X-Forwarded-Encrypted: i=1; AHgh+Rr26sqfpMK+zAqqqsCuzrnEs1SOECUUZJNMWkoV0BUbQRxVOCd3EGQys0beZeShXZDMTIWfbMjlGEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjETKa+DUdNn9Wgs1UnrQ2yKe9MFupVJlM3j2EjfkO0nzSb7MS
	Pm4z0dK6mLH/5wnXWsmeD0zHhfpRzt916xGAAESXgQbKjkSra7g2xT5bxJRQeKFQA4FryF/r5ME
	F1kpzxsoxkbNBeexj4x1zG326dTHkGGXVMYSzHFx+bL5joGgNSQCZeFhC+l9+hFU=
X-Gm-Gg: AR+sD10Sx0HaKbMM4M0Ka2x84YPkQGhASci0gAGBwz+D7mD+IgmGExihJnWFIGUI5TY
	XiwoklA54FMpm5co2EkAZrSd/1J+Ondp+7zTNfr4pi8A7UlmaPZ/EKq6bhTIECZRNG6+355gZXa
	9EtWrxCHE0yEp/AilI03VgDHiOIR3K8ZFwqdeMXQgpoMmDrFXcxKNjK7ROslI3j2Eao52CDiydW
	tb76uAqPuB/Zc5fp9MHWK2ovmsEjclIAjSzdzLWLXKYxHuJkwOvt2PJSmXMM7IdVeR9Lb23NfW2
	q/GiivBmGiyyIRjLPsxzONBKpjVhJEpuP6+baISBKBCJpzKFeDpR3mpoCZzcAE/z+rJ9E0AHfhv
	8mBm7DBSq0hJnFt99v8zcITzfpAUTpvo=
X-Received: by 2002:a17:902:d547:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2d0ca7faee4mr95892775ad.16.1785948513490;
        Wed, 05 Aug 2026 09:48:33 -0700 (PDT)
X-Received: by 2002:a17:902:d547:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2d0ca7faee4mr95892365ad.16.1785948513087;
        Wed, 05 Aug 2026 09:48:33 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d986fsm19159465ad.75.2026.08.05.09.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:48:32 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
Date: Wed, 05 Aug 2026 22:17:12 +0530
Message-Id: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBpc2oC/x3MSQqAMAxA0atI1gaqBaeriIsaUw2KQyMiiHe3u
 HyL/x9QDsIKTfJA4EtUtjUiSxOgya0jowzRkJu8MKXN8CCtrDF4KiEts6Lv+7qo/OCotBCzPbC
 X+1+23ft+FrYslmIAAAA=
X-Change-ID: 20260731-qcs8300-tsc-clks-fbb968fdac73
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX65+M9aSNzy2s
 4qGm/hRDYEddBDLGPYZ+2/ombAEhMrscNQ9xYVEPw2IPfpSaqZZrdfsjkQ3n/3LMEoz+xBCaTuY
 48MeUA8XehkQ2Pn4HQuEC6Lv7JpARZo=
X-Proofpoint-GUID: DHF14gJtxid0NM8pEPHnJgNpioyO0Ox0
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a736962 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DcIv4KPYSJKIViMFPNcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: DHF14gJtxid0NM8pEPHnJgNpioyO0Ox0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX8Yd6G6ecVio3
 nDRfmBk6HZp67nNYSMr5P3CBUGe8E576x2SPpFRFnYqB22/wSIavZLujW/Py0lLby66nSbK0F0K
 OXnxOH2pnRzIByOaaZ8tqtOoLtsXlRorGcqtOHVQPa86pRehAZMPYixCcb+UAntzaacts9QT8W7
 IyncVGNbK/+ySheXfBfqswzRgk0H+CoipEuJ5saATDIueFCzIf3rc31oMOLlFe3JB5NyaO4tP8s
 RBo+WReeZMJlMSBMIpOrmwdfOMa+K16bNp836nue00fxOtBmrFYTgw7SuesbHO1LZDZeyH3Yt9y
 gDVkvKOvq121DjnAvPYOwLm8EBPB2yrEB9y07wF6CJhPqUr5ngwfs71P67N1LEz+6yaQNGlZTRY
 y6JfMBXWw2Ctu/UAXOWMl3qWWoaZf1nfPzerF8IDCWmvW5DPs5j+O+P9AmUZtFxvOHb4IRXtLJr
 6hXAXNYqcSqHn5DUHpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050137

This series adds support for the GCC TSCSS clocks required for the
Timestamp Counter Subsystem (TSCSS) hardware functionality on Qualcomm
QCS8300 SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (2):
      dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks and resets
      clk: qcom: gcc-qcs8300: Add support for TSCSS clocks and resets

 drivers/clk/qcom/gcc-qcs8300.c               | 103 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h |   6 ++
 2 files changed, 109 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260731-qcs8300-tsc-clks-fbb968fdac73

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

