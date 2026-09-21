Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCAB4B1D0E
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008858; cv=none; b=lEFeaYJ7Ngz0KeczedMOq1DElEMM+FqWeB+JsaxvZFA97Q93QITg5tJ6kIMHwKX/goO3PXg7mTqBP5CymGbxJrrwwjLiZgGMNFeidbcO5qYGoFwWjLD21V0qjqCOINnLFxSQ0SigQwCZGTELsqgzQsjtQwnAbtCorqRvHH0e/yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008858; c=relaxed/simple;
	bh=aPRFTfaDdQ/cIK6dxLg1FkjHq781avSvKFMf9yuKRGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FaKAGUg5OpYWqeQWC3R500SkQyAC35FjCOs8sd4c6YuOr+uy3TUY31i5k+x6xSixSGTk5HmRDxOTldeZf8/yiAVTpf2ojNEeTxxsw1s2neRqzx1S0VSYtgGW3sJp7Z4QNmZ0QeyNc0nhiO2qlTTgPHRcKB1VgRh9cEBfYhl4yJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxtQFGb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvpWEHEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxtQFGb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvpWEHEw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAFMv1677396
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 16:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/pyCwnstMS7VkKSak/8GHk
	37JiiJroPOTNDhKBTMBlU=; b=jxtQFGb9bSXVOWE55VwC492u5Q484rpC0JeQLW
	cSRyyfZVfcFW7k2YBBmE3mO9tFR2FBPt3msp4TrGOsAC1W6kA6imopNUBgigQk94
	pGfJodZaMw2T0qnwSHTTHwMozg6YVswfyFwppWwleMQXEsvqa5pLRH3YwoR47iWj
	qroxxQIxZllRrswa5iIeJxmtDh26VN5aZxzFA/LOOrG7ql/Kwcn1pV8Z+qhnRGaf
	E47tN3ZkxBFaHEJlLTGg0bjCUzJZYp9A7/uYr0jqm1y+PvMQNtc+99Kx45Z8gW3A
	eGaqEJHbQOoeV8WC6cfa8E61QsyLG7y+0Deo8jyG5BY41DrA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3cshe4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 16:40:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8633c0d7353so3413039b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008855; x=1790613655; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/pyCwnstMS7VkKSak/8GHk37JiiJroPOTNDhKBTMBlU=;
        b=RvpWEHEwRP9LTlmNeh3m2VAqjtfKvbivWWQ7wQ8QMUudLHWqj5Z+H61A2MCL5bDUhx
         zYdYmSWKPdTcc+NB9CdSngKQbwYWNglAgowLXlRIqZ73KCMoUX8/18oAnbiVHh3mTCJt
         V0ZYR1ekLWELgpAiKQIAvtnsmDEN32HJW9whq3S8riogiBf32NRFEz53ZR7NgziaoXv/
         mJWZG0o9SouhKYERziQNeK9cW0LUq4/hXOQdAUKVr+gJvgDKWQopUSmTPu0sp+cugX6I
         9/RZsaxq5qWPJlonH6Rj9FiDwRa7QqlTwFpwHDB8oTF9va1fdFMR5rDaYKf9G45OxUf6
         i+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008855; x=1790613655;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/pyCwnstMS7VkKSak/8GHk37JiiJroPOTNDhKBTMBlU=;
        b=sLIh9KoQiktY8q8GLPtJL9HeB06jXV24/xt3LoeFjYaRninO1iB85BkzRKnPI8Tqt1
         82TIVcWgJpXoSD+Z0ZCwlpAZAQl3hIz8UYZheFN9hRVtc2zdXGWYpCd5IvonqyuIPu1Y
         zfQ3JzAWMCNBAIGPIPmrK+IHJITDFEm4SwO0Clg47iUI+Ffs+P2zr8MYDaqFYEk8Yx8c
         oXvv+JXyg3tanjXb7MHLG4biSuG0Bdged5/SzNuMiGkRtbY86Ph67k9JkIWxQ+l8E8De
         qvgMYYMnddnv+CoZ8yPzEFBIViUpYmpJ9hDdLR2dOpna/+E58M9BgJbLZvXj8TKPRrt7
         T18A==
X-Forwarded-Encrypted: i=1; AKwUvBzMZ2MBGp14hkxR0B+DhGKZzS1lNP5Tzu5D8NLNlMOk1Pf/i92dyuW8zQ1yE4E+3b864r3H/kGsH6c=@vger.kernel.org
X-Gm-Message-State: AFuF++l8WUwLbL9p9ALUAbIrSWdgWxGoa5h5L7otiY6r9koGdBgN8yK9
	jAc9dgFuRiTbxGH0Dqy2cUNgEbLO71QprovkTlkajeheP9/lAeSPm3Gdjfc3W9g5qkvhfT+dUBe
	nOIg3CKE86WlR8De1GPJvCEI+w1rRC/3M1ocE5WCIXQctAqFolb7WJY0VPZvwiH4=
