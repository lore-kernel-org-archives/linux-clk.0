Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F0F3FD970
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 21:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842790; cv=none; b=FtrqVn7KQ3AT9spe44n8Ch2fCdbE0FHjkQIhNH3nLSxeABlQlTyAIDkLMkqzR6Wt5HtKAOkAGvmQmv8poYN4euUOMBXHqEcVz4IT4ykbkFpTuq7jz5pdLnjqm0GUF/X3N8hY5axwvGsb4PxVOh92nduuKCD9Vc7hnQmLbyPS3l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842790; c=relaxed/simple;
	bh=ip8Uyl2oFgcRZWwtJXR0j8TqrNAuq0h7S8y9j+lDnVk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IsBdpGptG3q5gHEwDZ7iBVALCdpG0e4RtiLe5eAqDggWQ9qOZ2NBASo0rypF5vffsRhQP0HvbjP+f8G9EF5F9pkj+pyWzKPAVzUzSSD6cL2Z9tQn//4YDt1PlTrC1GEDfO5qckbtjgr/s878aa5zOrFtaZMct7YzEkIqnHM1ryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIuXAtUM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0WOJLny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIuXAtUM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0WOJLny"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImMv1862891
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 21:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j92jrThRL6soH6MtbhOTvj
	gHsBqSRNODwQ6Agj7cVE8=; b=BIuXAtUMwRGDSHATEgxofilwvNiX/jsYhQvMUa
	NXhLYxjkV4a+Tut9D9bTo/H5hXVqW5igqvBppSZ+z/aQbhV29LYwP5kFM0dSuZ3e
	MkQOH94ZstQrBs/5xDHCJOKXvC6U/5e1S+OmEaeG8WmEN+T2o7/qIRETY/1SIKvv
	dBQ50eKXEoSksxtI2/2D7lKp6Zlz2I5M5kpE4m7nnOzcQWeWawp1ahCdF2ifgClR
	0Cy3O4fRH4QIvCNIG8Vpx88glGzKpHTXAhU6GJOFySpdwPulek9vEeVRplMk/Q78
	FcvvBw/gs+Ku5HLOaUpUA1SHriQKR3wCQHIcPdr1wr/MNjcw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vhb0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 21:39:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso770367a12.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784842779; x=1785447579; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j92jrThRL6soH6MtbhOTvjgHsBqSRNODwQ6Agj7cVE8=;
        b=c0WOJLny4Md63LjywhPxcHYKe/0ezpzo3p2lMwDyYIVOir5q3mzM4Crs+r3U8HnTIK
         n9AAg3vk0UYwAX1tjZLSdSM7s5QfWlr62kVtKjMyv2z7lFvHuMJFNxtxMZvszilpNmI1
         XVA0JqfaQ3/aWoAhimXFNvXt4VTanwuf0+R7xgkxWbDfYySxafWnzF5/s3ZlCEIK+iXi
         s8sPCSkerJJusmkBaCqtQfXhhHrIEhdzbn8KUwiAAcl+WlVRcCvlwQEJKABnsPFFasrv
         KWI3ecnn7GGHpZulCzJ1tbe8z7Jb2Zd+upDv2Fgze3dY77dpqRv+XO2H66a4w+iELJLt
         HvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842779; x=1785447579;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j92jrThRL6soH6MtbhOTvjgHsBqSRNODwQ6Agj7cVE8=;
        b=cv1XCkVuM33oWp26JD22GJqFjMVh672wWjSfm4dxq9uazXs547fcn3IBlYqeEanKO7
         KA+AHWW4kJ6GPJqI5m46HLezifTlTDDpryGyaIpfcGgPQIz+abpc50plXodfKmR/TWrK
         Uvb/M8IPVXpSDm9KsGRh/fWBtQuvZqWx0GgkoT+pVYI5M9FO21oOKN9GL7+yA9+8qDN7
         0/lzem+DhcdQp9ZbINkHWKVxlLL+fjqK4+fBBLTn1z4L3kLicjDQD8si8dAoshsO+Qpx
         I9UW337Y16nPvM5YDsvsCpQ9IF4CoGKjZlLTXVyLNj5JdRDTaL303VrwwJaTUUmikJ1J
         qACg==
X-Forwarded-Encrypted: i=1; AHgh+RrSjHeEY4b0jXVjPRwvGVSCx2+VWYSqHW3nHDLHLrqFt4kQEoUOUggiTLO5/z0kdAMt1UtUMbSZGJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmDOzDVY8ntZXOqLpLYr3Rinj83JLjdUjOjPCbSP7wYcXLXvow
	/jG0T+R8Dc72cSQUWtnLkrVtS6+DFfO00Rbw4YioYACfb0tB6SuE6z+tqeQPf+4Dr15ZhVjU3sI
	c08N6EJgmSDALL+rf5CQbF6YAixL0Czm+D/n8zLSTPw6QcQmoto/CBNLUWaSUsI0=
