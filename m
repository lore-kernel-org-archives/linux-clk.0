Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5E23B62C
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 01:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166803; cv=none; b=GCccZFbZ3/s0nTmJ6hfPG/7KJe6zPBPjO9KqBVsBl26a2k/fHFOvhbDxNNw7bsZhqyoxWNVEUTnqWmnNn/rtptZreDy916EfUngu93JEgcCTBQ42Sww4pVdx7OxE2t/11FeMOVh3hDwCVWAZRH6sjiBJ3HFOMMtAO8EvZsv86lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166803; c=relaxed/simple;
	bh=DrFwEkIoYrD1qa5tx9EdrYljNPefynFUvMATHqt7Zhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9jthgVSdjhEqS2tPwmFVziXG8y9txJi2v1xE4mVMaBCAb8euF3y0tpJ6rUTDmr6eZuoyRGA5tQLhSD4IYel9Q8X/YEm1NlXDn8h+aMopuf//S0LuUHpxmYywOwfyBgdZhcoHLu0nOgl/Dj8XukFO0mJ90JHBGYAJLgnisj3iZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2Zv/a8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VleHCBND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2Zv/a8Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VleHCBND"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613NMj9E2732902
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 01:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HFgRG5qL9bnoUT3jp+ysOldDPm40o5vQTA9j6ykK/qw=; b=k2Zv/a8Z0KJ+rUmV
	oMJx+1RTv6EK/XHMNwvwIHIQbf7SVyEVr3teJD4KYzxtuoQ8mDZ1ra2mnwGYswP4
	n3Za56KUmZj/p9y0bD3D99UVauFXB+Hdt59PcvbkibN7AlY0LNMzwhZlCtYqtvQQ
	/2F0Q+eJQPQ853xWzsHqX9B7e+uX6R1TfGw4N8DQxRRuwEFu04v/o/BiaYVO5C+3
	eqr7nLqYPreMkmUwp53vv51M2gviNMj4IyuYagIu1PRA7VikAq4VBVmoapEJ9Hbx
	4k4CmIHgCzWQkXfwAPp47VdqCqw1FH8eZnUZk5py4jluMhMmEcrKBKUUUHrmvuhr
	aL2kew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutjwwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 01:00:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ad709d8fso106029785a.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 17:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166800; x=1770771600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFgRG5qL9bnoUT3jp+ysOldDPm40o5vQTA9j6ykK/qw=;
        b=VleHCBND3S2RJj5CpZZTpVF+0Pc9mLuvuApB+dI0DzUgPS9KPglsniRt9mLJ9n0SNl
         wajmFaKXbYUtR5pgj6mznxM7bqm36V2rIpM6Vg49MQzyBpsjZl11nEas+CbSu13kF0Xg
         7gYGz3MGSTsaQMKIikAzAFcWR+4D2ebAtwZ9nuZnmMvE9K201LLUNweNRdmBAgLgEBZh
         4pEfKyfIIdykYk6JxT1CoiCAe5tPBCMwIRIoQMqfi99XgIw/w6+XflRCJIIniuBYjM2x
         L6RVPlMBA5gdlAQamfZFD8u8TjlHdg3GNl1+W9AKfGerLV6dyK2t4SwoBbNBHpqVxDrb
         m67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166800; x=1770771600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HFgRG5qL9bnoUT3jp+ysOldDPm40o5vQTA9j6ykK/qw=;
        b=JMrEZydh1KjH1znbEW/lx90BZMg8/p5TGHJ4ZkQYBuMpF3FCapDYx53t6Hfs4PVei9
         C5ftJbJ8mKaZbRMDmXRaQFJVJO4Y9llVhz4ZV9UGxRWNYjsq47k9rbDilZseb3aVwIHy
         g0oldOUkrOtEPRWuDZDXpp13yEIE+hxpggimRWPjsS0Wz4vJfeS839upF1qe8C4/W+wn
         A5bqR7T6cyQ1vK+ZbWk1Z6aUgdg3842eF9mQfP7i6h5PtCCeCHhF/Ar/utCtZHNFnrkC
         oLxnMalOn5vuefX6i20fybqeescb0xxuAVDd8JIHkN9w03hrQ6tJTNkECU8tak5yWHF7
         peAw==
X-Forwarded-Encrypted: i=1; AJvYcCUJu36v7nQsxpo4mmplW5r1pEFyWBuPejwuR7692GXQkXY0v8Cu4nP5X30DccaUovgZDK35XsesrdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7si6eyzKBGASs7tNqZA5m+XRSpac09i70o8sBvmr/nf3Asl/
	d2x5kh8YpJe9L/FgIGpFRMnd65dwnGfkMW2cEhOWnovmxViwB2qRxpjnwvdlTb1xEIgngOt6TOy
	uJHOZR0MImz0qF5XE2moC09PMZJKn7xNVUoEA+nLyTSfxud/MVb1ifc1kq8JjclY=
