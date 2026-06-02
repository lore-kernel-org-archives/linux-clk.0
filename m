Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC33D3EFD29
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413750; cv=none; b=OvS8H8lfPujyFgrv4jCADiqhRjI6gKmyL1mEH8obWAeccqNOEFcag5hoIxPEH+mSuFk5Zbr+yQpbAsN4A+yPLHA1dIYDJ8ZF8jJ0cBxd6lOALE5QcFTbqsnwvFxfj+bpAPo5hWWaYrYv7eiB759SKx9dAYgp7hZb6nbIUWyUls8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413750; c=relaxed/simple;
	bh=+Xb/utRGbA76vMez2NMiVdI+b7uBrOEKhyFM8kS9ee0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIYz/zcXfALTIaEzvAg8yZt/bcrCQo2uQo08A/4xocyj4kvECl0+/v7DO7V60nrwc7o2F17eVaxOdDIEhM0hsjwdybSFxJd3MgWG3+cusV353KdVnDoDjcYddEXecuh6RjG4yiYhEc85sXfijhNok0EPpcrerDkO7X2AA96LloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5J0vsFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bx9sAEBz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5J0vsFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx9sAEBz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652D0FM42767168
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 15:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhRPtdw0XTUqgVAR+NUCXa7KNyeb5Qt7pdv/jdZhIhM=; b=f5J0vsFV/Va/9/B9
	Rau7yFgAY/y9AJgYQAP102ItcfTsjTLroOG/XgKkClblC2RgveaFHEqhAUw4XWOJ
	pv46Tz7TcoIcgnVUYQUJ+iWgX/UfZipn9KjZ4V9NCrEOVgqDtbZBUTcyhv7XVexc
	/n0mXwy+I7d267lPFjhHD2HO1ijPswpLZq4fYuplCFlLFikyoYBtSVZfiG7aBl1b
	EwgWYw6D4n3RpUV/Z9pbtt+5UfjeAepnQdGip5N0gqWZHDk50WLFQH+3Oq2QlKA+
	VlrYs4Wiql46RsQs7Cd0KObxanA3o5aqto0ndrienvA+7yBLMDwSUDQqlcmucbV5
	H6xV4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus262w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 15:22:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf11699875so58480135ad.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413746; x=1781018546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhRPtdw0XTUqgVAR+NUCXa7KNyeb5Qt7pdv/jdZhIhM=;
        b=Bx9sAEBzsgnrFL/Uo4J+m/NrlovlSHYYT9CKoVktMXfd8I8kUuam88xOzSMs48rJUR
         /YjP8l3AH6xlZBRrRzMbudY4BY1vYFCdYNEfE6Z/PX2eq4Sa5WWZAifm6c8Si8RwJJFU
         f2YFG9hbh2Q/0dmA3y5J5CXBnJrCDfhRs0kMyWhv007a/ju/6HByZAU0RXWnyEEIrvQP
         MXL9uJCrFiNl7aBelhiqWADnjxUYYqo5RXplHp4mByYy4fP4QTWJtXZcOTiHxzs9QaYw
         RtD+H6gUV81dxWsg5OuU56HPP4UoCc9iZhr/bLonulflg04uCmMwNJ9kK8B4BukUXiHH
         /Zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413746; x=1781018546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uhRPtdw0XTUqgVAR+NUCXa7KNyeb5Qt7pdv/jdZhIhM=;
        b=hpx//GWO/mopkQS9IWdp5l5mPuOK4TMc5meALobaYKE56UXlOHp7qDXM5aI1A4MXiR
         i1nKsqlMTWTx3ieHbUce7Ed3Z0bz8mMOANvMunVhO3fx+bXl8CYCcSdnlpIUKS0jTOfR
         kZkVcvfov64EWx/ba05AUFNi0XsHSODqKLovlxi2KOq7j3e/Dc6bHBgdBTTdNnGKLFJq
         d2GNqJYYC1LIqxKUvef4l6h2WWKdrDqCmxxP+E8yEy6tuwk7G0jm7N1YIJNuXMhLemxt
         bUMlGYQ3Kbg9rnIGs8R59nLVCgRqkzKsVpeHZfrVwhQAMlcs9YyLtWWgduHp+Xpi9WoY
         QLDA==
