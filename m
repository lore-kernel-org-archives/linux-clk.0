Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F96735F180
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905244; cv=none; b=Lop6hretXIJpZZKOo2EXeMbN/+y+Yk3OwzZpUGNKLofXnGyJroygR3pFI70sB5Ow2d3j2O4K5QdwsQ2pGbG1soKN/47FgcPF9kXELVwzhtCufzHcDv/eC/AVzwUTaFkCRzS9tZPrwedzlKRNCys6LMc7vNO4v8tL6lQcys5dEyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905244; c=relaxed/simple;
	bh=KJR+wN2GxxX47mMq0L5v9qiUYbR7CJ2cgzDyV7M/EXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZixVJOviesCQ//lnqjxrAXg5Cwn7bLvzWC15tp8ORUSZq/KhrFxOmslqcjJqhlrRwtADAdL8K19Wuo4Bw8DRvsOnOS4RCEoB7V36psXrHoD8MjUtNbpvJYRb5VrlY8RsmG9gySy/crO7PNrLPOnj4RJRqxsq7Ol4UH87wjPIji4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hApBTm6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9hPUSGy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hApBTm6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9hPUSGy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbD5C3487364
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=; b=hApBTm6NRVZ5bonL
	t0SelTEWld3+JBuSN7edbMk4LzTdiIKKP9gEAdAE3zJWBDHLpqNVaWIz9Mcec9Hf
	OUSEYb7PIN0cWGPymrM4E5WQsYo+necrHAEJ6btHwAMgR7W6nUv2X6y+RZQUSL6t
	+eKaDw4M5MNwap5fBvX1tPqe5ZtnP6/aTsOArNNNTm4E7EZSokeNyRVUtv/lFX4C
	dPFyJV9+Qqp3g7i+mXESUxfun/awAac5d3t8d4sPi639P0leVRxkqmmsOGVGLPRD
	LzpsABYmDdxs/ahRfKhibYnIif5+BgCrM4G2iQj2Eg8DaLStqJ7HFZh6H1S9Hzzq
	jYHqtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0c9hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so7874405ad.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905235; x=1785510035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=;
        b=R9hPUSGytyK3kXT/JE+5DdNWDPWNAltpnMORtwvXHfUDfE9sTEBI8g2lagDN2+nbmN
         r9Pu56TUkxlUmuCsjYxPVI1RC/LyFcUAzTZfJ2yxhhl/bVTKje7QMRtULekmXrTZcSoB
         hXUa/yrz3UpaK5Jj/TKGCN7YTO0F7Kx/BdavtXPiXM5YCb+gAKlCoK15E1l53p6QAUzZ
         yu2FO1/J525cPk9kc4pfxq9j/0r9el9tEvq8Nqc02b8EHfds8dunsGrLshgw+yjZHewy
         CVIjYaziDyZq4KOv8svFAzbt7yRP9kDt3m93yWIIFc4MHFDNY8vMIk15fIKqs+vCrEG8
         O2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905235; x=1785510035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=;
        b=ZFvXAEQTUdn/TrJIwxfMnsNfndIr5F/A/kD/3wfeldvwPT7NJw+QDc4gWclHTB6eiO
         EDCwRsBTxXANWEOuZaXHsPBzP4bBLoyNH0jHk4oYAoNCOBzHL2kZxncpIQJZXOPnvJkO
         zNpSXKp7RAxgajkS6z1vO2JoyonF0qiNyoZ3h8kp9373iNAbKf2f/b9CXsg0MjIm7+QN
         Hf7GAlARGT8b+zG/ZTUXOzQQh6O8MEZdGJxcyE0kZnCyGfh96z9XUaBjx5xhCpjTI4lb
         FSjUgTLnD49Y2f9+LURtdJ5pqIhZ3WnLQAlEKH2kFKdIuBRUvl52V7nFzTwNd/zQBh4r
         gczw==
X-Forwarded-Encrypted: i=1; AHgh+RonvyAiGLdWvZB/lFkG1VzhpvbegycTBQ5uiAyKJ7jgHupKnKe6+Y/qXH2cci5w3bRFX3SUn3FMVUs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyttb9O77S6H0EcPZ5AGssf6o0EChgUtUdKMBjUv7QTJIoO4/F3
	19nAioe0S+LbrsKa8Za0bIkfhG+RzEe/7u4x7kQ4UOcHv+daB6e1tH4YWf8Ff2k2ErEAna8DMAm
	ywW7ALBxXqwT8aK/4Wiitk2Z0fxiwAEkI9yk18SGQXwdRWfHe64OFE3UP1aQA0z4=
