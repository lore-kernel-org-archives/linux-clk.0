Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA8427F017
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472160; cv=none; b=QLPF/x6HhEN7mbD9ouykGEpw6nt2TIXJuC4vA4hCFqh6IlAxLdxKAupKh76mf7ah2JZgrXAww0lE90xwHQ81tR6P8LFaUZ7nQrhSg0lgRlAXMkU10yN/IWRV4FIEariKnbI7zxCY/GIHdHXulaX87IzG1l2Bjrc5N/pFTf/9goM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472160; c=relaxed/simple;
	bh=dkdKTWjiIoTpWTw2AnmWZhkyXS5KUPx0v9M2CLb1BG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSi4QvbWNqjNuIjjYk14/YsNFTKlc4Ju6bX2kuoBFzOwcBnOs8/Mo55vBqS9IMuO+hhhKNnlyYZSVME+w6fpOqEzj/FMvZC5yof5VpFJ0nZoB1MwFB5y/cjlKF9DdeoiUqmcHgLYsAMYnzkTi0BIfkiEiZ9NUAD50vqRzF1Z6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLZjJxj/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PescjT4Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLZjJxj/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PescjT4Y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q0Ad963253
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=; b=VLZjJxj/JU1FlGZ3
	LbhNAJmxDwhPSJwT1rl/GwYebs6NikvrXWml6YXWqlGNwCcYiZW6kr67zaQY97c/
	YqIAJ3Ev3u7g9KcgwX4nopQW58wtv84ADoElTAjWRZ3HBtKPnsi1Zmxc6JhuZ/lC
	xdT2huGaGI/bPT0G7QnXjts9r8b7ovQMWVMtmiWWAZmtJ6zqfM9k4/PrwAJBa3Ic
	LVmvUJkpc62Ui0BCauCrH69pF6O/dSlqUoFnMapz0m4qLi1a2yAdMXF3lYWijxxh
	iRmyPIymHcrwJjo7lsnUbF/upnbvE7Vwz9A0M2im6mjXINKN02VvUMRfWgSf9lTU
	ywvbCw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4uqqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:15:58 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-657e42cee12so4313609d50.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472158; x=1778076958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=;
        b=PescjT4Y++ynOS787853EwpM0gEulvKkszTBWEqHuyJ2gmIB6F1itGonLIhCep3V/F
         fBdhpCdtyB/BYNs6lGsvGKiJM48naiBBfz5HvOaK0vT2p28Pw2d16XFvl9bQw1WT1JH/
         8osWfuFJ1CvMGdrekBae2LHbi6Pd/U8vO+1kfmpgKrvbWR3eGJQDdZJrK76BLTF3JE6/
         tOElTm8DF8E0vN/4u3d/zN4EiDtlRkjQISoTOZfuhutzKj8/eI2tzUbEDp1ANtXL9jW3
         72RHrVnU+Px8HfjEQ73o4ly8o3JxKBdmKnkvt2ZzCiypFE514DsLf2yRtHCSw5smFI5o
         ahbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472158; x=1778076958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=;
        b=XN0MU30baMViZzuxECisyyc1LhVzKibqnEWBKLHDuaGT+bV5femyLhpkMCiE3U5j6j
         Dcxr0GaDo7nJhm90eEpM3/WvcezfOPMmIf6nlA6Okq8YB0Jhi5isNVdcmkwh2lU3Bi3d
         W29VNnIP2zAYoYi17/tt16JiBmo/oxTYQlvHISXxgJYK8yCXtkpy1l6lKDLAMny8eiSl
         GiBP867VZR4R1avoHyGPNaNT+9lHx2ngF9p26v1kEOj8ND17IwvCQZ1X/qwFnl+QqAlQ
         ++OCotUok7QRj9JpNrc7/f06TRgMJMhYN7myPvn2jDPFWr6HyU1Dt14LKDgeFtTDqTra
         Ud9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9AqbuzJ5ti5XAi0ourjmMeQzM05KK4L1sBdnWHESQe/0j2Y2246QUR6C9nevuR4nuwnOYcwwndBNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNyiDfev4dPEwtuQ5jLsfNnH1PiqiazIwmxX1NxtbZBfzu8t/y
	4hnzusKw+BbtNExk4o9AyChKLteBZqT8gD1MGevsMwfDFuminYiL6k+SZ8CDXxxfqn95/WT7pHl
	/XjIwXf8vQihFcw0bBIWuyJagL6HXJp+H/MS4uuFKS3dyMYBg3RGdqtnn7v5ZzyI=
X-Gm-Gg: AeBDieuCnhgHXk6Sx2wkFzhZ1Dt/D/1Us7a/BShh0pU4ofWhkBLJ0wK4WXnkw00Zm8t
	QdQ+Ed379+u1zK326p9w/iLtasUex8pyt9MkkW9FtdOW0zhEacX+9o88vllKrJfknFhOdJ+lkkK
	qtXv83JiZkprQFshOkC8wZdBhi4piUN56p5lMiYFGPtzQgKJYfeS0OjPo8KIM3HS3VyEwotbt3Z
	GIJgzkuU+GYOrHxusexADbDncRhis2nIHxmyrrCBAEA0ilOYUjmmbsKGah4f7p9yeJ62Cak300F
	zN+hYcEUd+SqkAUrhd0CNcjtiUvvT8L7CpT2X4mFNiMA/RQiYnSO6eDy3G3LWHljZlrcBatJj1p
	AE0Egg1t7FM2tQP/PfsZBxxpJD3l0eXZukQILKEOnxBn5vQImfZvxXRTef/bhgw0=
X-Received: by 2002:a53:ac81:0:b0:656:25e6:e107 with SMTP id 956f58d0204a3-65beed51765mr7084482d50.3.1777472157585;
        Wed, 29 Apr 2026 07:15:57 -0700 (PDT)
X-Received: by 2002:a53:ac81:0:b0:656:25e6:e107 with SMTP id 956f58d0204a3-65beed51765mr7084413d50.3.1777472157021;
        Wed, 29 Apr 2026 07:15:57 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:15:56 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:44:58 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
In-Reply-To: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NSBTYWx0ZWRfX3KaXVzfWcSbY
 phqtd9rVqBHTOxiUWyLP4tM6zZkJcNUuoEuFN7e/3KgaUY8FJeFlPkoAhpJD04z90uJQ8ZrQwNq
 1aLsOylCqt3CYD3hYFbcgRFXc0PfsJS5phrSvOWdZ6rXpmIJs+HnjVStM1+CzeV65Rhla186QiW
 Qu61qOr60NGfTfowERJxzfWQ5oQXpZpv6SqNB6kwM8Jm1y9vjdWqBgfnJkXGKTBcXp9l3xxdW8y
 5aeVV90BXA3ofSfhJzVorx9kgqg/Awc+NgD39SwCeTU7Wxyg4XipCNF9CA8tutYCEm5jLl/3q6k
 s8t+3ZfxgVZcmJ8P4G6x95Lnd6XtUGecG0K+McY72F+husidJjCCHRsRYAwiclsTV0CHeZULG+h
 0i/gSmzGAhH2XAG74gFTCbTbR/ZLewX2+8EJAagrZ6yP7Qxas6mNYRky2W/xyzHBaR0P54Yz7NX
 9G9MzRCplZ8t18hyflg==
X-Proofpoint-GUID: cBGo6nwohQVFmIaRmTXs_IFrT3rypK2D
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f2129e cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: cBGo6nwohQVFmIaRmTXs_IFrT3rypK2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290145

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..8e2a872988d1c3d97506856e2e5325646db59746 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

