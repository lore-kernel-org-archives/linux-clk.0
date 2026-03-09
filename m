Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E12D38B7C4
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050800; cv=none; b=ou8cmk5bP5sSWbuir5/dsjXU0DnvVbt1bejPjNYBqEAAHD2zxUCxUY9rTFyxzcrFnF3ht0yLopMpysoRwYxG2TqbXGRpvGGSWBVZ3fK0pgeqCN+vhs+1q52tgwiMHaei7U00wll2Gb2DwMv3Teflx5f1eVNNeVltDun8gdpuvAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050800; c=relaxed/simple;
	bh=+h7L2CSgp+u57PBzL+OnIyuBtmi9EUy1Hqu+C8Dk8l8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MdxBlqlTNX9THLjO7TB5pSutge4zSPQFAofhkk6gGl7sZHC/I7jrm4D6YGV+Wewpd5ENcQLtH72nCyoC78Dqc6pBnL52rK7qk+cwpX3TGicaaU5h8wJdXrCTuTnJNhxQUOSWWHBCkkCPgleCLzkAQE5EOyAmRociRbGHAfVKAx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJIcymKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtjxMrZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJIcymKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtjxMrZ/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62986OUZ3686497
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 10:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TxhIqJCHnoy5mCJBqk2Hi1
	XLwhfPKYUXRm3bkoCvhSk=; b=cJIcymKPO5die/itTp/rcpHXdGn6Co4GO3DJIA
	Zi/DmKanDTvXRAmM1X3tUrFqOubimMFMPm8jswdh+gNBRgq6qYHgJIWFdnltmiD7
	cYWk+E5un4vAKeTvDo8H9w3SeN6kx8vL9Bcz8vvW5mKOTEhithnGpFivapxxPipY
	1HWploMr+VTkxCM+/fJb8uc+YoD5kqQYUGQ03beG+QvzjKLQ9O9NNfvMCbAhMWVd
	Oi6tp4u7C7eB9uok3dDhXnU9eTCPmlylQBsndKChjLROCJzTPDxuDtwbaCDL7GYQ
	Ni3qXntcg3M9xRpwgWJSgHWyU2MYLlWYBeikU8D/h1qm6EOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrn2pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 10:06:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd820c6a4fso1084625385a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773050796; x=1773655596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxhIqJCHnoy5mCJBqk2Hi1XLwhfPKYUXRm3bkoCvhSk=;
        b=QtjxMrZ/DLA3XZmsIQdKWRmoRSxuXDMLjvFqmKPLlNQltqAg3Iz1dIqI/VTS+OspKA
         6RIV1V10z8ZA1gnulfylkPxsHiPXeIkGffQoYvm46Yjvf8PTqOoPFbDdZrXwqv4BIjQl
         gI22rPXSSYTfycBhyt7LdGQH66S1iJM2W+dmrQigF2c/Y96CLBMhwEGms7bwhFNB7EhU
         ALZGKLs83uY5YsUivwjQ9AeY3fYyeMbr0/ONo3eJ9cedp8u02W6Gd+Hhgfl3nDlxAyt7
         H1Z2q9+DrzIQmYve1qH8aVR9AUI25Irq9+vgLD1tr+ySDTZ5dGbXCFaiLDZsdIIPCFW3
         v+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050796; x=1773655596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxhIqJCHnoy5mCJBqk2Hi1XLwhfPKYUXRm3bkoCvhSk=;
        b=wowfVOi3q0NM52DAI4OUyHJE633Xhj0KtnbSoaSjYSlsy4ppNNUpFKVWMmn5Ueu9IO
         /zG+SiVVrPnbUlYHTAhlxx/6+V9KCuQW3Tk7T8mlPVzXiYqO0C69UjH/holxSdqzES6A
         1D72NtHtxVsGySE2MqHufzXzxFNXelWoCL6Gw4kaUq27mjw3Dkv3QJbA9HEnyU1UmgOO
         6QTkc3VG5wJIhbvj9sdCZWkKNxFZnCUk1mm7s8hH79RJw9GTrhG0C4tVjqtdiE3szzbu
         E+JcJmIXAxZWOgMC1KReQt7YLFyYDcuPQd70Gh36TuGkf2pQFegt3ZH7LMm0YheUAYAA
         28Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUTz6G9appf5LmVJnsbpeXKmbd9HX9BfZWmF7aEkU9TD8JtKl3QsEX8CMJ9z2rhItkM9U2kN7BvWp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUGC3kzOP8qpwGhOyr3cUIL+ZbReJIYxd2IyXSplAfonr7m5jy
	11EkrUWJNlByff71cim1wMfnjaAI4HyhP0YUAl1SzwNOnAnVwnxOIKxKZUlU3VaYsyu5c1xExCG
	OUosipgcuq4Zdn/xYokmnjmURFvwt8F+RhMBYyPX91fbyr7hU9OKVDNsuv5MAW8w=
