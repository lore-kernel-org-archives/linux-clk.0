Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124521;
	b=qYwe0VsVIX5OSbk1C3VqAZPrEsEyPSRkpVrr1f8aNh0hSBgZe/uIH3k5U15Up4p5vyLj
	 dUx86XfNf6fmCU4EcDTq2odLQ4ZqnzgsHxuP66Uaiw2LHnnrV8RVlpY2QcYaQjTLF1Nap
	 cmDFEzV1j9gbFFHvfVxI1Va/KUGATqFW4hUfa87tqBB5kY4ZIkqhfGtv16sE05+0u4BVB
	 bl58O/HnPlWXr/OquJ53NbzCK0LnaHJhUkAdszv972RJ+J5zdnM2aXb9hWXoChxE/Rc3f
	 DblBuKE43MO3+5PX5ziAZFnMtfBUgp8iAHupbv7yAAH80ry2iq1ypNCfdfRPOUnoL4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
	b=DW3S5Gp8sO0yRjlKpy/E+kWtBxkZNDs8cBuh2PckH6B6Q9yx52eF5Qv8FewToeMkKNqZ
	 jMdCFxbmGu3nywlfnK2DEl16jjfqMbpONo0qtIRAoHjhziAjopJkUHX0MH3Ms5hg7d3A5
	 v3OmhaF/iPWdVkCpupmjtJOpLvk8K6Qa8ID0DUk0QKk6Qk+OeNaJs8VMSNmJz6HGZEkmN
	 s1JrsWL8zrDAfT9g3CPbXLOJhADba9FuTi/bZYvsLTQlpWzxzvVx3c3TE/FLwpHhgKdnJ
	 p5rXs+QSRGQEOlUdM8McPllsQm+Eh80FgNa3mkQV15U4NLWSJ2KvO8Ocj+DHoZHwlMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f8g//xNM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hv6GFNR5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B52606A326
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B52606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f8g//xNM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hv6GFNR5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH0FGu3310645
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y8i+0/bYzkCsLjnd3wJ0YP
	HFhoKgmno2YUxASoV3BzE=; b=f8g//xNMWARPJrmhNIZvM2Uf2d32EzrzVbirA8
	bOnsZ8u1Q+5QMeB+xxuRJiEOGcpFuX02Mh0XRNv+RJp8R6u0szL6wFr1y7gaG+dn
	HawiE/+/7MBgF45zk7X0fKuwJGhJ84W1J/4gWmKIj0O6tu3KHg15w4p9JMH59rN9
	gO+CHVNDRYEW58UZfwudfxvJbRlffKe+DQLKLqi3eIM29UsRTw2fUxXT9+iuNU2m
	8NXtnE2tpj4ekgTOwdhDEVWh9cm2d52xPZwzzVFELBD4MLcQaDu4msqNbZGo3Rr8
	kiHYtsWznAGyV77PjI6Ad1wjZVr3id0CpaW+7eLhLk+qT8LQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtbsh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:08:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso185364eec.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124518; x=1793729318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
        b=hv6GFNR5AjGYikFcKglsYPutYre8VVxY2P6NJpOMP9lhefPYt/vk6k4Tbj1rcScMLn
         t2VE8Ug4eNp5qfW1SXfWAXMd4+xvm8oaMHQO0YOVwKFVHxGJ38duKmF3hhVciAeEKyNY
         Fss3eGDYizKTeLqCLLJU8wCj7AhZxXJfQ54sIuXIV6mDjll8GA7RP8kcecfCJzqFXkWM
         oLYMXgm73BEMBjxyDX1HpL5/WjTHEeH3NlUPoSDq3KSmfSeQsNDNJPNi2NjAN0XIpZ2g
         xbcoUm3eqG3hxNX82q4JuXv1TB3qWd4bRF6AHyG/UiK7bZEZ1v9qMFgil6hkwSewWn17
         VJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124518; x=1793729318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
        b=tSVg/Zt7Ey7swnXzza8Gzkw8JbYPDOEhf4co7yxatzuHvKejx3KysHiJ/QbUEgKDKY
         aJ7+rG3a+Lg2vGCPRZX8NyrIFYa9O/Tqh3/UinMFpCgRRVdUv7UPzGyupdqIVs1qDePl
         D0tZ1Ju5iGhwuYmmyhfXKYCIKPqvD3o/TvQMt9FDvd8uETBbUBtPsunxYvRCawZxIJ4j
         JOoS+RFJ/oy2qQQQC/WM5sYtEYG9uVBELRKK1ceTPP1ug91fQaQAsyeJgNqWRjvy2auD
         eOF+O2CWlLsGspeTlmepN/9iZ0i5UzvfUOfdSD4D3kRbmMWjnW+WM/HM/wMdSnJevTh/
         QMow==
X-Forwarded-Encrypted: i=1; AKwUvBw5EV/sF1O/JWz26K/wuPgYJW4vr5L9GhbRmTCzU4PAMpqXTmttOcsFiU4ZBCczq7RixFsv8P+9vvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIor/bNv3LKmigQwl8mO5sZqt/AN8nDMw482pa+ZkCyWd3fNnUI
	SaKqP85EO/XaW/GeJqk/OvwR77ikyKxO0jh2I368LkdLPn+4Hdji20GL5Ml/zPdLNoE0UUZcoph
	can5rlZKdnySeCHizHNF4m1jRx+LW8OUz6I/wwOH8CHwvTkHG4Im2ji5cb1zGVXg=
