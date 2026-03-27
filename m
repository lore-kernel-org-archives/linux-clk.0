Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C6393DC2
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613636; cv=none; b=sYEkOoaXcOQTP+IVPJS0GNwvyenJK/4pBzhrBjrrXVHmm1KwoESYIC3JHy6rXXj9EPQWm7JBppf9uZYjDSvvGN6ZcWFpxFHPY1/B/zr8pGZNHQzyDK4sA2/pE8px6AgX17i52Pb+7utZgFFMCq39vM/7bRMhHMetamLTPuZTJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613636; c=relaxed/simple;
	bh=CpiJi1wFsZbfzyH+f0CtUiZ1fQugjFswPbwL9ZRyT5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j+g5WYq2GzNCQsAx3KtGhurNe4g2mG18+8Df5gCNWLh1kbBogyY0IguKG5WthfaBM/CodO8wj1eQE3nCpUjRVC/KTfbUVm3SM+/kC05QlmwOXSM2QGzxoYgmZBzssvtQAd4erc2ZUUzsxavlwqIuokPJtPE4t3SJD91USaRaMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1/nQgS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzYzSov1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1/nQgS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzYzSov1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vlE2731488
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kbnk1Dbp628OwAbcO4W3dN
	KPCATjO4PL3FJbktC7gOk=; b=I1/nQgS1fvGRIsowpfPHQcMaUVCmK5ljlvlrhw
	JyGw82eRuItR4/TsNd3Fg4UU/uwwu+2F+2B0mht4PBeMct8dwpAlpFJ8i7AelQx6
	RIMJ6e6XToVJUrE1UblSZuOgp4s20Bddkzn6YIcT10wBgqdcQKMCoPLZgTD2XI8/
	uMCXjaoW5XyqaPJWKkZAWxNzcZ6bpRXYB8q6AGzlb0M7kuBwVri8fDNTQONsBTt2
	fHGx9joXW6wMmaHH6gwgrvJC+JpJqR5y+CBAhh1RbSNreI8dJOpjo/MAgvadhLPW
	e+3vpL03kWrVbiZxMF5cyZAIvSsAhrSuhOPCDUaV0hyFYaaQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q39sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso99334951cf.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613633; x=1775218433; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kbnk1Dbp628OwAbcO4W3dNKPCATjO4PL3FJbktC7gOk=;
        b=jzYzSov1Se22GjHGPRoW9YDWhvgsR0aW8HE6idKqQSCR3o9kcRQPGzpRJBtiWiwtI6
         oCl79c/Ou8amOtDByDUa7xgk51VsFvQQe6iTb4LfY/WdnNHEltEGUoshQ2OC2gWccam4
         9u8+QB+768btjA75RTQqWsuiI8H8JYUpj3abG5tNUmZzw4aawu/TdZSv/NhUOtHtuW2o
         yYP+GnKEiZoVJwTgUsZNNXshhLvp3CNU5yvgxL9Ja5KNmAblYp07iDhTYxsa/mERoF3z
         bYGQXvZF/TWdFeTYQgVx3jPpPf9Tcg15wjKet6vQevXnUpDscslIY+EAWiLEOuNVEImy
         zcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613633; x=1775218433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbnk1Dbp628OwAbcO4W3dNKPCATjO4PL3FJbktC7gOk=;
        b=fJZO7N7ovREPCw3W5sGcwpDsVBXvBQBOf73iUX6ld0vilL/X2Q5fbKR4hoXWCvhwQs
         RCi/rEexXWib0QoR7rK7HlQ6C+u8Hu3uZjgg5I7TQjqkC/2s9jneMlMKwV2/jY7YvTh7
         JEJmgJs6tRH2pGg5825n1jK4xcEqDFld/2hMPuMLZcEMPvYviox41WEYR/JMH8N5G1fz
         flnkWy9CCFrx84MugwPg1+sEM1XstjkDse2FeGi8nWwQLztGKZqfdUXoF+fPN6Dg61qO
         erl5gBMPYujT1L+MPLYJKvMVOzdGBd8EsZQ+1K5El2GainVn/btFAI5bpfFW5Uho0+fX
         Mdng==
X-Forwarded-Encrypted: i=1; AJvYcCU2ET7h4MzniamIncHpF1vawsYJuKuZ2RYdyYLsT3gkKHPRylPjKgzaKJJXTdFh4WWNE/eQdZr/9/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnDiUlt82WQOUwSwUOVE04/Ifc7DvJyyzM4e9q4I8jfRWulliD
	tdThOU5bBJmbS85Dtx3CNf7In/Kqxvsiky0h5wDtcStXl7UapD04cHZjZEM6Ig4wwAc32GZ39YJ
	0Er7EAoz7lQGs4Z4sKn5lrDmQ6ARZ5/+FFuyCHQYLS4hx0lpR9P1JqLmyEwVlyqLS5mq247g=
X-Gm-Gg: ATEYQzzJJPi7kmFFOJJOyc1ktPW72Z8dkJbJIrAgM/vhKsXP4a+oR8roX6IxE02wvaO
	bK2lMdAZhn5tuH70DOBGyhbLcuEzOi7qgDFPKmbwiA3z8h2B33diFDOFLxHtsau4clL4f6zvpLn
	kNevCmL+ibtjb+5W+m3/oTiNkeN6zWfckxyLn2HYrVERptsL3jFbA/bj0uztqQPsNvqfLyMCCHy
	tnO+j1tgRrwH2SB/qRC92KN+ftkZ62PeSl+61noygGsaZSmbja6PDMCUKJDxBdib1TXxx77Uh4R
	oRS+WNtqs6/5NKisRtBgw5uXp4UiXBsOd4oGTMlWTomS5oYBdkhDjh6K8hMw5x7eHk6Tunp16ub
	BBD/Nbpp8T7Ff0MgeYs0JTwVTkM8=
