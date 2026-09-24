Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C9D48AE06
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246511; cv=none; b=qim1xZaSGDNWEY0GrZZzYOdBzbKlmoI5UvaKHKVVO6PeBJ7Cnp2bEjBDNYI5ZYghdq4VM0wW8G2j1VHK1LRh3VjkR7N9aN1Fr59WBGPMQYnVX5LHeK50d8OpZ/0Hom1+1f5VmFefOzGpTK1MZdfC6oinGBmmZkjvxAmSw2roxS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246511; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0I2WhWep5eQ27pUNu5e2fG9otFcU0h9OvqbkpftbOCA03W5PebsdNQkUqJoqEguh6gaCPDqiFM6w96/4qtNQ/3iy2Gsci6KblTdlaGAvPTIgGNybTfDEMThR6P5sUnIbGxI1WRLDL+zYuMaC3QhE7k3FBR0jWGEn2ZHEXK/874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COpumCkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk0jQ5rF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COpumCkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk0jQ5rF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9P90w1923773
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=COpumCkSp4u1PEnp
	KcPh3jCAkbEnlMJEgwNhkhPATucvJWnUJtJYp8RP5TgjEArxwPusQWdF1Ro9pp/Z
	b0ZAP/TxoT2SdFA91txWuenK482SjxTURwGE345pPRVtTM8PZzyHRplQTzXFvh/3
	mwY0f/d6Y3yyIQcIct3SUZFc+8MGmQK0wsQEHa7INNcBO2nm+1Lzop0RIR7xB31Y
	a3CVJLIOcPmr+AO/5FhSwOO+sR0HCsmIeITCqrcpQdX6D/mFSDbUeRYK7VQ4MgC4
	VEprvW2wgvMKgtfzSsNNFbsfRdSP7WfgLgbPgPA76QEjERWe147jtMplgJwtHdC9
	bBBaqA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah5s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e87478402so43298336d6.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246507; x=1790851307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=Hk0jQ5rFMWGEg5pgkeLuDqnxpGISuRL+U822cfuIaVgJKORYar7TLdJqJxsyFsXNsU
         B11Z52lfDOK8ycZjIug7lkgZHOkSNxR1qvd3azmqiXKs0Fa0jLK+bYhc1fCM8BcUV/WE
         RFX6FbRL/Cw+Ha6R4RFYWfH/0k0zYQ1xJgMzVbQrb/r5O6ZlGm2X0BTHJxxTp5mi7Tsm
         e4VmbKd7tp5rqZo/K0aTp4H2zFygxaBRmtvrde8QXuVNUJ2I69C3SOaUcWJMIcyno0gA
         IAcuu1+hJpuYb90FcxvsjfHNaWiuhn78R8xNWohPRZtSvUlL97Z2bWRD5lWcizt15iz/
         uWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246507; x=1790851307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=eOXLg/okp/ZfxqR7HlB7Awr4js3QjW0XZm1ifWFD1gP3on+kaeuO7H7Dmv1fOgw66q
         +FyBAP+RJnXD92MkOYGCtOT1lEvDY2edZYVmryVqga6gZji4GyMtaye3bNlalKxmwWp6
         Ac2vIcqbk1c3LHnWD/KccoA7U5is3n19flZA9HuXlK0R4/TAw8v4wLuRQitXFJUBCN9B
         DE7Mq3COsXtsWJC4N75T3OU0DYFjsS6VXtJH8H5P1QAVzFluEv18zVPZM96ZYYnZr4Gz
         5JyIG3vCRDY6oZZpOeg13W9XDiM3qtU5OLUTjdh+EXfiDX6KRwtt5pmD63X7x+GGpxbX
         OioA==
X-Forwarded-Encrypted: i=1; AKwUvBzku/+rwxmTUQOos6+7YaCLAylcD8UKkXUkWDlRfiMMY7i+jqa6+M3OcL9y9nWH3K/Xw4LklLJOx2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n1NSkqGD3nSjvzzZHuZWSqacVe0K+cP/y4rg5swBbLUyAb6Qvl
	hoLy/7H/cz5g2TTmES/IvhKbHTi0+4YPr9CLgBEV2bqGYBEZDkmYXOzULEILtPI0gWQ5hDj46KZ
	5R8zfi/qC7ymOKDL5CVvjPFUOgTJiJy0ZAI7FhdRak4mUwOkGTTTgSEgc/ykanos=
