Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6D345CBC
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605500; cv=none; b=i22T5vAv3DiJolUQ6b7ldgljpJjUJ1CbEOLpg7sw8Oc7s1IlNouzTmrOcK7IhVkw5X/3Q4plC4j/U+MpscT5CoOUOBboAajoKdJqPQTw9XIK/c3BX138R2R7AxE10OMS1wmpwbGPszQix/5GJpsA6USAKLniccnnXWji5QLeN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605500; c=relaxed/simple;
	bh=8zIKtWkixYnWKaNS4ShLPwBlu4JArri3oVb+gFP15Eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jNdtj+BGs3cFadraKPsccwWtCGv3Ff10FsGlJIjTWRBoCGGaobThjqE3Ru6l+kMhpph1zlLLmeDC9DViZvik6sCUnziKeSAFhdK9OlpyXwNhkRXlZWnXSP0MP8md3jSPV+GnMte7gr6BaxujqvXasgDpWSzsjm3P7Uye75/9clg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwIfCWBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLuAPhXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwIfCWBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLuAPhXA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671FaaID3814699
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 17:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gMNQP3NsH6b5dYLI5Edekz
	3dzWCbr978ac4GaUxKlX4=; b=GwIfCWBRjT4b7efILdzqAX3FaHZHv5UVv6zeBJ
	mIbZttl3mwc52dj25pYC5nkkXwzTJQb8ySoC1/clovk1tzudau/Gtnedc8ypMjwB
	pqlwTx6ymJK4BbQzuwWhor4IX31MslYAqjX+TjXybhJpnffDNm2Gf1250oCyUm01
	KmIf/gw28CCNc+sAPcCn/vn+3FQ7BL3wr96qld+EtsI1b83O4SZqjzxZoK8xivWy
	JH1WlQo6p1A1OiPI1a2Z8r0gLZoluXSplPlClmt3ktkzOF0TNKIuDq670qg9IH4f
	8SFy1pHW9X7N2kYDBJPGfi9pWKZz+MCYoo1ihtOicuSB0qtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpscd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 17:31:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso1239664a12.0
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 10:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785605497; x=1786210297; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gMNQP3NsH6b5dYLI5Edekz3dzWCbr978ac4GaUxKlX4=;
        b=dLuAPhXA6TyRVF1qWHhwP46c1Q5+TPsTqIBqyGQt3y2v3vj8WLhcO/vJekAQZpki/f
         OKXk6sq75wdZD2w/eK7UoYtedFrMsus42kV7ZkqCxz1ryeqML6E2Z1Suo96TjX7lMIgs
         JBR0GNnjgRqPawmITXtdMPrVvnbCLiG5hzqg92zJ0EIGCGT1hwWD9/CD9ZVF9gZC9LlZ
         nKiZsBJHyIRapzmBH99zrjJcQTTrQdEZQHFZROR29lppMoiU/PkGriOgJ5N2BQXfy+Wa
         DBZ/WHFXIiEi9VIJCMbtmZpkdze3bR0uK6ymBgeIm+F6twICxFbX4CroKb/9biw5BweO
         D4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785605497; x=1786210297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gMNQP3NsH6b5dYLI5Edekz3dzWCbr978ac4GaUxKlX4=;
        b=JciKnb1/vtWk0L++2AulhQWTklZS/oZ77KIXjLAm8ASiptwYMPAaJ8ZkszLJBNp3CQ
         IMpzF5x/nZFhZ28h9Q+1N4Q03gxOlA2QqtTmqkUkTDY/+vH+aluMHZsVzBPEnwMD5mDW
         P70pP9l6xt5mqmKDohPQlwG3JdJf5UtQ6MuiIfXG4b0VBG2cOQ71JHoP6CCT4AqMDgzH
         pWRjdT4k3dnaTVsPVWWqQV/lQpTt+NddA1o87avRv5BrZtrK8Nmv9lfewWpbeZ1c2wIk
         XlOe1Qg7fW/OuaJ74KBeIp/9zah8X7CkGtyHizs8dZqZ/TxPe7PWy3AF+V+sUbvgXcKl
         fXXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1w58D/ks8rFM6zdBPcCI5tge4+Nh/UtM2eSayvTD4XKKQPfahDiTpo+7m7hNfzBNoAPrRC4XHUm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0owYuF/l+Qo9q7NdBImHf2E16U5p9OLSxCz9qCVgkNKE4iB/
	zCgj1p82/GS2o1Ff3ci9+XIesctgs8gYWTJCR/fVG8FVmG0eQ3GiCBC8IWYrCpEIIBBRpZXEkvB
	wNEjja21wwgFQdez7rYPkQ2LIKVGTyeWlJIozGD/aVeFDJKmp2u3OIIjKjRuQHfY=
