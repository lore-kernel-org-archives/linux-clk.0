Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD044963A4
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390218; cv=none; b=YPvJY0wU6YL1oMgMFVV12DX61BHjBjpXhFzL+TRZG2z5NgRDFb9JKwmp1r9bvFX4XDzWyuK0jUERFYQ0cG8LAbNewUEjxnVePWr8DMPHhyZB/qH7oFu+zOA2N0VfC2aHKviDcrv+t3XFzYdPaASrFmuPW5abDUFvxf6Z++2DqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390218; c=relaxed/simple;
	bh=gTast3d4XqcPgNd8hTEWoP39BKm5rck5V3njvbIRnKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdhTCeAILb7yoFxe/KhSE+fouI+5z/daBopWy7kykYrsPY+J+7AiuCbfuD2oA4wlxMfxJtKfk/7nOmxSuYabtpOYaL202L8ZcuZ69E/buhhuP8feqIjOAulFcuXLC7oIZn4cJSrrMJJ6QYg3AMeE6Gvd1e6rcQT+7l7Q69oetTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZtnit52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eojoSJxY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZtnit52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eojoSJxY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxSs1460625
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=; b=HZtnit52VRo7SWbZ
	rpmusuJKTVcI+CaThtCMYeUGPNcsEtLK6VK5Yy4d9WxfhhfC6oPGeZ/bLNuxgwCU
	qfjI4mNY/kmlnwgiVTJiTLBzQjoAkJtLF7BVsTwhWI016480JyoMdm0tD3IwNT2G
	QMZR9lekBmzo/AZ3htWmXlyo7Zq2xETzTzcSZmv02QyZsSLT6U6evmyUIQ+9jOqL
	LBVB5MVUHT7gnsiQXbVyPrigY395BzuH10WH4VBLcPVyeINesgRR7b3ia1nMfhoR
	hB5U8BSItE0pMDPDfP0thmtwFt48N1JhueTVXqU15zT2R8KKJZ+DgKX8jpykIhoO
	hNw+AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1b824e84so229060485a.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390213; x=1789995013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=;
        b=eojoSJxYXVLyqai7CyKpqvUmdL/yojTCjIcj2y9i8tgJRACjSoW4Py5Ii15dI6cmde
         7n9BGQtEICEcoOsSPCdj2FXuIoF68ibkBHsjqyP5Uxch/Xn7n1tfsNnSJzjJY4gLOH12
         YK4xsMurK1i1shi2kIauEgYK6MjawyA+XVETQxZb0nY+Ke7l5F+IUhGaczNWIzE6ZiAS
         JDW27argZMnaDpiPMEnLc45d6+IVNz2BVmHAQ7/gcG6zYOrd32Msw51vGbv93DE6MYyc
         QrD1tExLlHlmkQwTWwVhMrjZPL9tSfqlHtBINFHBOExWIxhT/+Pr8lQ1jRTwM4x5OZtJ
         VTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390213; x=1789995013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=;
        b=J6mXAZK3gsJstoqcgOv2EmBi1tFXfGKubcJm0Gm/9jJ8YtVgb74718zGvIU87qlM01
         ExRiIJoKZX02YOpehzkfZT8mq0jxtCsMN5zsTlE9kdkFEpmhy5wo0CP36l3sGuQ2eFa/
         Nw2nryJK/i0Mnp94Z+KFmmMvvY4IkFlzkDUQjBiuoZKfL4u+d3S8WAYxUmn1wjcXKO3c
         wM3JY6GNDIo6ViTPU2759zmNjLNSdm2x9b9QRiMsBruRNjRiHXdvrX/C4nL4DgisiR+B
         jtSlJoohGBhxOtXAyMq9zgtSFY8rHTsTfuaWmAjVmG0SfmVZOgguhnjYhy6s6Gk5Xt+Z
         g8Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzzX0AlUbk5If9SM0DPmmCUHmMo7AAyrHMmgMO5roU2BR9Im3fmWuGzy5Rs7hySPVOB36P1Arw1YQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++mVDzrG955CzhgPY2/w7l8t+0+J9rVpIFdGQ/IIG1DxgtJEflyo
	/EMun4NJM9KSZsxl+BEm6C80f0AvKS8LmORGXBipDN50Xsr0t89fedPUv+HUD2F5ZxSXmA3h9s2
	Da5ylgXzolRatz7UIYIbAuDsaF4Sv/08WjQPdKrfJbNDyR70QWAatknS/rLslYiQ=
