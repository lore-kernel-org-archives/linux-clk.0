Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD4C449B0C
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434115; cv=none; b=NgQcEPyT4ikGivdTYPUdWHz4HIDU6/gUOnBjwficFIvkq0lvHS357q321Na50d/S9c6W9hvYwkLNb2qi1ZWrUbXs2C76j2ESVmymJPjsupYbLm6MQrmjWCuZa9y5wfxpUootqQS719jn1PUFw/RCVu0lnMJsR6Tq53OSgmuYRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434115; c=relaxed/simple;
	bh=fvzDiZ67AMugJfYnW8hKFy6ptEIPS5tGSZjlOp7y0GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLEpgMdmsQr/OikCEeYAOlwOJE+xxqwGL79aXUUwZ4gxS7fSWcdqt/50CNxQ0C/a3nZC5y3ROoDSXMUWtzRc50XxknDEbD/WZM1vp6Y7Ynd/LIUxLByzkHegTtOXi6RPwKFG0aIhZ/eqA1wT+cu+CNkDfYG5NwiauxLzhbtoh2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gD25pnpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e21/ZYpA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gD25pnpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e21/ZYpA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGX8131629334
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=; b=gD25pnpDDmpXZXD5
	feG+/+BGkAPanJ73aT2UvWTDwMSUeeEGoqp0ZyXWU5pXDF4Phwh/lT+/gW4rzIbe
	EKoUvITXwfIiRoOBA2jb/KVosA8+kUyXz7zYmPT8iLEUeoxnwlP5uzoTfiqon6Oh
	IDMMLRC34iH4NWyAtGea2GQLMZrxhUgIAYNk53bywxz6A5tAOe53RoKhocRd4G9P
	ae6E1A7WqEesudRNf3Vr5jJWOnteUDSGyNwIk5bM18woybB7fD+C1ADrnBnAU0PD
	fGBgMNC0i11AYU3FsgTIkKA1semQdnWTDBfeNG0dx0Fa96/ouzmoiDz3fVsbE7BO
	DbT0RQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7q3hasj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:55:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so138293a91.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 10:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434112; x=1786038912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=e21/ZYpALQiyLfc2efSIQy0OCEGJXsrZfM5Uk+hooTh7ohh3t/skWLPxtoTpPEHnsk
         1uv7EggSy92XkANuXsjuZtOv07viOTP4MojlgsGrIZ5QDs4TmCMjk7xXoYWlgRawysqc
         bz/vJybq+pJHNm/xVILQUT3gQnt/ybOY3jbasF8IRFfssqSTwxXnL5Emszt95wwo3YIi
         OceQ9BKCTj9bc6m0ggQhupM36ddm+sjYY3C3gMnJ4O4GsjIqA6bNZ/aaQY74NRFdT+VU
         wd2qy6b6wk4XwMLpqUwbF34jjyzez6mCMI7F1HepddzkZTG0EFpAwn0U47IsnGoAPMTw
         Juxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434112; x=1786038912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=U1TEwz2fCIyU2TlmHKFckyI0Ci7W2u1YgG/3M/nHmg0Nu5IARRYUgy+9A6o5F9a4HB
         PuG1b/jmoPfY24pFPIqbeSVUlHFgWnvRgxQRU61eQYAhjeHEFH9pMwTldSv840w32XNF
         UyLDC6ENiy50Ht1EQi11ODqJSy0Iz9pKXeTvAwWDiYEuPSnGzGGXX5ep0B3fKKMv+H2C
         Kl3gnQAWnaVKOdiP8syWBrXPvg9ml4+CWovJMmA4XYGE9NIK8q+5t3TXohqtIZiP0MBE
         xP1MmXZuf6CuKGaw8A8FoRaTPk+zomdKMBHcHuSJ7ilV7dWxxbliZIod0T/TN8tlQQvd
         5EFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMu1sPmFVVhjEy+nhBHcluuk0qSbxXwq/tYaOCtD3VSfZr6nLVd1jwEbAt22BK/pS1b3ECfg1ht6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEarLO/bPm2B6xd+8u99bFQUcG53Qtjfcm0k9FehVZnQhWZdlM
	F5ZTh8caXZZFOskjvcO0X5jz99FJOjIoJsOd9EMUYfM809jzWvsej2+oeQUhuxDSrKR2wkkcl4w
	cpzN4TdVr/Hlxfxmz/YsxG2HwCyipGrTW4et7g6oPBNOsJs2lwsNU2RutRj/VjME=
