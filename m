Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDD47CC92
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465993; cv=none; b=T0rse3EMLeCZkqkESkMKZY4HRGY6CleoKnvawBlCsGQBcNoGDzerITeQ2JtvOvj9GGP+Kq8I0iLujB4Gf6h7pu4OSzHwWGzdNVex/LZYin0LlVRDjxTcicUT2pughh0foU3G8wQLg4voibBt3RRxVL91T+aci02ZUturMmjJwvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465993; c=relaxed/simple;
	bh=MFBwAbgMkOFYCA/PTPGkjgXNbqfLFJ8kJ0lsNhxyPYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgvuiEpvK6sOP87vUeP2pKptr//nIXGbi5tcmsGmjiqq8WUxuN81GlfE2z582AliMXfZnw6UzqViTb/Oovhh2k4m+suieGBWK+yn0qO/h3MAHUfrpjUIxB67xOtmLFSvjSHM0RSoK8EPB58kBUE7/8AiL4Y3UAeJ32GHd/Q3Kw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwK7sicc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJmoJkcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwK7sicc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJmoJkcg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h1sk3317338
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=; b=UwK7sicclThnmSvT
	RTYKA8A+wcK8W2jGYdKlq7CKZ/rBLkBB1OA4SBC9MIDv5z0YvZlrag09FqzFdq+W
	JKnhh9bwrlz2ciP2rOmcPYU6dRL9j3rlsuLKCFqrKnegsk1UyrkZnXenLq2f+ndv
	5hbaS2z1zbKExAlyEXdAF1Dgk7n0L8sjpSEK4b/3GVyH+ceKFu0LHH2XlkbRHzIB
	XMK/JkU3w7QPYXtkk2wcBELXVi5TCjPA3NVZIIGybsyNHOBzxKS/OTBhObsk5vOH
	odF69l8AnKiD0BP/UJejlwTamNYcDE9lmHg9gU0sYO49O74ioo5AOASyl4NBsKvJ
	ouA60g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e059a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:53:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so5146011a91.2
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 02:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465988; x=1790070788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=;
        b=MJmoJkcgNtzfRTOj98jS0K7wOyHmEKO0VASG6W1mB3geVSEk/f6+ZjzzyaABo8UPD6
         nplj+sO2aU5D4CH905bvMpHLLNOohwLDYFy/QAjhTr3oHNI5Xs/35hyNZAms63lT2uWl
         w56ehsARn+cvfBg5lgFTKgJU8bVhQLe6lbvxeeb8cLkpE1LfBVcjdAkJ8Ev1D6RkhWbS
         ud6N4niwKyzCR3+q5+5b8nXST1SBt6fufM73mMiJwuT/kJiHqblU8JTRPyV6keuH+GV3
         4p/zWNuGnTaZCI5q8aFn9/revhfbx+ZBXWHPs60NxHLJKa1Vg4Tn9i6WcznYqP1RBxBo
         +6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465988; x=1790070788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=;
        b=sx61CIrsnxDO0oaLxxc/ZquRMx0psUZNEgNnqX3i1ZTT931nN20AwKuFIUYyZRVxdo
         RMbv1h3426/NPN7HC359Uo1pGvReAHAhvH4Ab/3CPfEq0QOXbEq64PazojqKafKb52+z
         nl9bO4oUzvs+uOMkSKnEP1SAekMDbCcAMHqeJ/n7f/xkdbs9yxZp/lN2K+udvxMaU5du
         0qrSQFDb0gpuxEOizvC1gQyGAg11afdobIVo9dHaJKgIn5D9D/+FqEftvksz0S1gu6h+
         EQbkc8V3TjoKNuQMumXkY3gB35X+3aHuAXqTCkonKagoqHPgzf7jp4pXyx4dRg5RpvTh
         Rqtg==
X-Forwarded-Encrypted: i=1; AKwUvBwpSEAo8b6CaSD+SRbJommXE8sZzWNhcxKG9CQwZPscMLCRd+g1mWMGMEuPjhLqqPvCcpjdUPOAMpk=@vger.kernel.org
X-Gm-Message-State: AFuF++kpoyJDNJE9O8mryaN6NL229mug+DLudjDeRrM/VWBsdl73OhiN
	W2607zvDN1F03jna4zijcmmvpt/in6rmN3kE660DN4uoNeCWw3hKfxjr244w9Fby8wCkZX4lK79
	BT7+617Ga+1g+11rhQlLZk+3JX9qChy+n53UL0GGjSWmfHI3vI/cIFYaypmfEGRU=
