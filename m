Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C5743304E
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176974; cv=none; b=iV9dlpsUizw0r773CF2KJQD55wrMQtxUNsNygtEMDgR8gT3zicDSh4e5KdQ9c8C6YhKgNioaSuL2Tamx1+dMiExtwy5HzEcR/86AiIxBPI7cb2rmer1XvVLEj74ILfq5vHwjm3wejblDu3UdzQPpA+rS9pmPG4xF7tHUVGZlTG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176974; c=relaxed/simple;
	bh=0TMQsD8HdtxtrloI4SS2ZbE/Q6kNWOy27N0zCHKXDDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8YuVFs/Dd3dG4BQFzmslumNlZhW8dX8JR9zdDdt010lzSh9lI4XItDOyWUmMknMR9pmzFKNninn2iSYGVr5m2yKyX1T6uiqHhZbqyXID4bs3VXtle1BXPsdf0O2wWBqctn614656+mRBLHhWCFzOQ4DX7n6AArtAOlbtLOziQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhC447lT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4FUIJQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhC447lT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4FUIJQX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RICAMm649386
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=; b=dhC447lTIW/OYwAg
	8BWUwYu+N5LTrwQQPvwm6tS/SXekFy/9z0V5DA1okIhqAY0Qp9TEDwUuKDA/uYNd
	bStUaU7tvMzW7NGlALrxgKq0uK8cOI2rWuY3Gst1zPc4UXEKZ7bDmUUp7P3EHNel
	YDMes8+W/agipBkuHbUJN+LaswY3n+yTfKr8zeeV2TXBPm0DmewUkmIDfRyxcrHd
	Fzd9RvF7ZqEDAhfVqQLem4GJukMmKOTuF7KccZlirS1huFEfU+eF6H+vQ1T3lW5e
	re7e3dlfo00pNYRbXMJ6ID3jEI0sW1AsiRX6E1u+Lin3//FRGzgFgW/z/VnM0RRQ
	xGhzcQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c62fuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:29:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1943900a12.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785176972; x=1785781772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=;
        b=j4FUIJQXgjs5kNxlbXJvp8jQwx4GsRRHr9nrwS2roDb3fMSRc8y89Y/RuC1ysMP+pi
         7pPqNL9c2BgqU+zyhgbYUAgR3MrAZFGwV+f9fmao5vBuKSyMSwI5sH8kuJcUssafQMbo
         VI46N8kxedbByoMu39gwJjXdH7MBqiM0LdwyWRdHMf2nurs9iZKMsz088Zn4K0+zKnog
         kUvcntiGvHhnQDyJXLEo+iGie7oLdeVxokkEOlkro7rsaqjMYUndFE6gTcGOkYrK68x6
         aT1NTWRARH1ktZwPbgX8LyQon4gsvbWI/+MR+Zj5ExY+v6YVCmWwSerutE0Zu7Kc6KmQ
         Mc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176972; x=1785781772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=;
        b=meOayETRvzBBNEImhgT9HU0eDVv82RhaeQRSX+W7ILl1DtIQLw6GHzcOjJex5HPZzp
         /NiwfHom6f1zYEqpIEj50DDHlNDqnj779jnIfL/3Hj7eE/M5OB48m2PCHYMkhenrAcEV
         A7hLuIfAAcKFTRUI9nLMLuhhjIXBKqp0YK3TPK05LUXvZ8jLqHaV3ytnfpSE616UbNQ2
         YLZD+gveDootVT/X1FXJQ2KVeWy8wfwCyqx4XHLGWTIcLXaE6B6MjMAHHUxivEH0m2MA
         JVbPu4iRlexO8GDz5BcoW/RySXeB8nnpOW92cVznV9DaLi45f+6YsKKKhBYsYOA7fqUH
         TuVw==
