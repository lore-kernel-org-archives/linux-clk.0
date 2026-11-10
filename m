Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307152;
	b=j+1kPhIaIJnv0GiUIi+jTEBnoz8eFgGJhLEZgOuOjk1wVyumbjbJRLc5hK7vLd/wXcFs
	 ZQfJ3j5c+d+r4Eb7FvZsyXjrKXdaiWipYknNvGgrcNpF3ZzBGNJrd3jfMCA6ye0v6/DXV
	 pc3/EM48ZBK8Yl3bwDnYPGGsSWHlPg0genscSZXEp+Kr5uGotSqq1MTG4L/c3JMkeidGU
	 kQ9zCeMuh7mMjp/DJ47yhzid32nmC33he3ceRoOj1nxcZf/dij2JXlgjUK7xri45MtIMs
	 n38vzQmRxxYzEwlbvlirh3RkMTUMz1G+uKhBRoQcfmoZX4yLnzT/+CpYIvJIFn/GKWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
	b=NSUWGKriQLBCxVoFN62IgcyUnTYgn8liW5NN23zsBwEMRvEQPK864C3nykdPPqlO3L11
	 GQHMUt0vx3OBSK5x7sCOEelBEn4vS/06DsYU15aM2OLpnp1i1msen2ql8zzqf4gATf4nH
	 YG19ZOgufujMlrc6BJktwAmXvJTg8Z5mssZjjlJwB5s1wp8JpzKb9vBQKy6RJiZHgqG0Q
	 Hk5loAG2wZ3Sd11qWhLQE6ASyLdFpYimaaMyL5i1vT/RIT7xuM7JqLlHgX9zcBISIC/oO
	 ADGQ/xTE8jl3z2Bp+85gQr6Nk+mj5hDbWgLnjXQaTx1b3mv/nYO88HFoMxZHdhLrQKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WsYM/0i0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8Avzhk8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40060A2636
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD40060A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsYM/0i0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8Avzhk8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8WDZj2833791
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=; b=WsYM/0i0nj6QVCNB
	LD+5ZXziGhs5DAXhRYtHyjhlhZn8/Gn2PQVVq6e6pDhepOv/Grzj/YaGYZZgzzYQ
	lsVoEtwjT8+/asdkQZ9DH+hD2KbDaXtyIIhFnQnhEMIdm8RVqSvh9CYYDKF9MoAB
	hGA2a0ugeA+7XaweJmxcumOyUKupX6b8wh5dKzKUCGhAgeQPhjDutaBaAUz9IoZK
	2zqxKbdlGREPrWUhXrIeLYCrAvSkpBFrMh8vlJXA/Zy6G1j0CqpNOlMCZN6y4oG+
	9hBEnroL8BeKOstRhhBrnVqxbrthJ3Oxs2uOfI39c3DWq2l5r67Oiyw8hoatb8pN
	dO17iA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrf3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 10:39:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3389940eec.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794307150; x=1794911950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
        b=S8Avzhk8BQhS4V86f2YKIuF0MCy4TSBwVJHNILESf7NgW0w4h8hLRk2/UvhjKCoL6w
         wdC4NFyI5Sl5F4FCO1zZt1JK+9ccKNiXDmDcEWTQ2xAcUAgqbH8WyVJx07s6mZhIgv/e
         CR35LwYczwc8MXQtswGy7WwSHeEfF5tWP3B8djCC05wWsdgrK1rckmW68kTjABDW9W/q
         mc6nAl39IoXEd7Bzk1Y7A80MDNk3FPHL8ihMvh+NVOWntzu4XZzj/RfDorhLKS6eX+4J
         cSHQR+tEbfg4165AtzxspCll20XlQMYoEKilvNgfduaqpwmfltGjqZ7N5CYnUbra3sGw
         IkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307150; x=1794911950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
        b=y6qWJPsl3woNLz3KYySZ1CBz1iDH9u36EKT4aIk4g/EEFttfQkBM9AOquuRP8SqhHA
         ec6AXjnGk+2DXnvqxkNb3MrP957WLrEZSrsvQGIEuEr/xelKzq6xk4QJhSxtJ+/SQEJM
         MOko/AqB1jDaqpsZPD4DAVilKgaQw6TjkTVjRU2El9o9oaO1BElWvRiJ9qO9La9iZawi
         zvj+9jtdZriujbE4GwrNBlg/pxZc2PyF9fHVT8eLkuhSe6kKSyjkxmXO/oSbWryU2x0V
         1qSlOi4B+MDKQoBHUPAKiQfCkq1oz6Yh8VTduzzDAv+DN1L7lUwLOeMoEUz8nXA8LkUD
         Vorw==
