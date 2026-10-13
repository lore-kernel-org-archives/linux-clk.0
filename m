Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDED48032F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888012; cv=none; b=ZjWyJyLvyS/WrPDdj3ZQ7vbyd2o8TEXleHhWategcecyLDEkQgMOQL93hQT+gIQgMiPPXY08hfq6lSFk0uFH0B3bk6SMLEUjwSw8LYV11UOK8gI7EWga2as1+z3FMuBqpam50dLL4ZQCIA8/iKiaoG+j9yVjRe6K5Z6kV91EzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888012; c=relaxed/simple;
	bh=p8JT08q8v1DQwSLRGMqk0Y5KS/u+5aBPxRuypVILJkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHudaD+vOHGU1HKHHVbgonkVw5uf/5voobQQoFyvGmFNzs6ykR0yVhxOiWvK4lXBxMXI48a3siLLpNtjgXuDWxsd0NIwzceTBgHdZxxzG2jDLDujk6p0NTMuup056CwMrb3aO90QKiLeFtgtbUwqq+KXqsC8ayk3NR+PI/LuCUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHcCEgn4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWMZ0lop; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHcCEgn4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWMZ0lop"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8IQNU922903
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xDIx4Wl7ppJWbdjXs0UgIx3KwRe7VSEGs56ZDEik8Q=; b=bHcCEgn41ErgxjsY
	mX/541/2ClWBwzDX4zmhncET9n6nW3romz6HzQ9LvwkCj8TRuDP7CEM87ldVdJIg
	bmQiHSPnvtm1ZP1krt1uMt3N43xyhS2tIJivqYB/EXCK30UbtTiiIhfi2gsEgaWR
	2lsq5KmZ+Je2l5pWG1P9hc//yH23Yc7MprvlOuGgu58kyIAQuHKsJrAwN69hyc64
	GnOg1TAU2+3/rxasMhtNFNhTZ5+L1dh9yxxz2ry3To6hIAJuW+2ZyPHSwgcrir1C
	M54ngmOIwPqwPbmZMj1r52vBZ0PtdcBywUr9vCeyqu7FY1roRplZj+/5qyB0gr7k
	oQ4dNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tgdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:40:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so48657485a.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888009; x=1792492809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xDIx4Wl7ppJWbdjXs0UgIx3KwRe7VSEGs56ZDEik8Q=;
        b=QWMZ0lop8DQ0sEK43xUOpLJZBmDfkPJHWJCRLSSq6pAZYnjeSxzA6HQcxwyaFXamzs
         7XMszCzRrfd91WzyguFwjnUDxvyI784b7Fu2IqcpJcAW8XoV8MMG4Huo/MmJC7ZeMFvN
         nRSsY/Tm1CAAhM/ac52578gXGITD4QJvBLFDY7hCTOPqIJ2hGa1WD/k3OKoNnytiRXlI
         tBFLTuk30fZ2w/1XsBeOlyaG2QJ3Cyp0VFgfkxbpWC3zV0LN/YP5JwdyZ7Odi1tsJtWh
         5uxBt2z0sXsi5+oBIRSs9xRhoaFyN1B+J/3XymaEXUmBaganOxBJt3vTcm6KpDgJErWm
         BRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888009; x=1792492809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xDIx4Wl7ppJWbdjXs0UgIx3KwRe7VSEGs56ZDEik8Q=;
        b=bxciGDiwAyeLQUNsP/OUNTQL+/fyVQWkwLTgbfWU8vmw6kPutId60Ba7SdhfU9kkjc
         nvZ4CwYbehoeWReG/WeRF0IfgwBmvq02lm+W4jbuJpYb7ORHH2zBKBlMM37pD+nv+IhR
         e1ndFc9db830T8Uef91QOai+s+eMcp+09cAGJdlq0Sg+3w4hrdieSIHuwPh4j7b84tEk
         V6M0HxnUDyV7Pdgof8UwspbzErgrFSPJEacmWRC8bxgqWhlp+TZFcfnrZvaRmZKD2JSh
         eTDM+bZpJ7ZqCJC41JsqbIJQ96PSOsmCt0/9fdNNX+5bq9f0QllG2qN46HCqGQmovf5z
         zF3g==
X-Forwarded-Encrypted: i=1; AKwUvBx2aE3IolMVocI0LTSamuBM7MxaKPC95g2reYK8vbj/BhNUxwuxQOFuV1wbaHmaRvMJaY5CPYnvszw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBEwaN7rpxTKeGxpcMAyZN1LO6es9lck/M+VNLXfyG1J0H/RjE
	A6bC8otD3s5kdKy+nvNW6pvjtpIGSh/zIgIbIaxJJaVZiAFJksK4OicVZB1+QyvanyUI4Ly2qvW
	ItoBE/KZBnNCV3/v4v55xR3owfMfpSjz5SIfb6nULQmD5mupXxygjNKaAA1mEupM=
