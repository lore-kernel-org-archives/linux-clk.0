Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8906C48A2C5
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158086; cv=none; b=mgwpAZ22J+TXH61ufmNl++DfCWO5RhpMkUXIcpEvN9yKmCpCvTV3vTJnX9V8OTOq5JndL6rFcRh+uE20enJ+2tI9yTR1U1Pwc+PrwCVxT7f795Oc27QfIE20lkBl8lYE/GJsYEJu8Yiu2itDXZGmL+8+LoG8OxADLaBpHLZmp5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158086; c=relaxed/simple;
	bh=OVCPvZKaB10efIxzk3Pd6ZRQ4K9Dv+EUbAgk0/ow4/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrqWsZrOYRK1NJfejMjyL0CT3Gx+YtCypcW56LQPfDxnlIMYZsiWuTHLMD3M4iYtreSRLPKYYQiBIIJO0SVw+jma4suAMkRbsqGShPDpsFahkoHtqDDqs5tim2DV2MQncn8S2AxlKvB4JWLyynfUG3QRiO0SfSdDZzQgPZ+nfbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXa7ypjX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxJqsD5b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXa7ypjX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxJqsD5b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1hW0643463
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNRwcfPTbJlPXucD5fNhFZXhOkEahzsc8J7wHk7uRFo=; b=YXa7ypjXyfBKg03o
	SyXeN1aXD3tyXDQYChqGm0KefqXHCtYj4N3J7SSjieliRVl/UCH2ENwQKNVY1nob
	5tBSv7UKAOQ3y4gDhOiH3yfuCNNZH+XvsA/UJYpZF7msuyClr7E21/p48pySZ73K
	ojk2Xk37tRyEacqCrxUkegG2D8984s4bxI+StGV+DB7viauftc92vYqNqApMj0QM
	4SD2hnv1fDLD3ZHdOmcAUU08OKJBF9mSbxFG7Iqa/M++zU6pcZQEsMnUS2XjUD9t
	YEBPID2mQMidCWvpOW4pn/PU3wZxlphmuaeSJyPbogvlYSwK3HoXQLxZl3Wey0KD
	BBubyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es48jus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so2147901cf.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158083; x=1787762883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNRwcfPTbJlPXucD5fNhFZXhOkEahzsc8J7wHk7uRFo=;
        b=SxJqsD5bpbApDwKggYqMyl4vo197fR/lzzzf2sqHKALfwMuMu92cpF6BzkJTSaVpHd
         DY7zB7EWzCYSEJO49qT6UpgAxKB0ouNammY5lT4Ji59Yg9b/rVBXmHQmgNv9/WTKOisj
         NXweOrbyIMNrcYe8tlPol+vUS9mmJcjGnAW0t36TRXG6Q2zC2SQrTfJoEwO/4Raj5c2Y
         cUM8CiZ29P/de50Qa9IB7vkBPVq94ztcHCxsUkcW5jzNmOt8OPM3CwflVV51h6absYat
         rPEzt29uaLfhAnya2KtM/78q4Hs137j+Qwpd0vKro6JARyIonPlDzNl4dt4rH6qIIXg/
         tPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158083; x=1787762883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNRwcfPTbJlPXucD5fNhFZXhOkEahzsc8J7wHk7uRFo=;
        b=NBV6v3munGYwyi1PVJ3zNoMMs8NRT0Bd1msjvx4+8TBnjgMEbI2wiBxSfyhuvEKqWL
         aW3+IGGHw5xHM5Oepp/1U22wMqmay3rXNqLxA3jj3Q3ySmg2XdvuUizdjQhvugPn6iQt
         fFjdg0PoCqN/LVUA2uFTGj22NFFdaCFvO/oEFeVPBJe9G7e2HgD1P/dvKyFX4E/fipHB
         En+bEJeWqLNj0Gk2vd3gXjkaVDbG2nDIx0iD1LmRtXjKyMVsD4VNik826/dUwMIBYOIC
         aLYUedNMxxyOLiWRmzDz8ujpq7La7nlI63lrvmnnBSEXyaGh8iQYMsQjEq2xBsm0niKV
         j4YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUYa2Njb4Blzyz7fo99stwD5tCH8w+R7xBJB6kGXki8ZU7BofEm0xkHCOn/j+4ZsL8I3v0Ie2H2ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxObH90vhzv6LzmS41pNWSGuTSubAhJGghwLcZzmLZrYatbh+QB
	8q+QA++ww/aBqcV7h+cquvtO0R5ZGvWhXrNP0OF3Y7Jjfq1/osOC16+0hxKPpLWhtxp/50twdsV
	MFz3Z2FgCN5apE6EN/itmtp4LDlkDZef6VvVjjxrXqM+ppD2ehYSQAoN9i+oBeNA=
