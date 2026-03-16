Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410C3390985
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654416; cv=none; b=LU9tV4r7Hd5FcdY7P6YCuU5+n39tx9BsPwVR7tOHM7mhIuReycA3XOJXUr9qAyKhaIpLr//zQSlPwqiHxHXc916mqChLIP9m4C5TD6SZgojEY4e20mAuP4UikaUPBVb/XaFx14H3de1Qm+PkPSeWkZ7mopttXUbKF89RKcpS+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654416; c=relaxed/simple;
	bh=5GAIeFCS0uUPv2PKBNS/6Rzen3mfcjnDIRp5SqOEd4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksI4Ga+GC53yy8vpoWg3hFl9XmQEnDOFAHxqxDCkbSrgQ56SmpfGDDML6Jg0msVVlEe64SD2IXotqPcXwNTAY9aUkzNed+Fb4lPF9Xnv0vZ1zOCMFwv4lZugQuckmnf7SkQFyrfkzYAtQWkqSKVTD+jX07iaep7Dd2HiwUwhUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMNRTUwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlL2B0Ol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMNRTUwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlL2B0Ol"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hpK744133
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=; b=AMNRTUwma2/9IaeH
	bhQbeiAOg6wVPg+ZoBY3OsJG18ZcZBfk7PTWVMNihK04XX8qfQ9e/1UGleaTNLVu
	PFVSxBTBwPXD1vu8TzOSue0qk3xB/egG3rvTqE6C9+0sTixg6dgloz9+aU5fga7r
	zIO2TCs7GJohbO/gFOWsiges1KCkuVy7etOnDAPMcrulHg63jpSl8Bs+SaSA9eCQ
	ZK0O63a9WuSEhBBSEMR3Oz2hl7g/kT0epWeU50EPS59X5uO7/vcmR0zmOX75NWEc
	cP7V3bc8DcQcEKLkA2g3A5RoET2BmGQC0MrvHu40CwekY2tR4pd7br6chi9O3xUB
	TZxJVQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bd62w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:46:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a04e9d4faso35460416d6.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654413; x=1774259213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=;
        b=VlL2B0Ol3dngjeW5xO3YCotO9cWt3Z7eVQ1jFabFA9ihS+ihCcS+lwrYJO7dzKtt5w
         b3qaqVf6X/v13B7M8y8/zpyC0PJQ2mW/MtuHjYOA8cS3Lt0VzT7eXMtTB7V0TZvFJDoD
         qg0ajbAGype4P5LJY7pASOvE8n6ll0YS7u8tG6MzS2o4dhWaPGznAVSctTTNpfuW9bwv
         DGV/pmkdwPhOCgCiqt6p/abEtI9RElMgnyewRjifJoMjuPABtbRl4RtLp+8d9Jby3Sfq
         NrBP0Nbcw0Ovt2UwVnGMmpI7jLHBi/MIJwOuyUizd0D2ihZRMwjKddCcdS8N4YqtQ1we
         MlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654413; x=1774259213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=;
        b=QcNPi1RKxxAOUYoKuAamTuDjZc3YJ4CJ+8CrHKJ4h5eMCsgNnuii1gIE9/a7vTdRL4
         2c+D6k+9jM3oIgUDegcn9AUapEum6gpTpfybxwgvIOfALC/aq7xfprqtj9vPu5Utg4zV
         7vFECcEhJzzbMZ+h4J+GrR5LFLs9+u/7cAr05gldTX+fiOJoCOd/0uMco9JSiq9WNfh9
         GsrWNX0q4Yf7jnLTh5/Ocyyhgeh5FeiCgJBpN2UtPDFDSYQNguJpe2OGEVezPINolg4s
         eF9+koK6Ie9r4xiJNpovfv4FxQCSJRU/mybt7C1QlYBasjbJV75SM7JnBCvOtt7HcgMf
         79qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLfZRP4nswXhOBp4m8+qWHmtDKIqKUDwEEu+jOj6thc9H/e5ymhsa/gX+2G3c8EaaD5MWb1HMij8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhl1sIpFeEaH/QUCT9mpkIK/akkAfrHJiTIgvNIgf8WvehcRuM
	Ytz+UfUPhCoqgPgaC3tguilGE+wQFydvpNRCCbDV186AHIsvaGryTdToYGCMr8GDNa74AYHzCfX
	nl8ANpm6FWE5DS8YYGctH5tRdfQnRdEGo/UNApU0gOpuqBfY7sNUcWOYj6VfNTx8=
