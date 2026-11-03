Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699293;
	b=IE0hHbpxdLetXJDmrZ16kOpDGolKH+GRxlT7uZRWKPVXi009g5S1X5LR7foMbdrBFUM4
	 rv5x2+J6B/1A/HX+aEpdu3qTlnIF8NANpyThu8vdxIW/ucZr17O+SkzMk/mLJf5csiCLU
	 5eTwkpyp5kox59bHtN9534s0oKypWVSAkVDM0t4WCwY5Vh2pBe1zEGoxlOR+HKgdBnW7m
	 EhqVJw98Y89B5HBJOeXCwHsm3vpXGKXIbktacefqQi0rqmkJXA2kYQ7iFD9Pny46j1z75
	 MyUyjpMohXtGrD4J+cM/9D2FoOjV7LITOBqTPqBeMhmNTHUgHDNN/yFbGSQpDbVcx4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aTbiAOOXIcFT+/lo81vU5cq1PuTSUe4CMWmyUn2ZLLc=;
	b=FkdkRlyvAe7LKa8x0W9r0kOHKHI9rUlTUi+zXwyZb5UuBaMUG0/0cXXxKQ11OHM30MUZ
	 uSPyUp0561ZAukOETDCYPubLmmXxYPZ5yBC6aLRMF907vOPGOnrLeDA/4I7X1p0KoDJvY
	 XPTKzSJmkUk/9RkJFiIyM6PXnDu1MdeHullPljwDYVPc+YziI0h+rRchGs1p3BDjnISmd
	 g56iOqXF1IyTzkzuQltlqe/Pd3CF7mg8KvESynosLGaac5TTQQc0QwRRdXsGx3Bayp4Xf
	 Jwe6AYKUbKVB+EG1qzPtmNBwSnBRxEIYH2lAZgM5BUBQnolXHZtZOq/lNUzpQ5p/Vfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+Sm+9TW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1OrRgGF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54896606A32E
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 09:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54896606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+Sm+9TW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1OrRgGF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38QhSt2106811
	for <linux-clk@vger.kernel.org>; Tue, 3 Nov 2026 09:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aTbiAOOXIcFT+/lo81vU5c
	q1PuTSUe4CMWmyUn2ZLLc=; b=O+Sm+9TW4kMoojPk4O29eFTxPJdAvkuWlZ5R1k
	hF9SdindCTK03jZ6Q/EjTTOEVIz746+sRBMy6srg6uSNmOVyTuG38ggYAz9ikC86
	AFnAsrZBGEXlsNSoWUn/PSsZXMGWTSNPMt2dTA+FYB1oQZpJO/qpOApl86/gLCNh
	FSeDfiCu2t1bXmYNMqzUvjy9d/bDwGliOhyytQmH1hQdnSiubAv3n21SsniTXvY8
	BkNruMCpYHzEFQmMY3ouK8h4+NnZMjvipW6A3djGQc8IFgEupuMJ03QqZ5h9sUY8
	6m/D0kjimTN2dprotfHqxsDc5ZKvJTRTbduACmA2MbmP8ZzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99m33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 09:48:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso753554985a.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699291; x=1794304091; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aTbiAOOXIcFT+/lo81vU5cq1PuTSUe4CMWmyUn2ZLLc=;
        b=Y1OrRgGF+uS3ui7rDq6N2jTSD7yAjTIOsqPHK4vatsOGEHToVE8m6IozjcNCi3IfJB
         jNDCqggmM1kPlI3kZF+7vyWIHiCvVa8ymZX0OerZT1nL4/3S18tnmVM3R9DQW3nynRo5
         cAKjwVaEBiFnHnxjd5zbQK+g/CF+TKIAkOH14O4buR1vpU0YihtmPeKQoXvxdsoR/3Aw
         3+uDI3EiQQklF+Ss6e0BrXIDuD3PbInedA4x3jksjUCE+fd2Gr8tYVzdRO8ALW6J9x92
         E4+RcXctuYVPjiFyEcaNurLKrgsls4Z52Cg6stwcZLj64hNyh6dmIWNIYbpygMGzVvYS
         tMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699291; x=1794304091;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aTbiAOOXIcFT+/lo81vU5cq1PuTSUe4CMWmyUn2ZLLc=;
        b=C0iKpttlrSbXHdJFEkZyBzyXKTskflAq3cakKVLMUekx/UPRL9j+KMRyD15ZIRPWt+
         x8ggtUlFb1j3emcI+vt+dR3PQFy2heOkwnCgz4QHwpUn4kctKqPGRG4KDpzy89DeGO+c
         cJ0d0+Fq536to6avnYS9IS7mc5+Xq1SyzxTpYFczML4dqUJEvEEGgBb+/BhXMLwbvWGy
         sKLqkxYFfQKcT1zxj+Aj+fS50wsaZ9ILacV8xdolfMZjzkA66RObOKjpiM8rBfdr1EZQ
         cc9iPnYAXLqAD0l8fKfOXb2huu/UqQRV+H6qoTBLM/sk4gSYUbouejfmR3vjefwp0rfI
         9+Tg==
