Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF93C873B
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159510; cv=none; b=nQ+iGW+df2jTU9wz6mf9F3VnwMYt5V9RKMvSlfFXcvvElxwTQq0tDXdti9B6rlrHEKc/SWZrw+w+7j/QiKvYYv1YbXWInYHSYBFFVFiq0/2Gm0Wtc4wHrr4fS2mRfJ8IDYqdaixBlgYGyoYUzaq1pONSUO0zBNeo8MiIPK4ehv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159510; c=relaxed/simple;
	bh=KTvBSKVfut/C+3RayjBd5rK9yMr6kzjkGYNXJVsrWJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxzBLmZH1hgA7ixRHOOeUQkpZwQ5v+lER651pFZRuS6Y1kRqH9FG4VZ9LrKGrdv2HNsEfjEUFhi9vZ4TGP6VQNovL7R89dAzFCkYL3SLoV9d4UAsoEult3Lr+sOZeWKjLMbsgLrk44Yv84jK4vwus17nqpC5R8VSUjV9eRk0Hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S22rCgdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FR8wTGFC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S22rCgdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FR8wTGFC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6NTow2633313
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=; b=S22rCgdyk0Ksxxmb
	Ew9Th1pxGW7YLVdkyeHP8gH0X3S4KZI7lfVccM7bmNxkK6ziB9upigv2Adjhb7O5
	MOVqpaEKleG+wCZXgqH8ZYeDYn6TRtKFFVnmAwuOEawzdeqkbGzxYuI2zClAag1k
	YwprDNjzsSYZkqLf1sOupW7EQ4dShtdetCHJbswvDkkHdn7LWh5w00jq9bbjgF5h
	WZamGRJe12Daq2EtZsU6+wdlOuFF2ZLZ5ERrnAsZEJhSiZ1AGKCHV2ZYh/oshCoo
	aNjZ6RFDi4JmsOKu9qFZwel3OCVwVz2hYsVE5ai9KOHnR2i2QAZkwPYp3UvOsu4A
	gW/tig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca4af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 09:38:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954b9b5da7so18130286d6.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159507; x=1776764307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=;
        b=FR8wTGFCcY8etnNmNhdDG+3XZnP7sTId8MPPwmFhT/LeaoIk1GGH0YheweIx26TqFw
         /n9Xzba4XhHag2ge/M606VOsrZEHa8yJmPal3ubY15oyhQhpGxV3Yhr9bK8L4uxVqBxS
         CFLvSqQP+q9Qsl/0jNYGi91ZQcdp8ZXgJ4jvzH/BMWxQpvxKHeSiOD7UTTVbAfpSbg+Z
         VRdH9ZgfYNt9Kj4/Pzr6pKRCNSR7zCS7oJiAsityO7KE/mFnUjV3O/X3wzCbGIxVDp3c
         HkMSiONv1mPnbpj/mV0jDPwPbT/vtYnXkhISlSPwUzZQnxIqYyr45jAagZbD7VXcg/3k
         ftUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159507; x=1776764307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=;
        b=KXCDRYmPywUeGsg77RSxjeGy7c5uRVFULTwovjulOcAbpe9eiccri9dktC5XV2sRRd
         wzQcXInVO0nKzkqN8iczhFlAxFkL/emzUX+MQDlo3cLfedRaa7Ar/Zz1Xf1wZvEKpPYO
         L/oXKNzUkLKQ/4wb558sgfZLxEcInN/NvIm4HdILhOvcsqR+EIR6x3MrWATVhhCeiUpv
         bNdK8cWgGn00s0j7gqv2ae8QBQQhzW10UBgYNqSbZjot/uOtAUocVYXreIkwYso9lZzX
         bgBMaZZP/sV/HP+f7VshxX8rGcTOxs6W4owGcJXSBkLeODr9Vkiq+mARBXqOWoVsTadL
         aZDw==
X-Forwarded-Encrypted: i=1; AFNElJ/TkY2PJNnSGXelfygC+XLESQOoVODZ+TdWL7P0GZvARgZrVMXowCi78VdXfFQ2n+98uV/EJKL30EA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Nt6mB4f0g3k5B+uI+BGG64Z4K2M8gSRNtzFWJpTO3oRsII69
	OzqdkoNmsaB/P0QeUZ98Effz+PXexhuEFSBlJnFYcrco2IqHbChLT0I+1rir16l3AHrX6O7cvI6
	w68O71Nt1R8sG2ImEM6T4b4LWJax0d0biF1zL+ZP43Igh+HTWf2hruQ9CfNNBsss=
X-Gm-Gg: AeBDieu3pDsJlPNpcvHpK7lmrAS0bO2PdSKTmkpCcERNCsrcsI25LPMaqOUYganVtv1
	6WB1VHMJTEUQ2mIQmcvTnq9HOTisYpBpziapkccNkbWu0fcvW/YJddTTdW1z1eS4ydQinIlgFxt
	b51DHKk0pEGXIfTbr9BXMCJ35jzsXX7ObdOLLIU6/o+e3014PTCk8spHbRUSas14SSExuAmB9J/
	cXW3+jPnmSaUR8KRsP8H60hTPII3p4cHaSztwyvTwlPZvCfd10LNgl3NC1s4PwSpWgj5A2TB4vK
	wepHOF2EHk9CAdTVKiMsuCP9J5jKCYrwd9lWb/2oN5GIRq5VU51oRzWagxaiCaxEef31b1mVyWI
	JgTDmJujqWjH9AsXjvUUApHC/NEysL5ftEBI/crXjImTnqG/NhgmmY0wZ3hFW3Yxt2GfsbhgZgd
	DK7+mj4OvhsbCYpA==
X-Received: by 2002:a05:6214:260f:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8ac86ea9d23mr177075156d6.0.1776159507692;
        Tue, 14 Apr 2026 02:38:27 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8ac86ea9d23mr177074966d6.0.1776159507325;
        Tue, 14 Apr 2026 02:38:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1810sm379610666b.55.2026.04.14.02.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:38:26 -0700 (PDT)
Message-ID: <5d3190c1-e09c-40c2-9ba1-df332d9f7aed@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:38:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IN6piGNUt0aq1jMNRabZzJ3ppiOIW6k3
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0b14 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6Xm4nHdHo4a8rT5D54oA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfX0UstOPyW7h69
 LQp/4THFCTi7/RK1PCUFbxigRGs3WIyU+/RKx6rDRTFPN7JhCmvqesnkTzS34Ud/QHEv3F/IehG
 NYjle+puVhn1eEZ8YjVssfwm+HBHHiwrBtf8kSMdxF1eqvZ+nIkP/f9rtur+a74xRUyPZ1h79zD
 0mJerVHJR/FqtGMakLOPjODYANopM5xHWjuw4VBnk6WjVncqyLRV/LVTJwO6SmryCFRb203VIek
 Dg71ZgyQKOV5ikw1LDCSShlkx1TtfV9TR7V62cPO0Fu9V3Hdgd9tVwiwifFtVD7P0EYE5JwFFKN
 RO421tJL0CdpWBnurWS97AOecRfhCvjSd30wXvmNQ4vBhgXIITYwxUPhMMT0n9z+uipTZHTH6YP
 lrrzJ/YLyG39tDtei0QbFuTi6f2x870Ab3FV28lYsn+aa17kMdTbzix/AJVqJkY29Zvb4Vm3TR1
 yuMDlH+d0qqsKCCmQ4g==
X-Proofpoint-GUID: IN6piGNUt0aq1jMNRabZzJ3ppiOIW6k3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140088

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Enable shared memory communication and add the SFPB mutex for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
