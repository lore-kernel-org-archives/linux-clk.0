Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740449483A
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390214; cv=none; b=CJX318e9wcXWznZE9gLfZqKMfmRx7nRgmT6OHIsH4HlN1ucHgyF0wdE4rwsqlSBFuDyFqVa6pWJohSyQHREjbOaZj6x3+UTZx6SasIqM/4zB1jGt4JYPgAI1660R0p4sX0QuVLMQpfYRy8w0LXmwE4OXnDLbKB9b5RRLOv9mSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390214; c=relaxed/simple;
	bh=f7zFNC7Ga0KARgEeV11nyncXAlnMUFUz8jSYYAfcsMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCE05Q7J+fW0F35pbSoJWIuZo3kUgaoh2RbAQk0rydL4EHRDaSYnGDcjChlXA2YSs8oIH42R+aK4kmrkMGbh72KO4rMuJ1SP6lEnTNDSHRV73XULN1Fnd86HmOG1Y/n1nyFW0cFv/Cuwsn3GrQKAdrHsHA/sk1sU+Bc30fFQLLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3TQFPz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVv51d03; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3TQFPz9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVv51d03"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6Er3793274
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=; b=M3TQFPz94zBYJC9l
	jUIgWFqLM5JiOL1iGRf1x0sf+OJVEwcUHFqBe+Bi2WHbfftySXq1NWGWZGluV6S9
	sbH4/unqGJfJ8kmvoK5AhLZ3iKRlsypIc2obtKPwqCD4uk80s61YWR4Uleh9+CKp
	ou+asqXeknIA+aRze3Y6WDX0Mjv64uzfJB0Qvd7cW4xbqPt/BCsZCbPh97Jhc/wP
	gT2iNqg5KCMWNIKMqdanllnV/G1pCaoS53R5RGDJ9ODHbvMNMRzA+ApKHCXE20a5
	xqqTSxxATy+6R1WJ9N+52XSLvHj29z7gOUnCO9SUq1Q0BQ2GxTe+1r65+go1bo9C
	JskgvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg161x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso557604585a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390210; x=1789995010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=;
        b=iVv51d03A4zXpa+QBtVHClrENgWpdy/TtcfNQ6ICXPji0TGnCjSpdlxHXwvShMzSxz
         3yx4ukB4zztdJbKD6kDZQQmAJa84NuyI2thLohJfXOrKZ4yaKx70fft+zfTMvweUl046
         2S/QJxoV7ZmBXwfEbr+qk4DzJX7DkdL468snl/epRV4M9OOCHKgdA+ozepinDS5DAj96
         O8xwGG10CbiMOdLab+LCrIkMlPTofW1KjXFPz2X5EIAgcsbwRRQR5x+Dn3DYx/1Sqf8x
         Ke3m5BmhqHLaI+wVLu68K5AfnV99eLaejRXsUNpuLZ+r5EuPh0r+hrcD9hbodmSAixTG
         ONeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390210; x=1789995010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=;
        b=VjXBpk1FIQdGGQXj4DmPrxkgStKiK5WZjmPiI2zvn+0s/4yUjjjGj0BMoZoaoZPBnA
         U3PPDzok/rJM/UJVEd4aV2/zKKAsn1qmD0S5BIbQ5nQIpInIMTIJ3DtO5H1dTqUdrUXX
         dlsLpv0MchDGkeJkWSsUzjvPacZZY1FaSiDX/H4EJ8OxPOsUo1+NMABcj70v04N1erO4
         q+Y/RIIVoJlps39l0Z3QomiD6NXAfUhXdvcdB6xdTvqNewbsSpTYQuQdDFbXzS17Hutf
         4ZKCIuBHW0V3H6RVM1P8DVvP3qdlEVvTRyruNGpomjcj3tUA2HzflrfZvg9+Yo3v3Lh7
         0Xcg==
X-Forwarded-Encrypted: i=1; AKwUvBxyOFMPqLHO6Gyi9Wyc33H9sRFvpnrFgJDA0OnMK++AuiNJ2P/wNGC0Uve4zlb5vtGjj6PNGXMVRFU=@vger.kernel.org
X-Gm-Message-State: AFuF++lYWSYYiuNgr7UOhljLpAwPJEdBMYz4LeU7W87s/O46YCQk5PCL
	q/EQRzaZYoC1uuvi/uuXtWXPanUWFEfFzrKnNsWp9HBMQwQ8ZtsEA8ssGC4FQ0y4kWnzKmj2S79
	TwpwmwGMeUsykKwXLYKeRY70zCibHntRdKWCUG9UP2w0jE3pTpCxcTriJNUei3nE=
