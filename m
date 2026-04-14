Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6B03E0C5C
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167588; cv=none; b=ePxBWee08ODaERw7Mu235974frVPXOcAb7orA2sPtJBCQVtToe+LhGS8Bn8q64I+iNtTh6ZNKVm0L6abq4P87EWqaPNd0Ufb8SsQgjdO++IsUNZPkJCdOz5TZ00WPeVKAKk/PNjrhd7deR9IOkZJ8f+NtnnKK/n8umcWKcU7cE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167588; c=relaxed/simple;
	bh=J2iGJy9WuxQUrTwdyN0lu26cuA/fTvufaAd+d5sGPBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBQ1xesky9xonuPdTmohuGPN/tUgX8CqbJcxmHJhKpRpG9yNRVOnMd0cLv2oiu2PB9dwW8PoqiHGwdoBPCxG904CWPOpqGx/RtzjtW0uTjmQj8Soyucj1TnaiJhtIUmmRQ53Zpw/Yhciki2F5ySqnbU+YpKdfM8ES+AFM7FAgFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOfyt489; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYATjmug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOfyt489";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYATjmug"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBVRLO361811
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 11:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2lWwi811V+fX94Vbp9/sis+NUG9UP9DFXsI2Zikw4g=; b=oOfyt489R9QHYhFW
	BCZ3qdIQdTBd9/wTH/x8aOYSD72awQd1mSDvxA/1RaRkqLtI4ICdmG7t2jKm28v8
	Ody8b0kMXQqaNHdRisVIhw/0NU6LH3RppoFu5UuaNmObmJU2VHzKVPxNg3j06OkL
	GL5IUomk41R4PnUzp7v9JIDN+/OEPmROc1iqDqLEm8YynsI+AJhnQdf+G1tvKDum
	2W1LFjm40uc6ENZMAtW8Iq7FU6XMRj4BO9CzgyF3BQUPna/UuZMnpaUS9yM55StE
	odr/WcguWwJm+oFnrTMfU9fNPKwUS7q/mirFGMuLrcYxPpJOshSi6ZqcbMoQbmQD
	hYYUBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870tjr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 11:53:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acb4b340f4so5488526d6.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776167585; x=1776772385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m2lWwi811V+fX94Vbp9/sis+NUG9UP9DFXsI2Zikw4g=;
        b=JYATjmugqtby4C3zFS/2o5zntkP0k9/BjNPeCtAJ1RQypwcNTEnsItGLqV25O1be67
         BrykC/kNpuqkWWTK5Ajns5qfZBGbjbjOf4V+yuScySsygsnq2ntr3SyDgbil2ZSyPnV+
         WARCaoYCLNn9A/hky0O2RByqMOWuHbc9J5M0OpFWoll3zakzrSX5wWTkJpjZv75UQ4HW
         q3U1FR/BeJBNMfikI+FBIriydRGICKgGk70ApPgrB8ukikApyzlQjTRCMM4HIwpageg1
         6DaWXPOmJzJg9C0EcXllPkfkRTXABJWuVz9s0HJk5FZ6mfij/LGohuH+rCYsY/W49w/U
         nTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167585; x=1776772385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2lWwi811V+fX94Vbp9/sis+NUG9UP9DFXsI2Zikw4g=;
        b=ek7qR56pgRjHekvzHUo5w0SP1nwCU3mxq8hoxF+V545iS0KudfHpTZI7JGyn03wt7e
         OvAD2nHi5TO4GnO+xyCIy9UB9RZAUUY6qv4X9WJToTZws5mpVuEYXNI9+iEyaOEYNLbn
         7XjBC489ZwX1UqHRPByIu1zH4CGriWfLEXjo+dwhvXOl/6d6Qr4AEO0r7AUU/Gw6mgjF
         eRQGonRmkEhy5A7KzgvvT5RhshvJcOaXAorE4+yjnrmrESpzfGnYx7MF5whc39aSnKJm
         3LFyX+8bmo79gTPkL4a74244R+uAlzoFACN7sUAfejBkCYip+N+0OwwczrkbTuedfTSx
         4Cjg==
X-Forwarded-Encrypted: i=1; AFNElJ81jhh7NrYG42woLVAK3Gl1iEJ5w53F4qG29EuYPVVUU53A5Fu5n9plR2Yd0Wf8CK1kA2lc7hoNid4=@vger.kernel.org
X-Gm-Message-State: AOJu0YymUx176siv89BFBtjZ+igVWSCaFLmhe/28fpsb4wNQIPww3hs8
	qCPhMyZBXdX4Gedrdwgbu8u6e5qdTUEVDUWBENKN1WWegyKhJj3FPu75OGf3g6SY/hAkymIaaC6
	2y8DVccrVf689N0/aOHqGx3NBi8bWwmGcgox43Gov2Pudz+9rsUh1jLZd4bUSSD0=
