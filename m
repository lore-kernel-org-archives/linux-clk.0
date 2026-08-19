Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD0B48BD2B
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158123; cv=none; b=qTfhgGyt7bPqgdOS9z+nqKrBNMfXNhen8I5e/pqD9bWrokgFIGl2JDFmpKO+f48PMDlS2DgMnHIEQBZsZns8fhXjujLc4T9xj++wE1NAZuVc4+s9JcwVxrVis1545xS+e9Bqu0VUkrm7BazdwRpmAgZEsYsQdyL7czggFSZLlT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158123; c=relaxed/simple;
	bh=l+17BhEUjQRC/w3E9J3bIejev5gx1pGsjZDaz9YdxHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lgtb0S0G+rz/dlfxVplUc1giu6n50bSjIj7MG7YCcSZvJulVijMXQaRyAVFc25cuGZXpaBOLjBzhqtfxnCWPWR0yhyryp3ju1Jx3JCVCuYB41PMhRnUrOJSvJMixXRQUJvaH1/yMxX8WPIrOCaf/mGgyZTezTeHonKHS8iFWGtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUTC/GLH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8p4NKsk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUTC/GLH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8p4NKsk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1itq212238
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JhlCZZ0HYaVuio0TwOzKVTw8iu5qVB/j65AOdS1nc/o=; b=nUTC/GLHikxAoQKN
	L8svseSWRQ72NR+I/BJifbpZPoytA3pjVMvVI8gYaZtxfU7iyZi6bvizRfnU9xdW
	LW211JCxMFHZFnhFGJp+gOPVAfosU+GUn8R/fIoBBAc/Y4U4Sw7qP5V6p42SCYav
	NKp7+2iT2DQ6K8YyRUEp6KOqhnD+THLns6fxEdaHADCnr/5keISxamL3Gd8iM0eA
	ZXb/5/e2wRW+eJ7Vh8ogVIN95TAVmmq4XOkYCMjAxDbQn0IwtHCvraB6i/QXjxvo
	lB72ujNgLk45Q9xWiQh8+kWgdl69lnhD1SIPIY7E4lRNFXfz5yY44UNH+KDXVwP1
	pSSWVw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es4gkrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c5df34d75dso51595e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158120; x=1787762920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhlCZZ0HYaVuio0TwOzKVTw8iu5qVB/j65AOdS1nc/o=;
        b=j8p4NKskmfsFwlzaVedNCJxriyuI9xeFd0pD/AvwGW1YS8QojnWsB3DOBBGS7dbZQG
         jpvME8GfMzHvY4hqhE1d0I7HSdgMSHjfhFZs5hvAmQ4TAmEcVM6/rAfICV7awIPj8U5x
         U+X09BISO01EQwcl+Y0S+Y1HDOmMeY+rcmAVmCmbtziLESqKZmGXy2vLPp41u0jKmfGh
         lxKHVM0R9d0HgRXznvhATTKAdZ/F1/FJ03fp1ykO+jIXFafmCSYBPI1Xr8PeWHWBJqSD
         /btF1+w2oXWRTa5DbDNcoEr+D2+5NoHeEUevRw6+REBjHpbvXz3dQUqYhQSwZVKnKtpB
         I5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158120; x=1787762920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhlCZZ0HYaVuio0TwOzKVTw8iu5qVB/j65AOdS1nc/o=;
        b=OirnNmk7mE+DaDvUoSDdFbuBplzUg7cuX7yQTtWaKsOyFSWyKTUYSd9L0y3ifoPqBs
         jPW8omXe1KKylLUWNUhb4iitYgI+cH7Idcv0t4rA6/G7EUhnz5XLWW2OnAdZzIy6nXqw
         lxcylVjL9n58M0Uiwvv0/Acrquqr75i8598Mz+sr8uQGMyAMXo1jbHDAcbZ3R67e/fYu
         lc9/PoJ/4rCi2xdm9LfMFOU2UNSIR5l4qN+MWwjSMFQucbn0vz+MzTp1B9JyUkSgudRX
         rWTa0yZfR6WZhy/JQgap6GEHcbfJ62aZYxb9ObdtVRtjlLsGB4srqa7Oaw7lidq9oMZv
         DYIw==
