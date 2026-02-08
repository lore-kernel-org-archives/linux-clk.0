Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD28B385ECE
	for <linux-clk@vger.kernel.org>; Sun,  8 Feb 2026 23:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770594944; cv=none; b=emZTWBOhofcffJdl6Lta6EmVei9IS1r+Y+s9wcQADl0jUbKDPSeeawvGAZIEY8M1DK+U7lM6v2BBdByIr8m8pV+jI4IoYqisV5u6bisRt9xa8La44K5wbD3ZhfToKGGielT3cNBKs+nYIECxtUMJhJm6axPOkXAvomU2MwzF0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770594944; c=relaxed/simple;
	bh=5zdqDOnvQk1WfMVdlJEQ2lF1AIwuHIpbtDl2oeKAurQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnnhmuHZvSlnhNomJDasYOMwm/Q9FDx/MZqBig4WNBjKEWHcILP0tXVATaZ9vy4n/ke32HFlnMFJDIANSRVZZAV/TurbdwhxvogdxoqC+OvFFGnLpnknQ9l05fz3aBITOIvzXD9lLPQcTtZUO3yE50z8u5hRCTtNSlc1osyjmug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WOCtR05s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbUIKb0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WOCtR05s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbUIKb0R"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618NhB3w3140010
	for <linux-clk@vger.kernel.org>; Sun, 8 Feb 2026 23:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJjEwFPYNGwUl9CYhCrEgKBed+V4A/onH3wDZR0gVPM=; b=WOCtR05s07O7LTJZ
	0naaXlWylkhD1FZXDWKitPNbwmTJNOn9FFVPigqrvYU+9KjFlO1rBJGT3RYy65rn
	X3H/iedEeLUgBoZUdeO9B++OFz8nXmOaXrR7CxlBS4jbXqlezhI16Fg3w7ICWEo6
	7mYrdSWG+nqrlJtfV3QnIoia9ShtdUEyWg6KGigtny+uhchu0378yVZ6xwPkvuac
	N/bDaB6qUBghzJlQHQfc2SfxKkWoij3H28h4tcIIw1apOcL9KuAQNBHy+ACVxA8F
	qN96qmJItiTJm+rQv/+hER+i6eVwmtrKogGwEX+d9SMPCOglQ3dWZ3pBCONp8RXP
	EDccyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g659eke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 23:55:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a5bc8c43so1209519085a.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 15:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770594942; x=1771199742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJjEwFPYNGwUl9CYhCrEgKBed+V4A/onH3wDZR0gVPM=;
        b=dbUIKb0R05yO91wN6os09yaiLHE8ry7NeZmO1CA1Y3fJRIw5Mv3tZpCbRGr0yLBmdC
         cj7u3eJYS33cd66C/U12txfUvWQE0sM1nqhvS27QK57VVD/4M4QHZt8wVCprt8XDe0xT
         uWy22M0AjyFMNvVo8/QPTMuwWUyXCBNiKTAvNR2yEvfeOSf65QlVBSeDP1D6lDXWq1YU
         kFPgvnORSJ6rjnaVgwxKQaK8qY6MXcTgc4ZR8HOa4P8gxjhKzM5MZW7/pAI4moiqxbqs
         5wfw1Uvbru578PyXz51uswSUOOd0ofAUBQ0JArWDXu57Uopww+mpqC4QVSmrJBRWbPPH
         qYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770594942; x=1771199742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJjEwFPYNGwUl9CYhCrEgKBed+V4A/onH3wDZR0gVPM=;
        b=WH2RUssy1oWzughwtoSKdF0sKzTYyVm9+tgTLaSGVucGfvOhvZYg4xxzUFBwP2/ivu
         GjrtwZUw0fvmPipeZjQp7xW87P9954VIr4SU27bcKvfKEc46Q9lehqUCB6fOrXE8rbtb
         BZtP5pNZxI+qro0zVl6EIvwdl5Pk0bGqtg8g7yI+jhtWAciDEkDbV8ih1YzLV8DL/uTV
         w83EKQqkidtXNJQ1PUwqc8b4cx3GeiZOM2igOeIZSkjgfWvP2DSdC6Ab97inTTSlo59H
         rMeSLYR7FHBr5DN/dZ1E8XOrJPsj/nqOrdYin270R1W27FbFo3qI6WbRep4YQEMICu66
         aACQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCidfBpfmosfB1Z2dzk2f8Q86P/VmMqdGyJPacTVEq1KvqSMymQGTYAc4sUWR2b4COvgzvBTRIgi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwgCuD4iGz/1Qou/6l6qP3BQJZqLtxIh370q7LVVe1+OQptdEh
	5P/PeHLe4JLQZ2/uwShj9Jvigf3evArvCjaBK1Sh+OQQAlna8zpg04/RFQcFmU8lTw/Cenvof6o
	rfZroTsR8iL3Kezd4E3LFX8Hi4bUntIyDSeQNpXsXOvpHlb6UvGgHKlj1zrjxMAw=
