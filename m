Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD6369D63
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144035; cv=none; b=Fl/BJNMS8vKvX3kYV9OWD5m0Du8OB9Anw0MjCF7jGImKkABsJh64rO5jBS4dKDCgj09lbiyHqJBiAMerR/wcXRY2BSiTPf/R/laHmnIe2wBV2MwOMdcZ82ecf7wFwz1Bb0uFPFooMfXVbgE+4Ii3No9YAmIntHKS4dUmywW+d1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144035; c=relaxed/simple;
	bh=wlc0vo8Hdh9jcDJqUc6YvRCT4ni3Jekq3t18gDFW0YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss+6j+m9udBVXbJ9YxDbmJLhyUkdTBviieNnXHcu/GEGPcUnursT7CtCOliq0/CAwvxiKPiFKLtCcFyEy4FvUGexdumzHbhnD6megvwWYTNnWT37m5qgj3vK1fU2taj1Zz25WcK+ODMCZQUzGHUGoNelLkLFdWOEIeRpCABC6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKqnF2tV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYg3Q+dR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKqnF2tV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYg3Q+dR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClxm14084641
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=; b=eKqnF2tVlKNlE0EL
	eXDfoUFkGALBB9Rn4GDpv6bw2f/qH4ABFPtuO7S8HgLWCLRRfUGLPen9h2QGsPhK
	qVw2eYu8ftHlnx9N6vrNWUnSVMlcHg534mgftXaxp2w4Nej+yDU4NFWiDixCWC7i
	ZdLDJCjePzc9eOfzs7lktjLUplBYOR0RWHv1WqhC7Fur8Bg843TbpnOQoq3AyUgm
	J76oQKqCnfg6M44tJs1vTjyqKponpe6q0WeUvzT1AZ3EBX4grz5ozp0+mQvA2gEy
	rOwJhQ557L6MGxcnzK+l9w9ojOiwvyVZjC+bnWcx2F37Rd4GAqRIrGThHhVnwaRc
	JY7qMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb8m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso116048885a.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144033; x=1787748833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=;
        b=aYg3Q+dR9g+If1RONeXCUmGUzMv2f8NeJ/qG8XUbKmKcOxevc0Sab2Ufy41S7fk5X1
         7LwQZfWQ+q6HFBjV2ln+Za89Cp16cUYWSFw0OalDKCTxXkYp/kB5aYQIUnDJLgqrcL7c
         TA+IWDDrabnSK7ZWBTAj8EqP69YNr/0+qexMM6LEQRdSt7R8XWcJtcKJ5yOqIhMh2oUs
         8avsfyQUFqlLZ1trjbAIaGLiOGgueOZeqUxH8IOJBUHD1GGDLgFmZRiVoLiYe+q+pVR4
         uwDcP/9hVoHbYaVKdVHIy35cIV/FEn9VVR6qqDwGqagUP0ohiJB7Ttlun6ODXA2qMqxF
         rrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144033; x=1787748833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=;
        b=peauPhRgPIYZ2ytJ0mQvBy23ySbodCjUJnjf1oJummuyDQTQbGj2p+9V2xnlr/y0+Z
         GzvxqlJxgx9VU5Ul9QBiZtSO0rMqb+ruCJHgb/IfchDzF7W6akTJmO4wdSVVww1PPiNn
         EVcqPz0eV1TMJpPPlP3k8iiajG+hgRV3qLvw5VwmVwuQ8DqyLDacCD5q00oKXCINnnm4
         7M3Gtu+02RzEdbPelQJppjZ+21TYqiiplc5sPiLmwzP0V6HTXSqI54Slcqg6f291kr06
         gxj0k4ByHI7lEJ7wox7zOS1GXXhSxvDB/Q0ZeeiWMjIIx6htdi4ml2O07nMElq4ZmNNv
         qlPg==
X-Forwarded-Encrypted: i=1; AHgh+RrGE+tJSJ/o6e3W0o20YpskGFx+azx0EiTNZ3VZPWcg5RKoyFvHatKurNfwiW3MfEeCIp39Sha62SY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5AqCQRYt1LCoCHwWB6Yu3Zvo29ne4kC7GwpzMMkYFFl2geaCP
	czYRQqkTWu9nfT3QCgYgb7iz3fvKZGN+XhDYgCOZZQon+01QwbbUQ+ER1IltMSPlYUl8uFDcpZM
	FSVl1y+AS3rbn/Ag97e5+6Gw3AT9ZX9cpGNqbJbgP3VKGVN+3mKYraWg9EJfO6IU=
