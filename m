Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9BD35A938
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024681; cv=none; b=PcLZHyC2e+QwxJgzrVM8EnFZcUU7bsN7oI0o4iRFFC5PeOYe6PT5SMv3DlDC9Rwy+Uoxc/Cbr5BFAVyMROCgtP2zoZ+IwecYQzz1JhNLu6FFCB49FHD8P7Er4G8tQrrCV88nDH1pZ7d08AyTvb5Ie5XDMXlQjqL+wLnVDh8Zw24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024681; c=relaxed/simple;
	bh=J16O8mbX3f9+o+eGZKWTF1OPBmq7iglLoR6+YzVSKUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+r3gS1J48TR/DgFT3CVROeVO9sjun8ctXd2DTzgbQen7pc/1HyH4ZBpSfZDIo283Ti7Q+OOamb/lqDhQASO6W6RFYnmPrNE1iFt4FhhgXkvNV4pkftyWAZkf34XnwiqbzshiWBoKjVLOBHwhRznqNpLAulON3FVQJ3TKE3hOJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mp8vjZZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/XlAD5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mp8vjZZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/XlAD5u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8H7lZ2291550
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=; b=Mp8vjZZnMucCsJqr
	XP/3Hg2eZa/6abuUttAMRfM9RLhaNqJLrwMWLmjTUztFK0KNgTbNjv4X5pWWDsud
	O7wqkIx3pt9lTHqVucLKydA1s4vBEgbCz4zm6eXovEOtSTtJZo11ZiYNAnvYmkQf
	zAjf1+8cQQUJZcxynF5j6BV0bNagnyHKh8Ek0h/5+B98qs7BDiQLxgAMR26n8Djh
	KKToFbWm1LwmMg2e+M4J3hBzcCsqtkN70DN9c37RNt3IhSA/QbbZX3C3o3KGz8M0
	xO/mLeOZW7cgWwrZXkZ8fNyiBdJ85RN1OldUpY+ba9T0jKkbaLNVfRmeJFqk8gR5
	mDKWzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqxbp9v8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:57:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ee2dfd63beso53398385a.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024678; x=1777629478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=;
        b=J/XlAD5urAnNH4G56RUEOEFMaHO2S/rXjKeqPlsOujqFzU12GHWgs8C3BxLILz036m
         cImKqYVyV3YKm4iIBz+YgS0T/hayPky/rpYo/1XJsQ3bkl/o3DQLWXKVu2mg6Y/nHPgg
         8iKp3XLpelErm5pGno8pxX2oAUZzvo2IADr5fr35adLLUy61sbKxzQuf73fg6zs8yYVa
         6KSqlRh9sWMyIqGb01CrgWVz+RxpjdW5UbGx4s+tzJ8fr5uavrmVsCZoJpN7O8sZ9W9k
         BdREHmZQoQqaeg7vpIYMsSb51BCApFj0IKFaPzKIMG3Zl2FhokwMGByDTe3DC3Nj3FXN
         5bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024678; x=1777629478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1g1GhXKxL+7LIrhpcf0hbguoDNKNxB/noTFJ4NtJis=;
        b=qr115Ut3xmu7Fmw5XS6mrSCDCUjuK50pxqxhptdx6auOOoigm7JgnmuKzwRCf+4YTC
         dZ2g/c7qjkOQp8raeZ7VhBfETsQaXrZtlqA+EHHbcZFFXjT7RG/ojT5BRs7Q4aBybcWv
         fipTXg2Cns5NhHCtdSP7jPG3RCA6nYYkIJEDfsT8HQzSe0GvaWFb6UL6cUNJxBV8HRIo
         aczc2LBKRdqfm8azQqVfayS7gFDiSIBU5UhLs7TdugkApc6zhoCiY7jOzN3iip2w7Ooy
         x20LJ6vVYbmvi8g4MWkHWIOxU37silgo2Bf51MZ5M/VPf3pmlFGMskawtKfxJ1YVeOeh
         k5OQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4wlLEz36IpYMoIPt9QqS/EPMMMhMxyg8HWJVonsSF7zaAdyUFAybgUzowRX92vdwT0jq1l5W+WQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW20vSiUlK7k+gN0fhp1XNenX7s/Pr9h4Uv9z9s5fCy8bf10h6
	bhvQdtZ3FPiVW+wvDRY2COcYPpzG6YY+GM1S+CgVL8QxVkohWpSB5K2zD09khmf7pCuPBzovVn7
	azJmyewaAV62/8obxwOELVfykJ+PHb+rExY1rabGWwvR/ciDaMjNHorq04rS4iOl6spG71G0=