X-Gm-Gg: AZuq6aKfv4eO3AriafnIgGdjxHLat8vEkKhjCkzvb6ZHjRX2D1+A8+arz7SdIFzpWh4
	x54T28UMF10HnBZweFO/vcCsVoFDYuI/oWFgPXXe6C4STnXe8lwpSB1jL4aCux6VtfIMiJcDKqi
	guWiMd0dWijpQLNtu9bYhcUJXY4dWRcOMr6cb8qaaL6Q/nZkwSOj61iSygm2YdRgNzPe2FCss5w
	8BHisSpidjz/O080rdG4/oD92/wi78xhskIcZVtzlgroxkz9bDgYgLNOcrPy8p+RJKoPHIo+dXw
	W7nYvzX2w9Ji6EgWt4/jyjIRJM11EdFpTY5gdJQva3D1PS2C0sL9QlK66vBmQAlfkUxF0Fro7gs
	bNVrihlQdoZT0wc0R+FO+9/KmbXCc1w/F743nPGXuc1BM87xYtJCZvy97pfF8LTNF1xCM/8fkBM
	ygrtAGE9KWhkaFPhfzkJQb09g=
X-Received: by 2002:a05:620a:4723:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca204cd086mr614824085a.32.1770166800180;
        Tue, 03 Feb 2026 17:00:00 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca204cd086mr614820985a.32.1770166799720;
        Tue, 03 Feb 2026 16:59:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.16.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:59:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:50 +0200
Subject: [PATCH v3 2/7] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-2-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DrFwEkIoYrD1qa5tx9EdrYljNPefynFUvMATHqt7Zhg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoHGVXP1oPuZ1HuUzywdpPWCvtW3w+jr4aSM
 y/VnjMcAf2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaBwAKCRCLPIo+Aiko
 1URPB/9AbHHnOcBK0yW1YvGlYOkWgOh7u5KCk0ZVSgqo0xge7DvEHmVVxxD/P1sQxFA65QGswBT
 TZdKhKTqca9+6fPUjh0BVrkCYPAK+/yj9TUZOYnIJCvSl9TiIIAVbkrjQTW5zhVQkJY0b7asY3i
 O8RuKd86nreQOjaqhDl5lZEZIpUF1tL3mytnS2Q5ka3fvdAyibGpul+zgxBe6qwkLhMCyR/Huea
 dRigVV0bMz2b3othCMm5yTbD4ld2O6C8538X0oKnKyzBzHKxZ06dQDrXKIDSpzNr/ewcRxErGDA
 PKllVBMVXDCzw5DFeUIQVpKHURpbMzaCTZf711bnD6XLOryV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX9GbFgbT8M1eM
 kAL/LUtDN4u9wba4KTqG0saUgjdkENt8i3CF6qwCgFzp837LkQEw2fWdeWq1Xwpm3pMRkXXHrmd
 ++uieLlIIOVzLjVjaKapV0WaxkF9uTCZQVH+EV156kGF7uG5adfbiwIcp3g9T+spoPeAhpd+Ri5
 EOD6PKEwOdKHWlL/9aMF/K/qW9KyCNrmzBMderF1iBj8aMUrTg4f3S848lO/EgYtBl7Fq6fwDIY
 qEwIgZdTY39a0CN0Dlc4RgkqZ9LAICichTDHcFHyK8qOUPkriHnOazXENxFXNJpkwNblJ6lMSLf
 ZuOyiEpyBkf1prBnYiSL+KtDc99u6oA18QoyBPOEm8gvtC/PHV0GWgpp0rCo3wdUQPr5+kx5NyM
 54kTEbx7qVDZIgHOBsnUFU/OlL+7bVeTVWH2/2K1L+mRxnDYT6Vvcxo1HD6MlqiHdfrWM7luyR6
 UVVgE5gESNUWvaFIn7A==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=69829a10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=V4YYwRrX08S5_i0GLdQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qfPIBOjaTDuOlg7Qs7qBe8LowfiLei2H
X-Proofpoint-GUID: qfPIBOjaTDuOlg7Qs7qBe8LowfiLei2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040004

First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
are powered by the MMCX domain. Add MMCX domain to the list of the power
domain to be used on this platform.

While we are at it, drop minItems from both power-domains and
power-domains-names, it doesn't make sense from the hardware point of
view. There are always 2 GDSCs and two power rails wired to the video
clock controller and Venus. Disallow passing just two.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index da54493220c9..04cbacc251d7 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -21,15 +21,14 @@ properties:
     const: qcom,sm8250-venus
 
   power-domains:
-    minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   power-domain-names:
-    minItems: 2
     items:
       - const: venus
       - const: vcodec0
       - const: mx
+      - const: mmcx
 
   clocks:
     maxItems: 3
@@ -114,8 +113,9 @@ examples:
         interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&videocc MVS0C_GDSC>,
                         <&videocc MVS0_GDSC>,
-                        <&rpmhpd RPMHPD_MX>;
-        power-domain-names = "venus", "vcodec0", "mx";
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus", "vcodec0", "mx", "mmcx";
 
         clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
                  <&videocc VIDEO_CC_MVS0C_CLK>,

-- 
2.47.3

