Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884596;
	b=Fwlj0lVqzXV1eKrx0LEWtEGadwYw6t03DbVZCm0bOy5ZsZIUoz4bwwX8m8uG65gHdleZ
	 0/6jX6zdDZTq1xQshaxA4C2qjoTc2AghySYMO6Mqm0S2NBBL9tbuxSKZRXS8q/8kxVWGb
	 KtEYaRNVgblrDAQj5eTbUhsHTurkO1vouN6dnLUmtNFLrGNsExn6V/yQb1ozOk0JeRx4b
	 mXmpBvjBhFEOvBmxUOBYfvjKIpK27MQD+6FY/91hcXqodZEbVDcIzCb0Xa33W0GHO1SMT
	 i0ghvQ6Q5pNF4u+W+dkO8HYy7xhAX4lSkwcDQ9E4rongHW0Bwf1oCIqHa9Tz/nBAZmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
	b=jQnvmxshAEukW+i7UokHZbQzy8RR2puZyiTw5l35oJLc24fThted4fhsRwlMIMGfdasz
	 QD0PHWwvFUsPBurkP7JyC50PqK/kzNXLI6r0d+go/tcUNUejUWwpTmqqL6b2TbV4Bq3GQ
	 8y27hCZ7f4V8vOwkkfJeJm2CuWMWUxWy5oTygA9HPxUquhdt56vcNN9m3HF+ctqyhfFxa
	 /Er5JhBmsfYt5Xfxy5lcpuIEvJmSTDCvD676UFc8D2ex0pPaWHyq6cPVAyNoqIXuY5uFy
	 mRVU8ZpvHkOP23xEBV5Rkv05EjUT8qNElb1c/UwMqYOJnp/fV9uDn12GU0oIZ9tBuxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mlLm/5/u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaYlpuK5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CD7606A338
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 13:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03CD7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlLm/5/u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaYlpuK5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tMCs4084486
	for <linux-clk@vger.kernel.org>; Thu, 5 Nov 2026 13:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=; b=mlLm/5/uHHXkUXs3
	Zflt46dpp1qf2i4nxLhhb/W+/5FsD0pbicAD3o+LolSsTQXIeKoPYP95ZJlpXe6I
	sqpczlbM4+VLCl/hjWnJT/bVtsg1GZp7BeJ3i1e7dXIBj015CLQyQbXlGrybWQ/C
	VvdBFQQRsCIWnGZkV9GYHafbVQCa46/rLKwcaWWXU5tp5KNgB1DLZaO79kncRywg
	VWOdmY63T/NQFYGp5YrfCi+lUBIAv28Hb4Po2jj+LFS6gQ7fxOz0qPxw4z3CUmz1
	5Y63uKXcOMZ4JZCfg2IEIY2VWPovPs23HwzXxFQXp8spXUbUr7/fMYPWfX4qDBex
	mUbpJQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkrt9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 13:16:35 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so71192e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 05:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884594; x=1794489394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
        b=AaYlpuK5+H7azlTpt6aNiNO6taFzt1Sy2iEXp7Nm2k5PzhG/JywdL15b1fvqI3W3+7
         7h5AMIKI/yoeZdZyqfQVkkbOaN1WnfzBJNXnO0OlMjiDeQqcx1OoRYXWpFqCg8XHaMVE
         84Mc/uaml6I+T35mDSE/T+wYQEMU1v+t52Y/j+9QXQ1QewDghX6QO1CaRLSsfGVuG2Uc
         ZwSINFba+qm0SLIo8cNxxexy/VyYQSCnOVQfvcIB+71CX/Dkvg5YhsS9TJ+Jo8tY34Xg
         MxTaWGYq1+oQqJB6mJMhfBT4wl7m8xmcuKsFaI8nWD3wW6LGdNs9YR+M2UDf4NiUXFFg
         zbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884594; x=1794489394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
        b=KTRa5hIZhnyMAKrB4WhmiPrvYwpwUi2K5t8t/U07IFbz0BwejZVZr1UWD43mtlSlWz
         J9eA3ixaY0/aAixz6gZOj+DbIfx+28UfqpHKxoTtq572qyg4Tte+iEZYWqRmU7kd9RJD
         H6/UIfBoX4OWiGemmy1wA5PqPoMz7WfiKAC1D4SNGueQPboDDCHGOOCPVixoBi1foMWn
         ajpCwEyHwXIeQJ3/feVIYKZhh2fIbEtkR89McB4intFKKSC+u8MGMGdRDiiPegqDnlAc
         ANTsIWVER273ALH7NIe7Gkdfz3PcvTHjuy7+jLt6sLgWbRcQTzSvUXTSArJrZT0ZKQte
         R3aA==