X-Gm-Gg: AR+sD10DiddJy0+q3yDFFwYnuiAUaOPEvJnYTCurShGPpVBVY1JCP0rFYZXZ6DoJINs
	DZ4tCpUG5L/3fmE6GE8qT23Uk8el7qi+cH000LEln/I1UZ88exROZMiQIyXeVxA7ctX3waIbKzE
	oRMAVPHgm/6/a2Y2FOLKsAtuhqe4TCcNq51fQVv0e2lTrHpxVU5uU6e+MNNsPZIzyBvYyz5MIwJ
	flhHMTD0OB57aFoCENWRRqZhs82xZ+gHZGoKUDiqu4aF9iGBMBuIIzoOvjT88r1c5xMyuNaaSvt
	rX8ZsmC/STi1cn0uY0rVMDlDtvt6Bana3OoDCz4OJPSuJwMaZ8U2A/vumsJMfC5uW7iD1G2dt+t
	T5A1uCUjT
X-Received: by 2002:a05:620a:25d1:b0:930:e48f:47c1 with SMTP id af79cd13be357-9371e3193a9mr400819585a.35.1787144032406;
        Wed, 19 Aug 2026 05:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:25d1:b0:930:e48f:47c1 with SMTP id af79cd13be357-9371e3193a9mr400815185a.35.1787144031869;
        Wed, 19 Aug 2026 05:53:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:52:01 +0300
Subject: [PATCH 16/16] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-16-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wlc0vo8Hdh9jcDJqUc6YvRCT4ni3Jekq3t18gDFW0YQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhaczjZ7tB6eB3mGinIjaqsUSEJoIc7yWd8yeO
 fw1Nk8YcdqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnMwAKCRAbX0TJAJUV
 VlUZD/sFXM543f81B/rcNBowHoJSInkay/wV5MJK5cxw+TExb9zPU4WuRg52v1jjMmoMDIBDKyg
 rB0w31N1BlDsoPVLwlYXnC/BciPgR39DmGxwqGnpsW+3EBytTVv4oV0gXYPmuH9X9103WsfktPC
 MLH8ufhIn+qVRYDIVsFJOazWTHwczolCnNeqzJncZ5TDftauHggWe9EbZYNGC4vfnZ7yuD6IF90
 GPtVn9SFGE3BZq7dbaQ7bXTxhjlNwVfHMOukmpcGdT5oDzBDGF9gbVUhasPbOkgvIBiyjqCEnix
 LoxJ/YA+SUIiVjc/VWFUrWucBAg0uNtjZZmIOkdxC5J1enAdv76TFU+XZOimnf/i2yuIV3+4j9w
 KEmJ730nUexOHkR9jWlwfRVr4/XvOoCNOPKNFQem1y3qAyizJS8o1YqrP2piquaR7YSRhkYAgfm
 ch7XUqJChvKuyC4n7PjTH9B6xtgVW05T83+ZfaLcAlxkarjffMShWw7y7y9V/ohI/0ZNvBd7CTZ
 3J/HaqVWvYvRZP9ZWXK/JXSxi/XThugZmSURFUp1kMn3liBe0Uez2zIJFGgmToP8u8Qak5XIsYe
 f4EIaEX4zO/4ClfXphBdKBcYo0ovUnokbxURu7zHMx+5bIH/fmMRIv5d4EI6gHCkqL0WjD9BhkR
 YZ9+ck2tGlPikBQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX6+IHu5XNti67
 6BmRI0KTwZV1tbFHyDCKZpfM8qylQHWnKpg0pY5N/bDlBsxzTGQww6H4iy3aS3vviOdhcQeQaWF
 qdioolGH8oUQ4V+5Oqs1KhobfUPgDEk601VbmpDwIlTd9lccdD6bBh101at+v5MFyfZp6gAiJXV
 lEnfU2RDGIdg8vAA3sTQu2GEgaECGLc8bWi/fd5O4TwoA2d5hSgMlAjw47HiW5J20PvvrJY6NAR
 0UIOKxwhiLi59hKL9z1ObISlCl8+wOIC1PeYLjEFBsRHWyU6QQYOP/pa1NuWvCCbhI8aUfkpciY
 KGVKmPl2y+aVsspG5eBZtcSXC7EXsuRXAGe3xpz/Mmhmbg1MVZxSepsJcHjwaRDa6jRMi3J659o
 lypaKiSB8DuwxS8xrxhKjCxbiDQfi/e63y/WAVsdauMLnvycwEqdHuqAIT1juYMT9oEc23XhnWw
 RaKPBMh41Sa+pouJ7Fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX89g+G7U9JOhb
 JXEbn3baSs7zs1lF+CRXwahiBDGRsulNqL4HYC9zmLpi1860/qecrhT2pSKAvOsbO5ZcYNCkrDw
 2p1sSdjq2smAVpdUHuVJvEI8UeKv6cQ=
X-Proofpoint-GUID: yW3x3zFS8EfxIf32sn0wkFPmT4sIdCq5
X-Proofpoint-ORIG-GUID: yW3x3zFS8EfxIf32sn0wkFPmT4sIdCq5
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a85a761 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..06ca54acf565 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -706,6 +706,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