X-Gm-Gg: AR+sD136YI1YAUVeqRsnUsCAkSJHKlbtuGEIslRtq7LQZ2pVyRkOLhFWBIKYAkqlGjW
	3nRby1HYaQ5M0lYf/v2I6Hfla5W3AXUGLoDvGyMd964/v6oeogpsSWJ7k4x1j5PbFcgsoPAD6G7
	Qi32ttr3NHxtWa/ukAWpWCjimjfLvm0D9fp8DIU4JMjBVjLobsI5M0KVXguRl9e0FY7xWG4YVQX
	rNu7OpVm/BcZlHPmUxEx6y5LNIBNc+P0EUs+wW+l1wWWk7N9STJfxXexe95nk66TwTuAx72ycBZ
	If6/KGXYXChG1n2reMWiemR3SBf/iHLMBjh3ZXl5/qsWqm/ktZKxs3bSBAp6F0ycFjnUqGmwnJc
	Ipkmps62SjgeV1E2jJEzbHcPzPHNSTaMGYPyTHPdpeIo=
X-Received: by 2002:a17:902:e884:b0:2ca:d034:ee7d with SMTP id d9443c01a7336-2cfd70c0993mr8093335ad.4.1784905235324;
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
X-Received: by 2002:a17:902:e884:b0:2ca:d034:ee7d with SMTP id d9443c01a7336-2cfd70c0993mr8091595ad.4.1784905233416;
        Fri, 24 Jul 2026 08:00:33 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:32 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:30 -0700
Subject: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=749;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=KJR+wN2GxxX47mMq0L5v9qiUYbR7CJ2cgzDyV7M/EXA=;
 b=DRoCiALCPxHYfgApbZY8XM2JEu7UnvsJshHqGT5Wzcb0/ZfKVMybazdkOpoktKJK3sfTwIBlt
 mczsdlNRSK5AAwf6i0VJOS+7oLLv7ES55kGeFe8h4FmX0gyrKoKu10u
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: PeGagFFmzQT-CJewfxgqVFFJV1Rfom3h
X-Proofpoint-GUID: PeGagFFmzQT-CJewfxgqVFFJV1Rfom3h
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a637e15 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Lly5wiSg1jk5MYLGpuEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX6mhBuTn/J+nl
 nyjrg5MdkKl5TDGdUlZdDa+PRTWJ4SX55OA0WdAZgw76CPoVzjGIhZ4EQ9ND4hxc44oW65snNT8
 AIpnaPFSDYjeh1yHc+BxG7X1ptsGXvctUA7y89RpOhBymYsesEBPvp1iXCxpQLt+11qn0Rf49vg
 dFmf82SSdulfxs3fD4phjCNQRij6n69iCfTMx3J0viKHGauN7hHlaV8Zynuow5UIbZaW7zQxGCj
 5AxHDwXlxkBE0QA2btxxQ0E7WKylGJC/EJRmZpIarS7YuFq+Y3psxDQvb5xqsFQvpN4IecIQeKc
 8rMMb+DnsHq1OLWerNN869BEnVHAe97Q4O7BdYmdfKPYQwaL7TfaZ/vN1HYVF6AqRok8xIWzWeC
 kntcO4/OBgNxJCFwVivtcJsYrAyCJ9X+KGe31a6QG5TeMMQWH1JoyqiDz8f6oHDLsnSOWTkeUYW
 v5J1ZKq9jFV5sPP9ZdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX7aQsarKnGc6H
 BSYkx7j1cgnJLz+yYFOxwjgfqDGEaQFj77HC356LbHsQnMTFWiarI3PJACb43UTQJiP6OnHn4+4
 1taZQbZaoAPHKMTmlUcnB443vUuEiEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240135

devm_clk_hw_register_composite_pdata() is defined but not exported,
preventing its use from loadable modules. Add EXPORT_SYMBOL_GPL() so
that out-of-tree and built-as-module clock drivers can call it.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/clk-composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 835b1e4e5869..11842bce5918 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -462,3 +462,4 @@ struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
 						rate_hw, rate_ops, gate_hw,
 						gate_ops, flags);
 }
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_composite_pdata);

-- 
2.43.0

