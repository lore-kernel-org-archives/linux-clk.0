Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE42AF1D
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771363267; cv=none; b=cqPQg8dQ9RRVPKq+/Eaxl1l8mfqtvoSgRMxuAer8329ZV+nJeEJARKR3pisDAq3GlvsOIlNPUpUoTlKxbBwkv93fmPypuJdMbz22g04npWQ0xNvoWh1k35BE3rBRe0VyiEi2E7bkK4o4gja509KLuoBD7nrpJRV7tEUSK3qCTrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771363267; c=relaxed/simple;
	bh=So5DAPOagglRuxxNfRxbVzdVheY/RSOxfrbm5LalMuA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LlSopF//hCGuDj0pi9rOUT8ben8+FIhsmwHO+G06YQMHxjWvkZT80Hl3Q6HO2FYzDO4QjptOKxaWiYxDer9aZDx/I49ivDnU78F3F0PSkL8wHsEPNo/O9bWpd+r2Ba7bqbNJIpPdczOJ6jTDzlq/7FvWtroeGsrXsJSFftkCYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VuBMFuR8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqKyehPp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuBMFuR8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqKyehPp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HEAhap2111517
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 21:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mpo6ZXOUjqQn+TnZjbujeQ
	vk1oiNsJperFxg8Nu2lFI=; b=VuBMFuR8uY8S1QJNruz4RfsdHbZma2nj7hjm9l
	pKyfHjuZFCL06YxjpfO8ewsBI8O2Ii0/snzse2oG0GpURIRggKJSPUqJXcT9d0M5
	Frras3H9FfmkuAeNHiJGNdRxarsxYgATYN3ocmy5pn36FVNKyMZYlaJDR5mKnGE5
	2ENWW9gYcP9fOE0NGtopC8LNwIB/QFYLeU1Mitjf4h7QhIQAWQIgeOeN9waj1HlU
	iVoJJB2D/Ynf8PBSTwyg0sNxLndI2LZahr738ut7T9ADSBUpF57D2cTrmv9YEo5J
	dXZWzi6UYOumnDXx8gIqvBosP3B+B00fWWakTbKrvodLGXKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4jr7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 21:21:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71304beb4so2180190685a.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771363263; x=1771968063; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mpo6ZXOUjqQn+TnZjbujeQvk1oiNsJperFxg8Nu2lFI=;
        b=aqKyehPp3ecE/EQYzQlzmCzUD3Jws+m92CSXRrJYHfQXAjEcoJmLxY7ZYScrT0wsr7
         hhZewqfY8R/ZbY6lMO09+9Bo0iWuXfsGn8diu6DWC+AC42stLzgGRsMDACuYMos72Qyx
         CkgSBHZbjiJcLr/bLBVvUZQ1gk97vDYOr2noiLq17PLH5cw8pPIsS/qB7o5HzXW4LaCX
         IOBGWinlXhncyg1tTRdtxxbQdkC5iMDfxenOO57+J5Onw5vzYqCrDaisLb4BsE8frwJu
         zW+qYgfDP5ojp9lpwmUpYmET/nfIZRxW15KU99jUvKw8kjn6Z2BwUp6/ZM+7zFHzVa2W
         2Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771363263; x=1771968063;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mpo6ZXOUjqQn+TnZjbujeQvk1oiNsJperFxg8Nu2lFI=;
        b=YUd56QTv5HDw54z/rhxThOSKyCQk4p9aBWKynupwdonJoRh+aHUbBYh8jbGY9dmr6J
         bvQlT6iXBWinjbc7XRfeAzi/Xx4uJOGzNCuAsW6uTNe6j7ugjjGfaC6v3QWWi+ojuE2+
         H25zNLKnT+tpF1AYHqYTpbw9QUawncNtqQxvrK9EAOGip9gyNjqRzcloJd/uDnYJ2xIq
         A88rKVjblhEpexnAhockx29kwWQ3pYt1bbsujFBZmrHzGxlUiG0tWJvzy7aQF8g4sCwF
         zK0qqXFzrrMwcs4hcW/3xzu2GcVrPWd4StgQHO+uMXMKEWhKut1rT44ujA3WgShwNEap
         oNKg==
X-Forwarded-Encrypted: i=1; AJvYcCUnKSmrZx4Qi8lX6URasNXD7W1gmj2Y4+iAI/ghbKUDl4JZc5dTFt7aHcGZwpDzWqIPi0JCnBekP8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzW56OC1j3CZAuaPDZJiBHGL4YrVPwNvmEaLTUfVh0I2UCUj+4
	rbh0qs3956Hk1erGvHXQmYapixoprViE4fTiy1fR1BoWPqFTSCyFxT3MvgClpB42I6u4gWi37Jx
	EhvX+wf/a+WstDdKkZys5Ok/gSW1zoUTk6h3ox/zzwWAEVDwpIKMPYPxgDSx7q0A=
