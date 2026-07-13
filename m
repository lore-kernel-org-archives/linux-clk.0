Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDC0369208
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944880; cv=none; b=X1bw8M+XbUIidK5CQd+I/I09nxKbwVLivjzR6FwRUC0ylts5A9WIdMtJ7xs/OArifkX3DS5EiLA/FHbGOlGtqeNF6iDbQCi6sBF+/6VUoGr1TTGhSMHBfL0vXKfMh2Fg8PzPK83Ga5s41pXB51RVcVt1139XsWcwya6B3G5Oo08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944880; c=relaxed/simple;
	bh=nsI8T4STqsmeEuiGAOxbYxuJO6hrXOyetkh9eq6Zjwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kdj52If4ztsR9jIkdHotBFmCOqv56ktl9tWxsJmcl0rZ/vVUZ0Gu8r7PQTB+ikGbNJ/dsMqjmWZknSz/r21nu90Jhbjszyy8BaYj2kGk5svYCOJWaIzeqfo69cs/Vo78rz6DIfBykqAxL9BBCIq6AY2rfR0K+gCW4HIQ/ZDp6Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIZqpuaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMrR9LnH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIZqpuaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMrR9LnH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDw2w1494416
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=; b=PIZqpuaU+dcN2cYl
	K7OG79yORlwqF+yS3McM1y2kI/lDMjYUmLFLiIPJ6JEu7iwlt5Y1mY7nw5m0KW2z
	K4f/Ogtn2kEloNL9btXjk2rKGCjHHDmSNdFfQuO5sZ8xSbbi6xnGB4GitPzAQiSC
	L3k47FPtVDrgy2IHsSaIHPu9/kI/yEsudc2NxZhmV2FMB2crUFQP7gn6ZIAc7As/
	ZHD5swctvnyvRq4licOfVoCFNqfq/qpBmApvLgiSOiMTkxJTzR3Dnll0cAJzJiXC
	xWReY8uJgUT6lDyrKnc41xax3hpq65biHKXaEOVZIW9UrnQkhH0pvp5FMfC07hdq
	qUFBuQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2f0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9058a836724so5044056d6.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944872; x=1784549672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=;
        b=kMrR9LnHJWgEtg3W8ExNqwgYxhESYNok/6zwHgCI6O29Vd1E9SY10awPWTv+a3cH//
         ko8vQTIlzXnEkMpFmQ3QcPT+v4zNPBTVNlnsyhX4x9GkonWLta2vt52jI6seoCFHcIYI
         AAtKAZZ0SE0HFPJZy8ZgoWoZQr9BJ9F9viWwoPRwmIvEGyStv9APUkvGmhzIH352K7oD
         rJmvBKZQS3h92FgHjrS2u9mUZe5ylj4zoOpK+b2DnRFJ5iWCm0pyuQUA8DWgI74gZy+q
         klTO4fy21n/yGNhzzK4yWGIeFl+IMjuYj2j5Vhh+SLLRfinroNw914ClnF+4MIb5tQio
         t+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944872; x=1784549672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=;
        b=ossIYqK2OuKu/+UolWtWOz2xmjNjtvyw8PnnaFbJvIrPie3azYyzHDrJFQ9HejVvx4
         UF/yftemKK34xpalw+86UbmhIac7KA1Jw1/dFYULjIPzpfZnp3KbFkhWEDEWgiUmms2q
         KomNejbrsan10EDXYcEKhNTEX8ixsqegiME/LgHZtZcSgM5uYgnC2npTQBtinzY8IPJg
         8bqotJMyajkVzqlAt50WrY9ej+86j1ycq2tIPyknyx4bOr1kqHcp9yzOrVAHQyHUvbDN
         rnElOvFAxbL4VSGZw2e6sQ9qZqnP8vL10S9HYTFk5qs85YOi/c4801+Rt5ENz9HSUSMv
         L6eg==