X-Forwarded-Encrypted: i=1; AKwUvBwaHIv7QUWWLRVKMxd0lK3z9vJLakQMsvl6t+AEUcrwpuo2TPEQnQcO5wYwnCiWAnY0YI4x23zpkxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/17TEsNH9KEZN3o3+U1TCXK2W/HqOuPjS692LpcWyS/bYRn3Bg
	13jcF9GTELY81/A+SxlAPdOav4duzWUs+9zS06pojZRegjLUUsutFHwzuD6I/5MFLJDvfWljosW
	cdJlIsdRTY5t16P4QssGjlhC4bqwkpDjod1juHNAw2pjuWmaWoumSZQ+Up1iH7PY=
X-Gm-Gg: AYBFou0mb1/hofJjZITfjw7zzY582zoD23AEGEGswrJDQCFfQQaRhYYbCzz95c5ESjO
	/Yn0921EoebChLiP1U5twcf7SC8HzY3dFEOXP/vLivYDeEWThdADbcw72EwZ3fmSwciarNHuTyk
	TacSSrjOyFxt3guPFC2VMLAGJs2qIvuV+vQWUkoW/UQb03LPTIfTK46BpwpeeGJu3J7jwssvFZo
	7P8XzIf/PB192b415qUc+webBeaSFdl2DG1NhoyoE3GpzWwGYuBI5LA0t//FAoqbK80Z7nGCyfB
	kckd/h6/27W1kSOqWFu7O3ztfm5rz+7ea4vwFCqZA/hkDCHnzUN5BdOI7r0XBVTV/k5gUFX4ee5
	5gej9+b8ZYeB26/w7GeAjZxrX0ekCt3fg0mjmiaROVTE4U+CcQpPJP5NzCW5Z6O50kI0b
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr9998816e0c.5.1793884594295;
        Thu, 05 Nov 2026 05:16:34 -0800 (PST)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr9998771e0c.5.1793884593827;
        Thu, 05 Nov 2026 05:16:33 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41da78sm172632266b.16.2026.11.05.05.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:16:33 -0800 (PST)
Message-ID: <8b93144b-08d0-4333-a334-804eadf04cb7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 14:16:29 +0100
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
Subject: Re: [PATCH v2 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
 <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXyFRFIGkF6cRY
 TGJy84vDtrg5pT0sfY5mxnaAhi84mcv2asRFvxcQOMTc8P4iBP/mL+4MWddOB/dKVNwRLz+GM1h
 HQE4h9rrp78bXjFupUt8Va6WAU/ssyh4PFCuIellOxyzZ7gbWcsPIM9o4BMUO3LzF6bpe675GMX
 g0NtcDJAipMao48jwZ06VDWyezgumRs2Jtvl5qdgyHyle6wa2jVyEX38jgmL56DIZt5HsTO1v5C
 0LHMy8TQj+oyXIcnibsvyL1XdOR2KKCaz7S3wc4jS+01VlQdbHdLE0qC3WO46u8A26fzbtKEq6z
 wXBIqyzOrOeF4PQV1UcAvUkgXxbYsjRYUyY6+CpwGYGJo0QypMk9EWYpnpSI8aBs8Sgou7pHfvJ
 KZLdkxaJQCDIl0b0c6DVEdWRrSrSqau2xjnaw4zbXKtM6ABUPMAg6Q+cFqGcpCwRCwAUpd0DnpK
 tAgdb1H9FiMXG2p85Kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXyfAonWZKplkm
 UljGMlYB6T7kfdtAiAQTGacUirKqpitd6WWB5zungmLoE8Hk6YnhBHlFOWhWEUpnMPHnITfL0af
 vcmU9MQ6Hn5KILnllwmT9JY5tQjtFB4=
X-Proofpoint-ORIG-GUID: WyY6kB8YEZCwdkJh6g6Q3xuCcmYiYU_g
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec81b3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_WYHhi0DWFvV3-2RZcIA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: WyY6kB8YEZCwdkJh6g6Q3xuCcmYiYU_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

On 11/4/26 6:07 AM, Jagadeesh Kona wrote:
> Add support for the AV1 encoder clock controller (AV1ECC) driver
> for clients to be able to request for AV1ECC clocks on Qualcomm
> Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