X-Gm-Gg: AR+sD13rVPuzXafDntjtel7SJtIVirq3tqbSZ0Inc7M6+qR1KO/csp/ld/OgoDq0Nt8
	76MRaAj35YGIy9kKr9wQLYf5YSoXJpPm1PyKw5WpSf876mTIj5hCM4cny10aniopdgi3z44LGBl
	fNhYJDhMG7FJtH1tvQ+CFTENT6pYeiMf2v382jvJsgsZjt/I8qpGLmAi9YP5nb8lZK5XH2HeIds
	lv5QO9iZxV79SrhxV+GptRd11fBae1VIZFPSXikysHUTsuKMcdtsMP55Jmt8gqNzYEgafLSkAp8
	xLzpN++yeYo0o8UtiWzFuloV0QWZFo6iynZTFd4QVtOnwStmAtTamothhPK47RYg4fbGGisjaAo
	eKqzgNkYHitS7pECIi0oAAb9A
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr42762461cf.3.1787158082580;
        Wed, 19 Aug 2026 09:48:02 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr42761771cf.3.1787158081993;
        Wed, 19 Aug 2026 09:48:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0d5f70sm1234818a12.13.2026.08.19.09.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:00 -0700 (PDT)
Message-ID: <09835b63-ab54-4a66-afe2-12f07884f615@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] arm64: dts: qcom: sm8250: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-9-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-9-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YcN4f1FGhrw_QdqBVBvmCybKxlyVFovF
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a85de43 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXx7raWHJpkm9G
 Hq1NGDLuENBJIMNTb8ARtAVo8uaQFfr64QiJFguxmgDx0+fyVPaC2J+iCmVm6sgFzapGxaI30se
 DrT0O3Mp+SB/TGwN7elCoWDmTZ0FzpI=
X-Proofpoint-GUID: YcN4f1FGhrw_QdqBVBvmCybKxlyVFovF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX8BjF3G6mOkl5
 vQiAzIdgV2sVoqzWu9dilZKxch8kKP2p5o9DC383/dLWe6miC84To/URjQ/E+zNw5VU3oJw/HXS
 wT0Nz96sdOi1jtOrA/L1vEcaTXzIdM8LpRzZbRghXFkg5qJySAA8rECYbmfsp8XUTSvQNLU7/9h
 fgnPPv0+4tSs9F/8smmcCKk0e+FE7VHgYvHrjfoCHxLNAak3xchMLTTrlTIgT1cdGg/YYpmGNe/
 R2OJBUsR5jJU1sN/8fmTToyiQhD2+7B2S7GZZkHrXgmQx1UxpTRdr5titM94ScPkrcdOg3vSdLw
 9sr7A7k5nT6GR0GT3QEowvZf4tOQ+nQoFKSJBE650v6e+g/LyBdmNjhDH0JUhmjYlsFXeWVo4T2
 cXw90CJffOK9kpIpBd6pT6OV4B0k/sIxP9W0UuqrHzOX/o6QGU2Zd2GCf8iNV8FS2mLyKvxxeWK
 o+bAhvN+Sv8qeqGicag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