X-Forwarded-Encrypted: i=1; AHgh+RokH1fyp/IpxyuFuZVUarVXR0X/vmYzb6a9Id7u7TwMSk6b1s3YqBqPiM7aBqRcLzzrFKX4R+a2qXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHGiLOeucLSfgdesVS/qWhTI40+W+CA4uLYGz0iEokGcm4iv6y
	eyyFgdZ8Ldw3ycl1svLK+6L4UDqyM0pdnyrHSA1lObuECyPqx1TuJKTrHKulVzzoTyJlNnolDdZ
	Mbd45qUshHrYTrW5KjIRqjHNa+GZsrvSPZIW58GWbX/5+Uw4mWNh5tJzNmOukbrk=
X-Gm-Gg: AfdE7ckU95tL7AdRpcm/fLdBZn9e6UuU2snUT5OVB7Q4ZF4GnWBsoNVbzfraFz0JsmH
	2JZ+Un+BivI9YsUynxVmpsVjI7xsObwniPuBNUoTti+ZV1+TAHTvS3JmVDZNKjf+quMtBr9I8NS
	87tQueTsRhQoOsJq6g+GTDe3DJw/zxaUWpLKE+YFZqjQN3SEEu/6oTc6ppaC364s/MzoAQI0wmZ
	E15cJit8nP9DHi/V4m3h1FPQGYtTSYvWbAdRSrwhLBoT+ehUIPtx/uHsCDFIEt1/WFyU6kVOV/M
	oob/8uKM+excReP1TFxiFsrVmqJEfa3i6zi4SHDW9ABKEmpZeX6vkL5imn1yFYeskHX/KQ8xUtH
	gtgQ1gF7zfMpFxDz2uoyAkVDHjXowlDgxPcY=
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr77529056d6.1.1783944872324;
        Mon, 13 Jul 2026 05:14:32 -0700 (PDT)
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr77528786d6.1.1783944871941;
        Mon, 13 Jul 2026 05:14:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm15075398a12.12.2026.07.13.05.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:31 -0700 (PDT)
Message-ID: <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:14:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9ZmSC3fPdkfEXVEf-toqY37yg6dAysO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX578uzkH4rutr
 UVD6r4avpD7/CTNz5VRve9UU/7tIJtUkj3pCbBjkj+s8M664ietz2U8JeeUdwu+r8z0H/ggnywJ
 2ube74xJtaDnHTnwlcolcQtk111EHmfOZkpQDaiXccpJ0NcIpicx+hJ4F9biQb2EUjEip/RGodY
 F29zF4J6WTaZqQGcU+vysPh9QlHeZDMgcvOOkO0TIfzqjFQ7+AS4aDNKkv5MtuhLPI/OBpaKBrY
 KLEkKfvdKpZr+8Kxgg338op4tqi4DxiaH1vCmHsAVYMdJyWAPXITxK/zBnjUMyk1ZWzY8+/zhbA
 fDlOIeX6JTYFqbPbJWPNPOjCPvAkX2BJzsKkzLoBHVYusygfZdjYAWAz6Za4gQIk/dxIKd5N4Ng
 U9I8+gUZ4S06/50hTbNsDjMPFEXHEiCRTfrxUi72CLJLctInkjzrLNT/wyy7VGU4WmB7yo8O1Qt
 VLQvSrAftn3WxXGV2kQ==
X-Proofpoint-GUID: 9ZmSC3fPdkfEXVEf-toqY37yg6dAysO5
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54d6a9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AMBhOB7pGyomvzLA2OYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX3BqXnKsRMGb7
 8hL6Piwpvl22n8Xk82iFhfULSgCKHd52rHiuejJp/PK6qhVFb8h9fSaA62v9cFBuCi7i74za+e+
 CfzF9oEb0FFz5J3BLiUPjzynJoJB2tU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130128

On 7/13/26 2:07 PM, Imran Shaik wrote:
> 
> 
> On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
>> On 7/8/26 8:25 PM, Imran Shaik wrote:
>>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>>> differs across Shikra variants based on Audio subsystem enablement as
>>> follows:
>>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>>> are required to be supported on HLOS.
>>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>>> handled on Modem, so from HLOS only resets are needed.
>>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>
>> For the sake of simplification, can the resets be enabled
>> globally by default?
>>
> 
> By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.

What does enabling the provider node have to do with changing the
state of the resources?

FWIW there's nothing like reset_sync_state

Konrad
