Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384852C2340
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991964; cv=none; b=FNgNzwOcn45HO6KYSZKAKDVKDy4GVL4ieRF3c++anmxdPIrUzoftBvNG1MLHgG3YwdA4c7jbQuSBFNf3fapB7FXcTnY0qaMqoxSNmP/+OFCIMY635Zt4b4f/bsS8njEd/B2VemNj/4WWjYIk+eGqstxueW1CPJU21N4dj4U+IbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991964; c=relaxed/simple;
	bh=horiclb7a1GbJNK+RwDm5v3LpzYgP0hpkH/P4im7RQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVUVlX89R8WGaFJEXBHWBfs6fn86oGtmp+tpzDW8dtJYFhe0Sj9vekUHsdETN/p9F27GaIUbcwgNhzXYoNneExcDPpWy8fJR9/dJNyAsHaGOyMFEy4GiqQAESGFhl6siYfRv0BC1ujdbqbDMPiIdW+mQ3KEh7L2C3fZXgREhE58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBjZgHP8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSf65TW3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBjZgHP8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSf65TW3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9crFh824668
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 10:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	veLz1Derzq+KtxQrVIaUDx2xf0+CV8uyTORbOftLzW0=; b=JBjZgHP8TSfS3eG/
	v08iKUI4UgBUMTqSSRxnYtOrJD1SAlOEwjoVyP3lSxxAy9rqApsuaL2kg8eT/Yse
	7pl4lBsKNxo/0iwbm0sGuXwdJTwx4TN0slflZ3ZHTfWYo1ceNCN43ybcYSPcB2H9
	hhZGn8TYcmLBVsSWpbWoWW0CxQOxLUTeeY8IiV2Pwl4KwTRNj70RiRh3cG63H8G+
	wnzcU8zgn506NKjLBaw6Z6mKxE8kK5Oo6fEVdrpoT+DOsrRNC36aKgW7bwoBWRb0
	maQkq2g3DwmVAcXIst4+HggSqNdcuZCeZ8Hpu2XW/lyBNYSngaDrzQJ1yx/e1o9w
	UDhatA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e3j8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 10:39:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so144578185a.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 02:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768991959; x=1769596759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veLz1Derzq+KtxQrVIaUDx2xf0+CV8uyTORbOftLzW0=;
        b=XSf65TW3PITYg4qXZHhSrpYw/frHQj6nm/KlMHpU4erq39jmFZMLy0/yKDQiPuSKkX
         l5p94rl/NcBPAl4++4qs5hDp8jh79rHfNwry+ZA7AnWpqWhJ0HTHRX2XM6ABIGdKOXtz
         0deNu5IbWcYsGeY7CJUfacnBbIrwFzUbno/np9ADCLewyfQPmq3DlftyitEy5FCi15Ds
         njQ6XonEClawMK/nb0KYPaTFn+QpgjHUU7Y+M6Y0OWOow2vqDGrVsWb/10NJ1Sg2Cs/A
         1C6ck+gMyv+xaB0disiRBgsIzWeLiejVCakwYh0CCAv7onqdHh5DSVXK93BTjZLd5+1Z
         9MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768991959; x=1769596759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veLz1Derzq+KtxQrVIaUDx2xf0+CV8uyTORbOftLzW0=;
        b=C5mAtMYDstG3dOgw3pNJWPE4G+LqtEhb4/WX60l7iJfvdGykHzRo+yfrDaWaFxw/24
         m27fbwJLvICpcXx4iraLhIff9+kOT4D05VE7hamslWwNhaoXZoABdEufAbmMAWvH7Hdc
         uDLHKthhCWUyHUcWUbNmYWd0XMq4PnpHTI2pnyBnYV3QNgVYixosbZ/8XCzPAQHy4gI8
         5PHVCHXyJgLYaVDqO3qJ31miPKjjdOOrXH8l+xuCaE2KMDYN2Lcg5xLSa/BNQjbgahTj
         UHr/dm0pZVstQpwtyW51Cf34TExLHIcoCRhWMYYVKhmfnxaJqQCdYWfJqpfqViIYmjYo
         bU2w==
