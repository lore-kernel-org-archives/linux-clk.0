Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4643E715E
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584177; cv=none; b=JeF9WoP5KYMKDvR4sX9hgKz7QzKgSagPMJ8IxoVBMwMIm6SaXSMmrAVFP8YHn2bKPHv+Ai7iuESfUtiHK/OmgO/i5yeejMJiUq/gNxHvTXSiWJS9+RsFNYJoWu3bz+2NUfXpBEz2FT4ydBxIwBgzYkIXNzh8Iz0LVUVt8MCpNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584177; c=relaxed/simple;
	bh=th6VsRmCyUWpAmJ6vtGjWlM3bSzksjN4Y9QWKTFE0q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/98LHC2D6Qn2kIHydM/gYG8Po2oRtQ28Cmu7guUFHM6ASzvTFQTm30mIZxLMKOrzBVXqCxTXH/Pks34Gerl8NBVA52pza7kEOTLXbT8ugfVtBU0qEdgjX+4iyI65Ddi3bbpqTg26YpX1jdq9wxHqP2RRBABwlP9GOBRiWNwz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtGf23fY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyKgMy86; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtGf23fY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyKgMy86"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669603Vg930325
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 08:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	th6VsRmCyUWpAmJ6vtGjWlM3bSzksjN4Y9QWKTFE0q4=; b=TtGf23fYdcbuF16l
	lOCSusAEupkK6SX62JcK0v9HKkdBGvbR1oXD+Hx4353WNsuESNTBNORWBflM6LFU
	zG3RirmQcW4TpSYRok2FNvqyFdkTkwZyluBSKYdpokRwPw0fciHH+AXfr8Uc38Y4
	XqrBiuhWHMzGWEvwaVMgv5wW63AMKZQB+W+xbRWOjatlVTK9YykJnJNlO2DsgilL
	LYn8l0StSooS9GdgcMZa4vR+7eHkq5QohMiHxPRwHRD9qor/zRWWE/QorbpccVT+
	asQi64Q1FwMShDIrdhZkBEpwxYPpOMkcP2zW7U7N9bTTuFHsrhATYNd76TpRMJhs
	OpPHgA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418gw4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 08:02:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so4382911cf.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 01:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584173; x=1784188973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th6VsRmCyUWpAmJ6vtGjWlM3bSzksjN4Y9QWKTFE0q4=;
        b=cyKgMy86Fnm860kKX9X+nmdNv+uXxL4zJZHJPBPUIxtSk6wGj03Ta0/G1eo69seL0S
         yvbsKLo6snzf+DcNDkJQWsrb7Og2/rEVanjmZHFi4b6HBub1jp1nOv8ppHeNE4L3AdVh
         H4Z5nYf8yycO+8MRCuvf5gthf4kf7rAVgrCkXs75b91AIzrhV7tO5NILPTbGJT+e6C0H
         ZI1pbatcrSHyg5mPMS5HdRNx3+TO6TpXAaSk8FE8uMm2nhpi7pEDCjEsysKCxDf/ILmE
         USk0SBLnp2+hwUdfzo84wyKPOtTrluyEkAzUyaqUozg7Qt4VO5WLov31DXQnBuaSAagl
         lfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584173; x=1784188973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=th6VsRmCyUWpAmJ6vtGjWlM3bSzksjN4Y9QWKTFE0q4=;
        b=MwVi3X1wrCGvMizipzAogU/GwMZx9Zh/I1Ejh0UHNjHtGH/TOvLLSiO/dnnn9LOGM5
         XG9SBaKyP6LL2j9OwJFYYrzCaFfX3Bp91MMMVmjrwJpnaQJ7TDHG7pKHzbfKPWJvvyMQ
         Q9WnnrCczm9hgiymXHXY2NfeEvWLCiLtybWv44MgoT+eUv/c251P5ukgYqwwME2iWTFJ
         kSuWauqNKMoETBBTH05M4UiZlbpZK2bgEiZIdzSYGLQk/GZdGtiLYvVjtXR8E3ib9CD6
         cRmPg2mk1jJXXDLfcdWLIg2/DRB9D6rnVvN0NYj6XvS96GE4f1EpYGNUlconqYUi8HAr
         8n+g==