X-Gm-Gg: ATEYQzzNZh0IiTz/E8/ViFDASNS5rERAShM9H9LQ4whI+cVufCNclmj2ExDApWhfZJG
	EQwGSGY3Jx11XtI/C0W0A7Ud4/K7Pv7UCXumL2XKq/1WGC8eaywFegJgeRhFrmWANTVs5fG4TWv
	JI9P3gqemChEA5LdphPtD+WwFlID2CNA9A/ZN8fBnvFsfDFtDX2BJSCNLRzkY6rdbyV4MegvXiG
	6XMb5DyNdxktaDSBOi5Vw2V9tMCzYMHWoKscwAPztPUkXkWIq8LVFhJcWvG7VlETjiLeyHhERix
	RWDPMxYta0u3HTVAbGei3mf0EY3W8DX7g3o3PbQZ0p2SF5AEiDURp7N4SgxKyybyNU9zGOC7maP
	evCPDv8L/1x4Y2/IkayrmYnis9Y1FDw==
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr1403835785a.24.1773050796318;
        Mon, 09 Mar 2026 03:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr1403830685a.24.1773050795809;
        Mon, 09 Mar 2026 03:06:35 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm24114052f8f.3.2026.03.09.03.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:06:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Date: Mon, 09 Mar 2026 12:06:16 +0200
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJibrmkC/yXMQQ6CQAyF4auQrm1SQDB6FcNiKGWswdFMgWAId
 2fQ5Ze8969gElUMbtkKUWY1fYeE/JQBP1zwgtolQ0FFTSVd0Q/f1xSx1wU9M/KCxm7Q4NFRW1b
 EXXU555D+nyhp9Wvfm79tap/C4xGEbdsBHZMP1n0AAAA=
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+h7L2CSgp+u57PBzL+OnIyuBtmi9EUy1Hqu+C8Dk8l8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprpugQgSykLIRd5OA8KwZVRBMcs46YjNaxotj6
 /8CBVlpDpqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6boAAKCRAbX0TJAJUV
 VtDVD/49DczuCRsbnq1QhY9mqQhdBVah5kMS5xaxVLOaJq0N8oxiaBoU7x2CB8c/c4zTzIHQbQ4
 IluR2CUhg0d7cmODswmEkgEiKrg8+ty5ACZU5ue5qHkpuXLNgKgvCGTUKFIO3lkIp/KzyXMLoeX
 2FFfgkm2+In5COAYNHYq/u4SrW+Mrs20osTAeISkQtp4E3iCCE8fI4I89hyQMVGyYIOahUwozMv
 YTqAoVlRi9mAauq+hntKp99xCLxIpBM1LgHcDZRcN5n9bF8I6hh3AfbXBvka02ux4LtgDXh/tJW
 ia++s9FL8jo2ywOpRq776RgMQ7goFrz/43TCdlmbcbsVnryAi7vNntCkGplc3V7zZNyG4Pmwv7A
 8+fxXcApHFH8B8b6hHLyBukdycjH7uCojjPltfCdx8JtcnbGgGGznDVW53h17uNTWkbUZ0TVgYo
 Wzux3Dwjz706L7TLF1dEXEDXUzD3mh1VWyldLAyP0V1egQAQ0hh+YiNw62fOG4+zlLeMYFcw0d3
 90AY+zvh5mTVX0Gk9BVopLKWnhNa8bGb3VXCbVDzv6NmvJ9jaOFe+//xvnxT+cRZOHx6tYhTRaL
 +ncE38prDG4NgWPmpdtwPLHnyaUzaJsLeXZeGvbRc7Qib34XoSjqUqunV6sB5Tv4RRs6bLPoY3d
 6Gu+1m1FbebcGQw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ae9bad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IArLRPCm7K00oMWsbhAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7_puzwUJcQCR3LLRE2F9XGLvoYdn1-sB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MyBTYWx0ZWRfX9wL+YX+t5T1M
 uCG7oJ4yxVc0jCWvU4qO/HRYUnAmJHRVWjpcU9uQKO/J08eKULa/upqhMBXl2HlbMYn2UYjY7VW
 yBu458vvyz9LO6z25GqEmzTo9NUqlKo9QZm2liM6qvsVCCXvT5TfE8P6/C5gBN9cWQG+eRXr9Pg
 5zb7x0PCa9X+EvWsVntYXLNrlJB9yTScwI5+aB9q8fg0ggAfMG33xYxxXUTHDW5bo+bYh3kWBvr
 aw+NnH1sFEXnXAeBdgmwaPb/tcDpRAGZxqZLPF2QMtEDl0g9l/FmgCHpElf28E6gDquM+8limKN
 YVIWip7tpyPqlNIosPxTrr4OuDDjZrCoaO/u7amU2ya3bi3g7DJ/ImiPmy/BIhlfz0PyW21wmMW
 SfsozZUmkjmq242ts1P9wFyJvK4hax1DQ9ljR3e5pdD+K046nH6tiHWWoyDm0LB8B+s/P7ey5eS
 8DfWKT9KrlKOfVpu+qg==
X-Proofpoint-GUID: 7_puzwUJcQCR3LLRE2F9XGLvoYdn1-sB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090093

The suggestion of having the CX power domain tied up to the GCC
controller started here:

https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/

and then, for Glymur, it has been brought up here as well:

https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/

These plus a discussion off-list led to this patchset being done.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain and required opp
      clk: qcom: gcc-glymur: Enable runtime PM
      arm64: dts: qcom: glymur: Tie up the CX power domain to GCC

 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml         | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi                       |  2 ++
 drivers/clk/qcom/gcc-glymur.c                              |  1 +
 3 files changed, 17 insertions(+)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

