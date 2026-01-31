Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB7C35EDAA
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880844; cv=none; b=mm2Skzga54Y/EaLSX8zHw6gKT5dnuchKl17yZEWNgi93lungvCkHB9wF8KKiH2/ivAXPO7WE6Kv8S/EbhBPLw0mF3G73EBWFyVA2Ty5MMDy5GQeIa19cTaL10YN/lUVdr+WVkI5qDaMbVKO1puWFjQD03U4Gjm4xKPmYuelb8Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880844; c=relaxed/simple;
	bh=6nfUUNCUKm6Zb4Py6SMv77VBlTkgwaJH9oS28jOc1Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nY3lhx3/WguAKfsXLT2twCyLhyhxwKJJrQfdYM0QObpzKxpIAZ1+D5zRMb1jvOjNThptsjAJDkXpsOv00NirL/asDhYngLFrJy2sVQYAzIHOmJfWVPo5/uUFB+7mjStZ9wU4SYpW+lbyDh2jpn4bUWsOjMdviP4VAKlHaU+Mf4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnJqeop9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tw0QbETz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnJqeop9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tw0QbETz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4T7I53957078
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=; b=nnJqeop9xlwJZXBr
	5hyownpTbVXsRirxC+Y7PK7JeoeQfGQ2ey1jfNFxeun2imqFoaxrIVGU4+0WI72h
	k3wjkReMGBGhb0qFkeesegGh7oQiA7yKLfVcS46NUz+d5vO9xzKIxzz3dygp3mp8
	WDRLuByqIJhJx0M6s46RNlzWFkmWl1jl7GcXqDkd5d+REzupTQr1VxpOVyWJ+LpO
	sMsJ8HeephBb93yqYqWVuEJSmbAqrpNAwhR4ZiHOBPs79QLS5DJsZ/WAnd058G5L
	qla9yvzO8+ABJwqBKxOVr4sDszp3IgFOf6KRVsX8lq3tniJjqSQvo0mGtuAg5+8d
	zC2xVQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1are976n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:34:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-948a8f9c09cso841092241.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 09:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880841; x=1770485641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=;
        b=Tw0QbETzelnewAO2Si+vjWyJLtwJe7fKQSKjG9Dn483xMhmGt01+SOwqvA1DavbpIs
         1eMyGXyyCew9SEgw3KL/qDqcfItXnjNEbSQjftjm/DpTexi9kKZKwRG9O0Qazxss0NBp
         qbAb5y0fRJKwjstHUBK7oAj2xoKMSqZCDUvoktKUVHdWDhUmIRg4cyBAI1w6RfotRBp2
         EoiNihseHTxiYe4FOmHS7AIaI6F2vgkWNoiV5YQLLueDVdns4+5vSFG4n6Ap6hxz3TKW
         3KvstupjAwHJUuZWitR53eeRPE8t3GZtCGz4FUd3l5/9FWVsxyfOJw7k1MEQ45j1QgbW
         G15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880841; x=1770485641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=;
        b=azjmNz9iRTPEhqrO5bo+KRxYYj6OtnmdFrPJKIIri6hhAVggvigrZ9edDa2nHR+77o
         huDWTXHVEg0IXiH4lPpfoIAHZRhh/9dem9tSO0m1vAqhuUVpmWKzNSdNvpc7WsFrdoWz
         n+uJQENdyp+hiLhKB7gujb1Tf/hmVskN92YNRpRTfIhcxQZ9QXoX3alEN/+bNShIQ7hx
         nNauL31yp7DZG1cCpATN8kqlI2iOvh+9vNnzkcOhv2yOYUIlELxVrXQD9HU/MdZoMapE
         gFlv+ifWLUgicJ5Ss08sfTBJw2IJXK+4hSEapDstzG74O6DQINMfbcEOVEfOkyuC2Z+B
         VUDg==
X-Forwarded-Encrypted: i=1; AJvYcCUQrHnhhjjDfXC9EyeZ96efe15sj0hmzLaxcsV7U4aszx1AJ3A293dRWAmriYrHkzxIItOdu9u3m44=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUeyxoMxEag7rFhmVZUpUDYdDrUqqKTg8E8JZ+eDETo/XSamFj
	qWau6jl0oqRoohlALImx6xhrzb8j/PCh4mq0Dc9tyGhGSq6dK7/rIYtKIkfvyDUuXBv1pHn2HcW
	Aa5pTr+x5oMvXS4Y8h8Ao/OnAUxboNhEOuuATA2f4qGj855P3FxJks8G8so8kUBE=
