Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974CA3290A0
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140900; cv=none; b=I4QPPlhHiEaHpmcjq1sWRrrSTNdP1pC6UPrAA5+eWRSwx+d3muA/N0e+i+aEEIl6ULXqDAF59Gt0PDjryuX+KkUyKzBye46QYh/JQZF4FSevLHJNREcj1WICkMya4mqBVvUe4+fg6NSjaPt3dltBETJ2bYWABJ2zsL3c/VXX/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140900; c=relaxed/simple;
	bh=5Rtl6v6NNbV1X+gpoGuS99EbUlh7f4FwWbPb3hKL8hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjnPZmn14gj/+EfYYSHoVSjE7ZckU70QoxizUYFFkfYKrSxPcJz2BFEZc7ftTjtXxCMwhmvLyb1GC2e8lYm8ub5m75i/7+CDXuKInhgvs4tPIOefpy03X3m6On7IgEdN19NTQvqRUncYNno087hIwahefxR2Pn4Btz7udgAneBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtAcGAxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0hd9R8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtAcGAxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0hd9R8u"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745oNi879574
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 08:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=; b=dtAcGAxI1vJxeRPX
	xdcs5EM7jPWFyZvW+Hr0iwmUJxqUNG9SNLnR0Ebsb2fVZ4R6AXcMa2x/Aet4yPgj
	irD88uGLXCIlWzvIm7SnCGwrdGrnXkOSL2LTkxalHlD+oGcqml5ejj2AX7QE63nn
	LDbrszYQeoSMY0JlEM1OgjRJGbmo1wmt/hqtj7/AypvRckjpUHGfiAsALQeUJzM6
	7Aw5ehk3+OSKjAy4eZn06Z6xlWEE0jfiCluuAxDGPDv1huzqh0Sh3mAJrCQAQf/D
	iiJ48JEyXd5TGWDIY/hXEmN7uL/RuWsK+i66tGG0DOYinHAiBCsSfIH7yER4XL+V
	Fri15A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0rux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 08:01:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95ce849ad82so23125241.3
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778140896; x=1778745696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=;
        b=T0hd9R8uqmuMvEOKsC2bNuOa48YDg2+KcJYN1UFPerHpeY2ANgOv4ZlaqYJ7+ZxgyA
         uJQ6yq0dmKt6c3/6lkw+RqvA3VnRclTdpUcBEKuT1CCekSIHSWJS+Y0YJGRRxWa1IDYh
         DPMPTm0c42g86IWtsNfCeeIJhfH8C/zVplk54GJidNjftkHE5WrzwVIbeF7oaiYD4e85
         t9E24vx96cYVGsW+jtelQv6Ev7h6Sdqs59P6G5A4tXTdhD75Jz7tr0CTD9kMJbZcfUYA
         UBf86sqzWXoFA5WscMNMFwHSsDFA1FTeBkT8ruMwiDcQqICjMESxuIUsdt/TECdzLD6w
         yOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140896; x=1778745696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=;
        b=iSd81H8uyycArDp/3O5HLkdc62Rct91NkVddqWsJPw01q07cl1Az+roM4a2rZkfFYN
         BNcs4vSpDFMryZGcsvTplfZF6do0dlxpW4GvNaV2gUfVBbzBBJGNALxBaflFnN+1r+9F
         6+9BUGnjZLxRJiYZSFt8/4B8GYMttbkLixhbz3qaXNszzOCncMvhfpPJNMIIqyvCHggr
         i1yFWgtAz0jMw4hRCIDWc+o8z4gfkwek0jW+6/Sy08+nGJeIXlS9JWhjMU39AiN+mkLn
         idoqWde8/7fai6fVtLmAghZL6frpNVsCv2o20FMiEzzkLFadsWkpPeoqEXddILu0M4ST
         SMBg==
X-Forwarded-Encrypted: i=1; AFNElJ8Nu1I0oiCRsHsrvmgBLSyd3rc2wCuS/dgPJ8gVz4RMnI5+UQvzzQIKYFYJ0gcfYTVh+8jVehaWgEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xtgyatCQpCJJaiJ7+iTnj4wSBpjYRRlAoyNED85f/SgQ/MYm
	CNP4OEkip4a0lMvJHaF4vXscnjAVuAmuJgBIW25LBvGKkp4nlGtkfl/6Pq1iKPjfrlKX3XZs1+o
	lTB5O9WZ5zIXfzA7Jc8iunDhBlXPv98j9i5cNoCIGt71Hd2pIXvS2d8vGiwx1OAUu916TiX0=
X-Gm-Gg: AeBDiespn3ORHjTijMKTeOYTksecvnmooxOzYlkmoBbQHpoAP3l8uIuCDUoSwtpzlgg
	h9mSSH6u0ZKWteUf3fBtGvX3em8gDP9EFaDrCf59SEuccbZGmyt02nroMFjpcH6C4KJ9OZ+gTkf
	VYh+VOwi4lJfcBNUDMwGCAowuBoqqyMcFKmSEXn23dH6JFN8qMxAP4kuLSOjCF79xnAXg9/9jMA
	h4ypoJTe10Zuq68sRHgrPaAlOV35w1eyqztb8bLqFlJUz0r9KFAKRfwfu3bZjpU+KOfSKnkqbVX
	D1Sqw3Ni6wNKnc39+lfPtY+77LgW/dceJWur65cUrkworCr1xwrvID8ofraIr0J0oV1i9n2uCZi
	BiBe/HQbAQ1VnEmZSLWS8kWkIJxSFfTAJEGNMlf/pcJmkaZpUOc98fYbDXw5CQ4GOUuqi9B00KW
	ban0eR7ebwWImvNg==
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr1182889e0c.1.1778140896050;
        Thu, 07 May 2026 01:01:36 -0700 (PDT)
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr1182854e0c.1.1778140895636;
        Thu, 07 May 2026 01:01:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833742c49sm52804266b.30.2026.05.07.01.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:01:34 -0700 (PDT)
Message-ID: <9545da0b-d6b7-4298-b86b-f981908c80f2@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video
 GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc46e0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: wKCnLPVl6NtdrDtGE472qWnNGlnlOCcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX74LNeoB59I0X
 k6JT1BY1oUZPKVI7C3clqdxxbIxY5OzR1wXtdCp5e3Eksyz8jGX8BhYTm2re9AYFKEFjAGgECWb
 DuzIiVpDPcuaBBmt26iu1qlx+AuCMBok41sKBxvfHCw5vtus5yjGk/hnPz6U+jsd7wYrZ6Ynyue
 c0PZS4MU0PoY0uqDF1fDFZwEUYUzQu8V2J8NNJQ7+NJTIl3L49NpLLUDP74jAk14dY9jNhXEUMc
 lcu3G3SETd8qAPV4Lw42wcVbGUy7EAicGHOi1B329CcxmdDpRaenLjGBeXnbmv6H5FORo9z8gkB
 C4CbjAjsbe/IR1KjfgQ8XY6D7stTRO5Bz8fqErV8yaoX1yL+z9Jdjds+hzCRTq8TEWyX/W55KTN
 1rwNFxS0CJbrRM13nv9uTo8JZaWuGZ31DT7Pfl4jbNi9GYkIkCp4VjIn3I07Lg3bhay6g0dgVWy
 TxRqguJbyzhiu2FxdWA==
X-Proofpoint-GUID: wKCnLPVl6NtdrDtGE472qWnNGlnlOCcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070078

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
