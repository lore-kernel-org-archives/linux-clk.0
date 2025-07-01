Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94031D7989
	for <linux-clk@vger.kernel.org>; Tue,  1 Jul 2025 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359466; cv=none; b=AU36ryfGel/++i1C7w8f4bUrPGZ/2NxQNmpPoVtJuOUax0qf13o27OBEZl/ZBYBmn8yAwPdNb2qFM4BiLyQ6ftlj47HUEB0eJIjlyjs5s5Z/+zx4Q7XQURIWgRh29LYW+Pf+w5OwW5Z0dfw1NjuMNPVIfgHJEWukk1UHxCVMqaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359466; c=relaxed/simple;
	bh=ETahjvfhObWfhp3wH4KH1j1xcBmeV7kvedrPys7wXik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jk0Eym2jLyHU7+hGef1gTsgJFLIvowViPKNT44ZZZGPryTd/+QuhZweqC37/B91LUfXOwif/Xkk6vOtd/OENwo3b8qazAncOfqyOI7YM3Lm6d9D1NoeIoGjs1iLMHoFgjcdKuAkIa5+B2jx/LX3SKEyNhLrgLrBDMOci6qLUpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTmc355r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTmc355r"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5612vANg024827
	for <linux-clk@vger.kernel.org>; Tue, 1 Jul 2025 08:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yf8OXMx4FGnWdIQA3MUAkQiLT+ux14ax47Cw7Z9XIeQ=; b=LTmc355rIX1vCd4V
	QbKXgSVG2hnzEhL4Ak+j0xi2wCu0JbWCm/5pLIIYILdPLgozQFThyEIW5eblLMM5
	L9Lf36yFB7Od6FdA+S29o2nLp6hv5+7sJ0PKmBqujBxy1rqHP00Lp14ZUgNp3+D1
	cFQ/Xsh9ZpUviWrYhSBOocEraKWvZGxc1sIiHXClNJ0rzX12DM5vOc8xUb25Diyx
	3e1dgAaRk4rWMOgbJry92RksReabhtN/hz1aw4ODmsNDP+TAIXq8ZkQC4IJ631zr
	D4wZ6ecxNW0z2IVmCj/7ZCFQ8r8Sw/s5CIITLXi4My0GnMcpxG9sBW2qqLCJhDsL
	aRa03w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9fuu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 08:44:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5a9791fa9so12528761cf.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 01:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359462; x=1751964262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yf8OXMx4FGnWdIQA3MUAkQiLT+ux14ax47Cw7Z9XIeQ=;
        b=QQvKo2qbhcNlhOa4RGVRyDVPNCWKDDHy87Fc6u0K8polg/jtmTN4DKFWKm8BAd6xvq
         nzn7LOqr4bHF9Wx8hL2auJfMaPsqCD5hGWEEybWmDj7XR/c+bMlmc3O3MOBQBGsNbgJq
         SlMpzAVf6fhVs/KcygFWy7BX569svxhjjVCglB75Ey3ztXHohAyPd+TWc9esQQveKLNI
         +QF0hog84saRInmrkzC4+c9Os/VgMXmGALRi6QNfoAqU6K1LK43xUw10zxtFEU1fWEHM
         AN+ZDGUcQ/s075q7AnYZTgqt1Yc0CA28f/m78bJpIwYay3DoXvJGbeW7AhXO3s6tkt65
         n/rg==
X-Forwarded-Encrypted: i=1; AJvYcCUPnz63/PuNsCY9h8BW6pt/cEpGnICz57oldOg89PSK6v2KDqmtkuffsNv7Wpz0xo44tnfXvIqbQqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ47DR2qECJ5exxsQl6JDSMZmHgFGH1uKO2z+7jLchPwa1110u
	CyC55pT21HA1LJzIY8yxH/tGfN0fksSp7vsmZ3XaC7hk0kWlaE+gbW2xcBsV5RHqCfQteC1KIQb
	V5finTW8IPmXY8yzZ8i1sufRMwjyVjOc5JnwaHb2Plu33j59V5rnRJxDgldvpkG+a3gG8GPU=
X-Gm-Gg: ASbGncvj4T/ERmHiVbOH5nasXLtyhxkv8dNL+N2qD2G1r2P/0ZON8ffGSSl099kvzp0
	e1x0kS+Irg+0BCSJbhq3G2n0B+wJTQ4t0TMtfgBKAauKXi9Za4DIrvIRfmAXEHraWLl21mJ3keB
	39NbxXhQmAUueEEhnwshz2+hlBPn80JsFfP7vv9+MmJX0Elo1tXj0lz5ZnySfEoBOKkoe+FDDdh
	qO5zDwR3V0trTsW/ZQnXHbb4FPAIzziWE+U6i7pwldpr77SZ7KAh0vjDjjrq3uT40Heg/JfCX9O
	wGXzn0JCayY0eOKlRT3506cfUasWAv89W8ZsMQy2dhtwaBERr0pmfkwTo9Gz4ZT1/YwdNWhRClw
	bsAPeP9MN
X-Received: by 2002:ac8:5a81:0:b0:471:f437:2973 with SMTP id d75a77b69052e-4a833959521mr9863451cf.14.1751359462360;
        Tue, 01 Jul 2025 01:44:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/sA0oirRY7BnsvlJ60EVwuLrYw1JMcOwklbuCHYYyVTAZbHQKxT6zpexqZo4Yazepm+DXNA==
X-Received: by 2002:ac8:5a81:0:b0:471:f437:2973 with SMTP id d75a77b69052e-4a833959521mr9863291cf.14.1751359461842;
        Tue, 01 Jul 2025 01:44:21 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8319aef5sm7312708a12.48.2025.07.01.01.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:44:21 -0700 (PDT)
Message-ID: <850260dc-7e67-4ae4-82a5-5b8f5197633d@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: Convert qcom,krait-cc to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250630232617.3699954-1-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630232617.3699954-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68639fe7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=i-1VaULvG7sLBx-uF14A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: QRQk2hSNRUfZgmfVaLHDOHZuBNgbi6Ri
X-Proofpoint-GUID: QRQk2hSNRUfZgmfVaLHDOHZuBNgbi6Ri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MCBTYWx0ZWRfXyteA7vdaXQUP
 opx0qopw8I9OITIjYJyia43pBIxBCJJMSgB3UqkJ2cXuUsM0kzR8+yJx7d+8Za/O8Tr8UZdKRfu
 I0i4IkvnEU7rBcosnsrTWXZcsWZMSOja3Or0DmGbqZAcAFTaPPXbgA05e5sPyh1GMuSRiiXE79x
 NAe9xnXqcq+GzLptVOGhOeUf0avjFoOewCZZ01pAH6Xpx9jXa5xUqEYR4XRN4Aaegub0b/LPYQW
 MPvIGJagw+z3ipVYM6QVDxSZfd0+UDYmGUGCHKi5P8KtFYfUqplfQHRKibf+Or7zVzOy2NUi2q1
 G+52YMGoyzOAlsEZXNcdqUxlUjbA6jS12qmPjyMVOFUjBwaTtPxc+5qyOTKSM9cGx1w/aqEtAye
 dgAFUXy66XAlARphTRYU0nz4LUSplSf3dQesf00cCrX+dQLr8+xanOBkZTLCrh1YP7ZcU1/J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010050



On 01-Jul-25 01:26, Rob Herring (Arm) wrote:
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/qcom,krait-cc.txt          | 34 ---------------
>  .../bindings/clock/qcom,krait-cc.yaml         | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml

[...]

> +title: Krait Clock Controller
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@codeaurora.org>

FYI codeaurora has been dead for years

Konrad