X-Gm-Gg: AR+sD119/f5MNaWppAsRtjdGBDZEzclx2rm6n7PHqemRLpevhMdzRwCzhkQs9m9iwCP
	WsjJq9eEBJ4eI8M+GMH96MPjrlvQiOYYhfTC12ateLxWvFo9pRZsfo3mlnO119jGL2ey+lguXfz
	RkpkBKv96Ph7QbJRom1Mws2oabBKHyuzTYLmTQzTP7Fn77pcm9ero7SQt1sKTKGDpTflB1zcHDB
	Wxwk9GJsoxffUznmUEDSbIIHGN0mqDYkxovhLofhavDIxUi2p73hF52onmciKourVWYIpbOw4J8
	z/TR85GpcDygzwsOX8MTb/+pNERsLPG4XrAYtus/UES6mdveVRIaUqryr5nOGxPDSME5EhJNNIK
	hua2EaA37GyZCjRVPWt+inTnqm3z3ECPXWHyOOTnDhfXLGPNtlOLp3Lc=
X-Received: by 2002:a05:6a21:a8b:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c44b1a56famr5502961637.45.1784842779420;
        Thu, 23 Jul 2026 14:39:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c44b1a56famr5502924637.45.1784842778887;
        Thu, 23 Jul 2026 14:39:38 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm22904174eec.20.2026.07.23.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:39:38 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: add camera clock controller support for
 Hawi SoC
Date: Thu, 23 Jul 2026 14:38:56 -0700
Message-Id: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPCJYmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwML3eTE3ORk3YzE8kxdk6RUCwvzVOOk1CRTJaCGgqLUtMwKsGHRsbW
 1APcnnZpcAAAA
X-Change-ID: 20260508-camcc-hawi-4be887e3beb5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784842777; l=883;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=ip8Uyl2oFgcRZWwtJXR0j8TqrNAuq0h7S8y9j+lDnVk=;
 b=3pRIkh3PunAdsIQqNXpbDxGRI1UtriHcG1yEQCmDtbgnGcKeMpdzJX7TYPOjPz6mOEYiAXZOA
 LvSm/I/1xnzD5iLelbD7AEWB785e2phslqOm/R7BDTDzEcYc1TqHbMc
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfXwC1SjFkHkAgu
 TCpeAOXhp9pM0pWPuwaEltQLUOOeeixeASug6iDNd/1hvNufyUITNxZToX+WW5+6WnBnzRL4MnZ
 L47g1pCIt9is6NWjsq9yE+ZkXi+VGUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfX4cDQDl8v55ye
 XggtDpKRaQun5ltevsJci+cVFiGI6cfG5UGQr76KZcK/HK9sBPNwKQJbnLKOuhOhPyPkJ3eb3Hg
 ejZjoyjWdjfYGGJRCwJmSkbuHP2XXbBnW9G9aCdMQ6eOf1zZOPufJStVz36Pu99m8JxKAQKph11
 FqpwJnPs58FKbIiVC0aNsDV8o0FFfwD5Ecr1RTZxVrZ/l/tO/Rj5+aPAvGx7afqxrnfHjpjeXyR
 IZo5NBdHKLOO8yJW0DdHA81LS5ZCoFzoRPKjGgAC/5Wu7gqvU9lfPaxQF4mZGSfwA0su3IFR0cj
 pRH9W1YN/f0h6IvE6SOD9H4/a3H5+tumeZ+gU52ISnCdu75N7ilElWfOKDHeMTlfJgQK1pIS1i5
 NDl+DvQ7fCqyvEXlTPbwqY9l895lrj4L0/OxQARZcoF8KEWSVCS1S8KaaV0h35EJuLyLgq0RlPT
 R0+eolZzjw8WR390Gkg==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a628a1c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3-IOAT0Sqvn_RtttD7cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: kxTgH2xDvftqisSCc-Bd06WJwtmA1qAh
X-Proofpoint-ORIG-GUID: kxTgH2xDvftqisSCc-Bd06WJwtmA1qAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230209

Add support for the camera clock controllers on the upcoming
Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Vivek Aknurwar (2):
      dt-bindings: clock: qcom: Add Hawi camera clock controller
      clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   36 +-
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-hawi.c                      | 2984 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 ++
 5 files changed, 3188 insertions(+), 9 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260508-camcc-hawi-4be887e3beb5

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

