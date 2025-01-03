Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0161E3DCB
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907621; cv=none; b=U7XV9P56ZFIL+/Jckx3KurQ0aPv8tOTQWTNope32+WHoRrHHTuvbEQ3tx5jqzTGRnNsyxrqPLUrzVOMxDLVLgSvz8n+zqz89ItfRntpFNjzzrhHjOkzGscyGbsRhws82mN1xBK4u85XevKDka2q1tyAJIFs/2CY8CTxDRVFa800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907621; c=relaxed/simple;
	bh=pEzUak3KSwcyxR/a9pc2u+/ko9TsfzXb06M294EVjmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ty2ecFL/XokDAP9Nd8WzoOKOsZ9HmzPkeEkrQEwtNPiTGVchzqVT/eL+GZZ981IkKOljTGYV1NqXkkzlvQ9jK02AvnLucnEDv0KSH2VJatbLeTUObw9oDYm7wQNdXQFe3oPYbhUcdrQMS88hBo1v8fyUuEw0r/8/MDS8DCxQxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSU6ysg/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSU6ysg/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503C4PJ4027876
	for <linux-clk@vger.kernel.org>; Fri, 3 Jan 2025 12:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2Dpbmc/KnZM07+zlG/yLj5EEwSqvLtt5wQl4yd+ONY=; b=gSU6ysg/NIkk9D+9
	++Vold3gv781AW4DhM6aV1y2JM2HGBq5Dl959mngtiMICh5ZuZBAsXAFuuJcY2t5
	9WPCfXdxrRY+lEhPWgxtGUw1cYWP8K40P5X2OOp9BH11L8yNAPCojjUW+qqgR0Ak
	qK8E0eJpMydmFYoGKx3RgO5JS2yW2C8WiaOwGgK0+5L9lPNDFbVMljthACC22V1G
	44mj8AfzHxpA8YsaE2S3Eyzlx/9yYFQRT2QUWCxqBvHb6RvBHW7W7kOOELG9aLo0
	t5phHpvChr0I6oJHlwsag4buHaULmge19D3n5/9fB3MLUSujjvrK/iso4GxdVVnt
	rL/k6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfjk81p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 12:33:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679d6f9587so34424081cf.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 04:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907617; x=1736512417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2Dpbmc/KnZM07+zlG/yLj5EEwSqvLtt5wQl4yd+ONY=;
        b=iPF9Y49y06OeoH21JDL6FIrjEN35PuOwYrdIv0sic/f3hGCS8/UWFYuUCeFQuTnf2i
         /xKfynPB8HckuQjOqz6R5rr9MrH0j4lFib23xsX6ZJx4Bcb4B1rFGQN41oT7cekTyLF5
         My3CD7v2kw6+zREA5QT1tmGVei8jN6cimwgEPsYfNkPiT7bAsS8DqcLD1EOR0f0RNcso
         mZOGBP8RShwgDKc09mRSlypHwPLjbMiHlWERUXKgQMPxR6H4G2BrPZx4riRvwUFEHrrh
         z5OW1yMRdjcvNgt7WhV8OCbQXyuL20F7hjcVz+Q5FHLtOcmY4IxYJ37lrp/prBszO0hV
         jFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW83w5tnawLvkZvMEreKgxbLSAfU0vghHkG/yIZktzDv+1sMG/Tgd6/KexjVIRrwZDkzFZoa3usj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ZbcvtEYPCmP3VBoF0teSERVm+wqEpB7llBbjUt/6tZevq3QD
	x4E3PDAhJxRCtUJaC/OK7Dh2ACOBfxwfCzgczoCjUY4l0kHaNYh7tt9czxF1HnqBi5MNJ2kV3Rv
	aN/Ym+YpuI/BWt4JpeTuchjy93FrKL/EM6WDSxb+s9f/EzzrmNQRCy+lKYEk=
X-Gm-Gg: ASbGncvGq7FGqDnJ3Tx5ma1Po+9QUTGYmXAUeXtQKHj8YFC/Bx5D6fGDbf8T+T2E4Py
	dB4iCi8OxUGS/VvLH98GtapBS7RT05D4QYW4PssageY/hY0dXZVay6aex35fONSKihKElVWjSQu
	HkyHkseWECMt4Fp6Rt8hCDt8SmUoMLkC580za33bZoJ+5lHN7Es+GzBZBwfAXaXjFrTZ6bpJTOb
	TWJxwgZ2MNA615pmTYJaXvpTNiC13NF2eHQ5ukmuuaDXdPTtTW558nNk87/JiFxeGW8LHh4K8zU
	Wrn+5BXPA801wTgm8LCqUyj1jO+nH4cpnsk=
X-Received: by 2002:ac8:5a4d:0:b0:467:5462:4a14 with SMTP id d75a77b69052e-46a4a68fa9bmr291986121cf.0.1735907617233;
        Fri, 03 Jan 2025 04:33:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnMA0EQ857HFoyRLGK5cmdBugpr0LylR4BGIjaNVCCKL8WAfGOH/wKHJw8YeCRcmbXx+Ybig==
X-Received: by 2002:ac8:5a4d:0:b0:467:5462:4a14 with SMTP id d75a77b69052e-46a4a68fa9bmr291985931cf.0.1735907616857;
        Fri, 03 Jan 2025 04:33:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82ed65sm1871999766b.33.2025.01.03.04.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:33:36 -0800 (PST)
Message-ID: <aecff79e-0c14-41e5-82a9-e24413798e21@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:33:33 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
 <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-4-cb66d55d20cc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-4-cb66d55d20cc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q5HO64eoIwwTBVIQYF4s48805h_U9fPt
X-Proofpoint-GUID: q5HO64eoIwwTBVIQYF4s48805h_U9fPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=878 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030111

On 2.01.2025 5:32 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
