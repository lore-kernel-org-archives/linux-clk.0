Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259C94746BD
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849850; cv=none; b=nGBYaCuVw21EqoRink3cSk3Viz51Bo/En+yIJx6g5FsXzgB2q9dRri5dNqUBcCd3d0H+F7lHwLF0WmCSo7Iyp/n/F9Hf/BcwFw+B7tpyeQkCk4P6up6aOOEnvZPEeLYd1kXjN4JMxfR3BWkR4q+ZxgCp3Vf8Jmd0wriABS1lsuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849850; c=relaxed/simple;
	bh=qEI46zWGvj414rMM6lTChTcs42RUxnnFlPJd8dnMJx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJqQdyNKD9M1fVSh0fRTPBZmTO3bWVXurGGOptvuVAscVU5S2CLk007RCXS1udM7RMdmzmhw+rFwnIrL0tCA1F3x+/qfxhpTsBSJLcq9NVjEBThB+uZajACi68WGk/ZjR/tN/l9e3L5UlfFsTl9p0GefMTkI/aXwwvQt77fN2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arQpIbpc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ih6i5kkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arQpIbpc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ih6i5kkO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFc2mq866777
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=; b=arQpIbpcwtLvFFTN
	viG3nysBDMW7KpAs8xxPsTGsyxFADHyXX3EraVSEpdGbOr2M/oGljNT5of0mGiFl
	moPdZmBWMTs2LjM3dswcLvfLq4zfCaFxgK2MGfGTjCaKq44c/q/+WqihTzp/tB+w
	da7VwsfsMVx7YDgF5rTNwMpp5OczfG3dMb8gFdzKAMcPIIWdq+gk2Bs7/xZIsOwv
	8po/GXW4E7zb3KL4WWeDbSEauqVxaG/mD40dj8LNDtUCtyee+ieDxaEx1AiT3bMo
	prxt1dKsCjkjyd/ZBJ8Pzw3ZE4GnXX0rhCGDnL2IBjdsf7AcCwa5wEDXD6CgKtFI
	bxmM4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8tqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:57:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6823efcso739245ad.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 09:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849848; x=1788454648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=;
        b=ih6i5kkO7ytMaIXv9h0yUItvRnSSdQ1ddPzfxkpCID+t4PfNuapDUfETZQckUkwmB0
         4QE+BFkyePYgUfpXj9VAvSI0MMsOc1zYcuHPfjRggEcNVcrsJal/dOo4o/CU+Gn5qTmJ
         8A5F/xCbASpJVHZh4D0h8QtT1dQ9va4n5C1CDW+eefwmT3IFOMJSZNjxHEugNrSwlP67
         17rZIuhH0WJq0nGot7/KQJveE9GoW47wVl9YGhOsXcgFh4pYaXcaSHOfxiaNEOtbzp84
         nYXOvsxJC+H8eXUJCFlwyoP1akanJsf0Pg7vqEIhlZo5lsqk6AiWKSXI0Vp1Iq2OP3vB
         F8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849848; x=1788454648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=;
        b=K0fKsrqo2ldFokn0va0B0jZN9Rs2x7+DDvu1bfaFGpOwx23rZ9uspcrmqRww+lFUu2
         eALR7N6p3nd0+0BEnYit8IfrnL3DkvaCl57gXR9qxXhipbPctTAG8UldbfbZ17tDhT36
         9KQBqFwtYy8k9Xydh12oAppCsEIwIpVhqzuJ3hL70NGp6I1peHNPxHJ4eTlGdkRKpGzQ
         TIDLCBJWKekzOAqGpqdCAJV7WKo3Mbd07JYaWiX/N0vj1CGFfQRXA72aXDeNiKK4RmkG
         1HnI6soEJXb3aJGEHPoFhGQ6yi1SNhRc/GggYWEgxoCmUvOOCqIJj/gvwSAvvHpV8O6O
         Unqw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8E4H0bHDnONc2Aob+YUVl6YwGXLHCqdTXWeKD2tL7jOnuTui5O4aR96SQIqR5okuw4Ev9KKJHaew=@vger.kernel.org
X-Gm-Message-State: AFuF++mYEqA6uTyqvnkFOqayNwtN3n6+5iiIh6kWE9M2z2j/fx9Hxpi3
	1yL3w0d3KIlFS6Vyhot+ZH7sNu8Zaytx67uScsRfGmozxOASfag5GPUCZW2eJXG5Nk5Z/PE+jgW
	0ptcuJJtZIPfQs/3Vy02RItI4YsXGl8a/Y8htdVMlkKFUpfJNixtdhPWachZZQiM=
