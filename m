Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C521DDC35
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162199; cv=none; b=JO/8T8Ew3YjQw/f53z+923t6gL9sqKj2AFlD+JgZXYRmsRCVpH/QCF88pXLSYXDoCTiamYcHKysajBM6/xzKwf95uKf1yUVBmaUDGQpqmdURHgGYnmov6KXjksRCAh1ZhsDI9TkzQrsBKqmBSwB4QYgWk95mXqMrg9cu4ZDWNiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162199; c=relaxed/simple;
	bh=QMKWbxrTUoYOpkYxmeTHb0eNPHq3ygbKhMQAKrB5afE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3u6JQqinY6NoHfLtL2vU34A469P9M+9jcnXsi5Fe+yKE8YJD/p+DfW+Ujh+mKF0IKNsPS3UlmluT23V4LpjwZyAMVYaFMzQL1ZACpyWMt2zUCRYpza2I2UEHlLq9gY/sSs7c5mrUY4zc6D6VBFhPiv6j9mla3V852Prwdg5ymw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+KmXK5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQkLDUzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+KmXK5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQkLDUzJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52QHW3678798
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 07:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=; b=G+KmXK5r7+EhXV+j
	Lg9lsxxyMjIAtavWoEECAY6aOAxcHgbj5ovZi7OfMDZ1E7NS8PsEHbxNkC/nrLK2
	b66RIm2WzMlHtt2b8vm+QOXe+/8o6iHC1MRbRO4kbxK8ErrrOvEag2EAgZQxJHh6
	sOt1sjtwN/76ocamugD+0/PHPGjAH3AFhjm9teRlmp/kP5iw+ytL4Zg00f+E55Ih
	cPb2HFEct+Ds+CYJw8c4/1RFrR+iOZiqnr9bnzjBuCTP+7/Ze5/sviluk9G6noIr
	TVOtQRNjFjPx4T/NRPJqaW9QyRYlrOA0O7Y08tcS2NZWfUFfe6vdR9cQrJ01AKq7
	ZApx3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1h1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 07:43:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so13730091cf.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788162195; x=1788766995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=;
        b=RQkLDUzJ54Xru4/bO+XzQpIohyrLXa7FRmTcWvd8vmVFFD0vRsKOIQRDhrSsXDMDIy
         jJqOV1drwcefWEpUWYBnoj4QB3WqCd3R0lrxblQiiP2L1xssY53J/Lp5mXmeFm07uSvB
         VRPQ1S+matj3Qo3paTtuBhgws5n6wysuleNR+wp6P9nm+KOqXC6cJwH6ZYKqYjFKAmlS
         RrhEL++A7n+y/AEHlLxy+2QhtKOpBJfRUyejwkE+QsUQAHloJUrWNVUZ56nnStsIonKo
         P0dJVlXUBYdLd2mE8ldU+KVuNHoZN3ttNgdjMBZSnK3DXHtauz5EsQDE26Gaan0EfYGo
         PIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162195; x=1788766995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=;
        b=P/wm9Ale8W77KhdMpX/C7Uwm3cIL7uY4MCXHSLXzkCbA5ylzkklSDpus9gxsQBMYaI
         uOMiowsZiz/98SEmgWERkud1ZyTKmrf1gSBWMba4mvs08cqYjQcW3MugctszSUhp+b2B
         2nDLs+8dgXNkweYBGrr9bwukKklvSXzkinXUFD60fbrjPU0XsyPMwXKyk8ryKkIf11/a
         j7ch62b6q4/DjHkR16pouJMnXBFtt/rUq4NlJLImc4TU0R+soNm2CeXmUHvf50ge8ClV
         OpD9pNg1Ciik/91ll3LHndjwYi5MPm4M0m1Jr1JpFnpcnyl4I0tJMNvoN4V5NLaCwoZe
         icIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4D2p3bt9R+yrxFsBzHFpCSWoSQqvets1TrYx8ostbgBwzCUprDK9QUIlc+JJ2B12WTkUg1gD/mIY=@vger.kernel.org
