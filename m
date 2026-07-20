Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A9F3CB907
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535250; cv=none; b=YoFC9HahYar0Vm43PYSPjjjx/LTGO06lgP2kaqsMcx69xizLnptPuAkk2LIsPqS5wrHqUHxRx8mtCGNi+edP35LfXAwW5cWMhznz2rSPGkGAP30TwwLVwhc/XbQnvwug33nyJEW/n4hP6cQD3zIeyf1pzygJDTRsz1oL+MBqVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535250; c=relaxed/simple;
	bh=o+ww71zqul1lQ6ZJcLPTKRz0ecgZ/H3wEyDx34f482o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuqAWKN8jlUPZg8ylB8bOOIPIpFh+QZ1A/HhEv3l1fi6nhzqOIg5OAiipkVmuPABmpssVJ/TDu9MsKbQbSxOJKwk1/6cYiBlyUOCEmB/NfL6paXfUE4wSwKh5TEUM5BnqiIdTAEsmpCHghwndXHxN5aFdybzyJrZ/yK9zT23EOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irt3KpTQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+98lOY2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irt3KpTQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+98lOY2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6Rhj11774854
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 08:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxSJtoZ36fpCUBl6Gw3F3Tl87CjAtSY5VBZzPq11lL0=; b=irt3KpTQjZgCvSkg
	2vZTHG5kDZU3BViixt5gyrcsC70NGn1gOAGoeEaNrLzYjaXETf5wjD7qOsTlxD66
	o4GylQTk42k8Fd1NrEUgwmnw1pNdlIzCO2AWzOhU/KoBoD3Q1423ju2D3Qj5tYWo
	V58LymGaKfpBIzJ4dzrzoXqFF5dk4qg3+zSvTgCOe62ferPMlWUUeJJKa7vP8Od9
	zcKIgDfrpkB2/bHzZ3+KA9kc2ZHTlwlXx5vU08tkPBt55P13+NZduEpJqT4Bof3b
	wzDN1L4WtD1++NU4qV8LuCzqUuf1NqdHTKLFOs9ZgE2DqWa64DPYHv9Hhr6Le7cQ
	fSzDdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af54er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 08:14:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso185962885a.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535247; x=1785140047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxSJtoZ36fpCUBl6Gw3F3Tl87CjAtSY5VBZzPq11lL0=;
        b=W+98lOY2O3yCDGSs2LjATzKHq5l9ZFgnoCnt9crTjcccEUDKhoVGsqPMxMNCNjy7Q+
         wjtW2+PHM7xFs1szNW5VNeOu3efDUTmjWpPXVHt2OwMQkKElqwriZmcGQZK1wkHWVkBw
         mEhXEAsqakkdhUuJk3zZlcKz5jNTyrpfybxfazn6DtJKK1ftDe6M9yWiXSUdSmo0bqQi
         xLPddfAiHpjnuROS6WRk/wgOWF77fFoj7GyCpC3Lna4uvUye8Zp1jOEH6fOfrbJTAQD9
         8UDqvoR2AdGV6xDNzUXN65eM7CElsYwhgTXtE9SR/cfVy9h6WirsKE9MQrgo1+39nlPW
         j95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535247; x=1785140047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxSJtoZ36fpCUBl6Gw3F3Tl87CjAtSY5VBZzPq11lL0=;
        b=Dbg/9XQU0VuUl+2344vq0vMb3Z7sIWvyO/v9sZ7N3ajvG/VMQ0NbP9xhd+PHWi6Bxw
         fsSWIMtWmPL4zAivLMMgSTQyMBVYRZ36UKhmaKIYS8oXY5B8IV9GENidhzoJmc8r1SAo
         gu9I6FjfEJ0MimbZh9zlP86ervfHLKUtjoTe64b98n8IJ6vJyoLJgCaxWAC+lFFtLJa6
         +AoNagurD9ES6ZobbXhCX/tGaC7jCzSD0E07afEo2fK9GTVExwBNUd2p3V6b3PKw3MIb
         laIrIVJzgOabAQn6yB1l8Q0jL9z8UvhmsOvA4/PEujR4nZMOfwRy9GoQMECMPFzuh7hA
         r6Dw==
X-Forwarded-Encrypted: i=1; AHgh+RokGZu5DSux9UyIzuS5iX8eZlVwjl9dVOqDNgyOn7N99tY60eOkjFwuds6EV/Rwc4QgWPTlhOYUniA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvVtuRohWUm0AywU8+R5vrPSyVagdZgbWK6/Q/B8RSIpVSdbK
	STBO30jXjCqBt233o/ea04FYXxeDdu+JBT3QZUClMvb3upfv4wyiFxq3Tb+zd4Y3Nx+VWaMMqzL
	sZHc96bM7CRMmNEomykpd8Pkz1y85DtCRTiK47JMIxRJpUTjodXEEGPQ1mhaX1XY=