X-Gm-Gg: AR+sD11c1I5WEBkfI//n0EwqoNahEMXiwwWLiXqRkseBqcrmmzlCn4YG1SVHJtAjErT
	XfRgrbE3JqU+zrQYPHFIoFHRPAd01IZC5ik/FR0/3KoeCzQcO5PP726ye2DQZfeIE7Hx8ShiGVF
	eTNolVY8qRmQd8IuF8pcGLKS4sYwCKAFLXe3IrSS0cyfpMQDd0tFn1Ia7INYpj0bKrbmkSvWbAn
	8HhlAZtpaHyqv5yuszw+MMXH7vaH2vwC81LYKceNmaQNGHgyIhZ9x4Lwt6qDsTNc6QtR3LLpDmQ
	gcCNsGnHq7Rjp4lnqQMoxF3h5tSwATl7xCbGVfSRj6BEHmNuMdXOQhu5zhr9xrPd/CPmIN6z9Aa
	oe15UlYahaBv2P2be5T9pa9BGCwI88vU=
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr3947455ad.13.1787849847704;
        Thu, 27 Aug 2026 09:57:27 -0700 (PDT)
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr3945595ad.13.1787849846596;
        Thu, 27 Aug 2026 09:57:26 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704986619sm20011025ad.24.2026.08.27.09.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:57:25 -0700 (PDT)
Message-ID: <15ba1e13-d4e8-4467-96a0-8a4250c8b74d@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:27:16 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
 <20260827-tiger-of-sublime-flowers-eb8f90@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-tiger-of-sublime-flowers-eb8f90@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GYa3xjjHBRovOvcS6Nf4MG0rKpghGHv5
X-Proofpoint-GUID: GYa3xjjHBRovOvcS6Nf4MG0rKpghGHv5
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a906c78 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KvNN2iZ-vB3k0q2gmRwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MyBTYWx0ZWRfX2DAUuMb5U7yo
 9I0pBaffux3/upLpZltuNMh68bAEFHfdcmp7m1GrhXVUrJYLQZT/AKT0oQznwZ9BhPgwi48C5D0
 wxxocOQhu20X9aTtmSgVdtCWnirEciR3PG5GciErO7ixDlLgnTtYaQ0RbAhURfKwsQpzzx/xIfG
 173IxhvhS0VBxv/ZnrsU8asynIqx+VoEZS+c1jRBThjoja4lR8mRkXQojEqCdufvp4sCR60UtnR
 zWMzMOyEVR4DtLX5cCVHdSJEVunjQGp5bBRYt/krzfPXyUFK4ipS0jxIUEEUfR+zo3IlMxYW0Ub
 tMwrJeA6j5ZAI6KY8gz/xHZo0pzKbipYJXR8qDL1qBiN9Fld92C2gb3sS0ZNtcmIsI47HRQUg/U
 /1NNP0HZXqcEVP5s4Lxpen7ipK/FOVWDq1dDkMTRmnmnO1NNJAjRZZvvTxBZJooN87Finhrt32q
 MTrp2DAtApYbO6CGyxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MyBTYWx0ZWRfX1t6EuAm/ELd6
 hBFsZrC4vd1SZSYOFIMgIRGP9py9ncQsvT5gD72+aCUf3DblDNPPdrHbuSSg90TegkkT8/QBf0b
 QvYM+Svpv3hCZH+3XRELB2g5tMCN4hs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270143


On 8/27/2026 5:52 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 09:39:03PM +0530, Hardeep Sharma wrote:
>> Document the Global Clock Controller (GCC) binding and associated
>> clock/reset IDs for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> Sashiko comment was not answered and looks reasonable, dropping from Patchwork.
>
> Best regards,
> Krzysztof

Apologies!! for missing the on-list reply. The Sashiko comment is reasonable
and is addressed in v4: the header now defines the GDSC IDs
(GCC_EMAC0_GDSC, GCC_PCIE_GDSC, GCC_USB20_GDSC) and the clock driver

registers the three GDSCs (gcc_emac0_gdsc, 
gcc_pcie_gdsc,gcc_usb20_gdsc), so #power-domain-cells has real backing 
providers.

v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

