Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B442E400
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572610; cv=none; b=PmJ9ARLEgMp7bLCl4aU8Yv+mg9LRa3mXEeO1tJ6UbchwD0oVm+t2I/cHi8ZGEA8y2xNNILec4g9U+l+ULncifAWIb4y1xQObhKCXiDq/aOGPo0v/1tgClROHwTFXiLdUSXc6+e4hUQzfoS6QGFvuYxutZXCUF1ui8RhEvA8Kx9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572610; c=relaxed/simple;
	bh=zQploYAcpfpzUvpEw88xdaf8FLJNQSzoWDuVL812NeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjBsdeKPdJijqUrq5N05U9N5qlzmGdRZmIPE9/t60wh4CFfQLJwbZ4VYTjE8Oa0mwjT2mDSY3l7SyVOXQIT0sFv+FRFWiTTgDrNSPKGLQ49tD7mEhpn1TYU4BIh9hOzynEnIsy1Jh7GBQ6p6kdRjZExlPHP4zvfayER3odpRKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgPyLIuU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkdiVCNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgPyLIuU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZkdiVCNl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMnXd2865081
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=; b=lgPyLIuUXksMsUj9
	RObOxa2ERYFPKqd/vmaq8RK0q+AEsIVvTLORaCFSBH3hqSoKwcfxyPHLgfXkS+Gm
	MGx9LBpvzNYQC1CwQwFGrrbPHduEpEGOY1mMkjP+hSE4LwF1rqpP8UxSZwh0XgjV
	GY6dBIMjfBbJy7aEzIpL6wFdFqUxiU0UkihYoUjRf6ilMhBf3p4AzyCpnhHnJJ01
	u6LHxvDHXl5/Soq0BUhcOz72jHH6gtQ1Oz23tz4hVlllL24DexowECHSrt8xiRG7
	mfqNRy0aja93xyVx08fImcWaCQGUqZv1a8OQOg1hop0ff2WO/vnu90h8gu6Z7gAJ
	9Vzg9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e934385db1so39433466d6.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572607; x=1788177407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=;
        b=ZkdiVCNldK04hzz9jYjkiUff9p+qBLnUeUnx66gH5iQSVri4RhCI5H02RhYT2pQbxS
         CRrY2FyvRP9ElxuTNAzkh6dloe4+0DW9WSsZVjogxEDfsUnKRE2I9gge7RMpCaRv1+ti
         V9ksoil2406KVc4V1JWV91uc/dS+hIaMgdSQLwTDBZOkdLHPOLHvooEC0MzUUWzaLRis
         Xt7ywQEFW5jNjlRCbLJchQ76EVXw6voQJweyfeqn4KIK36zgwaDDMMxEcBpCJuAS9geI
         E6V2SRgJdYH2/Sm86J5k4/sZ/oLnc3P1K6SLIPXvJJcpCpT7yTOBl2p+R3y289elo+2j
         Sx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572607; x=1788177407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=;
        b=YzaABSXvz/d50gc59wjXf167CV2O62lyHI8hrQdy7FyjEjVV9lXB4S2FPbpIbbeUJV
         BIJqPTenM0h+iAdJ5RLQt2CDb4XUDjBbeH/2VSiwTKp+rfYS9mQWt0YzsB/UIfZTbF1v
         HhBqo1DQcmz5xEnzv31DrdWo8pJjerv+QPJr5n/+EARC5BUR/QD44oiUi2vv0+mTVifQ
         c+7XjzsvRqi9a5qtJntNEJBTP262xGVzJRfVddRJNW48xwkhvkSrIcPlE0vo2w/dGUXq
         T+HTS9PMpU2+jP8NT4HxkZtrEUEJ/IAbSNv4lz6/fK81cCwEeYlScH8bA0mo5dgqL8hf
         miDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmdcF69hEd4HScvKALuQyb/zO3t/FF+qrjiaXizBdfkzUrLaZ7sAcmXLViMkBgluRebRviopRnaIs=@vger.kernel.org
X-Gm-Message-State: AFuF++mMEXEJcEdEEao+JFfuN8UeLnlANzvt2xlY65BRHT6RBFA05dJe
	29ZoVkhlwcP2FETus+odPWT2dTO5dFOn+f09A7IWjzO3IGUPkSYkZVx52Sxtwo7auif8KReJ74H
	B1WvJXq/olCMOkKZCIxk7go9bXan2MQWcsP5F+s9nkeykZMDj32cr97H3vkYgzKA=