X-Gm-Gg: AYBFou0xGqdkzSH2QFkTPRPiGkM2TmyMLwjilKjaUGDjK0WokSkf8FeSbDGjSBsSlWM
	5s3J8BJR8ENEK9QuBG4ZwsFNxApMnK7EAAoH/bbD6zccQvnZlpFfVFo72ImPalUoXsXv2fvrDsD
	U0dMg0kl3yASxZZxdbl9AkUWor7Cy6DDmq6EgB9f7vYfo4j2eLWfICw/9Z/FFxqo0T2Ot7tRmnP
	D033ntNcVl3g6OYSiJYoDYnSVz7kmTAXQyfADNDpIqmekw+yo56RAU8CvTddLWpMc8epsQb4Pvn
	18waUWZ6l6HG8nzJnP4cYgVn6JyU31WKEoa1V6WKCGaQ3VNiZ72m4qcyl5b2e2ZgzSzbjfI3Ey1
	kLHz3OyDXcB4prx9ie4yDxq/sunb0g9M=
X-Received: by 2002:a05:6a00:300b:b0:87a:861c:fed9 with SMTP id d2e1a72fcca58-87a861d03e8mr3404921b3a.36.1790008855340;
        Mon, 21 Sep 2026 09:40:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:300b:b0:87a:861c:fed9 with SMTP id d2e1a72fcca58-87a861d03e8mr3404897b3a.36.1790008854819;
        Mon, 21 Sep 2026 09:40:54 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe732sm3666086b3a.16.2026.09.21.09.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:40:54 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add camera clock controllers support for
 Qualcomm Maili SoC
Date: Mon, 21 Sep 2026 22:10:32 +0530
Message-Id: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAABesWoC/23OywqDMBAF0F8pWTcS4yPYVf+jlJJnHTCmJhpax
 H9vtAspuBm4F+bMzChoDzqgy2lGXkcI4PoUivMJyZb3T41BpYwooTVhlGHLoYOH5FZKrEujmGx
 KUTUSpY2X1wbem3a7/7LXw5TQcS9bCKPzn+1izNf2GI85JpjkSiimlKCsvroQsmHinXTWZmmgl
 Yt0J5q8/idoIkxBRJF+NKoiB8SyLF8cKzfcBQEAAA==
X-Change-ID: 20260727-maili_camcc-e4fd7c94b59c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX5jD6lpPhDsKL
 oTIXe/M6jKygcC/pZSH7WVtIgQ867qYJwHWTLfdVhxxFi5y9cbtIP/xIwI/eAPz5Pnstkok10Mw
 F2jk4xjX0S4HR/6AROqqPfAPDo/s5JU=
X-Proofpoint-GUID: W5GyGqEC-RkemHOmanJsB1-lCoIMRbho
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab15e17 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6kXFD9Q68pQua8COPXAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX+E3GR8U7Qliw
 ALM+esRs7J+842OGeRU++URR/6gPzNwYRy6ehqXQIWpA0ZlkCVkT0d8Nx7nr1aYwkuNSYXuyNXf
 gyEyFN3ZxAvrFIktjqJb2xTJBXTvyvbLW+QnFHw4qb40qhuY5OTN9LgMHip59I6xaSaqjjeSng1
 Rbr4xI/ssjGi/DX64Sh2KmdIMKhnvWyxUjnplNbFSYXL0wl9oyvhqQ07DWYIeDcSadVgqG3Rv2E
 Q1NQQPTXiYpXXh5YzWTTgQAerutlUnHwNsuTdv7ys7nyiT6why4Blh+BFDQzM86aVglbV6fFY0L
 u08g0ycqlA9lZs5a1pfMHPfDCK3fJsZnIJbqAS7PwD1/OkzUOcvADqmrU+cb6C3vL1iAyRpNr4P
 9li2nL9su8vmhqrAooStHZvkUd+GhmkqnQWi/MkcLbiWno4enTbTW03ZLx8qeH3wyseJ6xG9Smq
 QfsTd7AUaGtDlgZ8hMA==
X-Proofpoint-ORIG-GUID: W5GyGqEC-RkemHOmanJsB1-lCoIMRbho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210243

This series adds support for the camera clock controllers on the upcoming
Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v3:
- Dropped dependency on Hawi camcc changes as they are merged into
  linux-next now.
- Rebased on top of linux-next tip.
- Link to v2: https://lore.kernel.org/r/20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com

Changes in v2:
- Rebased on top of latest Hawi camcc v3 series.
- Added interconnects as required property for Maili camcc
  bindings patch inline to Hawi.
- Link to v1: https://lore.kernel.org/r/20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili camera clock controllers
      clk: qcom: Add support for camera clock controller on Maili

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +-
 drivers/clk/qcom/camcc-hawi.c                      | 158 +++++++++++++++++++++
 2 files changed, 163 insertions(+), 1 deletion(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260727-maili_camcc-e4fd7c94b59c

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