X-Gm-Gg: AR+sD13hODd/JlgEmTVuWwM7p3kRIgNGWL+8adK10zGb7cGPBiPMKV5OsbTGtA5GV/y
	2/0OSyiWP/BHazFmteSLRaWIF4quT9ekhA3oFgpCOR9Q9vcpl+60oOQiWY3FtWh+5KOhwNZ1IPx
	/LseAKk5+kus+dV2+vt4eCxTUFEiEkw021KhMQ/NJfsm+wUaPDiWLFBLYZnWtP+MJe3RZvJ43ad
	SAVDd/MRsPooo6+V/Lp4p+kHX70E61YpU6xuVF908bMZilIaizzawF+bJlKEzyaenOR1YtYqgL3
	MwFPz4iVG4Wiswa98m7Q4EjwvN3AXjvDnekESR0NwOH/yKcwP7GNf3cl/NwflDFm53Wx+YsMBth
	oMbdv82DAzxtgHXl6tgQTZVzQ
X-Received: by 2002:a17:90b:5903:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38f9bece6e1mr2987507a91.21.1785434111703;
        Thu, 30 Jul 2026 10:55:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5903:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38f9bece6e1mr2987470a91.21.1785434111236;
        Thu, 30 Jul 2026 10:55:11 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:55:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:24:38 +0530
Subject: [PATCH v4 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-maili_initial_clock-v4-5-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
In-Reply-To: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX9+65Kzs56pXq
 bmOHr5zuvA2yxyCrSOPQ0vNGad93CJKj78mxHPEDzvsWbznV7yznTMfFqyFuscxrTc4cWuiBmk2
 aaUX2SmBpO5Z31PSV7z4VX+XNIuhOe1abUO8Y4IaQa7mTx3xB4ESqxIV2XMSuPjY+sv3KqwiRA2
 DtglyrbYZ8zwThL1zkOoEtIvY+nGMLvh5xb79yV2/YhBSkQguzYCdlA0rujtmWt2tjIMpfDptDu
 NBewMIw+9+utIkbtSNa832KI+BWf66E6OzHfb4f0iO4Exrw90V9qQzJTGWGjMepjD/nxZ/1Ahsj
 g636zQShgbATs03Am4YE9yPjlE0PdRyQTOZidKUbDTBIPDfYsndPECk+dZqFreHP1GvONcU04nb
 /HrMCEHHCkxOJoKOGIXm78Ddtdn76Sp7dHQyShgxKe1YY2MxNh8d8uBSCRMsv+7K5nTfqRfeY/h
 peY3mLxXGjrpoXqsgjg==
X-Proofpoint-GUID: zgc_S7aFIC4WGhl9KZda8oo6HXdaL9eF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX5FYacNcEZaPS
 dSup1smP48VwM6EV2MEi8fnGYLjEq+iOS37UFjV1RqRCEOAXMAPBhH3dWPAbMddkjBR9FBtPeVi
 b+dGB7NYhak2tZ+c4/GVd1L3flJvB8o=
X-Proofpoint-ORIG-GUID: zgc_S7aFIC4WGhl9KZda8oo6HXdaL9eF
X-Authority-Analysis: v=2.4 cv=WuQb99fv c=1 sm=1 tr=0 ts=6a6b9000 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300133

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

-- 
2.34.1

