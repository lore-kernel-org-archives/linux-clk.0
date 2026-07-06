Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF5432BFE
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355815; cv=none; b=EagQLVOKNZVFIpT3rTYH4oxiSiKw0MOHBaCaI0/Gun+u65i3XF5dbQi7rfkQZjKWePodTZOaNZz6MaTuJaF5RBTdz6+WvxF0YplQja1w663jVvOYvSPDcLBwe+eULbt4Yt0bkvSG/M4ET3PLqvERTVeiTtoEl4NW7jaOEXTnohM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355815; c=relaxed/simple;
	bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kb46nQW4AjZ3I67rlJVHDR6CcWIwjIXPKeChN/G8f8eIXf39kRxLghmZpGWb/yJzOXWRcZZblB9qkT3pbyP4Hvvedn1kHNkdw2Kd+gRjPCyl1K2bawsvUT2HZJDsc3ikjGLCTK7DuMkEx87tOROgpFpLEI51peJLXAUMmwyq3D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+kE9elW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVnUc3v1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+kE9elW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVnUc3v1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF69l982443
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 16:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=; b=A+kE9elW43k3JhEE
	wG5rxbGyVqiu2EJsjUp4w8h255fyh8Sp7V1w75SG1Ng9NMOdpwAOQmFB8YKd5QjU
	d7HSNSGLcZaVU7dC713562ldZ6524HIU9eTjCknQ3KlIdtBzkUwj4nGhH9tCg6Ro
	rmCpvpmSDucwm88BxcOV+oGsUYlUaOFo0KNIwnZJ1O/wvfe1FeYeLcl9poOZwNmL
	RqZYuT469qkFJg9EG1djaMfkTW0CTmzC6c19Z7jY7BAgY7gfmOju+N2koDZjgUhw
	WLyE+QaDhqQvpN6lbTAdalxfKEI9w0iWF56xBTM87k5N2fLk4qexXlL8+o07U2Ys
	f5UTEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qphxvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 16:36:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6cb57d25so98969385a.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783355812; x=1783960612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
        b=HVnUc3v12Y8jkP86s3ZduFwZlRodhbGOfnUycxAuo8zyvRc+gMDxY7p8x4eEI1mWzq
         AQxsCp4CGXIUEHkZOo9QXGdPT9n56LZhV2PaFQeNrTFxYkKlxkU8WxUeFo4e6K3snsQh
         9FaJnEiNq1uvwVal9RIg712H/4W9SqpkxDsD6IG4LD4CZuanDKCMM9+YUuBmQopdHYt8
         nC9IixDtVDe2h9qk/oTJSq/un/ZgfTb+XkJVa/aobPL21KkJeXVkuPQUh9Me3wm7V2Za
         kCmN6GCCqRAoh2tp0Fz09uXhld9NK4QRWHHyNQMI44sTriJrBQ4Fnp8QEE5/2hTpkMmm
         CZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355812; x=1783960612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
        b=oGvueDEGyzhWN2UgJD5UeIj/Fkxa5O7pSvUEyN5Oy33rguZukQhDCZTeA30chiI4Jp
         6aFtb8/Dyxj23uQ05mslRWhYl/PwE11AMTE+W+FMZkgIAWE1U9SNmQDudtGSZE2JO7mz
         Lc3v7nZ2sJHyumZS+GcGIuSk+HbSR0AhLkXs1+bCXPmJ3K42/ssN8dy4QqN6SxUTiG7z
         MCe6DvvabWHoM6g5StP4UX0TWxV8yInFYPXewPJvTa15UvNpX7etfUmkR7xDn+Qmq+ZK
         JHGNOvyFYImgNqykbZsIbwZiH/re/CEOJEKBByIuFsuE290KDFWnPFwBPvfZTp6rExTa
         flmw==
X-Forwarded-Encrypted: i=1; AHgh+RpXsq9nvQjfruWU1AOc23mEyCnyjYNq/045DSCkd68uhrTK8y26Ek3n6mhfwf/u+kGVyUXVewm/+GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhD2eqhdQXORu7plN1tZih+2aK2lDm8aHUUeR0M1XHmR9qNc7c
	k7mrnjh+iu9DTUzU8UobxWLBmDO48mc3WE63zDD7uAuk6nAzWIWzK2ho2kDb20xrOHG5R+3lX9R
	oYlrXLqVHUYu3DCZVDAiVUrpXe66GMWrEm9KF963EuTU5KpSK7a+LuN+pR0P1afw=
