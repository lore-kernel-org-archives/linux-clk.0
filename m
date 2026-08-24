Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD86419FC9
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572595; cv=none; b=Uuo90Ksgi2ZSSwfO1okMBouUzfa9yhfJB0v1CLKB83LHCvjgx5nfClH7hhbQdUyb0/EAU6lFjPDfPprZ8n0tKnoqkcA98N4nRYFrxiGJfIp7HnyDgTc1cDYPYooSdarTfOME/0N1DhLugSkib0ug3oU9Y7Luao93k0XDuK4iEHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572595; c=relaxed/simple;
	bh=DKLce2rGCWsYxRe9TpcUQuvx+0FtbeoYOxKuMusCLHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugdQ8eRVhRQhSkg9OjKGl842n7kHRK46+sHyElkUAAHBRmqoBtkfPoPdB26+O91K7mkmxMbpqkcJyn6KXj1khGQQyEmU0S6tCpinrv3eDqgnTa/bemqiq9zRNCx+SCn8P2eQIX7lHx/JIKrUb/wgPKpDLPLXG9ihbI86ipjRgtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShdRz7kN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+XbPueM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShdRz7kN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+XbPueM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMe1X3195000
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6DFU/XkQWga24fSKmEZu8DOXRsix1OWpbGv96lsfYQ=; b=ShdRz7kNTBdpRj+N
	TLftfKVb1w1DBRNILc6hUOxHAjXDfCFbL3RYhPKLk470wxfLzmX0WfXDCUoJGemB
	7BNuZ8Var6sxd5oFDaPLVpEfEn39PjNW+01ZtXrk5qf1dDhbv2YFC+LlGyJHBXwA
	dJIX1so9OZ033Zf1q+aUlSh3Ul6kWVPzd0BMrZ55XEjixnQ3mMuPY5pBEho3tdgH
	uD8caaaFi+NN33e8rqLq9X2gWIJPN9MF/Q7mVpjKenmSVARMvIjx311pY0dHd/ub
	GcuZlFRZOGJJW8LnBuJugiYDfhP40SCOFldiMOyVdLCgVijQfdyi1hQzM1B2eGtk
	nRosTA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs31w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso48418821cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572592; x=1788177392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6DFU/XkQWga24fSKmEZu8DOXRsix1OWpbGv96lsfYQ=;
        b=F+XbPueMIo/2gsieSKFTPcMqq7x0UXYf5mclc2vfcXF2BpvQYHJKkDwkbBTtlbuUTF
         0k2HgYbORzJIMMrk5y26Z3pOoAlCtLi8NHt48azpUF4skREDEpXi/yfSzBv2wIEfHmQW
         gJ9kGTyDO4Zg6YteHlEdTXO7653+Yh0WDv1egVxoZC/guMird4XnqE0bA7pPtzMGkBdR
         HqE6LRk4V1nq/E3j+zx1CKnJOywnMiStYP3ToncO/cRJ3yWoy48URw+9PWOX0RburXIK
         AGESweuDdAnwljg/+C4BFpVElcwfn86VCHd0WsrUHrH28nnyzZoZoDtkLhZOSCjEJFz5
         UdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572592; x=1788177392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6DFU/XkQWga24fSKmEZu8DOXRsix1OWpbGv96lsfYQ=;
        b=E3+D7+lggNuJIdWtbQ1qWDe5rVCeLCyk9MymmkUm7egF+CvF4gIr9D7r4bgNdWmhyM
         lkE25CG3dkFYF3alkAgmGvC3FSpqlJiTu6a34WpP6d8Pwloe25LvdmCxoKLX90aITq/c
         dGRIZ69yGW0WF2OGqXdAEVTofi2JrN9WuNyX9NM2QmpaJl/QGO+NFgpnN+hCdcMYuF/L
         WvTvEtUYsWZWyayMUDtMSnX0oGUUb72HjCcF29afxYqCdwzWO/xbO9s/xMGNrt0107MG
         B/UOGEAGIwatc0My1G4kAGL5S3GwrOMi+4c1zoUapmOT2Q2BfBq+DuUAYtc4m9n7sSiZ
         9K1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq0CQMiW6TQ/nHV++RLdKu8Ozier3iOACem89SjqnDQ0+pgJF5oOTUgfu+HmKS5XeHBbEfBVcR31kc=@vger.kernel.org
X-Gm-Message-State: AFuF++mtSI0Fij8pc4vznXAiEW+doyZSvPwE1JE5xQ9+jXLmgOF73uxi
	4Zb1lvGl7LMroOFsF9de3admniu8T8BWjgePzI9WtLw3Dgi1dFXt1aVU3S4x1seg/eSNiR92Cka
	qDC4AhnyPhkABXukuNO0qorUg9UtpbGPBjiQMJmBUlkBkmsqsMkKZAZwW+xuly+KUbgAd1hk=
