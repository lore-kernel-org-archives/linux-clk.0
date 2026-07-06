Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B878400E11
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328254; cv=none; b=ZGn/yy2qMW4eht6qjzSBSrBxEClpuVdzUD75Hsnh7C7ctSXPs9UAveCJ62LWSQlJ5wr8gx4gNXXK2BlV4XRzbhrgr5SjIBt98RR8UTJ8N3gUgzuZXS4QTfo475DRgrclPjMO6VxwXkTCJlkGCsdzEeOp3cSuOxPZVezk2eopjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328254; c=relaxed/simple;
	bh=ertaPo2KfN6+JLmWIpS69H7gAWNTbsx8xyo0q5AQDO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Awk/GpQGIc/nVfrwGWC+LkY3J2ZNzvnAEMk5ILfTqY7IrWfHncsx1zkVsvNWA6JQN/6C0yAxzYqCIgdFwG7lM+Zr+iz2GxCxckqsU6ufJSOk3gwyRrPOFqRihbfknsOOn41E/SgjRCtUWPAbi0mQ5ZC+tmGzAra3gWZ9jPtLVDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAwi0tDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXKD90ze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAwi0tDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXKD90ze"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Vd63615509
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 08:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hr7s0DYUE79Y/NJ7lVZGxq
	+zF8JIOLk+qWxVTt/UsDs=; b=dAwi0tDUh4fMOkvGvPfEhPUHCGxzGUWFpUfHnT
	jpWZ72bvEc7el762ivyml8+7LTXD2fRbpDFx/uv4swPPR9RHO029Kq7+Z1BsCG6A
	Ji71WEJpDfzmYHo7asA6Eu+xSHAi+3BtyZjJ5UgMOC8Pl3PWVmEy0SGDURzbk97+
	u4ZXsPe3QjP2rNz4Vwia7RAt/sA0xmLnOtrP+Icl1DBl0sk+NJjUsdzevGWdSyBi
	23k8fWpX3Zzl5wUNgSCEedrzyxcNo4x6nxjvNFZCBuXDegKwkIeeTdH3r2bc6Ecx
	opu6JzgMlxCGsqdHwW/QrcfojqeNOYCfhMUcPblNZ+UzogPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3dcru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:57:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c354050c34so30220465ad.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328243; x=1783933043; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hr7s0DYUE79Y/NJ7lVZGxq+zF8JIOLk+qWxVTt/UsDs=;
        b=QXKD90zeO0ESzrUuQ982g93S2OvsciREJceeKQeM0khfn4auJmTXMHB47aVKppoJrs
         geYZlBSdo34mWeqP/sDdaTEtkcm17gCkLN2GMCWqZ6QndKo+JUGJ1CBqb+7M4GvJwqJI
         e46GWIUotpdpgqvS1gwZ2EvxY8mpEIq0Scs+AxHQNGGNPhHqRt0RB3RknfycLBeeKnOT
         oyhTifE9YnR7yHGEBO1UVdb65tVhtfYZ3sfzX+eWkpietAW/Fm0PAW7jWsrg/LU1468m
         +frFEwFXumyX8C8pAlgpyGx3EGJE4AIWNec9txsIPKSkmo7D7GtIZ74PuWHx/ojOmaDM
         eAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328243; x=1783933043;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr7s0DYUE79Y/NJ7lVZGxq+zF8JIOLk+qWxVTt/UsDs=;
        b=Q1h0OaNmElk9+qTtVEoSgOdjvPaetyBSh5Wg3cKq3A/0SpwYnzuUdhifkfARnqBOc5
         O6KHvLOcJTxRxvU0HI5AQKfszB5kUjRvlhOV5TSSBLnBoHdXhgyGF9pJcqsTxtdkgo/v
         v2HluCt5qLF9rewGkMNQs2IGr7+BfEPt3IBoXi71jawKZ88YPcwuASiW0Op63cgmch1A
         J2lWPmE488+5+Mmpyx194rR/TAtgDwaHZtzFAhYsnTCl/qif5/6WcRoehyi2FbaDrk7h
         /dDbjCKb9rhY7V4cd0/Y8NLnJvap230t4+Vyyrrcc+mBbiWHoxLYDNMouWS/4VFdigFS
         uZKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYkVz/Vklr1GfJMGSAzpShIAaI4zyqc0+5HcOrhVS/N3PigbWyRDSRO2X3rKrcvxWhSUtVcLeJsT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuR30xeLKmxHar5bberpCjuRMYYCqVwOJACEm1x0FyZteGSBM7
	4VxGOWySzw23h3Weu9q/8mScqZk7o4TwtV9rYnTaESL/0nsejiIxg5M+dLKPVf46tYkqsUP0WmX
	DhzzQW8NYo35L71O02vcyKKkPp+czodB6xCkoW0Q+IXa0HqvCIk1FeGVlGR8bIbg=
