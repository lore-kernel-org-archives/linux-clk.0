Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F72E340298
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271229; cv=none; b=jD4XaZgxang/yZZD6TF+0sBs/Znl7DQIlk6a99s4Hathjmcnu1in+yp0ApXZx0HwUDu9MskOn7+X579h5BcV3ULN+YxRHvi2sTCA6ZmIbvfIvZK6aZNXF7lfn3qwYx/uY7nJj5TKyvD4lhbEbecqK5hJDeDI7To6m7dNjBP3CJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271229; c=relaxed/simple;
	bh=TAF2ljkTXiglz3efmjh6vr50tf+tfSJMYlApalKamNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgSIZuhlXMjmFrQmv4sE5ap0DeSV/md2iikdvAvGPD77mz1AVTE3vqvdnH0fSxh5evpykagihEDeLJiwALQ6Kum8Ok8q/nCDOcwABa8Mlj9nGWlX7QSmiOmAObxmYoGwuUVT1TcCW825jLsvfXt4ETsX6nK49F42CsFB3wEiURo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jA6rNZgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VG29yW4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA6rNZgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VG29yW4j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u2OJ3468345
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 13:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=; b=jA6rNZgHe1Wb3GaZ
	FmNAHX7DNv3zuu/hR4XfyvT/JUmJpn1VfwYnaH5Jnia/gWQR/UyAAVrWUizgql/w
	Aed5a7AAQ285z6/VYZNfmdjSWFaZ3yjRdXnjdBIkBBia7m5HEyJdFECsJwXmYY8y
	N3O7ofY8ybEEMwLnhlz8Rywx7ICNR1tTcaW8ODO2prZZeF9qQ7X9VG62CLOfs8La
	De8Rqp6lOliK+XDxgZpHO4YcfIq1Hnns7iRTtVN469sQRWpCj8u8jJvEFOcRi73b
	SwPUnLWiawiZ6u4x3ljACcsjJBdE4Ed74Bmo8/X3rubH3M9yg/wh+PjVmRWjbt0L
	6ztxuw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh361-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 13:07:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56cdc810ab9so487685e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 06:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774271227; x=1774876027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=;
        b=VG29yW4j18vGUf5obE3s+/yk5Uh8T1X2IjnUuegSzQ6cHfdA0khxdnak8vf9aXT18T
         nycC4AGhkSh/PTinR27yzs+LCpCy/9VkHSfvRJnbU5dnAU1vI8jFD7e54CRewoqVx7Z+
         PQOCFPm3L7DtM0m4x4yH6ifDI/kHaYxFZANPvLBaa64jORcFVmMdNJ1EzvwzrJF8qxRy
         n4BNkAqh0oJgYyixi1uMuKo/TTBfGzYRb0Qnr0dsuSo3ymKyyhjRQaWkoGzYK4ATekjr
         2dX6NqHFiefkUEEhBLCZrnA8YHR3/T6nOTh6VYvuR+mhyImKYoVcpzcB7z+sv4BbbvJ3
         gadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271227; x=1774876027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=;
        b=l7zFaPUOAfvArfETlocIXyieUSM1IgnzecjNzsNOLB23oyOVBqVwJGguZpzrJtHVqt
         LjPWYwBreURF/Qm2hUo0/uypNKcCghppGatBqRnGwp07OE+Cy9Q7+T+KsjCEVJK7J5B3
         3VKomswl/dSSqc9YaiFNXB9CO4FHXX00958yKjG98QFc0dN07SZuuUv/a6VLO5gRtwFR
         2R6k0qKS63Ctusn/vnwkYEzPWcH1zhDaHKUB6eKc+qXORjHQNKxNzpleeIimFz1vJCaF
         ZLA/Ou2f8w9NfYKLATAjJfAOKIEqaSpMmygLW9p0anp73gliNG/2TvS1Ftr1Y/ipELVr
         XSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTL8jKKFInbl9k5RodMvN4qoghWIYO/yqDyziVqZblEWVWuu2iaT40I7dgzUflLiUujIHrEuHVS3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YykeA/HhE4ENpmA+aVs06q+2Zs5GQqblIRbj+BfbnINLw2uBF+d
	6y9SJS0JKyonxd0CgxL9wi2Z9UhCTFBNDL/t+yB1HHULF1VjlU1BG/rL1HeeYPxNtZvW6IpIg8W
	hzMEmkanEvMX4CPG6wlaswHh1Wh5G1Tydy/AentZfNZlfzh2Kj32Z5mrJ67q1etg=
X-Gm-Gg: ATEYQzyugiQy3wyTTQbc1ujJ1FCyEQUML4PpEpAlWrvmbQsHDl22UUOFt0BI0lXn0K9
	O7SASndcFXdGGERIItEgAYOIYn43LTTSz4z/+q7nzf2j87zR3Ej8WFRxQaZh3e9hdMWVVRQth1x
	DQAetVdH3pOpWJFYvi/RYmmgN+BKMTfCg8k3w7HXREtfNOJK9AuU4bsgcByi6vKajgHwFAe1Fnj
	a2VigLMozaQo9MfXJ4ITanlWgCn4osOioP+716VwftVIoLgp0v1ttRV0PQwRSJKvhFkskGO03A6
	lqW4XjulFydpzVJEdgQg1V0cpJOvjY2PtJUUr7uqbkkwJZ3aT4RND8xeXyU0Hy4yQkXBNV6JYIg
	eJt6HSsQBICLDwhXxi4jmqfhEQHgWmsF4Jh9+wd04Uk5TkB6mNOemyOZiuAnG3jn0gnbtiM7Dkj
	bjWL8=
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2292523e0c.3.1774271226540;
        Mon, 23 Mar 2026 06:07:06 -0700 (PDT)
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2292474e0c.3.1774271226008;
        Mon, 23 Mar 2026 06:07:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d238edb7sm3897292a12.23.2026.03.23.06.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:07:04 -0700 (PDT)
Message-ID: <eeb9b49a-c879-46de-b272-30f601947d99@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:07:01 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur: Tie up the CX power
 domain to GCC
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
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
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
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: azPyXUGA_Y1-LqlCEhTsYoeyiiFwI-tp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMSBTYWx0ZWRfX/pGyYV8VWna5
 5/eaotMYOlcUI0X/0Froq8OxnemG9w8rbG94ZprfPq3DQmXKedqIMcz/6MsfUfj7VMn64n+ckhG
 k370NspPFA3/RH7r+AfC51PAAAcq5RdUKAkuqkTgr3CGs7BFV6VykmkZOeFv71glQvctlADxfuO
 Lw/83O3KR1/Ga+Qk1DeLHJtHPasCuuRRqQB9bbn41HBCvifAR06kabSWlBh3g6kSfTPAeHQVlqs
 vEtUdbeb6zlbNoiJwMw+XAIV6XMThk9vNKXrVGeRtLjY7g5IdNcel3xoQK93ZNpOj9RJ21+4NBu
 ftoWIrV+lgKzL+7BWq1X0iV+oWQ/pEhHdgX7E5UWNSrvjH7R2QZF9Ca3sU24OQ+Pg4rW0xiK3/6
 taCpuJx0q6J3u3lQhDUlvoFn5rHCzITFOevsNjxtfPNzi/j56wLUCuqzenViXVIz6zHIzKjm4jE
 Q+4nwLZOtO7chLztPNQ==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c13afb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OGlg79zl3ubmKLUECRcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: azPyXUGA_Y1-LqlCEhTsYoeyiiFwI-tp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230101

On 3/9/26 1:08 PM, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 
> So add the power domain.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
