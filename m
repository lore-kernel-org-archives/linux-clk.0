Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4565737998B
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476139; cv=none; b=KCf56wBdU4LQQN3pSCLtJTfGbgqClwC1td8/HjBwrnhG9PNnYieoTHsIW/nSuvQFvoK3i9wioNG9xYgMZ0sI4+PcV1rJciAgQgkbvNV5I28lVW20yXgVVwQMIRMZIsr+UyYJvaSucA6/nj4fVBakWvmQMPhTNNBDrIEVOzEIxqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476139; c=relaxed/simple;
	bh=ED1uKMxhbgsFGIedSV0n7ptkbizayLFznKuIOuFpXeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpErSpDoK5B9BX41BjtHu9HSJ6twF1qzBvTiXWjiW815fbLOA0TgjIiMA+ddPK+pbDmIG3XqqvYIAVOELbGtWey74ajMNOby5zoYDDeT2tGXzkAp6wDgVpbt/QWkbi4iI7KPPMJMYStC6NaZ2Rx4vQahozMhBjLSAjBDyb+OxA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmPniOEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tz78qWwV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmPniOEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tz78qWwV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCecLu317267
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5mnuZjemqdu7hzirtL/WVIH/f1YJBhgAHq6MKdruYY=; b=EmPniOEjWMm+YMkl
	VwpCMsdX700nl+oM53QBVJVafLFG2S87JhuYUJ13CSUTkvNgLcEXplSWfh3jRjwJ
	awOiPn/rBYxUVgWZSaXsrvbwDzsYzItgyVrjLPmMZsOmES21OfGp58I+p9C3tdL1
	eQrAXTpWWE9DnLtqXtOWYBh3siMTyP6YJLEDQH8LIkGrKhyvFfa+V8knkS81o4GV
	c4dqujzhGgnjg2hGILyzY/CwUGjK8plGw7QrWjwMCtu5Ei5/6uV2nh/j0awYOi7A
	jCepQKamI1ZBQz3nxbW6ZoQy8uGQpUZaYEBGM12WrPpuqs92Q0Djhpqw2OWbuVPj
	A98chg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t8kjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:22:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d402a0cabso11453179e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476137; x=1778080937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+5mnuZjemqdu7hzirtL/WVIH/f1YJBhgAHq6MKdruYY=;
        b=Tz78qWwVpeO+oj3jghzq2GN9X7iKixtvudbe5g/FiwPKNVdT2xL8kF9ODStqG9PW1z
         ca0lxCS5umSu6kjBOxb48zXLKbtYbt/MafSiMnutgV9MjQR1tHBHk7z+kMuyHTmCEcra
         HKlOvq0GbvgDeu4eCiCZ+NEQqTI4BseWU7FFJuN7h7v2gmWmaqesLDTNIW3H7EYcAZ3q
         8BPCfFPyHLPIaerj0pTyDsJzVxqTxlURQIO8cjmclLcbsP+ADXkI7sauh5ps+IF+3IN8
         rjfEqlanel7hCJtD08lVML64tEeVstjN8HcK1kPX5Hksi0u9lsr5HDaZ8rFazx5/9ulE
         LIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476137; x=1778080937;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5mnuZjemqdu7hzirtL/WVIH/f1YJBhgAHq6MKdruYY=;
        b=TkebFrnbcHjzut3uJ1Q2PXhmWX46Y7PH7TE4NH9ocWaW+HLeZuQXKrZu57QjsK+Fju
         kJbxPGrpBFnpH+12W83a1MXfifeT9gzVpnj4vqVnEWQ76X7QXgC3XMxqMHfrA4L6IArC
         oe5Q1gp39Aquc1YSJ3tox10vZ/1ATLYdFcHssxO9MCkiwcPuEtEVAuY+lK5mj2J9LgOo
         Du3KZ84H6/+f9YgTmJRSOqn6RwdWDXvG/t7bi0Fq9e+IVeC8/a8S+DsqXOcf0qMRlQ9h
         OORYw4FmNM1l44Lajm4r0B0bRudAzkK1vuyb9La3hmMNGhvsFzijr6xh3HQwFb20LEIz
         5YrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wi8YInaq6gWsepnu9oeRofphwC48HkLXPPGqlPiztEA4blRYMe+iZ6qs+mqjQ5+AmkMap+OWnLrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhew3LJDnULA94PCVTx5IEgqypG+8p5XH+Z1Qx8ln6CwdLcAY
	9+Sl8PmbnhyXVH51j+myw3H/f4vlMF2h7Iz2K4BD5cNiyFUSeNkKGS7dHhbfbtkVtLgUvMAlwy+
	A59PM35vrJmcfblDVPxUpo+MNdYbaJs51OCYXeFju17cYNqcilRXiUuR0IBwKHnU=
