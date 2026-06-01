Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDC213E89
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338144; cv=none; b=egoGbGqVDp+llgLWaNlGR9UY/9A1Y8KxDF4jW5c8EVm6BXW1aHlJLF2fbMqzPKMBAN7277tbV8ENcKO8Zr4HxurMA+7YCm4ZkmYecYJFOnLt8uu7zKVo3XSgbIR0+1P7JKhKpcO6JzbgGVnvOsd+IDgFuIHY1Mrtw3NbZGkoFyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338144; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFStQfNfcVriUweaxG2ZSwiqwppw30M9u2YxxOXAEEkMxAywrdE6UHvlStcF40miXNKQdb4VnpfDePivS2YCAvC0Wjaf1rj8clh9WY3SwAVwhu3H29q+Aet7xKyB4/aTrdCQTLCGcAF+I0sDmlJSRbLibK1FcYCL/r06UlTBgOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsnrWI0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLGR+Tj6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsnrWI0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLGR+Tj6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EkcCp1214135
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 18:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=UsnrWI0N1r8T0WJ7
	j4U4silzRRFNM7hzdDHkQ/OTQHYFyMDpgPsBtRYzDODSRiHToWBw9f4rLLd72MMh
	McjmmrnNKMB9c4XRF4F5icZ47c1OJpY3k0sIjw9QxU10HmkctVKwX+mX9RljINlq
	mFUyGF5oId90sPAUIlsnlcU+xP/LMqtoUCQjN942v89yQU3gqQV+FD6kZq1xbZ9k
	hq3l19SGD+sDpKDQY7S1W1kPdqIuLRAXFeNalz3AGZfybqvkuIlcI1E/jc96CXkz
	iDOtOuMOU4ak9DQS9Ong8V4uGaYWkZr11uM5uCRazM0dKFaldZw9afTev09n4i1s
	yg4Ykg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s9afse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 18:22:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so3235109a91.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338142; x=1780942942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=TLGR+Tj6c+3Xxv/txBuHZT+OvuBbUq6V0NmiT4oJ09Gym6KrXMtuqdtkTAEqMEJHuI
         wEsbc94bY5GkRRRwHAY6bHePK4O0dtQV4E5ndhB2t9jznAYqnULvAGo7ZGimzMmxEd3t
         l9gtUfSviOAuU4rVJew6Sfv4qSEG5EYlNydpdfFie+RMBwK+LyC6A7vzdXWBIm49xDkT
         mDRG2mZ5u8wUjofPFaBIhhxWePkiyT8AbFHuBYSTpBkDOGM5QR6AKBsw3XTEUtWAvOH8
         SLrBcWC08+S29HyQUf3YRHuURBIwTFTjJ9nmMQ4iL2ESWsLaGErxuS3W6QxxYgAzVVaE
         4MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338142; x=1780942942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=TQhwBFHEEB+QLQ2zyWjBEBIYNZQp53ffyCyaKXQsiQSGa2giIHxXYFY8ZmB0awdapc
         NTCI3XRHCXUbjXB3F3+dwk5x3MDMimRaELRnUCToQXisLnctF9maY9wWtyJciPS6WEqB
         hdsB2tX4YtxuhxoBls7ApdbnhWHDUHEBvp3akFXa1dGUZchNLcu3bXfcwtoebalUtz1f
         hnSMo56L/9JKMQDtBV+pmajmzE4asXrSCUDjxkkUHwYQhpY2mtE2/Qrc/CfknSVDzNCF
         qXyaQxJsDt9kd3yOXwZ4bWgiECPm82EPqTyRWdUupElzxkEeWujANJIvtqtOezDrQg3R
         ggPw==
X-Forwarded-Encrypted: i=1; AFNElJ98ZJ96zJ0aJlInWkR7z6lSdiNstK+91Ur3mm4clCcY8pi+ooUuNG/Yv+toYOCrTSNoTrpTw+H3PWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHqjfg+FIEt6r1BT0WM8WSYbEgxBFgwBewENrxKV7hOyLTCg9
	dGahF5hJgTlBT17jXrrAJzeAdr4fnQ/w6p9mPtEi/UTgaVu72CyeTVbQ49sA72SPbF5EmHLUPiG
	ZmDiQrhiMQSHjxUmtl38f996jNzbp3CrmP2xy+X02915pJ7iDXjl178G1zUaIayY=
X-Gm-Gg: Acq92OGgm1FO0wtxsIuM6TFrc0KDPP+5BIIn/Lf4XKjRgmM5vNGa94J1rz1KEJbTsib
	ZtOSI2esc4dki7OorKXq0A42kCK6NYCpLtKirxVclTzLbfUnVzgeMHN5WM0x3JPOb05x9vWYvMN
	LdAE2A+yQX2CVilpGvTe7DIlD48IqttNLdK6dcF/rFrPslyrFWwo4sQG3cthGfoUXqiRUi+909+
	FjZsr8nfo9Sb98JfdoWOYW6ZFss1eKQ3LSZjTpEGgPOSudgLb0wbNqxYr1MsJqC9ZLU5bPibQpx
	liq9qzVML8FoCQaiaMmEwKkJU1ntM/HhLg+4X7i0WOjp0cVsA5s8qXNgIZPiRX/Hr4QNiHWAw5K
	DdRm+op2FCnn2gxK8TZCN73xM1ejipGAp69465U7612La8Jw6A0NmnZxYyGBCElo=
X-Received: by 2002:a17:90b:2ec3:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36c4ff277femr11324102a91.8.1780338142044;
        Mon, 01 Jun 2026 11:22:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec3:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36c4ff277femr11324063a91.8.1780338141615;
        Mon, 01 Jun 2026 11:22:21 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:21 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:26 +0530
Subject: [PATCH v3 04/12] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-4-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: fc_Rkrb6t3uT-5midlacWBTwnj5InGHq
X-Proofpoint-GUID: fc_Rkrb6t3uT-5midlacWBTwnj5InGHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX1HaGDS9ZrRMt
 /VCVqSzcJbSpkoeugPuLomSosaXte30y7K1GG1PgPaz6Uy2vQEjhkTwot3nU+juxhtJn/iiwMda
 QqTBqXiDqMDM9/KtPz8dYZgfJEuG68mK+jV/TQVm+IjtRQQ1tEu3WHfiCAupLQxVCLQIxxp3MiB
 M3+h9cnkDawzFhBaKtQv6hSqzLWc5RbRWeQg3rJTeJa3i8dobvr+us8vqZqaFJusTq0ufhmBf0G
 nAsvEbDbyD3scRJUNi6PEKpTzthYl0uoILYGScF2A1V2gu84GsL/RpMCHsLkxWSDgSo6P1uuUqu
 9bpbsswRvnoJMfmleqeLaC0nD6vnM1fARf0g26Xk+/gzUTiyOq7l3KtWsQlsXkaPOCVpP9kuLZ4
 NMgmcXr5cbYpQlfbKI1ndkmwi1AvTEGX44vW1LZtd2qYwlWeZWA9KgWOsvxrnaCZVgrguudUGkq
 Y2ufiogFaGbj5qRaWbw==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1dcdde cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
bindings for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index 734880805c1b981a1c899d85435f83f4f3dd3ea9..1bd70d091fcd7b6d7805ac090aaf840a415c123b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1

