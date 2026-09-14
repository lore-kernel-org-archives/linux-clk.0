Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C36E488217
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390185; cv=none; b=I5EwtfZoHecd7ZcBSE/GK84aE3eOruGRvyPPdDP6xcVneA+8wnocx/oc5I4D28CvlOw6Ud2D2LHZnObm6QrCUqsn9Ru2nPgmyiz0GuiXnMApBe5T5/8Ew5bmsUbhurUG3DEMhXROXuBrt+TbT4DUIShmczGAK7Tra/5xKNHm73Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390185; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hjBD78AVnzP6mUAwOPVtPTtMQNnICwRL/+v8/LidrsGzY8f89N4J2WWnup+VS7OzNwZ2sUt3Z3VgPuYe2M9sUDTlCtT6uUiCW/e9Z1koJLdU7Ga7Lo/7PuvzknHojVBno+9d7TqDYzfxTxCKhjj/NvYUSba2WAkfg+xOvfsOSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDaShxoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNrRTCDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDaShxoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNrRTCDu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmB4h3793437
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=lDaShxoEBJVT3/Z3
	Rqe6PiifZ5pkg24csy3U1Lc7JW2D8/P1Wztn+SffJif8FXTs6zFqiUSPM2CBby1w
	k+dKX9EPBB1H4UvKNPc7XCQ5clDp8FADbVxMbjrRn6gH8pulkhEUBcTkA7Kh3+zQ
	naIhxl5SRCq+doaaZk3swJKLBfCBd9QKD/gOmveRBnTLrdQ4dl7ZClzAVh68k59S
	61XEuylHUW6IwW5n+ig0C/+CIKxwW8q/gFEf+AdKNQsbwGjt7GJ5XqFkdwz+P9TT
	A44cWJPcTSpN/q6NXJ72a2mhywXCwHD/oECN1WPU+7p/ximpWHoCMuDgtm7hq5K1
	Sr8LjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg1606-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939062ecda9so499672585a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390181; x=1789994981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=GNrRTCDu8OanY5/HX2c3UWdmCrgol95JsbBzMQElCEeZeUVUuxDEkSACtcIjXdeTdD
         KDj6EE9LN37Kwq0qXety0m2eWQPs3tSwSsM2dRNFKXSktmw1BQbDSZcVBLQY8PY5C3H2
         G7eBHei4JZ9k7RIRtUmYGQkytkYmhoYAckCKGDCFSdaPHbsaqleJxJ79lNZ6ESkeL9wd
         LmyKy6dlbpXjz5DaTAcNtnWBZWUZKfVYn84Krdy2A0JYDt+6Tt62ztjDUqL6+w9jNr+E
         zPcQtYsyyNTRVVjWtM6Ep760Wx9pFPsXFb3OdgSZecegh8JARdsCyg+vx7NP0pdQOLaN
         SUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390181; x=1789994981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=o8i9bkUoRJOMFOtnC+2RDxHCgKnI2VSQbaoSQjdouShYtIAKs6+BZzmVjDsPdS7hb4
         xCQ7jLwNDJaE2IOJGIHd6hFydVNd0NyfF6lpfxwk4NOja86PBxya+ARfhoVK2TsRmGEB
         SKIGBhYP2V/bphjd/eLo4IObdpd9Xdc+hhVqEM5DCYcfuWh08BwJ9B9pn1DKgA/iOOgr
         YWHvg6xUXiXBMJfmBYPflkNkVECcRvQsAGLKCtjt5SEoSEJaVXXuIDlXLg8A4jhJlUHU
         tORI4oD2As/jCXh8s9ez9NsB2os2ORHKhiMQbTCAtt5Hr7OSu42i1Rbs3Q26zatbGkLa
         QsIw==
X-Forwarded-Encrypted: i=1; AKwUvBy0h69HLSXhSN22mMf2Uvm/8ckvqRhXAtiF15EH2F4wq8B1BoEaHvjcV2bStfvBJbsPmVLOURaznG0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHUBpMSMrLugQ3QO8xvj0qExsvbjrAbL0sIjRBJsK9Z/+6BDW9
	2nRCs5c/Buxpa/KDJCIwjbSTZaTnniBWECvdX63DFtArt2JQzfzdBDlVCXElLEXPvkFBdtaeGG9
	sdP7otn8eESEfjm29ODc/m7aHdkne6B3Ov4KyFz3pgXrx/bW5Gqcbts1j6HMJdJk=
