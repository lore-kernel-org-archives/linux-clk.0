Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA147F78B
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277902; cv=none; b=mgioB3jiH454LkskaXNW228Z5jHVYwbO4WNZ+M3tg/E2QxIu7COnIfFrgTMdFeJBKx88GjFZXmi6ztCS2Ah8xSljo5fiJx0lSfmV5SJfVdHwKEtzq60vzA+eA3YIlUHgmUOv/LkSUO05SXsMX8vMUndnIJ9kjntL9HhSk6kY7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277902; c=relaxed/simple;
	bh=09he5egQgLt2FlGKJ+y9h7K5tiRzxN1RtLaZYsMsDzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bbod0LSRqVllFe7GvhnZClsrK9kjDckIqkMlvC26T6pimqPMU0QrY/HhO+nOPi9wygKLKGnvUYlxWqGQ4V6A6RcuzQk1qdWQ0cl0Zz8CnAphN1tTXYlHodXUnTKJlRkMa1NU8lR18SzDHBHRND3hJgOQ8t4I0urp/hKQ3PCN+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBsCKrdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THIAqL4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBsCKrdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THIAqL4e"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8Z8j2270334
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 15:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=; b=IBsCKrdyIOT2jJh5
	uttyGrbXTRm0UCmq8i9eD1TKAU1WOeAsHrZscqk5dOqB3fXxquXSeTdKTwKnpo+c
	ICEEqQ5yzwMm4ab3upzVwNDLVLFBcZKO3TnCcDx4KmXpHaJpfBhOU7B14Okwktcr
	JvhD/g17TzXNO+2yj1hMttje604egG4iDsQPC5wnUTOL86oZdnTdpV9RGMxEPou5
	8PTTN2czqg8JbbyW5MnlryTm/FEsCFTARNjvzfEzlTbnBoWz2hHcWd8+J1N7IP8T
	OAgNMbDX/QMvYo6UCWe+6gg6QnpKL6Q8YQMXJh0WEZbL06dhQZ8lcr9j50PmL7dU
	jhzj1Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx45he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 15:51:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7824ec38da4so5142137.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277899; x=1788882699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=THIAqL4eFv+ZgSIXoppF/WEkA9RdTJtMeYkxnBIiV48whQ6qVXnOhaInOG2pZC0kZ9
         l9EurRaq1qAvBUViAnz3IiKM4jD/fmuFDXhuN3AAaoLdRTTOs4F6Nsv4DYQ9uQ22N+Tx
         pnPIf2flv/AYzEEFAwDSmjpwKOMpatS+7/8b2fkuFKAPwjSWKC9s7pMUISsvkomcIzQw
         AVPD/c9N6HRdpGcFYiQJjSmeMCAKqMWtSCBGEQp8/ZxJowZGsbUPgLcqWIUdpZqX2Q6C
         ZjDPo9w6Vi5GfiCZzKnbkhmXo5yemnv1nMnuEpN7FPBeTxsDyfknXrHF5e9F2gNMtSFR
         5WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277899; x=1788882699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=gY8IouoLG9JS27ECQp+zrpk7MJDOWLGI0dOpzZ7fLk6EnbkaQG1fQLkK7YzV7zhk1w
         LXZ48eF2Gv3ep4Pv/OKz65eyjl8bxuAVawjs9/5rWV3B5UpUZqcd3S9sNebMIv8cOQIK
         m6/SVgUNGVbsnQcdv20jdkRLn7J8ka8NEHMdxjFvZuUu7hLjz/5TlgJCsK2QLA4LMyur
         iNKID13VRcyXqbGG/YZ8+h4+c6El8sPcvqeUE531+1HdcbNjuLfv/rJ121x+Bl1AgOvR
         7NakJ3GNM24Vzg4Q8NXjrT8vSDUpeJ2j3SqKAKPlZjE9DXXnr9InyJvJpwJYUnLhsdk9
         +0ZA==
X-Forwarded-Encrypted: i=1; AHgh+RreiEZiBAYIfbNqP7gkZs9owrJm4CFCBLYD7GPOcXT8H8YdcO1IrpAUs/azPaKH8Nhyowa0C9RmPU8=@vger.kernel.org
X-Gm-Message-State: AFuF++m/bOGpuMUhKGGuuJp2cp0gaHOwzKIQ9sxJR01Hsgw2Pz8u3imE
	67Qe7LL0GEdBozWZWLJ2r81R4pUR0E8H1KSYGpCYicKrQR5dDuY9U2MzoNGfyrE9P01YPkZvPLw
	DIv1nTR8K+U17oOXNO/PeGGMuvY6/sUeEAui669wPTmvEbwprw7eNb8d21v56Eco=
X-Gm-Gg: AR+sD12C4gloiu0VbWQSa7KGMLmncPETIkhaP3HbrLMXQ4TgNbJD7KH3m9w1Vh+K54a
	llDsSeSykKawVH+Gy76NQ9UXmLU1f1LXvMfKTQPWxFmJufKZCyoiQeVh/a3aF5Spsd1JC9LNECL
	C+oBaIXHUW2Eea9Gp6CUK5C0xjOLFZ+NtZTE3+CWnwFvXxQaZ46bQH29sZIyIQw2l2vU9yNZjpv
	qVfDxzX/7WHCO3fg/2qZGI+Xwnk//iLjeAzqilSmFLBI9zaNZWtgkW51zgFFQvqVfzgyH8eYPVv
	No6WYelNfA2ghSgtKks4zkPQZ5CiPhEdYniRZazqDiHhvob3fWThy8CB8dIM7ttZ0wriplUVOwf
	zEzaNVAdMNybwBW7b2vgRew==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4728010137.0.1788277898953;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4727991137.0.1788277898479;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm630555566b.37.2026.09.01.08.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:51:37 -0700 (PDT)
Message-ID: <e7fd5417-19f9-4bbd-ad65-48230fb81c05@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96f48c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX+ZYhFmhHTUvS
 orXbarpIXlgUE2CXgKeen4EuggExNleMdIE8G5TGF9b2LtF6osvHDYpw5Nw1aSmrM2yjyhMCFNy
 +iKX1slfX3pKUPsezoYG0x8dyfLlkYg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXxzs8LLyqKCFB
 DB7Z+oPZnNZ2VWCSRD7KF3EQxgmhPVYDNMSPWoS07VXZ9CRE8thcgn7/6I6JINnjjIzJOlBs3BA
 YN69mmRHhd2NfCKdMisaBR9jn0jxEulrblrfN2x9ch69yGbjyRJrVRDjucCtVuAZwYDISC2j3wG
 3roh0cWo+7A0CSA7h+VMJv7LZVh+yJuN5h8LwUe0cdjIJ86PKYqE9mE6eY4PkcVURVjG72djgEJ
 6xfl02twNaS2edIknfNe60hO+xjaDQ/CFl/+p7vrGswN2bU6f+Wg5XxJTwsADzV31N45tYdF3/i
 uacONqcdA7CZbwohzkCqJCq4eBCce88EQ31VSG8ax0PjwBbuxrnAgK7voOMpY5Y4LzAnenmVDOD
 X9vnq2jDcmCvaKntKXp6Sfy35BxqMqY+M73K4A4mjTM7h3sY5ET7jGE6+3S+uEqxXU7ASAOosS6
 3PPVHpF+Ahcly3LIsrw==
X-Proofpoint-GUID: oM0yGBWubp10B4RqzUdHTfoDtUp73dND
X-Proofpoint-ORIG-GUID: oM0yGBWubp10B4RqzUdHTfoDtUp73dND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