X-Gm-Message-State: AFuF++knBQQ+DKdmD3YEACf2Fxl0BvQtFRQjI2Or3REy+pVmBfNnlFuQ
	kRGQe1ubYqLcv4WvWXH5RoRthT81iCnNlHvU8q4YKDkur/sZw6Mtj6vuhHzgYYGI6kcLMTrZRRa
	8Zbc91QjT8FIM+eSyb+EkNKSQ41Z8Wovzhx29/RH5q7Sr2sVun4veq9vvEk15+JE=
X-Gm-Gg: AR+sD10SCqBRjxQvDA0VQjBY3UxPdxZ7xIjT2lJhp0SSt4zU1iSMH02L9kAhu7g/fPt
	u4v0hl/6wA3mRaYIFuZ7MhdIAFmbLLsNkUQAKO3J1XefNmFr2SiYNOqkN3hfMBazDSuo1OqAjaS
	lX2nMIq2hqKeMM+KcXh0fLVo44XJz7+aj6rHS9rK/Nct2vSz3kI5USvd2iKufKQ0EgVTbDHbkqo
	zCBQIpu7l/rL6bRMjgjSS9oZSddkydCYcSHyVJUl10wvzy8fJWxiiM6hhvfY+pa0SM479CVKVyB
	vqkusQL3Edz1hpasqIy+kH1wIVIHQ9Rtg+esB06Emb6gIhxMAD1G9hbELDzuU+epx0aGNldscIt
	6kmPvY8M1eZqItV6fDuH9jA==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189847381cf.0.1788162195505;
        Mon, 31 Aug 2026 00:43:15 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189847081cf.0.1788162195105;
        Mon, 31 Aug 2026 00:43:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c69ca0sm3289262a12.29.2026.08.31.00.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:43:13 -0700 (PDT)
Message-ID: <35eec1c0-783a-46e9-afbe-fbd42376870c@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:43:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells
 from TCSR node
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
 <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a953094 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oAhxQwU1FG-qALgQiYoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2NSBTYWx0ZWRfX4DxG4FFiaJQ4
 SnkE7tCEL09+TnX7LDG3+JZ42ByhZtICD3Ri2iM8BhV01S2XPxZv2Wh/dJ3Y5V+n8NXCW2plBhH
 aQsAkpjMrggz4GmlgezxNnsr04jx+Ql/PG3wboeU3zlnBAw8O1dJSFUMkHQUL30SZw4LSfVrXd0
 VMU8s//27Z6+YEEkarhByPdz9UDPdpSbi+HuWA0SG0XCJJehUhBaxYSM9crAqQAUbwR4/CNBbMm
 HiOVh6upuzJ8JJPJkUW1kK9RxAYCIpL0j2Z5clrzm3ENiPYegjzAREDfWlVDFZCGD3N0tUgnRG+
 sUhjDc4Y7x/GO1OsExiI2HCDfRi5dT6G1GNoSrDbcSNvAh3wJtLgFzz3zbrYV5OmStYwWnecbda
 q4+NgWVkgPf/8BiQy6v4tQsR+2r5GbgaGUlRZEFM2n7SC94M+r4Gf4AS9Lf8sOvUcmUjm0ieM5l
 fmwvaGPC5/WHFvtRE9w==
X-Proofpoint-ORIG-GUID: 3pkd-i-qEi9asxxcrSCuGyAtKsYuyJgI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2NSBTYWx0ZWRfX1gsWcpzZqkld
 NVPUTAT0lxKaiNpZTkT8T3m4iC8ItnQo1EnlOYnYt2T9m8mpI6Xxe3bAA6+QydG/rJLBMdgdFQ5
 tSG55gIzi39xBRxKNkaPnuhNUFOFKYM=
X-Proofpoint-GUID: 3pkd-i-qEi9asxxcrSCuGyAtKsYuyJgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310065

On 8/28/26 8:00 AM, Qiang Yu wrote:
> TCSR does not act as a reset provider on x1e80100: the driver never
> registered a reset controller for it, and no consumer references
> &tcsr as a reset. Drop the stale #reset-cells property to match the
> qcom,x1e80100-tcsr binding, which no longer declares it either.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
