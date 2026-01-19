Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9471A23B9
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818037; cv=none; b=g0udiC2b9cEgG41qF24f/xFZI17v2ciE1M2dpW3aWDpBNHuwxKTXGeXuP5fXDyDLkJ2oNsEwNOaaIY+7qdihVXOq4fSTKYwW+4wuNa3rK5Ir4bRqnm7Fg18Xd3Cbr43/tfcQiBq8M//v16BzqLu+8MZs3C/dmHg/Z43iisys2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818037; c=relaxed/simple;
	bh=jDRr6kmHAys4oUmsNHtyBLQBUWiM63bBvhzgLklUZ3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMCC1E+8kCPGaMv4WoEbXvFFUfnyIlNYhojKGkxRu3UhEIItN1RHfEH6jonC0BNS4hYDeHDhjqD9TjOcgNsMM6NAiVSEA7bAitw2QRdauV/vz5Uwzc3O1Bk82/KMpIlwuRMz9VBDltrGkGYQPiz4xugcGoAuRzjF62veoZ9t7MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc7OpXMg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JC32BVbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pc7OpXMg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JC32BVbH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90obh1905019
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0E3blSa0Xy96fLcU3N+wYkSyzyfL00o3BG9stgU+hDw=; b=Pc7OpXMg9hd0phAT
	9HcuNYyvZi2XEfvxR+88VhV8eiy+C0iKYk1oeAgY8RsFf5Xj3FsGOSNEWh58QhK+
	5mwRsIvmH8W6fxXyoCYWr03Az3K51RKiTdcb7N65dCAXd0V4JL39myoTOYjgVm5d
	25umukQHJu1Ua+KRX2kHvcEXkoWme6RLRfM1k1lWqNOw0ImJ2iyxtevyJgs4uTRg
	qfHDKTmqdx9Goyrljp01xJWylLccOoelsdS0meyQKdXY9eREa+2gMErlfqMO0izs
	z9s2OEHSmC2EiFWZJT4w5IU3zDZH4zaepsXVsDxYLLi8nXvYvaoplfYLoqqEV+JN
	QvoNcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu8gxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:20:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5265d479dso151297885a.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 02:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768818034; x=1769422834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0E3blSa0Xy96fLcU3N+wYkSyzyfL00o3BG9stgU+hDw=;
        b=JC32BVbHwGujuFX2gCMUIPG6U5FtlrtSH2ghI1mUqmXViXB17nknPuPWqCWZLqJ8V1
         MIqEEeU+Tz8shZCQaoLS59GEd9krLa9svx4THyzPWDtWuYoPBlTHSVXD2Rc9jJqOvdYh
         srvAl1qNzFUxvo29kXH+HyYSl6bsq/84h8iWIK26nSW7fqPqR5ZLKd8pqxgdGZ8Cl3GA
         NJyTi59jMk75tuI5pwpFkAzq7kLWAxMlHW1Fcd/90nepBtYB0KS96AE3hYOrIi57MvY4
         Zx2oT8IIFT/qp4+XtvIGFqgx7gGET2CUJMvfJ4rFqihsDcZ1uqVdiuYfUrQQ+Ww19SOF
         AM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818034; x=1769422834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0E3blSa0Xy96fLcU3N+wYkSyzyfL00o3BG9stgU+hDw=;
        b=ZpeovOTULWxYRsTV0ee5nguRDVoImAi02SE/6sHlIa1wJQJ8Uvxn5brd3xMIVMvdut
         ml2pjp3k162wBMjD2PQOiUWmqZvM6y/jISRKEi0vAWqOBHLcpn0q/vEZLXV1VpvJl5Zt
         EKcw8bmNiQLes144KLJG7IzgccvM3u0ko1MfOChMIZDhc/vlqkivck5d9fJjpQqWKpaD
         aW4OrXuhCRlCEjSi9+WSJteaw52rmf4EPmmDxTBDU3rkYyJ9sQBKDGLtfUYQz3okwcHI
         J+4SyGwJo+rPVvKqvLgbBvEaZ2ILF/SE96Ri62q/l3FnKn1RZCrdwOKN0boX3FLa0lSx
         Al9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT+7vOGL5RZPvxcz+1jmC2Z5HQEdfOhhxeXvh0kY/yPhT47ITwmBzTCYEeeghwDwNduavAH87bTT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLo0iy6fivci7BlSYfrilnh3hBeXU9L/hoQ7jeg6M8tjlVyaP
	ACCu99P3fcOcwqV1g8/8H4nOVVTb4Odw2Vdn/cYdsUi4nbLFPCW4Ff4BTtBZiPzmJUEJQbJY0H8
	pFxVeupUkm7A1NXzbBmgwWZ5RLgmQ79pDEAWkXCB6NniZtHkTnVGXdv/jh4Z1SM4=