X-Gm-Gg: AfdE7cnpkuzNsxXiU5TfCSfmcwl/JUbBLzQ1TwPtwvr/Uo8NiuV0GWHy/yw64pn6xCk
	cRqoE3GBnaQlgcDutKmExhHuthIR5uNSuSQ+pai9pbFn+8gAHPeCRLZzLVzI/qMjhk4hakjniZY
	4L3eJQPzG71n3JvaT+Llpn8blPKylPqu43GNTuNLz8D9DwARCoHkyRSyTT9pFL6y8YzuqkInYup
	BcQVWAC8kN1pVQcOl8nMmf4Y+XTURbbM294JhJ8RQBeZYP5Z3071rlvH8eAuueB30ISwNIyN8pG
	wGvRez/Wv3KwpklPW029/bZv5c7zXmYrr++Z6NKrTAlBa7guSCKrVsu/uPkym+WwXav4jYj3bNX
	B7zS549bkufNi5EINxVJYggVHOhyyxQwPYOU=
X-Received: by 2002:a05:622a:7:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c4bdd7802mr101176621cf.3.1783355812377;
        Mon, 06 Jul 2026 09:36:52 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c4bdd7802mr101176081cf.3.1783355811741;
        Mon, 06 Jul 2026 09:36:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm4668489a12.7.2026.07.06.09.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:36:50 -0700 (PDT)
Message-ID: <7cfbc3dc-c1c7-4e4d-afe4-67a25084f607@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:36:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for
 QMP v4 DP PHYs
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
 <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
 <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bd9a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F-ycRNR0_AuAsNl2EYwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cdswXIhDROKW2r1gSIQ0KtmYuSMj3kCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2OCBTYWx0ZWRfX0mSpDB8S5Ll2
 +3r2n4+nCmsi+YP25xPgzfYNe5heRgGO8DeqBS8BkmH8+c4Ugcb3pIZyMcohlwkdHuDHLQ9qvuW
 NtX9guIvLE2xG/WoCHi5zS7SxHU8nF6OiJZ5+SpQ8H0pzpfyBNn4VBQ+zhx1H1D1hrw1f9GVqXM
 FFPXFDrfIVS4j/esUzXEJotdeTFqr9d03f3lLu+obpUmQG1qR2v1CdEO+ht4zXf12rd3Hg1GIAm
 dUaEVJfcO3z8dGbzpsKeXmo21TPqgQoHBRxrm1oaDF6t2c+Mmu2Gm/ZscXvgP7O6TyMwlhP7r39
 N4J6u5kb+pYxgHgyFegoQNJuuJnPNtrbNa/7nO+hcs3ezTq7XHqL2hvbC9uZwZkVl7wTJZwISJ6
 RLZRiljztTqoWEy8SO6QlDnMVTsaWj2QYywyhEcJDo/Qlk8v8lOIzWOyBtx25Fcib7NBl8TdOH7
 yEBGomGT3KXLNHcI40A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2OCBTYWx0ZWRfX2E+YN/3F712W
 qkbcg2mz0DA4kqYUYVSE8/mGI4lKOzpYVhC1u44Ahyjwaz3E5rxdSnpP1Ep5CMXw90q8KxfUteH
 x1gAIMnR3aEvlNAcMz6CAo1/DeAWtak=
X-Proofpoint-GUID: cdswXIhDROKW2r1gSIQ0KtmYuSMj3kCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060168

On 7/6/26 4:44 PM, Esteban Urrutia wrote:
> On 6/23/26 7:36 AM, Konrad Dybcio wrote:
>> It seems like 8350/8450 should be using what this driver calls
>> v5 tables, with this fixup:
> Any updates on this?

Dmitry, could you take a look at my findings?

https://lore.kernel.org/linux-arm-msm/4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com/

Konrad
