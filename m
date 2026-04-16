Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50D38A72B
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327053; cv=none; b=hC9/4hXc5GGVVeQYqmtWMw5LWSetapmjSJq2HtZZ2X8APXa9kyJyQ3ykzrbbWX7GRvzBk49dLWpajAMyuPaS3wSWuF/p7a6W/IPAYI/zdekNlXdc0wNc+mJqo7tLXFOzetjErxGBDEllKiAx2WzKPonUAYA+qTw+oZtZ935l6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327053; c=relaxed/simple;
	bh=iOBwFcKIvGQfGatKncFnezTrgtTDmjTNCFZPI/HqB0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4O+czD5P1IARITWst66cBR0Ze/Biuqgi0FYZ2KKdjy2V/Bc39XQXF0ndD6xMm2gFXGCP6qdT9TY0j8JZkeK/EKqDYQHhdau3+gx1m0Pv9g1i8eIjaNJVwWZOHKAq84/LWH8bl/339lfae/+0yjl3orMoKNvLXDhpf+jAGzj27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExFs+Tsq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gV4SG2oK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExFs+Tsq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gV4SG2oK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6Ongi2651839
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmdRSOrfWdzGH2dtdqH2Qk8BoA+tbtyxvzoU2E+gQTc=; b=ExFs+TsqAqZECKAu
	MnlxwWapKXxFRR/Os7lP4P6WjwPf+utmDsXczipeiz+ELKLZrUZp5pj73+6zVg5l
	b/KXkimEtkxOZry5jhcPZHb+e7CnbBCFpa5g5iR8K1iNShTyhkZF8vz8cMR5TmGg
	3KOnR/yUGeEoyYBjczDx9Zpj5dQ6Im0kl5UCyjWm7MxMk198UIcx6lK0l/7MG9n2
	f+ruWrNIJYX4JlBUeU+0ooK86ndVhqMT6RQ3bknsATQ3O5HuS6hLxxtQOE9HcHco
	IbYbwDZSbdKzDzPNHy3Emet5qqJU+onnBdA4r00DYstrJItGR1T2s1NW8rWSUpOP
	HlH+4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfugb1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:10:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9a6a853bso189148651cf.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327049; x=1776931849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmdRSOrfWdzGH2dtdqH2Qk8BoA+tbtyxvzoU2E+gQTc=;
        b=gV4SG2oKaVZPQenoGYBxSppgScbDpY0oeMCPgXK+XIUJvjTdyi0clS4Lp5jO4xX+Uw
         jQKubexFT3XMobAa1B7UeYxYl/JEk/0k6/gJ3wqVwzWKF0X82JAUaKDuQX/1bueQx9OB
         q3KJgNT0yQ3Xve51NgtTNkqIkoTPAnLKKKbEVCMZpV8bXoH2nLYZ/zso9H7iM9Acmurz
         Bmap1YT6EKT6upe1akffvDOL31S43fGfW/B1h9jxAx0psG+ifmZj85OHdxI3vHtfXX4a
         myot+98o6zli4vuvnPVRm5i6Hk90FvUlsrQGPouJxvJS7ud983pCIWhPxX8KXojcyQB/
         ngGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327049; x=1776931849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmdRSOrfWdzGH2dtdqH2Qk8BoA+tbtyxvzoU2E+gQTc=;
        b=GzZGMfdh9cPOg71uXg1lFcjjLpjFu63IvJ3YHhgw2Vj+JnhxC99QLelYjW7EZALB1S
         QP1JW+YJCflH1BmIq7wdy3FHww4p+4J4hFhe8D5XK/E+8RIF2CQ0CxyeRKWoEdPtdFzj
         W0gJmrPajd3uqaQPq5lWzKU5x49pyY6LS3m8vKuTdxmcqPZgJ61+Hfh+fciM9D55s7/y
         X+JN8t8relyLs8BpYTGF6iKhFzP+6382cJyyx+4o3PgYtlE28QgCU+mr0ZEfdqSqviFF
         4iDZ/tNvzpUWw4TmEg+qssp22RD8dAxHPchz1NDfjzl7oA5rI7umIx2xBFfAdo0cFFUy
         R1+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9QNiroj2ALsR8NWsjYonhWRXj6/xj+P7a6ka0v2QVqEjxQIIJlzAKajnQdiklAxcp6GgIaVLmzQhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzgRh4LKGw6QdUh42kx7Ee7ziwDmky++gT9rCBYMb+K1eRZ7Vg
	QLbBVDiDWMLQ5hj0hbrQNrmTNvyAmeajASwmECTgeaWCv16H3uLFOMi0Hm4TRPylVZAI/TVLJaX
	ShnPUZczBJXPAri4t7k/X/7wOG1/HyE3ihlVZEEyEbT9UEc4JMz6ITGRD8ZQaK4Y=
X-Gm-Gg: AeBDieveCX+8xzJMBQ9QysLBOta40IzSCGLckWCHC0Hl7WTasbbsFPpC3qms4mk2CKM
	h+2Np1Q890alGdsp+CPgdFd2B8aDelnO9EgQiPkjewZcUNOZPiQmEc0C0/R8qnZheTbD7QYNAWZ
	x8vCTBqvFonVAB9wRNypfRJNKrgWjcR8mlDCTIbvoSReZNmGMkulJnpd1en4j/08E80wvyMqiva
	TdQchgn8BDW6jC8gz6yhab++4CseHsnlhTAddCv5070Nh2rTJbz0nwVvyC4WWSDz0EVHuThBgqy
	MeslYbFJPUyvnOQps7GeYChkrcNU/oxCsXQkKEXggKztaqql50NmxqiLTcNBhUmcidweKcB5dzR
	nxX95LhXAUEMNLyDmNTlAYjFnnvIPB8nD7OUxo838htgL