X-Gm-Gg: AYBFou0F4sSJMngjBb9YKDQL7GnAU18RhGeaLHn9bFxWJzn/SIU7q/ow7tN8aD9z06r
	N9gvavc3Qu5EZFn0h7IUn8OvPtJeIiFPTOLczfG+relbqrK2Qi+KvNEAJmVxt8dBHlARAgojzCk
	qflkiVdRk7XajU2bQmh/bjl20j9BiuPfKta2nhPenLeG0yor20TJ4biRUKb8hEYgOQexkRUtgoG
	SkdRN9gNh20ahMBKGhxe1gPeFMu/fdfxxTkLiKTJbSvsCL1w3BRfM9XBGM7TySkM07XboDwSPSM
	+7RzkUjFwvBZwJn2G90OSAhFOfRgq9rqO5D+KbVa46ejXZZ8rEV0FvW5TSf40SCCVEK0D9prgyB
	nyZeOZzm5z8SZ2OJLnMgznofoJF+XRvVLhUILLsIBskgsWfqFnu6o1P+xi4OCt44ZDOSgq5bXXQ
	==
X-Received: by 2002:a05:701b:2405:b0:193:3274:aac with SMTP id a92af1059eb24-1a6cf72b9c2mr924c88.37.1793124517459;
        Tue, 27 Oct 2026 11:08:37 -0700 (PDT)
X-Received: by 2002:a05:701b:2405:b0:193:3274:aac with SMTP id a92af1059eb24-1a6cf72b9c2mr894c88.37.1793124516585;
        Tue, 27 Oct 2026 11:08:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add Nord DPRX clock controller support
Date: Tue, 27 Oct 2026 23:38:25 +0530
Message-Id: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJno4GoC/23MywrCMBCF4VcpWZuSG0115XuISMzFBmxTMxoqJ
 e9uWhAquBn4B843I7DRW0CHakbRJg8+DCX4rkK6U8PNYm9KI0ZYQ/aE4yFEAxczxgmL0kYqrVt
 BURmM0To/rdjpXLrz8AzxvdqJLt8vI7dMophgIyRTjjtCr/QYAOrHS9116Pu6HLRoiW0EJn4EV
 gSnBG+EJa207o+Qc/4ArZ2sUu0AAAA=
X-Change-ID: 20260903-nords_dprx-4903d7acc841
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX2BlDO9TPl/Vr
 FP4W+Gy+AqRbvT3MIWN+CPt2FxVU/C01bMQ9VCrNMsVmosvtE41ssSST4jlI1HYEIPJ2CbX+7zc
 CBBTVYrwA8MnGCe29T85akuPHzoOoUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX63rjQfga8Og4
 w5DmNG/hf771N15UsL1S+9GITXRgCNF8XlOzD5cNT1mhw08vWZCkXWDBiO76W5tJUlKHJRcEzTF
 9exRfIHZqI84gjJ+ZyouMempwak2mI+dWWy/16HBncybbJpaRAZBvq0mjqQRYDB8YWskenntwVh
 fBo+CgJIIe+/TJMmlgeUqOsn/b4lI4L2uhWPJTtQNYtei4bsYpX2GAU5oQBoYP9WN2HSGG9YwrA
 oTGO7G0rnQ8WS6qI7OahKD+0gGG3Z5c4hWlzMORVrhN8cVgIVD7KhxXISBcHNylvIDw3bKzzJ7Y
 BAcUHYK5OSsc61N8oSh/jmbyJB1d/wym0Sq9wdPXS7emE67OzUXfeLBrOztD4dMf0eeDEJZL9HA
 DJrMo1V9LOmcoMRi8BCUycW8aSfLURLcf/NiZu6s+PvcQGcl/oszj3ge9zvRONEXhDIWFZIn7Z/
 d7JIVplik++OXtNM/GA==
X-Proofpoint-ORIG-GUID: Mr-IcBPNxOl2k4F0D9H7OTpMsfduAJgU
X-Proofpoint-GUID: Mr-IcBPNxOl2k4F0D9H7OTpMsfduAJgU
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0e8a6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dhWb7Yg5Oiobcms0P14A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072

Add support for the DisplayPort Receiver (DPRX) clock controllers found
on Qualcomm Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with their core PLLs.

The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
been widened to 28 bits to carry the fractional word at a finer
resolution. The alpha-PLL core must support that width for the DPRX PLLs
to lock to and report the correct rate.

The series is organized as follows:

  - Patch 1 fixes Zonda PLL L-value rounding.
  - Patch 2 adds alpha-PLL support for a 28-bit ALPHA_VAL width.
  - Patch 3 documents the Nord DPRX clock controller DT bindings.
  - Patch 4 adds the two DPRX clock controller drivers.

Changes in v3:
- Add a separate fix for Zonda PLL L-value rounding.
- Add runtime PM support and use masked divider register updates.
- Use the preferred items form for the power-domains binding property.
- Link to v2: https://lore.kernel.org/r/20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com

Changes in v2:
- Address review comments: remove unused definitions and includes, rewrap the
  alpha-width ternary, and clarify that DPRXCC provides clocks and resets.
- Add RB-by tag [Abel]
- Link to v1: https://lore.kernel.org/r/20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: clk-alpha-pll: fix Zonda L value rounding
      clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
      dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      clk: qcom: dprxcc: Add Nord DPRX clock controller support

 .../bindings/clock/qcom,nord-dprxcc.yaml           |  67 ++++
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  10 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/dprxcc0-nord.c                    | 441 +++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c                    | 440 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       |  27 ++
 8 files changed, 995 insertions(+), 5 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20260903-nords_dprx-4903d7acc841

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