X-Forwarded-Encrypted: i=1; AKwUvBw8LQSsPfJhubF/ZZxxn7Mo7Eq75IGIj6GNSGrVXYqy8H9lkMqmLhLRkHg2Lo6cprNcZgTh38REI14=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3MG8xBVMKeKl/+pzZAuQYirmJ0XPGVR7WMu85O2MSxomEB7rl
	oc/DvzTQ3eJjXLBFWcLzPnkbk3ANHT3uhm3bHMd49xNEz+1MHysNN3L3fg3K62u/9ZtN0G478IN
	2IQxu4nbQkPjJfCzb/z4qJ+K3hJPqpRo6ZTUvjlMFikIs6EL62MXUF0athLBzwosWAXQPj4Us8A
	==
X-Gm-Gg: AYBFou11Qc+t53yCA+jDdD+D7zEF5A1S9POonUIOAGf5ZeqLDCNLkvkcaQnFTQKcmWa
	zNRaehLXL7GlWKPTlrFN65hWpK6QnHoFedkRwjgsOmgIniWw0luDZXXza/quEPEzk+Ltl4AuMHD
	JCBSy07uuBGabP7I1EXot9k54m1QZQDUkVqWi3THp49RLHHTjw/mZGd6gv6YYkTiRF275R2RMs6
	F5dml+eKNBZZbcA/WxmzY2kxpGl4gcmkNNvzb0OScLtAs5R9epAwhnhGgdJnV0uCWvLfuhNjYPq
	WPSCQIAQ1wIfFLjsknXz5DfBygRIUpBwfog8+IS/v74dm64iLHScwnaRh7ZyD1Ny7se5O417LSI
	CwSzyWihT30KImdGSrB7yhn70s2LTfiiCmL/ckdbkVq3kVwEUTyFm6HIX9w==
X-Received: by 2002:a05:620a:372c:b0:93b:d79a:c45f with SMTP id af79cd13be357-944216cfea2mr2039289085a.55.1793699291330;
        Tue, 03 Nov 2026 01:48:11 -0800 (PST)
X-Received: by 2002:a05:620a:372c:b0:93b:d79a:c45f with SMTP id af79cd13be357-944216cfea2mr2039286785a.55.1793699290696;
        Tue, 03 Nov 2026 01:48:10 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa38bb4asm44422715e9.6.2026.11.03.01.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:48:09 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:48:06 +0200
Subject: [PATCH] clk: qcom: clk-alpha-pll: Fix the L value of Zonda PLLs
 with a negative alpha
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
Message-Id: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANWt6WoC/yXMQQ6CMBBA0auQWTvJlCYQvIpxUdsBBmurrRAj4
 e4UXb7F/ytkTsIZztUKiRfJEkOBOlVgRxMGRnHFUFPdKEUarb/jy8YHfmNwBj0uxs+MbU+kdde
 S7hyU+Jm4l89vfLn+nefbxPZ93GDbdlhZrRl6AAAA
