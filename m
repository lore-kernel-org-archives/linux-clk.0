Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23761231A23
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100063; cv=none; b=Q8SBg7z8RsSPmf9P9qHWhO9gEHXW2BBdKbwHK9S0Lvd4orDRp4vd5ltL+vT6C8sw/16ULym7NlRyjaCYMfMGT062O8qJjJtLI+NDIMO+7gWBoyixHKPgnO6RjnDiVN1CwV3Qb38iRplQMgIAO+hxSeQMhflkRHSrC51qkTbR7NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100063; c=relaxed/simple;
	bh=4eiS+kUYjXkA/CvALLB6tTd336SKOSdr1Q4pSJh2b74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKKek96OqlWPw5oRIPOGgLp62ZlDV/jUBL6TUk0ZUYcY93jvrahobmI9tBPPEQtYPz7jmw29ID9KAZiDltJWdCxmc2TOU1aQduQveit9BsoIePgTgSGu57H1LioxaNQIY9Ni/5nQwXXgKmNzvbevov6JP4SO5pTeDY9n0EeqikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnrbPtSu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATeptUcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnrbPtSu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATeptUcN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBn9g1169809
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=; b=UnrbPtSuKMl/ItjR
	Hm1ylDUS9YOsP/YxGefG+vJZlVfmd99/ZUb1UsYt9NMw93lXx5oTeinUYkM3p8qC
	xNSZ0/Tjva+v13f66TwpQAYuzhz4ZwNOJU834H+SSKa3vc3/olyym1YWcGmZFruS
	rsSQbyHfI+1yORGDGnXK1bhH8EJhrP5w6S7P9Cli0kmPP22GsFckAJkH3krglB6J
	3wU+orXqwY1MCeTDaE6CqMikVx8dFNBSz0LdYrYdhcmA2syKS/OlxWsQsUka+hnO
	EbIhnQXbkDmRBL2Yl/hOI82EulH4SP6wDm89/+R/Jdndn+z0JEDP8EdyDPifMsP4
	yMhnsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s444-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:01:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175bf22b2bso12711171cf.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100060; x=1781704860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=;
        b=ATeptUcNgUNECNe04WZY5p+4wXG9Y+22f3fOydCXTzfGfur8cs+8Rd1CKggs9T6Pex
         a14t7Et3/EtsWo4x9wzTjiorNReaTgPX2T7NEDejE4WfI0K1iEQU4zn+Lg267Vyo76y1
         KJEgqvlfigLEzC37w2dPZqjjwj2NyeSIc8qy5rTuqBjaVxypLEBKclXt3JnR1wBeTLs0
         3kouSUkymDHl8Lpyn7TihZaSROrhxNRMCwzRUhRNAgtRZLzqb9npiX9hhk4pPNLz8Mg+
         xLtIaOFBVcJfADQGuTM1Xj/JHHiALZuz//izHFMNMJuPUttgpYVwn9PLgPTu8gHOaioC
         QVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100060; x=1781704860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=;
        b=pkzaJbdUQ7sw963puB4K1Z2DzRbtkHIb2sV/lsbnojjJItE7RXrf98dQDOQJiDVrIF
         yYSJfPQCF14mZrDAOEIv3CFj/jZ3Ue8myWiisxb9ru+SEpSLuZkrLnP0lJIKzR2DOmB3
         jrbL1/dyMW0YOjSUEKeb8yLQdGHB6DfTFZnGIjzOe+zm2dt29YgBbq3DbYBTx64qKEq+
         GY8ntI7DiFyijnAVu2sxblodkY5/K5vUWFq1iTAV3onzf23TuEa8IyqbYZho+FBhGk3U
         CvB9XDWQeSrT5zwsOJWH3CCcDM0UYMV4xMB6/D+BKVEghPS5VTFEqV++nKTTW0RDjNX+
         Uusg==
X-Forwarded-Encrypted: i=1; AFNElJ/RcFePLV8d1l0D6TfrvNIRAHHfnB44Bp12IDx9/BLegJF2HpmHzKxab481/uctfMpofi7OcFPvnP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5OAgkMtycW2hj4pE43wEqvVM8RI1ponEdawOP7SzF7Gii0w/
	DOeT2YiOihgxL8zdhn4LWAIgZsCs/jByGw6cAN4EN7pP0828WagcKMXcDtZPebVnEKYY73oxhT8
	EkjFbP4Nlx/a8msF62xmv8VwEaur/cICECqHdVF9TmUOXfMCEo0JUH4p+lsaxR74=
X-Gm-Gg: Acq92OGdWdi6t30QhkJwWrnEJoOMFT8X8rK9G5fMW+BuFACksBqcFGeSx0PA5fQO7yq
	UOl/f8MBs81zDvUkFFqMBvQWcC/slxPWVLgx1vv+6XfLnmITC4nkxDHwtnjP8Xx7oSh1qkRsNXE
	UR5AA1vnRMF8jnWKYR5ZsSqUjk43JD35yYi9hRBfAb8xzks+JevKPM+vZVx7Nn92cMJrSYu6uI6
	JboXXhuOjB6pLXGNhju9d8Jg1JuMisJ+CYwD3cGj9H1oi0NumDxRw/FeKUMVE8A+ndjnWb2/qCD
	5QW5645WQnJMOnct1+ev8zD/wSSGRCh9Tboa/bcXBCFF+047yVOffsD6rIq8FQLJZT64x9V7OYB
	AWjAjo9LH/HJzBRHTyKTSDbhqJhJSTdXNeL20YctHkh+Q+u6T3bsVtCJE
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr227780721cf.2.1781100050943;
        Wed, 10 Jun 2026 07:00:50 -0700 (PDT)
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr227755911cf.2.1781100037281;
        Wed, 10 Jun 2026 07:00:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm1175978966b.45.2026.06.10.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:00:36 -0700 (PDT)
Message-ID: <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:00:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FLLRCrXZiMKaUC6qLOqv5ZhTRDDxEGDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfX0Z3nI+Id24uP
 iFmrbhwuviPBDWvkocVLZyd0muDXVpvwDrEJC+HWc/akdL4as8+ZwcWhHa3jmUbt/02Mlske4gn
 6Rmfpzlxar6yxrjJ+kUqSM1uEFBHZwkjehT4p9/xtJ8KFS1Ts0TfSKDZOeVMaloVYxlVg/BcjZY
 dnYXiwUHYIX2Z2dVO8o58hLDXitLEr8w2JdPXZrP+ktXzjVBHVR89wkUykOF4q52ifI05V6dQpB
 ZOWX6ND+YMYV3mEFHjWjw6IVnBCgGfMTnD0VbhcasgM5Cmu2iFLYHn7Y3Am8uzq4y0bN1aBoD7B
 DtKb0q0bnfa2xN4DrcfX/yKSSqRhB56MnQJY6lIp6ljuFJi3nVPUr02/XCbmBcGy59oG6YXNj2y
 XAdsJ+MLOw3MwAK32Wi3dbAMwOyCzlLb/FllyZEb48isrzqsOiEAsZymfxGwPH7ymJzJEjmZvfZ
 /z5LFw5Dqt0VE+Yuzvw==
X-Proofpoint-GUID: FLLRCrXZiMKaUC6qLOqv5ZhTRDDxEGDc
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a296e1d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zpiWAdgaf0cvek-7FL0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100134

On 6/4/26 7:26 AM, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

This RCG isn't marked as "safe" downstream, was it overlooked there
too?

In any case, this needs a Fixes tag

Konrad
