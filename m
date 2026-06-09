Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7117A413D9C
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007704; cv=none; b=V0rxRuDlDFvYfdUAB0sWA/Yckq5bF0v5zOTMVwTGmf/WsDf9mx5ryFjsxsReUSTcjC/mbw+6S/7y9zFrfDqk/5nNjhh2o21RT+zSySSkd2mPa54QCT2udiG0qicsYsBkszlv3nvQ/+DlPHWnsUXzWBDa3FAb8TIs5RBf37jNHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007704; c=relaxed/simple;
	bh=Al+O4ZpsG/tKercA/jEl/ceexyd5wh9GxKJA5iW2SWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btgMDqL4fZGbDxG2yyqNJCTJYOhi0rauaWasZ3rCL/OS/9zd1TIC7jia8L9BrQvkmkQ/gTsrTOFg5c67oqUkSaKpgjQF6R3B0F4t4eNtb39K79mODGFF1lgUEdbHV8hRcwNp6Wr+pezWJWCfJgx0j2p4uAJMr8opciiApA9cM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXIGF+M7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tsqvi/lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXIGF+M7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tsqvi/lq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnDh22574081
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 12:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=; b=FXIGF+M7jddR6ztP
	Jg1qfzQKf0wnWqNx94rsO50EHvAckOVh/w/0rSpnkRZSfaJwR2SMKJRHMHdQ7IHe
	Duc+ASZjmMe1vtbJDG7gE2N17Or6PBBOw5CDkjOZxAid54sn0hHaMWoeccht3hxE
	58qxG6lTVXLntwb/QFNn9ENm94sueJredZZmO1J26Etl2pFudOc6GAtzeU/WgF4N
	mfgsKffNnyf+xWHnwgUhQGmbq6H4jFYepxghD0PPXmUEmmfMsyWpPZV85emSa7dE
	BGlE+DhxoM8WOE3QYZ6F/2g7TbKvWYR6GgMO+7JpehrEYvhLBDITYnKNvmKl11U5
	/dYqmg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0why-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 12:21:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517bdeceb54so5093681cf.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007702; x=1781612502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=;
        b=Tsqvi/lqVLGFV6rbaLoAjo+gF2GAsllBycL7mSBZZ6Z0P1cvC197C9+af6ST+O+QtO
         cTjLwrADwBT+ARpuM84lPHAvfQPEHr/hmIsY1GGaTLag/NW/3fZnBKsFcafu9WGsKO/f
         GPzk0iexqo7h1BmQp3+nhOmOHXo5sHtfbgT/mfuNHW4v2a9Eu/WFjT9ubEMOW0q2nTaG
         w+krs6Qn7vBqFATGRsS9oWX/4aAHGEO+5woLUCt3lUYnKGEH2tCoMrkda5V0jS1j/BMG
         1SoadxaIT/+8yA15NKvzfh14ikDgpLS0QqSNrP4dLykv3snDVvz6/QKQMOYX12Zb6yNK
         qZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007702; x=1781612502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=;
        b=lfnL4l6jWGHBTgVrhQ6a+zjX+ePqK3v4h/tXngDWwLAzRdFTuGwpMLwLEIQIVwN0di
         EHXv8pxVUXkKIDa6tRZPM3nd2xJXHO2tdj9qKO2lA41iRx+2F4Wl4XEn6jLaJz9GpdD8
         /fLWVcQCZtbFxSJWdGNPeBWcw8QfeACDSzsBVaLOO6/rWHyQ1wBRjA+tK+f6wEGI/N3a
         dcCl0xi5Ijxo6w9yEM9PFyj1Q70T0hmFOPUZ5hy7fRbCdqTNGNjg9EM1qdpY92Ttu0SA
         jpkMjsvVmIiQaS/8JAsIoOLKWPb9dxfnVkG+FrRTTFfYudBhe8mLrXDX6duDrcaYOPEq
         p1Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+sB/gQaYTVEqkne+tgOMPPEFkBMyXnzZ6GDklqL6jEMD7bAgmrlq2janpRyp4xPOda/EhN0w7kBVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvz44AnpIekwGExtuJZ/f55PZmjypwBm2UZsFk4QZfMZquYgTR
	nzJq0ADdNZIh5+e5cKIIJV1zl/oXgRYdgwir543sqfDf98mJrHdSttSyCQvDO/IKMOPO8dpweWa
	lMdfYvYjjSQevdH4GjK2OA5fOy15tMSPYDX8uRC2oQshErPRCptiXdkS51ChF412p3hfIpCc=
