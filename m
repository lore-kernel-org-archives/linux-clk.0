Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2322430CF4
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579746; cv=none; b=Bv9SJYRpCFUTZyQhuSTYk1RJwwi0Kg98XjLdQPcpuCy1pQ7Thinus03gxHoee6t2DgBbYHb6JhFSa9cZdoUdjdR+tj+xKMKraiRZh49VLZ51Yd1zukwnnfdT07mpTfBPNvZYsjFSEho2HIkcVftb/S5i9Qsz5kMO2kFNkoK36+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579746; c=relaxed/simple;
	bh=+qv+TfTQ75E9D5fgJmcO2yIFIeUhqe9JoXKjHwH7ycU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXeKRLypewgkn6x6l/DsmWUg40wanvebzaf+sX1I24T0F6yZotn7IffA/fpkPzR9awTq9YQ7XpkcMxaGiecW4FxoYYXKDqDlFc0be444Nc8EkvOtGH+tkbp/5yXhabQSLeCLPcBvhxXWcudZr5Q4Bj7X7QIHh4pGJtkpNzUlJMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4HFcVB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwHXzKfK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4HFcVB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwHXzKfK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuubS2480196
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=; b=O4HFcVB5Ki9Y0e2L
	zFUg+GbkeUJyHkdWRqQ4OYeFP5Bl3Dt4L0RPUf5Llck55to3FvwdI3ouBobTTRC5
	RAH7rK57OtdJVZvhME6Pgp3Ol9qUR+3yPO7l7ObErQz0zL8FsqiqM4eQfr6sr2v6
	P96rss27FQb2hY9e96z+YtMSGjqIMCp8EKVJlpDqgqJC+GX9VNp5WsViivuiVb4u
	NSZzomdZB0B0JIBFF87MIna92h03om4MzWMnvFz4nREhyX0bJsCnxk+/A2dmHaQr
	SlchcGm3gD4pyAAcJcToGhEb49SzWS556fC6ksXtq2BXzaluPQ1bf1Wnzzgo91j6
	iD9GUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsh15n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:55:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ca37ce4c3so6550491cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579743; x=1788184543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=;
        b=PwHXzKfKVKoYQ4qRd3++Qb+OgnTaACrf1DAJP4i2gieS3kOE47f3dzPh2+ZDhJDF0/
         kC31PTsyPOLw86u59LpkDnWhnjOB1LX4TgYaGYX6pqkZwDQ+vHg4cjn6OKSaw4UnsizV
         75+/S9yn+hooTyJU7lUPV0pwzY/x0zmgx7KPdZRyZm7dpu74szQ9Piacv6s7fKcTCdjq
         C85Gy8rgVv5a1h104vr6IlKrgxPmkF2PZIAbYkFEH/JOWGnjBJGy1zIq8Uo10sbEy8zk
         L95Hlpm6X6rXLPbgOXvUwdcAyFiMGbP2NBK/zS9KNcFrcaDgNrMtaCWdKvDgUAgjr6Td
         5pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579743; x=1788184543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=;
        b=cSii60BdDwcCo7eLUFl34bMQW8C35Sl4GqEJIz68iIBIlW4FBuQ4COmO+cSgDTdZuQ
         yFlfBaAuOBlTtBoNKo1ERqMZCJ9vLolpQqihbswx9SJz6VJtW0FXMZreq5IFh1PaCM0n
         IQ/b46zrYa4V+vwFPj50Xbr+bILgvuxL3/An0DC/c0ipa4Y4x+zKQ6d4ww9QbCKbClbD
         4Yib5VLpYNK/yddqrlzOkySvI0TN+2kuRQx/Gj/cM9apkJbOUKic1CelxRngiHW6lSIL
         zI+Y2LNS9fLEHBclyYkwiG7WhwL4NaIavg1TIgUtpIcW3fC7/rIULg1xvTUOOf9HjP8m
         8LCA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/ciMdHXHApoT4LhIIdTpusrIjy+dqErHLETZwhNG5UuUDCaP66qa1sAqLgtqLxDJyUMFZ8wahv6I=@vger.kernel.org
