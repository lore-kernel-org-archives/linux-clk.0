Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF0B2E974D
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582962; cv=none; b=at/vLb587gR0RnzzyTcOceIMFDyFsaJJUW4OwO4OfMh8yjmGAlmZPFdQprF3Iqns2POTd8yU+lC5dPYk1QygwsB48O7qBZmNT9gN2kyTW2OU8EG0XwzQMd9UcVyuZSrFTDVhOOI2f3oHzB1xZwZHgmS1B4QGg/H0MLgBw+YW8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582962; c=relaxed/simple;
	bh=72blF+qsjxC5t/0c7KgH/gWL+JBncousN8DD8s0mg/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqQz2OpfcxrbzMycquhpNFp+ooOXzKhtxdU8fcu6LmHZ1NDhLcivFJ7IsxcQbUUg7RiGNXf9cCcFe2nAPt3PvSqx6EKkRZADqfOfkMtnl6nSV8mCdWN+2L+JH10yoANZHdfH25tndfcwp5Nh7Kzd9y9oWKwzMeZb7xAC/HVQvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKhngs4X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKhngs4X"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IZL5006540
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+YAxQ7zSQqsEHhoPGUx9h78jqSyi82RuPNlGqFck0s=; b=jKhngs4XYL+O2ofb
	dN1aVO+nP81mxKybp4l9e5TfiTanboJpCqDtf2oGpd972JXiaYM1NJKnjcv5liTN
	he/5VtW5mLt1YDL/Dj/+2Nq8wA2OWTuxjE4eWgqdzWIkNKElkS9yRrMBGrQoNcmn
	NYLO5hKE5OfLwuQXfZzZMuTrCRTBJR/gfhaX3P6ENHKwbRZhDLjdVqFn6qxOD+rF
	WXbFet2F6I8TX0CIkY0z1vz+JcnBgjSpp1J+WMLS9lyC/nu96rrN5qXGTtcCrLED
	Y4TyqMRoD155UUylNuSZ6RLriWSfc2WIGr6UktIl2lRPUIYy8PH6FowKZiVbsPkK
	bTVRZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8af1x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:29:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b601ceb41cso2031341cf.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 02:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582959; x=1758187759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+YAxQ7zSQqsEHhoPGUx9h78jqSyi82RuPNlGqFck0s=;
        b=A1Kc4lTRg+BD61yc13aW7YUTE7/lJvmomNTfZAs47F1AqfgoEtatLPVq4strgkfWga
         brZKZffuCTwYjOJCxvtrKS5kW//I5E0B1BEPisUuB/qkEvzVJPMSXTjwJ8FLZn7w6OWz
         E4DOtUp6PjIeSST4lnIqyctVIrz5MiUQy+J8dsJT91b0JLLgu7S7F3FXcbzDDvAJd/Zm
         3qvIHZvjU1WaOIm1Rsldj/XI8OL2zGQuuUd1xOWveEWNq3USWKflrttU6hCMwNMePeXE
         ZgUaO9nd7OnqcsHzLTx+NKK7TCkrjjeVdoZZt2WGrikmHZaoKF9DceCYRqgQNuq+3UuA
         jAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXafH7TfUGm1YtEAJerv6fG1g1ehFJXKoPiTUrQW0VLAEybumHTIddFxRRCL9tDR0J9L1T2cpspIhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+hM6yJxQG1Csa4NKZZBG5YEueu981nQCcfJwpqh9Npo6xqu4
	Y7QVMNmzx4MBHom+PK3O+bN1j2qAyAMIzUXDMPrJQFC5254omEKRrEr3zMhIF3iMxPKi70URUby
	8tlA7PQpBRIvjkRzY9LpDZeNEl95q0nPHMMSfvQV0hGGp0EqALAXNblQ0z5Ci+4M=
X-Gm-Gg: ASbGnctNuLVEQaaMVN021yEC2Vp1vGhLDtUIHkcfrpoW2SsXqzC4Mn/lOzExermdbxb
	kh2nInySSWlTIRn7aHuHsMbB2eXwMHsieJ0L9B2yhSVvGGLMaSLW4A1B86HrITjJYfJc+QaijYk
	YFGAcIPffhZObD94cqCx1CydMlpYgFdgB53lUZ13OWMkMzzaQwUxQ5yTMwLIJiPz1a/Z0ZWG8OA
	mAhkIwJZudP6rpTvilnEPXfXNOiT3iXDq1Euw3Hxe7Ab5ryb1pzpPg2y+Aj6wIBaaorwKDSfatR
	gMWCp/5eLG3p0oXfLEECohBYzw8rGCs2jgwl9++4TexewiiYoWWrO70GB9iXMit8LE8jOasee4G
	x8Xekj+S6SpTLib63MPul4Q==
X-Received: by 2002:a05:622a:164b:b0:4b5:f27c:8617 with SMTP id d75a77b69052e-4b5f843fbdfmr136176871cf.9.1757582959384;
        Thu, 11 Sep 2025 02:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKi0OXJw+fb5DMhFJMlcJiDUG4pynx0/PF3ofCRLDUToHQyWaA2C/glaZeMv0uhFDnZzulvw==
X-Received: by 2002:a05:622a:164b:b0:4b5:f27c:8617 with SMTP id d75a77b69052e-4b5f843fbdfmr136176741cf.9.1757582958891;
        Thu, 11 Sep 2025 02:29:18 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd60csm90074966b.62.2025.09.11.02.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:29:18 -0700 (PDT)
Message-ID: <30c7a7c8-ac82-4032-84f5-4a470283635e@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:29:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c29670 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: w7qhcEPa-XYHnY-zYo-qgIw6gA3t6qZD
X-Proofpoint-ORIG-GUID: w7qhcEPa-XYHnY-zYo-qgIw6gA3t6qZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXxsizp7Bb3RfW
 DYcIzT+8mTc+EFC3fFqLn89bKMALWf0qBvBaIyiZWmnS04+paE388jttYf0NMP4B/4zTsGHTtJd
 7GZCy6t2RNsL8mdTKGSdF+TZ3X9mXwQ5rduYPuhnY5VreFVBChjOiOWaknVU8Qx5oQW7e18uvyt
 ktJNdff4Q4l4TII6hwoQmc5EVkkdc/9E/gYYTyQfxH+lx1ZQa3NbPij5Q6AxFrdttl2g7C2dlWg
 V6GqF2bBYgWcIMt0aViTbTtvyaIEBEN+DL4gY3dm1V9+9yp01wfI4lFYYSKGhVbs3kIT7BYQILS
 J0/ZstAXiWXywT/gT2U5W/zByNtGrRe48gMrvd3YG4v7Mp8OzTw7KEVUCGP/zbiRy8AlIHUnT8x
 Zegi1OPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8550 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
