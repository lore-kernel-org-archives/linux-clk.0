Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B85288C2C
	for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 00:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381920; cv=none; b=aDIV3scCocYIAgreVUXHmsxu7ZJqojV6Y2vA3+MzdvNHfY9XdylmVNq28jd6z5EZfZRnKqt/iivKwYWvHNnDRBkvZ8ArPHkgiwHCh1mDtdTHBHFwfN+yPPKdsATHFYAmWByyXOZb0zJGvGiH3p20SkIofh2lRHeAnewwlsEZ8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381920; c=relaxed/simple;
	bh=VMH0mqnfAjpj745TSAU4jjYfnm19/jeV8l68qOpJ5oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePbu1wDl3KZ0R8Vedr3+i5gJ4uXn3PbjOOxKadxXsPBBSJL+OqIv9P16jQTrv+j5cvlaN79LbVjwqarDRPyIOvpKdqzLp1YQTo00UM50UP7wm9HW/inA1lbX54cdVTuxYnPfjdWsF5Cw4DP0vwVJTWvb+6qqRMcXqJ9sx22WrOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4Hmps4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQeNK50C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4Hmps4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQeNK50C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PNcnVk3612531
	for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 00:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PLHqighbw75XO+o+nLzJ9wS8
	/3X1F2owG1+Hq4/kqUs=; b=p4Hmps4jrZ8v8NOnHAtjkQGpaTWCzo/gba9lsiI1
	sfiUt9MsDzs8qsTVX/9wzuJbPB95+NQ9twQkQLlU6rhNXNh/wf/fpT+wycM937vH
	U4GO8A8c/awXNnYuofz2626/q114zkGeolI/4Lv2EuFVSEUufh0wc83JrYaG0lTd
	PiYc1qnPYLk8P534hrwmQ3yeF1iDG6KS5dAswzLXjFL/v5Dh4iGW3qev2LOGclTB
	lFq6jpCIVvD/k6aks2YPoc4Rk8s7qbErzSb5bUlmLGcBEAusC51RbLmsHNj1TwgI
	n8Fzleox9kfudKZucVdb3KF6azN9V2TubftgxLM9vZA55A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk1qyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 00:18:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14388794dcfso1394857c88.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790381917; x=1790986717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLHqighbw75XO+o+nLzJ9wS8/3X1F2owG1+Hq4/kqUs=;
        b=RQeNK50CkDauzspCqUMCMNkp4i0xHUj8d4g5F37EX3hsbNnIrk7jYJDmmpiF51vZJS
         OAUXhqN9JzPR4OJPc/SaXYSahlxKQlUWbye1sM5cL/wX/ZjsE+89XW2h8RFAckqsi7ZS
         Eyj+vrg4C9ZM5G7/4Zbu08/qE7KhQDIzfAc9hKhoSaULC5dphpHNPxqh11j+xlmcRXbd
         uPdpfZ+I7ql+veh89dTcHp0N1US7UTx/ofHp80PrKNEq0dv6TaCV67r63V5hzFQg+ygk
         0AxcXD7UUtW8G8LLodL3YQLmmprRF6msomOjHcmAXELyaf20ZK44ME/jkjmWackJH4Du
         +nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790381917; x=1790986717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLHqighbw75XO+o+nLzJ9wS8/3X1F2owG1+Hq4/kqUs=;
        b=CvW7Se5q6mBpT0JAeSM/1hKYuk7So1+TLwqqc+j47HnatJU2ouBkqALLY8J7KM2/Lq
         5yEz25mEXdXt99Zrsp40FI3HUqXbmxNcaSPrRbrSkKU0o569iZeiEu46SkKaSjtzpWU+
         pt1e5Psf0c63CbFbbMO0sdWhlgbDFocZz7iy+8FxYNsCpX4E43OFIfG4vEidlX58gcow
         eGzRaEha+/gd3pYM+zJMjArqGX6aADHcHQRWA0uOLTPYX1upFaOA3AME9mvAoZ/eJgHB
         cnF50LFHaxi9pGDEGeJMtySCazHqylWmgFTZXKwLTnJCS4O212PhchdnYAslgDGKk1YQ
         LuYg==
X-Forwarded-Encrypted: i=1; AKwUvBynoYfr2c2Kw2bXoomaYFImNGbZhotOjiPNPKt4/U0Nc2j7uo8RPxBXrIrWcg4QigLWopnQ7HFhQEA=@vger.kernel.org
X-Gm-Message-State: AFuF++mtYdizjpx4xP788gW6nDqdDa60FDQmVc32WyX79xvEb1O7YJtJ
	Vt9wDIk/GszForpk34PGa34q9WU4wFKRzRkjm3ta0indgqeyiCU7NKHtn5f0NzL3k0jd+io2O98
	lM1deTe6Rm78KxkLsk5ITxE8LUDa6G3ci6L1z7quFdU3cZPyzAbK3oQv9Ac2oPVU=