X-Gm-Gg: AYBFou2z6V2iRdz41m28aczVDLsx0n3Ilq7WEzSrxHKQT8NJDw1bgfLDk5C2j4uGtKd
	nqZCvVZz/tZUk3hFIGlOtq9BMzYT63yuK2/gbEGeWkxVKnOQe2t5qyKp6XKKBQF3HR4EkkMz8Zs
	eozvVq4qhsrnN+mP56VujNdKzA1j+0mFFf/N2Ztc0wBx9o3gp5GYZCDUXuurDeWfIG6Zi8ufCW4
	qJsQYL9+iFpLvLpRczfN2qtH00w+AVYVI0TRZ6iByxnh2bMjuXXo+PPmMS/WgsOpJU/Asm+56HE
	RsA2rl/sLLW6txVP3Dkh4phOVsnRQCZrDKqtaas+WlFt51RQceQ7WekSxQBTNo9C9YjU+EYq5f7
	vcX7h51FB
X-Received: by 2002:a05:620a:890e:b0:939:710:536c with SMTP id af79cd13be357-93a29a11d43mr287275585a.43.1789390212769;
        Mon, 14 Sep 2026 05:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:939:710:536c with SMTP id af79cd13be357-93a29a11d43mr287269985a.43.1789390212192;
        Mon, 14 Sep 2026 05:50:12 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:48 +0300
Subject: [PATCH v4 49/52] arm64: dts: qcom: sm8550: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-49-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gTast3d4XqcPgNd8hTEWoP39BKm5rck5V3njvbIRnKE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z7OYuvF3UplZlyv1JMssE6t1xtbRosYS1px
 uCEVaMj4HSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs+wAKCRAbX0TJAJUV
 VpDSD/4l3wayyj1pgM47gTnFsSQYD3MQqHgoy8gRSXtvnevM7zqzxz2Wbl4bIgQ/Te6uzRUVQYt
 akq0nh2+VGfaFWVvWc3/x8mEpOVEv3oaegIsmmpQBJs43pcEaZTqW7qX1TYHh1Z5BWLiz2eaxdV
 IVYwsO9uT5UvSIeCK2Jj6kbMcryMmrSpYe8t0rOLuzFTwEic3Xc3cmVLsMj6S1K2ZcllpkdAy5C
 e/Cd72w1K49/MhJdZCbuq4gwNFSdhWzWQQEaFL+rCT9DKJknTS6Pl7XzL9YscLNoEKf8DyUEU4p
 w2gjYDnT3TNGU+P45KN1Av5Tcf9UQ9R9EbzMLUoLVCulc8R+/D45iWTEqzHFwGoF34iMD7fo/iN
 E9cdrmEvu/S4RAzdTQ3gPq4LXirqxmz2RbOMNyHnHD3FSvCCCYajUVdDaUFNgdojnB+5KjJQUS/
 J2oWbvsRS2xzAhqU23d7PWCuJSr7zU6pNaQXGbX0XYAoUMJEQ5ZE5IpXfKYxvxbmV8rbS/AWpXx
 XjRiMraOH1pP+yPSOCO/+FS/Bt6ZC5+W9EbxQBpOSAqQqFZIXhWUUK79izx5tffCmUA7irLqsVh
 93gixJABw2LxbY2W8yShi6cqVb2wveSuxEoeYS+b/sj2rFZ1d6euVDZgVVks7f45C5xdgJtrPIg
 sRPYeYriXD0JbhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX4wEnSWYIQ4Eb
 5btym46BZDrkO9LVHmxZ6BxyynaRJww6qT3PfLeDhBTJbwmcYDyqLxSt5vdVEdBho7rkFXnNFzY
 lF2df4JwaDhNcoBGAugLmdWjnxufvJZmzsiIG3D/7sB3HgbV6WaHakkBw+L1J6WVlunrdUQwg6X
 d9ZwHY9TdBrvKwRVi3zCnqGiCkyDo9BW59VWBi+kaDYlCuSDmhkIpCkOmUrpS3qZEBumtZtTdP+
 dv4bdltaiVwBcUo4eMSQaxWdX6GSCosuuA8Y53fjTt1w8gc4N61CKKfNU4/D9JVO9DeWUyOamxR
 abkPwctX54eQ4qT8J10bu8Fp2SFQiebGKF0B+N2f1MPWxCJdK+Zi+IPX3X/+kO+cXe7sDi+MTbv
 VH9ekzAbq3lCkw6vqSHYGckfurMNwgAVkYimnZ3rZM0saaTGK4voMOc6OYbDwMeGCDvMKk8EY6Y
 OX1PF2TFeRE9iiWmf0A==
X-Proofpoint-GUID: _RhL1AmHPYwFp7uXN1E19cdElsLIUdwF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX7zTXT+V23np0
 DrBF5dei25JNXtEj0AqMGhBz6VH4p/kaQ9cCZ0bJFtkEj7oQjMZo6R4CUan+yFYBfvEM4UBybaW
 fpzhi8jYaSFdi8IJqKDs9YAFboo7amA=
X-Proofpoint-ORIG-GUID: _RhL1AmHPYwFp7uXN1E19cdElsLIUdwF
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed86 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8550 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 23604436add3..9e60836f4064 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1194,6 +1194,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

