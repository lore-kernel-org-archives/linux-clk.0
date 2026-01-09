Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F6C32FA3D
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949927; cv=none; b=oBjoQE9Zy7HuudcEAAKb05GYnVOZvPe8QZP334A+5yrh4s551F2CF2ilmo9MbO+xYbEgygwbecA88LgULys8hwHxU6HWJWgKZOvo9jxVU48D4FnuAt1elHZiJcCW7GcNbh+j0k8kQDQNxG9TPln+BPGnNfWohcvsdn77Uv6I/KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949927; c=relaxed/simple;
	bh=YINIDNZzi9CYPigJeqldTRwq4RKKw8w8rUNjLXDS/oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en9OtDlElbi3mMSykYvfFMKMpCbw14ngW5bJMtiN8FklaV0LKc0t53lR22Ak691BQDwLkjqYejQOhF+qPS2cL6/rQEammA7hSCwEB26ha/VHvHcvYdDaCJhXsdf/7hNO65fgzQk5tHhQYAvWBWfyoh6rHusP9/2duDIiz1D4AWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk+Pi/6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNUisVBx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sk+Pi/6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNUisVBx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098Xjjv823314
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 09:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JC/2PIARWmi4kmr5mYkW0IX6da9jvU48y2O4jH+wrng=; b=Sk+Pi/6fOHGFMnGt
	HoeRxrhvD5KCBfq6Ve5UlIY4GmjWnka6C0nnrotU8eAQfR9t3OSivgrHCbcw3o5L
	ggRZwrynSxeTRfp2y0e4hlzIFLqt2cZgJplcrVhK3VYGmn21q6IhHk8iwEqP9+wU
	IqAItdS+/LkkgSjtH93JGKh6Zvun1MgKDyI5JLQW3Zs5zpyjA+Qa/5WqE/Hqh9EE
	jfbqev7wGhxS7LRXoWq6nkG7hmasKGBfBjWUT09FFLEgP9vlhCBhHlbLJ2UJQNhE
	ovqzoWNq2Yn+VhO+XQkoWYAvWg9NpzU7XMPw/FS8DoLbfmceh4Q4XIiYaov4kk9G
	z81m7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94g4bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:12:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ffc6560f05so3883821cf.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 01:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949924; x=1768554724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JC/2PIARWmi4kmr5mYkW0IX6da9jvU48y2O4jH+wrng=;
        b=gNUisVBx4/4XKSVQZjir8QSzpwRLSNWkSuipd1OsqznTF8l2q9zulA6prGvrlgcR6r
         z7GUJPeLWdWcUKm8wuIfrFFcLXaeZyiWR+mgi8DFZLD6wksSbjVVJj/hvSjQ8uCuCzRT
         sJ3h0xbyanqptttk2Vc+XrD9E1kMUc3qjUN8BtED252bmDp3OCI/rHhgz9jbVn/djmSf
         uoWQH0uhX7FFT1odO39I7bCKZ5DFUJivi0FPDUpeYFknsmH5YZpQpKUJ3++oZjJQtPJZ
         UtleHYS9q+YNVTA+YLt+mfnQ24t5QqLl1YHqJCtfNeJSJPOs0JBQTXRBTUZDGL+e4EDl
         yRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949924; x=1768554724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC/2PIARWmi4kmr5mYkW0IX6da9jvU48y2O4jH+wrng=;
        b=XWj5/Dx0nfSyPIY99SMPSoE3SaLXzcbGKmHu8XFQnZeoKC2GhMyLa4SkpAdXW+UA+1
         +B3dw7KqCLovEMd+MKh9x+QCQsYtMzf6hBC2vlVcFDdgf83W4uBwzNowDp5iMhtQu0h2
         3nNWE8EzxUf0X2sUl7Oy+DqIAZYxUwsDDQBnaLuF5h9Xj7JR0U2y3OCf6Owlvte3dOFp
         G+luAtG67r/6i5OtfgAIs3ZvPizmEmt/TwclgGVuI6VIYpvQTQlQGocQ+AykjCxQjER8
         Jb1Q7dc8BlaPA0d8mgPlakXn/vWYtGrsec06TVxL46QB1QdNoVLvo1DTtVkudmsRfk06
         ezyQ==