X-Gm-Gg: AYBFou1pp6E+yOxi+K+8MMnhtnjdw9tzXBMg0POcBXn/YanohBW8/B+76cUcmDlkEnd
	2TN0H3+Z0G0hamUpPCRYS4D+TKH74jdFThfU8EX/GIrlqlgp7PEtKEwr4ZkKtz1OOvMU5dYoewn
	1OxWs7vR1ZyLGuEpJasTZdNOZdwn9GyS7+D5bQ6gmFlaz1KGYQwJjY7akSg+d5fey8TxSc1nh+a
	RAQWA8DADiQEP/fjPpJgISXw86vuZzSxECYHkHxjxoS/L9Xli4hR102D3kkOf1TEtXs4pOOfDK1
	y7DpVZCXOZQ51z0mGYv5Ajx6WYnvWWohQt+rBzqYIOiKMXR9qhxynuDd2E0ikmB4tStLBv7qTJb
	HwU0Fr5zL/nCu4l1je0Y1EQuT1UK8S6P2HfM4civUPQ==
X-Received: by 2002:a05:701b:2612:b0:145:4ef:e905 with SMTP id a92af1059eb24-146d096bfb9mr1141139c88.42.1790381916825;
        Fri, 25 Sep 2026 17:18:36 -0700 (PDT)
X-Received: by 2002:a05:701b:2612:b0:145:4ef:e905 with SMTP id a92af1059eb24-146d096bfb9mr1141114c88.42.1790381916202;
        Fri, 25 Sep 2026 17:18:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c505sm7988612c88.5.2026.09.25.17.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 17:18:35 -0700 (PDT)
Date: Sat, 26 Sep 2026 08:18:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <arcPVcaWqnX-tG6O@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
 <0e80efa9-9377-474e-99f5-d458d81bfcde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e80efa9-9377-474e-99f5-d458d81bfcde@oss.qualcomm.com>
X-Proofpoint-GUID: dALwowQx181kBX5s7q906Qc9zm2hwhEj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAwMCBTYWx0ZWRfX4rv1eggoeXcA
 kTKtmChoPJNnvc7uvyGsab9OAn3zhY/3E/KuP8kf1KNSxao3RCiui1XAvbT5sgTIS9pw0ouCc8o
 mGn3ALeBU4pbZo2+qibsX38WGg6kp9o=
X-Proofpoint-ORIG-GUID: dALwowQx181kBX5s7q906Qc9zm2hwhEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAwMCBTYWx0ZWRfX4vCzfAKg9BHt
 IHohvnuLi6BXgtJG0oCurqNiL3qoAD+dVzMIdKTtb4fKaUNRHcRbiuT05H5I5NIXYwUg1c9Xqlp
 j0FIe9hW3yvgOZz8M5eJajU+qajd++bqlYmInKMluoGoR2f0tnnv9Ilvh+X8UnSC8TmumoJA0yR
 lRyS7BPb8ZOsl1iJqvIZB2cksG48fJv1T4EUy8Jp/JuzImyYVJ3gDedcp/fmyrROQBT3A8326qq
 c74SYpHEmVyRvgh9zLOOEE7U7bLJoe4E+/weJxH+UDrX41hletkufiQneT1lGiMTxE+dZZrAOQ1
 6754BcaPOvWTuTO9pkqJkeIyUAKTruTOWH0oSg5RkMC3Oq7F7jtb0zugA+LP1D2/nIZ8tzgIs+K
 xF6wx0JRyMt8vXtjwFwFtfpciAxJL7rtDjQ4En9IihI/iFIw/aXsiXCx8zrhoi7bUf/Ptk6LTDN
 4R+tqdsnE9M44e5PKkQ==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab70f5e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ztxlnROUaC2VjM3YxSgA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609260000

On Fri, Sep 25, 2026 at 09:19:49PM +0530, Jagadeesh Kona wrote:
> 
> On 9/24/2026 9:41 PM, Shawn Guo wrote:
> > The videocc node supplies only the two XO inputs. videocc-glymur.c
> > expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> > video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> > up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> > parentless in /sys/kernel/debug/clk/clk_summary.
> > 
> > Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> > is listed in video_cc_glymur_critical_cbcrs and is therefore force
> > enabled through regmap, bypassing the clock framework; the sleep source
> > simply keeps whatever rate the bootloader left. The orphan still blocks
> > any future rate management of the video sleep path.
> > 
> 
> Hi Shawn,
> 
> The sleep clock supports only a fixed 32KHz frequency and does not support
> any other frequencies. Additionally, this clock is not currently used or voted
> on by any consumers. Therefore, leaving it in its default bootloader configured
> rate should be sufficient, and this change isn't really required.

Hi Jagadeesh,

Agreed on both facts, and the commit message says as much: nothing is
broken at runtime and there is no rate to manage.  The patch is not
about fixing a functional failure though, it is about the DT describing
the hardware inputs the block actually has.

video_cc_sleep_clk_src's parent_map contains P_SLEEP_CLK and its
freq_tbl has F(32000, P_SLEEP_CLK, 1, 0, 0), so the RCG really does
take a sleep clock input in hardware, and videocc-glymur.c asks the DT
for it via DT_SLEEP_CLK.  A DT that stops at two inputs leaves that
input undescribed regardless of whether anyone votes on it today.

It also matters for the binding.  The schema currently documents two
inputs for every compatible, which is wrong for qcom,glymur-videocc,
and I am fixing that in the preceding patch of this series.  If the
DTS keeps only two entries it no longer matches its own binding.

Shawn
