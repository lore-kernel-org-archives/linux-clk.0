Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097292D2488
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295678; cv=none; b=ODwq91z6N8Jvu5UtlVH8vWjyJcqFVabdVFo0fN09CDD0iYpFzY9+Y06lDQrypaR6HkQ51Uqs6WxjONSzGq9+91GuvIPp8yDQdEVYTWoLTh3YXzmlbZypCLRKUCv8LxR15I3hQ+t2kvtVj+9jn0iRbEPLK2cKJMXvN48v2GZM9i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295678; c=relaxed/simple;
	bh=vfSDJ6gtbN3z3lVkJVbWTfmhrpUp2ibnfXP5RLPWscU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLCBGITBcR3lM7CShhunUs/9cOPRwAzUDcCTruEMrzGIgSewBglBpYD1vU5SeMe5Te0MY3PqR/pe8uUwzZhNjOk2q31e0MiICenEuZvkAM02lkGonYYjDuhuMFT05plqsZZEnbqCmcCHSpp0Yof7qHHn9l50tZO5zlCZyi2lRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocBGaHMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoTV3oEb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocBGaHMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoTV3oEb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TLk73683006
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oTwfVDw7QNHQ4l4Eu3rLR/gbCz9lqfqUZ3HQYe/v6Y=; b=ocBGaHMS/3/QPLyg
	oEGnWfC5Vui0NY8YtJukeSHGWm0KRUnVp3x295q+rRZghnSznYG0larhcV1/9WBL
	phs1q9fhY3Clwg9rbpXXNnQSTGCc2hmzNUhTXtc2bwnJkTlR8zmrIngMSrieNMz3
	L88M1/nRcwpF6UtIRKGMM0R3t1fwfXg1uNLmjviuoSqKh5A2F5k1aj/0DIALGEdY
	Dp7WpzraIj77ecGonTKp9/kZk5cGPuaJ00vWZ/4WSckWBrljPKsJUQikMlZG8hTF
	VlV/4N1/r7nZOQtqbnD9gR/EWNcRqkiJXOF+ANQnbzfthr3SGaUrYfSwsfGA+Rzp
	DqVklw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr6785-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:14:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56db4575dc4so631339e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295675; x=1777900475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oTwfVDw7QNHQ4l4Eu3rLR/gbCz9lqfqUZ3HQYe/v6Y=;
        b=AoTV3oEbf8MizNPZ5ADTTVVVA7P8j0SoP9pngybI5B4GVwKgtoezx2UPvj6RaOf6E8
         OvXbb/Rt8L4JmG/+LIPmdL+nphrOAGgdZT34wV9xbJBaYPDmN9UMqGH4cu6ps2gjqZ52
         TVARYDD/ByteS2zM3uKNhZVPuj1156095faQw7faAlhmOcIEy2aC0lPXTBAUD/8Q9eBc
         R6ALgN4kVA9MxvqdPSOp/v5K0+abwOYCRz1QLfuQhP33y3R9RV+teZh2H7isLwTVGpzp
         Ra9808gJH8PNdWH+sHpzQPzwJ3M1MTBAYretJDkTv41che+ZocFKV6AhGbOV4GaJsyIV
         1TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295675; x=1777900475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oTwfVDw7QNHQ4l4Eu3rLR/gbCz9lqfqUZ3HQYe/v6Y=;
        b=hN+w3q1Zxz3JLxBBlbSPhR7f4P6WBuy/Kom8Os+9j+7qoX2yY37mpWcHKf223Tgtqn
         A1lxSCaVQsg3IlZ/oa8eGqbcPXolfUJh39+208+Q/B1Deh6OidzELxWs1SITolrPtybO
         JLdl5WdJbJAlfebmQglw6QyPLF0AyLFLEWKAGd8899Qrf/Hyh9AJqjMpXz/Rc6NKR22K
         7DU7X9UibW4a25ocovGJzgPifOkS6lN7loA3OjxIeT2+/zB/nI5RifAwk43rEK2aRg12
         yUwxlJp+PcUZJP8wQj8Ndf6t0GZQfe1ynpaGjGDbHb2s1MNRhpxCQMJVHhhGjXzE5/aM
         cueQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nqn5IT0xSZ+M77TMwujLKtU0wHJTiyRA2cWfqHmciUibSw+rChM26k4zqBsCgC48d8jjwhsU2x64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4UpczptNkjVpd7hBWg/ByLCt2di4/FOYBbQ/UDEzMVIfEvoX
	+Sl2Le99gFAnVlZ1z3QGw9Nztmt4aEAYAsSt/rUphRn27JgIfpxCSwb/jcJ506J8bQFE8ebh46z
	q6Oe5guJ38kUBg5QqBzf0EblbniAoPdLaLp1cNXwhwzJMRlWY7z5FSwdO32cInWE=
