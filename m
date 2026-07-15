Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D17644C67F
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122176; cv=none; b=SSHN/tOJOkdTBpfAL3N/O0kqpPnSCBK/uzbBPZ2pHeTd8+CedyzBwzjWnJBan6ZHswLxzPlAbl7vAnscv82/apwTjULDFQDhX6mkvuH3J/Yoyp9GmVNcqsMdgsGIq/e/VZizl+pD/TnD9kUmVMM+pN+co0Vrkx12Lz8/OoX3SHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122176; c=relaxed/simple;
	bh=g51DNByPJDCslSrF4VLLAsFcqJhhSDHh0rVJN3NnYWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XHUkQgYws7LnU8APwWxE1yBswo8ITuAL5RF64py1RFGsNRI+M+L3o9M/ED/7OCCWugSJ3Afbm+3zUyexqyKCSQTEXtV7nkWbWv3WRSFjLIWWY5q0T8gmh1lq3cxarDUuSmJl66H3St/gNzVhU5kIHdB/BQM4J10AC7O2cuQXklc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lh6KJjCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcscOQfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lh6KJjCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EcscOQfj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcvaR3579143
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=02eLxySZVsV/sAQlk5L38k
	1o7hCjMOgu8dVOxM0R+Uo=; b=Lh6KJjCH1MoWYVQ6+sN+PUaOhL1iLHYNvzulcT
	1CXYjqk4dCGhaO/013edEuilEHzKHtEXLiFYxaMoMCkQFbhggKTXeEEEovHA4y1H
	kheFu+olat44DvrON7yf7VHJXSMzWcwakmdzqOLWIUxoqljEpCVzLEN/HlTsxr7h
	cSsCZWMHMh0x4FJJkQhCAR7JqBwr5zhocJhIwd5nkAWRoj/NIAH8NEfLGFGrSTLt
	J2HNzHulTQeIBewrUAOAUp9f+UyVSs/zXO4fufVk8XzyVbAmlxt+cuZk/eagfE0V
	iWi3OUupLJMv+DvR7e/Oe12PCD3QEp09zL+Gzzl9ACjnoaEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk330y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517e054fe07so111345081cf.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122172; x=1784726972; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=02eLxySZVsV/sAQlk5L38k1o7hCjMOgu8dVOxM0R+Uo=;
        b=EcscOQfjl4XaPvLTauIxrcKw3yRHZ+C6qgTINQWNrNTmg4iR/QXLSmInQuC/S1D8En
         v4PkY6BPG3JA51OHXc6h9H9p7HFts6ze4XSmb27VAElhrrivHtN0S/lMtY6jGqY7egPw
         x392LkZlOTsB/zVscVAu7UE/PMFY0/oQCAJs3dnuIOoq+hqA0+3ovB9xno2S9/DyK6kO
         Q+JBPMDU5PdTU6D5JZFjuTVY401KZdpEwO4J8iYqdX/jxzJYuFmqNqrH28iNm8Ayh493
         +2pZjrYn8EShJG7qu3UW+gGWc8mx+C6Rr0QXKFAKu6YqGmhLxCl37hI4iiOmT+dHUHkt
         xU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122172; x=1784726972;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=02eLxySZVsV/sAQlk5L38k1o7hCjMOgu8dVOxM0R+Uo=;
        b=fTKHdgm/ExviKYhNtE+QbOaR25I3/QaxfGDICCcQYVHPdGD1H0WozyZg/AvUWRPHsP
         gcpCKYI4VMa0zBoLA/RKhV7LLjpya/MCyHNy6Hafc0S/pgK4BeNwBvCa6YIuk3wNOcJo
         6NkJkgxJu+S4kRUOOMYsDr2DQuw6AmdrZKDXPnbSXMxviKjN+bJ11cZyctgK6rc7apTr
         YJVWKEvtbYaGr8GCRW+r5yTKYXG9HD17hIS6OVvy2yCMCXUKbV9hry6d6ONlffC12wbK
         tSZmoV7M3/BRBWyR6syXvg58+3SvgILVpOqg+dG2DOCO1RaysLvYT6om8A1gc+Xw/gwz
         ZueQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSlvpn9bq645K4lgzQ54S/U+HdQF+5dtG8CDATH9UC0mLV7UVXSx5wK2wByGlT8mJmIr2kT7azG4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3v55JTfsi96e6CcPyxRIpuTi2lBQkBej43oVfVaz9KCf5cOx
	U8JK+Lb/HWDMoWWsCMSB4aiH7CszLnyqd1eN44M8O7V9jX36s37a8ioMiumtYi03RWOMx7oVLje
	76ZcC7Z1PEC6tiQZTXw4Qz6uvf90qdvQDT7m1KfE9QrQvvkby0Z8eEZZmP0tNIaI=
X-Gm-Gg: AfdE7cmt5wbjJyWdgkSK9c4hRu//0traKn28oYQLCZbPyiRMGPPLNMvMZhnV8vlOdmz
	wvDEoDeL46imk+mCBoPLJLfebAU6c4aPh3u9JcX3imaQPfbnk1Dgdsb/6t95XwzcWd6VIg19pX5
	sAW+PyCE2QWzXxDoQbhXDAERFc7r66U7UE9n6EftmQ8EnviQRLLgtHC4LRrxULxNYa9sdNsr1iF
	n0lVdvbPX8Ab/Zb+8Jj1ihYXUggsDhNC5hxz1jnDaqxFzGub9qMjY/QCoSNzu/HVWcGDj2W3UKW
	Fjuu/q8m9F8xJBYgiO26RvoN1INlE1KnDaBim0A1uuJEI+WgCuSUUhVo7XnfCWio37LTOaCm8Hg
	HRjEVdtgVdeWpUnI=
