Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33A3D34A4
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924798; cv=none; b=fdYyTXw0h6LuMk2MY0mNLM8f9Tuxt6HIq3MV4ZR9LdjF0jE2/GQmCBZGrHjJg+jgydGAg8zakoUPnvxUjA7nvasLZdbeLy0vEb8Z6/iIV3KxNzUgvXIAqUP7Eo6+p/5c17XpThRL7jOUu3cVc4kPpQ9tIlZ9ucqLwOhU8WRjVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924798; c=relaxed/simple;
	bh=rFoWY8Hn4+syulhQfc+C41uDe8A/vvp5RNyi0nSSX8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urB+DceMoGjoWo1ZH3ix8s6DQ0/ozUJCrElwOZ6OwzXgXuMVYlUOvqff/b+SeO6/Vvmy6UspOpLk+vT5cb5HJpHAuq1YTlxfIPin8k/fWhZYEYDxt5v4I/iPIz0FepIOH9LmyFmulqtCcTQVfQdEdOcnPyTPmXMnXw0+Y3r+IRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZK+WR6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxK+8fJp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZK+WR6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxK+8fJp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J741cc1567120
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=; b=FZK+WR6HnZPZ7fzs
	e1xNsifoyw6lM1RN84305p3Nvp/0pkcH/TIplC7EkdWqvCESnsC6mcOWtobTIolg
	HCmlg28r9xGUqX1VGTef1UwSMgfHkGyfeGyFbkQRAyjm33WectTPkij1JyIW7IST
	Hsl1V2iUaCE1xuFcYy1MxL3sKMuTXWL9nAXoW7VdFFaoeGpF2JIkbt0MHDGgDvsO
	yOj0mrs8Z6XrCzGRndFxOhpQ6PAtPj4rG/bDmndhRfjZXIf5CmZkIlLcJHoX1ERS
	Ug24a10dYJ0sA9XTWv0IVuRAAjwTA31cBIxwQX/0xTVGnqYfE/6VJW28+XrDek+a
	Rzt87g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxhckw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:53:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a012f8ab7so8106146d6.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773924795; x=1774529595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=;
        b=kxK+8fJp5SB57P0b3iMTCjjcQo2tPj5CzXAu53v2yex2dAR5Q8qQzE89BeznP05pI9
         0g6GJS5AacNyC4WFRn1Gc8lYqoRrUHAtdYkPqTo4GOGBz/s50r6GkaElwQWtLK6VsZUK
         1WStH7FjRPQNqPz3OvwkovCNoiQJzflc8GlKqVaSNNZpE6R9Y4vcDOcBWXyicwn1BQoe
         CB2u+L+PVlg1c5j+qU3Eu+pFwmjfRl77X3vJACKlKw9dM0heV8nOFKdtXIG3bPamdDLN
         PB6SOWsthYSjSD+iBFYdwqKcTsoAHXiiTkGAwOhC1SvwHxZ912U5QWQh+aZ7lzfSaJro
         qfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924795; x=1774529595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=;
        b=LPXnTZ5pBAjerEy5xGyo/ErJdCst8s7001TTWwmvnlf3JVXdiKarB8cRwlXRg9+TVL
         g1OATVczJBWAOVLnMddmWHP71gmyK0Ky28Cvn0xkBSvVntY/94gU57g5ehxKMhPpq1oK
         zTLP16tSEMndKeeDNVzcOMhNSG+Vw6dqdwpstjEpRZDmMhxiQymCZS0eFF/vwebMwKrv
         Qj16HtdO0Wh6/4DhMlPWNL4IsJllYkQBIVxUDLA9v114oTclQEk2o7g7NdCLsnquB5mb
         DQZ++G/D/r4o4vEZqw7ynnIHNjAhzSvpWK/QYZNUUhH0Sv9/MCqvOl66mZym7tkzwH62
         nrkA==