X-Gm-Gg: AR+sD13d00/tkxPtz/K79UO++WKAH9veQgTclnSyVT7YVXFQeynxNaOxL7LyfRQEUP+
	D2+EK+90IXcgAEYXjD7vUvBI8gnKtHNO8rDCs69Cxx/diIEaS2ObMjM5VceDwjVfopQAg+eW5Lh
	+pb3DZbACF2DqG8WROnTEVmPvQc8tOaz6kzQYNHMwA2fB4sdIzGhV8CTkCx2CkfrCmte4SpvUrJ
	jBXD23jahPlu6/V/+hLQeXOX6PyqX88FNoVQDXZV0fkQ9UXEnU/+bt47j+O8Lulc90hkxPfi+Be
	feT8a3k2M2l0EU7XtAyrROXVC9UIQYUxujaafGtwxd/QFNAIacsF6nt1C/iv+UhkBMpypSxH4an
	OE8TswLd4
X-Received: by 2002:a05:6214:3d0f:b0:908:8f6e:52bd with SMTP id 6a1803df08f44-90c80e4906cmr270259616d6.23.1787572607150;
        Mon, 24 Aug 2026 04:56:47 -0700 (PDT)
X-Received: by 2002:a05:6214:3d0f:b0:908:8f6e:52bd with SMTP id 6a1803df08f44-90c80e4906cmr270259286d6.23.1787572606561;
        Mon, 24 Aug 2026 04:56:46 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:30 +0300
Subject: [PATCH v3 43/47] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-43-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQploYAcpfpzUvpEw88xdaf8FLJNQSzoWDuVL812NeE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD/DJJJ3dNTMNzUMpZHhmh/DiGqpKQ6eQNnC
 hgHH2it76aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww/wAKCRAbX0TJAJUV
 Vi1vD/4vrfheKoZtOk7PlyxpkpxAWb/6bbb+v7F0EIGBuHHko7aj/rJ+ajx5CQDGrn26c2laUkX
 O8lJhlp5qFvY9fVRbhNkF/JDdkYOuOl3pNuDim6RmII9C5g8r6lPwnSBC8l/VHBVwFl3rYR1hMV
 pnBEZ5E/qmP2wfKeBA2cY+PbZGAxEemaK77BtvVii/qP5wWcmMFnCb4vNp44G13KboUPyWaNYXO
 A8IWDi9EAhQFwqA7bWDUOJ5JpEgnq8tuoT32SEGMovxQIQa58Gk/imHfw//ajnkUs63RwTc6AjI
 8FGehrEnm0EcaepOjudf/y2baFIjAqUZEmf8ODCF9bXqrC7Mw/qkrfPgJRpxkuG1oTHBr6uokEr
 D37LbI2gpm3MyBm3oxExZUqTvuqlMVhFhvBUS25hor+ovPgUaeSlx0HmZM7P2cIOA62C7N2DliL
 6966sjKolxWdYuPvQ11bQyX2JYnImNXCS35qc7VKYrMq1uBOAgqV729qUy7JA0sTUA4Z2kf+/cp
 IS6oGdV8axQn05nyjjVMsNphJd81c1krtmYrLwVkijqRAiz9y3JttrfMC2wHd1+h+TRvAOaUIpw
 PR7Rz3gDegAcsDfQxgiwZaVUCTAUw15pBQhnHH6iPBk06JSXrMckD5MIeU1FrECR3ZwwcGUxahh
 Gb9JFaTLm9PHHCg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXzrPyZA6PaIlJ
 hPDs4lnuWN9yo4ag2j9aibZ0XT38kBM1PHHlM0gKq83Vao9rlV93kOvy5xzjL36Smw9Zu9aGQFV
 a3HwLr+sbTvclQT1G0RLiqLGnwWFymFRKuoX4KEZ3Y74LLhP3G4oMpigoOJcdJf6t+e5mg9Joc1
 JSH3IlpchgMii6dwCIHxx7o7qudSPZczMynGt6WGXEECNeMwrzbiVXbvgnVwE9BiolYCfEnchUx
 Y27081tMBRIj20krCCqacQrrgzKHxDBbL8rg1t48QEHG8HGydaAHLDDpFssD0bSEVHL0v43B6Ru
 QWKo0NKoJCHNGPFsYpr15ioix/hkqBVhtLgjVKSQQIDsnOb2EzRDCuX1Jis5Orpo4nOnzyJhhUe
 9nLChQqHEfFimsXbArJTxUTIIXRRclu22LmOVnZLxgYfnUYdfb27vQvJsUZGpgu7+yZCoCAgnME
 QIwpSmyyFMxCQxxYp4g==
X-Proofpoint-GUID: 7Kgg-jZKZ1k1G0onnzziNGXeIjWM9iMT
X-Proofpoint-ORIG-GUID: 7Kgg-jZKZ1k1G0onnzziNGXeIjWM9iMT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXymQv0PoF2n/m
 HC5qHK5zInzMumAenRfQ9OX8+pDh88JquRXJhax9IJkY92MR7xNRZHXjbHmbkSs5vvWZt6NSw1p
 m/PLzUEvYyYYTEbT0lBjJ4+h32+pGQw=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c317f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cMt5CT0DYXTQOAQHtqMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240100

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..176cced72245 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -942,6 +942,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