X-Gm-Gg: AeBDieuoprvlLJKuU4Q5agFTPZwmyeBV04ovsVF914xj+K2lCi4xIsv2gZVbegQ3s7T
	64ZTOtJsMAbQUs2mj0Itr6PtDWcTHpfe1iuVqP1a8PveOerC9K2WyzMRURNFjCQXsh+PkWO2fHu
	kpHC9A3RfaFMgmOM3jw2zCbF12NH1hnOyv7gYdlrbc0d5/Z8sH0fNOCs/Ez+32SbJnjQlCmf5b0
	tkvxIR4YD2QEga6Lif+VYlJxW7JQyJq6rI6DMQtOPu0DUYA/5ifFzSCxLtbbOFbfkIFGusqNnL8
	B/JYfIM7FLnldBXmKxkX5Mzpah45QqpLIBKsCTrBbuxR2Whx6smHM+xatBE3fQm+AwCn8nPkqPG
	0B709ic9RzDil8mLucSFopg1YEOIB/O6AQGdU1yFQUR0McQzrE4IDDHpIncd8e15eWP+SbME1Mm
	9ghTTIYiawsIfmqw==
X-Received: by 2002:a05:620a:4408:b0:8ee:91d6:cd34 with SMTP id af79cd13be357-8ee91d6d432mr1427460285a.3.1777024677651;
        Fri, 24 Apr 2026 02:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:91d6:cd34 with SMTP id af79cd13be357-8ee91d6d432mr1427458785a.3.1777024677271;
        Fri, 24 Apr 2026 02:57:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4861717a12.3.2026.04.24.02.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:57:56 -0700 (PDT)
Message-ID: <4ac1d868-8b78-43e1-8a3b-66526a5e7ab7@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8450: Add missing CX power domain
 to GCC
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WNKwsZ6FORBHkzOviL8wZLkP-ZpZwegb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfX9NHWTFKwUPYG
 6p9Ls3LM/sbAEeO6j/drF7zz5ltM+IAvFGuyBUlLQ+fii7tVDNUn2SI4M0QrQMT/m4CylhUtMXc
 j3v57nEmQui54ukfi/RRTG84qAAUNAyrp0pMXHQSyntW/kdpF01+5MCZmbc+QpibObDQzicUJT+
 4/DFyIcOvojntIR9VbBgy8jwQP3X6qx24OObdIDmIW1/pEOpa9o03MQfEzTDV07KBtWZoYthJuL
 dlHLRNMOIeQ5ejcY1kSHizv7XHX9Em2tjxxuzDWYUs8eAE/HCpWPKU6jRvcm35Pc0JIPL2em1WH
 RsTuGV3x4u0iiqIvVEhubcw2tnk6SCVQhmy6oeG8f49dw5+tvnZP/xVypOFIqgg6qj8fAkcWQFA
 beUVMIAKclb2fl4dNuff1VR5fTVY1fPbFqb0TH1ulhSicdLPDzhi/vhEb2nUDRk7fAZUWYcUknW
 z/dxb/ccgsQlGksvS2Q==
X-Proofpoint-ORIG-GUID: WNKwsZ6FORBHkzOviL8wZLkP-ZpZwegb
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69eb3ea6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240093

On 4/24/26 11:07 AM, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
