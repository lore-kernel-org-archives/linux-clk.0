Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283ED3B6C11
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073065; cv=none; b=cnVaiJPiasUuIJcvX5STDd5MF1o8hUnrIcKco5qcptBvWdACpk4G9VueRfZvn/oQiE5N5l81pcW9vdpexpEdr9C/3JxtGktwBjhdWuCk+ujuoR5eP57aADcMoLx/HeyCumTuBkkAqkkx7PFi2VGUsFr/nLAhgNlDGN64ryFYdes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073065; c=relaxed/simple;
	bh=6IUDRPm8vWXd3Ap2chxvIhrLJKPJP1JURTs7mxhVP8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppLwqfJgJQjy57qT5HXWR032adQ1rOVqYPswBBAaS2F4Fq+byWqC28Dcya/EyvTRVbMEHfO8JUvl53iOJ5vZoqbycTkGFESJiR8dPgazvgQToAIWjQUi0WK9QEVDbMs/YaXEW+gvrQ4Tyz6J7jb2RjZ3eG+uJTEoyfXtDEFK0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWpgvTlP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqzQ4tPA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWpgvTlP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqzQ4tPA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s2983126832
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 10:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=; b=JWpgvTlPz0bQog+z
	NqyiIGfmu2cWZ3ArF2+0yp0CKPB1aW5cBFlIwbu4daYbG+r+wVThBJOo0TIUtGU/
	yLoOLXBBKVSzHPtKgK4fa/GGJrJPwvbg0GawNSZ6W9dTPUacfSaxdkLajZElBZnM
	f4BKDq3S5YVEovPWlDkVsMMVbhkkSfnBk8tcQb/rrH0e0QglX7TU2SGS+MG0piKx
	tqNjmuxgfmfZCU8VDvOqwYU9pzfRbGU1O9Yqa6rGY5dep7mWvYES2Ixv9HWhDRtO
	7Ej6N1myQtPuTXCHvMYTFpCWLe1DfjBtogtWPg5ZYXfDltC6+VV03E/0PCAuuktJ
	nnQKSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnkvyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 10:04:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so159318285a.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073062; x=1783677862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=;
        b=TqzQ4tPAdpsVI3x3rGHhKve8Vx4ttMGVop7G7p98HF/5OLMNsAwx6aemyuwHSBRFLJ
         tAhQFTBYwVTPy9FUqzttWwt1TyjmeWa3I3o8yLarI7uG7VzLARwrDQvhCu2xqcM/FVeg
         GeqjdRzL0ImNL8WrIdT9SNQ0LrT+EoZUQCtJSWSqSdHgERfSob4VMUa9i2Y9MlVblXJy
         bCiyjIduF2wkGqG9WcW38Wi3nFxcLzjw/kyp91ORCMcSqSZGJoc/3TET+NOamaaCBYVk
         vbv3jlNbVswk0y7b3i0/R+zDN+ixeDo1gghOXYsdQE8dmmHGW/qMdP4ObIKrsY50Ei+h
         VKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073062; x=1783677862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=;
        b=MwE9Gjqv9XXkGgF0/MDj1VObmmDLTV/MqVlooAhLFC9Gf4ea9VVjgkwUvkHJej1YMY
         fQQdb6pQkDRdMNum49vQcoIKCnIXJaFnYfM82UgHgRJ8XeGYW+k0NrA0/IzTfCJDoP+y
         8hXSl+pW1a0ez7MXL6PrnS5Fm4bZsOMcFbSK0/08JYKCiVM3JIXNCmDKRnWkJE0TskRY
         cj1fHt+0AhMJmEMrr0h7j0GrNj+ofzBTdspY2tNDvO/anXzOcBNtUiVgd9WX2ePPF+bK
         sG12cztz1dcw670QEypyFyWfq1XIo+JBoTAWIWT7Tpi8/1Oq1XbroLVtBIE0bQ85ZdCZ
         jT/A==
X-Forwarded-Encrypted: i=1; AFNElJ/mztP26EM/YsLkFImewkinxo+jYdE5Ud8OnHrcUKoGb+YZDdkI6t4E/hU7/SU7CkKufp9AmWJaYqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB6agNQwrcv2mcLCOg6P8ijAlVCYckKUuxxjpmJbASxYbEFc80
	Hso4cZXuwDUFaPEBR2MAbNyooLk4mUkoW9pyHRCrOY0axAQgLkvYrh7kDs/JrFtnfCvEZFaG/k0
	9NT7iO1GfzWJzZp6+meyCHiwmjzxt1HXqAip2eh10Xo98yeg/WcDkAfDXYw59MNU=