X-Gm-Gg: AZuq6aJ9rEHnfNbhW553Edyg1XvE1KsOY4LB6/HW4Z1A7NTDJoE0LhlZJZN2BQmowuq
	xUZbg1tKQuQmuUUIkw+eCI1AR2+U3a+ltpv+w9oR0zlXCGs10Hjdkc/dwz8KRE03IuikM8VZg6Y
	H2xyAxnomfPSjfh5ectZ2tRVebQ2A/ez4oyDEGMXDaYIqqIDfxa9yhK5pHyw53XGfBKvv24uRLK
	/OZvi9ycd5udrR7sQwbCHSiSDp22oLX1oW1UfEnQIBk/zhAhTU6alOafOJB0JBuNjT6vX/3qsFJ
	09LcuUOy038Q29RiDy5QfsVbt+mey7o55sg7p4LwHOYz6WovCwPJLabeusjzBZHdRnYzIlO9c97
	tGQkxdPy8f7P2Jmya1AIELqwo5fSTbRvSOEJYj/eOlIX/b+23dbsaB1BWQ4RsmkNi5rXf9qezIy
	r4SqALqepvoqa5QLrMpw0avGPYaOHftj7f958=
X-Received: by 2002:a05:620a:2995:b0:8c7:9e6:3a7e with SMTP id af79cd13be357-8cb42172477mr1687430885a.0.1771363263026;
        Tue, 17 Feb 2026 13:21:03 -0800 (PST)
X-Received: by 2002:a05:620a:2995:b0:8c7:9e6:3a7e with SMTP id af79cd13be357-8cb42172477mr1687427085a.0.1771363262487;
        Tue, 17 Feb 2026 13:21:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068923c3sm39293311fa.5.2026.02.17.13.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 13:21:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: support SDM845 HDK
Date: Tue, 17 Feb 2026 23:20:41 +0200
Message-Id: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnblGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMj3eKUXAsTU92MlGxdSxMzM1Njg2QTIzNzJaCGgqLUtMwKsGHRsbW
 1ALj4rUtcAAAA
X-Change-ID: 20260122-sdm845-hdk-9466530c4267
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=So5DAPOagglRuxxNfRxbVzdVheY/RSOxfrbm5LalMuA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBplNu6wAsYqbpsJtY47TFZemmJPOiA4bX87bJqd
 PUT9143tIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaZTbugAKCRCLPIo+Aiko
 1V9BCACifkopt7md6LE/Lrw4HdJ1gOTp3SBRc2ppzfdSpwUM2HPFxh8yNrLwDAHo+cj8nfumo+0
 fErmKzrHYlxL7Kexx7Y97qXtUfEqHHlbhgSbfVKG4NQ1hAsY/qY0/cXr/qths/B0MO41qeBUTsJ
 aCXmP5isXV58q5YosxDb2U2AjoGGmLOyLw9oInnH1VGetjLYctjhslDIIkN/t3ghOJReKwQzBGz
 5QskmKIidHTTQ/lJlYK6qqYXFSgCKfl6aivRtD5r7DXoBpUwNcV1Z/KGAW446gO1AVpBXYXsvm3
 nHSEkjW9eGa2Aq0cr8WyNW0hD0qg3TLGH3Fuc7gfjmbTWHKV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=6994dbc0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=mHcH_6gvefJmbxJJHiAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE3NSBTYWx0ZWRfXxgse9+odilIn
 nvmFih0kRIfXFMJHQrDjZXAY4sFx3ycprR36okAjYPTJSSl6cjosP/JUO5Uua2wSqkwWqCEAQhe
 FJuNg8waqH4t7doWZ8rocZChI0k364rR/kYuNx5daakjQ2ygeX+x+M/ZvLmnwSItuQl4mtqDZOs
 gHr2y1mwlr0IUOL2LvQuLCzk078m+PfPZLffEAlPY+5Ol/ILClWXtde28ltJp1+nXXUQXcU9FYo
 ondI6AkjrDPgJUb8RPs2tOFKnb3vQxhhSuLJ1EOaCCqetMbRCnd/m5XyEZSzQoeyxRfb02F1t1P
 qUqzxdVgEL7aNKZklvcYjkIaoHd6i0I7oElENg5rYnCp7UBluXWT0x5CNVQmex/+x4FuQ9vOyaR
 Mi09Ewhc8c19VYkojhxdcw54qzGpoFSjf3Bee1caRu3fbcaK9rBi+7FzRg4X6Nz8Bh6cIHBYeHW
 m2Ta1lejB3KmtT4AGbA==
X-Proofpoint-GUID: qmO9_yJHn3wcupODHOnil2cJ2TB7vUDL
X-Proofpoint-ORIG-GUID: qmO9_yJHn3wcupODHOnil2cJ2TB7vUDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170175

Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
version of the chip (SDA845) and provides a rich set of the peripherals
and connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
David Heidelberg (1):
      arm64: dts: qcom: sdm845: Add missing MDSS reset

Dmitry Baryshkov (3):
      clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON flag for MDSS domain
      dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      arm64: dts: qcom: add device tree for SDM845-HDK

 Documentation/devicetree/bindings/arm/qcom.yaml |   1 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts         | 820 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi            |   1 +
 drivers/clk/qcom/dispcc-sdm845.c                |   1 +
 5 files changed, 824 insertions(+)
---
base-commit: 54f467c01375a137f5801a910089138d2202b148
change-id: 20260122-sdm845-hdk-9466530c4267

Best regards,
-- 
With best wishes
Dmitry