X-Gm-Gg: AYBFou3mbAYFZKsZLXVj8INr3dIrc6tonpijuEWYyin4qVoWcL30Np6n+SylgjJKJrg
	uozPpvzW7fY4xm8L+i5lji6rH2T8HinM+HxnABA5xpRJTJOoYBu6pUPfE+roPzQYyLhtq4nlIlf
	+O4vmgrlEhvH7HRPihAEaHFDTaRCLsXrFEIwtr/5Q5xT4tBKGB8By6hKommX469p+/Prq4C+9ac
	Z73yv7lTcELQ/nxjWBInR/mhpYrx8hjxqw+m9GJWvEBPjM3iiY4M5x2JhMagrWGzesIcyZtL56k
	45zCgeKZH+gVb8YzPrn9DUQVqmiECBhSBJ9mEeGhM+z/GvJCbKuksQdfipgDh9khWrX0GcYqyvo
	TgK2XIDIw
X-Received: by 2002:a05:620a:1a06:b0:939:c0b3:6d8e with SMTP id af79cd13be357-93a299fbed8mr323602085a.30.1789390210101;
        Mon, 14 Sep 2026 05:50:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:939:c0b3:6d8e with SMTP id af79cd13be357-93a299fbed8mr323591885a.30.1789390209513;
        Mon, 14 Sep 2026 05:50:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:47 +0300
Subject: [PATCH v4 48/52] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-48-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=f7zFNC7Ga0KARgEeV11nyncXAlnMUFUz8jSYYAfcsMo=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGqn7Pqh4WKwQTP9o8/PuBM67dH/tK+AcJjQ6MVQaEnHhDZeH
 4kCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJqp+z6AAoJEBtfRMkAlRVWtqcP+gKv
 /Vy/OQbFtgf4SYt1/KOxi4Qzp/OtP0DL5lKwqmrKwemvnZOYhBrM9e0x0Zf5M92wtlqwXUvjyjk
 qfJC7a9eceioomofVaEbNPbyxclkKQd8HIphOsHh6QKcHCDG4ys/rxY03M+WTnjq2+r+NOAN9c1
 tnt8B2yyrXxdY34Xu7E7hJMP4vtHIxXPA9kvNJFiWYRAwfVA6glX32dkhNnxXhSltH/CVQRv4M7
 VZ9EnuiPByw8sDzQHSwM9OguaWF/dhAyvxYwR3ckp4vcqE1ilHs6ddmnC2HdLhmwIG3lZ2keHZx
 eIrSsZQKDsGvQr+5wn3Xf18wYvvEgOy0R+kvGPEcPLMGo+gHBCbofxgZyxBxHt7S4UlY29P8ECy
 U0vapVl0OVvew9RvF0aWd7yXiG/WAPlA6HhhiRiGXW4GBbrjzMbycEWefJeB/jD0Qzuxi8/ncTw
 se2c/A8k1jjn0+aZWriBGDZt22o+stz46v/Rh7OMbLwL9YN2sQK4+q7K+1Dn9bYiN+m7moxzHb3
 i8ozphccH50bFHmXxgASFKfWDGSkI+tALj1XbsQ3maZYk0HizlUkCFEHROjZxCNPFTZTezFOrZE
 /nmm0g7EPlfMN4IP/clM1wvLTNHid+CWoot+Bn30PF5ipt+he8yoYWBLFHga4py+MMpvgr3Hq0g
 TzE9K
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed83 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cMt5CT0DYXTQOAQHtqMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: hfTbLcyobTtsJsw4LSR4qmZ5a0oFddwV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX8UlUc7nhdKA+
 D7l8gEU42fdli3sN0f6/LvgiCaDMVPK/CdfRBXwWX3toVvBosq5J1TZfUJy7IYRFNA4D/CcU9qU
 7DxznPYyuZYD0+aqfMevNmIOSYC5KN0=
X-Proofpoint-GUID: hfTbLcyobTtsJsw4LSR4qmZ5a0oFddwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX8MklRTcuo4M+
 2oQGc1QW3UeA4QidnxZPQD+mp2bb4k43egBfZkeZorXitfRerGu3xyeJcdIeV4DtyoP04g0SAvV
 d1mXcnQYxZDGcHn8M/7rlrT/Fy0xh3TX8m4O8GFCa9fyW35A44XulGpQl+opHixM4MW4eoH+7/H
 grcNqF75X0VmC23rqq1ENyChTNqXYXyYhNJuy9kKW1ZgwjWNKT13p3gfKgIDftgbeWVMmAPIS7a
 ZtGuh3sQjTEWnCZxeOY7yMIhkvjZ61hn1JI1tc6wYXRFimPJou4rMHtfnjk9AZRoOYcoM+GeVQ6
 oZSXQItdZn/45Q01rGvY1GU1dOgB2dH/3x1K2a1bA1fA1ixMeyRyI/qv5SNQNgW//PwSEnYbBck
 oEqjQ/Ixm/LU0xXPiuUFV8bDl9gIVaA4amBAMjiVBNpNOp4FLP9B0ICdQJF9PtGlFiWXI2/Rq2f
 C7ViaaVrmclMnF/0E3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 484ec8ec8c10..1af29c5476e3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -941,6 +941,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