X-Gm-Gg: AYBFou383UIoNv14DOZdwBENdelT4/jlH4r5slgGfVBHyJA4grPy3aDAeAWukhl0WCz
	lVQP32WrNK+oFjlBzbHPUyST5oOMcp7ifB94wo26YTb8s4XJqDF3b8EXG9NiGtpzi1bcB/SFrVp
	7es0I/Qoo1t4LX7dC02Wbdv1nWQRigYLIBIBOllQeV3cYcY6kmQ2uraLEhC2VjBJBlOxQkAYhwz
	mtlflzs4WXrTmCQGJ+UpWJWOX/UJvqh1rrfZsEeufFkMnBGDqckyfz84HDtx4V6Kt1g7IWIJMLN
	tHhUUBlbutLcHmMsUir8bHLmBOnmzLjzbMiUjzPtj3+z5PcTRIV9ouw/vob/uOioQ2UMOP3SMpe
	aQ4ul5C9M
X-Received: by 2002:a05:620a:280d:b0:939:6dee:4b09 with SMTP id af79cd13be357-93c36402e34mr222377285a.51.1790246506578;
        Thu, 24 Sep 2026 03:41:46 -0700 (PDT)
X-Received: by 2002:a05:620a:280d:b0:939:6dee:4b09 with SMTP id af79cd13be357-93c36402e34mr222372585a.51.1790246505921;
        Thu, 24 Sep 2026 03:41:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:51 +0300
Subject: [PATCH v5 35/42] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-35-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP38tHgEnFYmeZ80C6W1eI7BUPxyd6w2O8mY/
 d9FPLw2l56JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/AAKCRAbX0TJAJUV
 VsreEACWymk6MPjaJSwfX6V2d73L+XAG1cSP+OKRLbcDZt1eblcCJScw+6Csn+mwq0G+Avc619t
 /EKvyOGgEgt95DoVcjHIvmJ9BEB5iKpvOcCsnaUOp0gPcyc0nRXxmecug1bMFOHWHdDTN1flb9c
 2Z3OpXLvJynNBWVu6KUgwOhJEBcYFZI5GjntUCMo112jvv/n8Pp6YT+JVT6nkUj/gCXLbLvbrRG
 liQ+ULX9oFtGx7YgjpM19ExAkNx+S9MtFTQ39n0OTYSz2YWtaA3rhYJr0WQ62lJT4czmYgvGJBt
 ER0cgOojvv3S2VCbJBjiIZBlYdjyIwZ0oIjSYDGosLK7imQqXGrgredbD0+5XaVHop+FiNnOMSF
 dw9/CGv4xBE57hYvQpMCJVx6uqYK5Im0/CIfBGPdqMh/clpG6ZfcupWR/i1qDTdMLUrxufJsVcn
 FAKeItDxX+lxdt6ebSns333Y8CVzERmBLA73F+bs4WwmWBOBdjP1vAkkA5dJKoVkh2u9N3jgbuf
 QBvtYPOKWN0JB5YLFZwXIl6d1LWHh+XW6gk/iQXhi3jI7FRaKAhH07zS0Nwi6UKRTyTUMs5SI5L
 zHHQqRirIwKzL0s5HUlkja+hD8M9TUVugr+kL20NMcirZdSh2LjZrs9WEyC/RtNStj7wjEq2kp5
 g8J1f0mNpOb5x+g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0x+KnpwoNZhd
 DR/v75x7XDKvdOVdvmXOWJna6yxN7JAePp+QeVCL5HOQxRlUKMMMfLuq0UTO29y1IauZF7M8kvD
 zsIjdaBGE9lMfuGgUDupiAuYnrnrdqg=
X-Proofpoint-ORIG-GUID: uSpWXqNtdlOd7w-LDlBiVg17ZDZb1QvF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7HTayar5RFQJ
 wSkIl63YS38zrnhDognx4jXUshifTkp03TFgKUEVhYj/Kt9XlA0SOPi2Mo4TC7emGM21z98ytEj
 QKx9xIQ+S6TY/ELfDN6EFbLRLLabn0qzzOGv2+o00k7Y8bs2fkwx2wAYe8RIEfDh/nciPKnU8ll
 uf0AdbDRDQpNyf33gt4TIq0uKJ7zfPG8z4Ji0pfcmryp6+CxBjP4c6iZTEeaNtsymDDLI0KQFoR
 uVpZL6dpfkMOP0B/pj+JacLkwJKEeBIzXp0VLQcsTC+JkSL64nMCvegHGDaJBwew4WUtVMCf1Xz
 RyiF35W/EA+QRLvVpuEuGgyIyrZk5K5tVSwIFpDgV2te3uv/neh0cGgC1AcZgMzo9OP2P3+SVpG
 4n3lfMNdicr7LqNkNLsyhj9x3LS1tutxiI7CaFQtdmxxrz3ARfGq7MnnjTtkqx/H7AvZQx+OnZt
 8xMYo+wxO9ujeQRxQTA==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fe6b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: uSpWXqNtdlOd7w-LDlBiVg17ZDZb1QvF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8150 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..397c0142ea57 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
 				      "sleep_clk";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8150_CX>;
 		};
 
 		gpi_dma0: dma-controller@800000 {

-- 
2.54.0

