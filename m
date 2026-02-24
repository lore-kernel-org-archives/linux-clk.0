Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106339C648
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939205; cv=none; b=B1sSLWoQMVGAUl0UldNo898rS+sNyUFS+Qct5+v4b5apXe+9vK2cbxbcQgzeAsvCpxhog6ZB6fsxm8fFNSOYXK5QEVhvenYOjrdIhvvjmbvUbTb5haHHso86aQCyXHyd5b3gK6U/0M5fUcJHN3zZjRkSYDJpU54Pds9+7AgCKjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939205; c=relaxed/simple;
	bh=dqXu4dp6EhpMQd6phBO8LxhfJIX7M4tuyuXV1A9yy/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xmuwh6XQTd6e80FG+X7bdz0FBhxCvp0Y7tEkQEGXItw0ssaecQQX5gjNLCwGYszOl8NAlxkqQ5Et+/zzzkTPm6sFXRFetP+KKD2naicX2TvtFt9boCPV72yZ2ylxD5LTRNOIZxw8ud1vtVrfmorCA6hIZTGk2JGIwtKPx93omDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKA0N3zs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d61WNaSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKA0N3zs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d61WNaSj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFPgZ2220821
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 13:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emPDKvwv7i96jq83XWglXYWY9VE4fVnc26KM4iSxWm0=; b=NKA0N3zsWFso8LND
	aYLCxGfClRg7AmXTfD63GwU9KMTQO4KPb+5iBgr3mnO+n1dHUBtm55ojCRRLSXPA
	2vzdXtV65+rKxyxSf5Au5LC34SrUmzK5nPkrYrxkFA8h6zo8Jyodd7N8qTSkC6vP
	H/kk9PkEstVgT4H+PreKj1ihguRWs/9QFareIGXClIAUAu83Pt9/v+YVtNoeXChE
	ii02dshQwju3CjB6M6PojeUf+M7rFsMbejLEOo4i7If+2SXH4Enm95O6kHnVDCeu
	LGsQ15y5kQz1pVzLuBYHoqrP2ulBxynd5gcJBgAFnSTsiGAnCQk8FjVeNoRyZ2Kh
	8V5mFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e39j0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 13:20:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb399597fbso426415285a.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 05:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771939202; x=1772544002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emPDKvwv7i96jq83XWglXYWY9VE4fVnc26KM4iSxWm0=;
        b=d61WNaSjEtQkbcGDJw5ncmczZF26GI2Ath91jg+1EZAu+A4Ur81+RmeJZIqbd9qOwj
         DjRyN9E/sDQRJM7lux/1iFiTYSZVttCk5PAgtjBIBqFQ/kHjRokYYCqKB4+y/EKSKbjH
         dnCAJoT+ZYarRw++eaOTkEm+btoaFjXDAIgy4IjClYfuQ8zzZZSpJa/yIbW8Gu2pQ4HQ
         9LcV6TN3PU8om4yBcoLMmi8lWPzUL6ZH/Xji38GaZbFqBX6TQOuiB6J/JqvZdBStfWNA
         TD4GNJTs8lwWqbPmV9+E0gV/bQJTWCdEf8RlEmp18my++GYhnY+prAgrIlIbEPoLau2C
         +8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771939202; x=1772544002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emPDKvwv7i96jq83XWglXYWY9VE4fVnc26KM4iSxWm0=;
        b=YU8WnWb7ImuF9h8ffsp8KxfcCGCRM0EnQ797I8hssVR+iQsKf2xUb2/CR9hvlq3eWP
         cAXGbpG7z/j53jEOByyLqHRPraanW1iu7pwRr9GARcToXlRznt7uIwhsUCvEnNmrBye8
         d7aXqYtjqMXsXPuyfTbuvqGIVhPF/M1KiaCew8KYmTV/oakeYU6uZBgyaoLqz/78YyKg
         UMqiucHLAr36qXWKm13q249tqyAJoz5BEvj/WiVO4gB9qzY1/+4XRYkX3sLF0Un0CJbR
         elzAt8aXrSw/rZLoW1fN1gMVAvzJwCrmv6ELQLmjXETzn6dKsKJCacvJdmG77fT9PfJC
         59Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXa+tAw1JF1lN2mkPnMqxwbsNVT8J+k6cwKKDSQZJEHMRJ8tGz6+ZOyFZiyiB6+KOysaLu80bDXrFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJF9uzym6ZwM4iu+7JljPI7+mIs5scDdOPGaUCnxbFDYw3fGA7
	K+ABJLeAkkFnKIbHJgtcBeC8+0nrGSlU1i8N522AqRzD7kS0wP18sINZHzmTVPU5RH4jMX/ThVn
	ckYBNrJMVtti/ErksxZvS0DYz/e8NAHEdCGip0Jbt+tUF5VdYWQtyKuL4/46H9OQ=
