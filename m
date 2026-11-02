Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632122;
	b=kxCgLKq3RjUl1EkXCLIyG+D12kceB2Iqg2xa1GMhwx3kc9ElYpT3xAYGSrGeOjAKHBjn
	 GI1zVSefBopv6GLouT/NDV3KL4ALe/CWFlkVG+JIV1V7roXXTwJjQP8xPZfiZwESjD9v3
	 nGCyMoVofOV3YBN9ISmq9fP00f/iHChVoON/IY73Bjy3SPFR+GxP9xp0SRInM1CiqLqy0
	 LbZEXhee5pV+bqez77qCW9FcrijcpxI7fe9W3fYTjgtO0FqU4oMgkCe3rS8pXYjJGZ8Nw
	 HiZWkH7EzKd7PY9rJvluWgnaJBpDUy7zf/SS4H+CY7o/VR4SJYw79GroYW9z2gVw42A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
	b=ILSffHbjKc/hv24NgHAVmR8QnKe6HRAHWR8NZ1GtKVda6xkA3ZxsjjYHY1noul2ZvN1B
	 v4dYPsB21xBcfXedZoBGDpo48wKn8XNeEJkdUcCl1Peqzn3VmFsUjj7XH63FJQNIdXdFZ
	 NqBZydDBlVqCdngxaoapNrNbX6QhNPdZurkvP1zTCGwLeJnISOmvLwySg1oBwgyREw8T+
	 CFROojIKI+XBUnw4oYjMy3XPTqWJuh2mNOGn+g3VyuWgeECT+wlj77DmhYEjWH4cZrkhe
	 1uTFCy2rJJrBnxRprLWJKi/7CSc4zmrhOZ7s4YVLGVvi0SWIZCYReUbYG7Ov1x9wJaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edyVx3Rl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X22ALmRm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10688606B1E3
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 15:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10688606B1E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edyVx3Rl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X22ALmRm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpQ6C3102713
	for <linux-clk@vger.kernel.org>; Mon, 2 Nov 2026 15:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=; b=edyVx3Rl/Gix/vp8
	fVxiwC8I5X3BwPxqEiE5qvO+NETSFY+0Ml2dTzswfYhKFjNYhxNmH1C/I8azYcy1
	ffEcu+eW6YjBGz1rC8vRPiXo1BHAcXRiS4I6dmjN52QwzAfpp4gnmGYQhY4f7RoQ
	2NEh6Oo7mzMD7aLUcT1gZr97osp7UsI7quWnE+frI62Z6cmG2Izv3/AMWWe6MgIN
	wnhZoykblMkEnP/rZKodILXFBezTdof0LkQ8JpMc9PGN9N78Cy/qBaNMOCGUaFkR
	5BxulQQmJL9p8OtiEbsirLW48LUyFc/vh02J0GJ98Kup6qkvlJfSvdbz9FMQLw9B
	tcYVag==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjdtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 15:08:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso101820e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 07:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632119; x=1794236919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
        b=X22ALmRmrQr/oD55jXdHNh0Az2uG+9BA4LWAkZe5KMi6g4ZK+ZE+KiMHDOAqsVuaIr
         8//EE69oar9gO0Zw4uZol777w7EwPXh+hhlwM+UPN09AvuKNtsEZ9Ddnj9b2Lz9kx6Zt
         JbeQYIB+8wS3I7IRyIl1EesbgdUKOxw5ApcbLFPkO7I0T0fIWVrapV4TIHExiaqD8a8L
         AU9r1UhUlEgK6eJAooHYk0zAOCVqX+aXreLaaTSqPFPnnOfTJZulgzbd4HTe4WmI866e
         PoKszrqRaIe9g9tekEFzlsk9JnXlmS30ou/qpDI54YE/dD59GaQKlcFxUEXOHFKjlCi6
         osbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632119; x=1794236919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
        b=lXP0vEzr139MuW/PqvZw2Qgtrw5bbIHts2R8u/kkBXUDnwrjhlb4JaEe8+QnqDl0O1
         peTNGp0HO2j8oxmX+rgUthVpR5c8nQQWzf8EWy/WuRn8HaIxlnyc0hvQPT3y4xekW1s7
         QPIU7h/zQNRrpttqiPn3YpReA0DS+N0wNDx9e6S0B3+8jZfiN9gvSmYA2jKgi0vtneOG
         U7AeOOAb1RE3Q7fvkUFRItGXrnst3Kmvr1BmbyOwe4j1rDg+fx31dKPykSo33rbR8nma
         WUgpHF8IYvLi9h5HnfCXBeVQtIVPXlDZV/O2ihpZewrPg3CyAFP7bpEhU5XLBHsiu+FE
         mjZA==
