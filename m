Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883847C11B
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875406; cv=none; b=fzLjjjaV5/NiK9vGWWVbzRWUf0kwl3mCIY/cttdVd12/Z1gdbcDiAk61eL7184zvRhmv1UtVLbUtupAWGS0KVrlHosE8Y3RD8vJ0Nqo/tV6iU7EmNl3zdjmVG5TpsHLl+UrhBMomREi6ekTTneTeSZHfe3p8NYXST+SVZIeUYp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875406; c=relaxed/simple;
	bh=nmI30fUqVCpCFxi02t5avDZqwUXNluqW5vIrqB2mefM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KRVVw5UlZ9BAXH1KpxlotnUu9lK5HyJeU5GMtpgfPjeTGDlGuEWk3ffNIX9htdAnCYEHM8SvRuSqqtxTPXejnStzDFJwnrHIm6zAbn7Te/gDtrmdeAOMzFsjewtIYoarB9Nx3S7Jk8XwGaxPz54sc9avxJvJEeJ6jwyn5QtaYWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YalTV4DJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAf/TM/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YalTV4DJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAf/TM/2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CUhO949467
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jTJ7ttvv6RXcjrHzxgguvw
	Xv0PAtR9MrUXhp1lcfF9k=; b=YalTV4DJXKLnh8iH0sMkv0jEn03HirkUNp0ooX
	jpUckRKxuwYvowpKeFQHhT69h0IPk47fm90fDghwUD4O03fMVNTExikcFOUBulLT
	V+B4K2iJngc4IAypjmfSU6bq5iMFW91+eb44+Yb8WbFDmVc3YJ9tk5VbyQxCuJRO
	Qz1+/u1oIqiZcZ4omsPS8CIFmEYk5xaojgby5SfYEZ/A6A6ixvN72e3uGkyYJSW9
	HEutH/3RodjzSYCnTBtOavKwanpkaj0i6XiEtq09ywSzAWEbt0h7FyNteLDHyjtQ
	mt5WBYLXGuyeJWpZIVcwe8hoRI27xj/lMaf1Y3vHST/3o2Dw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62876c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:09:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c01f3ae4eso2811674eec.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875396; x=1792480196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jTJ7ttvv6RXcjrHzxgguvwXv0PAtR9MrUXhp1lcfF9k=;
        b=HAf/TM/2CkHrJnjsvFcnmv05Y/LUXYLVlcaGOgeXV1gCBNeHZOisKrcU9JBh2ZHfm/
         kmMDMuWpTewyJzWffZG7U0+eVfAj4AvLHSNPFoKHOYFybpdGZsqbXj5BsfLKafXF9h7g
         JUIAi+KNDwVTESZ92PhvyhX5U50IA7lGfMMj0HbFD0UlKr6hlj2kWCzzBezEkAZTUi/E
         +6rw6JzLkuUChjrM8DoT7xUx1XC+YeFyn20b9ajPxHBHEP5OFCn3LZt8hGIAZzZPiM8m
         M410gqOYhKUoeraJUXP5HHJtTqhLHISElMlyuuImuzPwCpWLuapeW3UelqiYX6eWFZT1
         T2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875396; x=1792480196;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jTJ7ttvv6RXcjrHzxgguvwXv0PAtR9MrUXhp1lcfF9k=;
        b=mlW2qg9Bq5ofhA8i+ae5ebij/BBW9zGW1Scgfqcq/Muui70LQKzL6e+KDocR2WHnYg
         m+PSOuMoVz4LA1GmIipgdsnVh0Wx+ZTuleYu89Qzn3ww/cVvds4lr1v4qm4jPETEs7kW
         A9khWXfaiztryWNfaBGF07KBDah99Www4saKSLKzANuRd1TJKcw2UppE7oghNCGknsLj
         zQwSn37isIqjKK3lfRWqRZEz/Ivxy6EvCDwbx0KA3o2gKY9aksCkIW1IG9Bxgftq56hC
         3644IEGyrduk7SSXlAmI2TZ2+JUrBBDy7gINuUoKb1AFM77JFUY+I1+dSzrh8Nb4KsLg
         yLFA==
X-Forwarded-Encrypted: i=1; AKwUvBxRcg/LVzT7rUL5E7HNAj46j9xgzEfglu4AT3LI8+mA8LbakqwvvO62b8r5v+z2+Zy8uDGBdpT//Jw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8++xLin5NFKj43HE/BXuNQgDl6j9Jfnri4MZ5S29kaCi6rdF8
	JlIRQCp3dU0jhc0aeQo8jAtNnyPoUhRax5kCC1Q7LkPY8jTMKjIaOo31zCFnmVrPoS3wv5ynyZA
	zixrYRovslnvobVbJYyGQ659LSoj59T/PtXqAZ1lyZfLxRKm3LudNuPWwM1nV6iE=
