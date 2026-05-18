Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37643542F6
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779076232; cv=none; b=pJrnb23df/8K7iEasVx9dvcyMi5FStwrjnjy5neRoNgj7VyGEfr0XqHDIXXV6/e2w6qrdTcShRilOScMWB8MUtT8329Dy406YxRq5QkS3zlTBl5FJUdPyWNBM/4OT9LR0Bmpfe7a/4ZmDDTA5NdHnNnfYBJpjrufxIIaAJYJTsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779076232; c=relaxed/simple;
	bh=SM4oKCiKBPp6qapZUdx0yHfo2xqa4gN12OmIZo+C2VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAml3Ob/zPbccjRqGR0Lr0iX4ZoRAN8QKfTCKrMpCiXmv2gtTDg2qGFtzas0h8fZyJqL4umZGNk/2HyG8gXBaIQ+Ly0yI3Uxh7VssNBOA0lGZcapBBwIY6vhp5ffoWZgME+xn0gB8xxAJHUzFubhwRSWTz22Zl6QK8mwV8ymdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc5P9+3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BubzTdjg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oc5P9+3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BubzTdjg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HLvYU3756636
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xedUXiNkyCvWr4jy/hXS2Hge
	j1kbvRVTt31eOPGYa7I=; b=oc5P9+3g+A1FNc0d8top8UrRpgbG0xig6eNhNOi1
	ssg3USXHRuLDWLjGX9su1OmcFZ0yhlWV27iFibZIBbigsc1uG8j+LAdYNNnKKTP7
	0/XgBibd0TI3Qts5fi10GYGitYW2jcCNcz84BA1pMgnJU2Tq9z6MY+c3uDXiUFDY
	uhERiYUiPdO3up/6PunBXyp6pOH2419Amvgl2aSly5vwJL8KDrITJaLUyiW9rklp
	aw1w7mQJgdtfJuScthsQcmN2yAzh6rXRoGuikWLVbNZ6+2RTbjY3jLokIqWxEuQK
	oVxF3naO1dgWMXA76yZoyMXucvMmnF+oLGWCDxIGGu0c8g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvck8jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:50:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2efc342ef15so2434455eec.1
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 20:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779076229; x=1779681029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xedUXiNkyCvWr4jy/hXS2Hgej1kbvRVTt31eOPGYa7I=;
        b=BubzTdjgdTvnDfxJu3tER0MQ+vx8RymynYgftFGxJZ+zHMwkhLGpr97o70bzxc6mVL
         g5CldaIB6IqysUwe/OhkbOv9hKZp8SoCFAslaOYrSXvDZQTUKoDoUvxD4MuAGOIl7g4v
         iB887z4xf3pLYbfVthIgaN7wAAt4rwM6CIefCstVKpg7prvcr2k4dFFlZG1/gRnRn69M
         Rk3HANqliwJTeZeUSqfEM0JG4zfBvdPBzeTc9pmfxGGQGjqoKWDaJ6Je6ky+e79hr7Pa
         vJ1QW+owi/aZhWP9oKTftL5lzhZ2oR4NNOuMM416BC9QnwlQpj2iRyONmbg3yZObXE+c
         H7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779076229; x=1779681029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedUXiNkyCvWr4jy/hXS2Hgej1kbvRVTt31eOPGYa7I=;
        b=kL+RzpxXbNXEnOJcxPYPTnZGqMtLpEPlvE4Eo8BgL1b7swy0B6NHZN3DzVOssQHdku
         sLNJwNWa66hywWVKkWEZQK6aA/5qpwYUmvKrZviuT77aDJAR0dbTTHTL1YbUlkAEc061
         yqiBwybEK45SxEdvE88OLc+0Ieci0BKJt9fVLrgdss1aAMq8JdFCuGsCeovVq8AQjXvK
         I3zic+Kbz7fLA7qV1CgVJ5g1yetJvIxijCsjrNlJ7OlHZrjxznlOvpNV1HNAXRltCTrZ
         c/os3P6mVmCEgQGBUSX0sfdgDHirBtWxFbi+M/snRcXyk0jUfKHO9VK5XFO+Ekk9ui6h
         whEw==
X-Forwarded-Encrypted: i=1; AFNElJ8uIl55FyHi5Fe3pdKSxyNPr4bSPskBQX1WuR+fJyLA+9qDtMCk4gKO2uvloOqnpcRy4q9bIjvuEWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkx5nXvLcbEnjPFHIoupFU61SpOmAbQ1avWr1w9fsmzs/MpWBG
	ZW63cI1QpbqfGwiODJkB+Q3j0HcfdxI+1lRSfad1rrH1+0rqP9zwZh1pDiuV/s9VJyPYdH8/cv5
	zS3rrcwvFLQIyKSur8pD5qynutzj/rg+O0qgJus14WLR+KlKCduRKUr35TuqlmEA=
X-Gm-Gg: Acq92OGy+rZfMDXBcQzXtcC3csnvKmHpBxBoxg2iKFQaKcM9xJbEyprW+mHX3cXVXC3
	fGnUx6NbQxri+51VQd5/lDvfIfYDoLVi0M//5XWmbiPBccfIb9tMMF1hNnBop1IkTAEIGSkfLHF
	nFotdRUM8w37JmuRWXDdFlhLxHR0UTFNwXkIMunfAEaF5zWQukEvZ94jVuUczgCQUeTc/WtP/bg
	TKXI/i3dyNGPvTopCgZHxx9gY5zRb9wKjuqYXdyssCRm1MFtoEB+jq2pbBUf/pUO1itDgzcHC0v
	x01s42lZgGVmXp8i3Yu83gaudxBueq0pJ8tVsUgSIJFQEZ3ZH/3xpFcPFaAUyWgdTS4Hli2JbW3
	SaGT7cC8OH12wSZVJtjxrWe9r6hYWbboEBV76u6eDyENXC6UKi+IG73A8tXCwFQBETakm