X-Forwarded-Encrypted: i=1; AHgh+RoOs7c1ikZMbbzE4l8j+40Qpdm/hfB43X4pF+xgPculOmP+kJc/VGADIUhg3No11dtQ4AJfQyg3POM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyD67yaxzNmX6vUco881S6sqA22hUGobDiWzzfH8hZGvwx4oSp
	YBD7pq4xGRdfsCwJOWJ4CilzZgbRQFkHm6GergR0aw4yzHPBn2Tl9MP3b6H+tb13oVKi2hcX0P8
	fPZcKX12IJY440dyKONpcQyzemVU6mkmwoxFv8+nRtfiN0Aw4u3BmWPrCQDOMjPY=
X-Gm-Gg: AR+sD132QIXk4pYlR2kONG8DWvhkWElAC1rd4Sgeb/b3RShSi1DbLYKZj8wdX79xsSs
	koPXsI9d7/ux/aQyZf+3JEApywTRsoChoibAg9PHNsSomIF7Jg7fsnLk444gyH0NqaX7+/tZ+Mp
	Rl/qsU3ilUnJtTt3elAx8cC/JG5rsp8TCSuiX+9otmv3MilZDovfxDpN+InHJGNdMMo9smGVhDa
	T277G4Kv2i8g0+ZMDevSjeGWF3AO3lrgmspQmWjJB9E43BdORzr/JvcqpQX8130rD+x6vsyKXup
	jYTL3sdcqCGWXqY4KkAidYYR7hmCeZlWu4yeHpXv0SakVVmF1HaXXda1i2rcPW2EYOnYcME19w4
	Mr4ufw//9dCkLHAi804jyThi5BjTOzm0=
X-Received: by 2002:a05:6a21:6b02:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c67daecd2bmr9207883637.33.1785176971549;
        Mon, 27 Jul 2026 11:29:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c67daecd2bmr9207842637.33.1785176971126;
        Mon, 27 Jul 2026 11:29:31 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm31963087eec.28.2026.07.27.11.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:29:30 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 23:59:09 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-maili_camcc-v1-1-01dbd7ddb276@oss.qualcomm.com>
References: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
In-Reply-To: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a67a38c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=itb3sOZw9SQNzPTiAAwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfX+gsEOYWCuPTv
 TFVNENdCOtwQQT+F02G3uatAoYLoi1Wom0CGiJLlGRohsVuh+ei5/jEfFTpu0woskCowrYRYSev
 thQsg3HLk4Ew+HYPFzpFvi1mWkOPxZU=
X-Proofpoint-ORIG-GUID: zifd6yjXQHpdopY0FzzjjaHRoGPbbKu_
X-Proofpoint-GUID: zifd6yjXQHpdopY0FzzjjaHRoGPbbKu_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfXwTB8xpEpI3Vg
 KGiZ/+QXUkc2sV9+x8yAE6Y0iLtt2OCYHMGZDAQLvKXaHG+WcAVaERyfXdUkxNGuWu2Lmqco7oW
 1f6Rl9/svMTlcP3m7laJcU7pzgMVUN1GM6Yd7oxTCJ12nfHKiqX4cjFKA0X+uqm93dGUxR8UTHq
 gsKa1wc7WCp1Lmj3oJ/TnbqVTzCbZoQbNbvVAvdY8HeAD9q+fzK+/1QXdAgx/nvzLB1JObfM95h
 dS8+XQva6BUYXnsOeNhdRUdmMKupKoZDf4hbsA5vccNUaapf9JWKs4nzLyMROKrTbgIYEt/HRQs
 ns2TbqhbFJTewC32KctLjkj2xBxYv+QS37LB2rooiHbDU6qPUptDHec9NHdkm+GSLjsIdtkDkbu
 3pYyr0Zyri7opUeG31OySGECGjn3egFvNXhhlUIe437Ojnbd5BpaFnvP6hYf7oQfhCGBDDHF1HP
 WrH1tNUtbKPiBD1+scA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270170

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index cdc19418c06471ea8f3233e96c0169fb8b590942..4b961226a2d1a1fecaa0bbda004974f4a1e9592f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
           - qcom,sm8550-camcc
@@ -41,6 +42,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:

-- 
2.34.1

