Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54324886F
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908433; cv=none; b=a7hZ8DLHpAkA8YJt98dVi4y19khegOcmw1SGG6QeIGdMwUOoYdXQLphZ+4pO3UeFIUlVUCPa/9BY8AcMYiqkZfDpALtEwSdYvzKK8gJ7xpAsO/GNxw/6AyX+py1ViMW9GEu+8o2cVOXHkBRrtP/23usA2amw534MfIvm2gWkmUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908433; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tl8C8N5gyca9qRy0CQfe08H7vE5XLvi7ady0zw3hZ33DSqxkZxn2FsTY0vfUeyLpJAUo9/SJzL710gruVAWiBeOF8KMGcaZMS+Qy+ylQOegW7ahFP4pKG/4QxXdGconeohEbH8WDWIuj1HGoZEp5F4t/BYejmnhLD5LdW3ZeycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5kDu+Wc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5kDu+Wc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBYJ029228
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=Z5kDu+WcZfL2dd11
	PgqCrzZRc4uUMFixmVOpyzB3rAo0AkBV8WuLjnKlPJy/gRNVEoQFZuhdGi5cBPIc
	jmQL+384QDMrL7SA+FGHcUcJSd/pZRzHRDNIHKmgI0fUFVcczcs4jx7YCpJu1N0B
	/nocx6w+j9ptPWlOoHymd9PO6JGV97I5wJh099Xrxuq+YQGFCaDJzx5NX+Xwe5eq
	aLUCr5fHKszEnTHK/Y6/2c5KnMFBSPCAeDlMleneI7jJWg+TgicWGfY3+qgRAh4i
	O8UNg6AEEmkV4R6U7nj7wdwB9QABdVDbeMNSI4Ox7JdcpCRhJCrHkeeDf5zB4M36
	Tm4qfQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbygk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7073674bc2aso16586666d6.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908430; x=1755513230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=pkBwgE6nN7gRA0I0GHYuMdxvSEzZVxAgzBNsIIz19nNKFmhgKuJluUElldH16BGja1
         tqTeZ1+w2Q+HPsJFhBf4M2yIKGypQ5FVxhhrXmZvUJcCjv1XqCCOKuFH8QJhVhVtzM0a
         FXsUsUFDZwrpZm1fQAz39Zv6ZMvEx9XKfW2wqsTlNpK7undvV5eOn773/cXZY9WkwCG5
         KWADpk478AzYilF2+nprDJiYpArFpROI4DDEGyOt/HyEGpYCv28w+X49VssqfH9vOoq8
         FuoxY7LqpQjJhMNB/bZzqhtvUuCMMYDhDcf5K/bicZMO4w8Tt/8cmDQPmHD7HnK7QfEV
         kL2Q==
X-Gm-Message-State: AOJu0Yx3W7FHHOn5BdCrZCwwAmsp0bUxoRiVIcTgV70abquDqkFxoTtV
	y1oNL/cFXGRDmAa7PQeOEhDSsYdLLpZh8k7K2JSXxPVSt11qnBAqe7JyCQGcqyyk0mIpez1vJEM
	M6q2nI7+gAF+fm/tvicYMjb3cHd+O0HDKRixZ6ajCSmw8CR8EawdgB35WrceH7Go=
X-Gm-Gg: ASbGncsThvUJ670NmqQzYFXExe+nOu1tZ5gnng3t1/qA9TYkr8ZaXAN53mYdayVjOIL
	dhOIuA+HQbZI0iJ/DRG8GblxuTKyFV3XcroGJ40rXhMmq4dDWlblTYKL4mDzD++ok36g5TXWAgK
	wT4htL5XPLhyrZqr1xi7emXF+Brh1bgli4EcjwmYJG6N0kQLvZMZkggx92wdCuu14WeP9NfuN+1
	Mlm3VOf8oFK3NhbpBNHyF6wJLRUi7qrwq/cZ+4YzByQNlT6dZbE6/Jd6PBfh1vP17EVVKrlyPTc
	FSIUwOcyUUuFlsJUaYdk3EkrjFt5RlPukNke6cPtgxbtQnQqb3/JKL39w0a8xY8LaisTVBoxXOs
	r7HV9B4fdccZSMhNMgQ==
X-Received: by 2002:a05:6214:2128:b0:709:2279:ae38 with SMTP id 6a1803df08f44-709ac13197emr60600346d6.4.1754908429958;
        Mon, 11 Aug 2025 03:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwOzDhGMWLmN2i3FgRqYSnMd1Y5AQG8+nCHVP+BeNYZ6Jxlh5UsiiwFp8nO+Ut0MqRtRL5Q==
X-Received: by 2002:a05:6214:2128:b0:709:2279:ae38 with SMTP id 6a1803df08f44-709ac13197emr60600116d6.4.1754908429253;
        Mon, 11 Aug 2025 03:33:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:48 -0700 (PDT)
Message-ID: <caf2cfb3-0076-47d3-b663-ca2c1bd21c44@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX14CdOTBo9SAb
 ORdTDmGfxvy7sCbfUHznCOUooC3yTvY45bMOG7kDjRYPN+sXupLzGc13IUBo/xJ3PIjISI+eN46
 iqrvhbWOy5KxmOGEVbGcAgugxSHkxstzaFjEY+CmuchFbC7e9NR6/7REUTU0LBqyDHAnYGnBAks
 bvdnNAA20Fj7VYmB6eZeEdLfg/ksytuFvvm8NGrSevBZR2rL+zkTnl36LDSKMXL28tcBai3LY3b
 TKuuNynbo1G+gtfCdgH7pW7Fbmp8Xy9ZMay0oifI48E+QFfKUjbRB25UzmDUJ3a69y4RyExh2kC
 klvkze1/dMY2l0PjVOy9t0oUoA26H3WL7B+Yfot+uaS7HgvTXF2IIz/Mu1bX3x5Wy34DFVQq/Cc
 VDto/OCD
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c70f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: gkbNMNF-q7OqeFKN6iKVki5HNvL04Z2V
X-Proofpoint-ORIG-GUID: gkbNMNF-q7OqeFKN6iKVki5HNvL04Z2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
