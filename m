Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A43D1713
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927041; cv=none; b=SsvCjCWIkMqQ5mgWP9JXBVz7aZkDvImf7uUaniBv+hBpq320nl4bpoDkyY9yZWzVAmmNj4RxTSehjysC7/FAiebcfD6wca1PrAYu3zkgi5XSgcDTvBi2ode7SJNVuogkAJHt1x6v8MNVgIw373Z/GHE732MphoJ0mFU8gU8oVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927041; c=relaxed/simple;
	bh=0fe41+WI6axE/tmZl1DmSgsC5MAEfE36ueeyk3WOP1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/6qCHMxS4lPcFlgyDTOEyr1LyfpBL2FCeB/w19hAiIogEZj50qoBgSoT/TLMR4c3D+kOt8mekeB0S7LM3dG8yB4JlP20BN0tqVzyvxJhhqNgMmtkYbnYi+RfEmPkXjDiRfqh6O58Di7KzaV4wt3c3fldqNlqDMFhEoLZ8io1ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqwtUNsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3qE2BW/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqwtUNsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3qE2BW/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3Ek272956335
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 06:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3E+BDv1BqtNk9uvpqnAxiRVc
	A/9n0o1mNCepDC7uVrI=; b=GqwtUNsyZeTN1pifBEb6dyC0JklgTlh/AXGtsZ3J
	oqaK1cZAeQoHonV5VhqIeoNPqOyX9gc1RAgyWE5wPy1JRFT/j4vjy57sVnrdlJ8n
	99koa3+00ddG2Py19i9G49X3e2RcrSSxzNpMET/dwerZTaAbpAlmpY90+mbRsL6a
	WwcWQpuIG7dd6sTQFtpsHUVwcEx0IfOX3nEh1uI4zxN5oEa16B3wEH84XzStnk6+
	yc6KAR3Enwv0gop9eVwDzNTS9/cgf1pDXK+u+8tNWR1ehDUuxURhSPJ8dLcuH5IZ
	n3BH1gMuUKNsOnqTXIq/K6ceXW/OQeo3N5GdtPUCVZ8jXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q2n7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 06:50:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so8567424eec.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776927038; x=1777531838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3E+BDv1BqtNk9uvpqnAxiRVcA/9n0o1mNCepDC7uVrI=;
        b=K3qE2BW/QAs7e/qfN2g9rwbx1anPa24OryjVhvGfbZEYcgIl1mJYfKMUQC5HKdpi/w
         vjFmCGHIJdHfjfX5jlK2QPuz4hSmPTd3Y5Ogt9CIfOboubxfTSJuitsknaWt1Z+Noab6
         xvN5QhBFJL/YGaZaviZctgu95P6lxlgZ8aN0gLf09rWcfvVPr8e90mT+cjXWEtw7P4e7
         zM3llSIx/Qy1WvrjEoWLNV99IIRKMIZNr383URBQz8U7Is+XI0VhNgRC8c584B+xfW2F
         796XNbUn46EuL9ug4D6XStrxTF2uy1u7nAgn0245UpUHGimaeQ8OFYvTmL9XIO8PjDGv
         fCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927038; x=1777531838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E+BDv1BqtNk9uvpqnAxiRVcA/9n0o1mNCepDC7uVrI=;
        b=gm6bE1Wf2SIFFWi/tgcExUrg5M6rPQJAHiNm6iU5D6IAsedNdtmEiBRBReJYKC17HZ
         Z1z2BTp9lqKFNqGtDdNiQpFvIaPLKq7XGMCszXyipFmOyFf9PtI+YlfylWgiqlHBWUHG
         APbWvf8zBoy2wHmPfyOFTyJ/4FumvJghVXdYmpmbo9voXbXVg8U4CuhB0twypHwr498Z
         plkJDoDcTnVPEAD2I9/zGMzoJJZ8yY4V0pK2xzkqbfVNoNn2nMX5lKQARlUwmuYH36vt
         UxQ+wlwLP78Kgp2hV7558krLl0ZkSNdXAdVkZBR+VsAlVqht+yMXqYkS20aSb6dxUhVU
         jV1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/tYsdAHvDtcFKZxa6vtDfbZelHI4+RfPD9lCddMX/6HmwD6YDym9xuF/wdl/p3pZxDgTxFVkFowow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYoEvgwQmOXZ/LwqEn1UVMhpmnDNOpQm6OEi6nll5lhroBDJpq
	r9U8WSNwcGWsvSs7EhYqpi8hrH3TGchHfvkbHjGcrbjP/+r2P7SjJK0ng0n8lL/Qsi7xFmYBlYw
	GUT2sBFbAXfVgkK5N3yp6Mtz1PhUPOMvJ+wmsuwQGhWr0gD137fURlZ5TLNfLvg3SBjbuF2c=
