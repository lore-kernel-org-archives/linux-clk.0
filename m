Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF61285CA4
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048540; cv=none; b=GIRFgTu3RLUmCtTlTgKVD/NUcOTLsopHax6dDtfXS0A2F89VlzAF88ambA/XMZNul3c8HoqJEtdhrMmF0EVJpPdYZII/G/vOdthTkqcfzlnxKDHyBvOXaAx7my9bjcBpGZxt3owm6SO0JeCuQbmS6HDrgSBc8jC2uRvHKgPrnfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048540; c=relaxed/simple;
	bh=/1gwxImvfbX+kqBJ2oxN0RD9tJRZuIRghmQumNZUES0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FRzGSxsSe/fJLeki50CL5oAhph3Bjo3gC7rMmh1BckN42RVPgejvOlUnoXsotU0sQaBPusvqR4f+Kdzb2Apd1kUWJnzHyt8wSxGxp8MA0/WXOzyMOoeu+vEQucQa4eIwwgHV4XRaIQoy03grYDHIROmao4ZnA2doz8Fyfl+Em+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEAi7yhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H01v9mvs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEAi7yhu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H01v9mvs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9uTeJ1843498
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=; b=bEAi7yhuLxyWRDfy
	fmlQRK+XtqEnkLrvKOjKqZsXMKj8f2IAU2o39gzHYPYeZsamlJQ5P2Mc9i1NM/2R
	K8KErIqV6Viy/XBwKtQtDUn1zDUcaAPEl8oZrOKIN76RsiiPlUSlk07eI0yOHn3U
	uiN0d54oezdqaAIahSdRypFh++kmOCIziTxycF6asy4RDLsmYEymGd0vZlZ1seDm
	A5mLHt9m9wdFm7bi7uPItUdd0DBUuuhOIU2/fjeMVsflELBfHjlVyJ755NPDdBao
	1Evn30WjdtTY6z3fMcjEWP/s7fXv8ekMNy4Rl2lYxnU/TkUdJTDJZhhYQ1BcMc2y
	12YyYw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h366f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:28:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2a4babe45so22415065ad.2
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048537; x=1782653337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=;
        b=H01v9mvsUfKcuZwkuOzftANW0Kdg9QFCX5uMgLwpj1q7drfjOCduY0hDftx746j5qV
         /YrHAMq5uAy3R38katQS2fuu5Iy8gUHkbdaEYXXNe+YIst9FNSWzURzxVJDrrw/zlyRI
         izckcrGPDDNr9P2hWZRx8l79aYLPO4PSb4qEACn/6ypKwOBrBbQx67GRj+4+n6g6nytx
         bJD0iSYpqT1DfMleL76oGO81Z3HuCPTdaL6Q6g4ch8az/CNQdHE7bVljn+4RrikGtnk8
         Fi20DmBXvSJXUf/EJxFFrO9jZqTz19gv+W+Djrrp4DQqLOFiwn5uIjBgSypn9vvNtABB
         jaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048537; x=1782653337;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=;
        b=WqgeRhfp5tfX68HvQk6Z9JpIP601jiYitQLBYhXzRgaVzTtwKP6BLWu6zoNrzc6SsT
         AfkjkaYbQS5BTtTZh8OPiYlCRHbwfywbpEbr1ygdGnK3hXpcsgdN2LwChmPPtUYvxpLd
         ds7uuU/J0ctME9Xhbx+p5Gq2XEOijv6ZMA1R0LkosU2t5Y0Gbzc6CBM7bQTWM+jS3oVE
         b1jQjDdX3gAArl+/O89Hvqc4dX1Guc67VPKWap/6IdFdo2leOcRHl2lT62wjqHSCVRWM
         JQ38IEFU++pMYzryPsamu8l8pY1UorY2sUgD8WJnJMDzq8WeT1J1JWxnsw5uSJdVglMf
         d82Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr9SruV88mvLyGbfKhThKIHXIsgxgLlu1MjQGW/OlB4otVLl18NA+YPiI5DWoVOHuNt+dTD+m4tAsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEB7THLhHkpNZ7CosCQtflcQSneQMNKqrUU2/ABwRv1VfSrufi
	r/o1T+tHZYOliR54N3cSJsJCTkNaLh4O1CD7UJlvxtRQZ4MKeETPjPLP/zu2I/7JGXmDFhrTnEv
	Aj52YVsF2ImW3z5dXotk57M/Qt9TRA3x0rp3y5VG5H3GMkEO+sZcItQvERonJQg4=