X-Forwarded-Encrypted: i=1; AJvYcCV4W8KqTfn5BGzXC6LE0KgLzllIem94rJ2koeWsgKTltYx/PcAGXK63uMK3XvrJS/xEWkN+dL4DKaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx53//qZriPHBJUp8p//jjndHncYs43AoPpR7BEsZNiyJ5/vzhi
	WVlWbdZBhyY1a2hQZ4+T5Exvx4sBkgErrOe9USsZ+au8M3kAfdyXj5tmC23kzKpgYfWWhDJf3/5
	QaeAaApb8KMfcAvZAZa2vFL/DOXqHwSol4K3XOnbYhGt5MBBzB7R31cWB7lkifR0=
X-Gm-Gg: ATEYQzwITaEvUgxmJYPm16ipyUtSw+ru/z1a25EOfpnbo9axMvQ5Bp+nI95ISf1NPIn
	So9e3GBxdEi4E9GbU9WcwlHo7gkAoOqN+Cq13n8EbBR8Py/wDfPzxpWfyFNmZNhZ1P6RtDTF6sj
	PqY1TBY7oeY5MLH8SdfhAr2+MOsaWYHUQccD4Z1sk0WQxbf+30ydqSJLsycLhnNFoSbKbUviB9w
	kfvoH6B866h4QEXuO0L+Bsp3RiXx/tHtkZ3Yj5ult7QhgZETrtqbCqCbay5H+s2j/3p+yrS4gR2
	lyTzH7bSxws07xXK7X4dIYQutRpQIWq+6huycSH+WrD8HlCspHb6BBpvG7/aYCmoZ289iCYyIb5
	9JdXsMUIJnYhU3smafjBmfFSzonc2AFgdchHudvXtg9qv3gWKpgLKDrCGwUHwK20Yx4ngsP0n+a
	TseXQ=
X-Received: by 2002:ad4:594c:0:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c6b580401mr82458496d6.5.1773924795440;
        Thu, 19 Mar 2026 05:53:15 -0700 (PDT)
X-Received: by 2002:ad4:594c:0:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c6b580401mr82458146d6.5.1773924794968;
        Thu, 19 Mar 2026 05:53:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f17410aesm434895166b.62.2026.03.19.05.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:53:14 -0700 (PDT)
Message-ID: <d2960180-6d00-4a7a-9302-37b73c5b0892@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:53:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: qcom: videocc: Add video clock controller driver
 for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-4-4696eeda8cfb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-4-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMSBTYWx0ZWRfX6FYjszZ5xaKQ
 MuWYRtFKG+uVxKCxou7DE2pqX3eLZIuT1+v6F8Mcne0n37V/pRw3QN/nWXE+OSD1VOJELbKMROD
 x4hNlYpy/HQafSMab+XJzQjH/0Jw6qQY/U7uF2qVDAfGO1FiG2ZcJ6TK3kxyEnPHTOJgdcpouwd
 eKwburYX93AYQOAJLuEiXB5l7qxpwKre9ima2OiMfLu9s6YU5XClkSOfeWtERQ9KTUec5gYk1PQ
 dJuhbyIvdckf+DDF4O94uchjBNVHBZEFwq1EgBB9Y9irhrP6otV/e8OGqVqmKDZUljtW+q/uidf
 H7zGhcRAWz7uOSEwSxohklLJb3s+w++XByQPo0QmNBpFM/HcAm3x9e0UZIHkK/h1Wt2JNUufLF2
 kPWIIM3SugmF8zs4cD/KMXcaDaOpHgLVIz8kEKzTktQh4E5ittQikDI1Xp1S6Ij/dk7/TVKJqR7
 5BGwqA6TDtUkYOYbtrQ==
X-Proofpoint-GUID: 2-nG_3HU0asPQDk56gvK55-Nc5S0hkWU
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bbf1bc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 2-nG_3HU0asPQDk56gvK55-Nc5S0hkWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190101

On 3/17/26 6:14 PM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