X-Gm-Gg: AYBFou3rmMC73l9DzPafTvYxaQ/IRGilx93eM2uEGkPpaQxczioxPDfzJq24hCnQR9t
	w3hdlOTmjkdGwCQmHid3jQnLaSChrNmBr6JDvJqPx0uLCvIMXJnr7Eb81dj/+CWTy4OeDXzQiNe
	5RueLMvc35D5wui5AjevZU8Ocr12P2krgC2PvHYWwea6u6mI5M77SGSjuQWaUtuqheAXJJvgHOA
	7oxpOP/pC9Do6wU+NegSMZ46jR1ckP/abU+YK7GtvsjfouS/zhqMD/t7XYDVds6KZcOgpHLb3W9
	Ui3cpwKIKcha7ttbCKSLDerBdcWEgrjk1HGIL9MITWveJHfDMMHRPqki2dDmkBR6HzVnalcJALv
	O9r/DcIDGGereoMkTSzNPpg==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr2289144185a.1.1791888009579;
        Tue, 13 Oct 2026 03:40:09 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr2289141485a.1.1791888009168;
        Tue, 13 Oct 2026 03:40:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31b8c4b407sm522786766b.0.2026.10.13.03.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:40:08 -0700 (PDT)
Message-ID: <e8689aae-db6f-41ec-8584-f2d8f105eace@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled
 via critical CBCR
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
 <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y> <as3_5EFx01FaNFmJ@QCOM-aGQu4IUr3Y>
 <oqi2xquf7w5qahh5ufeecmkpy2qhfenu6v33t3vbz43nsph2q5@cseg4p3vlnyh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oqi2xquf7w5qahh5ufeecmkpy2qhfenu6v33t3vbz43nsph2q5@cseg4p3vlnyh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace0a8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=GumQ9EM2AAAA:8 a=2Dd11suIDkSi0JYY73kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JkozY25SV1M9p5IH0Skzho0-_MsAxhYz
X-Proofpoint-ORIG-GUID: JkozY25SV1M9p5IH0Skzho0-_MsAxhYz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX8lRaeh7Qo/iA
 CUFTtrxSd6ebdE3KSVLsOxa89X3bipDkFAF21/Rf07MRXQlpjSEkFfoqFcJ6yKf6arm+xj1Oxjh
 nDhjvLKNhay46aTXP7WXDNzOuRUJ3L4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX8Cq3EquzjaIW
 Ja1Gxn45ZUtCD1fibRYr7TmEHWDGpwJBIIh/aldVtS91ZSKN7UYGxihG86v9T4JlJU5z+W/XQ7c
 tF3to4PxdLj6gXFGxBPY9wAp7ZcINo62XQ98d8JoCdG7Nebfndc66BByLLVcTdUrrpD9bW/INwo
 PRsfrx7XnA24yiEkWmqx1FY124R16VKOqB9E3wL3cgV760zRfxtqAGsoBqvtmL+QfX3CHDW9jkW
 B3Q+79BMsZTUwOPcBS/69VlrpBsJUlju6rZhODo06iEpKF/dhujrORTyS5FBTdD16wZr1yWTxNL
 AgwTlxSv7NjzWKAZHrgh9QCZ35R5qhxdDBkFjZ4OnuCIlHLDGAOSh6Q9rwkuvfz2paCKYvvn/xZ
 O/t01XfTeRwc8KAsLZ/qMdKzdxj2nizuPaeqSsu18e+2mGez8VbRFmWBrdKqBe4uFKK7z29KGyg
 0KRFzqagiW87eo2VFkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On 10/13/26 12:36 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 13, 2026 at 05:54:44PM +0800, Shawn Guo wrote:
>> On Tue, Oct 13, 2026 at 11:08:56AM +0800, Shawn Guo wrote:
>>> On Fri, Jul 24, 2026 at 04:25:06PM +0530, Taniya Das wrote:
>>>> The GPU2 CFG clock must remain enabled for correct operation and
>>>> should not be exposed as a controllable clk_branch.
>>>
>>> Hi Taniya,
>>>
>>> Could you share a bit more information why this is the case? I do not
>>> seem to get any problem when testing without this change.
>>
>> Never mind! I can see the issue it fixes now.
> 
> Would be nice to capture it in the commit message.

https://imgs.xkcd.com/comics/wisdom_of_the_ancients.png

Konrad