X-Received: by 2002:ac8:7f41:0:b0:51b:fa52:807b with SMTP id d75a77b69052e-51e4f0b7865mr28045451cf.47.1784122172147;
        Wed, 15 Jul 2026 06:29:32 -0700 (PDT)
X-Received: by 2002:ac8:7f41:0:b0:51b:fa52:807b with SMTP id d75a77b69052e-51e4f0b7865mr28044411cf.47.1784122170905;
        Wed, 15 Jul 2026 06:29:30 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Date: Wed, 15 Jul 2026 16:29:13 +0300
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACmLV2oC/42NzQ6DIBAGX8Vw7hrA+tdT36PpAVdAGpUW1GiM7
 1601x68bDLJtzMr8dIZ6cktWomTk/HG9gGSS0SwEb2WYOrAhFOe0YSWoNulGx0oM4NGBJzBo2h
 Nr0HQKkkp1ml+ZST8v50Mq8P9eP7Yj9VL4rAL90Vj/GDdcsQntu/OdCYGFFRWcCy4YixTd+t9/
 BlFi7br4nDInpv4aSEPwjoXaSGoKCVWf4Tbtn0Bb5CuyCwBAAA=
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
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
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=g51DNByPJDCslSrF4VLLAsFcqJhhSDHh0rVJN3NnYWw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4stYxKuFPiSSP/HYnS//CJMyK9dZJx8MFr62
 6DCLD2mMgWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLLQAKCRAbX0TJAJUV
 Vi2PEACu1AuKMPneLdVywQiS55zy+eI6ETAP2ArJjlpYoGpvHD8j1a951UJfSh5BIXr2EzKagvg
 nIfFXEnfuOL8h0DKvqStynVMLhglng/Kq8EoNxllk6fQyhR++/DySsc/DuNgjdmjd6yrrDXp/mF
 u9kcdyAPa4gmQzBSMLxiBMyfx1fOBr1/0miRQN3KSc/jdsOkTcaa/UzDqpfjDWptVG0NebzFCR1
 OrcdZEfePu0dDx+ehdm0VNFFOkVMIXspftFSO0Ce+Xhxu6iittkSWLKo7PpZIutpE168bZyi4bo
 8tJthzkktkulfoQMPqIw87rmxfL4EIfpSQe1Z6XWkp2uhjnhw7x7zzecLorFkQFn9+W//ZuV14u
 KQm8+6h3buwCyHd4Ib5+6jSBUV1STlbVTWrrO/Gp46oWeQ7v5mPsrW/x5oY0QceUVWzovMNUDKq
 O9RZpMaPQg6hTaqWWXk0jZBF+Ya6m4kp+2r8q9J4v+f1rXiltneNL9b8mzGN4pApZ6mRYcu6/o4
 TozVXio2OcbeN5wur+Ulx4w7WWi9FlUvSv5GoOvfZUn+zX/JwosbGSJT5XlT5lxHGg64Ia7Eg+2
 rVbjk87nl8UzDRXp/KpvMhEDvWRkNj0LV260dXEYHkaKYlublPyY4U1RwaV8r2WoczFTQsREcBa
 rFob++gEz+DEtzg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a578b3d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=WYYMOgmxChqpMybUN8IA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: jXpbwyBhOLslSNucbk8coZEeSHgpQWHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX/coB7QpsQZ7R
 Q1elOeqm7CWSBKRgGEh05NUbzrjRUO66erYXkGhN7Nav7Xxj0/C9BTTeIC+sEPAw0NHu5zv5hJ1
 lD33EjCdYmMCXDNkhjOeg9AW1Y2Vrg5XhwJjmiF6HY7b9/MhBmFSeyhCypElb0E2OfZ3MjkBOVN
 nB8pPA1V9IiKqWHlwEz8SGK2dL5eodBNyqDvrhXXcySgpeIwT5w5R0Av7Z4tChKrWk+64Mq6i4p
 eFulYEGhAwE4hOuq9Rp9tBGrqR6ZC9wgFp/77TUr/Ry0SxmxETljFKpPQ/omewWLaIyXt7DIrIq
 b0C6tG9xzUDgHiMoE7HS/zWHUQnieY/uba0l73dss+e9B2iaQU6jPiqjGOAZUc2HQ8QZ6RUFV4M
 Xqy37P452D8pUPqGr+sM9eZyEBKsksNqzlra4DcTAvnvcXxlsu0/QqeBbpLb+5UGuWm7/gXBEWn
 E3TkLa3dxrYowDccjzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX6GNTAhHhOrKm
 72Zi0yWtYUL/2KPeMeO8mLW4eTavZ1E9qUwH03GLvZxJXRtB0ctQOx+CyWCya9Dnjrzvnpxyftm
 3MML5eEEGazDU12eDHa2Tb/Zugl3d+w=
X-Proofpoint-GUID: jXpbwyBhOLslSNucbk8coZEeSHgpQWHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134

The suggestion of having the CX power domain tied up to the GCC
controller started here:

https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/

and then, for Glymur, it has been brought up here as well:

https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/

These plus a discussion off-list led to this patchset being done.

Sorry for such a late respin. This got lost somehow in the need-to-respin queue.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260713.
- Did not pick Konrad's R-b tag intentionally because the commit has
  been reworded.
- Link to v2: https://patch.msgid.link/20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com

Changes in v2:
- Dropped the required-opps property from both the schema and DT node.
- Link to v1: https://patch.msgid.link/20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain
      clk: qcom: gcc-glymur: Enable runtime PM
      arm64: dts: qcom: glymur: Add CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi                         | 1 +
 drivers/clk/qcom/gcc-glymur.c                                | 1 +
 3 files changed, 10 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

