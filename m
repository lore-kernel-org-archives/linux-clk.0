Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000B12745C
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256302; cv=none; b=J0mZghfH622/U6Q7k07pzVQw/zs5vVfJaU26FuPppf8OmT2M8yw6KxEB/2755QL9lT7lNg+EqZt7ZUa43zgO6GkvKiiQCpsLqngiEjhd8ozYrbI7iIUnu0B46ThP7cuiUE9sD1etnus+26Z7tjiq4O7UAieHwCWTZL2wu+3NPMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256302; c=relaxed/simple;
	bh=umAviro1edzALVbCFCHUlVXgedSDoDxm8M2/FJ8hrLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h85NNycQdya6zecYhPp7m5VDS+eXGWtRjOZ/mXQu2CHpWPbh5zIKRpkW+WGwzfJVThjNsbDRP7ZMKMKm4VgOvr0ZKTA/CXcyZeWs4SHSlgDJKtygbfNDQCF29s/NwH9ejF4zKm/jJ0G6o68tNJyeESPyeDCtpwgYuWlOAGA3gsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3dgx7uJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXGvcOTP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3dgx7uJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXGvcOTP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G7vpuR1657116
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1Qzz6cdVTjH6+h8OfWPLz0uRUqylqVjSN2D7URxDDg=; b=N3dgx7uJjkHhLU2W
	PbgGZyh2kRkmcxgiKAJ+VW1P9IuH6d07MeumvmUU0+lSy07KxKn2ZFBrsvfzAcE8
	12sUGQE7otWYh32+4cDBGcN24eUcEgcwcoGrj9glF2JqyewtFIJ5V+MfDvz9Hir1
	+E+SQFBRuG1k7q9Vmx4zbNBllvb1wi3SH69wPzGboB4SzhxHU9psyf/IitROU5NS
	q26vEGzhmAD31k13L9ln8Sol/+RhkZ6OukFrW+NAMaKujRH0Y2IHcfTBugU29xHj
	QrR1u9CEzEPzyw0inRmI1vAV0Za1U8AtHBN0kQoifoMo5WTjIooVij4ILdidI+vZ
	Nyj2xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw2ks0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:38:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50fb0abdso195529385a.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 07:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771256299; x=1771861099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1Qzz6cdVTjH6+h8OfWPLz0uRUqylqVjSN2D7URxDDg=;
        b=BXGvcOTPKZvWmughTZg3fetZZnR21G5WLf2b0+sQoK4CWGGj1lBazKZ3OSPWFY1uQ7
         B8utjyuN5AlemtvVxLEZKp0tqqYnnhr5K6l6tVu/hRwHp2I/GrsXra5KUnvlg2pEMjNh
         CMaLKtChxC3tH7+0wrAIkPlGrgBbD0wPRqDSZ3jmKiSg0qY67HcZ6FPAcmzgJXyHAGxh
         MCkxmlv7js66WGu7FBpnYQqe2reRjzxp+t7G56iJAFMMOShXwA7lmGSzgwQjlM7Ofa/m
         paW0C56l7voDQAX3emJTxgl+ik7ytYe/JMaIf/qMQEVNm/cYdLukZ++j+NvsL3VmSNtM
         TICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771256299; x=1771861099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1Qzz6cdVTjH6+h8OfWPLz0uRUqylqVjSN2D7URxDDg=;
        b=BMX7nTGKfHV611il0+bvIUOIUtuwnKQY/Y4M7ZCN90n2uKV7zseifS+jdTd6x3cJEA
         t7h1Ewcmpq5swZ2orRXi06IuSl/Db2kvSGiowvYB+L/4XynuU84VUJk6YGfF/+9ilCI3
         UrGvB5F6NVCQUVzj50uFx2iroUkr3ifX/2BttbayyOwDbxpe8JTZdM1SeCh8euHlc1FL
         XgJHhvppCnKUtPqyUFCv2DAiVfflOv4viOiagBGYOuKRWihcXdiLxZPxUa70vC6/6J4D
         MtdgrU+gsWmDdzVtCsTokBu94i1hYMXDj1d/cHMR5j/GfaJ3JhipChRsArBM8mpcaXdH
         6cAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYYq6GYtDfD0UCBxHOMjDPIz+WSwdv6SuBP8jz8/X4F2QzdmMR8ivKIFGAEtv4WfwrF89+Q1vskZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEfTY2SFuMyx6ouKCidPAKU/pRcyjN5Qo313c7fIrW2C8loUeo
	RLWap7S/0wJNaHBtmpZ2QzAVdSHoUFBDLhJsLcNFOWu5ZSzSOueuG1SUJTN07TqdleadHv1+eJO
	M9s46VKyRa3XSwMt7ADjZnit2eOMM+coNev2EtxOjI7whvwQ/jVN3+0HNGDcFjg0=
