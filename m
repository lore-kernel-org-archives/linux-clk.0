Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236953;
	b=SD3YGFtACnc+8Ub5HB9x7q5xKWoi8fTefuSU37JM/C04jtFqvlZG88JTATG3hslM0Eaz
	 Hpu3mTjrKqL2qNHIHEFTFBfy1HBx72sjQovzAVsgqOjhlLKKPfpyyZZzieXF85QcQG3q4
	 oCYoD5u9MhqXA7JRVwXSgTIbGiv2ohoPgRTNyECfDHcr/RaDnjkkEFs5NWzkmaWnUSCBY
	 Sx5p3LVpO3MKX/NLVQujMvTW49+DXPvaMSgzlSF/7G3LrP2TSsiWtsGqO3pR2DFpbM7wZ
	 N0xXJflOXvFOkgL5VQ4D3BPxuaaLBCQF1KtiUHqVYkA9Dc2QZZgL9tSks+BcmRvglkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
	b=TftRIEj9ynw/1kfe6bXngvii+I0zTUgYVexTAhbnWCJfJ+/kYefkR5A1xwZRyktdwlCz
	 OXNdp7kFO//0UwjWoYpz46X+3m7CUj41lVLQCEMCoJdN7ciUZxyc7DLCIwDBvjtYBXqDj
	 bLYAyRj0xez/b/9zHo7+hIc8MSMYz0I+eC6uCiNJOcLZcAiTv+e7FSNELHbxQ+vJR2fHa
	 b1kz3yHOALuQtwmVT6V/z9MOEveGaqJVoYTfmX+PuBfoZiDrG+3uEQVIAUdwIUSv1HaKQ
	 tO4WWVrkkUxSiQNm0mQhMJxmmpIN/dyglljM20PvkQpQLWItw9PjWuBz6sGryz9Dbdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJpS75Tc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clWp1fF+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F479606EE87
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 15:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F479606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJpS75Tc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clWp1fF+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFB5D359256
	for <linux-clk@vger.kernel.org>; Mon, 9 Nov 2026 15:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=; b=FJpS75TcbFrT2OXs
	WOQoCz4KVYH4VtPyWb3XgVtnnZYhuH/xQyvuynyDgW8DRbEydPCIrrU3PeYCGqyQ
	DxZND5wwIWScDrn7IuLdpY5+F8SW9xsjrMq7bBJNhKkuWzmhtFusqx3FuwSZCj3m
	iAqm/lPA1m8zsIZb1llxHAJdqafx5MNhenBoeuupWzA65/tTJLfuF4JtU3/LTv6k
	22p8k8NTBFjNh8nIYlhXwO92H0kqaKoERw4FwJ8pqTVxgt+FyrUfVcEOfpduGX3s
	BY2F346kz78huXeLEPmo8hSek5dueqtxxkrxnXe8FnDeusm2bifiMOUZD4XFvykX
	5BJJtQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2j75a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 15:09:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecbb3b4696so27142e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236951; x=1794841751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
        b=clWp1fF+ZhrbDzREMjnU17D2ftR5MNABk/FSmdeNvgMWdwjEvt5VR1k3WVBiB5m9Bd
         AFVRfCvbmoEQXwASMfI07fp8SdHYwOjYKMQOfttSkGf/YXQ9rBw6dAjy/cii7JMwnzaM
         QPxc7p5mCIvDiFaGvNmZQR6HwOciV2zikHT4SX/nVzcF85zlJcZgJo/K9Lymwc1vzgX0
         k1/tbL9NJlCAPLXELYEr8dtLoY3LdcQ0AL1GdMKl4bmh0as419PufnhE7LkE5akngFRs
         MZ6r7Eir9bGX9sijbOc/venRp7kpaDlH3LRag4vK17vNGfSXhyt2TnkH8Pl9PUXejpBW
         RcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236951; x=1794841751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
        b=sa3qk4Qd2Qh6PJr/AFaTJXIfhNMI8zVjz9aq8K8x4XEVDkQd2g7RWtUFBfg54rXLva
         xK0Fc4eyBSPM0sh2N5A01MYMhbxcqsiOCKduPQelViy0Z6bj+rPeoGO5C1HsctHqKiBe
         qkuA6iuLsL9WtYhLCi6+IVk55AYjv4Ai6LHTxzwHqxv7tpjefGEgChTlWyIUufWjHk52
         +HFivorkIWXnmGKfRSjIPzXJcHGX8o5RiHx2vCqESJcbYFC+TTVqfDFjz1U+0ciK7SXQ
         gpksbN6STWbtJzLRbIOCyJaEfp4G7sRzEgRv4l4SahFMu6nL0/DItsSJ39+bSQ8HWW64
         7Gmw==