X-Gm-Gg: AeBDietOqMG7UrA7nGyBRwWmTZOEA8fuoAUShgFwMdr2Lxvpb54zTptfWWcwlmMrKtA
	IEv54+NHs+e3goGt4XhwAugBKc56Dyak/JyvCZBK62lpt3zxTtzDjB4ru6GhA0r1X8Z9Y+cfl05
	jEmBLNIbanAraU9K0cIWP2vt03RkYhFJVe3IiWRqwbs68JaTHpuVan/y98LHuPx4SM9GoBLTbAw
	jtCzwzU6nksRb/aRN7GDWGCVpmbnfCo5IbYbjhoujrqc1l2xvBjrDdS7gTFIj+ST4kaxyjmFihg
	sobPYTLRCRZ+xPK7cLjRnipnu72J3GT2BC5kKFAuNnW3Kqax3ABeJFXN4bLQdlu82yACuXtVfud
	mQuBG5NWTRDC3Rp1rgOcK6Cc6U/BjceqHdrKw/yvMsjNy+O74g7XwGRMVo6+YPu/c9Gtz4DZMwl
	jnzWc=
X-Received: by 2002:a05:7300:fb91:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2e464ea4fa6mr12166481eec.4.1776927037542;
        Wed, 22 Apr 2026 23:50:37 -0700 (PDT)
X-Received: by 2002:a05:7300:fb91:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2e464ea4fa6mr12166471eec.4.1776927036986;
        Wed, 22 Apr 2026 23:50:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm26260515eec.9.2026.04.22.23.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:50:36 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:50:34 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <aenBOtb57KmUY5e2@hu-qianyu-lv.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
 <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
 <177667583832.1359985.10364830499161105694.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177667583832.1359985.10364830499161105694.robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9c13e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aLEXbJoCFh11svoGBvsA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: AJZLUGE4jSwy-QB_JIYsO15GgufboCU-
X-Proofpoint-ORIG-GUID: AJZLUGE4jSwy-QB_JIYsO15GgufboCU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2MyBTYWx0ZWRfX2bfJpuiv2gsW
 jIoCKksTOrgMElpdtcVm2CetJmMwVzG5zD0XbtQht33KpU/LkEG0w7VsdY8o0b9rlfmyi+QH8ND
 eaLnzOM6BefgVg9rc1TYyKbPzyu3+1WlBp8IKMtWKMH5dEvkl++LdXBy/lxN5WB9YoY8JKcv1id
 bl6MJIWgywQkaq12XBQuT8Yz3UbfdbrHYsvtpVqT2oRJA2n5lbEi8BnAnMaASppcShAZUdrP3cD
 qclKvoUg7Pm9cD/df+2tfPCHmx5j/yD8r8iifQjrAxgWqc+0u9dK+cOOa+vzS6Fs2bUp2KpK3y3
 p+c81niTWWzFvXPQes0BWpspcJpg8WIR97TgbcW2xM28SsV2VW8I+EOjW1L+MuaeZNP0sqwDSWo
 9IenzuzyBlZbTva/KqaP/cKxo6j6E2EZbkuqeAOrD5xMxT6ibZv5lMgV1HtSfKoE/M3emXMM4Y4
 KP7tCwPmYciKWOnDXkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230063

On Mon, Apr 20, 2026 at 04:03:58AM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 20 Apr 2026 00:42:52 -0700, Qiang Yu wrote:
> > Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> > required by clkref clocks.
> > 
> > The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> > QREF TX/RPT/RX components, while SoC-specific topology and instance count
> > differ. Document them here for qcom,glymur-tcsr.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 40 ++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
>

Will update it in next version. I checked the pcie phy yaml by mistake
when I prepare this patch. Sorry for that.

- Qaing Yu
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'if'
> 	hint: Keywords must be a subset of known json-schema keywords
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'else'
> 	hint: Keywords must be a subset of known json-schema keywords
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