X-Gm-Gg: ATEYQzyNYXchZvnmxlCPgffB8/cEK+H5E5Cm/vt7KNwW53PJiaDphxUkbmIbgLoFzSf
	p7nJhnA4aSxi+ifGBCYWEGObqvsMa5IJIQ7fpzvaZBlpfL7hFBZfrtz7hdpLoZT6U6s6sHCVLEG
	qBbq5cHgaaKYFhwuE1togO150wl4uaiXposLevgnHteBHcM1n5eRt2WMhomDT3djZi0mvei+TDH
	nA5FESBz+srQ8Y0zTZx7+xtBiXnlM2Gpihdv6QgxdLZRqZ2cVt5JMIcmyYHR0iLwvS1bDdyVmGK
	0W47FUPdBw33iArjX46tCSeObecLAD1fZcJyjfEGbNDuRXAyu5i/+K73tSZX+5U1p8lfZ5txghs
	b1UWjbw8Cm4tbA7sGxbBo5WgRL2MRbLyAEsPpWO5P6YXFSlQGae26UIj1WH5Z/VcexV92FeYJrH
	44kUg=
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr121904496d6.2.1773654413455;
        Mon, 16 Mar 2026 02:46:53 -0700 (PDT)
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr121904266d6.2.1773654413056;
        Mon, 16 Mar 2026 02:46:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97ae89ebc4sm237981866b.34.2026.03.16.02.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:46:52 -0700 (PDT)
Message-ID: <c89449b8-f28c-4364-a1be-5267f0d99c01@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:46:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
 <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
 <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7d18e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-I31x9S0JgnQQLvGL8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX9fTfivo8z9ke
 FIsbXaagSV3xq0oFYkXpsY5zYnGEs1k5SxyKL8KtJuQMSJ/R9QyVcfuH8nCB7d9sAG8vWTViwt/
 yW4RsVuCysVtcSgOjMNLBcm3K56dLQXVcsqQHz1EL2yDunGGOyevVoet+3GHVWW6pBVe0ft+FNQ
 iv2XLHiS2LZ0CZCpLVn/GrFK86gNpWgyyYdwUTTV+6vZjV+enN7DWlNidJDuYEU67HqYE0+Q91i
 Kpr90iTB1G3eKlDRuW8/3ij5d4burfEKK3e42meVAlonsDyE02zCK/BHbZv30+wY/DqmLlXu2sn
 vpU3UyADNMzhoSc521eIfaS3rADSiypatS80uK+dant8Ez+DNJfxlycdEiIEYuJ2iY4kiynkfIm
 QtVK7YnBkcNtu17wiKO3jiQ9KOALE7Tga3wRtwNh7cGrQyHXS+aFiCWoVncbr/PaefSI+UjSfji
 0VTkFtJPqXFqBvho+9A==
X-Proofpoint-GUID: nPnXO0ejvobh_T71hcssfR4mZx0tVERo
X-Proofpoint-ORIG-GUID: nPnXO0ejvobh_T71hcssfR4mZx0tVERo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075

On 3/16/26 9:58 AM, Kathiravan Thirumoorthy wrote:
> 
> On 3/13/2026 6:24 PM, Konrad Dybcio wrote:
>> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>>> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
>>> so add a driver for it.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +static const char *const Led00_groups[] = {
>> odd uppercase
> 
> 
> Yeah,  in HW document also only this name has the uppercase. So I just left it to align with the HW document. Do you prefer to change it to lower case to maintain consistency?

Yes, please - I would assume the original author had made a typo and
didn't really intend to have a single random occurrence of an uppercase
letter

> 
> 
>>
>>> +    "gpio23",
>>> +};
>>> +
>>> +static const char *const led01_groups[] = {
>>> +    "gpio39",
>>> +};
>>> +
>>> +static const char *const led02_groups[] = {
>>> +    "gpio6",
>>> +};
>> What do these 'ledN[012]' functions represent? Are they muxes for
>> getting activity/status signals for eth/wlan ports?
> 
> 
> Yes, that's right. These LED functions used for the eth/wlan status.

Can we better group them, e.g. into threes in 'led[012]' functions?
(or whichever way they're coupled?)

Konrad