X-Gm-Gg: AZuq6aJCCMxb2E/n1Vvu97PGDH+4bEzFCtwKtdm6FYuIYtbYRcrJATAvH7Vp3HviSeD
	NMRgPnBv8a87/L4anKAONSBu0Z+Gk+N0Lo8wWprNcGtkrz+5cbVBlavr76DdtyJHpIsOfl8gFG1
	BDsWskxXyJMI13AL1YIhNeMH/NrIOmf7TfcJwCz7Z0AdvtSOuK76AWDoAH+WkdDJQTvzlNg2Jns
	pPORDYtKk4vCBhKpX7yKLGLZ+jgafOuUp8J7VrkTV1mMEnWJGENPketGyNyw5RmauBE7sacnteU
	EMRRvoo6843Y9Gxm+8nfh/HCzWYvOagqkLetstx0ifkoovsvLZbipZR2n9VPQGWn9vCC/6m/f8i
	ZTBe5KLkvSzrGGVSlRpmonz6MSsWaZLrez1XPPBkC2dlgSBygqvYj8HZiFAobYi7tIYxuChXxHV
	0/gF4R2HojRuzUFskRkiDluRI=
X-Received: by 2002:a05:620a:3953:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8caf058312amr1287249085a.64.1770594942167;
        Sun, 08 Feb 2026 15:55:42 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8caf058312amr1287247085a.64.1770594941636;
        Sun, 08 Feb 2026 15:55:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm2188074e87.4.2026.02.08.15.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:55:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 01:55:35 +0200
Subject: [PATCH v4 1/5] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v4-1-9662a0471d82@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
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
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5zdqDOnvQk1WfMVdlJEQ2lF1AIwuHIpbtDl2oeKAurQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiSJ6I/Tq1p/qfVQx47K/DfTM3AisnyeF3DByS
 9YoJ9tjcTiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYkiegAKCRCLPIo+Aiko
 1eQ1B/wMDN5teAlk01p2sWIzNKYWl4hwu4Vm26CJ1lS5lJpCl/i8kPf6yV+Zt7RfsKle74+8pjn
 naoqdMGXB2tphlkBQ4J80G1+7LnDDd6Ga7zjdAbK5p+D/OeccYYbno657uGv/BS6Wvd+rOX41xg
 ukMTGBo6l1JGLBDuVYPp3eChVQy11crs+NpUbE+Qe9YFMmxbfmz+FeNXt8tFZFAGji+hKezArCu
 6LQumU9ubJKwtEw8oStKTDfd3jXclC8hU5RjqlE9oCJWYvV1vNNsD7b00vAXyE5rBdqMegRUVS5
 XrQkwwjZFBjOA/26wlsHcS54CgFbm7XEZQAfBMSM8lSrtm+5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=6989227e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=LJIQitKNcm_3rt92gHIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ksb170lqSFCJsvluGdwH4AIdQnhcNIHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDIwNiBTYWx0ZWRfXzdRM4gM1BZXJ
 zqHiK6GfOgKqEqKatGIckweYriDyZ4dO4S1nP9rvj3yA0ILfNe3Id8i6wLKwGiv6bvASvguiBXC
 MYiteBEe14RIKb+VoagBaPlLbRJ7N1W0DLdGvwcfxfog6JkyM1UplpqGNG4GIZg/xCIY+t+tvfe
 yiKPBbuAII7nyjb8R08A0ielZ1lIlp+OYlb3uqQQmsHeIRmIhP3Fq+MZkfFjHXdeKMNudNJU/i1
 bVdgeLTyEv3KY9D3on0myre84dwpOtU/Ki3aqm2P1zwfH0WiueyOcm5b6MsJEkEJ36IC+MHpUgx
 wgwXmXzigum9jEMgwPVpb4rzMQ1wQ/7T2hRqVFp1JGxEfCIrDESviUXxTiBzSzz5gwBzSIVUf6L
 YCiCytqatoPJVdSZNYdynr3+JzJ1TdVIzOs2jcPHN4zbQAEjVw/UXLZ4I5WrwAjMnNlpAYMwkbH
 ahhb7Q8EAX34TApXdWg==
X-Proofpoint-GUID: ksb170lqSFCJsvluGdwH4AIdQnhcNIHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080206

First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
are powered by the MMCX domain. Add MMCX domain to the list of the power
domain to be used on this platform.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml      | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index da54493220c9..311c3c191b1e 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -21,15 +21,16 @@ properties:
     const: qcom,sm8250-venus
 
   power-domains:
-    minItems: 2
-    maxItems: 3
+    minItemx: 2
+    maxItems: 4
 
   power-domain-names:
-    minItems: 2
+    minItemx: 2
     items:
       - const: venus
       - const: vcodec0
       - const: mx
+      - const: mmcx
 
   clocks:
     maxItems: 3
@@ -114,8 +115,12 @@ examples:
         interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&videocc MVS0C_GDSC>,
                         <&videocc MVS0_GDSC>,
-                        <&rpmhpd RPMHPD_MX>;
-        power-domain-names = "venus", "vcodec0", "mx";
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mx",
+                             "mmcx";
 
         clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
                  <&videocc VIDEO_CC_MVS0C_CLK>,

-- 
2.47.3

