Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471944;
	b=0xXtfzQyD0yOTbB6zNl/Gcav7OGbxah3riAxT+7CEZGaXF/0KI3HNWvPmn4o/nFVIosM
	 mL8iJBFVE4mldlqBN14nKgL3XRE8KLE8E6N2tLau7XoFBLD7+K6TWGazICWlpBw5PakZg
	 wWuRFaUTMgn6FKWxtLncSNJpjOoy8X8OIfoq71y7Fqwht3SKLhuLqPTfe92mRilgbd2QE
	 urdQP8m++6MsBeX0//mY5Cz0nrbxUYewVKsmzsw6Fgvmypu2HEM+RXZl1O2ejn/X7v9+X
	 BRbqjhr+aVNZnkGilUzOda0E5l7h2TTqr3QrRXdCyAWN7zGQK8vTgEFt2ffpU2gIHLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vAR5+zSsownz5t35od5w2H9aLmJex5vLwmm0AzMVyS0=;
	b=KQETD3d7sQvjgfx1SIxXT3E61V1pWQFhlq9rHdSuVUAFA9iHDo4gP0XOb0U0OdhWiuB/
	 l9F0F6dYgd5zn9+IknNYzhLuyPHp/TIbQoBo1P3tYUQ+AbYtcm6DJpqPzCOvzuQ1Cmi9S
	 BBmQMFH6itUmt4o4m6NnDXOJ6LcczcsRpTs5PTZT++zxHy6WZpa3M07TxGfOD80FO1y9H
	 MfGXPxJkYlIotgA2EXJC2sl7hh8zgSjfEDT8VOPXmu9aW8Iefvi6OaT3efn7TXY6UEGYv
	 oD/Eo5NMOImQe6plDCF1/30mDNqP47x3sB5KVbJDKV14eQvDvQ/4+uHvxxhoDbwOILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UO52xKIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YISgUhDu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC5F606A334
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC5F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UO52xKIt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YISgUhDu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuOLO2349973
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAR5+zSsownz5t35od5w2H9aLmJex5vLwmm0AzMVyS0=; b=UO52xKItNj5Iayy3
	s4XevmllE0jqlx9CoG+WqvSZuoyU0bGOSxtpY3t15Yj+lIXZrCrqSYkrAW26CEL6
	3OOfdwUZ8X2yMtAxnmuFq+GlbI0xXODD8N1gdqh8qs3jZ4U9XLhciJohvXEm4dKO
	Uy3sDonNjw5uu/gYGIbaB4YWnPe16ktIfiThwW0479EskRAU9uL7MZhf2fq7GPgz
	p8H+HcFik3HEQKYoXgCsPwFuMtUlRiOyGHSGJnpmSu+/mnO9ilXk+M38AEN6bqBQ
	LGcir6VOefD7M97NGNKFtJzBLB+WnclutXPXqPir2dkmCjiRe3NDs08SAmH7nIRM
	uLLb8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3n1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:12:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9212d968d19so72271666d6.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471942; x=1796076742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAR5+zSsownz5t35od5w2H9aLmJex5vLwmm0AzMVyS0=;
        b=YISgUhDu2cqcVDBpoKXKWYzbgrxRjfyFZHsamLnMkVrJJVKH/EqFCtSXVaU+Y76Ipp
         zMUVMTv4IZvdhOoU8Of1Jwh+Oy1DTAiuuEPwOagH67CGVsfmi6mPGEmAKsu/qFu2HwrX
         YsDeoxsWUhcypHFM2CGnL/ssumNBWsI1c8LgvzDaWBqQFPA/XrTDJAUanW4i5t0sHhZs
         kyJCH/ZAutkLz1ADQ7/kvv3Nuii+LyvV9hHoiJBTdzLwE9/KLvkbcF9CaK8clLFUb2bx
         ntwoVDPECSDx6CrmHixo7mRcv5upvFc9XAVYqJb7liN7FxAkuYeJ3LIVF2mr7njEv0Sz
         /zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471942; x=1796076742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAR5+zSsownz5t35od5w2H9aLmJex5vLwmm0AzMVyS0=;
        b=iuGx/tqgfsFdz329rEZD9etl+ptkOuuIH4MK3lDUw27DiOS9DPzO++hU5CIfz1DHeq
         00VlITw53PjQTQIvPTA4bGFFrSb6pFbsuoZBcqs9QXwUw3JrzC324hjs4dHF+3j2jo0Y
         L4BdOKZsZ20cjA/hN3l7qsKqrXuwmAeAI9qv3S00UME8smMs4XLpMzuxFrcButaADljt
         aSBkvPTkanrJ7EJVL9XR0F0v0w4w4rLbMEFJVpi3c2YaKDe870ZcD+iDtabHTUTwkAGt
         RDEMw5mgVkpRMDsgwBR/8LmwJZW+ThTF0NuLdTm/74YSWZ/Zx270nL14YeloLyh78AcD
         BheQ==