X-Gm-Gg: AeBDieuwB6lBENygyORHhp/ckRY3iS2etp+RvOvlLj3b2rYSJfFgNg25dYPUbCPDyvh
	KqHamjkARLeFXAWBrPFMr7sja7TBORmNtoh2HpG3ycHV7tufDtIddKwVbrok3SSW+WM2NTkBg20
	aU0aX323ourIqp58qIQYTRFHwg8bSMrBHhhZ7GZ9DjfMg5auwp1txxqnFgjgf15QVThAW5Myvtt
	27pfeJ64qoj01LswvcnV4youtmQGqJ768Rpvtj0KM5GC0UH91EJ21UaTxjlMv4VvFHKmLxuQxCE
	ynZwNAGDv7/B7D5JXWesy3U5GaaXASwhpXsz80GSgNwVi3LQZiKm5vB5g5a6w2o9X79e+RO92Qw
	ZpvsvavszXcQ4xNZRrr0k/7IWjQBl7fOWWdl9JLNEcDXG4+7HYWnC1n7jzbg=
X-Received: by 2002:a05:6122:3b8a:b0:56b:5e7e:d3fa with SMTP id 71dfb90a1353d-573b35ae17bmr1995397e0c.7.1777476136488;
        Wed, 29 Apr 2026 08:22:16 -0700 (PDT)
X-Received: by 2002:a05:6122:3b8a:b0:56b:5e7e:d3fa with SMTP id 71dfb90a1353d-573b35ae17bmr1995367e0c.7.1777476136026;
        Wed, 29 Apr 2026 08:22:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c57333fsm54194885e9.2.2026.04.29.08.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:22:15 -0700 (PDT)
Message-ID: <f9148fc8-31ca-4400-a12e-630c80db020b@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3p2jN8EpbTis2MnttJAFjwuMQhEqMNDq
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f22229 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gVjUULPjWigP8M3rbEwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 3p2jN8EpbTis2MnttJAFjwuMQhEqMNDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfX+naz3Ez6pFDd
 lJ0NfHNV5AP8yyefRJgUFwe6MT3cvTB0SAkV6Ephn7l6tRepH0JXQb/rzNm8JVkLR3sRNJxUlc/
 dHhcmosdXZouxuTrPtHxl9qcYaErU9USDE9V4evMwo2gfYYr+x5QIFMtAUFpeNm5wsPVCBZ1eFq
 MifsoaB6MVfhiMjDD+2CbbAwAQmdePMah9JfnNYlg4VL/5L6JbhuZwbWOH5yCXeFLoxvQ67zGXH
 TKrdyZpwP0EU3Wvj1jniIRDTLfQnIhRB/mweW1G84/eQGyqClRgpKPgUA55/JULJxOV/doqXpOe
 FSd51FvmePTq+dOz1PSKQYJ/Wj6KWP2/5cHq9WC0tVN3S44IjCXPPTqmUId9eKng6SGdXXq5IK5
 2zoXnxdfrsCsHt0/4BRCUVWG5d2z7tvUntZYAY/Pvl8Au/eQzBXJE28E7I3HqY1Y6s7Wx4EIyak
 1yR9PXrN9XpRPVNu9ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290155

On 29/04/2026 16:14, Jagadeesh Kona wrote:
> Enable camera clock controller driver for camera functionality on
> Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

This change should be dropped instead. I am removing all Qualcomm clock
controllers from defconfig.

Best regards,
Krzysztof