X-Gm-Gg: AfdE7cmy6ziNmYsOkyOCb50CySJju9+V8/p3KdSNC3vuzYvLCW+DJtcqufvbGWHsW/I
	LWrYLHPJH+cmw+WPJMZC1oILzmBBhgy3CbK+qaIlN5TWO/KsGDkdllXY222r/1xVehJJ+RuJRGc
	1fvEYBCMXx9PgAtmEHPobUEOl06FRqBY8WCHCbwShvLbmAjuDkGZwQk0UeOCXr2LCcDNHREexn/
	tHDZVP25bSRuPqC4goNBnRDyCQ92VrMMEDv4HcJXVBiO2dws0O2zSDQI3R1cweuFrWey6mwelgf
	Q0OV1ZjxhJKjbojUdANH4u2H91mlYJ+yRWHb2VlKT7Q/EQCcMHQGC/FUJOX1FoL8yME7TRVvUac
	FjaFUngAGH5/B2c5wSum90iYk8jJJri/ryg0=
X-Received: by 2002:a05:620a:288d:b0:92e:5b63:224d with SMTP id af79cd13be357-92e8b50a646mr388576785a.26.1783073062442;
        Fri, 03 Jul 2026 03:04:22 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:92e:5b63:224d with SMTP id af79cd13be357-92e8b50a646mr388571285a.26.1783073061913;
        Fri, 03 Jul 2026 03:04:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:00 +0200
Subject: [PATCH v3 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-2-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6IUDRPm8vWXd3Ap2chxvIhrLJKPJP1JURTs7mxhVP8o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kVqxQIqKFkGTfTuOe+2a9hTQwLHaVhoVBew
 UyZ6qrLjlWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFQAKCRDBN2bmhouD
 18BhD/9gxKiAWPubM37j9jOGrQ1wOEDTmfvOxGim2SUQHd3X1MB6Vbe1cn3BnrCgzayktB5J2h/
 QD8pe5JM1nO8WV9muwgZF9oez7XFzdWmgNpTY90dMybUcP4I3FIHgZyRsuce+0TT55yV5Di8znq
 byEBDJ3LECftpEV+CYfv+gIoXzqAlUUZlepmdJRqGjYsxe3f3UhHcx8yQgdZu2Du9CuVeQQOP6Z
 xtZGY0XCa7/AcwRmQnB/82jv92ZSg3U8bK8k2pifkAO/kBMrrzUKRwNGDHdQ/v2C6gDL7oJeqUJ
 6MpatpuUxCbLkahxjVQZHjEqgfmuQqt4i3nWcNZoiLlYrZzJ7wnxDU4mfcTjWllnU0C3UeU71b/
 Iv79p1CJn82HJmxE4CfLHk8oo3U3z1Q9For6whQdgwPBxVpQaWdd7okTEbeCYL6lLOK8+daAeXf
 rqnYuugGyu5JtmSkgvToOdQirlWSCzFdUPuzdrLSjc+03zqtA6jFVe5jvUTwFcFmHIgU1GrKtsr
 IVulZbTZtLZDF4cWICgoIdVdO1z3pXyHiCgvrEkwk+vERdajNJ6MhePKE1fDJ0dbGn9CfH+gey2
 M25aNpNHKY3J4bnuACGgupYsVcaVqekkUNPX8pjqmVbJKgQbhxmsujbIKKxRP6StPcRVnkawuAJ
 AcE8MomTP14zgAw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: kekIrpfUYW4SXUQcxrutD0peCQMvtlgz
X-Proofpoint-ORIG-GUID: kekIrpfUYW4SXUQcxrutD0peCQMvtlgz
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a478927 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZSuaVHzWtUHH4nz7hFsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX58NQzF3ARixg
 5w5mfEd5nE2eD8Y9FuccIW16oG3phKDYG0E+dT1tpVvAGha7CYxoAOvTUmYnOY5jIgm2RD5fkjj
 a8FdmugXvYF2JJpDxS9ttu2LXubce4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX3kVD5empg+5V
 spD6KFTv/lodE8ooSyR2TRg6ANAGTpd16bQEwpDXahMsyWm5UJyAPzkfk6Yog89Am08sFTiqBc+
 N6fpB1aI/Zbxxhnp5dlZzv4/5ZiqwPkZa1S6JCzQ/ViVuBicKBIZwiIlfMykdzYuar9OMJe2td6
 t/bC62FjNAI3HRuqkxVkMVQ+7dS0wL+JfrOg4C6Ae7BCJWYK7vpZ+eH40QYa6HqzdtE2H07eTwM
 CikOZ9Pz01Xz6wdRe2rDiAMCJkptwjiKcfHKoRiEolxstm7Nss06HMFGDgTfyOTQY1GA/7i5EU6
 mWLbS4yrW0NbdRd7sPdj4scBRljgW0Xi1/D0ElOO/Sp/IALyWDn/3nQiqZhcDaSs4J4KK8y5kVu
 5PwRCKIPQFgM15Hutmg716cVKT5H/D6Pzewj7VNQ2NMG4v9y/Sc98HCqZRnX19U4D6UBiCh9TTe
 41h/cI2darEXZ0xA5sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097

IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
SDX65, which are 32-bit as well.

Do not allow building them for ARM64 to make built kernels smaller and
user choices easier.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d4f80c6953e3..f07455328e5c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -250,6 +250,7 @@ config QCOM_A53PLL
 
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -396,6 +397,7 @@ config IPQ_CMN_PLL
 
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,

-- 
2.53.0