X-Forwarded-Encrypted: i=1; AL+hErFATB/Za658srwoOFyPJemVKFq7Cb5sbnGRLltJcVZoZ90J/E3bSAuVbPhqrF4VNxgXA2miWlC9vog=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xf1XHOrvwQE2Nsc+AhCH3osTjvp+lawTLnRqH6fCeMMlJXOXe
	6YWCWaFUGAHO1o+2yAQMITqbo5pEbYL4RBrUOy0kJDlSizSV4mPll8olLn3AMbrSFdTIjGzRbDy
	sXWAc44AmhKQYIGaU0OWC2BQFwi4eKiLtfDhoHjcC+RaBT2uCPqH5mEoZmBVWbnA=
X-Gm-Gg: AZFdTZe45TyYBNmYXCS5aMtlGCywEN1JzfaGABx/yNrIFDa5+1gnB0B++cgWywOcWdf
	N6ibOwyGYuAUcScFbV/DoCEzxuI4KsD84dk5gEk7+SJ3qBIp8mkoh0UC675qL5PFyiBbG+Mz0Pw
	7YK/Q3yFOIsTuezZjz64JEiJYhH13btpOnIKH7ElpYI4b9m0RVIkIvY+xCwaoQkGWE20wco77eJ
	BO1P+D4mEXMlS7DLBMP7QgAq8T/GnwfQ3YqGq1faFi88TLc8PImdJrW73IZf7zTmCbBTmjqLmOc
	0ECcJNoldN7q3VdvzHD6hhq6ErPd/kxi1RYkY/nKzrIrVT2G7LHdAZl2pjf1IEa8s4sZ73oR6m2
	ztTAIOxj44H0ZRTcbOJUj/s0pIPTxscYj0G7mUgp261KwzZv9aq9kC5Gu/5ONYW9+WW0=
X-Received: by 2002:a05:620a:2907:b0:949:6bee:1b4a with SMTP id af79cd13be357-949baa04ac4mr2324965085a.64.1795471941861;
        Mon, 23 Nov 2026 14:12:21 -0800 (PST)
X-Received: by 2002:a05:620a:2907:b0:949:6bee:1b4a with SMTP id af79cd13be357-949baa04ac4mr2324960185a.64.1795471941414;
        Mon, 23 Nov 2026 14:12:21 -0800 (PST)
