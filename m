Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE52BEC43
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122385; cv=none; b=feWb9c/ZRNGJKvAuooCeNbCIsEoaD4qGyxz8nBWKkGrWWjzHM3zvY3s4e0gKFVDHJDWPlBDZBo1P8ZSwmdgwwLKfyLQYCq15cmC9ktZcQZY3F1Dt7HOtKEovvdf+W1y6h+fqOhumvuEyV0kzkFlBlqgUjL1RU2+/ikeEQ9IAUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122385; c=relaxed/simple;
	bh=q+7zjm3QauD0cdoSi39Jo9reVzr6JqwU0EcSEWe1mzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtBEbPP2Bzfw32RJvFHvfTpC3bKU/bL7cPd7upv0AI3HDZl1iXa2p1zxQn7f7ZVKYMT08ZiD/dV2IvLyjRW/JPNGmb7Rik2bdt19PlkRR0t0feJ4BApAti4UAgZ+AYAgIPs2wXf7oo3h8VIoDJPaBmOdBNVS7OEmvQvhO8yG4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfHtkWwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5TqUL4M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfHtkWwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5TqUL4M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBce4N3479105
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=; b=TfHtkWwz16hDDkjr
	LpIcICOfPQWP9LtEDyqw+rZmBSc1jT4mXDXPX1+Ag1SfM38oHsn8g+4S1bWCZlt4
	ZHLXtvsRmGBgq24yWDLi8UVz4XNZZcO9y2tjpLErpba93buYWjDICBjwrgBBko1b
	YbK+Hu4ose38nsP02DZVkiyppGC6oK8Gm+NCAuWjiHKCRdAfq+Ik3LVjxjafMvIh
	cxwhwzZwFzL/v3QEqIYyZ1X3o01807rWjjd+lG5Eultn0IJbDqA8KUtdVOLjvrwq
	+shqf0Cc0E6F9RhblwC+9P2qtdAsO8ogL4P1ZwqC2zNWTOmob4pzdvwn4cKKp38I
	JvWZKA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3u8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:33:02 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bfc23053f6so258316e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122382; x=1784727182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=;
        b=c5TqUL4MzQFAi3mqESIXPMTlQeM8QK92CAlJ1M8+YVmK7QBZ9Yh3Hb3DFUvrkY5Z1r
         hAXUMaI28BPaX3VWRY0Blao6ffR2aduFps7icJ5Ly0JngeGV2CmT7OiypWstaLCMX8hq
         RJbk87G29TFLOdFE2x1YbZ9TLEphp5ELartGcdjH8JVZObZjL9NJfPb11jaDWvpLcntR
         2qxuDwteaxHAxajpTu65P65owUnEuoKm+T0uh312sYtXtDyDNn4HViMF6X8kapATAmjl
         NSf92Oz2g49sGtiEkI3NGQ8AStojz5UkKlnUcHijKej/VcuSyU0G9R5uBEHdqhXPaXa2
         ctHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122382; x=1784727182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=;
        b=ii6LhbC5J3RgBbMguMk3887U3sL52IdmgebDiMVecNL4GpVfcnRRTTj1Xd9SLrxVEc
         PeGzZBNICYEz2q7+I4gWBpfU9onhn8rQz20Y62T5NP2hjq/t5TAP2+9HI/9WdpJtpfsZ
         RsoGprRlHKj0FfVCfFarc2yhs1KElU5N3S6svuG8h0nSt8vSwY8/eUOm69jSeepQs7EX
         SxeMOWggdtAmDeHYWN142/2YuAhhVifMVOr/OMeo6/NoroW8gxBzL5axCL9o6IjJS54o
         ZwI+kA5pVAAmYWE7mxuLoGzqIxvVB16asG8fpIDE9DtcTTNGRNWkvVtkhnXyu0zBjeHj
         G+FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8csDjuP5hHGbix4P8nYPPBGmtMt/Vk57YsUfU+EwBio+kPyB39P+8fup0xmiYRQwirBVnUFrIXwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YynvSETml9ly/D/PZGfDPb2kxXuR4mFRL06c7o5MHepqgN2ERHO
	Cs0Mk7JSIuW3uzI/NiG5fdWNuUYFmDc+VPmrEXEyHugS8GlKBlDmePmn31qqpl4f7Bry+U6ln14
	cB5imihAQcnj7QVfC+G63SGBQ+Ivr4QbbfVhuPKN3u3X0wTOdVMLOqpFz84o0N00=
