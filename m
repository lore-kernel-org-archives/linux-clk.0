Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAC0366541
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017270; cv=none; b=C7pIcA8ywaH36cX6KdSEwZi4QOhvtBV+N1p65Zb+9rMkqwGC2Vu884iMkxEVMyqtL+6Mg3lZcu/LfxdnG+JpIsKzlw5CuRddy6I8dHpHNMMDsE0YnI/xO8SUGLMpQMG25310RiD0uf/0YUrIXwDEQ2wvdfZLt8lQ+n5Utqnx0us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017270; c=relaxed/simple;
	bh=60ZYJrtJj+i+7nZ2grqsPKWvNd/3VlwVGCXmxTPy7bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpJRDqgh43GgxhY++64tSVQmfZFFcKauGCOqKOAKBSRUfhWc6E55KcV00bYnZSGE8b76deDjfcd7wSqh8+0xoaqdTLBxjLxivZMeYlcKSX2Cman1mQhAwdlNWH1rTCjlU7OujYJx4zMUkd1KGeBwoTmpgo6FA9z0PrgHO45Q9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO40I1s5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkklKm6c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO40I1s5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkklKm6c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3lrE517608
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=; b=KO40I1s5ABeIu2TX
	BKkCmdE1V41QlmPn0bPxTDgveKu4F4Eog1x2bVr9mUagz10PiYNsArWBjyU7zoOf
	S7UmtdQQzhLGQkHgk38ARhvSe10TSVL6vAnGUr/cErMxCz0H19Al/z81JIef7Fly
	xDs0y0wy380mnGsjVE+I/0dwX2NMQpIWR2Uth5zf9P75fYxZPHyivD4LKVXjSE+C
	Z3TVy3rRSOFDx3aLEJLEKZzyjd0jxUutEvuijVlal2HEL2+p5qDlLepXw6/ENabx
	ZwELp5CENuyOdLONYDXGB0/lB9LJRT2IAhblJ6N2x7qrUF0E3R3WBTPJ1WRN5iHn
	mMYwzA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npra8mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:34:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84696ed3b24so2959749b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017267; x=1783622067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=;
        b=EkklKm6cLhUNNpvOPQ9Qrgf212lmi5aTIWHgBv7beqEH1DOft7PlTGpaGSi3HjCQmP
         VJ51501EZH9PkJeiGdgqnFsjGEeNL3p0/BGhQqt79JXduggpcUqfcilgB+Bbg2Pi10iD
         aL9LWINpbZxZtPglocy1gboITGNKiuwW7sRm2mqZj0K0nsHa97Gym5aASnNe+MPTOCJm
         tI4ZupZ918alogqQ0VY9WIoUSCMDvqPtauVhG+t1agzYpEfrMfHHj1/Ue+G9m8f3lsms
         YmiKhWUCVharTIxPKbJfjIPQxmm1PS/76yW7lb0de+Oam6uhyVLqIDCZOlbiYwxlOFDZ
         oGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017267; x=1783622067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=;
        b=Vg9vjKQZNGrA3uF/jpqaY5XXL31ugJaJBfaXgFxKasCr+9enVfBSkMtCyrHmadl19b
         8EPPdhjNYe32fJJjAO26Mau/VtZ5s0Pqr0Z9SCbRz2LkJiPNc/ZXPGCn4QYJ+aRAdXoN
         QwjNXCMBvq5O/mDn7hQ6k6VcoVRYzHr77sxNwTxHUFT8s/HWC5s122512sHKEYikt12A
         OIBAQHGk/2QXgjDbeY1bxpJJWN9aIdOVLSx7il0FpilZNkEl5CI6Dcbslr5KqCNrrpIQ
         8Fzg2uKLDf9ssJRanMWK9LGbQQYbPYYraxBkFKS/jEHNhkpEQLYgOqPjEjCsUkS3MxPE
         ry9g==