X-Gm-Gg: AfdE7cmXA68I287SmSDAtXiSXQONUC/q1dJy7Pd+RZJ6g+kjfMjKhrOeLSDQne5i56j
	nT7FPm400HxpFtnQfuLVmcU7tYgnMCLKNxNAW4gntXJHeqDZLrYWX63Mv0X3WwdJkdOAh0bh8y8
	ZXhUGyrWC1/Roasm0UxCFMSSN3MoUQeN81bTqdqdkdGWc78bsjOPGD2EueY/DrFozLq3/Kiuo9w
	gzR3TY8ug80FQ6xCAnMkkaWeDyosggdLGBpj8Mo1/nyPVAPVMbVsTMzShQofYcjz5KL7QtwmmPa
	68cEx927HiGEJ0zNrnGZ+KNBeA/0dKCXBVEFCMOQIMxAMuOnLMZ2ROw3RFgZZ9qdGyQQh8Pknol
	mxnJs+cobpVXknK/I1tEEp6Oq
X-Received: by 2002:a05:620a:aa09:b0:92e:d1e1:8300 with SMTP id af79cd13be357-930b41f98dbmr965454885a.3.1784535247487;
        Mon, 20 Jul 2026 01:14:07 -0700 (PDT)
X-Received: by 2002:a05:620a:aa09:b0:92e:d1e1:8300 with SMTP id af79cd13be357-930b41f98dbmr965452985a.3.1784535247075;
        Mon, 20 Jul 2026 01:14:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a09a44sm421171266b.19.2026.07.20.01.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:14:06 -0700 (PDT)
Message-ID: <23a3b460-3ce6-4139-bcd9-a9fd88d7436d@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
To: Esteban Urrutia <esteuwu@proton.me>, David Heidelberg <david@ixit.cz>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-1-56fd05822270@proton.me>
 <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
 <57bece3e-cfa8-4ddd-811b-eae271b738fd@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <57bece3e-cfa8-4ddd-811b-eae271b738fd@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MCBTYWx0ZWRfX4WeOqkHxejcW
 M44Q8FrPFdK2Ljvqm591rnpHk2DTCV1ALs5hNOZ3EsJN/lnG24cAFOvQAAQB/BLe7AQEbuNar8l
 0xM8ZiCLLYDkpvHwt4cCScUGnicEoZE=
X-Proofpoint-GUID: ITbM8nk1EMQoae_5PHI-WKOlaRmlKBVZ
X-Proofpoint-ORIG-GUID: ITbM8nk1EMQoae_5PHI-WKOlaRmlKBVZ
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5dd8d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=s1V7f2QmSm5Kp7TUuH8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MCBTYWx0ZWRfX9YRVAs241gfS
 SpN0Yr1xXOm+7kP2zxrYQW8Wy1gxA6Gyk3OAcrQMr/xdkWj/UjRiTXEILqGEoLfdD1UxjvMyZvz
 YH09hnl9+pmLXfGv27c07deW/8YsKaaesspeefIYPBGrleIVKzJiDdoqQjCw69+9vAd1cnCtUly
 zzP3qqx4CmrTnBS8SVH9R5E0+n6TtCTpB2uVRgH5lq3/Qh+QJPaJK11sUZLUv4rShRRRijqa7te
 1c1Okt3NWK6ph+ZRaH4aodCKRyx3Il3JlPC/4R0jYX67Hs4lA6AzmZkRchazpZBY9r+NV1tW4CJ
 p/3mKHWTGc9ngN5Plg6Gm+UXqfNocWSUGLdmhiInGTsI/Qd8HdIYclkRhN9kaqYwjC9wXjNrkXt
 Io8dO5lhvLUTmtIBUMQwj/FjuwgjNWbvOJ68nRpwszekn67EQV+x96IyeBNKyTebKA54NgChhcL
 Jt8fSLKcWZwORN1oKzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200090

On 7/19/26 1:28 AM, Esteban Urrutia wrote:
> On 7/17/26 5:02 PM, David Heidelberg wrote:
>> it's likely this change will be safe for older sdm845 too? Comma.AI people have
>> it applied downstream on top of 6.18/7.1 [1], so I'm wondering if it's something
>> after testing on available targets could be enabled for 845 too.
> 
> Hello.
> I'm not sure, since the patch you linked modifies both mdp and rot clocks
> while I only had to modify mdp for SM8450/8475.
> Both clocks would have to be tested to get a verdict.

I think the 'rot' part should be unused - the hardware is not
driven by Linux today and I doubt the bootloader sets it up

Konrad
