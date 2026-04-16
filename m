Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA8F3DEFE6
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352653; cv=none; b=Qf/vUk5ID3RxLhjnKxmYUlDICXhmhPZG8fXMEiZOHZrIpsryNMDNL6vuxKW/sNpznW2mVBN7CI3PVznWdpiyCTdnN0Q95qU18a2+GRA87KEVf6Ucu1k3vtGpO5xOzML5JwPNrJp/bQbhJsbRGwP/Pe/vrARIM2FejR+BTyX/MP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352653; c=relaxed/simple;
	bh=OoDxQ6JnCdkvOIF3hQyinUzkThw8zBb3mtjvgZ2UdeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImNZt+gOoIUi755Pc+rY7hzX7CtqvEjV3LwhLFaxpeS+NYcU9SwaGZtSlKCOFtGRft2XaSD3egi3kY2EzZvujTLe2CgOnrUfO4fXsZnIifkom8JCSmTtdvzY1pzpVSa+HP65+xQTHP238tuE+3pPD9fvacu5G3LJT+vLzLD9oIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cyiw650j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFa7woHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyiw650j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFa7woHw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GEBIOx2576005
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 15:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=; b=Cyiw650jP1GvuZns
	XT2bm1qDSlwzCTgSyeUxpj0iSWM+xmATXjOEN2tq5YX6sDQvk3ccCsjWRhy7Jkxl
	dPo1WhG9TnHjt0o8vvLE42SY5m7WkyTaOnckdFWmfZLlYj24x4VJOuoWgi5UHWly
	NkXJactehdyih9M4G7hZOH0RImh4lJo5XvGSyEtkzShm6y5wX5Qq33Y/wmeKoHo3
	mEc96UxRtKC86B7yd8M9XLRwTpDCKbglUKXctifyp4/jj579uauva1oyzrtPrUbi
	EbSVnJLCkK8kSstuTyY8YTRbG/Y+aR6JsSyJoTKICn2cqkK3xNWTxtN/XmOJnjDg
	HrEuDQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27hhr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 15:17:25 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-472c7f16ac7so1402420b6e.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352644; x=1776957444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=;
        b=MFa7woHwYGxeFHnhCebOngApdmzxgicc4v3jXPQyhwoKayqhWL9ON7I09tiIukrjF1
         JlVC3rkno9sQFab03s4AlgpkCYlgifmTimdK6aemjSzk6XM3tTKPkBEv12eReJX7YzR/
         wRBP5tTxLVjxfZlde9M0d2VmWD2PNnWYfZI7kRtXOa2KanupoC+SZw1y7lKDtbqOvj6g
         ESZzI8hem6CBjRKdblXO/Hnw+syec1p3dvga4MVcFEfkqc2VvpFbuYtcgTH3YdmXOKnO
         beM1Qq3/toeTseRA17IY5M7Vcr33DJddBs09SV1ndI4zcnRsBAC0j8moexzM4yNw+sX9
         mbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352644; x=1776957444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=;
        b=YlUk82W+2tecW1w9gWdaZL8xNvfsBoBxle4TdyFJ8yjNctPXNXdA+xQRx6XGSLoN7i
         yoxGDWpXc5peNR0k8mPxczaFGmrfyGH3Ti6YgVsad3HVCjwVKy5GFB7nycmmJqASRV9T
         0uewbrdRMqJEugEvfE7r86I7a6knzmxWhS3YMIlNiMHRB3J3DbOX36iLD9UMQTgEcehL
         CwixW3/TPd1T/Pip5i28ukm+iNP3NgmP8fjtU98AOOh7/9vG+ztEHwPOSCjGPR35Wpr9
         IDuAsI3gPgz+ShmHgKJtZNSfKLY69QR7Nl9cT7pnV40i7aFUNq+lKe+HALxMY/zq/tlx
         3tQg==
