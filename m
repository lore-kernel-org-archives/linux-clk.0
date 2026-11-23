Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439188;
	b=W5jF4yxKc8FeuWKdTH/zDa2Yo2snNwJ8w322tK388zbc5MXnOfregcdmWsO78jsLzznA
	 NHS/isA35iaxBI6Pm17d2P1cqQkxT2HMuoYYsHC5xgg3ZV9M6FwbHIe7huDuvTuwMy1jy
	 kUTqTlLdTBAqz/UXWwRRA2penzB5c+WAqihRbU9JKxqXpAh52uO8Zj7MKJHSsPWf34vWj
	 hRw6OYLU+BTDJ5ZNJOXpqQnF7etrio5Ze0GrcacPKOGcw42JneoAMicF5FtCTlbU+X+BS
	 VW5hc1Y+zlGUr3fZxtWns0s4KFDsjui3Q/tREfIkhmcnbyeRv02DcobHKmtchJ1XkUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
	b=ZPi5Be0VJefg2rLsFOZAgJoYRxoImp9hHxrB3kQrWJsnBKC/loW5LWXEfDyNgXK0K3Ju
	 QxP4bBw2x8O4m5JdVkokVPPzbot2Ij1n/3n5dQ5vF3Ih/ZwsKuDp71qXHk22wWaDmMfok
	 JzgAhPgbZtD9oju/Vm1h7pdv3RBwgnMOD+jjBcCPBwUGQscl9OLflFIwinB3aUTRrt2Bk
	 iqym1rCvh0JZ2p+jvLnh7dVtd5nemnBV//cON5UOk3yFlkMq8ru15kh4iEOhZmPM/iTWS
	 vlPiAyh4k8ydINnA1ga07f5BldxnXE0HSKelMbRDZGyK574PINENDFZ0eYP0vCCwV/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEIydQaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6XzR0nP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647BB606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEIydQaC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6XzR0nP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCG0Nl3186097
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CYvomfEjy39LuVTvYKKSBWmO
	SbB1CxQU1hTSsCOWzQI=; b=mEIydQaCn0XOeUq26SvZH5rXZXsBnUtA86crINI3
	snB9cfnqZz4RfgGxGYq4Poscsyax+YyNHO5xdFGxn32s6EuXjwXX3Pd4298x9SRe
	ZvYiubIY4v+ozxCjCri5iJXj855ctOQJiNsspG+Z7Ir+U7ZeP6fn3c8oDaE2Zkp0
	rTDLlVzIFjHnEXtrKIj2E7200CXRM75WKB0cUaDl77xGecAysds7yOJfybEdl5P0
	X/p86r1LgtOjOVowX5l+S3VEUnI5FiedS9sKi+ScUyl92/bEsyORYUzzavHjkWL+
	UnhZD+SzRSRiLTP3VOmpXO0wY3svAF6k6U8u3c9283T+Bg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd1g01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:06:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso4654802eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 05:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795439186; x=1796043986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
        b=I6XzR0nP8Wvn+QBoOYKjqtSj1mbkb1jTdnF+/ukuIz5rCVQxKGSaFN4lJOANWAYR3/
         eRU8qfozUtc6UeY3oNwEni2VOdLz18b0RQX4B9bhBMq0O07qJLZyQIqy9qg1PS8G0HiB
         +fHfXTHlmsRsCixXTeH2D99nRfEVhTop210guW2Z+6plUmJHZ/NwEMXohRa7stUjMThC
         hrYOaa+49s2mQEQR39F+rPlh1bw1/E0rlZBjpQg7c5GXk8GFO6b21/uyIEJLQMQXNQ2I
         Qw+D9w3NbqDN/toztQwhmpaZCJwocY3u9hqRyWG79q/fcnxd/PylfcOKttCpThjCA/5z
         cGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439186; x=1796043986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
        b=ViS5zvC2Fu8VPWerGfVh+jwktru/Jnprfb0matL1bQ9wD8U5ur0fYS6IgnoDjqcNTz
         MiwS3UiEGWRR5icMzP72ErJTEMEAR5fI9tbjcRRa/VOkDvNpa4MWllbOlFkC7pmeFYh4
         ii9AK83KvONnjXejAXc/17gHVh/FIfHvn3qbtj03/97ICGYCv17nikPCUZY5a4Gqheli
         yVMs1l7e4yXQIZTmwQTat87j061zFMZelwplVoti38dxQiQ6XqajnEOsHyporTM8dOBK
         DJzDYREWaOHHSzSX9amZv0VuPNOrBFbajgt+zIaOrkhQ9z5Bg1pEiPvTwyXhsTFqAWzf
         bezA==