X-Gm-Gg: AZuq6aItuzjoClO+pcvr7Riky+ipnJduA+T9X/ea01Aq3VhfRZbUftmyZaofAjKGtuH
	RS1VFJRyLcQCb81U+e8e89m6jh15riq4HrqWkdj+u1u5b88CQ7iEg//Xx3k9j5sx+7lrnB4Ajua
	SIvCD2VK5pIae4qawoW4o/+1YpnZQvINjZtW1SikepPPbRzwI8wGeDWScJ95h2ZihupFJja4OCB
	FtmmcqrFO5RhxRiLNUGlGNvfmp0ZEGb9ssI21qpvDkq6fLOscyLOHT1l5rGs76ck2v+W8kRSWbo
	X0UOLXdG8jWOfg28sBx74BYd6s/0AeoGnQmYgiqB8HPISyu+4PEnr9uRJYQI1n1hp/+sYq+Qf7N
	U6/b+3PMMfMb1BuhXHqd9Cs6i0CNt8QLQoJYUab8t0/o6UatNyldInNWBmOv4LxKEE4b9zmFogQ
	ALVLmIlkWG28FaFz9lfiZ/AqA=
X-Received: by 2002:a05:6102:3e89:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5f8e26860f1mr2241028137.38.1769880840916;
        Sat, 31 Jan 2026 09:34:00 -0800 (PST)
X-Received: by 2002:a05:6102:3e89:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5f8e26860f1mr2241014137.38.1769880840518;
        Sat, 31 Jan 2026 09:34:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:48 +0200
Subject: [PATCH 6/8] arm64: dts: qcom: sm8250: add MX power domain to the
 video CC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-6-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6nfUUNCUKm6Zb4Py6SMv77VBlTkgwaJH9oS28jOc1Dk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz/42infwTrTZfC0jKf9UU8d8d4IBu6hNwvc
 BK9CZM4de6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/wAKCRCLPIo+Aiko
 1ZXaB/4sy4mEKHPBEWtnwS9atKvpss2P9txe3u+AvL1ueKTA2ITvmHd2yEVNNHqece4CvRWcHfB
 2hJr+xnnrwuCJKyHYr+TuHgwNP4Fx0lXdhebA/SfxS2Pqx+PZ9+k5kfjz21MIi5ZSABEOS4utej
 xA1RS3Jx0snJKtq+T6HnpaGuTACSCkpyYQTp84jzrCRLzl9Pix/MdRqhTeUY9jUxpvUh++2ke7u
 e86TQpczIfBR/WfFWSzearruMIHDd1lRtEMcaQuw4eiGMT2NmlKWEQoKR5aQgO37biCuisK7mcz
 7dXC2CznQUHT2rThO47z/UF3vGyRyJv8jqoqDEoqmunpsVMm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=697e3d09 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8Bs0yZVtKZY9psgxZcQA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: dY25UTQxbZR2zs6GY88S6XOMX2JAXzfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfXy/Whrz5iyF9b
 CkVYFvM4zcFLB9em4Vp6i5N0QInixiIINZb5vjKgVwxQg/PG3yVJPVL6m+ji2k660eiSyhzI+SH
 9gQb/6LcBqKzJBwysOaI/whTEcjLV9RURikWBFFcwX5ql96lcsUAPiofAH6yhUupEFEi4ofPziR
 Bb7uIkgHao9t9sWosT6pMoZZ9vTFKCrH8KqsWL2VPJlA3OueCvUfDw5nqMZ+cefp1N8uguxOGQ2
 XcL9jg2iaLjGyuOcWQHXV/BPF5hZN301hUGHY0bdumC1D2ZV99DrimrMtqCdhh+RKxy2Ad2nKKn
 9eDT4f/4TpKEPsCQ/8/Ke6JYU7Fe1jDJNCWG9OLrZ2o535g7vxt8pN5pDQLuIjK4BAEBNB0CzcG
 qlgV7LiW9f03Ezvv9pojUWnkQnOe/zi+9HtiVd8YjIkg3sX9xWsYk+/RxsvcE4qiB77bmGShZso
 zX13L/yc/oIm8ChWALw==
X-Proofpoint-ORIG-GUID: dY25UTQxbZR2zs6GY88S6XOMX2JAXzfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147

To configure the video PLLs and enable the video GDSCs on SM8250,
platform, the MX rail must be ON along with MMCX. Update the videocc
device node to include the MX power domain.

Fixes: 5b9ec225d4ed ("arm64: dts: qcom: sm8250: Add videocc DT node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..980d6e894b9d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4374,8 +4374,10 @@ videocc: clock-controller@abf0000 {
 			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
-			required-opps = <&rpmhpd_opp_low_svs>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.47.3