X-Gm-Message-State: AOJu0YwQnY927xRjEMUJQ55H3VauVezIvDe6ax1m24sERGfFDJn6D3+J
	9UhZIzTuSd5T+jL2tWfjQpCsf6RTLZQAz0Gbukex2SimK3BCeHMxQvkV9kdVeb5/arZR/GpSUEK
	Kt2xDv4ZelhwMfECjagl8SXrWW5VEqKm8XO7XeBRDtVcmJG4eqRaSuJ4mqc5pMy4=
X-Gm-Gg: AY/fxX53PRJK5tx305MUaVOT5kK81Cn8r7pXPw1IEJ2SkhIZD0UXqH7P8uYR+DnCfNa
	iWC2jnzH12gbyQ/Q/8Qi1E309VqgEBOtphvGbdjOcnXHsSXyZUwJou0Pa/lFWqRAZxcIBB+zFDB
	oIWgwr/sMR0DTC4VBvk0vmRuohflQXv/i1GXLsNI3iZB8t6PqGClEDthJ5aIz+GuV92adiEsWWM
	yreT0Sl1bOOkbwBv8zscKwRNgf55xG92udI+bLaeqw0ZlsnvzMi0QFnUrNhZ+CzzkCdT5wWtFSg
	AbTzFGI3MuL7/I9VSVlXZIr6rMj0FepKSVb5AjlokOkn1/Rf+ZSGFdIX/WtaQ8Fc4Mc8hScsmF/
	Sl22OXAuMINzHkJV9FpOdc7tCKPX3fesMONJ1Q7mtkVaKqcd4aTvKLIjHo1GgcNCCZBs=
X-Received: by 2002:a05:622a:1391:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ffb487fca3mr94824581cf.1.1767949924363;
        Fri, 09 Jan 2026 01:12:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa+XzyPOQmE9cIFXniJA5ycEu+R15FVpb05dTWzpy5XMbGBla+MEJ4uThrEO7lxzqFJKiW8Q==
X-Received: by 2002:a05:622a:1391:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ffb487fca3mr94824411cf.1.1767949924008;
        Fri, 09 Jan 2026 01:12:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d508csm10938507a12.13.2026.01.09.01.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:12:03 -0800 (PST)
Message-ID: <cb8b5f75-7fcb-4018-9785-4fa4b5074b3e@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:01 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/27] clk: qcom: alpha-pll: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=6960c665 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: IGqJhzyd6SDORLzN1z--dSorcBRje2cD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfXzYte22dK+ttF
 AkvhXFMzGbZQyalj6+g4cW/wJBYLiLuBVXfbRDvmUpm9KuLsSNO7l99pAu07oFRrEEpXOuAWrRP
 TuNJSe4D/D0PdJb6f1U+86F/4mVVHgkpYsHVPQmO+cX/Nw0dT+cizy0RBFIZzKVEXZfQmyxKVJX
 OfBSrNqzRdaMpvfgjtq7gpD5ulzbNFRIbCWpN2350aGVTqnmQEoazYj0IYBUHMpudzDdW8rnQH5
 X3h4fEYNhVmBlS1fGLe0trasisc0hYKXShcHhDuayQa0DQjWu2cf2wqToPkfFMDJ/RlfNjD4DXo
 k9Ys97TL81SiKHhZ6Go5vkaqnjZCSJ8pSm3AeFL/JSl+4d4ouai5T+bmQUFBqWV1eWtAygrN7pn
 Okx06LyjlyFkTDOgevea4l/Nzg7sfcvjuheV62NnQtMlmfU06BmZPZl9o1iiwzt6OZlwRwlKVPj
 vIIfd9ozITt7fYNKqVQ==
X-Proofpoint-ORIG-GUID: IGqJhzyd6SDORLzN1z--dSorcBRje2cD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 0e56e3369b60 ("clk: qcom: alpha-pll: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