X-Received: by 2002:ac8:5f49:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50b9958e2b0mr64471091cf.39.1774613633486;
        Fri, 27 Mar 2026 05:13:53 -0700 (PDT)
X-Received: by 2002:ac8:5f49:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50b9958e2b0mr64470531cf.39.1774613632917;
        Fri, 27 Mar 2026 05:13:52 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14647927f8f.31.2026.03.27.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:13:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
Date: Fri, 27 Mar 2026 14:13:39 +0200
Message-Id: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN0xmkC/yXNSw7CMAxF0a1UHmOpBBE+W0EMUtsUozap4kIrq
 u6dAMMzePctYJJVDM7VAlleappiwXZTAd1DbAWVi8HVztc7d0Ae8aYz9tolQ+n0HbAlwiFNkpF
 THzQaNkzeB97z6eigpIYsZfS7uVz/tmfzEBq/bVjXD1KxQ7WIAAAA
X-Change-ID: 20260327-dt-fix-milos-eliza-gcc-power-domains-bdc66ad5d982
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CpiJi1wFsZbfzyH+f0CtUiZ1fQugjFswPbwL9ZRyT5k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnR1hW+t3hCrFIdlWwLympwZnNEIJydLRsUgP
 Wp22ebEHnOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ0dQAKCRAbX0TJAJUV
 VhKZD/9jkSAP8CRS6WYhSq26qOdmRrq2SrU5758hd8KmlWvP3T3JpqQTKsL63oHienFSdykhhV+
 5/URs8ixhi/3AxGbVt6di6lljhsHTzDIQ3Hn7iGYXRV4O04j2EjcfQEOpEC0b3SEXnFqRY8sLFd
 KlU02Pf2BsDk2/12ikJDB43UeOwx130n69ndNi4w/EpiQTMKzWc+Uxhi5/xV6HdEDE59EpE6snk
 wRjlwqF44yg5LvJr5oL7jGJ558l/YLSq/cTBNk9VHf2VmoKeqpe794HHALMa+8IP9mMAvdv+Bdz
 EiQal9Kwt8U2lJFA1BBFpMTmGy4g+3zuYH8IzDIX4mHJgM8BjM68KEjxlBwo0EQN/EIZUMGRejY
 2cYZftSMTA/jGV/iN4xIfKQhF4loHppBNgEZmInzUSRTeW32QsdmukfQamSXbVB5pZxeNDmIEAU
 3yBC5nFLM5jA0/TY/VdybzXV0eKDS/OB6TjadRDGo9BbWyrqSJLCkhl8e+PVNMXdEKY+OhdO0zd
 mvEdGeTwcJJEYx6V6lgap9HarAt7SSqh/mBdEzPy+NBJaMGzVoVsaWybMvCtEXsmfM/07VE8l8X
 j5DAEZFQA4FzGu+JdBRReYwX3qIJ8p7EPPxMU5FV/+9j0NewbTpTMHwUx4ccCVu6jBa6KR0/hxI
 1TsIlRK27cleXSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: yBVi1RX5rUpcvYKiEOkx8jyn_36CvP6x
X-Proofpoint-ORIG-GUID: yBVi1RX5rUpcvYKiEOkx8jyn_36CvP6x
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c67482 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GdvNSvP5vY06GQSh6K4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfXx+q1IvV0sCiH
 pXMTzxWoRbqtzev3AnKTDMxcJsQ9anowQzpsTV+OxEwD+9FlsBQUC7ulSrQfHu2N2QRXIkRKoPe
 sS9wRMJ8rqsQZagkuy99Vf04GgeghGfy5uwoXP8l2aVcFzIbIzcYNLPxwwkmWnCyvpvXLb+Y0H5
 m3Htl6gW/h9aH8S+FZ/Zc4JW3tgKAa+cGDn8GFxsEm9exWC+TfretuzPOX83YKR4fGD3gN/CYkZ
 CFNIHKn0hmN8POd72CDOc2U0iCVUXX0SxPmX6pyqPLsaay4B3iBt9uikE1Jj1+HCvHmufiDNQUX
 qa33Vne5rR+1F4/0K4WMad83MfTD7TvesmXrNXL/sZRIPPbaTOXrOCgCJqRwxU3WLPN/slP+ZkK
 koIU1FiFK2+91CXCyO8G5qsjzw9aOyyWRXbw/1HMdiHlxiW2hzyEgaCcIhVMYEHsFZ6eOo0xnZZ
 ej5c5z8di2a03lQ19Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270083

Recently, on Eliza, the CX has been tied up to the GCC.
This leads to dt-bindings check failing.

So the schema needs to be fixed. But the schema is same
for Milos. So instead of adding an if-clause for Eliza only,
tie the CX power domain to the GCC on Milos as well, for the
same exact reasons as on Eliza.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: clock: qcom: Add missing power-domains property
      arm64: dts: qcom: milos: Add missing CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml | 7 +++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                         | 2 ++
 2 files changed, 9 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-dt-fix-milos-eliza-gcc-power-domains-bdc66ad5d982

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