Received: from localhost ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm500012825e9.0.2026.11.23.14.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:12:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:12:11 +0100
Subject: [PATCH v2 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-qcom-socinfo-id-dt-bindings-v2-2-4504c1ce869a@oss.qualcomm.com>
References: <20261123-qcom-socinfo-id-dt-bindings-v2-0-4504c1ce869a@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-socinfo-id-dt-bindings-v2-0-4504c1ce869a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4216;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K+HF+Osd+hPnuAw+6Z8+zElC+vz4XRee9p0SrByTY4g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBLo9ZiLiSCHGiOxePFC250k+Ad4lftkkiPlfM
 cHgtyGjZVSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawS6PQAKCRDBN2bmhouD
 10U2D/9zHakAfW0uIhMlZUEe3iYazF4w3BGMgqAwSPuKUPDux1EUPsRET90xW0NzAQtjPcKyeX4
 QP2mdmtsiKnR1Ga6BrF2OWz+bWUVjEC1Gks5k3LRQa9VOcibz/q6z2+ivqEdGAJzJes2nQEgKnh
 HriWmIc/nwoT3G565FeNQvLmDxX/5cGiuYZAkH+4EGnihmsTS6XRnXDwtZYRh/vs+lytfmxCXM+
 EWZPmKu5AiV/Ehmi/yPCzSjrKnqua0kwcQrzhs/R4/iVN8FTxVPdyQSAeHISeH2M8S5s6U+XOO9
 lEQNV1IDfzPaL/WZnusQZLJ+IyJHUnOAiX1oddz1gTygtexssGG+NHFePCY9niWuOed0W/+6HG1
 anMfNFY1BHdmEv1RZEys2vwd9nOMplOOBf/afwhZhOrDDDrfe1oIYtNpSAm28rE84cz3IaLmwg4
 aQGBvOnG0jaBj74Gt8v02gQMvcthXwEvOyUubPChzsBwYcTDHNRCX3LE47lX5epj02oz1G+lpBH
 SW52ZwYY/3r1+MGqGuo4v0549bMb4SFD6zUaVbeiA46/RcAbndRPiRT8oQ75GGYvIPpQboCJsId
 Pcnr8IGJ1j8hziRd2dxpP69Wp04KHhWWifGURSDTBahFy+tic5d1u0O5eUUwzo3A0idY9xKLIPs
 gQh7HPjz/eZolGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfXw2EXffDpEoha
 0nAwwkvFszLfof178cBwQoxjmwKdeiDAoIRYUWU2lHQ0CBzhpvEo5HzuVhdw0tLpCJVgUkK97UE
 D9WY/WF2aiF2iph/HJkQFkP0rjVYhF8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX8nP3ijmLSue0
 ZGkGcZMwbc5+otKN4ltIe/TmxluveLU/ckyBSSk95xB5Rz2f8vUjyOSJurg0mzanUUvJSWwMXJE
 jREj2cEp+cV64KdlSXQklaS1432MbL6dJxGYll8uqNmVW/QeRk+k0cj5Lmg+SByHh5ob6hTqiv2
 TDV6hk0SncdgYo5q4Nehz6CQxJwU1ZyW0pkS8VLIqB1+87nBZyp1yKYbDHSZZJ/xydUw+HvY5Q/
 AtQMNs+2cqpOBMcGcnU/2k8XOI1Dt/DgPSiyTICtayJScZ0XAwBospxJ2Z1HrJjrD4pIjS2CjG+
 BpprPrrrdsNBROKcsohPlui1jBcDgsEy3xlrD7gRByindzwqbuZbcRJBR8zMM8l1WmN7b98dsZk
 5Tzn1yioMhmF73SNHbQkGbI9JzRbNCFTJHpduv2i49saVk9hVBlSfuGo0wYqfyFyViIm2NeyS7+
 lxn2dHmO9KIxiRCziNg==
X-Proofpoint-ORIG-GUID: DcXEocI-fDEBdcbR_XYWcjEnvLyWbSCM
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04ba46 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9Iw9l5jZwusWHIt2LTYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: DcXEocI-fDEBdcbR_XYWcjEnvLyWbSCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230088

The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
currently used only in the socinfo.c driver.  There should not nbe and
there is no in-tree DTS user of these, so none of these constants are
really proper Devicetree ABI.  IDs of older SoCs were being used in DTS,
thus that part matches the concept behind DT bindings.

Drivers have local copies of these defines, thus these can be dropped.
This has no impact on in-tree ABI, but any outside users would be
affected.

Note, that DT bindings do not allow qcom,msm-id ABI for anything newer
than SM8250 or SM7225.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 91 +-------------------------------------
 1 file changed, 1 insertion(+), 90 deletions(-)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d89d3b5dd00c..ecf99553ddb0 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -230,97 +230,8 @@
 #define QCOM_ID_SC8280XP		449
 #define QCOM_ID_IPQ6005			453
 #define QCOM_ID_QRB5165			455
-#define QCOM_ID_SM8450			457
 #define QCOM_ID_SM7225			459
-#define QCOM_ID_SA8295P			460
-#define QCOM_ID_SA8540P			461
-#define QCOM_ID_QCM4290			469
-#define QCOM_ID_QCS4290			470
-#define QCOM_ID_SM7325			475
-#define QCOM_ID_SM8450_2		480
-#define QCOM_ID_SM8450_3		482
-#define QCOM_ID_SC7280			487
-#define QCOM_ID_SC7180P			495
-#define QCOM_ID_QCM6490			497
-#define QCOM_ID_QCS6490			498
-#define QCOM_ID_SM7325P			499
-#define QCOM_ID_IPQ5000			503
-#define QCOM_ID_IPQ0509			504
-#define QCOM_ID_IPQ0518			505
-#define QCOM_ID_SM7450			506
-#define QCOM_ID_SM6375			507
-#define QCOM_ID_IPQ9514			510
-#define QCOM_ID_IPQ9550			511
-#define QCOM_ID_IPQ9554			512
-#define QCOM_ID_IPQ9570			513
-#define QCOM_ID_IPQ9574			514
-#define QCOM_ID_SM8550			519
-#define QCOM_ID_IPQ5016			520
-#define QCOM_ID_IPQ9510			521
-#define QCOM_ID_QRB4210			523
-#define QCOM_ID_QRB2210			524
-#define QCOM_ID_SAR2130P		525
-#define QCOM_ID_SM8475			530
-#define QCOM_ID_SM8475P			531
-#define QCOM_ID_SA8255P			532
-#define QCOM_ID_SA8650P			533
-#define QCOM_ID_SA8775P			534
-#define QCOM_ID_QRU1000			539
-#define QCOM_ID_SM8475_2		540
-#define QCOM_ID_QDU1000			545
-#define QCOM_ID_SM7450P			547
-#define QCOM_ID_X1E80100		555
-#define QCOM_ID_SM8650			557
-#define QCOM_ID_SM4450			568
-#define QCOM_ID_SAR1130P		579
-#define QCOM_ID_QDU1010			587
-#define QCOM_ID_QRU1032			588
-#define QCOM_ID_QRU1052			589
-#define QCOM_ID_QRU1062			590
-#define QCOM_ID_IPQ5332			592
-#define QCOM_ID_IPQ5322			593
-#define QCOM_ID_IPQ5312			594
-#define QCOM_ID_IPQ5302			595
-#define QCOM_ID_QCS8550			603
-#define QCOM_ID_QCM8550			604
-#define QCOM_ID_SM8750			618
-#define QCOM_ID_IPQ5300			624
-#define QCOM_ID_SM7635			636
-#define QCOM_ID_SM6650			640
-#define QCOM_ID_SM6650P			641
-#define QCOM_ID_IPQ5321			650
-#define QCOM_ID_IPQ5424			651
-#define QCOM_ID_QCM6690			657
-#define QCOM_ID_QCS6690			658
-#define QCOM_ID_SM7750			659
-#define QCOM_ID_SM8850			660
-#define QCOM_ID_IPQ5404			671
-#define QCOM_ID_QCS9100			667
-#define QCOM_ID_QCS8300			674
-#define QCOM_ID_QCS8275			675
-#define QCOM_ID_QCS9075			676
-#define QCOM_ID_QCS615			680
-#define QCOM_ID_SA8797P			690
-#define QCOM_ID_SM8975			707
-#define QCOM_ID_CQ7790M			731
-#define QCOM_ID_CQ7790S			732
-#define QCOM_ID_SM8950			735
-#define QCOM_ID_CQ2390M			756
-#define QCOM_ID_CQ2390S			758
-#define QCOM_ID_IQ2390S			759
-#define QCOM_ID_IPQ5200			765
-#define QCOM_ID_IPQ5210			766
-#define QCOM_ID_QCF2200			767
-#define QCOM_ID_QCF3200			768
-#define QCOM_ID_QCF3210			769
-#define QCOM_ID_IPQ9620			770
-#define QCOM_ID_IPQ9650			771
-#define QCOM_ID_IPQ9610			778
-#define QCOM_ID_IPQ9630			779
-#define QCOM_ID_IPQ9640			780
-#define QCOM_ID_IPQ9670			781
-#define QCOM_ID_QCF3211			801
-#define QCOM_ID_IPQ5211			802
+/* Do not grow the list with entries which are not used as Devicetree ABI */
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.53.0

