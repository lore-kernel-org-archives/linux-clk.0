Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F342B4AE123
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266343; cv=none; b=mO01ab9+qFSKIBl5y9HAlNqkQVlWBVZkBj9JU5iSUnt2cVDALnxRPnDZ1aiQMzbgZCyIaGRfwn21GLKhOr9K3D/YCVF2tPv/veI2onrdR0aMu8x9yVLUO+4JY98fVKbqhw7kN7IVMBVSbipwHAF7g6gw7A+5N9bRmqg4WYy8vDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266343; c=relaxed/simple;
	bh=4fWCkbCSJEJP19PcRqOGcL2gV4GFzJedW5FbddvEScw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CY+o7KLxAWGGvVsyImRjh4sbbyfSVwRHiHDE3A0uCQGm+QFb6ycPtBMY3kqPTp4kI062eO6TTVoYA1+ym9q7tavYnQfyQ9bAFFt+oatPD/dXJu4EgbGQBIuSdRXd+dtcciKYplZx/gE1Vta4tvSzjrgpZYNZjhz9OkD+WUZZDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pr6NpkbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWBISX5h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pr6NpkbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWBISX5h"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfajQ2757909
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=503Bl05xGtP
	s4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=; b=pr6NpkbGmBVFoNlV+8+97iKKvmj
	pAs/95qoTpA3jYGrk83to5hR0iz27BQLmZbUG0VZ3SSQ7bFSFB+kSGzeA2QpvqHT
	4yCNd86LY25rARQQB3i5pVU6I8yokcU3qVhxsdXniufoYxTeb6CYfuZ5ic9yOeP+
	Eor+uBE4p+zZFLXRroisVCVcjY8hrv27lxjJFuChMIsXscrx3zjNQDldcpjFsEog
	82i1P5Sj0GhNQgM0rCuDc4lqUouw2LSshxOBPdK3LiS6PtgXT9GPoHHf+MRPObcp
	ZwT/q2+X6GdrT8xBF6R09/EoNK7I7smWl+L1OCD0FGP1+8bsnATsk8/wkWQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ajmd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:21 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66f8ab159abso64426d50.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266340; x=1790871140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=503Bl05xGtPs4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=;
        b=TWBISX5hQpiojJW8zj2RbMICQ+ENZcr2JQobGO5J7HISeSOZZmHNo+54Eca24E7cp5
         I9KU18u2WEG+UzIcLyse+BJX2s188hpWp2hEpMIzyJBlLRxsV2MdrOhmUUvpLD0aajiJ
         zftlrAjR/HxiRI/pvx/uWcPO3Z636t3VS8EGeoPzAxyh7hVBx0pOXvCAwHnnsU5EeFFy
         Ya+OvO+spZ0iOIPFDmrikiLsZVh0ZUnHrCeKp5pcpDfbZMMpY3qqkJW+U6uZ9vb0aoXt
         ntmOjtey9GMQ20y5Vc9PzlZiB/pyRnn66xFkjix9lSh73xBjmgWzsTnXVER92q49diim
         Rj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266340; x=1790871140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=503Bl05xGtPs4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=;
        b=exTDYplVIkwHc9FaYoS1dPlqGIK/SOD31KN2P6co21Nqkx9TPZolLdZWgBU3ev0yVK
         DZ8rDuS10Lp7hWb7gnHzPTVFONmBCYglQN1JSahuTmC3DNllSIMXTe6bjCO/DSMYJZ7y
         +Xm/hOu2Z0mOeKw/PJQN09YmbmdukuLG87vYH6nIXfCoXIOtjPu+G8CV0cNfsrql3H+u
         typm6OYzMi7Lgrj38kjZsdyKcZcqpyhBtWgbdWeTNamDz1pFl6vM03cVom5QY1WeK/TR
         bXlRqxk+snxekAaKDW6eJe6aC1PKPAnaO1Aph9fJuH5ZvG2M9JigKR/K4B6ZTAV6v2JG
         PCCA==
X-Forwarded-Encrypted: i=1; AKwUvBxCebJyXu8/DfTswOp3IgfgIDm6d2QEBDVedEn5/KMzDK3XHPJOeHvRyTO51GT/2Qk0d3in15rr7z0=@vger.kernel.org
X-Gm-Message-State: AFuF++lqqkNI9B4nE30u6tlrc6XxAc5eqaOS7q4bLJjBjtjuDKW/VWZE
	CQrdwZf6PMS4fUpVMnjZ2gW+5C0SvqQkpPh2fzZa9IVKR3pDlOZbUTFEwqL1Bih9CtTzvik726U
	R0HNteLql63dA1KnKdIMYXN1HKsce45kCP8FiEJV7Q7xobhtViHSEa4Lype6VPu4=
