Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01213859CC
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058117; cv=none; b=qbaNbbqcm7YqZCaGYaskjzG9l81X6SoaIDUi2XqDXMGqsjFv55u65zgfhFxxszleNavsIhrm5ondfiL4HSKj2yhxoEN9utqpgoqRxrO9kjcqY5Q/3WYsNpY+j0lg4m7vFfumpphH3Hn5TsWio3+CJ95AZN2N07aOzzaFp2IhQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058117; c=relaxed/simple;
	bh=HndyGbO4G4AyhRSQ+rbZaJ34mNMFFZlMULG3fBcwLRg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PF8Es3WsE4X94rv86VnrETxUS/ZmeVov/C1ruORpjJyzVkjpGJeKdgw/kxc9Dug6xxrGbbb27Uh6qqluo57lGWT+z1sXzESDtzgBeiiLxiVtspGUUJWVv9k1CXpDkAT69XwHbPBquoYurVgPfe1UX0kZcvkYXwChP8lk5J1jZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsZYIC9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo+Ci1n2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsZYIC9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo+Ci1n2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298A4Hp2661676
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 12:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UPLyyrH9HMagicMNtRYH4I
	sSsqG1zR19UQ8NZdoW7Z4=; b=NsZYIC9UHHtWnzFd45JV3mmtXAjjQrgwGX3Y3U
	urLW3DM1DVXtXI7OF2s3Kk7MXlJBd11TLFp5yj9biXctCekxGIImjAAaNhmoGrSc
	NtgKsVzFgsr+56N3H/cOTvwoFKLvV0MT/6IsRsxFMtvjsMi6E0kpWKYlCaFxyH1Y
	812S9yN4myu4chbdCTyPaX2ciH5TGa8cNsD2GoTM2H5FDBAL8Vi1fhegL8jJv3Rc
	eWPO2rAec8NDmBiTPzL8bHfx0wR6AI56MRVY30hoAEjb5dUmyyEtrd1v7sxVImJG
	QIfEiue32leqwHUdOXgceWrE7tVevqE7TROzZ22xIG0V5Rfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpnkp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 12:08:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd85e08fddso977223085a.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 05:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058115; x=1773662915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPLyyrH9HMagicMNtRYH4IsSsqG1zR19UQ8NZdoW7Z4=;
        b=Fo+Ci1n2Xx9Mhie8tn0zPQ4ZUE6dSaA4SaDObJIBB9SU0rEymbA/BM+Au0d6jKyEPP
         QOtqaXincrkeQgjYic/HDMFPZS3p2q2TUlwn3OL+RUGPHlJPF7RLgwEFpRUWm6fditIo
         poPdp5C0/ziL94fnyFAp2vHOry6lFZX4LACSxwUE0jXhBnEz0pqXBjICHnx7/7o5L6/B
         /K9PFDj3ooCpfElfYtX++QVcXmSVk12qYluIZDwqY4yecNQEoznYL4fz/jFPJGAa05km
         35JUHtBXdCcl9FjQs31Vis5ZAOESFJl5djonY+7XG2j8haVFlMoT5sLAabOCu6DfrxS1
         yrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058115; x=1773662915;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPLyyrH9HMagicMNtRYH4IsSsqG1zR19UQ8NZdoW7Z4=;
        b=PdZpxIixyXGpdJUrghXRtAt78Pxu8gXuNTNJfwsEF0KwTiQDEg/wV9EuVpbyX6kTk8
         9NWLdTHUVgltx+cJjGBtem6B0hRGPELiBcbIaUjDaXojGvJ9td9efIr2rMwFIbKjmnCt
         HNM3BKvD9QwtD5VV4aHaccKSVXeOq4zPqOr/vuYZIDL48yy/LbYKOw6vuIKpyJzYk0Y4
         SDTjfsBBMxKa9/OT4iDtyyewiQh7z7eNYb65AEXOwAX5pWMirYPH4j9RiLYwkug0XDgJ
         9UJPx4PJc17TlK9s1dqKJJ5E7eSyDxf3rj78pjZ1OUB3FDwSp+EwNUpM/fHewDR2usPE
         +SiA==
X-Forwarded-Encrypted: i=1; AJvYcCUULiE7rbysPO1y7AaVYfSkANxtbnoiK8adx7EuiO4z8j024wZN8bTQ0Dx5hchQVgnNw4hC2g4tXC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCBaj5hn+Ib84OWlnVRJEZmzdxtRGIHaprxiriwXKRNN4pBPrp
	wUr/yQP9rYycPtabOzTa2np5OMWvCqJwzR9s90y3ssoQT6mlvb0ZUtIZD7koWshmcQxDrpLBl9L
	3tHz6NZ2iCUCFZz6F1T4EnRMXhq66iuK3USnlFJMqPEElF1PCPQr1y0ekO1bZeloslwSUKTs=
X-Gm-Gg: ATEYQzyiZCwS/kF/6IEOZgaXzThfCYGdIv8kRUQVc7kz8JZn0ZCF9Co6sVHSkC/F7nx
	J0q/kzNf/z2UVZT5XuCiib7uSwyVnUMIwjwwrScZhe5JWgP7pPFJZnXC88uVgd8gHyxsV8S6Q9t
	wpddKd6ss89Fktq4tl7KNq0SwYhhfY5c/1f880za3uNLueNc3wlKaNghe1qkOOk8gKKEocJQL4F
	Ye8PJyshk5LVqe8SUJuOqChPzcyVosncu1UXxoFn95bdo7MXsspCc69eiJslYtGp07fqAIYeM6e
	/UrafuuFzfxtZ00mLNUREw9ybAMf2i8pQ3Lk+ImdLIMJBEXjPeU8thE852U40NbEjR24P/TXuJ8
	USyDnBR/RRlU7hbuny2+12SiaUmy51Q==
