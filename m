Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CC6275870
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100064; cv=none; b=UzwlO2crhJuWJf8XecATCYDGRUKedUyP0N7wep4WdquuBVovI7MfCbSgXfNkE+0io63fFTnFkDnRvmYt/W2ukuzd9IZrSxpMBePOanrzzR9ALzsrrsHfcIM1vaq4xQ+EVg/AQTXl6BBzNoK17WjAoCFpvjXw6fsqE9S/QsAo9XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100064; c=relaxed/simple;
	bh=dICuJUbKjN8yyJmiqAFTChqS0W129mTdI8rEd1NL2mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lq5K7ZtND0n6W92psrNHRqT6EVmF9egDyKR2i7AKE+WdCDdKHUaJWi5EVcGu2z15JZCntBZT/TwjUmyOIDJAXDVPmjLMXPKJdkrL3oonuZgXLF6lRVNZyqa63Epmd0XsD8lp3HPAmvZ99glmEjL8zse+Ojz0TuI9eO5kK6OOf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IW6ZvPuq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpMZ8tCK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IW6ZvPuq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpMZ8tCK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBoOE1072840
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=; b=IW6ZvPuq4JXEPrBg
	6pG9lTkxZ9RqTQeqBEviwT7ywvq7A7q84wRG/glysXFxe6VnvV+9ZXwWU0BwOKQn
	olDaGUPryiynnhNV2OxUtN34GoD7YIAfHqf2I2PBqYT5UAfzobVa8miy4eX/pizW
	goK2L9iRMabLYt271S/WC8kNFOE1sFakSC33PUxdvgI5xcGDawF1JqymCWYmaUBz
	bo1z2V5pQCdvlzFjPErKP3isi8pYhJQUnzWIygez+XRBJvsiFGhc7tA6DSplsain
	RsupaD72z+SnFfgoh7KNZVe+5otLsmPk0jduROq3iY3uoyg3X1KksJml/RV/O9A4
	aIdyVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjfu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:01:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517bdeceb54so8768401cf.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100062; x=1781704862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=;
        b=OpMZ8tCK3z2jwyR0b2RVLI3S848fhnER5WfS+4NqNvBndRs08d4LTzGcDDD6tc4mxQ
         pIlxNm8X23IEb62AjVX6noMOzJvW6Tt6XMnVWaPa5JR8ZcjyQtnU0yGs8CMKqioTeU10
         NL8Cw9Y6vA9jlzysOnWJkaHcYWZkaTi5FgikroUx3/CnnMUgOy88m0Ggm7ftOZKtZGeE
         pyUJ3BEOp6ykDSaAph+ZJpHiHQY4RtdSMmshzaVFyhZz8B8JoEIfYVYyhQvVgP/bQxtW
         iHxFP9geXqt+5e8oDQzu301m69lVHWTCMusM3cQd+9E240MxDZ322CVwBRndH6tpoevO
         rYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100062; x=1781704862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=;
        b=Kzb3dAbe73yp+2Jglr/7W8fdacg67tQ5PEJACUMJ9i6+W3ftWj9crRL6eQJosBwHOx
         sOo6sWs59AIrmThVCAECgr2qvKae5oLpd9owEat1mK4z0DINdozkF0hxyBazh/4zWzL4
         uJ1xymwLZpASZujBWO9gAgh/f44TDOC4Jtx6qTUO6RKJjY98WZAjRWdUT1SspX3HimqT
         t5RDzwSUd/5ToTiNXCHeNtgMr53lGKfs71rCQzfLNjDhjGyxNfciQR2Y5LLCdxdFeaYg
         dw21s4T2raKa4bqhrMbO35yDIHG5YvncDHeelquxz1Tg24KFBHpRGDsjF81EYEuANyL8
         zvag==
X-Forwarded-Encrypted: i=1; AFNElJ8XA4aQ5V1aZVV0b+S8/HKOgP+Wh/JCBlGWdb2289jYPsufHY6nkuqyQhp+fAU6XuBMIJTAV4gnY/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17LRv/w/aCscHT3AoYmra3TWM28lUxa6BaETw0h7o2NlRZQd5
	Ju7W1eAXs4h7TeEhFDrP7q3vt+DDC94SK+whv/BS09hjzS4PMpmSeDi+AgCw/Ru82qixI3kqTj7
	ompmft30AP7Pj25cFk5FtxBNjLkLU5eEUvmZK21Q4h53yRdQ2Une+tMfYfx7u/XE=
X-Gm-Gg: Acq92OGSHgeEvjr3uT9TO4KPkL4zbkKmlx3qTYhWP2spuiLIHEbLxNpUBSDB30n6iMs
	g5kbJV6wnYN2NZcmyz7HBKDxrUSohXXp7rbIqovrronOrldaNegGzPbyh7BiF6sZI7WwrPyS/4x
	dx3lqphHh8bUJLZLY5LY9KSizPZjQnqViUmrwxUbSe+VLHpjvtfYVFYudKi2HLR9u0rT4klAFdD
	vPCtBuEK43X84GDADFuSbKkA7n1dn9JGU1/OSpkCaw4Q/zNlfwXdDxY/wnHIk8gPi+KuNUR5nxK
	prBJ/LA8yeR/3KJClfxd34SL2KvhfgO8Q68un5dAU3UB5tcDx9+bYknFuLRmBnEHf1ajm12h6e/
	fddvWh3JnQ32LEO9R7HR860B6w+ZYG89ayVNVpPbNyaGM0xoBEZ23rGXc
X-Received: by 2002:ac8:5a52:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ca3faecemr76088941cf.3.1781100061398;
        Wed, 10 Jun 2026 07:01:01 -0700 (PDT)
X-Received: by 2002:ac8:5a52:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ca3faecemr76088431cf.3.1781100060792;
        Wed, 10 Jun 2026 07:01:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176e1b5sm1195871966b.8.2026.06.10.07.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:01:00 -0700 (PDT)
Message-ID: <6e46d3c8-984a-4a24-8847-5f5b6bb9d51a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:00:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
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
 <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FECRNwWUZ2wGK-uFL2KC4pzUbOHsHV9Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfXyqoh7J073t9o
 AYGjOnGusyv19ezO+//6lhjYp3FPr653/JGynX8H/WvPVYSJ5E51zblXIAR654K75/Gvwyyd4aY
 1Fxb+BSN4U0bDf1atjBWrZu9pwtQBMt3MExbdNsUtt3U5YjSTG+fV5cJ9G4AhizBXCQjP79lKy5
 d+fjlAPn5mGLC3v3tMOAV+qGCxUGl8H5/+82fMmfMY/h1HHAfzAXa861KyJPT7H9OD5LsPEJlno
 M86J1akyLdnlcRSV/xFS16MuXM3M3Qe6fm0SbUEFhqj8SuIjhpMzRMMRr1QiRTXU60HBjik1Zud
 TbrkPPHp+ztXJ7oncKkYYZMyVRKjDbIf8WjtHAh90VqorrFzQlLFYNYnojo8B6bVP1ZpC1HQReO
 Ntp2mHizsuz+2labSd0fxFfi71nAgOJacAuflV4n1dyf0kr5yh5U+tiKFQq9k/DfBWp4pAcxWCw
 AUV3d+hKpYRO3y47HJw==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a296e1e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FECRNwWUZ2wGK-uFL2KC4pzUbOHsHV9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100134

On 6/4/26 7:26 AM, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Hence add support for Shikra
> GPUCC by extending the QCM2290 GPUCC driver.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