X-Gm-Gg: AYBFou0j4QLFu2RiNcA7Kx4tKgkOuREi1X/UAzmg7aceac1kyq+ZPUGZ2LCsxfi3CU/
	qJpUNAQLBKM1+2SS1GYPHenUSDJgbo0NISfmgJQhFnbAM9jpb+qn/m1ewDz0bu7mmw4NALWtW7T
	+xKagfvXe9cojh4SZIQn4yldlWf2fIPXvQysz+GAUj9YeuocuNfENHpKUJdSDVzIm7ldh7FI6Xy
	dOtyL5xB2O03QqNybWLy2ql0w8ITsWHy4900uGJflgo6Z+OFesTkHkbJSF9SppGT3P2Jiqtsrg5
	DvHnYKl/5F2i8xn0qTvwjhUbP0PH4cPliCjsXkKedKwLSVvagf4ngBXgpukvWEa673mzfU3sqXU
	GPJwGhNx4M95r5XNZjDW4up8bur/YheFG
X-Received: by 2002:a17:90b:2692:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e10c936camr294274a91.8.1789465988304;
        Tue, 15 Sep 2026 02:53:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e10c936camr294223a91.8.1789465987854;
        Tue, 15 Sep 2026 02:53:07 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1439110be78sm2856174c88.4.2026.09.15.02.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:53:07 -0700 (PDT)
Message-ID: <8314e3f4-aaa1-4eac-9fec-9becda010120@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:23:01 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-2-cdff2c67a8c2@oss.qualcomm.com>
 <he3muoyyhyd4rclkrvy2ut36rzvp4kdusabpvevcrfo7tw3plp@yddqy4afyuym>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <he3muoyyhyd4rclkrvy2ut36rzvp4kdusabpvevcrfo7tw3plp@yddqy4afyuym>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6aDaMqKl0HneUlz5x44NMVMTkNS7h53S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX2a/Pel7hFw/F
 8oIQTgGOuNmzMFlUw1/PqYY3BSbBzVcQIpl8QoWxOGYMuXmZAlZ8OoRws79bvT+R207xWhbNTtw
 GReBivzVkrvNFMQYP3zODYtMwrb+qr0=
X-Proofpoint-ORIG-GUID: 6aDaMqKl0HneUlz5x44NMVMTkNS7h53S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX7j5am0j1Xco3
 EOlFAYNyuIRGiPcfprbP/oH44MJw0TMZZOo7HOl+z5HUHZcQjdTkikLgbHkMhzGROBODtJLcduk
 Lh87qSp5W0eXjL9stl0zuvraCV3zH/TKiPklM91K7YQP/EBkJIJ6gk/463DmA19j5bEsMD4kW6L
 HjAd4lKFmZobbbgFd8KBR7kL2giREURZ1xQUEuUzl63fTCV5kgzvjjraNaqDnD6T5Xnx03zhbZu
 q7J7W8hE2kV3mFG7Yk69CsLqHBi0AtZw3Lu2D2kAWRzgBwwuU5Ed8yk6WZu70BjuQLKmpBPdS1l
 arAbAaq82JYkcgOr2Cm+07VSB6m2PNWMODAuHj+qgKgd6f1lXXOPRfW5HvkjI0dBDSNYcKm0G34
 872cRR3oOkJgd9BKVgbXfy+jJ/jc8ArNcnPe4MSSNWStyHB7vlabGEHbO3Kyo6ogEAgAdpvpgLn
 +sGHSAYo5XlNV8rITcw==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa91585 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r3UcPH_kFabEW9HR8wkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150141



On 9/5/2026 11:22 AM, Abel Vesa wrote:
> On 26-09-05 00:20:43, Jagadeesh Kona wrote:
>> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
>> platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> No fixes tag?

Thanks Abel for your review.

Will add the fixes tag and post next version.

Thanks,
Jagadeesh