X-Gm-Gg: Acq92OE+K5BRlu1h/tpF1TlQnIWVwNuttnxyBrWKPCG3qc0rn/tqOZFg5bKaGGlX01J
	ST8UBbjKvJK4SecmbPouAM04XwuoynO6UTiEq6oK5VrsbxeWORrofJDDoW8O5nMNPRJMf9DUoXi
	YXWn0NZoNtMKCVNltn0uDl9KJ1D5Pz4SvsvJicvk1u5EnbjzM5Iz10XWPHOwOj1PXLMA10zfxS4
	lZJqF2EPfiBN/tbJG5sCPg7wWlYqaxNjEmPFBfggV80ZyCm0f++GdFZcrkfZbwDVLvPob1R85Lu
	48GIgUlsuQeCSMz6cR6FHx/2URXH7DxV1192NIUDNGpnvjVEtK0tqE3TGUKdlY+zt5iNZ1eIAca
	yImSmxDSTJKBRCI0oKoReioPMMv0JvczNsb1Y6VfU7LTmMxsh5moHiBgs
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr264143185a.4.1781007701699;
        Tue, 09 Jun 2026 05:21:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr264139785a.4.1781007701248;
        Tue, 09 Jun 2026 05:21:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e05199sm1006369066b.29.2026.06.09.05.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:21:40 -0700 (PDT)
Message-ID: <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:21:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
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
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gth4S0ditWWyc7Uk7qXCIx_u5vOWvZ2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfXxWt0eWwMtSb1
 bzsCsLaZkO5W8xssfk2NyuOM8ounlf1JmsWuDeP+8m6EomrKJfW/tMfWOxwSzwSpzq2UN7SBMfi
 jMe2mzGnRg7x1nz/K8o5P6nkItOOE3ER74Ft1n9Pz1sgXUo5Oog2c4iWczqwweUTw25gEEAChjK
 Fpgl1IuEmlOHTP/NZMhehgCkyRo3LWO0gANviDjjHqzo/srnoHwSjWa4ieDiTXBYvjt9lIOMWZd
 SZGQEWXqYGev+iILhFJ6/XMZnLyBfSBMDQAvQFPEhW4fPgaTsmHMIeh8B/chE4Tm31dxab/lMIC
 mEAqmMHq0H3qZBfdnjWCLUR5QbWYyCVgXo4W62/hrzEnX0pUJZ6a3dXuf8kit1FDT3Q/dcij451
 Z2ygGTVx4AFYrcVSEyFIJOrZIoO8XXKR4m4GlHCsHiNAMsmr/ERj4dkFDr0OiaS43KUcqxpriY8
 Sf06mYrFtGQxdrSt8RA==
X-Proofpoint-GUID: gth4S0ditWWyc7Uk7qXCIx_u5vOWvZ2W
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a280556 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wxLWbCv9AAAA:8 a=RM3L-PboR186kqoymW8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090116

On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---


> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>  			reg = <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names = "core", "iface";
> +			clocks = <&gcc USB_HS1_H_CLK>,
> +				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> +				 <&gcc USB_HS1_XCVR_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "fs";

The bindings change you sent changes the expectations - "core" used
to be the first clock. And I would guesstimate that the
DAYTONA_FABRIC clock is not really "core" - does downstream do any
ratesetting on the other two?

Konrad