X-Gm-Gg: AZuq6aJSKsnI3l0oVpohbOmsPcsRaEhmYeVv/rRjlNkbxDg7u7sNtIbG5GCMbvnMceA
	Q8gOzSyrn1wMdmJa3fqi8QeNr+9pTbinbt7PVNDataHqQltEjbxHVL1Wr9jDg9oFZwySpoimST7
	IPqeg90JGj54AYb73EH5byPGKu1S29TczvuUexQ5jA4WT7IwvhRX+Wz6AINznRKYKYFvISt04Ff
	oOAxPn2aawzjHFmQ/hX1AKhsd+KPCU8q2L6Rs8JAtXV5Lqxtzjr6GqHhuvxvaoE+V7R4DXixYop
	WgsjlEVPKNMhLqWo9R5T130LDIdlv9JpvZ7zWozvY6ErKoQbGTfktKnh6AYWVP8BRUw78lyurIg
	lqSK1j2toMEt5OqWXoxdUeYiWtk/h0ZgoeyTQiMcp3Xrrniob30TnImnqEph0R1RQIYh93fRXmL
	j3sk8=
X-Received: by 2002:a05:620a:472c:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cb4081cdcamr1126060585a.1.1771256298900;
        Mon, 16 Feb 2026 07:38:18 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cb4081cdcamr1126056985a.1.1771256298348;
        Mon, 16 Feb 2026 07:38:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e587sm262157066b.2.2026.02.16.07.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:38:17 -0800 (PST)
Message-ID: <d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:38:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock controller
 on Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=699339eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KMfLPvBZmY1kkHWJjzAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qM3k1J7bAKrbVq1B9VLO2L3ojMNhfzIq
X-Proofpoint-GUID: qM3k1J7bAKrbVq1B9VLO2L3ojMNhfzIq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEzMiBTYWx0ZWRfXyNuid8OTeSNF
 bBUI1oPBcs1D2mu84gFa2PZzT8c0nuxzaDImjUrUBQOBKF+8w7gfKar9w5+jAHWuo5dKFTnJ+ol
 OxoZFaDIPWjtI85s879YK50uEwZmt1jGHJJcMUChfAf85IvBVFoxtU1eDk7+vhZgF3w+I2VDMtO
 5APyMa5eIedyF2E90nZt8sH/QU9KAKjgBRpVgX14h2XVWO8HBwlibgCVJWitjCWHu+lyQ/BeVYZ
 b0g5riHat7LMwDPYNPBJrZoQBUoRhwYI2A4zXlBmPWOjHrxN6iRMK7VuYiFE3itHtu5eCrxt22g
 7SCCwa871PcB7Z0bfa2ojetIdEtH9G596GCKh+0YeoKgyFNz8ayyFVNtj+edvcP0jE0cjt8ulNT
 cUe4DzKdyFNP0GvE6lLBfYZZpD3tP5FtBiCWGmIpwyDso1OfoPKUjTCtMM0G/ii9B2ImPX2AzPh
 /ukQUrgzSg8if3kyywA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160132

On 2/16/26 2:43 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]


> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {

This and a number of others should be struct clk_regmap_phy_mux instead,
cross-check with kaanapali and remember to drop the then-unused parentmaps

[...]

> +	[GCC_CAMERA_HF_CLK_EN_SLP_STG] = { 0x26018, 1 },
> +	[GCC_CAMERA_SF_CLK_EN_SLP_STG] = { 0x26028, 1 },
> +	[GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG] = { 0x26018, 2 },
> +	[GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG] = { 0x26028, 2 },

So SEL_SLP_STG=0x1 allows setting SLP_STG to =0x1 to assert the ARES,
otherwise if SEL_SLP_STG=0x0, it's controlled by the HW state machine

I don't think modelling the prior one as a reset is valid, but I don't
know what considerations we need to take wrt dis/allowing hw control
here and what the consumer expectations are.

Taniya, would you know?

Konrad
