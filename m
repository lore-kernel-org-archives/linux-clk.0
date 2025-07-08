Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634C2DEA89
	for <linux-clk@vger.kernel.org>; Tue,  8 Jul 2025 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980143; cv=none; b=k+a3aQbUXv5BEjlW6sePweVedlmRyiK6Uej4XSaoQcyzCr/iEYXASOowrorYnC3L55UId3zkJassuJv2mMSSGVJTaaMFFeZIXLGsVAjrPJYl8T7MHHT8LNTtWKqZhMqDG3/X8xyN7qKjl2pYZbsdQGk7JlsqEBcu7+yRgaiE9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980143; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kz9oBneu3rBIZMU5HTHVdANJeVWOdwTQUzKq/l8JZBOOupU+ZmzXfWvCafICuaReP2tnH4x8jCynrcw3DpUFscyy70woeKhvGAYhfatdtJv3mAeXEfBfMBYclEEzaE5xZJf6MAtnx47sx4hknn+pNJnS9ztdUIB+HfWxPWRJLXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pupCTEsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pupCTEsZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAPr4012140
	for <linux-clk@vger.kernel.org>; Tue, 8 Jul 2025 13:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=pupCTEsZWKvwVFaj
	Fq6QywPPikTVuTb2opn7tBRmUSEnJJECoHJ01EtmgUVbLxLOaD075yS3vjJbXjIy
	eDLtOVvY9EXDf1XlS1m4glK1whQVre5XUxKqevxPd1z2Am0ltKXyNEGJV5M8HJ6I
	rDuNQ2aB0zc14xIOvLdnKnsree6PHxThRxB6eVgnlNPXkPZCGPZ8dUBWQl8EkfI9
	zcEglYLLg3fwOL5LnZwz46mYp2T91EJWAs41WEDy9VwMEDxaNFJu8vg2w+/WWyft
	yGYHLU8xAXjoy2eXqbmsHAa3tr2SnaAFG3+pmv5hbErRZVMbrPx90pAPYxlxbENu
	BRMTYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97nbns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 13:09:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso50811185a.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980140; x=1752584940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=dUxtMycRHD9leUv14DOfNVwGumJMFpfrLnk8CsgrDmbrEuzY4uiJ0YbA5MCZdpuBzd
         zBMSzwhlVlaQyJpfNOhVICWF/Fd0O9q1qX7uL7LtfKOiNISUbi5szQ6rc+q4PlD6zANF
         sRP6gssjlWl23ihRHgynKCoRb/y7OUv5VPsHO5dDHLOe16hA0fKzIiOulDQY5hXkp05s
         y6SfbuAML91NikTPefLgqETWvOqYNzQ4LzLZ5rdFCTDGxBYPqT4Rzt1FkamWvd/UmOvr
         KJ1b26/693vvDVdIwfUFfmRAjvHeisZ+PBlA7wwoWJj7fbXAEmPUQ0byT9Tj3kqwQPT/
         /uDA==
X-Gm-Message-State: AOJu0YwVXQh7GhCOgJrminlQ0lcQE8N9pyoh1fbnyTtdDa/onbAo6li2
	qVMJXACQu1Ane71Bmle9unzEkd972VsquQTH2+CzpjLNHs8Elkc0PBgBUpBrMGon+u+PrksqIA5
	Spj7hggs11RR5bVn7qgAb6vZplTTolXBTs7c7AwYrp4fGozCdrf5UKtGcbt/UfdI=
X-Gm-Gg: ASbGncsMIJCUcaiF74uNHNdQ0mNGtWArlg/jYpP+URvYKZ5Ob8byM35H+liu17nJqXx
	IsOKihc3C2Z1zreWOs1ouH6VZch/gk8FKVhC2mkO1ZYsouHvTGxWMdQHBphsUza726ASlJqcgU7
	rrIM0deWjs42YpVamFq+FUD7lBXxIJNKXxVTR9zRMLOH/s3dPFTXKaiwutVi7IRLMwuj4ebjJJa
	/TunCm9WYfkYMFQ355KMwvW41ItB7tqJyT488W43lfjQ5Un2GlGOJECLmPOlOc3TFLcXKsRFvuv
	M6+s3CWiH8uwdN3D8jVNFxvs0bqn2YijFkCtWSqocbVu2Oy7gq2fhpiBPjIZcR5xOfd9O9Mf7V0
	uHl4=
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr765451985a.11.1751980139578;
        Tue, 08 Jul 2025 06:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSTsfzmJAfztbrESgmPdNkncNaz4K8G5/fia2Gnn0NF2orxJ57CWlxeDI3ewmnGQ+XWEqAMA==
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr765448285a.11.1751980138638;
        Tue, 08 Jul 2025 06:08:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb726csm906327766b.179.2025.07.08.06.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:57 -0700 (PDT)
Message-ID: <3cdef7db-4835-4e67-8125-9406a0532394@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] clk: qcom: smd-rpm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686d186d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX+dLKtv+Rc50I
 QTqZ4MHACjsbrKKdgN6UpmSIZfaxqe5IuqSZd5epxC/kM7vW8RsnjD9Je8R2hau6zqFgxMPe6fy
 tMxerIqh6BijPoInCTm2e1WE1rQPy2RqgA/gR+2m5BCjNjUCxwTMro/pYUNcBh5pvV+piFY7mES
 80tpbbif6eabhpv+ng6996UxkcUH5SHURkgzwdfjr+mZudHXH0pTH1Kcvk3ApwLpVHO1/+4Kt6t
 /ojJ3P+Va84QRp73KwzvNM+tjBbjsgn5lMgxYZPQ18iHGRI22hd5ehcKxZJxfQj5pKG7aC0Wu9Q
 DHl9Yn5gmqXrPQfmy/s6ypyvNeHGnCHd+gNOuHaw+Kew0jDjF2jkOlSOYyLIxFKYoXvWI/BCdv8
 NKfQ+QbM1pKmHpsSAtAR/YWezmASz2+UfEVD67XwH9RhdZkbAtSFKmWvgqsKPzFg+Uwwbsga
X-Proofpoint-GUID: bx2i4wmK0MU1Qj6vHJvDPSENp8KKKGJ7
X-Proofpoint-ORIG-GUID: bx2i4wmK0MU1Qj6vHJvDPSENp8KKKGJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=798 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080109

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
