Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4733CFF44
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944886; cv=none; b=uxBwyYoFsnTXSNl9ugFV9H5S36Zj3gvMgw3ckVuaygsTjh738Oox6HRVjrQVXHa5IuVkszP/ckDmXiUoDVcNmsSgd/VpozCDD59DTVwK2VJa807W/lvINBvJ9ZesEVescqz3m5iLZvKrhqnWUWoVbSmSdK1IPODUDc40wQ5k3lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944886; c=relaxed/simple;
	bh=xaxtm/Dpnz+4KdGAJI2OS+JIZQ5GYHVCqxmLysD4nMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYAFWrpQL4ItWe77fJrUpeSyaurj1/YTtDgDU0R5njECycY2RuKuJuieXQyj7fOcZtGoRgp0B6I+1RGRjgTt0LTv/+mo2wRHuo4nvSaABa9TSLRSR0Z/DJ5WF7vpAW0+TnPgVUsm+zWKRR6ATj2Jby5CAfgg2n+41zAtKOIfvu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoHR3eNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPZpgR7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoHR3eNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPZpgR7T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE0iE1494580
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=; b=UoHR3eNdGIPOeVg0
	KsHOyJ51TwiQhLZfHy3iaYcPeErYtD6S3VOfWzkZjy62jO7WL3Ru7lWenpGjb62h
	vxtQsoGXgK0q+/YiglkHPMKZybNFXWqD/nlp65AuJO9zGIsyecm9TSKbP9Nt7DBl
	vkEFvNbh03uLvy4OrA3rs6YncpOdtGfN8+4l3Ulyr/teMGvws2i15XyjW2MS7n7U
	/962afWx/U1KN6UGcvQoEYattFGnsvdrpwbslgEouwAS2+wbc8520DuwkDD1cOWU
	lZuSCPKlHBGRolTzn9YlbS6AzDIhYxsfVNX+xAWG+P559YS3bn/XRhiyQuyk5ott
	oIkWMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2f1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so59785725ad.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944879; x=1784549679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=;
        b=VPZpgR7TubTwpoJVGFPgfa82GgkFcNi07gxjNrK+id3pqoMdNlL0mOuifZ9Tpji5Ym
         RzFyJsmiFYRRACQhP0cHJnQCDETgbNJ4XL5H1qTTRbYM1InJXp2AayS1pCpMUdW+SS7o
         9oetUEipydcpkOoXqyZZkEazf1F6RRChAddFFSAKtgmhOoKxMAJ+HNTPJ0Mbz6Cnu/RW
         gpM/OX8AhvqUcV756mxArgwJzorPZOuUHWWPPsp0khlvEowikRjmnuCjHzLyZT1of7mi
         fRy755Cnma9ZI0cMd47vpPGoLF/cYyWPDGgbLF01PB1u2GOR2gbu8alPSoqO5eGDCDms
         2BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944879; x=1784549679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=;
        b=S/8pwbiG+Uku5mk2d4MK+yx7vBnLPdBKxCWmWkG9uql5b3ivanHt2hnvhLdWVyRjVJ
         w85dLuU4VQ56uhurnA1FotakUIbLOf9hv58uw5ZzxDN44iNk46fmD81G18OJQU4j24vY
         HfE8mhRwRUgaXEk/YRiolOPvejNtcOfinvr9BUrev9B3W0p6OyW1p2Pg01XlO7/wL8Tm
         aV5isZUC9JKWQ4WurJB78IYv/ZexsdILrxpG8NGBgpvP9VBkndBbutvK/MO7LDcqLRTS
         5pZD3glj61ncRlCl194D8Zt9yJ48TTL1yyj5L/I+Xrny0UhfGsM1g1OcfiS2Wxc4nENt
         XrEg==
X-Forwarded-Encrypted: i=1; AHgh+RoeElM6oleSAIrb8gW4gIdoxRk+DxDZHv7XVDiuV4VGBoF7c82cuXVTpKIgZV2jQCDiAVctN00PjHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSE8zduVgsfuoCdxDYASHTvm24M1hxsEphJpmQrjABn9FG7Fn
	yvaI/43ZI4wrLzWw7FwS8g+qkbcVRBGIe9x43BKQDEIZ6EyhNisTaoth21xBgE+nwzxmOoWQOLt
	nDpjT8ZuQbiQoZSn5id6Hk8mLf++i5ee3BSgPtN2vZ+BpfSKbW766mCpvb/KiuiI=
