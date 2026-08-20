Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB27413786
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220560; cv=none; b=SpIKgm0Tc/qLivFEPa71WXTn1PpEmB05UndAT4DQztaHlbCHX9ct/+eKR1pO447S6pGflS7HHaSwxj+ho2Y9vDZbnEF1wI25L3z753gFejVyFuh6HJ01hOLxxhUn4ttHRikXPO4T6foJH65JfApFIwSOhb4Ddo7yCZu6jpYl310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220560; c=relaxed/simple;
	bh=ppqg0h8bRGvJ8cRgzX+fL/RjwZyvoIJpuivJiHXgjs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpD9T6tNQl/gUdUuCoMigrCUNmflVqAsRk7dl8g92jHk/pWMtZOe9k+PTrQZV2ZKufpzJdhmjTAlwc1gbrltvt2TUOO8aj3R3GmkDuXJ0r6u2ElaCLHKqbyr1Z66+ONMs1SKGpW6SVNoUc+mUST06/qKBGF1Z04YpWoafgsU/zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ScBBBqAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePIQQLYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ScBBBqAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePIQQLYb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eeIo2161287
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=; b=ScBBBqAFUdi2PffB
	gMYGJx9edVAvD8Bgh+ewRrCETpcJvOA2Qz7um959OSi0imRf3batshqwgGOIhHxa
	K5FReJ9eH1PZwgqAYCEKgAOelwCMaoHzoZrGFMqCfLLybL5MM24OhswcP1QSHgGM
	ITLFTjBfGg4gwraJLPKS4j0OufeAOJpitxQqfa8BvLB5mTY29lCQkna9Z/4VXz/+
	bolb3FrNEytrQx6+DyC+yMFi5zqF6LMUF6yJX4+NUw4UuuVOUgVIXN0Q9UG/i/EQ
	ARcnEeKcnRZ7WZVI//KxDk0fyOLLIYBMmJM0oQSE+sTBgDwKBDsJu0xWjZNOB+bq
	4qRmag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rrw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9a2b95b5so357989285a.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220541; x=1787825341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=;
        b=ePIQQLYbaNj8i1Yl7yt1/e5KtACVFgKwJUZerF7PJSJev39iwXprSedJMaKJbyJQoP
         fTgTASaOcZ3x11Tt8yXkvvqyrQUs5vArbnShkk2odXAghxtznsj5xxGuEJXuYqKur0zj
         06fcdLC29o4NFaZ8wvfs32iFUR1Mbr0yZGH/hYRdXTWajbdf3qgcBHt0WYGW8lHenygJ
         0zIHWH99m+J8PxOUYCVZcuNYjKAJipDsyahscerSvLdLdWYWrjKY4Q9Ngj615LGUvULC
         05YTHJhaPozXlzZ6duBVXuYlDfR1TsgwFYB5S9/OIRquWfUkQNlAh1ZYC8y8RQZJLJcz
         /LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220541; x=1787825341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=;
        b=Z6czQ//suqFRPe479uzWnYZImjIxqMgN0Dshtqn4MHl2mAR1L7Etja25e0rfNpzjUl
         KTgpgqMl6dq+ucL5pOVVoLWAPqS/BLF4WvXGIsNeMD1sz3rT7metpgel/ftKDW2D04iu
         r0mlV6nHzxb/g9CpmijxdaggY4oL980eQ1lhtsQEzO2RjICVGqtDCuTWPjPSdXdVyl3I
         iDbcQf2bKH51wryi+3Hj5irucrD7PAv1VT23a172SpnMeyvHygg4MM4PT0fZvnbk5tp7
         jPiRXz4FcXkv+bpLeCOPWW8zhM7wYZrMJiL9kb7E2fQBprYakDDdc+HVipopgbzMDe0A
         IueA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/3F8EJzLnTWIqdylBm/EPUjFLRsIjlRIKUathQ+EjSkDSVHrIGWZJOB1tQyiS+yv96fnqE2c7g90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8L02MUl2Z35E5JyN9MoRoh9QNauf2M2PgppFBOtBqDfiQB2c2
	8qe1X6cokAz8BtVKjGNlHF+3Dtf+Xs02YtM4i8nPvHkQuAz5VD7Oic2ZB/Jm5pFb4+e1TtjhZn6
	MFSWlvCU2fbqzbf8Ojp1HWw6La4RqQwFy22P0eFYd2Nz6LUdZ5VUmiCNjjuv3YQQ=