X-Gm-Gg: AR+sD13a8yuCESxfaOiGYZ31GbLbG8cXq68Cbdn4aPMvNwFLHdvnOzXKNADYUE5rC0g
	Dac4zYNrowoMAOF30BBnFC+0NkFMmsUTquYn/iCkEVrHNV3iiiTAVL0mQYWi/iJ9zTiQtQGT/iZ
	+YKWHtL4nNdaySrOSsvke4jX/HTgz4SsE0/7ewEBlzHNJxxEgAwpNVp+yw7YCAsOnAqFepXzFjJ
	IhPat4AkXphgzu8wpmkEOMn2GON6DAroWAMT5OoQ5JVTVIfVPZ6EjiiC5Uc6wbQhAplM2dq5DR0
	YzQaRUaCWTIhtNVlMS+Gbv1Gkn93ZI/3R8lft0T02COWKEYpt8lvihuh2WJv3pqYBtsl0HSfDN6
	mo/FnNkoV
X-Received: by 2002:a05:622a:607:b0:52d:99e8:46ca with SMTP id d75a77b69052e-52df586c696mr241493111cf.18.1787572591855;
        Mon, 24 Aug 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:99e8:46ca with SMTP id d75a77b69052e-52df586c696mr241492501cf.18.1787572591316;
        Mon, 24 Aug 2026 04:56:31 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:24 +0300
Subject: [PATCH v3 37/47] arm64: dts: qcom: sdx75: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-37-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DKLce2rGCWsYxRe9TpcUQuvx+0FtbeoYOxKuMusCLHU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD53ePxEK57Lhjtvz4WClEcO3lbWzwW3x0YB
 ZCE0NLodSqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+QAKCRAbX0TJAJUV
 VpFOD/49cKELBZ9+WUww/YdfO4wP0meEwdGgxI+PpdG+2cO58HF/O1TFWGC4H0W7am9NVw4ydkc
 cPQ5QFbWQmPghFAmXtqt0dYjRnIk0Z5oDGxnM+a3hHKf2ne9gJ5YGiYBSoewORfAtrBv5XaT/ZY
 9SMxEBsNROKipPccijTry2DG54MjPW42kFi6WtnmJMmP606fvy0RQImDw800R1FWlRVsnJWB1h6
 J8zbKFmVpTWEsUaDDmuEML2UpRqqs1d363wpMhzvjOZNWIQvp8fMKJXcNEX8mwM/69Qsh6D9DcH
 a0mB+v/CWgUa3IvIheH9r1mUQ5X4IPqM8Z2cNJZ2TjCTocehecIGigYkEvYWx/1mMZgHvJsncWZ
 FYPmbIfTOUjISlkTXEcqPWksNeZ7VhtcLx3AfcW+pUNA5fJ+1RUYazSkkwZaRI200FW5MctTPUW
 icYaMpSA8Ma5f1EuyWsKq1ILDOUffgRHMHL/ljbSss65/S9uiBRS5pwY78jyttzwXQV/8zpLrg1
 MZUe8fZZjLeyq/nMfRGXYCcuq/DoxnrEHWrjt5yFYshDZkqfjcpm1Z9KEnjiTr5HsnOpB+1kX2C
 CQ7Zhz5HFWnGhk5dw19qypLW/i553fR/jGsnABUPtL8MP6U80Ic3YbGPrwWiElFLMOSqWD6+K1W
 Ghl0O6x9sfkYzQw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX08kmyBYhR4hJ
 wiRKtR9IEu0R+AIwGs5IA2tpgtOwAR4Crlrx8w07ZDrUHzQOAOA8+jOvqYdWbr2UCK3YgXU9XDc
 u7UQU2YBLFwG8p7O+6L0TqfYmHqKRws=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXznLCOewXYKzS
 tfUkwHhpNRtWznxBQ58fzSCpSBS2K+touyKBzj0lRKhiJPJR3j+qpVF4zJAzwN1mL7LrYGqiR9e
 29bdh5b9zEe3dYBgq8SJGFC4KOZwVW6n+flp7cOn6u71oHAyolZff8rFeE3dHjEMsLJWxVA2qox
 GO3nF+He12OJHRRLO+kG/pTobPMzysJde8wDIYv78cu264eeXY/3HH4+SLJh5+6P/Jloa6ULV0r
 V9e9ezjz3hYntta3np/tozTMW/2Rt7Ub+9JuG67EC4u0nmZ2jWn9LqP8qvs1HLbo008NKM/0FDe
 iMoLImXyjt7xxBwJHeUr3QHb2idWqC80uuahY0dL8N9nBqy5WbyRMRY5gZVGxpwmlerLxjWexsI
 bNSpBd/k3g9o7X4KZmUqGujpLhHQC2towlk5CFoovZJ9/PeIWu0sTW45uB1tv9gii//WbrmRzNJ
 E/xX3Srz0HI1j+w6GzA==
X-Proofpoint-ORIG-GUID: 2KDFT8JnttN4oBI4z00FILVgomTKFvsn
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3170 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2KDFT8JnttN4oBI4z00FILVgomTKFvsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GCC GDSCs on SDX75 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..d4ef90c4a8db 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -487,6 +487,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