X-Gm-Gg: AZuq6aJk9VnvItGztJhgYJsJnGhn1fHb1tme2lPekd9JDI9MQdVX30Jp1hcDsKfsGD2
	P/PXpdMpDd6J7FVv1HEafr8Drmd5B2w8SqEH3T0HGptH+LQorleexMWoS0LXWMnOwXBGAz+KNnj
	1oS6nMECDwuf5k2lWBqE/IgtOWOpxrIMjmNkE0yRFL14xj4S2rZZOF0KiJT3tHSyVQWd/gzNCi1
	c6kE/iSTKeT5XDGc09Pzgg7oXkYbTSZUD7TY9xrqKPvTyrdwrZpefTYjq7CXFouOjzjIkGM9vlD
	f1nicxncpOEhUgozqbhx5PS+iRtyxJlj1+ddVU5EIK7iBoCDrWhg/c7xWyY4BTJ+1c7mRtIMGjk
	QIHoRKKCZt5N0TCENnrzSUoncsru8duRKpUgJhY6qNPbIxCPmDuGoOuk+6KY0XZf1URUY+J2GoY
	y9tjQ=
X-Received: by 2002:a05:620a:2a12:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb8cae5751mr1126952485a.10.1771939202272;
        Tue, 24 Feb 2026 05:20:02 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb8cae5751mr1126948185a.10.1771939201549;
        Tue, 24 Feb 2026 05:20:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4bf73sm424673566b.43.2026.02.24.05.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:20:00 -0800 (PST)
Message-ID: <a7462f2f-4972-4760-9043-f18b6427f563@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:19:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] clk: qcom: Add support for Global clock controller
 on Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
 <20260223-eliza-clocks-v5-5-dcc66df713c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-clocks-v5-5-dcc66df713c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699da583 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XWK_QsXDIVX7E2KYersA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: NjhwhA0XGXB0GqEY-qpJCU6OfQc1k-gA
X-Proofpoint-ORIG-GUID: NjhwhA0XGXB0GqEY-qpJCU6OfQc1k-gA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwNyBTYWx0ZWRfX9WqKqd8GHNHa
 iJIWxqMpWk3ByaY5oSzVX+EamC81KOLm1tgp0newNderr8G4zk7k3pco/jshJI/NgHkYPriLb51
 sTnewDDyGBOrfyyx/GFjI4U4ZtDIZN4x3cJQ4x3mEucy80nw9V7seqaUKNsA7sNOk5qoKFfEnSN
 YT80WiPem5Rz3vU/o4MJ4y/gxqp5Nqo7H+ryayYRMP+VBNESpj9PsHym+ILht709utYF0mV70nX
 mFf1bNeXCdvP3YbBNTwv22xARr1i2jmiqjMmbkramE1x+efLxMAjjf5Sz6YNOL0iyMgeCwjzhP0
 RtQAGc9E3gavrF36bL9IA5QgJvZkH9DTXxxdYgY/2Ll3IiK5DQbRMdCpmpU3HxQgnnVkh6JIUxz
 JbzsJigwlrmeaiRoYgjKr6nIfvcUBLPYX0OGK51dRVhlnqbzWerRafQQDaGGw+xLeGzn5mPQOa5
 MgaKpxVb3fs5jf24g4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240107

On 2/23/26 1:01 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +	[GCC_CAMERA_HF_AXI_SLP_STG_ARES] = { 0x26018, 4 },
> +	[GCC_CAMERA_SF_AXI_SLP_STG_ARES] = { 0x26028, 4 },
> +	[GCC_CAMERA_HF_AXI_SEL_SLP_STG_ARES] = { 0x26018, 5 },
> +	[GCC_CAMERA_SF_AXI_SEL_SLP_STG_ARES] = { 0x26028, 5 },

These are different from the ones we discussed at 

https://lore.kernel.org/all/d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com/

but they are also sort of similar in nature..

bit 5 selects hw (0) vs sw (1) control and bit 4 is the sw vote
for asserting (1) or de-asserting (0) the signal

Let's drop these too until we have a clear path forward

with these gone:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