X-Forwarded-Encrypted: i=1; AL+hErGwrOu2prd5TtC4ddzCA5T8HYerJ5vs/KQmkTzq+vNmn6JqJe1dURkFIhsLDUvLCaxN8lcLlyi/1ws=@vger.kernel.org
X-Gm-Message-State: APuU4Z+43kxMwOI2aU5F98h/dnaLf1j+UVeeM/c4rRU2CGsRid/ncOu5
	lwJqt1Ti8rtOPZAF3hYy2BYyy6lULlrJQOb+FADg2uX4/Tf0x8/dxmV/k9wSt2Va0dOBc93v6X9
	J60tD5UB9Xs3p+GWT24INz6bzka63rgm/Q1EeIHBfdmIRVEwnEwx0+v6hY+7PeEc=
X-Gm-Gg: AZFdTZee8kktVT+qDi6UKjFcm3P1rFEg9QywtacAuxvqBtqoVNp+MBwzNIO+CzpbcSd
	pVBNCSz1iL66vXdGTGylCRSQVBRceUT5Ws0hgVqCleqNPVKVkV3n4Je5tRS/3TUQ0ujktZNBG83
	u1d0E0swKfnSSn3i6NmsCdDBuoi9hvDmMTSAREEq82TEVDgQaOLuEEIdGxnCBPy9Wok1XJ0ey8f
	hrPd1vgo7amTu/KIyU4NYgmlvrN5s8yA74gxuZKNlorrsacqCyVM0agSrNME/Ji7T1XYjCxXFWd
	4w4HYK3BltHWg6SY7aKsHjXfnK2SNYZpgYE1Va+V6S9fqw/OJRoHWpqr1mLcenONywJx8cD1uaE
	h4p0/qLpOFulS2YFAIeWY9vn8vsSxhYMnUdbqRa5ULTX+K+pN/OhUDLj2nBopu/Uk1oYA8E5d6B
	EevBIIrp71y4yOmgo=
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr11689011eec.41.1795439185776;
        Mon, 23 Nov 2026 05:06:25 -0800 (PST)
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr11688972eec.41.1795439185184;
        Mon, 23 Nov 2026 05:06:25 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm37649809eec.12.2026.11.23.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:06:24 -0800 (PST)
Date: Mon, 23 Nov 2026 21:06:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: socinfo: Drop DT bindings with IDs
Message-ID: <awQ6SS1GVPz-QUYb@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: i7GGM14f22ULs3IQBJp0PuliBwNFLu1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfX9347H1U58EbL
 fwDnQSk/iCWph4GXCy5RfxdLNMomOeb72ldiU+NB5fpuZg4ITqx1cWyy6Oz5eQws0/P0GJ78p9v
 LVwZDZ9rkHPFPDXXyPRKkeztnpoWPHv1qILcPi2X0rGVOoNSZZBrqItFkZDBmmCRpWHuzaiparP
 ZABtmAjD+c4xkRQpLule8+CgpIoPG+eZVstEXsoTQQvgFSR7/cLpsJNElFotox+eSLxvuEXRZrV
 sq/SDMevbhhHQOkN9vbs0MO7ZxsjoIPh0S5CyoJH1/9krOkiMPIJIluxb3SM4j4nNqMCFcicsvr
 KDe7lA3BJzpIqhycVavr4oxdm9MNZQ+48e7P12ci5s+f7sHpNRVUOrYFE2Qu+qol9sQIAFPJMjL
 J30T1pjH977ohJ1ujzuTniDx1iNQosWDOahddYYndQ9oKRZ1bsmLbZlnINvn4vYh3cVka0vkKnW
 MPadrs/cau8htVQHQmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfX1HoG6pRCtYvL
 8w5bzOhos2slp2uUztr3MIlbbjw0tMareak95tod5+Y2GU6R/FmDOO+OJ+XD5GwFnPjRJ6NZAtZ
 q65sPG61uyG+atW3TNp+hHBqBJoS8xc=
X-Proofpoint-GUID: i7GGM14f22ULs3IQBJp0PuliBwNFLu1N
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b043a52 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xlrlT0MJ9oWSHFZ2GFAA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230052

On Sun, Nov 22, 2026 at 06:46:19PM +0100, Krzysztof Kozlowski wrote:
> It turns out that people add SoC IDs as Devicetree bindings, thus ABI,
> and then want to change them, for example because whatever
> renaming/marketing happened.  Well, that makes little sense - either
> this is ABI and cannot be changed, or is not an ABI and can be changed.

I like this cleanup. Keeping ABI as necessary as possible makes sense to
me.

Shawn

> 
> https://lore.kernel.org/all/9eda2209-d64a-4a1c-915d-4415ac47df45@kernel.org/
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (2):
>       soc: qcom: socinfo: Copy new SoC IDs from bindings
>       dt-bindings: qcom: qcom,ids: Remove unneeded ID constants
> 
>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>  include/dt-bindings/arm/qcom,ids.h   | 93 +----------------------------------
>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 97 insertions(+), 93 deletions(-)
> ---
> base-commit: 74ceacafec02465d922ad68dce9498c8f50e5f5d
> change-id: 20261122-qcom-socinfo-id-dt-bindings-e6fe815b4480
> 
> Best regards,
> --  
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 