X-Forwarded-Encrypted: i=1; AJvYcCXew/AodKzQ0rCGysk00oKwZfVcjFaxtzxbpyotOgaRS2+oL61nO2YUqRFeUfEjIF0XQ4VMXIv+KaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEKfDXuL3ddJeolHMfUv70SbDVHnjaTb7a5o2HsHj94X3cF1rn
	hteGSj+QgdOaKoGnzp7nJa7T4lDgQ2iGOIz+Dgur9wAcE8P2Zs2P1Em4F+3Hb0l58Km1ZmqhdlB
	uQGsazxiDwmXspMV567SxgaOL2vqrznCUvJ/fRcnGyZOc/NpBNPyWRP+S92FXuUQ=
X-Gm-Gg: AZuq6aLPFA58dDgOQZ2cuq3cOOyc00I3onj7YLnY5I3JJfNfrX8vl6LIZbxkkBxhRG9
	NyK69rYcx8SIlReKjMdxHI9RsEG8+lYkJhD8SKQxRJ4QxL0nVUHMRAzmWEzNycCGVA3trCMZVyg
	cae/NmS07gh7SdfalZgRoJK/YapJ2AwsV70LM1jHkYRBIi/rSR9SIcp8whOPl5RpMK2nD78WtfA
	vjqcfXDmQAocSsncs+ygq/RHxhZdMHc6DkEvReYJnJ+ei0GN9oQWv+qenkDlTDAFjlj3GyB9Z2D
	FRaSFK4grz5b+R1+bwqWdTTcZAVTK9zECc1OZV/qOciCpk7KXaJYNFqTTtxRPnnSXfDJwzPaNEG
	XrDaXVbsnoXGcyIEqi3c6vWVEDc98mo8F791hZkKwCVqwWhEespa/hbAICQS/OPvWUiU=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1792486785a.7.1768991959118;
        Wed, 21 Jan 2026 02:39:19 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1792484685a.7.1768991958684;
        Wed, 21 Jan 2026 02:39:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168b2esm1582138766b.17.2026.01.21.02.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:39:18 -0800 (PST)
Message-ID: <435e36b1-4b95-47c8-a7e4-b40308746b2b@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 11:39:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7180: Add missing MDSS core reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota
 <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
 <xdllt4b42d4srxaqszlk5tadjvd5zyj5oae43sgwllvzcsva4i@2er45lhhfwij>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xdllt4b42d4srxaqszlk5tadjvd5zyj5oae43sgwllvzcsva4i@2er45lhhfwij>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970acd7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OI1ZiTBWHRg4Fdqgt94A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NdVUY9gku11wbGGbqgZBjuk-94rvLcOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4OSBTYWx0ZWRfX2TZACyPWolX9
 OmAxf5DTDOBI2vWekVJflUowQV4boD+5c9IoXl6PE+LPyrIL5m1o0CAjJWPu9v0kDMAH8V5WPO2
 x/3UYknGm3yxYOAaqsgke2PS0zh+0qD1OZgCWI4b7u2zGW3G2KW8BRs+NrhRUpQMV/CXPMtuP4X
 qZCm/oCrkTB5fy1GNaWwiHQktFmDDCRtfo66C7352Aa9g3aSTU4u7DML/NW2p4mtXxhYOn3oHcb
 wLuz9mzNhHBcJHN8q+dnj4cXqSqUwg6sgAR6WrOal97MTZa/q/yA6g2C/bLx51Zr3rZyI9tkDuz
 WAE0dV+q8EBeWm/Ekmn4Y791V5ueEin127vmD8108E6l2V0s1A1KXhOBRed3uOmL6nLlGROQ1S+
 tVO/ZQeGE4VZu50D7bSAKsXc6jyJxSTozgp/XCw4iPGQYoUKrTwcgF0e3/ZZmOo0VxLNn96QKHi
 5dpaeuOrqtEU7J4rgSQ==
X-Proofpoint-GUID: NdVUY9gku11wbGGbqgZBjuk-94rvLcOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210089

On 1/20/26 11:03 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 20, 2026 at 12:19:27PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> To make sure the core starts in a predictable state, it's useful to
>> first reset it.
>>
>> Wire up the reset to fulfill that missing part of the HW description.
>>
>> Reported-by: Val Packett <val@packett.cool>
> 
> Closes?

Outside lkml

> 
>> Fixes: a3db7ad1af49 ("arm64: dts: sc7180: add display dt nodes")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> Let's check that trogrod users don't have anything against it. Doug?

Good point, I don't think there should be anything wrong with it
though..

Konrad
