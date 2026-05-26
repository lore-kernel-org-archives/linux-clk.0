Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBDC3AA518
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773420; cv=none; b=B5X+yLF9X0MQbLHKFHX/8ht/9noE80/UA47ynSAYcKi5XQ47FqCUuhctX+prFjp1BnlvXgfbIGKiZWfwgizzN2CpQMGTlKRrKb8Wr3arDIAg7Nq19D3EUJBJstIZR5SmG3tzlvL77sjomtU87y+Fb+YFmWfGC+psTp8Rz8SLrhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773420; c=relaxed/simple;
	bh=SmXOInYNnuuWw9LyfstHCgLf7UMa4kUN0xkTlOURXRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwCXnIghJ4mLVNvPznWyuDxNYLzj6/3zUFVT0+rG9qiSZf4i04xy7axsE+zA8rVjZsKcdmBkDLIuwmeC++S0AAREHCQtMY58xZ0uC+jGeLT2ceYJGwNkPklzDck+pZkiQP0iwTJbpfwQO0cWRARjQOU+Qftmqii4cCrpMZC5MdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzQJlEGW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IclSXTZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzQJlEGW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IclSXTZR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q11Wu13603993
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=; b=CzQJlEGWlesiVrHn
	FYVPkwDMk4oia5pSsFHfoL4PmB60lqVqLF1mc06sV7As83qPkyYD5A1gXBqNk/O+
	s5bPglkNWkKjV4yJnRk6rYfrd1yy4vrpAC6K1wQ0mOt+G8tk78+MoIAv8u2xix6I
	98YYEdBnM77oEsy40QyXop1HLqmTHD4N9DlphQueAKs2JIxBJmzNosNVeCyBkfW2
	iPDeVDQAsV6tR91ELVZfD9LTVeqMSsDdLjAWFZ+9HJsv/R/KKWTtfn50kxmd/wMq
	Rk+9dHHu6ZSaNQz3j9634R7WPVARLZZgeI/9o4kh3NUToE5+dQHhfMgP44g3GkX7
	JrEMNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqjdfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7378ad0so107463695ad.0
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 22:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773418; x=1780378218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=;
        b=IclSXTZR3bSLrkWQBOokrYTlJ0rtS3vj3eFqimTk+J3T1JwJFGWHrf3rYIFiuzvqxk
         PjBGTzgU5xXmGCAek/MGtaSCSf677Bkqq9zntDaZn/Yu1dOL7CV1jI2SfPly4TRNCKc3
         fnyLpqrvCB9ZlpzxZF76KDl4igDp6se7DAHwwXUJ92zBtlLBWoToPHuBo/FWDvOJlkCX
         ZHcNl8DEJmCPtcbq9+xTkhTW7ZRjLJ6roIboxdlqKC0r4LOoCgueq2ctKQzeSnCV3nBu
         0sgdOawbOQhyJA7EAJv6vT89Zw9T0BYCGKumNiHP1jaqOm+DGHRKWW9AyF4Bw/P20jNK
         O4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773418; x=1780378218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=;
        b=mU0xqof7vsnk3rU2QbnL7uAv6iKBoprtli+UUuKm03Ur+oWnwp0k2mVNy5UlLdbavz
         oB1Zx2BA3+a/7PwCscGNP+IqXqJ55AYKHXxATFolBzcqHtEFod4gRTU4IaQciAkFhwZA
         OqUx+JUwuz1DL7cJkGHllJrDkMWFyEGmnlbc6fEyD1RrcL4lFR3QIvz01OMCWYR0JCrb
         kqLfQ+koMTn1qk5TFQIANqQxwZNkqt+Jxi4kfCz86j5CVWonMtgaG1hELaAYtFjdrEUC
         WzX2HbyOG6LWnR/xBkTAh/M5stVFFAWU4Cr20K9g0BRbApbhIh3pQ/xJEOzqWxVY6bIp
         OCUg==