X-Forwarded-Encrypted: i=1; AL+hErF86RAwg5gXKiAmlJ/R16vtqgGaiox3KKy5oFZxqEGKt4YkZpr/R5swBQAodYB8iy8+oNpNUi29Jxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z/r82ZKsPSSnjiIWCAch8Dfqt+EvlhL6wryLj5GjJNM9Aq+VG
	M1Ksuqeqa3td3wRhm/68AVZ2Wu/+4+ubf3o07e/Ijs4LQYlTpY+DRuA9lKiuD37anHxcnzyyJOc
	M+sZ1YuIAv3nG9UTsnThnTmrUc10I0wlrFpIbut7s6ybIuaAkaB2MRxu8lrP2vrQ=
X-Gm-Gg: AYBFou0FGN5k6xAqvSU/SVdddH6QamrJGMv9ht1nPqWyAVtBvpsR3INdIKm0XM9eC3S
	QqVJVbIAJ6LOVlBBB3lCUQnFfFobH2sFJ/fjy/i2bJulZbowJaQJDpzHg9Kd73knDpR1ZiAcrIp
	DrFaPcvoCQvm2NECRLq+Ffgx3K7odvnH0rbWIa6vxEPNhBafOMueoZNahcE3EMBaDJ6ubk+mn/A
	7kGrX1kixsH6QuUBItfyp8mOLcq0r4hmqWiAcADy30W8lcr8+zyFqK7a4dY0MS7xAoha+8CLSSW
	7XLpWHjf9NAlKQjOg3+/6JfQkoOrbYJrbwCH1nIeyf2f/7wMEXw6lqumJDJYYXpw6TzSdZ0KNDZ
	cmiAD+PwO5SIi8ct89EcdAHuMrB28BCR3IjPmCKAJAaBN4WxCDkCrl3JlzBJf0fB13waJCA==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr1087421e0c.1.1794236950734;
        Mon, 09 Nov 2026 07:09:10 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr1087380e0c.1.1794236950143;
        Mon, 09 Nov 2026 07:09:10 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e5esm185561166b.33.2026.11.09.07.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:09:09 -0800 (PST)
Message-ID: <f84e83fe-2a81-4efa-b5cf-c458531e3677@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:09:07 +0100
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
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-alpha-pll: Add Lucid 5LPE PLL type
To: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-3-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107173621.3538964-3-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1e217 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=amEjgA4fUcSruvVDRsIA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX5TvMCD++kqsO
 83POX7i4JsRxZrdQr7jFu8SIdKdX+ru3M2Qw8PWGHIt6OcLqH9uga1MDeYeUKBAQdD1O9XWNG1L
 qOiq9WKddg4ILshJLjK7cVixeXA1IPJyhbmpf5u4sm5cvwHYUhcryAJehOrcXz+Le9CGZHLyj0e
 +IsS776PiCG2eXW1PKkq4ZQpKyPAA64DGoPQM+dNoIzV333TuUY8VArP3lQygwV+m3BcfI4YRfn
 bvkMh1LETuwfPwSrojNGuX8M1DhyUJU4qIHqMnLknc7Sa1RpsV1uG76Oiulk/r4bTgPnOIaCaZW
 3sgW8tdJ+YzHfwT1cVwxaLi59bBxsHDJLVJmgLpPGo/ahy20umcR0Ov0t08UuFf+5j7Emo+T0cE
 1u8hIYi+BQbagJk9WCg5cjr6RRu/92hvjUksO81FgxWRfwc7IT0iLcvGNCNPfSpZjnSEBd6Sq5x
 WJjeQXeZGKaAQ97QBOw==
X-Proofpoint-GUID: 3eCrArq4kjy3jj_DB85CYdKsKm7dYIYL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX+/lX3MQ7q6QC
 hf4EhTFZbMjzf23/WzbYPviH630WGJT99SBi65+UbucPGcRPMl5vqRtW+3M3/XZcalSZOk600wI
 0D3IZjEJuM7lZoivoprsRnv8bYeu4ss=
X-Proofpoint-ORIG-GUID: 3eCrArq4kjy3jj_DB85CYdKsKm7dYIYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On 11/7/26 6:36 PM, Vladimir Zapolskiy wrote:
> Lucid 5LPE PLLs have the same register layout as Trion and Lucid PLLs,
> but the bitfields are not identical, for instance PLL_UPDATE_BYPASS bit
> is not present, and the PLL configuration should be done by calling its
> own separate clk_lucid_5lpe_pll_configure() function.

Oh.. very interesting.. seems like these are used on SM8350 and
SC8280XP across the board, including in GCC.. funny how that
never surfaced for N years

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