X-Gm-Gg: AY/fxX4EkhcIgkLiRhbbV0zsn6zm9xnrBg/I5DmUhcWRN1hDB9cbKqCXT2u6zCJK+dC
	azy+g9+mb9SFYwDlma2AFmLP6aO1f4hyGHWsVi86/s5WZCLQx3Baf5UHkOUb23qGOdVWs6aTVk4
	3Vw6OwV67xbSoU75Xcgh6xXDD7yF47Q0QM214gNpQmKHVSx1bqzqHE7Nc6cTbAzqKuqSpBuKXpi
	5JxUDXcoZr73YMoVxUibsaFkrO/UufoG3QwHtqOyqwMlOyEgyVEssRJ4VPdxfNbJjWdCXmbOGes
	AwKhungTeMXsqP7tmKJWOoc9pEEmXq+/g1BsR6p09ZeE7iyHOe25ilgiDc4x/1zJr67BT7Z7rcL
	wne1RxSpqAi4BgjfBTZws2wj5AYZ+5Q==
X-Received: by 2002:a05:622a:508:b0:502:9ed4:eea3 with SMTP id d75a77b69052e-502a1676d4fmr126141061cf.9.1768818033733;
        Mon, 19 Jan 2026 02:20:33 -0800 (PST)
X-Received: by 2002:a05:622a:508:b0:502:9ed4:eea3 with SMTP id d75a77b69052e-502a1676d4fmr126140791cf.9.1768818033291;
        Mon, 19 Jan 2026 02:20:33 -0800 (PST)
Received: from [192.168.119.254] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce433sm9961316a12.3.2026.01.19.02.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:20:32 -0800 (PST)
Message-ID: <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:20:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260117-efficient-fractal-sloth-aaf7c2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NSBTYWx0ZWRfX/tUsHCFauXtO
 9bYrcnINIMjyPEeZ8lwq5U3D3THUNYBgUj2xV67hOjJJLOmZxR1CJvcEa7XvTX2lwnahQgMQ5UU
 9KQk9uvRZ7vuJUXqZ0Q14px58DuZre9AxMgKmCJRsvza7RXVkgwYC/rBmlLPlgM+eWoyf2F6nCt
 Qj87azOGxmMkXMUVkHFpbd2SVSla3ygM5m8BLo1WEiyQitgl6yk+rq4Qf938aOv9zHvLpzyAY0w
 rNQq9ZPlfpzkivu1iOWyhcB3gwdp9QtygceqM7tOEKADysPWvKe9llwPHwi/TdBM2f3i3wN2Xxc
 H1kYn76rIcm0saMqNlDhRBFtbTcr0dUqtoltxC747/qw+WSe6ZXKaGnRm8+8D25KDG8gCtj+/Ew
 cJmuVJmlcyTmwmeMGodduTN4GEXNhf3TDAKheOL8+aYT8Te2aKW5R1r3th8C1gl8Bskr2+a6xEr
 xABAFNAs1gISdpWQbkw==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e0572 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=WxS9-qz5E8wbYe8Hv_wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: t286ys6Iqm-l8TFx_HVAGzNvOS8d50cq
X-Proofpoint-GUID: t286ys6Iqm-l8TFx_HVAGzNvOS8d50cq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190085

On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>> Document an interconnect path for camcc that's required to enable
>> the CAMSS_TOP_GDSC power domain.
> 
> I find it confusing. Enabling GDSC power domains is done via power
> domains, not via interconnects. Do not represent power domains as
> interconnects, it's something completely different.

The name of the power domains is CAMSS_TOP_GDSC (seems you misread)

For the power domain to successfully turn on, the MNoC needs to be
turned on (empirical evidence). The way to do it is to request a
nonzero vote on this interconnect path

(presumably because the GDSC or its invisible providers require
something connected over that bus to carry out their enable sequences).

Taniya should be able to explain in more detail

Konrad