X-Forwarded-Encrypted: i=1; AFNElJ+C6roYWObdSAr70N54/GQWGGBvUucSormhcYbN4Dvx0YQJgqxXfnH4bLWBDNt/KCH/TJ19Lptw/hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWPdfTkaOfvVmCw8w8GAOTnNKRWScM4ZM2q8XXkDzNJfXTxsj+
	GQ860LBaqZCL7c+oDCPVyudQFg/cz0sO/jDenOLCYRGUH4wK9+38sot0DlkjpgTMehtDmUGUsTP
	jZXNzZnHyDxC+xu1nXhe1tiT6U1OSp7UuIb7Ibs66VC3lHuN9ga/Jh6RylY0VrCg=
X-Gm-Gg: Acq92OEeqsTiOl8A3zVqHPoTXU+v8JWZAdvDT5aPsjrdX324kiVXYtAcHjo4yacTCsP
	af/QhBMOnEN71tHx5GybJIbG5TB3LATjtJAQYJ7jgvQovnv1EKh3D1xe0dd5MORyziWM++xgw6W
	+N7R1626xAx/n5M9eDd4pJvmxAJ3o4IqISOMka0skO+0hPjNsQ+8PpSrqg69GvAOkn+grVvsnPX
	NdVI2v/sUjYMpGIceVBh2gdzo4BRuCKD+v+0jcKlKMCbH6fmkvNetJSv3rzR2fSE8bKXQhqNO73
	yCgDl7MGuOpNtmC477Gn1mBnltDZMRtSwlqzGs5FZyy5Wz4GCD+zHo9Mm+mIXIKtnk5AkKFmo68
	cir9TDWD0oAGM1i7sZTGmGQH+pImOEcVgycXG2loImCfJaw==
X-Received: by 2002:a17:902:e548:b0:2bd:4d97:b5bb with SMTP id d9443c01a7336-2beb0385f86mr195646415ad.12.1779773417315;
        Mon, 25 May 2026 22:30:17 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2bd:4d97:b5bb with SMTP id d9443c01a7336-2beb0385f86mr195646035ad.12.1779773416724;
        Mon, 25 May 2026 22:30:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:30:16 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:59:47 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a152fea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Juf6bUmjuD87IqhQNpkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: gQGYO_4gQ0FxXru07I59Nl1SIFE4FK9C
X-Proofpoint-ORIG-GUID: gQGYO_4gQ0FxXru07I59Nl1SIFE4FK9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX0LMG9F5gNF2X
 mID8atrIO+HuhoQZn+GnQv4KLkR4sY1e1g1ao2hH1hR+XN9Kt1m50DTYZcTlCbAcUN3Oa9nLjAw
 rS8tSanSYFnD+QMYYmCR+cbQoIy0uog/Nqk6K0DR2rtchdvq1WySlo3VgmdTclemXz9hRXM2h6H
 LybS+wlqtSgX/9WedFJ9MlQTiAyFQglDeLNFfQQD0LaTl5Y5RrSOoBmZ5Y9Z109GhlG3Utx/xkC
 7Y4uWhfHvVW/nyn/w4Y4w/cbuPRPUhJUyS17bfPYKN8bLoSgmBmHsDL9ahzpzUAxWNF/w5pPflv
 Yp0ShIBYPQAvm3XSFlSyAZ3RJ8PkuKhQi+uYHixnJU9Qhn0Q7RCHEFUbiHS4gn3884ckFlP720/
 vlJy/fe+3ZVVRrlaCfi0YF//hcek9uvI1pFmMKlv5xBPh2zFCeyPZ5UuqY9LBpSW+zaAsl6XUI9
 aYyMWCEczykO5cWqNIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260045

Add the device node for the EVA clock controller (evacc) for Qualcomm
Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e9549d126aa50a0dc7a90943a3249..66948808d197bd17ffe65190b472bb845cba0eb8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
+#include <dt-bindings/clock/qcom,glymur-evacc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		evacc: clock-controller@abf0000 {
+			compatible = "qcom,glymur-evacc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_EVA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