X-Gm-Gg: AfdE7clzkuRU0zzbJaTTLSiPkfWxLMvoGY8jjwfoREjJJGB3cHTDQ+aXDErQ/XV0UM4
	nCMmi5BcCfTSWMzQ8xeNqnfyAm0vEF9fiPEKgdiwjWtTdGm8sM3yPWOSUgGL7qixhVWa7wW2G1P
	kgP2E+CV97K/9fA31LdxXVuft9mF15yzmqP/OF5i6mtvkFwV68+JNnEWJokm4iADl25HWvZo48h
	Nq4Cj9SvtSBfiH3jM67phJzrb+Hch6GfqDuyHGH4iUxiAeS2WHpkkZC12N38DHvYXHUW+RCxLH2
	oLbbbPo7+TngsrKThvZdODWtm/DUGatC3c2nXc+aUHwA/e+CUeK64PnQFiK/XOMfOJ8BGL/oPVo
	c1VzPo9Fqu7UvpjSi5ramFvilRBEQEFksU1EMJw==
X-Received: by 2002:a17:902:fda5:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2ce9ee16623mr91362425ad.25.1783944878671;
        Mon, 13 Jul 2026 05:14:38 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2ce9ee16623mr91361995ad.25.1783944878253;
        Mon, 13 Jul 2026 05:14:38 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ecfesm98917475ad.47.2026.07.13.05.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:37 -0700 (PDT)
Message-ID: <b0ed37b4-8279-4d8c-a4c2-3e422d799767@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:44:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 DSI1 PHY and sleep clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-2-cc13826d4d5a@oss.qualcomm.com>
 <20260703-imaginary-quokka-of-resistance-c06e8c@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260703-imaginary-quokka-of-resistance-c06e8c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ecEpvRzLdnsNeGzYADFOGoTt1ysFnn2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX2k1t8+CPUTVJ
 ElCHSprUEWok3b5j4N0J9z4AUNzDK1wUKeg7sBhM7b9S2DXe/JqAOdZUYTasyMrac8VZlquGQix
 F2P6ebdnOmppED8uSBkG7JiAx9xxpUUb/kqYXwsMsZxFm3K1onBc3IHLzxpRlvcHnNYJ1jK9qDf
 QTMUpjH2UB+AQem7xb7WBBzfjj9HfdDqMJHxtKtUGBVaxztzFrVPfJrdN5PdxnioUA7UvFamZKY
 bOg/PArG4QvM50RuJD1x6Va2UwPhFz++fv3qqCKxZHak9bFEXQ5bdofB9GS3pXoZAJTYOO77Lf7
 8969QWsYBTUQLvf9BYxb96nRFC5q1bEgUCzpyqodhliRU8Vu0x169CwlCZSHKs2tozNd9SEX7HC
 PV5rSjw7gkVW+Ew3wxqAbFHA7/0aS7KWQL/2VfQPR+uWHnETO5jiiCdEZGbBqRqChrMKKwIJFbQ
 mLEhIjSk+x6qHIKEtjA==
X-Proofpoint-GUID: ecEpvRzLdnsNeGzYADFOGoTt1ysFnn2L
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54d6af cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6Xi6mpGAEk2f3eWU2LkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXxZsdOEDAoHKD
 0iSUjeNJT2gmH+jjz56SQD8ISo5qGYMzok00lBRBKMTll3kM9fzfbTmrwf5CefB9N5p0q9Q8TNn
 UnPnEuAQxoL0Y4uB4KXefsKRwofOU0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130128



On 03-07-2026 11:43 am, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 12:01:24AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC binding to document additional clock inputs
>> supported by the hardware, including DSI1 PHY byte/pixel clocks and the
>> sleep clock, alongside the existing clock list. These external clock inputs
>> were missing, so update the binding to correctly represent the hardware.
> 
> This sentence repeats the first one.
> 
> I asked at v5: you need to provide reasons. I understand the clocks were
> missing and what does that mean? If everything was working fine, while
> the clocks is missing, there is no need to change the ABI, right?
> 

Sure, I will drop this patch in next series.

Thanks,
Imran