X-Forwarded-Encrypted: i=1; AL+hErGEAkZ2Rka4ZTOsuf4kfJgEIsp7IH6NR4i6HWIPYduKoXv5V5hlM77tVG+yHPsj6NqOAVUHrHwi3Qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6snqDswfFTQKjav4H/fgI/aybzqi9chzmNOo2hrIlb3l1ofvr
	3GeLf1qCFab0cpa34OB4dn6WoOkU0r53mzA7jDk1iokVgdeGD1WFqiXtoN/IbzOgRXQP9ZBEGAE
	nDWszWb5qRmbb6CwyKN9/WYumLekP8O0nE3sa6Qbs4acv0OLmwHNWVaBT/ZopwFs=
X-Gm-Gg: AYBFou0JsTzWoUaIB4t2W3cCQMu9UE6OeGHw1XQeHBqmrVME/rEx0CjgrDsn2jfULNB
	M0c8vV7DFlH/u+ERBccypRS4xLKVusqZ9K7UR17KlbthvofjLBaboZW2AvH1+VLVf1AnGP7fTix
	ZSTH4xQMsAar3arJ6Ty7fs92thsfOPne7LLfjQcRTmIpEQGt+pygF3HUVd/uEJ415XN5U8HKRuc
	UdXB30Er7cjFwtgaR89JMJsL+7+U5EhxoD4NxF8BgjpiwW8EILAiKyODKOwXi3+xCRvBSa9+XYc
	v7X7P/xjN1khzN4ymu5scD8gzDmVDGK4lhqusR+2W9tbyEZwHjm9UEico96srqwkJTN8w1JglBa
	FPDg3fJqmyR2Yh7ci4nYzcH1tYtRI7znoYkKhw4pFK3skGblcISSo5j/gRZYyTGD/DosX9jaoFT
	8s77FZJw==
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr2608452eec.9.1794307150122;
        Tue, 10 Nov 2026 02:39:10 -0800 (PST)
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr2608420eec.9.1794307149455;
        Tue, 10 Nov 2026 02:39:09 -0800 (PST)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm6411676eec.25.2026.11.10.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:39:08 -0800 (PST)
Message-ID: <69573381-2c8e-4744-bcad-0165de4b1406@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:09:03 +0530
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
Subject: Re: [PATCH v13 0/2] Add LPASS VA CSR HeartBeat pulse clock support
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G21bihuLLobqupTbX0RF_KLug24n4SCo
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2f44e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4tIis3KsY0wH9TNJrrgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: G21bihuLLobqupTbX0RF_KLug24n4SCo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MiBTYWx0ZWRfXyrI/Ldui1KUt
 /l1lB/0XKTZyvX4wyxHES+kLfs5G7PlwxgcNG5n2ZKrcbuDr6uo1C1ssvHERbEcRV8hRIWv7nmQ
 1bHGRi5ksRmMOD09yO2VkgHV01uju2w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MiBTYWx0ZWRfXxbA7QPBDwTzH
 vukxGwXKJyyVzpSZC93Km1qQsrSRlr7Rbb/PCLiICzxgD+cfdnC9vE102SYwNV2rIMbeHSK93IM
 Lv+2SibHvNWm8ZEGDGJqV411yuQZPLFo+yw+5vYY5YVQPJccSspMrTmKUPnhoW2wWeiy0mIm1hw
 bFrGuWV2TsvrkH5hHfmG8VjhYFWyIUOiVqUlvHRkqBmFMckACRH8oSmEUTaKXL6INTHlW4bpGcf
 pCgqrZsOT+oO4okNuI2pD/eCVjcm65W07abQjjkxdFqlAH1uuY5BCD4mSz1W2gIirdS2RnnFyeL
 cKlJvXhFqLmWTmqqvg/iJQKfuw5JMn3Kn7YITNpOgG1hovg7cHJquHn5OvRReMlnFPI4mSn67cR
 dNBgwpSWcdfvrJ1X7pDb4P08ZcgIKB+XJ/aXc8B8WlTjwy+61863otT6XJWf+21U8c/mwdqzacX
 sD9/eN5m2/lsmyrLHhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100042

> - Split the qcom,lpass-va-csr and qcom,lpass-va-macro bindings into
>    separate patches.
>
> Changes in v1:
> - Initial version
>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
> Sarath Ganapathiraju (2):
>        dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
>        clk: qcom: Add LPASS VA CSR heartbeat pulse clock
>
>   .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  62 ++++++
>   drivers/clk/qcom/Kconfig                           |  15 ++
>   drivers/clk/qcom/Makefile                          |   1 +
>   drivers/clk/qcom/lpass-va-csr.c                    | 210 +++++++++++++++++++++
>   4 files changed, 288 insertions(+)
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20260917-master-6c2778f57a9a
>
> Best regards,
> --
> Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