X-Forwarded-Encrypted: i=1; AHgh+RqkUte4/XrLkZW/O9IDZeO9e1KdOG6GOEG3XumjdTLJbnjB+YASMkc367FKCNfSXnKolpPJbw+WWt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwyu19PRBtVXrxJIk1DLSEC5fL34rvQfNYWVY3UX+zNohhVVfv
	TZSQX8AXfCfTgVs9inZ73CHIsa4kSpVd6wnl7E87GcF1aHD6ytkuuhNn8znNZ9sAKPSzdby9sn9
	WDWvDwcSDh/1dp/Fseq4+vxNRjxVQ6sWzjVeO1rDJoxwcvQ2TDATe/HIUB8RSOAY=
X-Gm-Gg: AfdE7cmpJDsGK8sH1LblDfzq0IAefgFdOG/UwKXagN6wd6yfFPpq/hoo3oz9ylP9Qoj
	oZqSMOl4zRS82a5GD7xz4M9LCN33VHGz/TrSK6hcbJrrt+V2KvOr10JS5c8xq23r0xoSDio152K
	YVjw7wfkVg/5XBFKm2Tv2KAfhYT3sMPOEmN4JmWuTBL2GFUwK+vuKl2qPHKEKrAh/R5CJEltKv6
	jfQHy5AMzrPgpmsgOC6AVyIGfpm+oDVh/7CqHRkRkepeuE5QgrUpRml4zL+1zavL3xDbnEGfCQn
	7ANxR+jz1h3DBpZdiNXxlZxrfgID3dO1i3C8XGtydIeGezyIU3kwZ1oPwi8h33pOW3KZ7ys02w6
	+xkz/nFgtafHmr/AnqWDhvZxXE1nMh1A0Duc=
X-Received: by 2002:a05:622a:1303:b0:51c:857f:9c1c with SMTP id d75a77b69052e-51c8b53d07dmr50481511cf.11.1783584173078;
        Thu, 09 Jul 2026 01:02:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1303:b0:51c:857f:9c1c with SMTP id d75a77b69052e-51c8b53d07dmr50481291cf.11.1783584172699;
        Thu, 09 Jul 2026 01:02:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15df03dccfsm114326466b.62.2026.07.09.01.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:02:51 -0700 (PDT)
Message-ID: <7a378b08-f157-4f56-b938-258b93af02ca@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 10:02:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f55ae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yNdCUKxxWRXvyAEpCIcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NSBTYWx0ZWRfX0Zri2M+eaLuv
 7kRjkBtqGRnXJPndgHp6x/yzw/mAyDFKCurQ0kzKZHorFB0R9y1ogBNTRD6y5reAn4Ta/bJ6VcA
 GOfWiKHII9cx3DY7dYKvk0ssxIa0hiaUJppt1f2Zr/qyuQI+La40sKUao0rQuxDTCM6/lXJntKN
 NSyqVHdGxHecOukeNhRjEoxjSsdYA4nP5cVk9YNjzbK5YNVs/bpEbJABKZ137y/8UaRavka2xEW
 mUMaS4SEXVssiLYxfFEsw7QXtVa7cJEevzn9Bi8Fi4uuy8udRUiOhAYdmOmiyGVGYeGpVe+Zgae
 7yyq4SVBM8g9beU2czAeW58HgMhyWvHD7wr1sG3xVsqt3e9LHv9zfA8fbk2N9ZvORO0zrBX6kej
 RI9R3MMuQg9tfHF56aDgWWbNhpLc+1UlmzM/ipe9zmTJmkarDyWSRK0zt3yloELu6z4sQBFhYsT
 mbVTfFcnFhRW6fOdl6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NSBTYWx0ZWRfX/XKiB+cXl3Qn
 /MKptdyCRpYHoxK+V4WJgWqLWPYI1jnphNfNBg2GZD4zl3Jf7mRjR3le55MR6qTVU8pyAyJFa96
 nr6gVeTaUfVryZU0pW3ePywhnRosEno=
X-Proofpoint-GUID: b9Qhpb2e8ya5dd9uYh17srjkfmUnNi8M
X-Proofpoint-ORIG-GUID: b9Qhpb2e8ya5dd9uYh17srjkfmUnNi8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090075

On 7/9/26 12:30 AM, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:

The splat is huge and most of it is unnecessary but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