X-Forwarded-Encrypted: i=1; AFNElJ/04s4DiW/jW7+qzkrO7GxL845FbZdANrhxVRtT+bKq7zbFnMliF3JtBInZONqcOh2mUnvM3VAlm0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlt72YicX4GFSMz32mEUX5sj9X9YyfKp9FIh6K6s4hRdsJ8OHH
	i1feYK6a8C2pGvjiwsYIuam4vE+0F60hl3vyH/GYdDzNX5vL8K60em4RPOTE6yP9AWgRnV5qXIi
	HmBelsXrNIeJxBeHr9xeIslzpUsUnm++Tb/dYr1kn5OQ4gNhn87lIeMHSwQxYOSw=
X-Gm-Gg: AeBDietFGNxoAoDHXkB7srp8k6wca7DYGH9yY1XY8sdg6gZil3cBkeVdVVZJg1nl9/Q
	tiygC2Yj6RE3xdcyzmK0tJdCE4/TqNR7Lc3cP9EQQKNZch+fFtPJ3yZUKiGkiVgPG/H8uLehha+
	A4AiP2OlcFyU89YqvAn7OzxBFnxs42hk+8oXLEldzg1ZtrO7tMVmg/4hTZ7zjxiqRSXHJdiYvXE
	zRzdeYwrRptjn/VSkwiOUdDbhAkibWgOgyoDiMK5tuv96ld0Q1lJvHsGF/gXUpeI2sk3eqqKibX
	MxPjqQYJPJAEoqM7c79Y7kn3fGyK550Xw4srLNwUs34F1h4QunMg9vETq64cn1ZVTtgn6qgZgGJ
	U4uc4kDsXb3JsxxFezzbNBYexN+beIxxHL4yZgkV7GgN7MQjjL+KEjFLFwJydT9gNVID7lqhDIj
	/S5JBmBGddUjowUw==
X-Received: by 2002:a05:6808:2225:b0:459:f0c5:781d with SMTP id 5614622812f47-4798903ba3dmr901505b6e.5.1776352644383;
        Thu, 16 Apr 2026 08:17:24 -0700 (PDT)
X-Received: by 2002:a05:6808:2225:b0:459:f0c5:781d with SMTP id 5614622812f47-4798903ba3dmr901486b6e.5.1776352643869;
        Thu, 16 Apr 2026 08:17:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba299f51c01sm93170766b.4.2026.04.16.08.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:17:22 -0700 (PDT)
Message-ID: <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0fd85 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=sGea1UAM9DjOSmaL17QA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: sbXzZGBNQiM-ewsEULbdIjkEvSSRI8c5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX522WATeNqiPN
 +4hxo9pPMYxN3V92IIhKQMOabxHpX6UAC2bPqbEgLAXryt3pr3Je8It0XgFYAOEzQKHz7vYf87d
 ZNjn2QkPLmfUgYGN0dJfhUtHQDMUgm3gwdj71oUVB92M8MfvEt5GPodW4hyZvSdnaktx0ouOOyv
 IlOuXgE31OWjgPZcYZdb60ySyrRDecFoEbX2e1NsYTNQHWGsVoS2/jp9Tken/iqzDx0xr8p8n9b
 um81UTY16adgMahpYner91gHWaR1JSpVfIjZWV7oT439FmsRFxaAjlEdB52TCzFtGNJOUQWw4Jf
 kUR7z9JQbs1pGt/AN6cPxviEACNDLgBVrfbJcpfzy56Mc5VBCb0Np9tblpay+PrbTCHKDyMgM7h
 OaRKRn+taFliFyKFg2Rbrd/gQ8Nw60Oz7VEWemolN0ganq1EQyiIR+9kzdnatmVrJwaVxcMFlxZ
 fHn607qVAE5SUTnpB6Q==
X-Proofpoint-ORIG-GUID: sbXzZGBNQiM-ewsEULbdIjkEvSSRI8c5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160144

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index 90e966242720..231a3e9c1929 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -267,6 +267,14 @@ &usb_hs_phy {
>  	extcon = <&usb_id>;
>  };
>  
> +&venus {
> +	status = "okay";

You need a firmware path here

Konrad