X-Gm-Gg: AYBFou0WXZt1mraypDte8cXiFaphsQasBTm/qaBICVlVKnyqEBWnPsZJ+S3lt51uvA0
	mni8YzBtNQciUekqbs/O/tIHSvfOgSQ0vDGk84SxvDAwWSajj5gUMKND10dFwiWVOouabn2wTwW
	5WXHlDHce6YLZdnRZ5SBCAG2I7norxJEGi2n0r78dp9zdAI9ypC9H9sj6vFXxMOyY8d4YmA8ygq
	9mZKGqOZdMy4VmMfXW31OGOrR0oTr4noLiCk022/ZYeYawWTVJmjXUG9VJgKr/4W/ZZG0gBGKp4
	9znhaLAffXU0Wr3TN+HsRon4VoI5T1AGs/fNYKO9r5WXizeZ8OmqoHwHR1CdK80pbpzJ5VsOJ4y
	aAYnn2bFL
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr366174285a.18.1789390181080;
        Mon, 14 Sep 2026 05:49:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr366167685a.18.1789390180464;
        Mon, 14 Sep 2026 05:49:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:36 +0300
Subject: [PATCH v4 37/52] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-37-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zv4/eFW1FaopVgDUJQnp0OgwORb0ycN42cz
 S5mNGPoVSmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs7wAKCRAbX0TJAJUV
 VjU3EACmDWvnk10Eo+H+mpt/O611ky3FFY1ZKuY6ck/5cx1nrH38gXUNnMUw6WBaUHbFUzv0kwx
 eM3wMGx8JdsqA2DI56akEs1qFPnmNtLawv4RvM0qNS5SD3iXJqGqLviUZvXZxxTY5ks8grKePHz
 H/bWp9TU9HM3lRy/mEBDovspamc4Fa780JH46WcgFRogAA1BZmoKrm4wfyb2DRgEDUWTFp4d61E
 Fe4nBEJr8qPfXf5kv1/ZtmDPYos9N537YjwXa+AnvPQ+WfKzlwh8AhC9PParyJGKa70jeo6q+1u
 UAmjWRyVzj99iTnD82fIwDsiwo20j3qZobBXir1Oq0xQ0MoNpmUc/IsB4n/NqRbzGdYtiUIpaTz
 e4MYO92TGRZwWmEgCxOGPRle+5iJK2q1ZTT+VOnxDMp0Ll1iwm8OncwVbF8F1u1bBBq0t3npEZi
 yIKoW2uxTqT3oVDgPtnwYn1L2w01LagqCQAfpKz5Ul+Bz6OL2Locf3DtNPSujqRhPMwbnXdX+YX
 Bdp15hyolgBI0RZ4PC7/Rp4y1X7LP9yvW2QHeJLYuMql5ZsGLAvZPMvu+34hxn49matq5Bwp9Ag
 IuiiqCfVWI61867WzmUdDKRp7hGeg8bhz7rmgHb0BL8LbOji8iPBwLLYJQj1dxarKYn//n22Ck0
 yImIZ5fLfFxUlUg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed66 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: D95E_S_lH4Wkg9QJzDOYcSdYXHMSQbg-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXzbsx7v+bsRak
 2B2mxSO+E3L5LFYXHVW6VY3CmBO0YeyYt8+q31Lh7N8Z2DMVeaLBnNZoILndXjMuwH7JYZJTeQg
 qbVLpb0InOChrczKUCKfg97zdA9dDYs=
X-Proofpoint-GUID: D95E_S_lH4Wkg9QJzDOYcSdYXHMSQbg-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXxdSPlul7OmEo
 cIwxCPGI1OkIX8lfYoYrepxZfO7QqqBzqEykBgZpPDPvQg5R8Ou8zavf++9dmg030mPW+RJZUUi
 /tKTIcsGYVPUGAp/BK9pmV2yeD8UfTJSnLOaeXBuYivUflIb0CG1g1gzt0TP0RkEdIKL3aqqZTK
 LywXrFFtShNK4YU/iaJhHiTCMhlWbwf6FFSIzarbwvFK9ow6KDVVP5z4CwELlIUYM5YKHEwoK0q
 iG3wSl0plpgOSeUwGkKq7h3OGaCXGCZBfvSjTaZjZn6Ay0at2aWhm+HIxSrifX8IxSQAmstDefP
 NJRt6w0tUApybLaJs2vdiUYeMT56X8jhMa5DIrtKGcGjBnVqesEoTZyC3540ku/VALQkjG7Kd8b
 VVj232x6ofZ0wyoWFMpL1F5+nTCAMJ//lzohAerDvlJbyjjng9d9fQapTt7B7US5BCa5eSVCfMD
 8dqPlhoISyIJbl3FljA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