X-Gm-Gg: AYBFou0eZBgGHuK3KF/oJHj3QfPrm+nNhekkLEhK1sj3NC4jDTZD0+SaCMHtsexj++b
	W6lwmbwvZbqnS9Ywj1dlKVbVRSrKkr827LSoU7jxLKSrj8Bh+LcFHUfAxPqQDiqkBsXEIS4u4IY
	8+u5hi3NVKqJ+kQ2mDzZoWZlCSNWNfGkmfkeU+5Zy+oUn42vHsm43ecGdXNTI8gZKONgcOPn4uP
	aMC1LfA5Zq3Q/b77kmuRrfCXQ3AEd0heP2PGatUB+KnsE3LcMa/CSbXU2QpVnBww7STm8lI/e0Z
	VsPmyoljPDiFF3lLnrOursH/OQJjxYexPyVrCpQfQauXFhgZbXlt9sGMdMF0BmwVaMhpVtrpzau
	412A339Gcn2JrXb1W7j2E8xy+p9NeHLP4Ffxjjkxr1oU94/X1GH6CFPkqzno=
X-Received: by 2002:a05:690e:4184:b0:672:a0d3:a73b with SMTP id 956f58d0204a3-672ed4c3137mr1155123d50.96.1790266340091;
        Thu, 24 Sep 2026 09:12:20 -0700 (PDT)
X-Received: by 2002:a05:690e:4184:b0:672:a0d3:a73b with SMTP id 956f58d0204a3-672ed4c3137mr1155094d50.96.1790266339607;
        Thu, 24 Sep 2026 09:12:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Fri, 25 Sep 2026 00:11:51 +0800
Message-ID: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX/P+7BAAdKUU8
 A5xFbxDq1ZQ6Fm4X8FB9FS/DF+Cljpwl6ujplvIyhjHFw7IFy3u3OEvt6xB75hFTXnlGvdbcGs8
 +7Lv8SrVIpb58+nxUQWpcGJxuYloa84=
X-Proofpoint-ORIG-GUID: ST-LosQnvtCRUPO9kcX9eMHIpw5Ej4sX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfXwb6/EkOdRh5E
 SXwzdvB5e1TSIgADA4hxesa2mOnCUU0ITXhrPby/vPH9lsFbtiPPRwTFHFIHN1MtE1zAHjaJMyF
 qXBCWz0cvtVtPpxpcpVvryHCZ9qyBiR0QkJ1Xd6Mbi9Lw5DUYKWFYPfFJzP6/7U4+t2ltuz3nd/
 VU11SQIfKaIXDbyg4ue5DP9natAq4rxZe5/HbSZAyDKKdX4YLcXtXuPFfpuqjP963gMEIlysmel
 MgNFLyTbFvhQNt+j9Fqb1gtXJhoLvDQyGMfCvM999xEHwoSua25wSvCmYE9r0XiOx6qIzMVjDIE
 yWWSRZCsD5RY+z+m447uQwCF74KjXkUJs6pXXez5Ov+PN3VUm6ZLg21FXhovOCezKWZU76tW0S5
 5jbysrpsS0rHvoEq2ZgCSrMsapssX7J2KLrc5ZaecgrAMV9bOV1jbihaguQBTlhYMm8wcZkIzQx
 Xk4eYb0Tcf1RFMG5qHA==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab54be5 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yg7C0sGLIsusXtrQKFIA:9 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: ST-LosQnvtCRUPO9kcX9eMHIpw5Ej4sX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

The videocc node supplies only the two XO inputs. videocc-glymur.c
expects a third input, DT_SLEEP_CLK, and uses it as the parent of
video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
up as an orphan clock: any clk_set_rate() on it fails, and it shows up
parentless in /sys/kernel/debug/clk/clk_summary.

Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
is listed in video_cc_glymur_critical_cbcrs and is therefore force
enabled through regmap, bypassing the clock framework; the sleep source
simply keeps whatever rate the bootloader left. The orphan still blocks
any future rate management of the video sleep path.

Pass the board sleep clock as the third input. The sibling evacc node
on the same SoC already does this.

Fixes: 675fec65df73 ("arm64: dts: qcom: Add support for MM clock controllers for Glymur")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..26c15092bcba 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5758,7 +5758,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