X-Forwarded-Encrypted: i=1; AFNElJ+m/vWIbbskQ0lgI/uW+iRxLRYHhDjT73Z6OLgPWygn391E9BjGqazRClhGBv52bCr0CpYBCGpFj8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyalkmgwbNtkLC4SIP6sR9PTU+f2IfjXN5Wp7B2WIyk2L3ydzvR
	LnNaDZMPjsWHvfnDyVfkFuGGBg2Y2ry7EIjZMJjidQ06UAmVzkHhDhyyOZgcOAZpDwpx1kY5GJ2
	Wlw7LbPEi/Beo0QSwk040ZhWc2RS0zkrCxYBOU3egTX2oIe4NR+xYIqbGv8ytjww=
X-Gm-Gg: AfdE7ckORDpSZ9tSP0xbcu7AiYlrKPgGzgBSGMULcIGTewy+MailULZF2jzNKV1yqo2
	ztsx/U3mLQwAZphg3jSTd7ROdcGfVcG3tt5euuLoYx5YmmowiVE+OumTHfL55KfzYD2AkWTXXon
	GCQAg6Na/kaoR9PPENC58QSlzlVnyLtfN9bMUcXmwvs46OqCVM9HPQbH5jwbumt6ejfMWrhHAJ+
	OcmvB33svdZWP+eCoFsHh70eEqwU/KHT239EK3nSEv3u1khTfF3vJQXvkAquyAOD0QBWrwa1saR
	+ZPJOXqCkDW9ctReYmaZK2XvZFwa5pv5c19KpfHKEdksZ2HUmjks1kkFb4/Po724hzMH3vgPnUW
	thZhZQaox5DAZP2CSomzC7YtP6kh5emTlz5+S9NoZ2g==
X-Received: by 2002:a05:6a21:710b:b0:3bf:9795:ac0a with SMTP id adf61e73a8af0-3bfed1c322emr8539372637.4.1783017267121;
        Thu, 02 Jul 2026 11:34:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:710b:b0:3bf:9795:ac0a with SMTP id adf61e73a8af0-3bfed1c322emr8539325637.4.1783017266656;
        Thu, 02 Jul 2026 11:34:26 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:38 +0530
Subject: [PATCH v5 16/19] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-16-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: guBgW9i1PLmIS0pxk8tpSU1e7tDUZtme
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX6GUrg9rsmRGb
 Nj4KmhW/eTm03/AlpoBDPTqXndYfR7PueNCTh4pnPdgzy4AbxO62EM6E3NRIa1Yn/4u6TBV0+fo
 6mEES8G2dZMY2VgicEeu1Rf19xzWr9M=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46af33 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YtofigLH9XhHtagRA10A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: guBgW9i1PLmIS0pxk8tpSU1e7tDUZtme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX/SpMs0N07QKJ
 wcxT1mJVCD+MuGdwHJENvJfSzYekpT0UeinsfDePMZEmNjZnCL24ADtKQ1k7MCk7fqQcTECwyIP
 fIh2FJ1Q4p43kYILIjF1HT15mWqNdil9GCpQWXaAGL8QlWq4KVZ90/zj3QLsV63aieFZpiBhnMR
 gduUijoknd3vwm7LvpBTSBPOSEUDc4evFfQgbDK7mAf/atkT1HpRmt+EThgvEIxBJ/nWWvvgPG/
 xrjR/IMVR4YGdTIbhqUdvzyJ5cODLRrS2191VPY6Qck/QJMLNDTnjx7tjxLXIEByocitGMHP2Ze
 eM9HV+LcR373rV3ocXr1q6fuDoMx/WQ7QtmIzHIs7O2k9zL4htsEUYFZwLqDWUAfX55TVv7CEjH
 HAu9uf8TBx6dfLFWHmYWBSd0d59+kkMdz8/CpD8m/xRVV5btsgc/SRgTFMR4bju1ejbGY7Q2ZCd
 NTRW4ihmmj/db7IF4ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence add support for Shikra
GPUCC by extending the QCM2290 GPUCC driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index fc33d82bcfb6843307d002d67674253f0174cb4a..ece567c533e88527451eecfbcd52a52bd05a8ad3 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -133,6 +133,17 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
@@ -371,12 +382,16 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
+
 	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 

-- 
2.34.1

