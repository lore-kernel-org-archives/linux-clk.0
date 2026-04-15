Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D365391E44
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240360; cv=none; b=GDp96wNnKTvrq+19Mw1kXIhiaODrC5g0yTMo50LPwhYT0FYzyPVJpZXuHmpsaG3a0rn7viyvdZInu0etQZey8P+1i+0/gpLjTSuMXuyObirkJkksp8yvTPf3osW+FLMaEZyTVfG6VKl0xTMbW7b2XVtmvZYmTGXQlXSDK8DKBsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240360; c=relaxed/simple;
	bh=2DDPtEzoVCZkgFIPYBtK+Ad36Wq/d0wjmoJvNl8NxwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGhyMOWcVSrZ3tEiymFBVkIwH1v1Opra3RQVKDz9+cXhS9ml/kI+gyVe9umPgy092b9a3oIfu7n1iDJrkIXU+XaDgEQLP0PC/xe9mKrEmrKExwZ/bKUbpjd/3tmq2I+FgeDX1dIVmD21QyWOuk/InC4irYqG19AOlrLGXnPCuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mvg0i8r9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKumVq+d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mvg0i8r9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKumVq+d"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4JskI3126664
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 08:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dj8Ohoyg5EdWLl5OwTikqGQxN3VfSLXZZkdw9EKrecc=; b=Mvg0i8r9wq++yum3
	Ty5Kq2BROXgDjvv6j39m4HCLqKuqkoePLXXsE/wbPWugI6Q4oxq1euTJ2a8r3d6t
	hzVPXgLdAGwqYJ/DOwa/4+1peloM5B8r7ynNpPCZONJald++lLpM1v1FWgDvb+dD
	xXMDmqSQEg9f9HllMDHmDTbGFbdtFxyYIbde3YG2qf0N17dixTghJEM4oGM1u4F8
	A7rdHTVmHiZo2N93g3g6LWkDi0cYvEJQSBZ1xcy/hIAofnwwTSoRApq14LcVrqoD
	WqiBBf26z4cn/n5Dy3GGjYbI48JJbgRRK6kaLZAw9aZtyfKBwav2kSMk0cwP+CBe
	HELR3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56tap8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 08:05:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso17659666d6.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 01:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776240358; x=1776845158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dj8Ohoyg5EdWLl5OwTikqGQxN3VfSLXZZkdw9EKrecc=;
        b=VKumVq+dN5Gqbge0xdpzN2qQmVKJye52q8HHNw0hj5SiiBEXO2Dct1Xtkd04fqe185
         s7beg03maGxqUm33y+VQkroSf97TltxTyOYLK6uxNSLoYo2qrRHpcaXRw1ASpw9q7spD
         YZJa88/Hx1o0BPf1kJrG3TYRoLRJ9bOESWLGKqq9letIUBQ/woL/IEiZOjM09EGilpiE
         QhhIN4jPl41Y8+ch8rk5dFsUlghqp0vpj1VbRm2jYJmzeSH6tSDP4DqdPvgipnsAmBHh
         hk/AAwtAQbPHkBtZHj/vR71tlV4Wb1JVlXQSLo+cWV2VOEWT3oylyEl2Xab/3R/wlHXE
         WOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240358; x=1776845158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dj8Ohoyg5EdWLl5OwTikqGQxN3VfSLXZZkdw9EKrecc=;
        b=FfVegAnAcVsVi0rX8tQjZ/zSqbO37YwjdF8X0Fr4prhL+ghkOI0U4QZ2jTLQneuhcI
         75k3dBiFC6lLs48YyzllC8skX2z0okZTyBv/3QDhh8MHeRZyBBv3wmc2ndVqKow4vR+V
         JBqGtwkzBwiSCuFfsBd96XoG8w8u/XOPVH1yTYObdOdTRTZOgAkSgf2h4/zYAzdV56CC
         9DSaqDwYMIM7eDtftE9nYNbuS9e2CGsMarzhXlpkTHNTOk40Ap6+iVUSARjRKd23V/jK
         TugEYMWfEmC/t/1QD/SYRsZ79wFhCpTn3tcre3VkLEjUj+pKO2D8RF1y1GlhLPNeS7Fv
         coUA==