X-Gm-Gg: AfdE7ck2fvtCJrlfcS9RocinHcmRXZ5f+aZInUg7vN6rIb+zpoU2EZITPtw2aSZ2yl+
	EfB0htU5QSc5nFF74bBw5yuCLAzdNCZbgF99mJULJMjytK3VfrDOn70mr7DmIYECjSAVd0/VgTh
	TXjg9g5uSRpiOZfzqx2835GAOb9Kn1R7HPW0y1qMf14KhOGbCLjLKRKWZmMeGGr7NDpPvnx7LOX
	1/FVDF8y7kaXo+qngfkcE5XeCj3NGJZECq4u9mOlxoT7j0A2Vn+Um0NnxoPYSvzxFO1rq9SWh7U
	2/ivJjOoMSudEk1i1vMwnfjdkK9Jf0KMeVdz5MXLaJSwilClndKrQ72yGUv9p27CICOHrpszW6n
	xcXMBg+WsJJw+cPnQlVy+KulCZKapPDulooI=
X-Received: by 2002:a05:6102:4499:b0:740:2974:57bc with SMTP id ada2fe7eead31-74533b1e81amr4012863137.2.1784122382028;
        Wed, 15 Jul 2026 06:33:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4499:b0:740:2974:57bc with SMTP id ada2fe7eead31-74533b1e81amr4012773137.2.1784122378668;
        Wed, 15 Jul 2026 06:32:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168731831esm26739166b.31.2026.07.15.06.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:32:57 -0700 (PDT)
Message-ID: <f8be6eb8-00b2-4f34-ba7d-f66f1982cab9@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:32:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add CX power domain to
 GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-3-72eb5adad156@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-3-72eb5adad156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX2+pjKlU08QK8
 QCJUXkkDjEeteL9rE9qhzdZh/dlxTZiLjxK5Gjg2EY0gOvkXZLcK5o07RG8BB1YN0qrlP/KeHh6
 Ebnpvc1gG5Ok0UqCmdmN7BVBaSYtQig=
X-Proofpoint-ORIG-GUID: lS1P2uLd75FYSGRj2i0xSQgwd7NQk1HE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX16eAVBgP3tOf
 3PZAxdoEi3YX3HuKz9QBotz+dWDuK6ecrdEMknAD2iBMT86B8k7B4EQEoQEPDeg9RO3x0gngrUy
 65mxIYyFBKsGpqhNaK+VmYs5sD6LXivGNUyxgL+C2FnoDCDy9P9rYDgx6D2JE6BCG2zkcffLDYf
 yTCQ5wVlsSV3A7ZZsWs1dqMSDRaHKs/PVwbzB9QjTztxnETTclM7O0b8SQ4oPQYZzQVNOwT4R+j
 W1rMj5siMCyQ/YIzi96h+2+HX8yZYUkYBOOcwtw2aH1l8oWH4NmU6WB4yVFHlhVxMBiKJqos4JW
 RlgrCTCiqyDH21zASx/q3mTUB0HFqzFYDJizHDM+SNxgic5ooc1b1jRDWEokQOoFGnfLdUl+oRg
 eWpR0PvMQgoqWX2RLfj/84fSLwmO3uX9q60X3Jvxu+lx3FKAiEqPiZrx0ZnJwFuCosZolJ7Dn3H
 Be4H/fLbSzxplF0MBYQ==
X-Proofpoint-GUID: lS1P2uLd75FYSGRj2i0xSQgwd7NQk1HE
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a578c0e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150135

On 7/15/26 3:29 PM, Abel Vesa wrote:
> The GCC GDSCs on Glymur are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