X-Forwarded-Encrypted: i=1; AFNElJ/W5oAJErwG7BVrOmWtghjzalVG4QUF12Jtvsel9EVc3f/5Lfi1N1kyJBBO7PiU962tQQsjy53W92U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9QLxWh9efmLlw9Ew80paOWM7TWQ9eh2qlGYe+tw57iRPC7u+S
	DUIu8MOKucME2cDgx/J7CItJSwF2bJVxzz54ubd6gTiAORi36d1lqqLnZzRZrTwurcs5HwuAk6/
	8qsHTql9e2lxWwRMlAB+1SVH7EPM2eV+3sxIol7tbfWuc7kTuZsNArt/VfS0mPBU=
X-Gm-Gg: Acq92OGNiPjIcPfdf2PSUhXF998o60Ic5LtLWg3yR4rlnorBote1z0fF/AWcicUuZMN
	5/T2rnc8PHP/Z+Fmsc2HUAn9FvhtXhb5mFf/TQHymxGw3wnThwQZloGsbAB4wpkQm56WrXVk77x
	3So3llWA6pZHtcoCP28xtsWLr5A4fVr+UgGi8L4QFAMDUSbuiFG429Gk+syyCgzOdnkBRU45jzW
	Ky953xDDYUfACNHDuxTxvLpNiEr+FTqz7YCAznbPecXuJzV2L74axLpdDZqZARjpYCtjKZG1EGZ
	/st3y+RM1IRXyi3LzkAchUU5TBrRqRnruC3k37QJ93nkfbhffKb/mGmc9/2mmA9EnilEyNa5LrY
	WuJBECvfehWalaFk1Eno9AQI3PovvhH3jR8E0sWtQKF/GRSyp1tLO4gFI
X-Received: by 2002:a17:903:2351:b0:2c0:aa5d:756f with SMTP id d9443c01a7336-2c10cc58081mr37108035ad.8.1780413746460;
        Tue, 02 Jun 2026 08:22:26 -0700 (PDT)
X-Received: by 2002:a17:903:2351:b0:2c0:aa5d:756f with SMTP id d9443c01a7336-2c10cc58081mr37107665ad.8.1780413745979;
        Tue, 02 Jun 2026 08:22:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 20:51:52 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N clock
 output
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: GityNwzG4NXDke6b6nj2beiXDFyl_VcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfX87W313itADqH
 fxCW9y3s/5auFZ3kqmnrPO9iGcab/p0qYyo07e0uJx5KpJG/orXhN2cLtGKGkLbw05kXoKvC1nS
 uGtoaKOzQmuQ5kguF3ahB8di9I3pm2rxeUQm83wsQuB3aIf7aitKvX4r0lzbHwv71DMYLZpjepK
 u9BD7YScFX2wA6Iwkcx4sjz+E4+iqtQ9rrWM2JDVLf8D70ryTDUMXZqe0pWhB7yWGGmfmFioi0q
 PfV4d2RpP6gmV7/w7NtM7l1m3alyBjOEycnUuHy0/O67Crn9eZ5BwCtfNR10ELLaQMEE1COszvF
 Ww4fyGuMBX5V+4renEDxsCZhS4YZRop4H/Ivd9y14D/2gCjWNPeXgxWNgRh40n2PWiyMlIAwps2
 D79+wtsTwm8D1H3SpG02sdK2WdrQSkqfvWgCpa5fvwirtScjWmYE7JpFDRRlNRytnIYNy3K/ZyG
 PizvrM3qt+e5RN0JSNg==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1ef533 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FGXTwBWI_TPF8Oz6hcgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GityNwzG4NXDke6b6nj2beiXDFyl_VcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020148

Add pinctrl states for the GP M/N divider clock output pin across
multiple Qualcomm SoCs:

  wire it to the GP M/N clock controller node via pinctrl-0.
- kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
- lemans (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
- monaco (qcs8300): Add gp_mn_active state on gpio32 (gp_mn function).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615dc02d941eb16bc7253204c2750bd..1ff9e1598d00429c03b2bcae41fa370ab2c892bd 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5908,6 +5908,13 @@ edp_hot_plug_det: edp-hot-plug-det-state {
 				function = "edp_hot";
 			};
 
+			gp_mn_active: gp_mn_active-state {
+				pins = "gpio35";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_data0: mi2s0-data0-state {
 				pins = "gpio98";
 				function = "mi2s0_data0";
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3acb22ef228bee340212b8b2c300957..19f8cf4e15482947f6049188050c370340afaead 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6022,6 +6022,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp_mn_active-state {
+				pins = "gpio35";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio114", "gpio115", "gpio116", "gpio117";
 				function = "hs0_mi2s";
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941bdba04f99b988fd7bf5afd926b31d..ebe5889daa5300efa7857314e9170d7d2fc33ef7 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -6433,6 +6433,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp_mn_active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1