X-Forwarded-Encrypted: i=1; AFNElJ/0YYoILYqQYfeYA86kc4yzsvSrpAMHk8DjpaHKiBh5u5y7dTqd12bnSkqNWz5Iw7n6ByxqTpQ9mmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKf2/QJcR6vaDNqg/gRaH8L9y5rtoZ/FbgMHFgCoutlaGaEAhd
	WlNVTHYJNfGrrK/1EsZqmSK1FB+BvQKxqtqBiPBfYcu1c3FHfe3WJXh2jb2ewYPNDoHfIrijDLF
	n1e3RBVzD6FqMt4jI/5V1t2Ao/ybMl8aSh2LtCetZXGMWYdAJHrvAQIcmt0erL+s=
X-Gm-Gg: AeBDieuH9vm5cw44AtatzcZabmoBRDqGbQTp5xragZAzESDQnPAoWEp/YxFllfcg1zd
	CSIFXcMCmmXafW/tjRXMI64GhHCoJruOIh+hjfGnOGNEMSsa6POvcOYAXd9iIijpiewI5YV6B8l
	E+QkiPRt+OVrSA7g9neRu9Sps0d84pwQOumIwNaFZuttftp0KMfrc8beaPmAh2TInnYC0IRa7HG
	TeKbRHy1j7Gwm5QfvX1ZNIVw+9QRtF0ys/5wLxpmmCzB2tcsfJLl/d5Bdq4ad5K4zNe32XqhDg1
	0ZmQGLSEyJyDVTn/4Py2oQdcmgXcvoSk+XPcmG/hsCQLI7FvNuEtWASg1ryDKEi2EIE6/2Dz/+j
	NwHCFkt+dM/NKeasMJoDl5k0xWEJLuynvxuMJHYra/ZNHqJCfYerXoSTQ1t19pBZe/WhwTF6r9/
	JJDH6tk6sZiGk0Rw==
X-Received: by 2002:ad4:574b:0:b0:89c:c2eb:681c with SMTP id 6a1803df08f44-8ae6a908bf2mr17625986d6.4.1776240357705;
        Wed, 15 Apr 2026 01:05:57 -0700 (PDT)
X-Received: by 2002:ad4:574b:0:b0:89c:c2eb:681c with SMTP id 6a1803df08f44-8ae6a908bf2mr17625806d6.4.1776240357155;
        Wed, 15 Apr 2026 01:05:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173d59e7dsm30143866b.24.2026.04.15.01.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:05:56 -0700 (PDT)
Message-ID: <1ad71ab8-6f24-403b-bf5d-98726f038898@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:05:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: clk-rpmh: Make all VRMs optional
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69df46e6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hEP6UMytxTtgw7GBnusA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MyBTYWx0ZWRfXwVhKr17lhJ4V
 XAtwN/hdCYW9GmsqK/uqWIoeaB6seMlBafcu6xCFk/FM1fxNsdvSREyTd55468idRogGXuxnioN
 dz0202WKKSRo34sCUhKPzfSbH6GLrhKoT1WfOCLh1oL+iZSTFxwzpC7wTqyk9KWCOC23a28z1f9
 pfUhyD4HFAOqmvEy0jokVBptEIh9JEc4yBYwcbVBpEa3SgxpSOj+Cmdva3jU0lMK1nH2IC3WjwL
 oK1Wl3T6OupKwYqcEZiJh4pQDH5Vv91V/WGYxE97jidbgXJ0kb8I51bbXHmOk0pPyIfEW3tOCj0
 kB1CP4yc4mKOUloHhRXskd0BSVcKCo2m3sraoOgvKXkQQGiyuLjxQHVDwerCsUgVG1s3A0vL66J
 jy6rnKtvrKOpBzqxqarRHMZ2ePiQeV3607j+ljRB6aX3fjQuEFJsWrb/xTo0HTBK7/7ZaabZhSq
 YxEsnfGopdUg8O0J8wg==
X-Proofpoint-ORIG-GUID: 34IT1bVzxUcaDw-RuJmcKlCge38Ky1wY
X-Proofpoint-GUID: 34IT1bVzxUcaDw-RuJmcKlCge38Ky1wY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150073

On 4/14/26 7:34 PM, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This resolves an issue seen on the Nothing Phone (4a) Pro (Eliza) where
> probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> due to this device having a slightly different PMIC configuration from
> the Eliza MTP.
> 
> This matches the downstream approach of marking all VRMs as optional
> and makes the previous clka_optional handling redundant.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