X-Gm-Gg: AeBDieu+PB6QGwJ1Uwkos+Dr2/kELUrLvVRuyOEhRFxX/wc8XdILKrsBZ1fUJrXkBrR
	3rUS8YcikKWp9SAVxh/RJ9D51kJZxUav+nG2lh4InmWeibw4KmYWlW0EMRelYGAuWnAFPUd5wUg
	kAQ8jTDdtcyv4e9UnlVtO/11kGDuzeUbTL74ukkvE8w8TayTYC3d3QrfGmOMx60DMLUlwV9Vir0
	huAtGHfm9H8UCECY1lZxUmrJwCt/UP54HveAUOPb88koIaoiJGiJaCV15Rf9kOvoPL+cuK0okeI
	Csw4YRoiKcU7/miVNiSycX+kkEAnDyZXczfbFDUzv4ciVNWSo7iorksbnZcJgXjuYSJMinjkrK3
	5pb0kbt2zOylk7DKe1Z/+wi/0wjRpiklWhXtcMV6PgS1pMvAwkwk1aB6wPso+tiZfwVOZvzS86L
	M7UHrMOrFf9lMZvQ==
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6569924137.3.1777295675211;
        Mon, 27 Apr 2026 06:14:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6569906137.3.1777295674654;
        Mon, 27 Apr 2026 06:14:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d69708sm7043728a12.28.2026.04.27.06.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:14:33 -0700 (PDT)
Message-ID: <0314b78c-cd96-473e-aad8-6977b47cf1f0@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:14:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
 <20260427-gfx-clk-fixes-v2-4-797e54b3d464@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-4-797e54b3d464@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef613b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IGZpXzwkV2I0bIdW4VsA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: FTB9XyCxpbA7UsMP1f-LhWMqYQ21AwXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MCBTYWx0ZWRfXybyv6XWepU94
 Q3dw8GbGKbqhBlzgr1OER2rlVgOH41waukYnL7yTBE0RBneixZraimEIzMVWJcdfNnJAIbxiOW2
 ouYVuaqSjTHzvjp5N4njLPmIX15pHAd2GUvvArHt/FjGW2/ohUqEWfNuur+3WbnoYJsNuiKcrp/
 mFW24Ul5dn3b1wKUj2rJ/lAeGuRF0oP/t5mjQzRa6RWOc9gf0acjo3VhrVCpI5d3Q8E9gwlPtje
 WhjEUtSsJwA2iIvUCHdmsXKpUAoWQkawp4hIOo3oo3OYn6cBoU532s/V62HvwE25nP8VRzWqei5
 e3nDHRX5gLc+dlFVHlDcBymcmDbraaY6bzfL+YuZgpPdvI0sQvsli9NPDD8HpTQIszmxzbqumRC
 Irtv9VpEbcWOu7jD84CHOLCiukTDPLwZuFnr7uzMUKSBk+ypKgETVIgdOmMC7AfVVV+YaCsDk+D
 ShdXWTmGBHGBiv9+ZTg==
X-Proofpoint-ORIG-GUID: FTB9XyCxpbA7UsMP1f-LhWMqYQ21AwXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270140

On 4/27/26 8:38 AM, Taniya Das wrote:
> The GX GDSC control is handled through a dedicated clock controller,
> and the enable/disable sequencing depends on correct rail voting.
> The driver votes for the GX/GMxC rails and CX GDSC before toggling
> the GX GDSC. Currently, during GMU runtime PM resume, rails remain
> enabled due to upstream votes propagated via RPM-enabled devlinks
> and explicit pm_runtime votes on GX GDSC.
> 
> This is not an expected behaviour of IFPC(Inter Frame Power Collapse)
> requirements of GPU as GMU firmware is expected to control these rails,
> except during the GPU/GMU recovery via the OS and that is where the GX
> GDSC should be voting for the rails (GX/GMxC and CX GDSC) before
> toggling the GX GDSC.
> 
> Thus, disable runtime PM after successfully registering the clock
> controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