X-Received: by 2002:a05:622a:90d:b0:50d:a3a3:e62d with SMTP id d75a77b69052e-50dd5ad9791mr359345591cf.15.1776327049470;
        Thu, 16 Apr 2026 01:10:49 -0700 (PDT)
X-Received: by 2002:a05:622a:90d:b0:50d:a3a3:e62d with SMTP id d75a77b69052e-50dd5ad9791mr359345301cf.15.1776327049070;
        Thu, 16 Apr 2026 01:10:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35bf1esm12059571f8f.16.2026.04.16.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:10:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:10:32 +0200
Subject: [PATCH 4/4] arm64: defconfig: Switch Qualcomm SDM845, SM8150 and
 SM8250 drivers to modules
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-clk-qcom-defaults-v1-4-579e75c4cfe5@oss.qualcomm.com>
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iOBwFcKIvGQfGatKncFnezTrgtTDmjTNCFZPI/HqB0Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp4Jl+GhsWbJFWKls+wWS1ST7dtotqxded4QJY1
 zCerjtPS+OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeCZfgAKCRDBN2bmhouD
 14J5D/479m+/aEARiVp1h0fNlHlCxuW//9GdOvResmwpfT1EVfFqvBN3pc+eoQLeLcq+7ITS97f
 gf406oeTJPEobJGvGSZbc50VQMAokMsGuCpjIr3mhYyM9CS9nyRsGJOIyMCJUSttFk5C/CEJ076
 dsrh3xq04v572c+iuclUGzLXxVEH4l3I1jh9jEPNg4I+6RvQ6cqam9GJvsn/N1U99vtliNrDyMy
 v42YPPZxIiCMr+9J1PJsYnq/A2KLqbFrqGeav0sZzUJ+eYfsn7jBkYU8rD6VE5zicP/P85vSsp0
 CdJGemMApGb5UNvTW6M/8DY4ldV1i5MciW7aXWNZyUTTYAnC1LSozR8z7dEn3jDmgTOrwF/yniI
 4ajpzd9s7fif60H6bwD2k8kD0mwzrvgIKOsgSm+bs6jpK8XL/ey7Z7MF72br9O9J3G3TX4+2VDO
 XiOte2l/kAVKkxg5wjlK8uy03RzUJfuOSng5/4EDILOO+3pDnya1WfZBIyHcn5rFXvZK12prlgR
 S1rFwNlJg8iUY5C5FGl1gTUzP5hhqqWGmZPGL4rIM/is/6KJr2I2+528mKByj99aWF+oziN5/rg
 ZUE6NfpV9cSn/9trOG0mGIbYmUHQiyj0tOHGgnu1enMRPVBjnJJFCFWrD7P8wINMmnd7jwYUlrA
 EOBi3M6V/iPkoNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: jKMhd0WDMKokD4VAHqEbu8qKjc6z3yUL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfX2Yepw333Fxen
 lVVUl957uBCVZkCMCeIAqtNOwwOFeNIpd0MFoVTYJGTRqVUBkgRv/tyGiq982h7kStJcQXMIFr/
 sVt85i1WWfSwFAuM0hQAQTiz7336inwRNxc7uoeRchwY+qjDOnr6tvOWDwTYTcq8RGQRRXJpJNy
 hAJkE5c3gpeQGL5iqAldOcEKvexzAoV73GlgOFamKiUz7WZvRd5oP3f/ennKTvSQD3MBy3JwcOK
 qykVwI3esoFycqUtJELoZg0AFzRRknbUlGx2m42IQqcvGaUjcK2DYm4yMNBsVdr1eWqLSU/11X4
 PSSGxVCZXxlAUO9p5gs4kQ+z/aAJkm1WNPsl/cju2j75pfh284j9tocCQ7uvVHryd5Bo2aTH4Mq
 V8n34vAklp3Z7H5b3SBXCcCumyaJKV2lkpYc8dRHEfyLVeJZhxpymx0Bkn3kZZgl52qJijqDQkq
 zAnY6MzDWyjexTDDKaA==
X-Proofpoint-GUID: jKMhd0WDMKokD4VAHqEbu8qKjc6z3yUL
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0998a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VVS3ecdOb3HaevTN2i4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160076

Dispaly, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
SM8250 SoCs should not be built-in because they are not necessary for
platform bringup to shell or even mounting rootfs.  Drop their explicit
selection in defconfig, relying on defaults which makes them modules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patches.
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e2e5784ad329..296fc0cf7d3e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1481,14 +1481,7 @@ CONFIG_MSM_GCC_8996=y
 CONFIG_MSM_MMCC_8996=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_MSM_MMCC_8998=m
-CONFIG_SDM_GPUCC_845=y
-CONFIG_SDM_VIDEOCC_845=y
-CONFIG_SDM_DISPCC_845=y
 CONFIG_SDX_GCC_75=y
-CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_GPUCC_8150=y
-CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m

-- 
2.51.0