X-Gm-Gg: AYBFou0Y99/UELwwa5TavybLsn8PIoF3bCdxXmAgJd7iEqDXaxm7F0WYfhniCTO2Xnr
	yDhDxf/GLcBWhFkDHUqWgY3K9xXIu+kW7OZ1Guyw7w7jms1NNg6WNmfpF+qjotVpMhUtApPfUMw
	VS2YmIrWmQGjaXOw6w3IWE9fqx7oNInkSvyVVQvuc009PkKwQp+o5PWrsuEqRmlAoYi8iTyDuVJ
	tCnDjwkWY3kC+PSA8z3VOYHnWFCy8yOP1qRCAq68IPfynWLuf44PK2UHV2Wlz2EwPSNGEiPMjci
	iRPMlCOHJDfL8wir3K0sSk9Y4VEGwqJKjHhVVwI7uQWmJDRaXImxoBYaXfEZwGYYfDg/YTOa5/i
	tVTRc3Ojwbv5xHyQpWpfiu2ZWGxeB3rz4SNXdPhcQvYFV1zS0+AKS9NNsMcp5GELAixFLqxBVnh
	OZtgUKBcka32PLh82C8IphJKg2XMuHPg==
X-Received: by 2002:a05:7301:77cc:b0:357:e9:dcea with SMTP id 5a478bee46e88-35700e9df2fmr13673118eec.15.1791875396347;
        Tue, 13 Oct 2026 00:09:56 -0700 (PDT)
X-Received: by 2002:a05:7301:77cc:b0:357:e9:dcea with SMTP id 5a478bee46e88-35700e9df2fmr13673046eec.15.1791875394852;
        Tue, 13 Oct 2026 00:09:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:09:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable icc-clk support for Qualcomm ipq5210
Date: Tue, 13 Oct 2026 12:39:42 +0530
Message-Id: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbZzWoC/y2OSw6DIBCGr2JYFwNUqHXVezQuBMc6SSsKaGyMd
 y9iN5N8k/+1EQ8OwZMq24iDBT3aIYK4ZMT0zfACim1kIphQnPErRWNoIfm906VSqmxJVI4OOlx
 TyrOO3KMP1n1T6MKPb/IzyYvkx3GSgjO6cMqoluzG2k5DodjDep9Pc/M29vPJ4yH1fuY7mOY4L
 pwlRDce6CHCUGUDrIH+B4ro2H9O7Tor1gAAAA==
X-Change-ID: 20261013-icc-4519fb86668d
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdd945 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wl81dVeC2YmWyYG1D1AA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX/HiNae79L10h
 3loIZRog5uR4G16te5lfGq4JujEmcwS7KSCa3R5BDUuSpHpP8Eb2Nbh6pBMpstEYKfjE3M1ZmiH
 df8MInVpSOYq/UvYcnSx9tjeM44qK+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX++wbZcvZ7dXS
 3aV1AiDx4BGmIk+D28KNlFB4eZlpr6rhuxlqxx2zPIWzQ7qBgNnuoDntASrovSnr7k0wudVXp0t
 1XlWQvZsqRjI0JrdaIeESJHweqes22AG+bIZ+YJCAcb/FDoKsd369uVb8UtStXDjVrdSRQ9hq/Y
 T0Cn5dpVLMawcasIGm8Le3deKsrhaL9FnUZcqNJjU6Ff0hzGJhYRKvXg5BU4rwBlpAfXQZaUCo8
 y2le7IB7WTcccrvyGf4SC09j2pIluA/ywh4Fr00rSAzOf5yqAkd+N0CsAopRiO2tlVIX8NB3q0e
 0eeYeJes4VXYltPlA3BBdTpiIYMuk0zcZNskoO/2m2duz+wt5fr1yBuIH0nXKTeqL9F41rxmlkI
 PiRYjTezOJm+XtsAOUtf6O56QBXdNsVnL+DkC2BZEbu9pCMFTNm3lLWT38GyaxXL7cGssYJmwAK
 PBnLeucYDq/4TYnfxwQ==
X-Proofpoint-GUID: FGXbQGXikTWqS9wQL7VtP3PFg93ZX8s-
X-Proofpoint-ORIG-GUID: FGXbQGXikTWqS9wQL7VtP3PFg93ZX8s-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130028

Add relevant master/slave ids and update the gcc-ipq5210 driver to enable
icc-clk support.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- No code changes
- Rebased to top of tree
- Pick Reviewed-by & Acked-by
- Link to v1: https://lore.kernel.org/r/20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com

---
Varadarajan Narayanan (3):
      dt-bindings: interconnect: Add Qualcomm ipq5210 support
      clk: qcom: ipq5210: Use icc-clk for enabling NoC related clocks
      arm64: dts: qcom: ipq5210: Enable interconnect capability to clock controller

 arch/arm64/boot/dts/qcom/ipq5210.dtsi           |  1 +
 drivers/clk/qcom/gcc-ipq5210.c                  | 16 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)
---
base-commit: 5ed59b3a5cb64e0ba357275df4862258e3872c8a
change-id: 20261013-icc-4519fb86668d

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