X-Gm-Gg: AR+sD11srsHx/gQ7UX18pHzEfSLV1+TSSrOcj83kNV17HHim/pkANocyuie9AQN1mVu
	IHUKUqrAh+V9mHIpp1PEG28suAXPSShnjn5EFETfmadDS/eZSWnezSM+AoUULTFvUnqBbRSjXM+
	oZR4mgDGJGqXN1LI2Koo6nhCzkI92t4jh4KRmzibH0s9A+yfPEnunHVuH6z4ipZh1/1MSpAgIpH
	GTDtrIfGz1gOFW7jLaI8fNY4VS3olmh/oBVIj9FCs6wTQYgLkESuSK9nUFpMZG86nGIIEpq+hBj
	A+Fmu6qvQCQuV2GWqoF8cH3RNO9ARRsqw5xY6JULc6iCqbWYmV5eUCTvx6hxf7h6rUyScA5w6Wf
	OWcnZG7/49PBmWR0VBVBCyvHi
X-Received: by 2002:a05:6a21:710b:b0:3c4:4297:d5a0 with SMTP id adf61e73a8af0-3c92a9c710cmr4181381637.40.1785605497553;
        Sat, 01 Aug 2026 10:31:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:710b:b0:3c4:4297:d5a0 with SMTP id adf61e73a8af0-3c92a9c710cmr4181357637.40.1785605497142;
        Sat, 01 Aug 2026 10:31:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm21865553c88.12.2026.08.01.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:31:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Mark the GPU CX GDSC as votable for Glymur
 and Kaanapali
Date: Sat, 01 Aug 2026 23:01:16 +0530
Message-Id: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQtbmoC/x3MSwqAMAwA0atI1gZa8X8VcZFq1KDU0qoI4t0tL
 t9i5oHAXjhAmzzg+ZIgu43QaQLDQnZmlDEaMpWVqlYaVyJLjjbB2Z147QeT2RjzouZqMqoaGg0
 xdp4nuf9x17/vBwQ8G1poAAAA
X-Change-ID: 20260801-kaanapali-gpu-voteable-458e7fb07c91
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX6P07mzvfkB1e
 +Lbj5/lDykZtCWP5acYsqeWlhYVCKSyLBJQDLJRaYxLxvjqNrpRsK9EOFefqhRssOhWoumaAmbJ
 47R/covHP9RVzcE+h/po/nub7qlFCLREmFybZFzW13UDSO5h412Eny/rONtSdn/R/Iakqrrn+MV
 1PIj+Yb/2F2fx9X5zVV3cLukLLA8WfjgK+V1OpMl69VyH0hfJ/o8GlCEZtAxYTkEasjNUzO9V+J
 rVbRu2q8JdbJnLulyPtKtrq6X/vR2pp1il5Dl6ndgLtgWefA+drRt6YiMIFBEzlIWjSOzPveEk/
 yyum3jjM+U6vJmq+EcKRb0RgYrTPwufrJK/jO0KS69qALgL/OaTUiNenVnHrXeytq/fgeHkeY4A
 J1Xes/t2aWsooOIGasnjUJPUisXq8m8063aZxZy5SyNQ7VsMYvXfYl59if9Wt/w1SgSw6VSQEfm
 3N3vUsaA6oyhKUyjDZg==
X-Proofpoint-GUID: RaPtA7024f2Rev7yZcjRv6UMoMgIcB3R
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6e2d7a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=a-e0-BfYgLFPZv1eouEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: RaPtA7024f2Rev7yZcjRv6UMoMgIcB3R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX4GeVOMohHa/8
 wLKhqvZj53KtDKQIxbEBnclMozjpJ9M0hqAMimblYUGKofpCGTlHxQoylWM1Juby/muJ+0Dv1VV
 iZsJwFneIFw0Miw+fXP5Rtfrw+Wvzug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010141

The GPU CX GDSC on both Glymur and Kaanapali is a votable power
domain, but it was configured with POLL_CFG_GDSCR instead of VOTABLE
when the respective GPUCC drivers were added. Fix both drivers to set
the VOTABLE flag so the GDSC driver correctly treats collapse requests
as always successful, matching other platforms with a votable GPU CX
GDSC (e.g. SM8750, Milos).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable

 drivers/clk/qcom/gpucc-glymur.c    | 2 +-
 drivers/clk/qcom/gpucc-kaanapali.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260801-kaanapali-gpu-voteable-458e7fb07c91

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