X-Gm-Message-State: AFuF++mBe1S3GrL3R9aCGtMe8bekIi2gYg6h2pTxLKIOzraWs0cao674
	geGYxC8EHqZwJUB5WPS0qZKMSgnZS/tx+I+EeOv726w10MIjJnfg4iDIY5DT2JBRV/NKJfSzlIY
	ehxK2ye2anmgj0YzBuVm4j/G+CXl2zQ6P4AHYpfJ28GkvMxHLVBQwCW2MtvSdF1k=
X-Gm-Gg: AR+sD10iSE2zMwEGYJAcnx0OUCRBwaMCU+5kdae/S+sIxDvBMmDvFm5+PoVFJ8YokKa
	9m8vUeViLkya1igbe8m83lassBzZqtXUChNwIHoD/UicwB+cdmAizK1+7/vxtdR/6gouw7KWk0b
	X8HjBXb4qqrfw4jfX2g2Md0AcM5lrvkrKAlK/F2pxSad2wLYAkry3EvsFusUOXSiA9AatUQaqx5
	tDjvHEIp0AvAR9X/BmZDmTah1KgzeVCUPfYrOAxIXvr6Jm3gKq9AArTwCZOdtBgA5p5VTe0ILp1
	P0xi+koLEnYCXCZuCx5efSeRDUdhuUJ592xqfmQ7eaFJf1YwUvduNU/EaITP+7OfiZm2N2UQIyg
	PkBC40nDpao+tgvY0BS6b2EXd
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr196841581cf.2.1787579742693;
        Mon, 24 Aug 2026 06:55:42 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr196840801cf.2.1787579742115;
        Mon, 24 Aug 2026 06:55:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968665e0sm1141632366b.53.2026.08.24.06.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:55:41 -0700 (PDT)
Message-ID: <93960f67-760b-4667-bf6b-c99b021263c0@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for
 Nord SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
 <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX6A+OtxiANr2w
 0W14kHRgUjyPhnSthWBd5jKFCiVS9IVE5jdpf89ndXlwSgiFyXGUB5l3DYB3Ci2ScisnUvBsNoT
 YYM/vAdUNA8CYmPNRqCg/hmyCTrDXJk=
X-Proofpoint-ORIG-GUID: 9MCyGvWKANV0o_feVB3f8c8jslT8keXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX8W1Jo979eb4G
 0GJZKs95b9DkCxI/CDP8zQabuVoU1KTkojX2FYW18302x+Q+Ry+/z9ZaP/LGOB5kdfhALnsQhiq
 10YsbOD9J19Q4CwwT04be7+P++kx+JpLqct8EX8Zc5ig8dfBadr5+Me6J2xJ/q4kfx9asCzgTyr
 HZH1rcYpy/0zjzDaYY5oK37a74V+FBjFBGIogwXdXQqsxbwizLRAR6QuWEEz+WRpP6NlvcIR5I0
 kserBqxHc/rIxKIJnMv7EoLvYDltkoxMT9YFR9aRpTmAAmTrfL0OoT6rb0gYrCDRoKfGotp4dYv
 vRKsMmKOeCUfUUdXxCoGKp9JH+T3RloI87d8ErxldvhtbrN4KCy9Jsqhk9u5IQ1RTq7bF+wtJpY
 qsyTT+CfsFcIKlk0PBf7qLpgdCeBPasIg2SaSoLsDBzpcNQERdWIdtninASRweYyK/uNsV37VLA
 0dfYMMSao4Ny7oMFcgA==
X-Proofpoint-GUID: 9MCyGvWKANV0o_feVB3f8c8jslT8keXc
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c4d5f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ybGuUY0XYtVVdYjWugUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240116

On 8/24/26 8:53 AM, Taniya Das wrote:
> Add the EMAC0 and EMAC1 CNOC APB clocks to the SE_GCC clock controller
> on the Qualcomm Nord SoC. These branch clocks gate the config NoC APB
> access to the two EMAC controllers and are required for register access
> to the Ethernet MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