X-Forwarded-Encrypted: i=1; AKwUvBzDBBR99xGgHayj+Gc4DglE6QELZzI3SLFz/e2I0/BKZLB4cz43I1ic7IEq8mMxuT9oKQAGhCkYe9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5vf6ysvch57IlvY4x8ZGYin+ffnVd+dtrxP1fAVwMyIYWK4YL
	At1pbwogKgHRaCwUZE5Aox/VZhCss+VwoxwqcDRZwd1QfrlKYOylykIRH1QJKQjkc7VOFvGPWbD
	mYaOd4mZUUqw/9XmsLu2U92Umc9LkDp9ablCGwVwFPWdEBEQ9MCdYlQU6rtEyqEw=
X-Gm-Gg: AYBFou0u+fCGP3mXp2DGuDM7pPJiVNNlyTECzkY76AiCjSi99ipPbW00afkRE2X80Cl
	ipLNrt6POUys40bOGnW0DB9hHlR4bewjuHiWxdCT9e3u5PLnApZpt/6D8mOsdkeD7Gc5SZMI5al
	Sb0yUAlioa5L1vJoaoH5vJPjm1mtaP9wTJZPDd7c2CA7mL9KFa070STxWKKmQwp8XGlzQ6BBzpj
	5csPfwE6FCcV5COrdrAOz3xcAz9oKNwA/JrEfhc9JHFPA8h3bFW2L1SmHSf7jFBZREEvvUhfbcc
	TYR/n1bc9SeoVaxmAQGFgXHUCok83BWjf79A1+QQYL2Eh1QUZppy2uVWutSV2RqkE4FQQTpK4FA
	6ytI5uv85IdjkbYIyLeVeL0QWDMsSJNU85Hdbmz/cF88LFZyl64vfS0TPO+6sudblJlHuUQ==
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr4127832137.3.1793632119258;
        Mon, 02 Nov 2026 07:08:39 -0800 (PST)
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr4127770137.3.1793632118576;
        Mon, 02 Nov 2026 07:08:38 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b52f3c2934sm444634a12.33.2026.11.02.07.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:08:37 -0800 (PST)
Message-ID: <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:08:33 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
 <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HU-VD3ayWs-u7C_b1e0jUe-ZoqWQimI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXxrQgAonFRcGP
 /2E1/y63o6Pm/DmJS7VM5vSCTNqK0zPfu5O872wS4o/t3jt2w4aktiilak9nYz6AGaebQjZUIaF
 DuHIis9xC1KwXqob+oeGcDdIEODl0Z64eWbHRaMtXxAQkXTI+7Gb5H/qizW8GWw93nEhvV1XvhS
 MZV2Jgc+AEjoGQUEA9OgaOev9TVBDSTIogpAdGjLurK19VAdnFnFb5EXobT/xCsZ37y+kYrQE49
 bLu3nPY0bl+wNf0flGq6i2vjGrqAuQ6DJJRJAlKSrSASN6wxYAOIWLFfVHpkm5tTzMc25ceJJp4
 XMeUoU+y92ItOlpXRUCsEPW63coybxK93KmIzxZVNCshEGm2v3RLh9FJKrd2nitu4fRPplgRzfy
 ww/MBiaA/1KpVTp/i3y86jF5F9yLLkGR5pUGRiuNJg63CinrpDNzIgK9OX5g69i+e9lm/bVWu26
 tfo3pOh9dhMafw61YqQ==
X-Proofpoint-GUID: HU-VD3ayWs-u7C_b1e0jUe-ZoqWQimI9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXwT4C9NuaSSQr
 zrbYTkyTHiSCyNoSp6ghT13KAg78cxVpdWPR8AMzm4XQJRW4wB+RMOPz8Bm5Kaiv7LyCrZnq26f
 3hL/Ux7OPOYmCT5lq5tsn2lQ4f85sdA=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8a778 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fjKjonZ3CYBpfGIA-1YA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On 10/29/26 11:57 AM, Taniya Das wrote:
> 
> 
> On 10/28/2026 12:17 AM, Krzysztof Kozlowski wrote:
>> On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
>>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>>> clock divider. The hardware generates a fractional output frequency
>>> from a fixed input clock (typically TCXO4) using the relation
>>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>>> register. The clock output is routed over a gpio controlled pin.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---

[...]

>>> +  assigned-clocks:
>>> +    maxItems: 1
>>> +    description: Parent clock phandle used to set the input frequency.
>>> +
>>> +  assigned-clock-rates:
>>> +    maxItems: 1
>>> +    description: |
>>> +      Rate for the parent clock in Hz.
>>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
>>
>> Neither assigned-clocks nor assigned-clock-rates should be needed.
>> Parent clock is outside of scope of this binding.
>>
> 
> Sure I will remove, but the parent clock input is a requirement of the
> Hardware and the output of this module entirely depends on the above
> ranges of frequencies mentioned and that is the reason to keep the rates
> specifically. I will capture it in the description and hope that should
> be fine.

So this is essentially xo, xo/2, xo/3, xo/4. The gcc_pdm_xo4_div_clk_src
you added is defined as a 4-wide divider - do we need to limit that
divider's range, or would div=0b1111=xo/15 also work?

Konrad