X-Gm-Gg: AfdE7ckBLaXFjctr/W6lZ4/10NNYtY3dkMsKBQCRnA2sYl9+FSbCH8THLS+L1unabyn
	1LcVfnDBriERQINGLPXNJvF2QImG8w2B0on7rLc4QxMdec+PuKtAeR7SkhDusW054b0yenWoyNR
	Wct2N4uqh0VGIRE7Re5SFR7K2+lIeXmaUhNMqtyybpMQ5gpvJM4xe0Ow23XenqXokg6RhwVoyd/
	QEC3nXHC0UrnTCKzv1+YkDMAq4VVIszKuXfiNujNtVTxG7m5J5iAeyoyeJs77BkMr2qlWF2stXo
	Owsz9HQAVWwY4fRTJwufUSnz7P8kDVDeh8975Q89ghx07sDfLk6dJ7Ca+pnYb7bY90lBqzkrt72
	+ZlH4B8H2rar2QEZEK0UyqymcHOTLzQXo6HYATHQk
X-Received: by 2002:a17:903:94d:b0:2c0:aef8:23eb with SMTP id d9443c01a7336-2c719001a1amr130799725ad.25.1782048537204;
        Sun, 21 Jun 2026 06:28:57 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2c0:aef8:23eb with SMTP id d9443c01a7336-2c719001a1amr130799415ad.25.1782048536750;
        Sun, 21 Jun 2026 06:28:56 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8524sm52980105ad.47.2026.06.21.06.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:28:56 -0700 (PDT)
Message-ID: <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:58:49 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
 <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
Content-Language: en-US
In-Reply-To: <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX3n6j38leMkmz
 Cv8AxOJys4gT8ix1uoJTJ5Cxiz/b0kEP3wZTWKInjNg6HxBKgxIN/zhpLDtIGyT+X7XxbQP6Yh0
 3lrs07JTiXjqZefXO3tblF+5fJMvNB0wXlof4AV2F6Q7ScsJyqlO+DD+zEf9sWMtF/dK4xcvyAE
 N6DfQcPLb8KLT0kFqzhcyGlSh4p/TIG22r8luRHvYcuiWOigqi1HDnvg9gGuuLspRa6rJWhZnBq
 i/1Nse1yN+LT34ODZDeb+eC9tN4U32p09xhKyDsTpXeyigRvgGKk6fw8vatmFGE1DD49vFwlZ7u
 meh/U0TrKQ7t1YYmvxPXa0flBcc8sSZRBsr1yzL4PCrNgYKHL0DxQdEx7zlBSaj0L2NpOSIKlT8
 /nIMIiEdxvYWn06zEhvFkTEiSK+1hIHR5eWrn5N6wlTIGLY/B5J0+9WirssD5TGw2iqJUgZCFYK
 HBXgk1dL3ki3I5lgQUQ==
X-Proofpoint-ORIG-GUID: FPgj3LoRyo91PG-5Z16YdTFFkdRYpMH8
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a37e71a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1Eoo6ObXIGekxtLEpGMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX7YcymwwRJ5TK
 4KbY6p+tu5ISMk2wihWqm494E8ouNZFyt4v8Fb36GHfysEeFae0df9tmk+P0mqVj7bLX0E25Osm
 hjkXXtk49q37HFnXzu4Dkb14XYxQwwI=
X-Proofpoint-GUID: FPgj3LoRyo91PG-5Z16YdTFFkdRYpMH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606210137



On 06-06-2026 04:54 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
>> Some GCC branch clocks are required to be kept always-on due to the
>> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
>> clocks and use the latest .clk_cbcr convention to keep them enabled from
>> probe.
> 
> You got the feedback, but it got ignored. There is no explanation about
> gcc_gpu_iref_clk and several other clocks becoming always on.
> 

Apologies for the late reply.

I have updated generically that few clocks are required to be kept ON 
due to the hardware requirements. For gcc_gpu_iref_clk clock the 
Power-On-Reset value is default ON, and such clocks are kept ON from 
probe. As Agatti is working functionally, I will keep this clock 
modelling same as before.

And I will update commit text that the GCC video ahb/xo clocks are 
required to be kept ON similar to other camera/disp ahb/xo clocks.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
>>   1 file changed, 18 insertions(+), 142 deletions(-)
>>
> 