X-Forwarded-Encrypted: i=1; AHgh+Rq50hIWE/z1kd5vH31dl6awMklAdG1phh9kIWClj30k+B/e84cUp4qfykFLQQJJLcJcEK1tBvgxET0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM3M9k+d2c6SumwdtQ8AhpbkS8N7+vyOJ/IuNy/2nXr6q1Oe2A
	Q4YtJU69qg6GRnHMY2Ua9pFPZS5Ob5C2PS7QI/Npyg+tRtFDZcAFUABY9NoDkVSMXbup92SxF7p
	QWlm/4dMmu0WUJpLVWNJheGnpL30c1PjobjqQPuVYaEF1jRXbZohdQiCfUrl3BLg=
X-Gm-Gg: AR+sD12sFd2sTnYhyWmuM+a8YA1Ovg3uV2Ve5++AbwOvmJVzBeSP/utFHcRyQmFnynb
	IWAze5IiTuwWC0+sgmaDaknhat91vs92qbp4zor0IcP/JCYbWbyGmDzbpqgl+ljQL+sKpFXNPTt
	4DKw5SELWScHtHZKp4eM6DGj3y3g9FCZNeGI2tgmesxkvpYZ5m1OtmMJFy7o6GkwkoSX5fqfLMZ
	nRojtJRzNlRpEOp43BY6qtzuJgnGUlHvy8GP7UIIFSadfnE2Y9FcJRnZX4zTPe9vp5dQjXC6VCa
	EtXFEVJRRcPUFIoNdBu33KWKFlSU2vZ4gDE/kKrdSMoZES8lPCK+Y+CTayMgOXik6UTvOpnIwSX
	OVNNfglwcO4TNi77KY2jRhUQp
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-777faba447cmr854907137.1.1787158120196;
        Wed, 19 Aug 2026 09:48:40 -0700 (PDT)
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-777faba447cmr854897137.1.1787158119762;
        Wed, 19 Aug 2026 09:48:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:38 -0700 (PDT)
Message-ID: <9d8fdbbb-5c54-45df-8479-01ae4fcc5424@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-15-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-15-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A7DXfea7bhTfBxSnuMwRAa189_0-v_AE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX3r4A2HRx104G
 Umqn8H8BJPd0sL7IbYQ2REPbsw0Qgjt02J1XqtAacf2TL44B+xkXEoZ1I5sYIeVi+l79Kia6BbI
 TJS+CjwtIcsECd88DZXCrJQ8SQJq1eXRlcUmfOsuwEEJuawKYkoY+36iHPYPDUksmgJfc4YM0jU
 8zYczdZRul7IOK0+8CbCFtQ0fnyd4DXgHPSujOroeRWPxTV8k/m+mUI5p5a9TYLYH8cIBHrfHv0
 aT3Q8pAnQQtn7CzZb5wOOFbmPvz37L2pIwEfpu6ToY9y/z97dM5SAVVHqLHQ0yEB8rOe6w176EJ
 x2mzKvat4FOILeIYSZFEK93+x1fGe3nuPqkWsJfgP1S/lcNG3rphO2M73DCp29/7xQtyqSKN9Kw
 7VJgfboN5ei9XZSEhqCuIYh4O99ChqXSWVbH8DNrXPg3gE14kkqfoiaWaIQy274OpNQTxbo7eGc
 12MeAYVbkYpa11FYB/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX0merQzhSz9IJ
 KoiyOkVBTr9xl3q82SgNsjaszx3DLRalokT3+RmecqWV/qG9E0M4WbMW336tkAMO/LFqQSfW4fP
 01BR0t7kkzs1+3AoV3YTniRtVaJLTBo=
X-Authority-Analysis: v=2.4 cv=CN8amxrD c=1 sm=1 tr=0 ts=6a85de68 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: A7DXfea7bhTfBxSnuMwRAa189_0-v_AE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:52 PM, Abel Vesa wrote:
> The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