X-Received: by 2002:a05:7022:f97:b0:12a:6fb7:87e7 with SMTP id a92af1059eb24-13503cf183amr5453901c88.0.1779076229069;
        Sun, 17 May 2026 20:50:29 -0700 (PDT)
X-Received: by 2002:a05:7022:f97:b0:12a:6fb7:87e7 with SMTP id a92af1059eb24-13503cf183amr5453888c88.0.1779076228518;
        Sun, 17 May 2026 20:50:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a67csm18063941c88.13.2026.05.17.20.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:50:28 -0700 (PDT)
Date: Sun, 17 May 2026 20:50:26 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <agqMgkRwKqr05rms@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <aglUmonGmr2goyOI@hu-qianyu-lv.qualcomm.com>
 <408f587b-76c2-4fdd-bbe1-89414270b4ee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <408f587b-76c2-4fdd-bbe1-89414270b4ee@kernel.org>
X-Proofpoint-ORIG-GUID: PpnY6MX-wi25TSrv-wlhtnzVoHE11fvK
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0a8c85 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UOvTEub72O79xdH0gdwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: PpnY6MX-wi25TSrv-wlhtnzVoHE11fvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAzMyBTYWx0ZWRfX1NwXhPwfbHQd
 th/dd6xPIleVntOo43y9O042MGnAThZm1lKI7WYPcpDjaRyJaK/vl6sXbL+vzgSBKLU75OFbktf
 V/8o3N1FTHtVegbFtromf93UmBGVPqChiGsZB9A+W5/4tffXTrZwlWWe5aFaTbNMske+cPlTvv1
 YZnkbAFKX6ZCgEJ/9RDi1ELVwJgR/vKDEnCkBDHgsgi2yrDbRusqAxtjXlaCzu+Y8VBGaJGuLyS
 6+s8aAIUPqDdgSLCTnyvY7JgCcC6P7JrnBwhF7OrlwoWG2lyYeMZzmKZnJ/VGCahDwuna0t6MeZ
 KA9Uv/gYXpUP4q7VC30L3Y9VYpv2NXUOymCJVrp2psEtU/nDcssUMt0oK2kgh7cG411EWUZsqc9
 vhb8aaQj3h3oEcIXnxRaLxOBQrgQWj2gj33P0y1qbY6X72jQdOBYEa/q8DBWR4JRQHArnxgnwD3
 28BpKfn8zC+8FIQ9xLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180033

On Sun, May 17, 2026 at 10:27:39AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2026 07:39, Qiang Yu wrote:
> > On Thu, May 14, 2026 at 12:22:17PM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>> required by clkref clocks.
> >>>
> >>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>> differ. Document them here for qcom,glymur-tcsr.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> >>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>  1 file changed, 57 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>> @@ -51,6 +51,63 @@ properties:
> >>>    '#reset-cells':
> >>>      const: 1
> >>>  
> >>> +  vdda-refgen-0p9-supply: true
> >>> +  vdda-refgen-1p2-supply: true
> >>> +  vdda-qrefrx0-0p9-supply: true
> >>> +  vdda-qrefrx1-0p9-supply: true
> >>> +  vdda-qrefrx2-0p9-supply: true
> >>> +  vdda-qrefrx4-0p9-supply: true
> >>> +  vdda-qrefrx5-0p9-supply: true
> >>> +  vdda-qreftx0-0p9-supply: true
> >>> +  vdda-qreftx0-1p2-supply: true
> >>> +  vdda-qreftx1-0p9-supply: true
> >>> +  vdda-qrefrpt0-0p9-supply: true
> >>> +  vdda-qrefrpt1-0p9-supply: true
> >>> +  vdda-qrefrpt2-0p9-supply: true
> >>> +  vdda-qrefrpt3-0p9-supply: true
> >>> +  vdda-qrefrpt4-0p9-supply: true
> >>
> >> Either I do not understand your previous explanation:
> >> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>
> >> or this is still wrong. There is no TCSR here, so this proves nothing.
> >> If TCSR is TX0, then you do not have five of them...
> >>
> >> My previous comment stay - you are not describing the actual hardware
> >> here.
> >>
> > The CXO network "-> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 ->" is referred to
> > as the QREF block, and each component is controlled by the tcsr_clkref_en
> > registers.
> 
> Still no clue what this -> relation is. Again, describe the hardware.
> 
> > 
> > If a PHY receives its reference clock from QREF, it will have a clkref_en
> > register. However, this register may be located in different regions
> > depending on the target. On glymur it resides in TCSR, so I added these
> > LDOs QREF required in tcsr yaml.
> Registers are not described as supplies.

I'm not descirbing register as supply.

    tx0-0p9/1p2  rpt0-0p9   rpt1-0p9    rpt2-0p9    rx2-0p9
       |             |           |        |           |
       |             |           |        |           |
CXO -> TX0 -------> RPT0 ------> RPT1 -> RPT2 -----> RX2 -> PCIe4_PHY
       |             |           |        |           |
       |             |           |        |           |
       ---------------------------------------------------tcsr_clkref_en

These components(TX/RTP/RX) can be disabled/enabled by tcsr_clkref_en
register, and they require power supplies.

- Qiang Yu

> 
> Best regards,
> Krzysztof