X-Gm-Gg: AeBDietcHMgUn7B3U71gUiJEfVfiLYVnt+6u7/ud7jHfsaL4T87L6881kQceDrooAOC
	/uq41ZtLL9BIN6mYkWJUzEdx5vcjSyjnEi6cuZDd/gMf78XxumjQUeiLJIRvjPomNXbcwgF72yF
	D1rPADUZK4xG9fF8tXrAPNd7s8Z4tzyni1oGhIKXEEc4w/PWSk484ERmIP8lB277Hxz1/dhuJzy
	ZqJ+S0VspkNDOSPnpaR6AStGMBpOlDJKptxJSP7fSxQrkIUzxWZ1w4JeYomdqKdtSdBL1PNJTtB
	86TBBmlAeeA9tnc86bkBKUyRY+EKbxMPp/cNJaHS6eORrjL95DlbAahG/5XyquUH3OQTF5Od/u6
	b+2GqsA7ftluqaTrb8HkTY4wYPbXiDUKRJhNnI19jt6pC+dxISwwZ1a9YHhTm5ZnlOJ3kAJecBG
	GbQsdjrlTKNYUZHg==
X-Received: by 2002:a05:6214:c6e:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac87629726mr202653406d6.7.1776167584827;
        Tue, 14 Apr 2026 04:53:04 -0700 (PDT)
X-Received: by 2002:a05:6214:c6e:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac87629726mr202652976d6.7.1776167584347;
        Tue, 14 Apr 2026 04:53:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5b98sm397026266b.34.2026.04.14.04.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:53:03 -0700 (PDT)
Message-ID: <2c1da6e3-a7eb-4c85-8933-84ba9ac7a363@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:53:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: clk-rpmh: Make all VRMs optional
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260414-clk-rpmh-vrm-opt-v2-1-43c1073d109c@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-clk-rpmh-vrm-opt-v2-1-43c1073d109c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de2aa2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=QKdSdXKZvfk9e0BhN10A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExMCBTYWx0ZWRfXzKCxLDzA23Ib
 qfs9nLLT0MKlswrJm+hIhDu7OMCST9X2cAaNym4t0nAgxE4bONicugC8gd6XIEZCSLtZcIgAMYd
 OIS/kirh34+JH2kckJ2f7lay2VXvaHOsUOpwL122Stu+3vMMDkQ81nqJQsDO6hkd9fqo1afOH1l
 4M+2UV5tQCDIfsOMGMuwy/8LJiOXfvI1OntEjhOmJfm0Q8ryxF3KF5E9+eybyuKk2P02gdEhBZN
 9/6P1mp2w7qSMF5zKkAsoYAwatoUEIa2ao3cRUrCoKxYcV/JQED82NVMffYDX4riSOeknwT37zQ
 cZDrhhE85UOyFXcIfiV6Yd2ti6JNpNc+RI+JrINsmqdH8z2Mu7jxlbLTtPBaIDNTi5n7C/bCDfi
 87t3LPqzS7aYeu0LrtjyVEoc/IV6x6Fn43oLNHqm5WSsWfkG+SWT6FAO82k0pIdiI2QSTmibJcJ
 wWIYWIksnmA0wMk4qbQ==
X-Proofpoint-GUID: oJn9w-RQe1GJmycUKwm_gvR1XQg56ov0
X-Proofpoint-ORIG-GUID: oJn9w-RQe1GJmycUKwm_gvR1XQg56ov0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140110

On 4/14/26 1:34 PM, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This resolves an issue seen on the Nothing Phone (4a) (Eliza) where
> probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> due to this device having a slightly different PMIC configuration from
> the Eliza MTP.
> 
> This matches the downstream approach of marking all VRMs as optional
> and makes the previous clka_optional handling redundant.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Changes in v2:
> - Squashed clka_optional revert into patch (Dmitry)
> - Simplified patch by just checking if CLK_RPMH_VRM_EN_OFFSET (Konrad)
> - Squashed cover into patch commit message and expanded on background
> - Link to v1: https://lore.kernel.org/r/20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me
> ---

[...]

>  static struct clk_hw *glymur_rpmh_clocks[] = {
> @@ -951,6 +946,9 @@ static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	if (!rpmh->clks[idx])
> +		return ERR_PTR(-ENOENT);

Hm, this is going to surface in some places where a nullptr has been
happily accepted up until now..

Bjorn, Dmitry, WDYT?

Konrad