X-Change-ID: 20261103-clk-qcom-zonda-l-value-7f003397039d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5njVES4Z5ZBlkcrpu1QwiiuUbpd3M7eSK7+VdDNHtaI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6a3YVlh52IiRy8CD34qkvFVYstJj48rMrQGmn
 dQZ5tteLTiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaumt2AAKCRAbX0TJAJUV
 VuzaD/wJzqC7K1eA9xAL0ISxpLL5RglAuAVDaMmTE130Qy/sX1u3tHj2loxG/PDHpvds3oHMEV9
 hC1mvnOogjuoYhf2a5nPap60yibupoqYVs1Vva2iSgVXhx73lOwqJnsH/aql1WKJ+hpYn9/jXjn
 UxIwyhNPvHVYHnf6vBo7dBqNrRnOnO0Wbv2z0ltGureWKi7lUTPrXtnqrLHC4QcjIhhB7BUq42G
 t+zSbeV+OVxGEJXB/MaqH5VmkqwHZdCzuN1Kgeg2XG+fcNXR0q0+AXqAzY+gfvGPn4LSoOSzz7K
 qr3p846cQKTmo7u7u24YcFppOnuu5Rfa23bLAD/WBUP8Yu19jKrkl3iXmiZymPHfbrfJrwj0Z3E
 rR9qSX6Nfo6RtscAVM7xADrIx/IXmIXhfkJRFnNYdg9aztzCZR9x8kk9YNkG+QtHuPuqpn7Q0JL
 kFYx9qVdTIEaVd0I8xibmhACrf1arg915oEuTLtxhwN24aRjDVF1zawqJbUGNGyVvS9cZP05BK8
 bGl68xs8IGaDEwTwf9nzGzsBSPxLSUuEW6YfI+rE6DEoptcsbaY60j2O54aKIcxb5Myx6frdYiS
 EfkjkqOk0NIH4EHso63pdjMyiBiymEkcEF79gRp4hwEU6iuaDi9S5CPkUTYCyp7dLvkcpYmwegc
 s0lb/OlepaYL6bA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: WQAzHkwc__YqiAXbIZTyfdwMjQGFBLS_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXx/ee20Bfc2HP
 jlKMNDWgBcGnpWhX5G6+Ak4HILOJhAnf6dEhpucyv9ZX+i/0NjgvBId9yrVLvDfXFhVzXc77Xvb
 FK8zkYlU8gE91MYnxC/eVR51IdnjN8k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXzy+Z3ZhCAI7v
 jYk69gOAcuC70DuO4GTR76mtfu0i1PdlnSUQ86MoIEXiVf3X9Ph6aV7zjHF3eSjCNmodYaUTcn5
 8qfMEOdaranS7W6oWh/15cl3vhSmQGPQVvN5k/Qvucy/t6aaT+zrth1odhRTAajz+xVlM1mOUxG
 zxMZNLsSiZHX4gKZONUMxVzFn5dj6W66HmNGBr77RJW9g7swxc+b3lbPlZ6KKchtaBE25DplLB+
 XMtqUT4IEX53j1NkxO2ip3gd6vbluSYGKfL1ZOP4+gi2Fp1Hbg9Tvw4FhZPfXUUaAjlJ73a0bWU
 WLh/9vwXH+Wh6hcFzYY70aCN6NknLBPmmTdCf3uCODtE/USh+Ogr+q1fEIPmRad6L62YM6bTwnG
 dC5afthl0K55/LwHjrwQxVA+TkauNeD7U6WHkQ2W0bmzDkeqNTq445sECwpYhOYXT81YQayxIgm
 V6gtIQMs6Oq+2aC3aGA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9addc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=U0MhLFlXrxXVFuOl:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m72LRCnX1IptLpsbfGIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WQAzHkwc__YqiAXbIZTyfdwMjQGFBLS_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

The alpha value of the Zonda PLLs is signed, so for a rate with a
fractional part of one half or more, clk_zonda_pll_set_rate() programs
L as the integer part rounded up, through zonda_pll_adjust_l_val().

Since commit a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the
zonda_pll_adjust_l_val()"), that function adds the rounding to the
requested rate instead of to its quotient by the parent rate, so such a
rate change writes the rate in Hz, truncated to 32 bits, into the L
register.

Use the quotient again.

Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
Cc: stable@vger.kernel.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5..9782fb062a58 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	quotient = rate;
 	remainder = do_div(quotient, prate);
 
-	*l = rate + (u32)(remainder * 2 >= prate);
+	*l = quotient + (u32)(remainder * 2 >= prate);
 }
 
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-clk-qcom-zonda-l-value-7f003397039d

Best regards,
--  

Abel