X-Gm-Gg: AR+sD12cPr+2INko2R0IOEWVClKIAc8GG3nD3RmRlf4xVkytkQb8CjxHI+AjHb9Laqv
	66rpbktByvbvkzKydefRgeoUS5XTuEu4PlJE37nPx9ViOt2p5o7VQqBMFgk4UgvuAirtdNrl8YI
	S6kxb2q7tGfUBRAFTomqiv00QLUp0j/iC1XwXpHhEcQ4ZFIf367BZOWFhDzOhc8WjTh+DtDyOZd
	Kn2Ws5aIBzAJOqggoilIFa9znJ0TirsO3SdhTRhBnDMrYiERk0nJ8FkuDlQ9V6E+Wxgx0IFJnBF
	k8VS+7A88TlZ8BSLBlOZule7Rvxqiks5sAqepiWB0eZBQzFifoZ4L9pGYyyKQdzPfYLXnk+0+fc
	LnHndUE5e
X-Received: by 2002:a05:620a:3181:b0:92e:305a:d729 with SMTP id af79cd13be357-9371e31b0b7mr926371085a.7.1787220540780;
        Thu, 20 Aug 2026 03:09:00 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:92e:305a:d729 with SMTP id af79cd13be357-9371e31b0b7mr926367285a.7.1787220540270;
        Thu, 20 Aug 2026 03:09:00 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:12 +0300
Subject: [PATCH v2 09/16] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-9-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ppqg0h8bRGvJ8cRgzX+fL/RjwZyvoIJpuivJiHXgjs4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtH+TvlcAiBJTUv1f2KiEaX8Ufh42yZYlACGr
 OpDx6YksYKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR/gAKCRAbX0TJAJUV
 VrLVEACmX8KfUgNLlSxVbHKFKNelWR2WVFK1Z5AOZ1cvZ0SLJDGF3Js+0MQ3XFYH49mzCrPmUNN
 CPJ80H2d35iupUgUG7jX5T/tDMn1uJSWuWSfQTi5ja7cHEGn/V6WDmz9cGWX6cdUrBgMLCpQzuO
 +4mh2GJ7Da1lzpno0+P6078nuq+UDdx8JaUdlkemM8hcMWVIxQc2LyRGSKt8weA795HWqeHbVn0
 s0xczvps9co84gr1Vdd2OLV4dul47+DqjGy8FBr8XzEYE3Hum5xnyPKUhqJS0Q2DuvjURwk/Co+
 SAhDZbTLOnbzPPI2TYcmWPTRiI1ftTRfa+qH9q1v45grIUD9HPWnkWL8xcO1RdPQLoXkqeCWPRe
 A/8QcmYVAa4NmJv8QDiYmEJA8IkY/UKggWiQ84AhYK1KCddq6P09umj4DjGTcYUIIeq+gxF11K0
 8Xze72W07+7FOjXHkud+jao0i7Rwmvakug6QcM5lOUNLbbEZT0ws50/lbAzmN+YAhHlf960itDx
 3mqFxvgHmbSxR9yDxCAHUm6GiLmsRzwORsLVsagxQme7+PhktK1ku1w14/8w269NW7xCl6RBPwx
 Vd6dlAC3JnjksnDe/j5BInQI/HmHgz1XEtIXPhX1H8hTy9+0sTrGRUzs9rTk+W1LZ9nBoKF31ir
 ezLH8itnN7xYSuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX3StVDmnWbvks
 CCB9pFCgHedG8srNaqIHU2j9BHFjLTQve6Jv7BFLkqg2Ga9Ss0HiEG3OUGKgwlQgXjsHPuNCore
 dS2xD2VW09VQ8FMI0zSNVsAZn7c518HcvgvZJ67pp3Hh95s87RtHUXHyikcUcqgKEa3z76NDruP
 PfnjcUoXvkypWi2wcBLIANV7gSYivAjAxnC4hOgPRYdqMwkzNVt09M8bNZaq2o1f9Mne1fYlIp3
 bQooTvuS3XHlVrkRO1nejXWwWUR+B039QuZCy3UWYgyWKVnMY1J1N7bEEHOno9qAWgCYYItNfop
 9RsTGMPs40VXLsH6Ri6nhDj+ilvD4ufzK9yhOLmH/oKqGKs4lhP73t8fXRTTkG+Zdfj0kU0m+Wv
 n+2rvGUI7jd1IjMf45kEBxT/d7AkmmJ8RrlZMczZuCbNwFXfdmu4x+e7wJNqkNbLlYnZe56eAVM
 RYGzl/cuCGxV36MmSNg==
X-Proofpoint-ORIG-GUID: dTw5MeE2QknjfpJ-B-cF1aN_UsOA59F8
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d23d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX2ZUblyHXBFWM
 aS8tbnUpxdETrC1BL1h4o2nIIDo689FuuZK57RU0hAx57mCD+X/DvGRsKv2kLUVBje6L0lvmZfc
 bstf7Ceho/fBOTBpfB0dLNZK5aOMVxw=
X-Proofpoint-GUID: dTw5MeE2QknjfpJ-B-cF1aN_UsOA59F8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..50790cf1c3ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -971,6 +971,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