X-Gm-Gg: AfdE7cnIgNc6As8EN3tbJxSjKuNxzOIxZtufDCFE4jqBl6HvWcgj4YJxbZlqlDBibYy
	lzXNYdHme7SIG9+eibKTC8zR15pu+SK9snoM2DOsHVubb5wBk6jqZnNxi4LZVgk9VF5fcI7mKJ3
	NBRqNApkeTMEgPu6htQaFgS/eag8Tn1UprKBVFZlpAEBMdoSDACkr0angMHQID/Sgk3wcb2ttv6
	qA5T0rE/NXc+aSDPBpSytvhgQ7A66u1piFgB2/++Ffktlp9b1rTH+IduejfC7ZwpsCcv2minmpH
	+/ZWHGyuk/Vw9Yqpkb9iwtqkK+zCVbrP5sjMbiy+F4rD0tsSwxH3GYjNn09B3n2soF/NyGO7iRp
	rQ6MdmGW6gUGx6kpTS8XPr0Euroo54FWhXpw=
X-Received: by 2002:a17:903:2344:b0:2c9:e86e:a9f3 with SMTP id d9443c01a7336-2cbb1e32c78mr86505215ad.10.1783328242998;
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
X-Received: by 2002:a17:903:2344:b0:2c9:e86e:a9f3 with SMTP id d9443c01a7336-2cbb1e32c78mr86504885ad.10.1783328242550;
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add video and camera clock controller
 support for Nord
Date: Mon, 06 Jul 2026 14:27:12 +0530
Message-Id: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhtS2oC/x3MSwqAMAwA0atI1hZi1fq5iohoGjULW2lBBPHuF
 pdvMfNA5CAcoc8eCHxJFO8SijwD2me3sRKbDBq1wQaNcj7Y6RLLnmii+SBSbd0uRaXLDtFACs/
 Aq9z/dBjf9wOUpPVFZAAAAA==
X-Change-ID: 20260706-nord_videocc_camcc-858b14239006
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX4x2PWIUrwsVA
 lUgToJJXUCJAAGZxrnJoes6q4ixs/1KvzmG1FyhkD1UIm3qYQ4/yJzLWuxre4E9LFoJUfCt0CVw
 sBSxtY5o83+xtFp1oVm6PaNukZTcBN0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX5HLSa+kEgkjG
 gKAb9orNcPEE6CpVLHQqaWqAdNaoZ3foBm2z7FQHIN7vE7X5ijsusnmj+YNdy/tCQ+lcKo/9JPx
 XoFWVUZCeJFW8mXY/A7XbSWL2+HeeR56WniCMzG4nRmpmSGugPYlf7QqgaIjmUVoAQafaFYPc9o
 ZEt5u0scHT84vHVtzfAJfMA+qv/SlOZdS6cXlOv9skfHRcCBuCx1Nr4ak14gcPg2HmtKlIZcpk+
 qhSW1S2MXhHfc/erWLdBgYqd/g8dY3/l9yE6qpV0du9zXDiJNvE0O9OtB2432xJ0UsGobN2tmM8
 syClTjkg+OrcaeKiHQ3ZaP/csz1ieYQB2Hxu51NkSiVnU55ApN964tcSDd8Q7I1TPp/gP1jI70J
 YR8fFhnB8E3rV9sfkYl/cFTlxv8/Wl7R/g41FOIbR03wB9KcLTM8lWr03+cyxisLiG3+6aifr+x
 qhj/GSLq8cJoILe55mw==
X-Proofpoint-GUID: N2BZphchFcF8r1bsK-y2_UAu41ukzqd3
X-Proofpoint-ORIG-GUID: N2BZphchFcF8r1bsK-y2_UAu41ukzqd3
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b6df3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I6YkWGfIfrbP7rSzwlsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089

Add the DT bindings and clock drivers for the Video Clock Controller
(VIDEOCC) and Camera Clock Controller (CAMCC) on the Qualcomm
Technologies, Inc. Nord SoC.

The VIDEOCC driver enables video clients to request clocks required
for video encode/decode, and the CAMCC driver enables camera clients
to request clocks required for image capture and camera processing
on Nord.

The series has the following:
  - dt-bindings: clock: qcom: Add video clock controller on Nord SoC
  - dt-bindings: clock: qcom: Add support for Camera Clock Controller
    for Nord
  - clk: qcom: videocc-nord: Add video clock controller driver for
    Nord
  - clk: qcom: camcc: Add support for camera clock controller for
    Nord

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      dt-bindings: clock: qcom: Add video clock controller on Nord SoC
      dt-bindings: clock: qcom: Add support for Camera Clock Controller for Nord
      clk: qcom: videocc-nord: Add video clock controller driver for Nord
      clk: qcom: camcc: Add support for camera clock controller for Nord

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-nord.c                      | 2941 ++++++++++++++++++++
 drivers/clk/qcom/videocc-nord.c                    |  507 ++++
 include/dt-bindings/clock/qcom,nord-camcc.h        |  167 ++
 include/dt-bindings/clock/qcom,nord-videocc.h      |   40 +
 8 files changed, 3683 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260706-nord_videocc_camcc-858b14239006

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