X-Received: by 2002:a05:620a:2946:b0:8c6:afa6:2700 with SMTP id af79cd13be357-8cd6d4b4e5fmr1358609185a.47.1773058114722;
        Mon, 09 Mar 2026 05:08:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2946:b0:8c6:afa6:2700 with SMTP id af79cd13be357-8cd6d4b4e5fmr1358600485a.47.1773058114055;
        Mon, 09 Mar 2026 05:08:34 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853916624dsm107826075e9.6.2026.03.09.05.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:08:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Date: Mon, 09 Mar 2026 14:08:15 +0200
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC+4rmkC/42NQQ6CMBREr2K69pO2CKIr72FYlE9baoBqPxAI4
 e4WvICbSV7yZmZlpIPTxO6nlQU9OXK+jyDPJ4aN6q0GV0dmksucp/wGtl26MYBxM1hEwBkIVet
 6C4pXacaxzq4XwWL/HXS0ju1n+WMaq5fGYR/cjcbR4MNynE9i9/75mQRwMHkhsZBGiNw8PFHyG
 VWLvuuSGKzctu0LkW/6Q9sAAAA=
X-Change-ID: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=HndyGbO4G4AyhRSQ+rbZaJ34mNMFFZlMULG3fBcwLRg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprrg5KPIb65oNreK8B3nmFM6XLVJndOaygXtHu
 oRn+XzRj9uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa64OQAKCRAbX0TJAJUV
 VhaHD/9G3LrdNTrivxgIXrnWkNkJxQq+4nsjAESeWwD8mA6UhD2wwYVKrtvPs9YGbniL28du23O
 uU/SLpkfhlGO6uBYm8EsSaQKW3GK1tEcOwMlmi/f6sScob3aoPZ1xSDq20ZWfLKUHu0Nlmq8Z/3
 zcJ+WLVgBj6mkPw2z2BqCkHLHFOSPDUkwhMIYibKjU9yQmPOG2EEEvHZaHXwg6T4LCTHNd+CPYJ
 adHTHP2j9MC13cICz0B+tEuAYH06Ky2FjK2uY2RRpqfwjkhdJOMjGDKPidpnmpMU901CicWMuX4
 9JxBfMIV4fG3KEziFOMtp5aeFu7Hq+xW/Ox7zVICH7zr5DB3l2wcOm5CUdpGEr5ZIITnX5nBI+R
 hyOBcFfo/7dXmmt6tY/U/S34YLXIHkvX0hi3dIUlpuM4rY7hKiBsrtlfs2RTLR8YPqDOtvIgCmd
 KjQE/ZH8OwfUwhGcru+65UVe4iOANXtR+3h321hDUcZv7Kd1oVC2pZ68ue76+Meju+2OKCHUItF
 3zoqiWVgk5vsgqo+mslRX//jcjqvV6t2YzQIbBQ9CUm+/nyznaGEPQUQ6u6UBwFTF5NVPbCYtZD
 HYkGKpcO/80hTuEaA+v869iVkH9mYLnWWUGyralMy2MrqC/8JGIlMZZ/Gu9ADuGL12H9OG6rjp7
 J+Ggd7r9GNG/8QA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMSBTYWx0ZWRfX/49E7+WWj/7U
 N3OSTJAinzRxAJ88U3dGCXAPnvubcMvtxuTi3VEE8lpm1wIyevh5787ML/wjZtWY0/bJgL4/hSS
 PDkmkg3kJLBSsyh/g3LyNgh0viyqFvwGeg7vtm1t57pVS8ppjs1XtPd15B6eQ2oUUkbQUT6WWDz
 mM+nRVuVWy/6VMm/kwgdPBFrppzWOwLEhltnaegUO7hZFMNcfGRubysFDaZC9xZDCUwrtpcPLJo
 n124hCW/jjRBJjhnVi+smevq5zGB+EBDU2xWT1dzCRTGLiTApDqJkNdPVJ/2DNghZcWm0CgATPA
 nAZ55kAg+kxvPAkl3NXVq36ezeiXD03xpByCrFdpJRAZbptwXyZU3U8uvYO/NEtOgxFphotxb+B
 34x2dwx7+Gfy6p6J5aTl9SM2XgwbiKNwIiX8xAT7YBzKJsWg8RHgkrIGoUUrWos9G0bl2Bk+MxD
 OeWhLDdYDhdhotO61Wg==
X-Proofpoint-ORIG-GUID: NaQ399KA0wdkyZagYSSDsSWe3p7C2KxN
X-Proofpoint-GUID: NaQ399KA0wdkyZagYSSDsSWe3p7C2KxN
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aeb843 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=WYYMOgmxChqpMybUN8IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090111

The suggestion of having the CX power domain tied up to the GCC
controller started here:

https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/

and then, for Glymur, it has been brought up here as well:

https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/

These plus a discussion off-list led to this patchset being done.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Dropped the required-opps property from both the schema and DT node.
- Link to v1: https://patch.msgid.link/20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain
      clk: qcom: gcc-glymur: Enable runtime PM
      arm64: dts: qcom: glymur: Tie up the CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi                         | 1 +
 drivers/clk/qcom/gcc-glymur.c                                | 1 +
 3 files changed, 10 insertions(+)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

